const config = {
  moduleFileExtensions: ["mjs", "js", "cjs", "ts"],
  testEnvironment: "node",
  testMatch: [
    "*.mjs",
    "**/tests/**/*.+(ts|js|mjs)",
    "**/?(*.)+(spec|test).+(ts|js|mjs)",
  ],
  // moduleDirectories: ["node_modules", "src", "*"],
};

module.exports = config;
