return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      -- load	lualine
      require('lualine').setup({
        options = {
          globalstatus = false,
        },
        sections = {
          lualine_y = {
            'progress',
            function()
              return string.format('match count: %2d', require('local-highlight').match_count())
            end,
          },
        },
      })
    end,
  },
  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup({
        file_types = { 'python', 'cpp', 'lua' },
      })
    end,
  },
  -- documentation
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup({
        enabled = true,
        languages = {
          lua = {},
          python = {
            template = {
              annotation_convention = 'google_docstrings',
            },
          },
        },
      })
    end,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    cmd = { 'Neogen' },
  },

  -- {
  --   'echasnovski/mini.cursorword',
  --   version = false,
  --   config = function()
  --     require('mini.cursorword').setup()
  --     vim.api.nvim_set_hl(
  --       0,
  --       'MiniCursorword',
  --       { link = 'TSDefinition' }
  --     )
  --     vim.cmd([[hi! MiniCursorwordCurrent gui=NONE guifg=NONE guibg=NONE]])
  --     -- vim.api.nvim_set_hl(
  --     --   0,
  --     --   'MiniCursorwordCurrent',
  --     --   {
  --     --     fg = nil,
  --     --     bg = nil,
  --     --     nocombine = true,
  --     --   }
  --     -- )
  --   end
  -- },
  --
  -- zephyr-nvim dependencies nvim-treesitter
  -- use {'glepnir/zephyr-nvim', branch = 'main', dependencies = 'nvim-treesitter/nvim-treesitter'}
  -- use({ 'folke/tokyonight.nvim' })
  { 'folke/tokyonight.nvim',
  config = function()
  require("tokyonight").setup({
       -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
  vim.o.background = "dark"
  vim.cmd([[colorscheme tokyonight]])
  vim.cmd('set signcolumn=no')
    end,
    build = function()
      require('tokyonight').compile()
    end, },


  -- }
  -- {
  --   'rebelot/kanagawa.nvim',
  --   config = function()
  --     require('kanagawa').setup({
  --       undercurl = true, -- enable undercurls
  --       colors = {
  --         theme = {
  --           all = {
  --             ui = {
  --               bg = 'black',
  --               bg_gutter = 'none',
  --               fg = 'wheat',
  --             },
  --             syn = {
  --               identifier = 'wheat',
  --             },
  --           },
  --         },
  --       },
  --     })
  --     vim.cmd('colorscheme kanagawa')
  --   end,
  --   build = function()
  --     require('kanagawa').compile()
  --   end,
  -- },

  {
    'simnalamburt/vim-mundo',
    cmd = { 'MundoToggle' },
  },
  {
    'mileszs/ack.vim',
    cmd = { 'Ack' },
  },

  -- jump to last place
  { 'farmergreg/vim-lastplace' },

  -- use({ '~/fzf', build = './install --all' })
  -- -- use { 'junegunn/fzf.vim', dependencies = '~/fzf' }
  -- use({ 'ibhagwan/fzf-lua', dependencies = {
  --   'vijaymarupudi/nvim-fzf',
  -- } })
  {
    'vim-scripts/ExtractMatches',
    cmd = {
      'GrepToReg',
      'GrepRangeToReg',
      'YankMatches',
      'YankUniqueMatches',
      'PrintMatches',
      'PrintUniqueMatches',
      'SubstituteAndYank',
      'SubstituteAndYankUnique',
      'PutMatches',
      'PutUniqueMatches',
    },
    dependencies = { 'vim-scripts/ingo-library' },
  },

  -- c cpp stuff
  {
    'vim-scripts/FSwitch',
    ft = { 'c', 'cpp' },
  },
  {
    'vim-scripts/headerguard',
    ft = { 'c', 'cpp' },
  },
  {
    'DeonPoncini/includefixer',
    ft = { 'c', 'cpp' },
  },

  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },
  { 'jamessan/vim-gnupg', ft = { 'gnupg' } },

  { 'lervag/vimtex', ft = { 'tex', 'latex' } },
  { 'sjl/splice.vim', cmd = 'SpliceInit' },

  { 'vimoutliner/vimoutliner', ft = 'otl' },
  { 'vim-scripts/dbext.vim', ft = 'sql', enabled = false },

  -- use 'rking/ag.vim'
  { 'jelera/vim-javascript-syntax', ft = { 'js', 'javascript', 'html', 'html.javascript' } },
  -- use 'machakann/vim-highlightedyank'
  { 'alvan/vim-closetag', ft = { 'html', 'html.javascript' } },
  {
    'wellle/targets.vim',
    event = 'VeryLazy',
  },
  {
    'tommcdo/vim-exchange',
    keys = { 'cx', nil, mode = { 'n', 'v' } },
  },
  -- { "vim-scripts/TextTransform" },

  -- python formatter
  {
    'Vimjas/vim-python-pep8-indent',
    ft = 'python',
    event = 'VeryLazy',
  },
  { 'godlygeek/tabular', cmd = 'Tabularize' },
  {'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function() vim.g.barbar_auto_setup = false end,
    -- opts = {
    --   -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --   -- animation = true,
    --   -- insert_at_start = true,
    --   -- …etc.
    -- },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      -- indend-guides setup
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = false,
      })
    end,
  },

  -- add cmd utils as vim commands
  { 'tpope/vim-eunuch', cmd = {
    'Delete',
    'Unlink',
    'Remove',
    'Move',
    'Rename',
    'Chmod',
    'Mkdir',
    'Cfind',
    'Lfind',
    'Clocate',
    'Llocate',
    'SudoEdit',
    'SudoWrite',
  } },

  {
    'Numkil/ag.nvim',
    cmd = {
      'Ag',
      'AgAdd',
      'LAg',
      'LAgAdd',
    },
  },

  -- show mappings
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup({})
    end,
    event = 'VeryLazy',
  },

  -- syntax ranges
  {
    'vim-scripts/SyntaxRange',
    ft = { 'html.javascript', 'html', 'js', 'javascript' },
  },

  -- align on character
  {
    'tommcdo/vim-lion',
    keys = {
      { 'gl', nil, desc = 'align right on character', mode = { 'n', 'v' } },
      { 'gL', nil, desc = 'align left on character', mode = { 'n', 'v' } },
    },
  },

  {
    'ntpeters/vim-better-whitespace',
  },

  -- git
  { 'tpope/vim-fugitive', lazy = true, cmd = { 'G', 'Git' } },

  -- quickfix magic
  {
    'kevinhwang91/nvim-bqf',
    ft = { 'qf' },
  },

  -- change commentstring based on location in file
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy',
  },

  -- dev icons
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      -- load devicons
      require('nvim-web-devicons').setup({
        default = true,
      })
    end,
  },

  { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } },

  -- for keymappings
  { 'LionC/nest.nvim' },

  -- user defined text objects
  {
    'kana/vim-textobj-user',
    event = 'VeryLazy',
  },
  {
    'Julian/vim-textobj-variable-segment',
    dependencies = { 'kana/vim-textobj-user' },
    event = 'VeryLazy',
  },

  -- trouble
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup({})
    end,
    cmd = { 'TroubleToggle' },
  },

  -- matchit
  {
    'andymass/vim-matchup',
    event = 'VeryLazy',
  },

  -- graphql support
  { 'jparise/vim-graphql', ft = { 'grapgql', 'gql' } },

  -- nvim 0.8 smart rename
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    keys = {
      {
        'gt',
        function()
          return ':IncRename ' .. vim.fn.expand('<cword>')
        end,
        expr = true,
        desc = 'Incremental rename',
      },
    },
    config = function()
      require('inc_rename').setup()
    end,
  },

  -- diagnostic lines
  {
    url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
    event = 'VeryLazy',
  },

  -- swap ts nodes
  {
    'mizlan/iswap.nvim',
    config = function()
      require('iswap').setup()
    end,
    keys = {
      -- swap ts node under cursor
      {
        '<leader>gs',
        function()
          require('iswap').iswap_node_with('right')
        end,
      },
      {
        '<leader>gS',
        function()
          require('iswap').iswap_node_with('left')
        end,
      },
    },
  },

  -- debug prints
  {
    'andrewferrier/debugprint.nvim',
    config = function()
      require('debugprint').setup({
        create_keymaps = false,
      })
    end,
  },

  -- live command preview
  {
    'smjonas/live-command.nvim',
    config = function()
      -- live command setup
      require('live-command').setup({
        commands = {
          Norm = { cmd = 'norm' },
        },
      })
    end,
    event = 'VeryLazy',
  },

  -- inc dec
  {
    'monaqa/dial.nvim',
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group({
        default = {
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.integer.alias.binary,
          augend.constant.alias.bool,
          augend.constant.new({ elements = { 'True', 'False' } }),
        },
      })
    end,
    keys = {
      { '<C-a>', '<Plug>(dial-increment)', noremap = true, mode = 'n' },
      { '<C-x>', '<Plug>(dial-decrement)', noremap = true, mode = 'n' },
      { '+', '<Plug>(dial-increment)', noremap = true, mode = 'n' },
      { '-', '<Plug>(dial-decrement)', noremap = true, mode = 'n' },
      { '<C-a>', '<Plug>(dial-increment)', noremap = true, mode = 'v' },
      { '<C-x>', '<Plug>(dial-decrement)', noremap = true, mode = 'v' },
      -- these are buggy for now!
      -- {'g<C-a>', require("dial.map").inc_gvisual(), options = {noremap = true} },
      -- {'g<C-x>', require("dial.map").dec_gvisual(), options = {noremap = true} },
    },
  },

  -- ts query builder
  {
    'ziontee113/query-secretary',
    keys = {
      {
        '<leader>z',
        function()
          require('query-secretary').query_window_initiate()
        end,
        noremap = true,
        desc = 'query secretary',
      },
    },
  },

  -- ssr
  {
    'cshuaimin/ssr.nvim',
    module = 'ssr',
    -- Calling setup is optional.
    keys = {
      {
        '<leader>sr',
        function()
          require('ssr').open()
        end,
        noremap = true,
        mode = { 'n', 'x' },
      },
    },
    config = function()
      require('ssr').setup({
        min_width = 50,
        min_height = 5,
        keymaps = {
          close = 'q',
          next_match = 'n',
          prev_match = 'N',
          replace_all = '<leader><cr>',
        },
      })
    end,
  },

  -- sqlite lua
  -- { 'kkharji/sqlite.lua', lazy = true },

  {
    'aduros/ai.vim',
    cmd = { 'AI' },
  },
  {
    'jackMort/ChatGPT.nvim',
    config = function()
      require('chatgpt').setup({
        -- optional configuration
      })
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = {
      'ChatGPT',
      'ChatGPTActAs',
      'ChatGPTEditWithInstructions',
    },
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      require('ultimate-autopair').setup({
        --Config goes here
        fastwarp = {
          enable = true,
          map = '<M-]>',
          cmap = '<M-]>',
          rmap = '<M-[>',
          rcmap = '<M-[>',
          fallback = nil,
        },
        extensions = {
          { 'suround', { '"', "'", '{', '}', '[', ']', '(', ')' } },
        },
      })
    end,
  },
}
