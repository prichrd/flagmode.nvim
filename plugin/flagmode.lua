if vim.g.loaded_flagmode == 1 then
  return
end
vim.g.loaded_flagmode = 1

local flagmode = require'flagmode'

vim.api.nvim_create_user_command('FlagToggle', function(opts)
  local flag = opts.args
  flagmode.toggle(flag)
end, {
  nargs = 1,
})

vim.api.nvim_create_user_command('FlagActivate', function(opts)
  local flag = opts.args
  flagmode.activate(flag)
end, {
  nargs = 1,
})

vim.api.nvim_create_user_command('FlagDeactivate', function(opts)
  local flag = opts.args
  flagmode.deactivate(flag)
end, {
  nargs = 1,
})
