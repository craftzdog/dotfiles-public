require('craftzdog.base')
require('craftzdog.highlights')
require('craftzdog.maps')
require('craftzdog.plugins')

local os = vim.loop.os_uname().sysname

if os == "Darwin" then
  require('craftzdog.macos')
elseif os == "Linux" then
  require('craftzdog.linux')
elseif os == "Windows_NT" then
  require('craftzdog.windows')
else
  error("Unknown OS")
end
