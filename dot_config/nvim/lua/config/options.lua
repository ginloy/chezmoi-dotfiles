-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local uv = vim.loop

if uv.os_uname().sysname == "Windows_NT" then
  LazyVim.terminal.setup("pwsh")
  local home = uv.os_getenv("USERPROFILE") or uv.os_getenv("HOMEPATH")
  if home then
    uv.os_setenv("HOME", home)
  end
end
