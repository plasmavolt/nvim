return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
  init = function()
    -- Saved connections shown in the DBUI sidebar.
    -- Local socket connection (same target as the `psql` CLI).
    vim.g.dbs = {
      pricing_dev_local = 'postgresql:///pricing_dev_local',
      ale_temp = 'postgresql:///ale_temp',
    }

    -- Default connection for the bare `:DB` / `:%DB` command (no URL given).
    vim.g.db = 'postgresql:///pricing_dev_local'

    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/db_ui' -- where saved queries live
    vim.g.db_ui_execute_on_save = 0 -- don't auto-run on :w; run explicitly instead

    -- blink.cmp completion for SQL buffers
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'sql', 'mysql', 'plsql' },
      callback = function()
        vim.bo.omnifunc = 'vim_dadbod_completion#omni'
      end,
    })
  end,
  keys = {
    { '<leader>D', '<cmd>DBUIToggle<cr>', desc = 'Toggle DB UI' },
    { '<leader>r', ":'<,'>DB<cr>", mode = 'v', desc = 'Run selected SQL' },
    { '<leader>r', '<cmd>%DB<cr>', mode = 'n', desc = 'Run whole SQL buffer' },
  },
}
