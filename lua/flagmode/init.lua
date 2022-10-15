local M = {};

local notify_fn = vim.notify_once or vim.notify

M._configs = {}
M._flags = {}

-- Registers a new flag and config.
M.register = function(flag, cfg)
  M._configs[flag] = cfg
end

-- Activates a flag by calling the 'activate' function handler.
M.activate = function(flag)
  if M._configs[flag] == nil then
    notify_fn(string.format('flag %s is not configured', flag), vim.log.levels.WARN)
    return
  end

  if M._flags[flag] ~= nil then
    notify_fn(string.format('flag %s is already active', flag), vim.log.levels.WARN)
    return
  end

  M._flags[flag] = true
  M._configs[flag].activate()
end

-- Deactivates a flag by calling the 'deactivate' function handler.
M.deactivate = function(flag)
  if M._configs[flag] == nil then
    notify_fn(string.format('flag %s is not configured', flag), vim.log.levels.WARN)
    return
  end

  if M._flags[flag] == nil then
    notify_fn(string.format('flag %s is not active', flag), vim.log.levels.WARN)
    return
  end

  M._flags[flag] = nil
  M._configs[flag].deactivate()
end

-- Toggles a flag by activating or deactivating it.
M.toggle = function(flag)
  if M._configs[flag] == nil then
    notify_fn(string.format('flag %s is not configured', flag), vim.log.levels.WARN)
    return
  end

  if M._flags[flag] ~= nil then
    M.deactivate(flag)
  else
    M.activate(flag)
  end
end

return M
