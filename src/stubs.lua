-- DO NOT EDIT! Generate by tools/love2d.lua

-- love2d version 11.1

---@class Love
love = {}

--- Gets the current running version of LÖVE.
---
--- returns:
---     number major - The major version of LÖVE, i.e. 0 for version 0.9.1.
---     number minor - The minor version of LÖVE, i.e. 9 for version 0.9.1.
---     number revision - The revision version of LÖVE, i.e. 1 for version 0.9.1.
---     string codename - The codename of the current version, i.e. "Baby Inspector" for version 0.9.1.
---@return number, number, number, string
function love.getVersion() end

--- Sets whether LÖVE displays warnings when using deprecated functionality. It is disabled by default in fused mode, and enabled by default otherwise.
--- 
--- When deprecation output is enabled, the first use of a formally deprecated LÖVE API will show a message at the bottom of the screen for a short time, and print the message to the console.
---
---@param enable boolean Whether to enable or disable deprecation output.
function love.setDeprecationOutput(enable) end

--- Gets whether LÖVE displays warnings when using deprecated functionality. It is disabled by default in fused mode, and enabled by default otherwise.
--- 
--- When deprecation output is enabled, the first use of a formally deprecated LÖVE API will show a message at the bottom of the screen for a short time, and print the message to the console.
---
--- returns:
---     boolean enabled - Whether deprecation output is enabled.
---@return boolean
function love.hasDeprecationOutput() end

