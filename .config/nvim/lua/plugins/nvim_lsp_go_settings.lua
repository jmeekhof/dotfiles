local function file_exists(name)
  local f = io.open(name, "r")
  return f ~= nil and io.close(f)
end
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local drv = "./tools/gopackagesdriver.sh"
    if file_exists(drv) then
      vim.tbl_deep_extend("keep", opts.servers.gopls.settings.gopls, { env = { GOPACKAGESDRIVER = drv } })
    end
  end,
}
