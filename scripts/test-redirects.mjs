import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import { resolve } from "node:path";
import { test } from "node:test";
import { runInNewContext } from "node:vm";

const output = process.env.HUGO_REDIRECT_TEST_DIR;
assert.ok(output, "Set HUGO_REDIRECT_TEST_DIR to a production Hugo build directory");
const root = resolve(output);
const redirects = JSON.parse(readFileSync(new URL("../data/legacy_redirects.json", import.meta.url)));
const origin = "https://www.v01.io";
const pageFile = (path) => resolve(root, `.${path}`, "index.html");
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

test("every legacy path leads directly to a published page", () => {
  const sources = new Set();
  const sitemaps = ["en/sitemap.xml", "de/sitemap.xml"]
    .map((path) => readFileSync(resolve(root, path), "utf8")).join("\n");
  for (const [target, paths] of Object.entries(redirects)) {
    assert.ok(existsSync(pageFile(target)), `Missing target: ${target}`);
    const targetHTML = readPage(target);
    assert.doesNotMatch(targetHTML, /http-equiv=["']?refresh/i, `Redirect chain: ${target}`);
    for (const source of paths) {
      assert.match(source, /^\/(?!\/).+\/$/);
      assert.ok(!source.includes(".."), `Invalid source: ${source}`);
      assert.ok(!sources.has(source), `Duplicate source: ${source}`);
      sources.add(source);
      assert.notEqual(source, target, `Redirect loop: ${source}`);
      const html = readPage(source);
      assert.equal(follow(html), origin + target, source);
      assert.ok(html.includes(`rel="canonical" href="${origin}${target}"`), source);
      assert.match(html, /<noscript>\s*<meta http-equiv="refresh"/);
      assert.ok(html.includes(`content="0; url=${origin}${target}"`), source);
      assert.ok(!sitemaps.includes(`<loc>${origin}${source}</loc>`), source);
    }
  }
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
