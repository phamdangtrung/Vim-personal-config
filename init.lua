---@diagnostic disable: different-requires
require 'core.options'
require('modules.config.packer'):init()
require('modules.config.packer'):load(require 'modules.plugins')
require 'core.keymaps'
require 'modules.lspservers'
