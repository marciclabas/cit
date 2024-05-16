import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const toAbsolute = p => path.resolve(__dirname, p);

const template = fs.readFileSync(toAbsolute("dist/static/index.html"), "utf-8");
const render = (await import("./dist/server/main-server.js")).SSRRender;

(async () => {
  const appHtml = render('/');
  const html = template.replace(`<!--app-html-->`, appHtml);
  const filePath = 'dist/static/index.html'
  fs.writeFileSync(toAbsolute(filePath), html);
})()
