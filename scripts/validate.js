#!/usr/bin/env node
const fs = require("fs");
const path = require("path");
const { spawnSync } = require("child_process");

const root = path.resolve(__dirname, "..");
const failures = [];

function fail(message) {
  failures.push(message);
}

function readJson(relativePath) {
  const absolutePath = path.join(root, relativePath);
  try {
    return JSON.parse(fs.readFileSync(absolutePath, "utf8"));
  } catch (error) {
    fail(`${relativePath}: invalid JSON (${error.message})`);
    return null;
  }
}

function assertObject(value, label) {
  if (!value || typeof value !== "object" || Array.isArray(value)) {
    fail(`${label}: expected object`);
    return false;
  }
  return true;
}

function walk(dir) {
  const out = [];
  for (const name of fs.readdirSync(dir)) {
    const absolutePath = path.join(dir, name);
    const stat = fs.statSync(absolutePath);
    if (stat.isDirectory()) {
      if (name === ".git" || name === "node_modules") continue;
      out.push(...walk(absolutePath));
    } else {
      out.push(absolutePath);
    }
  }
  return out;
}

function validateAgentSpec() {
  const spec = readJson("agents/team-ai.agent-spec.json");
  if (!assertObject(spec, "agents/team-ai.agent-spec.json")) return;

  for (const key of ["schemaVersion", "name", "version", "owners", "config", "includes", "dependencies", "clientConfig"]) {
    if (!(key in spec)) fail(`agents/team-ai.agent-spec.json: missing ${key}`);
  }

  if (!Array.isArray(spec.owners)) fail("agents/team-ai.agent-spec.json: owners must be an array");
  if (!Array.isArray(spec.includes)) fail("agents/team-ai.agent-spec.json: includes must be an array");
  if (!assertObject(spec.dependencies, "agent dependencies")) return;
  if (!assertObject(spec.dependencies.mcpRegistry, "agent dependencies.mcpRegistry")) return;

  for (const [name, server] of Object.entries(spec.dependencies.mcpRegistry)) {
    if (!server.command) fail(`agents/team-ai.agent-spec.json: MCP server ${name} missing command`);
    if (!Array.isArray(server.args)) fail(`agents/team-ai.agent-spec.json: MCP server ${name} args must be an array`);
  }
}

function validatePackageYaml() {
  const text = fs.readFileSync(path.join(root, "package.example.yaml"), "utf8");
  for (const key of [
    "name:",
    "version:",
    "type:",
    "owners:",
    "compatibility:",
    "agent:",
    "context:",
    "skills:",
    "memory:",
    "hooks:",
    "updates:",
    "security:",
    "lifecycle:"
  ]) {
    if (!text.includes(key)) fail(`package.example.yaml: missing ${key}`);
  }
}

function validateMarkdownFrontmatter() {
  for (const absolutePath of walk(root)) {
    if (!absolutePath.endsWith(".md")) continue;
    const relativePath = path.relative(root, absolutePath);
    const text = fs.readFileSync(absolutePath, "utf8");
    if (!text.startsWith("---\n")) {
      fail(`${relativePath}: missing YAML frontmatter`);
      continue;
    }
    const end = text.indexOf("\n---", 4);
    if (end === -1) {
      fail(`${relativePath}: frontmatter is not closed`);
    }
  }
}

function validateSkills() {
  const skillDir = path.join(root, "skills");
  const skillFiles = walk(skillDir).filter((file) => file.endsWith(`${path.sep}SKILL.md`));
  if (skillFiles.length === 0) fail("skills: no SKILL.md files found");

  for (const absolutePath of skillFiles) {
    const relativePath = path.relative(root, absolutePath);
    const text = fs.readFileSync(absolutePath, "utf8");
    for (const key of ["name:", "description:", "memory_tags:"]) {
      if (!text.includes(key)) fail(`${relativePath}: missing ${key}`);
    }
  }
}

function validateShell() {
  const hookFiles = walk(path.join(root, "hooks")).filter((file) => file.endsWith(".sh"));
  for (const file of hookFiles) {
    const result = spawnSync("bash", ["-n", file], { encoding: "utf8" });
    if (result.status !== 0) {
      fail(`${path.relative(root, file)}: bash -n failed\n${result.stderr}`);
    }
  }
}

validateAgentSpec();
validatePackageYaml();
validateMarkdownFrontmatter();
validateSkills();
validateShell();

if (failures.length > 0) {
  console.error("Validation failed:");
  for (const failure of failures) console.error(`- ${failure}`);
  process.exit(1);
}

console.log("validation ok");
