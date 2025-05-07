return {
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    config = function()
      require('kanagawa').setup({
        compile = true,
        theme = 'wave', -- wave, lotus, dragon
        transparent = false,
      })
      vim.cmd('colorscheme kanagawa-wave')
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    enabled = true,
    config = function ()
      require("catppuccin").setup({
      })
      vim.cmd('colorscheme catppuccin')
    end
  },

}
