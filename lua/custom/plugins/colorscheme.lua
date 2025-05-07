return {
  "rebelot/kanagawa.nvim",
  enabled = true,
  config = function()
    require('kanagawa').setup({
      compile = true,
      theme = 'wave', -- wave, lotus, dragon
      transparent = false,
    })
    vim.cmd('colorscheme kanagawa-wave')
  end
}
