// iptv-proxy — caches iptv-org m3u files at the edge
// Serves from Cloudflare cache, falls back to iptv-org GitHub

const IPTV_BASE = "https://iptv-org.github.io/iptv";
const CACHE_TTL = 6 * 60 * 60; // 6 hours

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    const path = url.pathname;

    // Only serve m3u files
    if (!path.endsWith(".m3u")) {
      return new Response("ipTVrchy proxy — /countries/xx.m3u or /categories/xx.m3u", {
        headers: { "content-type": "text/plain" }
      });
    }

    // Build upstream URL
    const upstream = `${IPTV_BASE}${path}`;

    // Try cache first
    const cache = caches.default;
    const cacheKey = new Request(url.toString(), request);
    let response = await cache.match(cacheKey);

    if (response) {
      // Add cache HIT header
      const headers = new Headers(response.headers);
      headers.set("x-cache", "HIT");
      return new Response(response.body, { headers });
    }

    // Cache MISS — fetch from iptv-org
    try {
      const upstreamResp = await fetch(upstream, {
        headers: { "User-Agent": "ipTVrchy-proxy/1.0" }
      });

      if (!upstreamResp.ok) {
        return new Response(`Upstream error: ${upstreamResp.status}`, { status: 502 });
      }

      // Clone and cache
      response = new Response(upstreamResp.body, {
        headers: {
          "content-type": "application/x-mpegurl",
          "cache-control": `public, max-age=${CACHE_TTL}`,
          "access-control-allow-origin": "*",
          "x-cache": "MISS",
        }
      });

      ctx.waitUntil(cache.put(cacheKey, response.clone()));
      return response;
    } catch (e) {
      return new Response(`Fetch failed: ${e.message}`, { status: 502 });
    }
  }
};
