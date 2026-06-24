return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'buffers', -- show open buffers as tabs (VS Code style)
      diagnostics = 'nvim_lsp', -- show LSP errors/warnings on tabs
      show_buffer_close_icons = true,
      show_close_icon = false,
      separator_style = 'thin',
      offsets = {
        { filetype = 'NvimTree', text = 'Explorer', highlight = 'Directory', separator = true },
        { filetype = 'dbui', text = 'Databases', highlight = 'Directory', separator = true },
      },
    },
  },
  keys = {
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Pin buffer' },
    { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Delete buffer' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'Close other buffers' },
    -- jump to buffer by position
    { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Buffer 1' },
    { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Buffer 2' },
    { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Buffer 3' },
    { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Buffer 4' },
  },
}
