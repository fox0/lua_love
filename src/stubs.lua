-- DO NOT EDIT! Generate by tools/love2d.lua

-- love2d version 11.1

---@class love
love = {}

---
--- Gets the current running version of LÖVE.
---
--- returns:
---     number major - The major version of LÖVE, i.e. 0 for version 0.9.1.
---     number minor - The minor version of LÖVE, i.e. 9 for version 0.9.1.
---     number revision - The revision version of LÖVE, i.e. 1 for version 0.9.1.
---     string codename - The codename of the current version, i.e. "Baby Inspector" for version 0.9.1.
---@return number, number, number, string
function love.getVersion() end

---
--- Sets whether LÖVE displays warnings when using deprecated functionality. It is disabled by default in fused mode, and enabled by default otherwise.
--- 
--- When deprecation output is enabled, the first use of a formally deprecated LÖVE API will show a message at the bottom of the screen for a short time, and print the message to the console.
---
---@param enable boolean Whether to enable or disable deprecation output.
function love.setDeprecationOutput(enable) end

---
--- Gets whether LÖVE displays warnings when using deprecated functionality. It is disabled by default in fused mode, and enabled by default otherwise.
--- 
--- When deprecation output is enabled, the first use of a formally deprecated LÖVE API will show a message at the bottom of the screen for a short time, and print the message to the console.
---
--- returns:
---     boolean enabled - Whether deprecation output is enabled.
---@return boolean
function love.hasDeprecationOutput() end

---
--- The superclass of all data.
---@class Data
Data = {}

---
--- Gets a pointer to the Data.
---
--- returns:
---     light userdata pointer - A raw pointer to the Data.
---@return light userdata
function Data.getPointer() end

---
--- Gets the size of the Data.
---
--- returns:
---     number size - The size of the Data in bytes.
---@return number
function Data.getSize() end

---
--- Gets the full Data as a string.
---
--- returns:
---     string data - The raw data.
---@return string
function Data.getString() end

---
--- Superclass for all things that can be drawn on screen. This is an abstract type that can't be created directly.
---@class Drawable
Drawable = {}

---
--- The superclass of all LÖVE types.
---@class Object
Object = {}

---
--- Gets the type of the object as a string.
---
--- returns:
---     string type - The type as a string.
---@return string
function Object.type() end

---
--- Checks whether an object is of a certain type. If the object has the type with the specified name in its hierarchy, this function will return true.
---
---@param name string The name of the type to check for.
--- returns:
---     boolean b - True if the object is of the specified type, false otherwise.
---@return boolean
function Object.typeOf(name) end

---
--- If a file called conf.lua is present in your game folder (or .love file), it is run before the LÖVE modules are loaded. You can use this file to overwrite the love.conf function, which is later called by the LÖVE 'boot' script. Using the love.conf function, you can set some configuration options, and change things like the default size of the window, which modules are loaded, and other stuff.
---
---@param t table The love.conf function takes one argument: a table filled with all the default values which you can overwrite to your liking. If you want to change the default window size, for instance, do:
--- 
--- function love.conf(t)
---     t.window.width = 1024
---     t.window.height = 768
--- end
--- 
--- If you don't need the physics module or joystick module, do the following.
--- 
--- function love.conf(t)
---     t.modules.joystick = false
---     t.modules.physics = false
--- end
--- 
--- Setting unused modules to false is encouraged when you release your game. It reduces startup time slightly (especially if the joystick module is disabled) and reduces memory usage (slightly).
--- 
--- Note that you can't disable love.filesystem; it's mandatory. The same goes for the love module itself. love.graphics needs love.window to be enabled.
function love.conf(t) end

---
--- Callback function triggered when a directory is dragged and dropped onto the window.
---
---@param path string The full platform-dependent path to the directory. It can be used as an argument to love.filesystem.mount, in order to gain read access to the directory with love.filesystem.
function love.directorydropped(path) end

---
--- Callback function used to draw on the screen every frame.
---
function love.draw() end

---
--- The error handler, used to display error messages.
---
---@param msg string The error message.
function love.errorhandler(msg) end

---
--- Callback function triggered when a file is dragged and dropped onto the window.
---
---@param file File The unopened File object representing the file that was dropped.
function love.filedropped(file) end

---
--- Callback function triggered when window receives or loses focus.
---
---@param focus boolean True if the window gains focus, false if it loses focus.
function love.focus(focus) end

---
--- Called when a Joystick's virtual gamepad axis is moved.
---
---@param joystick Joystick The joystick object.
---@param axis GamepadAxis The virtual gamepad axis.
---@param value number The new axis value.
function love.gamepadaxis(joystick, axis, value) end

---
--- Called when a Joystick's virtual gamepad button is pressed.
---
---@param joystick Joystick The joystick object.
---@param button GamepadButton The virtual gamepad button.
function love.gamepadpressed(joystick, button) end

---
--- Called when a Joystick's virtual gamepad button is released.
---
---@param joystick Joystick The joystick object.
---@param button GamepadButton The virtual gamepad button.
function love.gamepadreleased(joystick, button) end

---
--- Called when a Joystick is connected.
--- 
--- This callback is also triggered after love.load for every Joystick which was already connected when the game started up.
---
---@param joystick Joystick The newly connected Joystick object.
function love.joystickadded(joystick) end

---
--- Called when a joystick axis moves.
---
---@param joystick Joystick The joystick object.
---@param axis number The axis number.
---@param value number The new axis value.
function love.joystickaxis(joystick, axis, value) end

---
--- Called when a joystick hat direction changes.
---
---@param joystick Joystick The joystick object.
---@param hat number The hat number.
---@param direction JoystickHat The new hat direction.
function love.joystickhat(joystick, hat, direction) end

---
--- Called when a joystick button is pressed.
---
---@param joystick number The joystick number.
---@param button number The button number.
function love.joystickpressed(joystick, button) end

---
--- Called when a joystick button is released.
---
---@param joystick number The joystick number.
---@param button number The button number.
function love.joystickreleased(joystick, button) end

---
--- Called when a Joystick is disconnected.
---
---@param joystick Joystick The now-disconnected Joystick object.
function love.joystickremoved(joystick) end

---
--- Callback function triggered when a key is pressed.
---
---@param key KeyConstant Character of the pressed key.
---@param scancode Scancode The scancode representing the pressed key.
---@param isrepeat boolean Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings.
function love.keypressed(key, scancode, isrepeat) end

---
--- Callback function triggered when a keyboard key is released.
---
---@param key KeyConstant Character of the released key.
---@param scancode Scancode The scancode representing the released key.
function love.keyreleased(key, scancode) end

---
--- This function is called exactly once at the beginning of the game.
---
---@param arg table Command line arguments given to the game.
function love.load(arg) end

---
--- Callback function triggered when the system is running out of memory on mobile devices.
--- 
---  Mobile operating systems may forcefully kill the game if it uses too much memory, so any non-critical resource should be removed if possible (by setting all variables referencing the resources to nil, and calling collectgarbage()), when this event is triggered. Sounds and images in particular tend to use the most memory.
---
function love.lowmemory() end

---
--- Callback function triggered when window receives or loses mouse focus.
---
---@param focus boolean Whether the window has mouse focus or not.
function love.mousefocus(focus) end

---
--- Callback function triggered when the mouse is moved.
---
---@param x number The mouse position on the x-axis.
---@param y number The mouse position on the y-axis.
---@param dx number The amount moved along the x-axis since the last time love.mousemoved was called.
---@param dy number The amount moved along the y-axis since the last time love.mousemoved was called.
---@param istouch boolean True if the mouse button press originated from a touchscreen touch-press.
function love.mousemoved(x, y, dx, dy, istouch) end

---
--- Callback function triggered when a mouse button is pressed.
---
---@param x number Mouse x position, in pixels.
---@param y number Mouse y position, in pixels.
---@param button number The button index that was pressed. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependent
---@param isTouch boolean True if the mouse button press originated from a touchscreen touch-press.
---@param presses number The number of presses in a short time frame and small area, used to simulate double, triple clicks
function love.mousepressed(x, y, button, isTouch, presses) end

---
--- Callback function triggered when a mouse button is released.
---
---@param x number Mouse x position, in pixels.
---@param y number Mouse y position, in pixels.
---@param button number The button index that was released. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependent.
---@param isTouch boolean True if the mouse button press originated from a touchscreen touch-release.
---@param presses number The number of presses in a short time frame and small area, used to simulate double, triple clicks
function love.mousereleased(x, y, button, isTouch, presses) end

---
--- Callback function triggered when the game is closed.
---
--- returns:
---     boolean r - Abort quitting. If true, do not close the game.
---@return boolean
function love.quit() end

---
--- Called when the window is resized, for example if the user resizes the window, or if love.window.setMode is called with an unsupported width or height in fullscreen and the window chooses the closest appropriate size.
--- 
--- Calls to love.window.setMode will only trigger this event if the width or height of the window after the call doesn't match the requested width and height. This can happen if a fullscreen mode is requested which doesn't match any supported mode, or if the fullscreen type is 'desktop' and the requested width or height don't match the desktop resolution.
---
---@param w number The new width.
---@param h number The new height.
function love.resize(w, h) end

---
--- The main function, containing the main loop. A sensible default is used when left out.
---
function love.run() end

---
--- Called when the candidate text for an IME (Input Method Editor) has changed.
--- 
--- The candidate text is not the final text that the user will eventually choose. Use love.textinput for that.
---
---@param text string The UTF-8 encoded unicode candidate text.
---@param start number The start cursor of the selected candidate text.
---@param length number The length of the selected candidate text. May be 0.
function love.textedited(text, start, length) end

---
--- Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text "@" will be generated.
---
---@param text string The UTF-8 encoded unicode text.
function love.textinput(text) end

---
--- Callback function triggered when a Thread encounters an error.
---
---@param thread Thread The thread which produced the error.
---@param errorstr string The error message.
function love.threaderror(thread, errorstr) end

---
--- Callback function triggered when a touch press moves inside the touch screen.
---
---@param id light userdata The identifier for the touch press.
---@param x number The x-axis position of the touch inside the window, in pixels.
---@param y number The y-axis position of the touch inside the window, in pixels.
---@param dx number The x-axis movement of the touch inside the window, in pixels.
---@param dy number The y-axis movement of the touch inside the window, in pixels.
---@param pressure number The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1.
function love.touchmoved(id, x, y, dx, dy, pressure) end

---
--- Callback function triggered when the touch screen is touched.
---
---@param id light userdata The identifier for the touch press.
---@param x number The x-axis position of the touch press inside the window, in pixels.
---@param y number The y-axis position of the touch press inside the window, in pixels.
---@param dx number The x-axis movement of the touch press inside the window, in pixels. This should always be zero.
---@param dy number The y-axis movement of the touch press inside the window, in pixels. This should always be zero.
---@param pressure number The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1.
function love.touchpressed(id, x, y, dx, dy, pressure) end

---
--- Callback function triggered when the touch screen stops being touched.
---
---@param id light userdata The identifier for the touch press.
---@param x number The x-axis position of the touch inside the window, in pixels.
---@param y number The y-axis position of the touch inside the window, in pixels.
---@param dx number The x-axis movement of the touch inside the window, in pixels.
---@param dy number The y-axis movement of the touch inside the window, in pixels.
---@param pressure number The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1.
function love.touchreleased(id, x, y, dx, dy, pressure) end

---
--- Callback function used to update the state of the game every frame.
---
---@param dt number Time since the last update in seconds.
function love.update(dt) end

---
--- Callback function triggered when window is minimized/hidden or unminimized by the user.
---
---@param visible boolean True if the window is visible, false if it isn't.
function love.visible(visible) end

---
--- Callback function triggered when the mouse wheel is moved.
---
---@param x number Amount of horizontal mouse wheel movement. Positive values indicate movement to the right.
---@param y number Amount of vertical mouse wheel movement. Positive values indicate upward movement.
function love.wheelmoved(x, y) end

