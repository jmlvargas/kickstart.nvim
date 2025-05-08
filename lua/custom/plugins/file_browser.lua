return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    opts = {

    },

    config = function ()
      -- vim.keymap.set("n", "<Leader>fb", ":Telescope file_browser<CR>")
      -- open file_browser with the path of the current buffer
      vim.keymap.set("n", "<Leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Browse [c]urrent file path" })
      vim.keymap.set("n", "<Leader>fp", ":Telescope file_browser<CR>", { desc = "Browse from [P]WD" })
    end

  }
}
