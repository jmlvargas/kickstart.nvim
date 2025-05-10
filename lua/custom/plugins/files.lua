return {
  {
    -- https://github.com/nvim-telescope/telescope-file-browser.nvim
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    opts = {

    },

    config = function()
      -- vim.keymap.set("n", "<Leader>fb", ":Telescope file_browser<CR>")
      -- open file_browser with the path of the current buffer
      vim.keymap.set("n", "<leader>ff",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "Browse Follow Buffer" })

      vim.keymap.set("n", "<leader>f<space>", ":Telescope file_browser<CR>",
        { desc = "Browse CWD" })

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>fs', builtin.find_files, { desc = 'Search files' })

      vim.keymap.set('n', '<leader>fw', '<cmd>write<CR>', { desc ='Write file' })
    end

  }
}
