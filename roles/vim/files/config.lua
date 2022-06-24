--[[
lvim is the global options object

linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- these are example configs feel free to change to whatever you want

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<c-s>"] = ":w<cr>"

-- unmap a default keymapping
-- vim.keymap.del("n", "<c-up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<c-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<c-q>", ":q<cr>" )

-- change telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {

  --   -- for input mode
  --   i = {
  --     ["<c-j>"] = actions.move_selection_next,
  --     ["<c-k>"] = actions.move_selection_previous,
  --     ["<c-n>"] = actions.cycle_history_next,
  --     ["<c-p>"] = actions.cycle_history_prev,
  --   },
  --   -- for normal mode
  --   n = {
  --     ["<c-j>"] = actions.move_selection_next,
  --     ["<c-k>"] = actions.move_selection_previous,
  --   },
}

lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules", "build", "jest-coverage", "cypress-coverage",
  "coverage", ".nyc_output", "dist" }

-- use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["p"] = { "<cmd>telescope projects<cr>", "projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+trouble",
--   r = { "<cmd>trouble lsp_references<cr>", "references" },
--   f = { "<cmd>trouble lsp_definitions<cr>", "definitions" },
--   d = { "<cmd>trouble document_diagnostics<cr>", "diagnostics" },
--   q = { "<cmd>trouble quickfix<cr>", "quickfix" },
--   l = { "<cmd>trouble loclist<cr>", "locationlist" },
--   w = { "<cmd>trouble workspace_diagnostics<cr>", "wordspace diagnostics" },
-- }

-- todo: user config for predefined plugins
-- after changing plugin config exit and reopen lunarvim, run :packerinstall :packercompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic lsp settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!requires `:lvimcachereset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!requires `:lvimcachereset` to take effect!!
-- ---`:lviminfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- see <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/builtins.md#configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. by default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/builtins.md#configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. by default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- additional plugins
lvim.plugins = {
  { "christoomey/vim-tmux-navigator" },
  { "f-person/git-blame.nvim" },
  { "folke/tokyonight.nvim" },
  { 'Mofiqul/dracula.nvim' },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },

  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },

  -- {
  --       "folke/trouble.nvim",
  --       cmd = "troubletoggle",
  --     },
}

-- autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("bufenter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("filetype", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
