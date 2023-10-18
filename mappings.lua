-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- Disabled because of tabline
    ["<leader>b"] = false,
    ["<leader>bb"] = false,
    ["<leader>bd"] = false,
    ["<leader>b\\"] = false,
    ["<leader>b|"] = false,

    ["<M-p>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<M-o>"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
    ["<M-;>"] = {
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      desc = "Find all files",
    },
    ["<M-b>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    ["<M-w>"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["<M-W>"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Find words in all files",
    }
  }
}
