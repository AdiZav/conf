local vim = vim

local ignore_decl_per_source = {
  ['Pyright'] = 'type: ignore',
  ['mypy'] = 'type: ignore',
  ['flake8'] = 'noqa',
  ['pyflakes'] = 'noqa',
  ['pycodestyle'] = 'noqa',
  ['pylsp'] = 'noqa',
  ['Lua Diagnostics.'] = '-@diagnostic disable-line',
  ['Lua Syntax Check.'] = '-@diagnostic disable-line',
}

local function add_ignore_type(options)
  local comment_str = vim.bo.commentstring:gsub('%%s', '')
  if not comment_str then
    return
  end
  for linenr = (options.line1 - 1 or vim.fn.line('.') - 1), (options.line2 - 1 or vim.fn.line('.') - 1) do
    local diag = vim.diagnostic.get(0, { lnum = linenr })
    if #diag > 0 and ignore_decl_per_source[diag[1].source] == nil then
      dump('cannot find ignore type: ', diag[1].source)
    end
    (function()
      for source, ignore_decl in pairs(ignore_decl_per_source) do
        local line = vim.api.nvim_buf_get_lines(0, linenr, linenr + 1, true)[1]
        ignore_decl = '  ' .. comment_str .. ignore_decl
        if string.sub(line, -#ignore_decl, -1) == ignore_decl then
          vim.api.nvim_buf_set_text(0, linenr, #line - #ignore_decl, linenr, #line, {})
          return
        elseif #diag > 0 and diag[1].source == source then
          vim.api.nvim_buf_set_text(0, linenr, #line, linenr, #line, { ignore_decl })
          return
        end
      end
    end)()
  end
end
vim.api.nvim_create_user_command('AddIgnoreType', add_ignore_type, { range = true })

local nest = require('nest')
nest.applyKeymaps({
  { mode = 'n', {
    { '<C-i>', '<cmd>AddIgnoreType<cr>', options = { silent = true } },
    { '<TAB>', '<cmd>AddIgnoreType<cr>', options = { silent = true } },
  } },
  { mode = 'v', {
    { '<C-i>', ':AddIgnoreType<cr>', options = { silent = true } },
    { '<TAB>', ':AddIgnoreType<cr>', options = { silent = true } },
  } },
})

-- mundo
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

require('nest').applyKeymaps({
  {
    mode = 'n',
    {
      {
        'yp',
        function()
          vim.fn.feedkeys('yy')
          vim.fn.feedkeys('yssp')
          vim.fn.feedkeys('p')
        end,
        buffer = true,
        options = { silent = false },
      },
      {
        'yP',
        function()
          vim.fn.feedkeys('yy')
          vim.fn.feedkeys('yssp')
          vim.fn.feedkeys('P')
        end,
        buffer = true,
        options = { silent = false },
      },
    },
  },
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
