function onBufWrite() {
  console.log('Buffer written!');
}

module.exports = (plugin) => {
  function setLine() {
    const line = process.env.NVIM;
    plugin.nvim.setLine(line);
    //plugin.nvim.command('vsp');
  }
  plugin.registerCommand('SetMyLine', [plugin.nvim.buffer, setLine]);
  plugin.registerAutocmd('BufWritePre', onBufWrite, { pattern: '*' });
};
