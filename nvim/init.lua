-- Loader
local fn = vim.fn

local function dofile_if(path)
  if fn.filereadable(path) == 1 then
    local ok, err = pcall(dofile, path)
    if not ok then
      vim.schedule(function()
        vim.notify(("Error loading %s:\n%s"):format(path, err), vim.log.levels.ERROR)
      end)
    end
  end
end

dofile_if(fn.expand("~/.config/superarch/nvim/init.lua"))
dofile_if(fn.expand("~/.config/custom/nvim/init.lua"))
