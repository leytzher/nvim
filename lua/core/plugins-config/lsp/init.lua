local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "core.plugins-config.lsp.lsp-installer"
require("core.plugins-config.lsp.handlers").setup()
require "core.plugins-config.lsp.null-ls"
