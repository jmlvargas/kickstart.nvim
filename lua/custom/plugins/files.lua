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
      vim.keymap.set("n", "<Leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "Browse from [c]urrent file path" })
      vim.keymap.set("n", "<Leader>fw", ":Telescope file_browser<CR>", { desc = "Browse from C[W]D" })

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind file' })

      vim.keymap.set('n', '<leader>fs', '<cmd>write<CR>', { desc = '[S]ave current file' })
    end

  }
}
