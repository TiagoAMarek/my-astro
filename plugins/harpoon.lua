local prefix = "<leader>b"
local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "terminal"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱡀 " or ""
maps.n[prefix] = { desc = icon .. "Harpoon" }
require("astronvim.utils").set_mappings(maps)
return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Harpoon" },
    keys = {
      { "<M-a>", function() require("harpoon.mark").add_file() end, desc = "Add file" },
      { prefix .. "a", function()
        require("harpoon.mark").add_file()
        require("astronvim.utils").notify(("File Harpooned"):format(astronvim.default_colorscheme), vim.log.levels.INFO)
      end, desc = "Add file" },
      { "<M-q>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
      { "<M-,>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
      { "<M-.>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
      { "<M-m>", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { harpoon = true } },
  },
}
