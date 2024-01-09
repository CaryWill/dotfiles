module.exports = (plugin) => {
  function setLine() {
    plugin.nvim.setLine('A line, for your troubles');
  }
  plugin.registerCommand('SetMyLine', [plugin.nvim.buffer, setLine]);
};
