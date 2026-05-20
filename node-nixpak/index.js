const fs = require("node:fs");
const path = require("node:path");
const os = require("node:os");
const { execSync } = require("node:child_process");

function tryList(label, dir) {
  console.log(`\n== ${label}: ${dir} ==`);
  try {
    const entries = fs.readdirSync(dir);
    console.log(entries.join("\n") || "(empty)");
  } catch (err) {
    console.log(`ERROR: ${err.code} ${err.message}`);
  }
}

function tryLs(label, dir) {
  console.log(`\n== ls ${label}: ${dir} ==`);
  try {
    const out = execSync(`ls -la ${dir}`, { encoding: "utf8" });
    process.stdout.write(out);
  } catch (err) {
    console.log(`ERROR: ${err.message.trim()}`);
  }
}

tryList("cwd", process.cwd());
tryList("HOME", os.homedir());
tryList(".ssh", path.join(os.homedir(), ".ssh"));

tryLs("cwd", process.cwd());
tryLs("HOME", os.homedir());
tryLs(".ssh", path.join(os.homedir(), ".ssh"));
