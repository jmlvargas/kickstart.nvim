return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    -- list of formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'ruff',
        'prettier',
        'shfmt',
        'mypy'
      },
      automatic_installation = true,
    }

    local null_ls = require 'null-ls'
    local sources = {
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
      require 'none-ls.formatting.ruff_format',
      null_ls.builtins.formatting.prettier.with { filetypes = { 'json', 'yaml', 'markdown' } },
      null_ls.builtins.formatting.shfmt.with { args = { '-i', '4' } },
      null_ls.builtins.diagnostics.mypy.with({
        extra_args = function()
          local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
          return { "--python-executable", virtual .. "/bin/python3" }
        end,
      })   -- use extra_args instead of args if needed.
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enables debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
