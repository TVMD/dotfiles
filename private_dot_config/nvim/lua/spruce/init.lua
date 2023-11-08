require('spruce.packer')
require('spruce.maps')
require('spruce.sets')
require('spruce.customs')

if vim.fn.has 'macunix' then
  require('spruce.macos')
end

-- Automatically source and re-compile packer whenever you save this init.lua
-- Uncomment this to quickly see the change
-- There is memory leak on this function
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

vim.g.rustfmt_autosave = 1
