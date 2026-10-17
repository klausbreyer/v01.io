import assert from "node:assert/strict";
import { readFileSync, readdirSync, existsSync } from "node:fs";
import { resolve } from "node:path";
import { test } from "node:test";
import { runInNewContext } from "node:vm";

const output = process.env.HUGO_REDIRECT_TEST_DIR;
assert.ok(output, "Set HUGO_REDIRECT_TEST_DIR to a production Hugo build directory");
const root = resolve(output);
const origin = "https://www.v01.io";
const pageFile = (path) => resolve(root, `.${decodeURIComponent(path)}`, "index.html");
const readPage = (path) => readFileSync(pageFile(path), "utf8");

// Execute only the generated redirect script, without browser or network access.
function follow(html, search = "", hash = "") {
  const script = html.match(/<script\b[^>]*>([\s\S]*?)<\/script>/i)?.[1];
  assert.ok(script, "Redirect script is missing");
  let destination;
  runInNewContext(script, {
    URL,
    window: { location: { search, hash, replace: (url) => { destination = url; } } },
  }, { timeout: 1000 });
  return destination;
}

test("generated aliases lead directly to published pages and stay out of sitemaps", () => {
  let aliases = 0;
  const sitemaps = ["en/sitemap.xml", "de/sitemap.xml"]
    .map((path) => readFileSync(resolve(root, path), "utf8")).join("\n");
  for (const file of readdirSync(root, { recursive: true })) {
    if (!file.endsWith("index.html")) continue;
    const html = readFileSync(resolve(root, file), "utf8");
    if (!html.includes("<title>Redirecting</title>")) continue;
    aliases++;
    const source = "/" + file.replace(/index\.html$/, "");
    const target = new URL(follow(html));
    assert.equal(target.origin, origin, source);
    assert.notEqual(source, decodeURIComponent(target.pathname), `Redirect loop: ${source}`);
    assert.ok(existsSync(pageFile(target.pathname)), `Missing target: ${target}`);
    assert.doesNotMatch(readPage(target.pathname), /http-equiv=["']?refresh/i, `Redirect chain: ${source}`);
    assert.match(html, /rel=["']?canonical["']?\s+href=/);
    assert.match(html, /<noscript>\s*<meta http-equiv=["']?refresh/);
    assert.ok(html.includes(`content="0; url=${target.href}"`), source);
    assert.ok(!sitemaps.includes(`<loc>${new URL(source, origin).href}</loc>`), source);
  }
  assert.ok(aliases > 0, "No Hugo aliases were generated");
});

test("query strings and anchors survive both legacy redirects and existing Hugo aliases", () => {
  const examples = [
    ["/consulting/", "/pages/cv/"],
    ["/2014/02/21/den-neuen-whatsapp-share-button-implementieren/", "/de/posts/2014/02/implement-whatsapp-share-button-in-html/"],
    ["/posts/shape-up-staffing-and-process-patterns/", "/posts/2022/12/shape-up-staffing-and-process-patterns/"],
    ["/de/posts/bug-triage/", "/de/posts/2021/12/bug-triage/"],
  ];
  const suffixes = [
    ["", ""],
    ["?utm_source=newsletter&tag=one&tag=two&q=a%2Fb+c&empty=", "#section%20one"],
    ["?next=https%3A%2F%2Fexample.org%2F&value=%26%3D%23", ""],
    ["", "#details"],
  ];
  for (const [source, target] of examples) {
    for (const [search, hash] of suffixes) {
      assert.equal(follow(readPage(source), search, hash), origin + target + search + hash);
    }
  }
});

test("specific categories and similarly named tags have separate destinations", () => {
  assert.equal(follow(readPage("/category/blog/")), origin + "/posts/");
  assert.equal(follow(readPage("/category/blog/organisation/")), origin + "/categories/leadership/");
  assert.equal(follow(readPage("/tag/product/")), origin + "/tags/product/");
  assert.equal(follow(readPage("/tag/product-management/")), origin + "/tags/product-management/");
});
