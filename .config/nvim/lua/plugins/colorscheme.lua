return {

  {
    { "craftzdog/solarized-osaka.nvim" },
    {

      "LazyVim/LazyVim",
      opts = {
        colorscheme = "solarized-osaka",
      },
    },
  },
  --[[
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "storm",
    transparent = true,
    styles = {
      sidebars = "transparent",
      -- floats = "transparent",
    },
  },
  -- ]]

  --[[
  -- add gruvbox
  --{ "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
    },
  },
  --]]

  --[[
return {
  { "maxmx03/solarized.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "solarized",
    },
  },
}
  --]]
}
