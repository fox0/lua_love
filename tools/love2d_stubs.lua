-- DO NOT EDIT! Generate by tools/love2d.lua

-- love2d version 11.1
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
--- Provides an interface to create noise with the user's speakers.
---
local audio = {}
love.audio = audio

---
--- Gets a list of the names of the currently enabled effects.
---
--- returns:
---     table effects - The list of the names of the currently enabled effects.
---@return table
function audio.getActiveEffects() end

---
--- Gets the current number of simultaneously playing sources.
---
--- returns:
---     number count - The current number of simultaneously playing sources.
---@return number
function audio.getActiveSourceCount() end

---
--- Returns the distance attenuation model.
---
--- returns:
---     DistanceModel model - The current distance model. The default is 'inverseclamped'.
---@return DistanceModel
function audio.getDistanceModel() end

---
--- Gets the current global scale factor for velocity-based doppler effects.
---
--- returns:
---     number scale - The current doppler scale factor.
---@return number
function audio.getDopplerScale() end

---
--- Gets the settings associated with an effect.
---
---@param name string The name of the effect.
--- returns:
---     table settings - The settings associated with the effect.
---@return table
function audio.getEffect(name) end

---
--- Gets the maximum number of active Effects, supported by the system.
---
--- returns:
---     number maximum - The maximum number of active Effects.
---@return number
function audio.getMaxSceneEffects() end

---
--- Gets the maximum number of active Effects in a single Source object, that the system can support.
---
--- returns:
---     number maximum - The maximum number of active Effects per Source.
---@return number
function audio.getMaxSourceEffects() end

---
--- Returns the orientation of the listener.
---
--- returns:
---     number fx - The X component of the forward vector of the listener orientation.
---     number fy - The Y component of the forward vector of the listener orientation.
---     number fz - The Z component of the forward vector of the listener orientation.
---     number ux - The X component of the up vector of the listener orientation.
---     number uy - The Y component of the up vector of the listener orientation.
---     number uz - The Z component of the up vector of the listener orientation.
---@return number, number, number, number, number, number
function audio.getOrientation() end

---
--- Returns the position of the listener.
---
--- returns:
---     number x - The X position of the listener.
---     number y - The Y position of the listener.
---     number z - The Z position of the listener.
---@return number, number, number
function audio.getPosition() end

---
--- Gets a list of RecordingDevices on the system. The first device in the list is the user's default recording device.
--- 
--- If no device is available, it will return an empty list.
--- Recording is not supported on iOS
---
--- returns:
---     table devices - The list of RecordingDevices
---@return table
function audio.getRecordingDevices() end

---
--- Returns the number of sources which are currently playing or paused.
---
--- returns:
---     number numSources - The number of sources which are currently playing or paused.
---@return number
function audio.getSourceCount() end

---
--- Returns the velocity of the listener.
---
--- returns:
---     number x - The X velocity of the listener.
---     number y - The Y velocity of the listener.
---     number z - The Z velocity of the listener.
---@return number, number, number
function audio.getVelocity() end

---
--- Returns the master volume.
---
--- returns:
---     number volume - The current master volume.
---@return number
function audio.getVolume() end

---
--- Gets whether Effects are supported in the system.
---
--- returns:
---     boolean supported - True if Effects are supported, false otherwise.
---@return boolean
function audio.isEffectsSupported() end

---
--- Creates a new Source from a filepath, File, Decoder or SoundData. Sources created from SoundData are always static.
---
---@param filename string The filepath to the audio file.
---@param type SourceType Streaming or static source.
--- returns:
---     Source source - A new Source that can play the specified audio.
---@return Source
function audio.newSource(filename, type) end

---@param file File A File pointing to an audio file.
---@param type SourceType Streaming or static source.
--- returns:
---     Source source - A new Source that can play the specified audio.
---@return Source
function audio.newSource(file, type) end

---@param decoder Decoder The Decoder to create a Source from.
--- returns:
---     Source source - A new Source that can play the specified audio.
---@return Source
function audio.newSource(decoder) end

---@param fileData FileData The FileData to create a Source from.
--- returns:
---     Source source - A new Source that can play the specified audio.
---@return Source
function audio.newSource(fileData) end

---@param soundData SoundData The SoundData to create a Source from.
--- returns:
---     Source source - A new Source that can play the specified audio. The SourceType of the returned audio is "static".
---@return Source
function audio.newSource(soundData) end

---
--- Creates a new Source usable for real-time generated sound playback with Source:queue.
---
---@param samplerate number Number of samples per second when playing.
---@param bitdepth number Bits per sample (8 or 16).
---@param channels number 1 for mono, 2 for stereo.
---@param buffercount number The number of buffers that can be queued up at any given time with Source:queue. Cannot be greater than 64. A sensible default (~8) is chosen if no value is specified.
--- returns:
---     Source source - The new Source usable with Source:queue.
---@return Source
function audio.newQueueableSource(samplerate, bitdepth, channels, buffercount) end

---
--- Pauses currently played Sources.
---
function audio.pause() end

---@param source Source The source on which to pause the playback.
function audio.pause(source) end

---
--- Plays the specified Source.
---
---@param source Source The Source to play.
function audio.play(source) end

---
--- Sets the distance attenuation model.
---
---@param model DistanceModel The new distance model.
function audio.setDistanceModel(model) end

---
--- Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.
---
---@param scale number The new doppler scale factor. The scale must be greater than 0.
function audio.setDopplerScale(scale) end

---
--- Defines an effect that can be applied to a Source.
---
---@param name string The name of the effect.
---@param settings table The settings to use for this effect, with the following fields:
--- returns:
---     boolean success - Whether the effect was successfully created.
---@return boolean
function audio.setEffect(name, settings) end

---@param name string The name of the effect.
---@param enabled boolean If false and the given effect name was previously set, disables the effect.
--- returns:
---     boolean success - Whether the Effect was successfully disabled.
---@return boolean
function audio.setEffect(name, enabled) end

---
--- Sets whether the system should mix the audio with the system's audio.
---
---@param mix boolean True to enable mixing, false to disable it.
--- returns:
---     boolean success - True if the change succeeded, false otherwise.
---@return boolean
function audio.setMixWithSystem(mix) end

---
--- Sets the orientation of the listener.
---
---@param fx number The X component of the forward vector of the listener orientation.
---@param fy number The Y component of the forward vector of the listener orientation.
---@param fz number The Z component of the forward vector of the listener orientation.
---@param ux number The X component of the up vector of the listener orientation.
---@param uy number The Y component of the up vector of the listener orientation.
---@param uz number The Z component of the up vector of the listener orientation.
function audio.setOrientation(fx, fy, fz, ux, uy, uz) end

---
--- Sets the position of the listener, which determines how sounds play.
---
---@param x number The X position of the listener.
---@param y number The Y position of the listener.
---@param z number The Z position of the listener.
function audio.setPosition(x, y, z) end

---
--- Sets the velocity of the listener.
---
---@param x number The X velocity of the listener.
---@param y number The Y velocity of the listener.
---@param z number The Z velocity of the listener.
function audio.setVelocity(x, y, z) end

---
--- Sets the master volume.
---
---@param volume number 1.0f is max and 0.0f is off.
function audio.setVolume(volume) end

---
--- Stops currently played sources.
---
function audio.stop() end

---@param source Source The source on which to stop the playback.
function audio.stop(source) end

---
--- A Source represents audio you can play back. You can do interesting things with Sources, like set the volume, pitch, and its position relative to the listener.
---@class Source
Source = {}

---
--- Creates an identical copy of the Source in the stopped state.
--- 
--- Static Sources will use significantly less memory and take much less time to be created if Source:clone is used to create them instead of love.audio.newSource, so this method should be preferred when making multiple Sources which play the same sound.
--- 
--- Cloned Sources inherit all the set-able state of the original Source, but they are initialized stopped.
---
--- returns:
---     Source source - The new identical copy of this Source.
---@return Source
function Source.clone() end

---
--- Returns the reference and maximum distance of the source.
---
--- returns:
---     number ref - The reference distance.
---     number max - The maximum distance.
---@return number, number
function Source.getAttenuationDistances() end

---
--- Gets the number of channels in the Source. Only 1-channel (mono) Sources can use directional and positional effects.
---
--- returns:
---     number channels - 1 for mono, 2 for stereo.
---@return number
function Source.getChannelCount() end

---
--- Gets the Source's directional volume cones. Together with Source:setDirection, the cone angles allow for the Source's volume to vary depending on its direction.
---
--- returns:
---     number innerAngle - The inner angle from the Source's direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.
---     number outerAngle - The outer angle from the Source's direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.
---     number outerVolume - The Source's volume when the listener is outside both the inner and outer cone angles.
---     number outerHighGain - The gain for the high tones when the listener is outside both the inner and outer cone angles. Not supported in iOS.
---@return number, number, number, number
function Source.getCone() end

---
--- Gets the direction of the Source.
---
--- returns:
---     number x - The X part of the direction vector.
---     number y - The Y part of the direction vector.
---     number z - The Z part of the direction vector.
---@return number, number, number
function Source.getDirection() end

---
--- Gets the duration of the Source. For streaming Sources it may not always be sample-accurate, and may return -1 if the duration cannot be determined at all.
---
---@param unit TimeUnit The time unit for the return value.
--- returns:
---     number duration - The duration of the Source, or -1 if it cannot be determined.
---@return number
function Source.getDuration(unit) end

---
--- Gets the filter settings associated to a specific Effect.
--- 
--- This function returns nil if the Effect was applied with no filter settings associated to it.
---
---@param name string The name of the effect.
---@param filtersettings table An optional empty table that will be filled with the filter settings.
--- returns:
---     table filtersettings -  The settings for the filter associated to this effect, or nil if the effect is not present in this Source or has no filter associated. The table has the following fields:
---@return table
function Source.getEffect(name, filtersettings) end

---
--- Returns a list of all the active effects currently applied to the Source
---
--- returns:
---     table effects - The list with all the names for the currently applied effects
---@return table
function Source.getActiveEffects() end

---
--- Gets the filter settings currently applied to the Source.
---
---@param settings table An optional empty table that will be filled with the filter settings.
--- returns:
---     table settings - The settings for the active filter on this Source, or nil if the Source has no active filter. The table has the following fields:
---@return table
function Source.getFilter(settings) end

---
--- Gets the number of free buffer slots of a queueable Source.
---
--- returns:
---     number buffers - How many more SoundData objects can be queued up.
---@return number
function Source.getFreeBufferCount() end

---
--- Gets the current pitch of the Source.
---
--- returns:
---     number pitch - The pitch, where 1.0 is normal.
---@return number
function Source.getPitch() end

---
--- Gets the position of the Source.
---
--- returns:
---     number x - The X position of the Source.
---     number y - The Y position of the Source.
---     number z - The Z position of the Source.
---@return number, number, number
function Source.getPosition() end

---
--- Returns the rolloff factor of the source.
---
--- returns:
---     number rolloff - The rolloff factor.
---@return number
function Source.getRolloff() end

---
--- Gets the type (static or stream) of the Source.
---
--- returns:
---     SourceType sourcetype - The type of the source.
---@return SourceType
function Source.getType() end

---
--- Gets the velocity of the Source.
---
--- returns:
---     number x - The X part of the velocity vector.
---     number y - The Y part of the velocity vector.
---     number z - The Z part of the velocity vector.
---@return number, number, number
function Source.getVelocity() end

---
--- Gets the current volume of the Source.
---
--- returns:
---     number volume - The volume of the Source, where 1.0 is normal volume.
---@return number
function Source.getVolume() end

---
--- Returns the volume limits of the source.
---
--- returns:
---     number min - The minimum volume.
---     number max - The maximum volume.
---@return number, number
function Source.getVolumeLimits() end

---
--- Returns whether the Source will loop.
---
--- returns:
---     boolean loop - True if the Source will loop, false otherwise.
---@return boolean
function Source.isLooping() end

---
--- Returns whether the Source is playing.
---
--- returns:
---     boolean playing - True if the Source is playing, false otherwise.
---@return boolean
function Source.isPlaying() end

---
--- Gets whether the Source's position and direction are relative to the listener.
---
--- returns:
---     boolean relative - True if the position, velocity, direction and cone angles are relative to the listener, false if they're absolute.
---@return boolean
function Source.isRelative() end

---
--- Pauses the Source.
---
function Source.pause() end

---
--- Starts playing the Source.
---
--- returns:
---     boolean success - True if the Source started playing successfully, false otherwise.
---@return boolean
function Source.play() end

---
--- Queues SoundData for playback in a queueable Source.
--- 
--- This method requires the Source to be created via love.audio.newQueueableSource.
---
---@param sounddata SoundData The data to queue. The SoundData's sample rate, bit depth, and channel count must match the Source's.
--- returns:
---     boolean success - True if the data was successfully queued for playback, false if there were no available buffers to use for queueing.
---@return boolean
function Source.queue(sounddata) end

---
--- Sets the playing position of the Source.
---
---@param position number The position to seek to.
---@param unit TimeUnit The unit of the position value.
function Source.seek(position, unit) end

---
--- Sets the reference and maximum distance of the source.
---
---@param ref number The new reference distance.
---@param max number The new maximum distance.
function Source.setAttenuationDistances(ref, max) end

---
--- Sets the Source's directional volume cones. Together with Source:setDirection, the cone angles allow for the Source's volume to vary depending on its direction.
---
---@param innerAngle number The inner angle from the Source's direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.
---@param outerAngle number The outer angle from the Source's direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.
---@param outerVolume number The Source's volume when the listener is outside both the inner and outer cone angles.
---@param outerHighGain number The gain for the high tones when the listener is outside both the inner and outer cone angles.
function Source.setCone(innerAngle, outerAngle, outerVolume, outerHighGain) end

---
--- Sets the direction vector of the Source. A zero vector makes the source non-directional.
---
---@param x number The X part of the direction vector.
---@param y number The Y part of the direction vector.
---@param z number The Z part of the direction vector.
function Source.setDirection(x, y, z) end

---
--- Applies an audio effect to the Source.
--- 
--- The effect must have been previously defined using love.audio.setEffect.
---
---@param name string The name of the effect previously set up with love.audio.setEffect.
---@param enable boolean If false and the given effect name was previously enabled on this Source, disables the effect.
--- returns:
---     boolean success - Whether the effect and filter were successfully applied to this Source.
---@return boolean
function Source.setEffect(name, enable) end

---@param name string The name of the effect previously set up with love.audio.setEffect.
---@param filtersettings table The filter settings to apply prior to, with the following fields:
--- returns:
---     boolean success - Whether the effect and filter were successfully applied to this Source.
---@return boolean
function Source.setEffect(name, filtersettings) end

---
--- Sets a low-pass, high-pass, or band-pass filter to apply when playing the Source.
---
---@param settings table The filter settings to use for this Source, with the following fields:
--- returns:
---     boolean success - Whether the filter was successfully applied to the Source.
---@return boolean
function Source.setFilter(settings) end

---
--- Sets whether the Source should loop.
---
---@param loop boolean True if the source should loop, false otherwise.
function Source.setLooping(loop) end

---
--- Sets the pitch of the Source.
---
---@param pitch number Calculated with regard to 1 being the base pitch. Each reduction by 50 percent equals a pitch shift of -12 semitones (one octave reduction). Each doubling equals a pitch shift of 12 semitones (one octave increase). Zero is not a legal value.
function Source.setPitch(pitch) end

---
--- Sets the position of the Source.
---
---@param x number The X position of the Source.
---@param y number The Y position of the Source.
---@param z number The Z position of the Source.
function Source.setPosition(x, y, z) end

---
--- Sets whether the Source's position and direction are relative to the listener. Relative Sources move with the listener so they aren't affected by it's position
---
---@param enable boolean True to make the position, velocity, direction and cone angles relative to the listener, false to make them absolute.
function Source.setRelative(enable) end

---
--- Sets the rolloff factor which affects the strength of the used distance attenuation.
--- 
--- Extended information and detailed formulas can be found in the chapter "3.4. Attenuation By Distance" of OpenAL 1.1 specification.
---
---@param rolloff number The new rolloff factor.
function Source.setRolloff(rolloff) end

---
--- Sets the velocity of the Source.
--- 
--- This does not change the position of the Source, but is used to calculate the doppler effect.
---
---@param x number The X part of the velocity vector.
---@param y number The Y part of the velocity vector.
---@param z number The Z part of the velocity vector.
function Source.setVelocity(x, y, z) end

---
--- Sets the volume of the Source.
---
---@param volume number The volume of the Source, where 1.0 is normal volume.
function Source.setVolume(volume) end

---
--- Sets the volume limits of the source. The limits have to be numbers from 0 to 1.
---
---@param min number The minimum volume.
---@param max number The maximum volume.
function Source.setVolumeLimits(min, max) end

---
--- Stops a Source.
---
function Source.stop() end

---
--- Gets the currently playing position of the Source.
---
---@param unit TimeUnit The type of unit for the return value.
--- returns:
---     number position - The currently playing position of the Source.
---@return number
function Source.tell(unit) end

---
--- Represents an audio input device capable of recording sounds.
---@class RecordingDevice
RecordingDevice = {}

---
--- Gets the number of bits per sample in the data currently being recorded.
---
--- returns:
---     number bitdepth - The number of bits per sample in the data that's currently being recorded. (8 or 16).
---@return number
function RecordingDevice.getBitDepth() end

---
--- Gets the number of channels currently being recorded (mono or stereo).
---
--- returns:
---     number channels - The number of channels being recorded (1 for mono, 2 for stereo).
---@return number
function RecordingDevice.getChannelCount() end

---
--- Gets all recorded audio SoundData stored in the device's internal ring buffer.
---
--- returns:
---     SoundData data - The recorded audio data, or nil if the device isn't recording.
---@return SoundData
function RecordingDevice.getData() end

---
--- Gets the name of the recording device.
---
--- returns:
---     string name - The name for this device.
---@return string
function RecordingDevice.getName() end

---
--- Gets the number of currently recorded samples.
---
--- returns:
---     number samples - The number of samples that have been recorded so far.
---@return number
function RecordingDevice.getSampleCount() end

---
--- Gets the number of samples per second currently being recorded.
---
--- returns:
---     number rate - The number of samples being recorded per second (sample rate).
---@return number
function RecordingDevice.getSampleRate() end

---
--- Gets whether the device is currently recording.
---
--- returns:
---     boolean recording - True if the device is recording, false otherwise.
---@return boolean
function RecordingDevice.isRecording() end

---
--- Begins recording audio using this device.
---
---@param samplecount number The maximum number of samples to store in an internal ring buffer when recording. RecordingDevice:getData clears the internal buffer when called.
---@param samplerate number The number of samples per second to store when recording.
---@param bitdepth number The number of bits per sample.
---@param channels number Whether to record in mono or stereo. Most microphones don't support more than 1 channel.
--- returns:
---     boolean success - True if the device successfully began recording using the specified parameters, false if not.
---@return boolean
function RecordingDevice.start(samplecount, samplerate, bitdepth, channels) end

---
--- Stops recording audio from this device.
---
--- returns:
---     SoundData data - The sound data currently in the device's buffer, or nil if the device wasn't recording.
---@return SoundData
function RecordingDevice.stop() end

---
--- Provides functionality for creating and transforming data.
---
local data = {}
love.data = data

---
--- Compresses a string or data using a specific compression algorithm.
---
---@param container ContainerType What type to return the compressed data as.
---@param format CompressedDataFormat The format to use when compressing the string.
---@param rawstring string The raw (un-compressed) string to compress.
---@param level number The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.
--- returns:
---     CompressedData or string compressedData - CompressedData/string which contains the compressed version of data.
---@return CompressedData or string
function data.compress(container, format, rawstring, level) end

---@param container ContainerType What type to return the compressed data as.
---@param format CompressedDataFormat The format to use when compressing the data.
---@param data Data A Data object containing the raw (un-compressed) data to compress.
---@param level number The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.
--- returns:
---     CompressedData or string compressedData - CompressedData/string which contains the compressed version of data.
---@return CompressedData or string
function data.compress(container, format, data, level) end

---
--- Decode Data or a string from any of the EncodeFormats to Data or string.
---
---@param containerType ContainerType What type to return the decoded data as.
---@param format EncodeFormat The format of the input data.
---@param sourceString string The raw (encoded) data to decode.
--- returns:
---     Variant decoded - ByteData/string which contains the decoded version of source.
---@return Variant
function data.decode(containerType, format, sourceString) end

---@param containerType ContainerType What type to return the decoded data as.
---@param format EncodeFormat The format of the input data.
---@param sourceData Data The raw (encoded) data to decode.
--- returns:
---     Variant decoded - ByteData/string which contains the decoded version of source.
---@return Variant
function data.decode(containerType, format, sourceData) end

---
--- Decompresses a CompressedData or previously compressed string or Data object.
---
---@param container ContainerType What type to return the decompressed data as.
---@param compressedData CompressedData The compressed data to decompress.
--- returns:
---     string rawstring - A string containing the raw decompressed data.
---@return string
function data.decompress(container, compressedData) end

---@param container ContainerType What type to return the decompressed data as.
---@param format CompressedDataFormat The format that was used to compress the given string.
---@param compressedstring string A string containing data previously compressed with love.data.compress.
--- returns:
---     string rawstring - A string containing the raw decompressed data.
---@return string
function data.decompress(container, format, compressedstring) end

---@param container ContainerType What type to return the decompressed data as.
---@param format CompressedDataFormat The format that was used to compress the given data.
---@param data Data A Data object containing data previously compressed with love.data.compress.
--- returns:
---     string rawstring - A string containing the raw decompressed data.
---@return string
function data.decompress(container, format, data) end

---
--- Encode Data or a string to a Data or string in one of the EncodeFormats.
---
---@param containerType ContainerType What type to return the encoded data as.
---@param format EncodeFormat The format of the output data.
---@param sourceString string The raw data to encode.
---@param lineLength number The maximum line length of the output. Only supported for base64, ignored if 0.
--- returns:
---     Variant encoded - ByteData/string which contains the encoded version of source.
---@return Variant
function data.encode(containerType, format, sourceString, lineLength) end

---@param containerType ContainerType What type to return the encoded data as.
---@param format EncodeFormat The format of the output data.
---@param sourceData Data The raw data to encode.
---@param lineLength number The maximum line length of the output. Only supported for base64, ignored if 0.
--- returns:
---     Variant encoded - ByteData/string which contains the encoded version of source.
---@return Variant
function data.encode(containerType, format, sourceData, lineLength) end

---
--- Compute the message digest of a string using a specified hash algorithm.
---
---@param hashFunction HashFunction Hash algorithm to use.
---@param string string String to hash.
--- returns:
---     string rawdigest - Raw message digest string.
---@return string
function data.hash(hashFunction, string) end

---@param hashFunction HashFunction Hash algorithm to use.
---@param data Data Data to hash.
--- returns:
---     string rawdigest - Raw message digest string.
---@return string
function data.hash(hashFunction, data) end

---
--- Manages events, like keypresses.
---
local event = {}
love.event = event

---
--- Clears the event queue.
---
function event.clear() end

---
--- Returns an iterator for messages in the event queue.
---
--- returns:
---     function i - Iterator function usable in a for loop.
---@return function
function event.poll() end

---
--- Pump events into the event queue. This is a low-level function, and is usually not called by the user, but by love.run. Note that this does need to be called for any OS to think you're still running, and if you want to handle OS-generated events at all (think callbacks). love.event.pump can only be called from the main thread, but afterwards, the rest of love.event can be used from any other thread.
---
function event.pump() end

---
--- Adds an event to the event queue.
---
---@param e Event The name of the event.
---@param a Variant First event argument.
---@param b Variant Second event argument.
---@param c Variant Third event argument.
---@param d Variant Fourth event argument.
function event.push(e, a, b, c, d) end

---
--- Adds the quit event to the queue.
--- 
--- The quit event is a signal for the event handler to close LÖVE. It's possible to abort the exit process with the love.quit callback.
---
function event.quit() end

---@param exitstatus number The program exit status to use when closing the application.
function event.quit(exitstatus) end

-- "restart" string Restarts the game without relaunching the executable. This cleanly shuts down the main Lua state instance and creates a brand new one.
function event.quit() end

---
--- Like love.event.poll but blocks until there is an event in the queue.
---
--- returns:
---     Event e - The type of event.
---     Variant a - First event argument.
---     Variant b - Second event argument.
---     Variant c - Third event argument.
---     Variant d - Fourth event argument.
---@return Event, Variant, Variant, Variant, Variant
function event.wait() end

---
--- Provides an interface to the user's filesystem.
---
local filesystem = {}
love.filesystem = filesystem

---
--- Append data to an existing file.
---
---@param name string The name (and path) of the file.
---@param data string The data that should be written to the file
---@param size number How many bytes to write.
--- returns:
---     boolean success - True if the operation was successful, or nil if there was an error.
---     string errormsg - The error message on failure.
---@return boolean, string
function filesystem.append(name, data, size) end

---
--- Gets whether love.filesystem follows symbolic links.
---
--- returns:
---     boolean enable - Whether love.filesystem follows symbolic links.
---@return boolean
function filesystem.areSymlinksEnabled() end

---
--- Creates a directory.
---
---@param name string The directory to create.
--- returns:
---     boolean success - True if the directory was created, false if not.
---@return boolean
function filesystem.createDirectory(name) end

---
--- Returns the application data directory (could be the same as getUserDirectory)
---
--- returns:
---     string path - The path of the application data directory.
---@return string
function filesystem.getAppdataDirectory() end

---
--- Gets the filesystem paths that will be searched for c libraries when require is called.
--- 
--- The paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.) Additionally, any occurrence of a double question mark ("??") will be replaced by the name passed to require and the default library extension for the platform.
--- 
--- The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.
---
--- returns:
---     string paths - The paths that the require function will check for c libraries in love's filesystem.
---@return string
function filesystem.getCRequirePath() end

---
--- Returns a table with the names of files and subdirectories in the specified path. The table is not sorted in any way; the order is undefined.
--- 
--- If the path passed to the function exists in the game and the save directory, it will list the files and directories from both places.
---
---@param dir string The directory.
--- returns:
---     table items - A sequence with the names of all files and subdirectories as strings.
---@return table
function filesystem.getDirectoryItems(dir) end

---
--- Gets the write directory name for your game. Note that this only returns the name of the folder to store your files in, not the full location.
---
---@param name string The identity that is used as write directory.
function filesystem.getIdentity(name) end

---
--- Gets information about the specified file or directory.
---
---@param path string The file or directory path to check.
--- returns:
---     table info - A table containing information about the specified path, or nil if nothing exists at the path. The table contains the following fields:
---@return table
function filesystem.getInfo(path) end

---@param path string The file or directory path to check.
---@param info table A table which will be filled in with info about the specified path.
--- returns:
---     table info - A table containing information about the specified path, or nil if nothing exists at the path. The table contains the following fields:
---@return table
function filesystem.getInfo(path, info) end

---
--- Gets the platform-specific absolute path of the directory containing a filepath.
--- 
--- This can be used to determine whether a file is inside the save directory or the game's source .love.
---
---@param filepath string The filepath to get the directory of.
--- returns:
---     string realdir - The platform-specific full path of the directory containing the filepath.
---@return string
function filesystem.getRealDirectory(filepath) end

---
--- Gets the filesystem paths that will be searched when require is called.
--- 
--- The paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.)
--- 
--- The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.
---
--- returns:
---     string paths - The paths that the require function will check in love's filesystem.
---@return string
function filesystem.getRequirePath() end

---
--- Gets the full path to the designated save directory. This can be useful if you want to use the standard io library (or something else) to read or write in the save directory.
---
--- returns:
---     string path - The absolute path to the save directory.
---@return string
function filesystem.getSaveDirectory() end

---
--- Returns the full path to the the .love file or directory. If the game is fused to the LÖVE executable, then the executable is returned.
---
--- returns:
---     string path - The full platform-dependent path of the .love file or directory.
---@return string
function filesystem.getSource() end

---
--- Returns the full path to the directory containing the .love file. If the game is fused to the LÖVE executable, then the directory containing the executable is returned.
--- 
--- If love.filesystem.isFused is true, the path returned by this function can be passed to love.filesystem.mount, which will make the directory containing the main game readable by love.filesystem.
---
--- returns:
---     string path - The full platform-dependent path of the directory containing the .love file.
---@return string
function filesystem.getSourceBaseDirectory() end

---
--- Returns the path of the user's directory.
---
--- returns:
---     string path - The path of the user's directory.
---@return string
function filesystem.getUserDirectory() end

---
--- Gets the current working directory.
---
--- returns:
---     string path - The current working directory.
---@return string
function filesystem.getWorkingDirectory() end

---
--- Initializes love.filesystem, will be called internally, so should not be used explicitly.
---
---@param appname string The name of the application binary, typically love.
function filesystem.init(appname) end

---
--- Gets whether the game is in fused mode or not.
--- 
--- If a game is in fused mode, its save directory will be directly in the Appdata directory instead of Appdata/LOVE/. The game will also be able to load C Lua dynamic libraries which are located in the save directory.
--- 
--- A game is in fused mode if the source .love has been fused to the executable (see Game Distribution), or if "--fused" has been given as a command-line argument when starting the game.
---
--- returns:
---     boolean fused - True if the game is in fused mode, false otherwise.
---@return boolean
function filesystem.isFused() end

---
--- Iterate over the lines in a file.
---
---@param name string The name (and path) of the file.
--- returns:
---     function iterator - A function that iterates over all the lines in the file.
---@return function
function filesystem.lines(name) end

---
--- Loads a Lua file (but does not run it).
---
---@param name string The name (and path) of the file.
---@param errormsg string The error message if file could not be opened.
--- returns:
---     function chunk - The loaded chunk.
---@return function
function filesystem.load(name, errormsg) end

---
--- Mounts a zip file or folder in the game's save directory for reading.
---
---@param archive string The folder or zip file in the game's save directory to mount.
---@param mountpoint string The new path the archive will be mounted to.
--- returns:
---     boolean success - True if the archive was successfully mounted, false otherwise.
---@return boolean
function filesystem.mount(archive, mountpoint) end

---@param archive string The folder or zip file in the game's save directory to mount.
---@param mountpoint string The new path the archive will be mounted to.
---@param appendToPath string Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game's source and save directories.
--- returns:
---     boolean success - True if the archive was successfully mounted, false otherwise.
---@return boolean
function filesystem.mount(archive, mountpoint, appendToPath) end

---
--- Creates a new File object. It needs to be opened before it can be accessed.
---
---@param filename string The filename of the file to read.
---@param mode FileMode The mode to open the file in.
--- returns:
---     File file - The new File object, or nil if an error occurred.
---     string errorstr - The error string if an error occurred.
---@return File, string
function filesystem.newFile(filename, mode) end

---
--- Creates a new FileData object.
---
---@param contents string The contents of the file.
---@param name string The name of the file.
--- returns:
---     FileData data - Your new FileData.
---@return FileData
function filesystem.newFileData(contents, name) end

---@param filepath string Path to the file.
--- returns:
---     FileData data - The new FileData, or nil if an error occurred.
---     string err - The error string, if an error occurred.
---@return FileData, string
function filesystem.newFileData(filepath) end

---
--- Read the contents of a file.
---
---@param name string The name (and path) of the file.
---@param bytes number How many bytes to read.
--- returns:
---     string contents - The file contents.
---     number size - How many bytes have been read.
---@return string, number
function filesystem.read(name, bytes) end

---
--- Removes a file or directory.
---
---@param name string The file or directory to remove.
--- returns:
---     boolean success - True if the file/directory was removed, false otherwise.
---@return boolean
function filesystem.remove(name) end

---
--- Sets the filesystem paths that will be searched for c libraries when require is called.
--- 
--- The paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.) Additionally, any occurrence of a double question mark ("??") will be replaced by the name passed to require and the default library extension for the platform.
--- 
--- The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.
---
---@param paths string The paths that the require function will check in love's filesystem.
function filesystem.setCRequirePath(paths) end

---
--- Sets the write directory for your game. Note that you can only set the name of the folder to store your files in, not the location.
---
---@param name string The new identity that will be used as write directory.
---@param appendToPath boolean Whether the identity directory will be searched when reading a filepath before or after the game's source directory and any currently mounted archives.
function filesystem.setIdentity(name, appendToPath) end

---
--- Sets the filesystem paths that will be searched when require is called.
--- 
--- The paths string given to this function is a sequence of path templates separated by semicolons. The argument passed to require will be inserted in place of any question mark ("?") character in each template (after the dot characters in the argument passed to require are replaced by directory separators.)
--- 
--- The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.
---
---@param paths string The paths that the require function will check in love's filesystem.
function filesystem.setRequirePath(paths) end

---
--- Sets the source of the game, where the code is present. This function can only be called once, and is normally automatically done by LÖVE.
---
---@param path string Absolute path to the game's source folder.
function filesystem.setSource(path) end

---
--- Sets whether love.filesystem follows symbolic links. It is enabled by default in version 0.10.0 and newer, and disabled by default in 0.9.2.
---
---@param enable boolean Whether love.filesystem should follow symbolic links.
function filesystem.setSymlinksEnabled(enable) end

---
--- Unmounts a zip file or folder previously mounted for reading with love.filesystem.mount.
---
---@param archive string The folder or zip file in the game's save directory which is currently mounted.
--- returns:
---     boolean success - True if the archive was successfully unmounted, false otherwise.
---@return boolean
function filesystem.unmount(archive) end

---
--- Write data to a file.
--- 
--- If you are getting the error message "Could not set write directory", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.
---
---@param name string The name (and path) of the file.
---@param data string The string data to write to the file.
---@param size number How many bytes to write.
--- returns:
---     boolean success - If the operation was successful.
---     string message - Error message if operation was unsuccessful.
---@return boolean, string
function filesystem.write(name, data, size) end

---@param name string The name (and path) of the file.
---@param data Data The Data object to write to the file.
---@param size number How many bytes to write.
--- returns:
---     boolean success - If the operation was successful.
---     string message - Error message if operation was unsuccessful.
---@return boolean, string
function filesystem.write(name, data, size) end

---
--- Represents a file on the filesystem.
---@class File
File = {}

---
--- Closes a file.
---
--- returns:
---     boolean success - Whether closing was successful.
---@return boolean
function File.close() end

---
--- Flushes any buffered written data in the file to the disk.
---
--- returns:
---     boolean success - Whether the file successfully flushed any buffered data to the disk.
---     string err - The error string, if an error occurred and the file could not be flushed.
---@return boolean, string
function File.flush() end

---
--- Gets the buffer mode of a file.
---
--- returns:
---     BufferMode mode - The current buffer mode of the file.
---     number size - The maximum size in bytes of the file's buffer.
---@return BufferMode, number
function File.getBuffer() end

---
--- Gets the filename that the File object was created with. If the file object originated from the love.filedropped callback, the filename will be the full platform-dependent file path.
---
--- returns:
---     string filename - The filename of the File.
---@return string
function File.getFilename() end

---
--- Gets the FileMode the file has been opened with.
---
--- returns:
---     FileMode mode - The mode this file has been opened with.
---@return FileMode
function File.getMode() end

---
--- Returns the file size.
---
--- returns:
---     number size - The file size
---@return number
function File.getSize() end

---
--- Gets whether end-of-file has been reached.
---
--- returns:
---     boolean eof - Whether EOF has been reached.
---@return boolean
function File.isEOF() end

---
--- Gets whether the file is open.
---
--- returns:
---     boolean open - True if the file is currently open, false otherwise.
---@return boolean
function File.isOpen() end

---
--- Iterate over all the lines in a file
---
--- returns:
---     function iterator - The iterator (can be used in for loops)
---@return function
function File.lines() end

---
--- Open the file for write, read or append.
--- 
--- If you are getting the error message "Could not set write directory", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.
---
---@param mode FileMode The mode to open the file in.
--- returns:
---     boolean success - True on success, false otherwise.
---@return boolean
function File.open(mode) end

---
--- Read a number of bytes from a file.
---
---@param bytes number The number of bytes to read
--- returns:
---     string contents - The contents of the read bytes.
---     number size - How many bytes have been read.
---@return string, number
function File.read(bytes) end

---
--- Seek to a position in a file.
---
---@param position number The position to seek to.
--- returns:
---     boolean success - Whether the operation was successful.
---@return boolean
function File.seek(position) end

---
--- Sets the buffer mode for a file opened for writing or appending. Files with buffering enabled will not write data to the disk until the buffer size limit is reached, depending on the buffer mode.
---
---@param mode BufferMode The buffer mode to use.
---@param size number The maximum size in bytes of the file's buffer.
--- returns:
---     boolean success - Whether the buffer mode was successfully set.
---     string errorstr - The error string, if the buffer mode could not be set and an error occurred.
---@return boolean, string
function File.setBuffer(mode, size) end

---
--- Returns the position in the file.
---
--- returns:
---     number pos - The current position.
---@return number
function File.tell() end

---
--- Write data to a file.
---
---@param data string The data to write.
---@param size number How many bytes to write.
--- returns:
---     boolean success - Whether the operation was successful.
---@return boolean
function File.write(data, size) end

---
--- Data representing the contents of a file.
---@class FileData
FileData = {}

---
--- Gets the extension of the FileData.
---
--- returns:
---     string ext - The extension of the file the FileData represents.
---@return string
function FileData.getExtension() end

---
--- Gets the filename of the FileData.
---
--- returns:
---     string name - The name of the file the FileData represents.
---@return string
function FileData.getFilename() end

---
--- The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Canvases) and managing screen geometry.
--- 
--- LÖVE's coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x axis is horizontal: larger values are further to the right. The y axis is vertical: larger values are further towards the bottom.
--- 
--- In many cases, you draw images or shapes in terms of their upper-left corner.
--- 
--- Many of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.
---
local graphics = {}
love.graphics = graphics

---
--- Draws a filled or unfilled arc at position (x, y). The arc is drawn from angle1 to angle2 in radians. The segments parameter determines how many segments are used to draw the arc. The more segments, the smoother the edge.
---
---@param drawmode DrawMode How to draw the arc.
---@param x number The position of the center along x-axis.
---@param y number The position of the center along y-axis.
---@param radius number Radius of the arc.
---@param angle1 number The angle at which the arc begins.
---@param angle2 number The angle at which the arc terminates.
---@param segments number The number of segments used for drawing the arc.
function graphics.arc(drawmode, x, y, radius, angle1, angle2, segments) end

---@param drawmode DrawMode How to draw the arc.
---@param arctype ArcType The type of arc to draw.
---@param x number The position of the center along x-axis.
---@param y number The position of the center along y-axis.
---@param radius number Radius of the arc.
---@param angle1 number The angle at which the arc begins.
---@param angle2 number The angle at which the arc terminates.
---@param segments number The number of segments used for drawing the arc.
function graphics.arc(drawmode, arctype, x, y, radius, angle1, angle2, segments) end

---
--- Applies the given Transform object to the current coordinate transformation.
--- 
--- This effectively multiplies the existing coordinate transformation's matrix with the Transform object's internal matrix to produce the new coordinate transformation.
---
---@param transform Transform The Transform object to apply to the current graphics coordinate transform.
function graphics.applyTransform(transform) end

---
--- Creates a screenshot once the current frame is done (after love.draw has finished).
--- 
--- Since this function enqueues a screenshot capture rather than executing it immediately, it can be called from an input callback or love.update and it will still capture all of what's drawn to the screen in that frame.
---
---@param filename string The filename to save the screenshot to. The encoded image type is determined based on the extension of the filename, and must be one of the ImageFormats.
function graphics.captureScreenshot(filename) end

---@param callback function Function which gets called once the screenshot has been captured. An ImageData is passed into the function as its only argument.
function graphics.captureScreenshot(callback) end

---@param channel Channel The Channel to push the generated ImageData to.
function graphics.captureScreenshot(channel) end

---
--- Draws a circle.
---
---@param mode DrawMode How to draw the circle.
---@param x number The position of the center along x-axis.
---@param y number The position of the center along y-axis.
---@param radius number The radius of the circle.
function graphics.circle(mode, x, y, radius) end

---@param mode DrawMode How to draw the circle.
---@param x number The position of the center along x-axis.
---@param y number The position of the center along y-axis.
---@param radius number The radius of the circle.
---@param segments number The number of segments used for drawing the circle. Note: The default variable for the segments parameter varies between different versions of LÖVE.
function graphics.circle(mode, x, y, radius, segments) end

---
--- Clears the screen to the background color in LÖVE 0.9.2 and earlier, or to the specified color in 0.10.0 and newer.
--- 
--- This function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.
--- 
--- Note that the scissor area bounds the cleared region.
---
function graphics.clear() end

---@param r number The red channel of the color to clear the screen to.
---@param g number The green channel of the color to clear the screen to.
---@param b number The blue channel of the color to clear the screen to.
---@param a number The alpha channel of the color to clear the screen to.
function graphics.clear(r, g, b, a) end

---@param color table A table in the form of {r, g, b, a} containing the color to clear the first active Canvas to.
---@param ... table Additional tables for each active Canvas.
function graphics.clear(color, ...) end

---
--- Discards (trashes) the contents of the screen or active Canvas. This is a performance optimization function with niche use cases.
--- 
--- If the active Canvas has just been changed and the "replace" BlendMode is about to be used to draw something which covers the entire screen, calling love.graphics.discard rather than calling love.graphics.clear or doing nothing may improve performance on mobile devices.
--- 
--- On some desktop systems this function may do nothing.
---
---@param discardcolor boolean Whether to discard the texture(s) of the active Canvas(es) (the contents of the screen if no Canvas is active).
---@param discardstencil boolean Whether to discard the contents of the stencil buffer of the screen / active Canvas.
function graphics.discard(discardcolor, discardstencil) end

---@param discardcolors table An array containing boolean values indicating whether to discard the texture of each active Canvas, when multiple simultaneous Canvases are active.
---@param discardstencil boolean Whether to discard the contents of the stencil buffer of the screen / active Canvas.
function graphics.discard(discardcolors, discardstencil) end

---
--- Draws a Drawable object (an Image, Canvas, SpriteBatch, ParticleSystem, Mesh, Text object, or Video) on the screen with optional rotation, scaling and shearing.
--- 
--- Objects are drawn relative to their local coordinate system. The origin is by default located at the top left corner of Image and Canvas. All scaling, shearing, and rotation arguments transform the object relative to that point. Also, the position of the origin can be specified on the screen coordinate system.
--- 
--- It's possible to rotate an object about its center by offsetting the origin to the center. Angles must be given in radians for rotation. One can also use a negative scaling factor to flip about its centerline.
--- 
--- Note that the offsets are applied before rotation, scaling, or shearing; scaling and shearing are applied before rotation.
--- 
--- The right and bottom edges of the object are shifted at an angle defined by the shearing factors.
---
---@param drawable Drawable A drawable object.
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis). Can be negative.
---@param sy number Scale factor (y-axis). Can be negative.
---@param ox number Origin offset (x-axis). (A value of 20 would effectively move your drawable object 20 pixels to the left.)
---@param oy number Origin offset (y-axis). (A value of 20 would effectively move your drawable object 20 pixels up.)
---@param kx number Shearing factor (x-axis).
---@param ky number Shearing factor (y-axis).
function graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky) end

---@param texture Texture A Texture (Image or Canvas) to texture the Quad with.
---@param quad Quad The Quad to draw on screen.
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis). Can be negative.
---@param sy number Scale factor (y-axis). Can be negative.
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis)
---@param kx number Shearing factor (x-axis).
---@param ky number Shearing factor (y-axis).
function graphics.draw(texture, quad, x, y, r, sx, sy, ox, oy, kx, ky) end

---
--- Draws many instances of a Mesh with a single draw call, using hardware geometry instancing.
--- 
--- Each instance can have unique properties (positions, colors, etc.) but will not by default unless a custom Shader along with either per-instance attributes or the love_InstanceID GLSL 3 vertex shader variable is used, otherwise they will all render at the same position on top of each other.
--- 
--- Instancing is not supported by some older GPUs that are only capable of using OpenGL ES 2 or OpenGL 2. Use love.graphics.getSupported to check.
---
---@param mesh Mesh The mesh to render.
---@param instancecount number The number of instances to render.
---@param x number The position to draw the instances (x-axis).
---@param y number The position to draw the instances (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shearing factor (x-axis).
---@param ky number Shearing factor (y-axis).
function graphics.drawInstanced(mesh, instancecount, x, y, r, sx, sy, ox, oy, kx, ky) end

---@param mesh Mesh The mesh to render.
---@param instancecount number The number of instances to render.
---@param transform Transform A transform object.
function graphics.drawInstanced(mesh, instancecount, transform) end

---
--- Draws a layer of an Array Texture.
---
---@param texture Texture The Array Texture to draw.
---@param layerindex number The index of the layer to use when drawing.
---@param x number The position to draw the texture (x-axis).
---@param y number The position to draw the texture (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shearing factor (x-axis).
---@param ky number Shearing factor (y-axis).
function graphics.drawLayer(texture, layerindex, x, y, r, sx, sy, ox, oy, kx, ky) end

---@param texture Texture The Array Texture to draw.
---@param layerindex number The index of the layer to use when drawing.
---@param quad Quad The subsection of the texture's layer to use when drawing.
---@param x number The position to draw the texture (x-axis).
---@param y number The position to draw the texture (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shearing factor (x-axis).
---@param ky number Shearing factor (y-axis).
function graphics.drawLayer(texture, layerindex, quad, x, y, r, sx, sy, ox, oy, kx, ky) end

---@param texture Texture The Array Texture to draw.
---@param layerindex number The index of the layer to use when drawing.
---@param transform Transform A transform object.
function graphics.drawLayer(texture, layerindex, transform) end

---@param texture Texture The Array Texture to draw.
---@param layerindex number The index of the layer to use when drawing.
---@param quad Quad The subsection of the texture's layer to use when drawing.
---@param transform Transform A transform object.
function graphics.drawLayer(texture, layerindex, quad, transform) end

---
--- Draws an ellipse.
---
---@param mode DrawMode How to draw the ellipse.
---@param x number The position of the center along x-axis.
---@param y number The position of the center along y-axis.
---@param radiusx number The radius of the ellipse along the x-axis (half the ellipse's width).
---@param radiusy number The radius of the ellipse along the y-axis (half the ellipse's height).
function graphics.ellipse(mode, x, y, radiusx, radiusy) end

---@param mode DrawMode How to draw the ellipse.
---@param x number The position of the center along x-axis.
---@param y number The position of the center along y-axis.
---@param radiusx number The radius of the ellipse along the x-axis (half the ellipse's width).
---@param radiusy number The radius of the ellipse along the y-axis (half the ellipse's height).
---@param segments number The number of segments used for drawing the ellipse.
function graphics.ellipse(mode, x, y, radiusx, radiusy, segments) end

---
--- Immediately renders any pending automatically batched draws.
--- 
--- LÖVE will call this function internally as needed when most state is changed, so it is not necessary to manually call it.
--- 
--- The current batch will be automatically flushed by love.graphics state changes (except for the transform stack and the current color), as well as Shader:send and methods on Textures which change their state. Using a different Image in consecutive love.graphics.draw calls will also flush the current batch.
--- 
--- SpriteBatches, ParticleSystems, Meshes, and Text objects do their own batching and do not affect automatic batching of other draws.
---
function graphics.flushBatch() end

---
--- Gets the current background color.
---
--- returns:
---     number r - The red component (0-255).
---     number g - The green component (0-255).
---     number b - The blue component (0-255).
---     number a - The alpha component (0-255).
---@return number, number, number, number
function graphics.getBackgroundColor() end

---
--- Gets the blending mode.
---
--- returns:
---     BlendMode mode - The current blend mode.
---     BlendAlphaMode alphamode - The current blend alpha mode – it determines how the alpha of drawn objects affects blending.
---@return BlendMode, BlendAlphaMode
function graphics.getBlendMode() end

---
--- Gets the current target Canvas.
---
--- returns:
---     Canvas canvas - The Canvas set by setCanvas. Returns nil if drawing to the real screen.
---@return Canvas
function graphics.getCanvas() end

---
--- Gets the available Canvas formats, and whether each is supported.
---
---@param readable boolean If true, the returned formats will only be indicated as supported if love.graphics.newCanvas will work with the readable flag set to true for that format, and vice versa if the parameter is false.
--- returns:
---     table formats - A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values (taking into account the readable parameter). Not all systems support all formats.
---@return table
function graphics.getCanvasFormats(readable) end

--- returns:
---     table formats - A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats.
---@return table
function graphics.getCanvasFormats() end

---
--- Gets the current color.
---
--- returns:
---     number r - The red component (0-255).
---     number g - The red component (0-255).
---     number b - The blue component (0-255).
---     number a - The alpha component (0-255).
---@return number, number, number, number
function graphics.getColor() end

---
--- Gets the active color components used when drawing. Normally all 4 components are active unless love.graphics.setColorMask has been used.
--- 
--- The color mask determines whether individual components of the colors of drawn objects will affect the color of the screen. They affect love.graphics.clear and Canvas:clear as well.
---
--- returns:
---     boolean r - Whether the red color component is active when rendering.
---     boolean g - Whether the green color component is active when rendering.
---     boolean b - Whether the blue color component is active when rendering.
---     boolean a - Whether the alpha color component is active when rendering.
---@return boolean, boolean, boolean, boolean
function graphics.getColorMask() end

---
--- Returns the default scaling filters used with Images, Canvases, and Fonts.
---
--- returns:
---     FilterMode min - Filter mode used when scaling the image down.
---     FilterMode mag - Filter mode used when scaling the image up.
---     number anisotropy - Maximum amount of Anisotropic Filtering used.
---@return FilterMode, FilterMode, number
function graphics.getDefaultFilter() end

---
--- Gets the current depth test mode and whether writing to the depth buffer is enabled.
--- 
--- This is low-level functionality designed for use with custom vertex shaders and Meshes with custom vertex attributes. No higher level APIs are provided to set the depth of 2D graphics such as shapes, lines, and Images.
---
--- returns:
---     CompareMode comparemode - Depth comparison mode used for depth testing.
---     boolean write - Whether to write update / write values to the depth buffer when rendering.
---@return CompareMode, boolean
function graphics.getDepthMode() end

---
--- Gets the width and height of the window.
---
--- returns:
---     number width - The width of the window.
---     number height - The height of the window.
---@return number, number
function graphics.getDimensions() end

---
--- Gets the current Font object.
---
--- returns:
---     Font font - The current Font, or nil if none is set.
---@return Font
function graphics.getFont() end

---
--- Gets whether triangles with clockwise- or counterclockwise-ordered vertices are considered front-facing.
--- 
--- This is designed for use in combination with Mesh face culling. Other love.graphics shapes, lines, and sprites are not guaranteed to have a specific winding order to their internal vertices.
---
--- returns:
---     VertexWinding winding - The winding mode to use. The default winding is counterclockwise ("ccw").
---@return VertexWinding
function graphics.getFrontFaceWinding() end

---
--- Gets the height of the window.
---
--- returns:
---     number height - The height of the window.
---@return number
function graphics.getHeight() end

---
--- Gets the raw and compressed pixel formats usable for Images, and whether each is supported.
---
--- returns:
---     table formats - A table containing PixelFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats.
---@return table
function graphics.getImageFormats() end

---
--- Gets the line join style.
---
--- returns:
---     LineJoin join - The LineJoin style.
---@return LineJoin
function graphics.getLineJoin() end

---
--- Gets the line style.
---
--- returns:
---     LineStyle style - The current line style.
---@return LineStyle
function graphics.getLineStyle() end

---
--- Gets the current line width.
---
--- returns:
---     number width - The current line width.
---@return number
function graphics.getLineWidth() end

---
--- Gets whether back-facing triangles in a Mesh are culled.
--- 
--- Mesh face culling is designed for use with low level custom hardware-accelerated 3D rendering via custom vertex attributes on Meshes, custom vertex shaders, and depth testing with a depth buffer.
---
--- returns:
---     CullMode mode - The Mesh face culling mode in use (whether to render everything, cull back-facing triangles, or cull front-facing triangles).
---@return CullMode
function graphics.getMeshCullMode() end

---
--- Returns the current Shader. Returns nil if none is set.
---
--- returns:
---     Shader shader - The current Shader.
---@return Shader
function graphics.getShader() end

---
--- Gets the current depth of the transform / state stack (the number of pushes without corresponding pops).
---
--- returns:
---     number depth - The current depth of the transform and state love.graphics stack.
---@return number
function graphics.getStackDepth() end

---
--- Gets performance-related rendering statistics.
---
--- returns:
---     table stats - A table with the following fields:
---@return table
function graphics.getStats() end

---
--- Gets whether stencil testing is enabled.
--- 
--- When stencil testing is enabled, the geometry of everything that is drawn will be clipped / stencilled out based on whether it intersects with what has been previously drawn to the stencil buffer.
--- 
--- Each Canvas has its own stencil buffer.
---
--- returns:
---     boolean enabled - Whether stencil testing is enabled.
---     boolean inverted - Whether the stencil test is inverted or not.
---@return boolean, boolean
function graphics.getStencilTest() end

---
--- Gets the optional graphics features and whether they're supported on the system.
--- 
--- Some older or low-end systems don't always support all graphics features.
---
--- returns:
---     table features - A table containing GraphicsFeature keys, and boolean values indicating whether each feature is supported.
---@return table
function graphics.getSupported() end

---
--- Gets the system-dependent maximum values for love.graphics features.
---
--- returns:
---     table limits - A table containing GraphicsLimit keys, and number values.
---@return table
function graphics.getSystemLimits() end

---
--- Gets the point size.
---
--- returns:
---     number size - The current point size.
---@return number
function graphics.getPointSize() end

---
--- Gets information about the system's video card and drivers.
---
--- returns:
---     string name - The name of the renderer, e.g. "OpenGL" or "OpenGL ES".
---     string version - The version of the renderer with some extra driver-dependent version info, e.g. "2.1 INTEL-8.10.44".
---     string vendor - The name of the graphics card vendor, e.g. "Intel Inc".
---     string device - The name of the graphics card, e.g. "Intel HD Graphics 3000 OpenGL Engine".
---@return string, string, string, string
function graphics.getRendererInfo() end

---
--- Gets the current scissor box.
---
--- returns:
---     number x - The x component of the top-left point of the box.
---     number y - The y component of the top-left point of the box.
---     number width - The width of the box.
---     number height - The height of the box.
---@return number, number, number, number
function graphics.getScissor() end

---
--- Gets the available texture types, and whether each is supported.
---
--- returns:
---     table texturetypes - A table containing TextureTypes as keys, and a boolean indicating whether the type is supported as values. Not all systems support all types.
---@return table
function graphics.getTextureTypes() end

---
--- Gets the width of the window.
---
--- returns:
---     number width - The width of the window.
---@return number
function graphics.getWidth() end

---
--- Sets the scissor to the rectangle created by the intersection of the specified rectangle with the existing scissor. If no scissor is active yet, it behaves like love.graphics.setScissor.
--- 
--- The scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.
--- 
--- The dimensions of the scissor is unaffected by graphical transformations (translate, scale, ...).
---
---@param x number The x-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle.
---@param y number The y-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle.
---@param width number The width of the rectangle to intersect with the existing scissor rectangle.
---@param height number The height of the rectangle to intersect with the existing scissor rectangle.
function graphics.intersectScissor(x, y, width, height) end

function graphics.intersectScissor() end

---
--- Converts the given 2D position from screen-space into global coordinates.
--- 
--- This effectively applies the reverse of the current graphics transformations to the given position. A similar Transform:inverseTransformPoint method exists for Transform objects.
---
---@param screenX number The x component of the screen-space position.
---@param screenY number The y component of the screen-space position.
--- returns:
---     number globalX - The x component of the position in global coordinates.
---     number globalY - The y component of the position in global coordinates.
---@return number, number
function graphics.inverseTransformPoint(screenX, screenY) end

---
--- Gets whether gamma-correct rendering is supported and enabled. It can be enabled by setting t.gammacorrect = true in love.conf.
--- 
--- Not all devices support gamma-correct rendering, in which case it will be automatically disabled and this function will return false. It is supported on desktop systems which have graphics cards that are capable of using OpenGL 3 / DirectX 10, and iOS devices that can use OpenGL ES 3.
---
--- returns:
---     boolean gammacorrect - True if gamma-correct rendering is supported and was enabled in love.conf, false otherwise.
---@return boolean
function graphics.isGammaCorrect() end

---
--- Gets whether wireframe mode is used when drawing.
---
--- returns:
---     boolean wireframe - True if wireframe lines are used when drawing, false if it's not.
---@return boolean
function graphics.isWireframe() end

---
--- Draws lines between points.
---
---@param x1 number The position of first point on the x-axis.
---@param y1 number The position of first point on the y-axis.
---@param x2 number The position of second point on the x-axis.
---@param y2 number The position of second point on the y-axis.
---@param ... number You can continue passing point positions to draw a polyline.
function graphics.line(x1, y1, x2, y2, ...) end

---@param points table A table of point positions.
function graphics.line(points) end

---
--- Creates a new Canvas object for offscreen rendering.
--- 
--- Antialiased Canvases have slightly higher system requirements than normal Canvases. Additionally, the supported maximum number of MSAA samples varies depending on the system. Use love.graphics.getSystemLimit to check.
--- 
--- If the number of MSAA samples specified is greater than the maximum supported by the system, the Canvas will still be created but only using the maximum supported amount (this includes 0.)
---
---@param width number The width of the Canvas.
---@param height number The height of the Canvas.
---@param format CanvasFormat The desired texture mode of the Canvas.
---@param msaa number The desired number of antialiasing samples used when drawing to the Canvas.
--- returns:
---     Canvas canvas - A new Canvas object.
---@return Canvas
function graphics.newCanvas(width, height, format, msaa) end

---
--- Creates a new Font from a TrueType Font or BMFont file. Created fonts are not cached, in that calling this function with the same arguments will always create a new Font object.
--- 
--- All variants which accept a filename can also accept a Data object instead.
---
---@param filename string The filepath to the BMFont or TrueType font file.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newFont(filename) end

---@param filename string The filepath to the TrueType font file.
---@param size number The size of the font in pixels.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newFont(filename, size) end

---@param filename string The filepath to the BMFont file.
---@param imagefilename string The filepath to the BMFont's image file. If this argument is omitted, the path specified inside the BMFont file will be used.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newFont(filename, imagefilename) end

---@param size number The size of the font in pixels.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newFont(size) end

---
--- Creates a new Mesh.
--- 
--- Use Mesh:setTexture if the Mesh should be textured with an Image or Canvas when it's drawn.
---
---@param vertices table The table filled with vertex information tables for each vertex as follows:
---@param mode MeshDrawMode How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.
---@param usage SpriteBatchUsage The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance.
--- returns:
---     Mesh mesh - The new Mesh.
---@return Mesh
function graphics.newMesh(vertices, mode, usage) end

---@param vertexcount number The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 255,255,255,255}.
---@param mode MeshDrawMode How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.
---@param usage SpriteBatchUsage The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance.
--- returns:
---     Mesh mesh - The new Mesh.
---@return Mesh
function graphics.newMesh(vertexcount, mode, usage) end

---@param vertexformat table A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex.
---@param vertices table The table filled with vertex information tables for each vertex, in the form of {vertex, ...} where each vertex is a table in the form of {attributecomponent, ...}.
---@param mode MeshDrawMode How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.
---@param usage SpriteBatchUsage The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance.
--- returns:
---     Mesh mesh - The new Mesh.
---@return Mesh
function graphics.newMesh(vertexformat, vertices, mode, usage) end

---@param vertexformat table A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex.
---@param vertexcount number The total number of vertices the Mesh will use.
---@param mode MeshDrawMode How the vertices are used when drawing. The default mode "fan" is sufficient for simple convex polygons.
---@param usage SpriteBatchUsage The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance.
--- returns:
---     Mesh mesh - The new Mesh.
---@return Mesh
function graphics.newMesh(vertexformat, vertexcount, mode, usage) end

---
--- Creates a new Image from a filepath, FileData, an ImageData, or a CompressedImageData, and optionally generates or specifies mipmaps for the image.
---
---@param filename string The filepath to the image file.
--- returns:
---     Image image - An Image object which can be drawn on screen.
---@return Image
function graphics.newImage(filename) end

---@param imageData ImageData An ImageData object. The Image will use this ImageData to reload itself when love.window.setMode is called.
--- returns:
---     Image image - An Image object which can be drawn on screen.
---@return Image
function graphics.newImage(imageData) end

---@param compressedImageData CompressedImageData A CompressedImageData object. The Image will use this CompressedImageData to reload itself when love.window.setMode is called.
--- returns:
---     Image image - An Image object which can be drawn on screen.
---@return Image
function graphics.newImage(compressedImageData) end

---@param filename string The filepath to the image file (or a FileData or ImageData or CompressedImageData object).
---@param flags table A table containing the following fields:
--- returns:
---     Image image - An Image object which can be drawn on screen.
---@return Image
function graphics.newImage(filename, flags) end

---
--- Creates a new Font by loading a specifically formatted image.
--- 
--- In versions prior to 0.9.0, LÖVE expects ISO 8859-1 encoding for the glyphs string.
---
---@param filename string The filepath to the image file.
---@param glyphs string A string of the characters in the image in order from left to right.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newImageFont(filename, glyphs) end

---@param imageData ImageData The ImageData object to create the font from.
---@param glyphs string A string of the characters in the image in order from left to right.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newImageFont(imageData, glyphs) end

---@param filename string The filepath to the image file.
---@param glyphs string A string of the characters in the image in order from left to right.
---@param extraspacing number Additional spacing (positive or negative) to apply to each glyph in the Font.
--- returns:
---     Font font - A Font object which can be used to draw text on screen.
---@return Font
function graphics.newImageFont(filename, glyphs, extraspacing) end

---
--- Creates a new ParticleSystem.
---
---@param texture Texture The Image or Canvas to use.
---@param buffer number The max number of particles at the same time.
--- returns:
---     ParticleSystem system - A new ParticleSystem.
---@return ParticleSystem
function graphics.newParticleSystem(texture, buffer) end

---
--- Creates a new Shader object for hardware-accelerated vertex and pixel effects. A Shader contains either vertex shader code, pixel shader code, or both.
--- 
--- Vertex shader code must contain at least one function, named position, which is the function that will produce transformed vertex positions of drawn objects in screen-space.
--- 
--- Pixel shader code must contain at least one function, named effect, which is the function that will produce the color which is blended onto the screen for each pixel a drawn object touches.
---
---@param code string The pixel shader or vertex shader code, or a filename pointing to a file with the code.
--- returns:
---     Shader shader - A Shader object for use in drawing operations.
---@return Shader
function graphics.newShader(code) end

---@param pixelcode string The pixel shader code, or a filename pointing to a file with the code.
---@param vertexcode string The vertex shader code, or a filename pointing to a file with the code.
--- returns:
---     Shader shader - A Shader object for use in drawing operations.
---@return Shader
function graphics.newShader(pixelcode, vertexcode) end

---
--- Creates a new drawable Text object.
---
---@param font Font The font to use for the text.
---@param textstring string The initial string of text that the new Text object will contain. May be nil.
--- returns:
---     Text text - The new drawable Text object.
---@return Text
function graphics.newText(font, textstring) end

---
--- Creates a new Quad.
--- 
--- The purpose of a Quad is to describe the result of the following transformation on any drawable object. The object is first scaled to dimensions sw * sh. The Quad then describes the rectangular area of dimensions width * height whose upper left corner is at position (x, y) inside the scaled object.
---
---@param x number The top-left position along the x-axis.
---@param y number The top-left position along the y-axis.
---@param width number The width of the Quad.
---@param height number The height of the Quad.
---@param sw number The reference width, the width of the Image.
---@param sh number The reference height, the height of the Image.
--- returns:
---     Quad quad - The new Quad.
---@return Quad
function graphics.newQuad(x, y, width, height, sw, sh) end

---
--- Creates a new SpriteBatch object.
---
---@param texture Texture The Image or Canvas to use for the sprites.
---@param maxsprites number The max number of sprites.
---@param usage SpriteBatchUsage The expected usage of the SpriteBatch. The specified usage mode affects the SpriteBatch's memory usage and performance.
--- returns:
---     SpriteBatch spriteBatch - The new SpriteBatch.
---@return SpriteBatch
function graphics.newSpriteBatch(texture, maxsprites, usage) end

---
--- Creates a new drawable Video. Currently only Ogg Theora video files are supported.
---
---@param filename string The file path to the Ogg Theora video file.
---@param loadaudio boolean Whether to try to load the video's audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.
--- returns:
---     Video video - A new Video.
---@return Video
function graphics.newVideo(filename, loadaudio) end

---@param videostream VideoStream A video stream object.
---@param loadaudio boolean Whether to try to load the video's audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio.
--- returns:
---     Video video - A new Video.
---@return Video
function graphics.newVideo(videostream, loadaudio) end

---
--- Resets the current coordinate transformation.
--- 
--- This function is always used to reverse any previous calls to love.graphics.rotate, love.graphics.scale, love.graphics.shear or love.graphics.translate. It returns the current transformation state to its defaults.
---
function graphics.origin() end

---
--- Draws one or more points.
---
---@param x number The position of the first point on the x-axis.
---@param y number The position of the first point on the y-axis.
---@param ... number The x and y coordinates of additional points.
function graphics.points(x, y, ...) end

---@param points table A table containing multiple point positions, in the form of {x, y, ...}.
function graphics.points(points) end

---@param points table A table containing multiple individually colored points, in the form of {point, ...}. Each table contains the position and color of a point in the form of {x, y, r, g, b, a}. The color components are optional.
function graphics.points(points) end

---
--- Draw a polygon.
--- 
--- Following the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon's vertices.
--- 
--- When in fill mode, the polygon must be convex and simple or rendering artifacts may occur.
---
---@param mode DrawMode How to draw the polygon.
---@param ... number The vertices of the polygon.
function graphics.polygon(mode, ...) end

---@param mode DrawMode How to draw the polygon.
---@param vertices table The vertices of the polygon as a table.
function graphics.polygon(mode, vertices) end

---
--- Pops the current coordinate transformation from the transformation stack.
--- 
--- This function is always used to reverse a previous push operation. It returns the current transformation state to what it was before the last preceding push. For an example, see the description of love.graphics.push.
---
function graphics.pop() end

---
--- Displays the results of drawing operations on the screen.
--- 
--- This function is used when writing your own love.run function. It presents all the results of your drawing operations on the screen. See the example in love.run for a typical use of this function.
---
function graphics.present() end

---
--- Draws text on screen. If no Font is set, one will be created and set (once) if needed.
--- 
--- As of LOVE 0.7.1, when using translation and scaling functions while drawing text, this function assumes the scale occurs first. If you don't script with this in mind, the text won't be in the right position, or possibly even on screen.
--- 
--- love.graphics.print and love.graphics.printf both support UTF-8 encoding. You'll also need a proper Font for special characters.
--- 
--- In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.
---
---@param text string The text to draw.
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shear factor (x-axis).
---@param ky number Shear factor (y-axis).
function graphics.print(text, x, y, r, sx, sy, ox, oy, kx, ky) end

---@param coloredtext table A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.
---@param x number The position of the new text on the x-axis.
---@param y number The position of the new text on the y-axis.
---@param angle number The orientation of the object in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
function graphics.print(coloredtext, x, y, angle, sx, sy, ox, oy, kx, ky) end

---
--- Draws formatted text, with word wrap and alignment.
--- 
--- See additional notes in love.graphics.print.
--- 
--- In version 0.9.2 and earlier, wrapping was implemented by breaking up words by spaces and putting them back together to make sure things fit nicely within the limit provided. However, due to the way this is done, extra spaces between words would end up missing when printed on the screen, and some lines could overflow past the provided wrap limit. In version 0.10.0 and newer this is no longer the case.
---
---@param text string A text string.
---@param x number The position on the x-axis.
---@param y number The position on the y-axis.
---@param limit number Wrap the line after this many horizontal pixels.
---@param align AlignMode The alignment.
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shear factor (x-axis).
---@param ky number Shear factor (y-axis).
function graphics.printf(text, x, y, limit, align, r, sx, sy, ox, oy, kx, ky) end

---@param coloredtext table A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}.
---@param x number The position of the new text on the x-axis.
---@param y number The position of the new text on the y-axis.
---@param wraplimit number The maximum width in pixels of the text before it gets automatically wrapped to a new line.
---@param align AlignMode The alignment of the text.
---@param angle number The orientation of the object in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
function graphics.printf(coloredtext, x, y, wraplimit, align, angle, sx, sy, ox, oy, kx, ky) end

---
--- Copies and pushes the current coordinate transformation to the transformation stack.
--- 
--- This function is always used to prepare for a corresponding pop operation later. It stores the current coordinate transformation state into the transformation stack and keeps it active. Later changes to the transformation can be undone by using the pop operation, which returns the coordinate transform to the state it was in before calling push.
---
---@param stack StackType The type of stack to push (e.g. just transformation state, or all love.graphics state).
function graphics.push(stack) end

---
--- Draws a rectangle.
---
---@param mode DrawMode How to draw the rectangle.
---@param x number The position of top-left corner along the x-axis.
---@param y number The position of top-left corner along the y-axis.
---@param width number Width of the rectangle.
---@param height number Height of the rectangle.
function graphics.rectangle(mode, x, y, width, height) end

---@param mode DrawMode How to draw the rectangle.
---@param x number The position of top-left corner along the x-axis.
---@param y number The position of top-left corner along the y-axis.
---@param width number Width of the rectangle.
---@param height number Height of the rectangle.
---@param rx number The x-axis radius of each round corner. Cannot be greater than half the rectangle's width.
---@param ry number The y-axis radius of each round corner. Cannot be greater than half the rectangle's height.
---@param segments number The number of segments used for drawing the round corners. A default amount will be chosen if no number is given.
function graphics.rectangle(mode, x, y, width, height, rx, ry, segments) end

---
--- Replaces the current coordinate transformation with the given Transform object.
---
---@param transform Transform The Transform object to replace the current graphics coordinate transform with.
function graphics.replaceTransform(transform) end

---
--- Resets the current graphics settings.
--- 
--- Calling reset makes the current drawing color white, the current background color black, resets any active Canvas or Shader, and removes any scissor settings. It sets the BlendMode to alpha. It also sets both the point and line drawing modes to smooth and their sizes to 1.0.
---
function graphics.reset() end

---
--- Rotates the coordinate system in two dimensions.
--- 
--- Calling this function affects all future drawing operations by rotating the coordinate system around the origin by the given amount of radians. This change lasts until love.draw exits.
---
---@param angle number The amount to rotate the coordinate system in radians.
function graphics.rotate(angle) end

---
--- Scales the coordinate system in two dimensions.
--- 
--- By default the coordinate system in LÖVE corresponds to the display pixels in horizontal and vertical directions one-to-one, and the x-axis increases towards the right while the y-axis increases downwards. Scaling the coordinate system changes this relation.
--- 
--- After scaling by sx and sy, all coordinates are treated as if they were multiplied by sx and sy. Every result of a drawing operation is also correspondingly scaled, so scaling by (2, 2) for example would mean making everything twice as large in both x- and y-directions. Scaling by a negative value flips the coordinate system in the corresponding direction, which also means everything will be drawn flipped or upside down, or both. Scaling by zero is not a useful operation.
--- 
--- Scale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.
--- 
--- Scaling lasts until love.draw exits.
---
---@param sx number The scaling in the direction of the x-axis.
---@param sy number The scaling in the direction of the y-axis. If omitted, it defaults to same as parameter sx.
function graphics.scale(sx, sy) end

---
--- Sets the background color.
---
---@param r number The red component (0-255).
---@param g number The green component (0-255).
---@param b number The blue component (0-255).
---@param a number The alpha component (0-255).
function graphics.setBackgroundColor(r, g, b, a) end

---@param rgba table A numerical indexed table with the red, green and blue values as numbers. Alpha is 255 if it is not in the table
function graphics.setBackgroundColor(rgba) end

---
--- Sets the blending mode.
---
---@param mode BlendMode The blend mode to use.
function graphics.setBlendMode(mode) end

---@param mode BlendMode The blend mode to use.
---@param alphamode BlendAlphaMode What to do with the alpha of drawn objects when blending.
function graphics.setBlendMode(mode, alphamode) end

---
--- Captures drawing operations to a Canvas.
---
---@param canvas Canvas A render target.
function graphics.setCanvas(canvas) end

function graphics.setCanvas() end

---@param canvas1 Canvas The first render target.
---@param canvas2 Canvas The second render target.
---@param ... Canvas More canvases.
function graphics.setCanvas(canvas1, canvas2, ...) end

---
--- Sets the color used for drawing.
---
---@param red number The amount of red.
---@param green number The amount of green.
---@param blue number The amount of blue.
---@param alpha number The amount of alpha. The alpha value will be applied to all subsequent draw operations, even the drawing of an image.
function graphics.setColor(red, green, blue, alpha) end

---@param rgba table A numerical indexed table with the red, green, blue and alpha values as numbers. The alpha is optional and defaults to 255 if it is left out.
function graphics.setColor(rgba) end

---
--- Sets the color mask. Enables or disables specific color components when rendering and clearing the screen. For example, if red is set to false, no further changes will be made to the red component of any pixels.
--- 
--- Enables all color components when called without arguments.
---
---@param red boolean Render red component.
---@param green boolean Render green component.
---@param blue boolean Render blue component.
---@param alpha boolean Render alpha component.
function graphics.setColorMask(red, green, blue, alpha) end

function graphics.setColorMask() end

---
--- Sets the default scaling filters used with Images, Canvases, and Fonts.
--- 
--- This function does not apply retroactively to loaded images.
---
---@param min FilterMode Filter mode used when scaling the image down.
---@param mag FilterMode Filter mode used when scaling the image up.
---@param anisotropy number Maximum amount of Anisotropic Filtering used.
function graphics.setDefaultFilter(min, mag, anisotropy) end

---
--- Configures depth testing and writing to the depth buffer.
--- 
--- This is low-level functionality designed for use with custom vertex shaders and Meshes with custom vertex attributes. No higher level APIs are provided to set the depth of 2D graphics such as shapes, lines, and Images.
---
---@param comparemode CompareMode Depth comparison mode used for depth testing.
---@param write boolean Whether to write update / write values to the depth buffer when rendering.
function graphics.setDepthMode(comparemode, write) end

---
--- Set an already-loaded Font as the current font or create and load a new one from the file and size.
--- 
--- It's recommended that Font objects are created with love.graphics.newFont in the loading stage and then passed to this function in the drawing stage.
---
---@param font Font The Font object to use.
function graphics.setFont(font) end

---
--- Sets whether triangles with clockwise- or counterclockwise-ordered vertices are considered front-facing.
--- 
--- This is designed for use in combination with Mesh face culling. Other love.graphics shapes, lines, and sprites are not guaranteed to have a specific winding order to their internal vertices.
---
---@param winding VertexWinding The winding mode to use. The default winding is counterclockwise ("ccw").
function graphics.setFrontFaceWinding(winding) end

---
--- Sets the line join style.
---
---@param join LineJoin The LineJoin to use.
function graphics.setLineJoin(join) end

---
--- Sets the line style.
---
---@param style LineStyle The LineStyle to use.
function graphics.setLineStyle(style) end

---
--- Sets the line width.
---
---@param width number The width of the line.
function graphics.setLineWidth(width) end

---
--- Sets whether back-facing triangles in a Mesh are culled.
--- 
--- This is designed for use with low level custom hardware-accelerated 3D rendering via custom vertex attributes on Meshes, custom vertex shaders, and depth testing with a depth buffer.
---
---@param mode CullMode The Mesh face culling mode to use (whether to render everything, cull back-facing triangles, or cull front-facing triangles).
function graphics.setMeshCullMode(mode) end

---
--- Creates and sets a new font.
---
---@param filename string The path and name of the file with the font.
---@param size number The size of the font.
--- returns:
---     Font font - The new font.
---@return Font
function graphics.setNewFont(filename, size) end

---@param file File A File with the font.
---@param size number The size of the font.
--- returns:
---     Font font - The new font.
---@return Font
function graphics.setNewFont(file, size) end

---@param data Data A Data with the font.
---@param size number The size of the font.
--- returns:
---     Font font - The new font.
---@return Font
function graphics.setNewFont(data, size) end

---
--- Sets or resets a Shader as the current pixel effect or vertex shaders. All drawing operations until the next love.graphics.setShader will be drawn using the Shader object specified.
--- 
--- Disables the shaders when called without arguments.
---
function graphics.setShader() end

---@param shader Shader The new shader.
function graphics.setShader(shader) end

---
--- Sets the point size.
---
---@param size number The new point size.
function graphics.setPointSize(size) end

---
--- Sets or disables scissor.
--- 
--- The scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.
---
---@param x number The X coordinate of upper left corner.
---@param y number The Y coordinate of upper left corner.
---@param width number The width of clipping rectangle.
---@param height number The height of clipping rectangle.
function graphics.setScissor(x, y, width, height) end

function graphics.setScissor() end

---
--- Configures or disables stencil testing.
--- 
--- When stencil testing is enabled, the geometry of everything that is drawn afterward will be clipped / stencilled out based on a comparison between the arguments of this function and the stencil value of each pixel that the geometry touches. The stencil values of pixels are affected via love.graphics.stencil.
--- 
--- Each Canvas has its own per-pixel stencil values.
---
---@param comparemode CompareMode The type of comparison to make for each pixel.
---@param comparevalue number The value to use when comparing with the stencil value of each pixel. Must be between 0 and 255.
function graphics.setStencilTest(comparemode, comparevalue) end

function graphics.setStencilTest() end

---
--- Sets whether wireframe lines will be used when drawing.
--- 
--- Wireframe mode should only be used for debugging. The lines drawn with it enabled do not behave like regular love.graphics lines: their widths don't scale with the coordinate transformations or with love.graphics.setLineWidth, and they don't use the smooth LineStyle.
---
---@param enable boolean True to enable wireframe mode when drawing, false to disable it.
function graphics.setWireframe(enable) end

---
--- Shears the coordinate system.
---
---@param kx number The shear factor on the x-axis.
---@param ky number The shear factor on the y-axis.
function graphics.shear(kx, ky) end

---
--- Draws geometry as a stencil.
--- 
--- The geometry drawn by the supplied function sets invisible stencil values of pixels, instead of setting pixel colors. The stencil values of pixels can act like a mask / stencil - love.graphics.setStencilTest can be used afterward to determine how further rendering is affected by the stencil values in each pixel.
--- 
--- Each Canvas has its own per-pixel stencil values. Stencil values are within the range of [0, 255].
---
---@param stencilfunction function Function which draws geometry. The stencil values of pixels, rather than the color of each pixel, will be affected by the geometry.
---@param action StencilAction How to modify any stencil values of pixels that are touched by what's drawn in the stencil function.
---@param value number The new stencil value to use for pixels if the "replace" stencil action is used. Has no effect with other stencil actions. Must be between 0 and 255.
---@param keepvalues boolean True to preserve old stencil values of pixels, false to re-set every pixel's stencil value to 0 before executing the stencil function. love.graphics.clear will also re-set all stencil values.
function graphics.stencil(stencilfunction, action, value, keepvalues) end

---
--- Converts the given 2D position from global coordinates into screen-space.
--- 
--- This effectively applies the current graphics transformations to the given position. A similar Transform:transformPoint method exists for Transform objects.
---
---@param globalX number The x component of the position in global coordinates.
---@param globalY number The y component of the position in global coordinates.
--- returns:
---     number screenX - The x component of the position with graphics transformations applied.
---     number sreenY - The y component of the position with graphics transformations applied.
---@return number, number
function graphics.transformPoint(globalX, globalY) end

---
--- Translates the coordinate system in two dimensions.
--- 
--- When this function is called with two numbers, dx, and dy, all the following drawing operations take effect as if their x and y coordinates were x+dx and y+dy.
--- 
--- Scale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.
--- 
--- This change lasts until love.graphics.clear is called (which is called automatically before love.draw in the default love.run function), or a love.graphics.pop reverts to a previous coordinate system state.
--- 
--- Translating using whole numbers will prevent tearing/blurring of images and fonts draw after translating.
---
---@param dx number The translation relative to the x-axis.
---@param dy number The translation relative to the y-axis.
function graphics.translate(dx, dy) end

---
--- Validates shader code. Check if specificed shader code does not contain any errors.
---
---@param gles boolean Validate code as GLSL ES shader.
---@param code string The pixel shader or vertex shader code, or a filename pointing to a file with the code.
--- returns:
---     boolean status - true if specified shader code doesn't contain any errors. false otherwise.
---     string message - Reason why shader code validation failed (or nil if validation succeded).
---@return boolean, string
function graphics.validateShader(gles, code) end

---@param gles boolean Validate code as GLSL ES shader.
---@param pixelcode string The pixel shader code, or a filename pointing to a file with the code.
---@param vertexcode string The vertex shader code, or a filename pointing to a file with the code.
--- returns:
---     boolean status - true if specified shader code doesn't contain any errors. false otherwise.
---     string message - Reason why shader code validation failed (or nil if validation succeded).
---@return boolean, string
function graphics.validateShader(gles, pixelcode, vertexcode) end

---
--- A Canvas is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".
--- 
--- By drawing things that do not change position often (such as background items) to the Canvas, and then drawing the entire Canvas instead of each item, you can reduce the number of draw operations performed each frame.
--- 
--- In versions prior to 0.10.0, not all graphics cards that LÖVE supported could use Canvases. love.graphics.isSupported("canvas") could be used to check for support at runtime.
---@class Canvas
Canvas = {}

---
--- Gets the width and height of the Canvas.
---
--- returns:
---     number width - The width of the Canvas, in pixels.
---     number height - The height of the Canvas, in pixels.
---@return number, number
function Canvas.getDimensions() end

---
--- Gets the filter mode of the Canvas.
---
--- returns:
---     FilterMode min - Filter mode used when minifying the canvas.
---     FilterMode mag - Filter mode used when magnifying the canvas.
---     number anisotropy - Maximum amount of anisotropic filtering used.
---@return FilterMode, FilterMode, number
function Canvas.getFilter() end

---
--- Gets the height of the Canvas.
---
--- returns:
---     number height - The height of the Canvas, in pixels.
---@return number
function Canvas.getHeight() end

---
--- Gets the number of multisample antialiasing (MSAA) samples used when drawing to the Canvas.
--- 
--- This may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn't support that number.
---
--- returns:
---     number samples - The number of multisample antialiasing samples used by the canvas when drawing to it.
---@return number
function Canvas.getMSAA() end

---
--- Gets the width of the Canvas.
---
--- returns:
---     number width - The width of the Canvas, in pixels.
---@return number
function Canvas.getWidth() end

---
--- Gets the wrapping properties of a Canvas.
--- 
--- This function returns the currently set horizontal and vertical wrapping modes for the Canvas.
---
--- returns:
---     WrapMode horizontal - Horizontal wrapping mode of the Canvas.
---     WrapMode vertical - Vertical wrapping mode of the Canvas.
---@return WrapMode, WrapMode
function Canvas.getWrap() end

---
--- Generates ImageData from the contents of the Canvas.
---
--- returns:
---     ImageData data - The image data stored in the Canvas.
---@return ImageData
function Canvas.newImageData() end

---@param x number The x-axis of the top-left corner of the area within the Canvas to capture.
---@param y number The y-axis of the top-left corner of the area within the Canvas to capture.
---@param width number The width of the area within the Canvas to capture.
---@param height number The height of the area within the Canvas to capture.
--- returns:
---     ImageData data - The new ImageData made from the Canvas' contents.
---@return ImageData
function Canvas.newImageData(x, y, width, height) end

---
--- Render to the Canvas using a function.
---
---@param func function A function performing drawing operations.
function Canvas.renderTo(func) end

---
--- Sets the filter of the Canvas.
---
---@param min FilterMode How to scale a canvas down.
---@param mag FilterMode How to scale a canvas up.
---@param anisotropy number Maximum amount of anisotropic filtering used.
function Canvas.setFilter(min, mag, anisotropy) end

---
--- Sets the wrapping properties of a Canvas.
--- 
--- This function sets the way the edges of a Canvas are treated if it is scaled or rotated. If the WrapMode is set to "clamp", the edge will not be interpolated. If set to "repeat", the edge will be interpolated with the pixels on the opposing side of the framebuffer.
---
---@param horizontal WrapMode Horizontal wrapping mode of the Canvas.
---@param vertical WrapMode Vertical wrapping mode of the Canvas.
function Canvas.setWrap(horizontal, vertical) end

---
--- Defines the shape of characters than can be drawn onto the screen.
---@class Font
Font = {}

---
--- Gets the ascent of the Font. The ascent spans the distance between the baseline and the top of the glyph that reaches farthest from the baseline.
---
--- returns:
---     number ascent - The ascent of the Font in pixels.
---@return number
function Font.getAscent() end

---
--- Gets the baseline of the Font. Most scripts share the notion of a baseline: an imaginary horizontal line on which characters rest. In some scripts, parts of glyphs lie below the baseline.
---
--- returns:
---     number baseline - The baseline of the Font in pixels.
---@return number
function Font.getBaseline() end

---
--- Gets the descent of the Font. The descent spans the distance between the baseline and the lowest descending glyph in a typeface.
---
--- returns:
---     number descent - The descent of the Font in pixels.
---@return number
function Font.getDescent() end

---
--- Gets the filter mode for a font.
---
--- returns:
---     FilterMode min - Filter mode used when minifying the font.
---     FilterMode mag - Filter mode used when magnifying the font.
---     number anisotropy - Maximum amount of anisotropic filtering used.
---@return FilterMode, FilterMode, number
function Font.getFilter() end

---
--- Gets the height of the Font. The height of the font is the size including any spacing; the height which it will need.
---
--- returns:
---     number height - The height of the Font in pixels.
---@return number
function Font.getHeight() end

---
--- Gets the line height. This will be the value previously set by Font:setLineHeight, or 1.0 by default.
---
--- returns:
---     number height - The current line height.
---@return number
function Font.getLineHeight() end

---
--- Determines the horizontal size a line of text needs. Does not support line-breaks.
---
---@param line string A line of text.
--- returns:
---     number width - The width of the line.
---@return number
function Font.getWidth(line) end

---
--- Gets formatting information for text, given a wrap limit.
--- 
--- This function accounts for newlines correctly (i.e. '\n').
---
---@param text string The text that will be wrapped.
---@param wraplimit number The maximum width in pixels of each line that text is allowed before wrapping.
--- returns:
---     number width - The maximum width of the wrapped text.
---     table wrappedtext - A sequence containing each line of text that was wrapped.
---@return number, table
function Font.getWrap(text, wraplimit) end

---
--- Gets whether the font can render a particular character.
---
---@param character string A unicode character.
--- returns:
---     boolean hasglyph - Whether the font can render the glyph represented by the character.
---@return boolean
function Font.hasGlyphs(character) end

---@param codepoint number A unicode codepoint number.
--- returns:
---     boolean hasglyph - Whether the font can render the glyph represented by the codepoint number.
---@return boolean
function Font.hasGlyphs(codepoint) end

---
--- Sets the fallback fonts. When the Font doesn't contain a glyph, it will substitute the glyph from the next subsequent fallback Fonts. This is akin to setting a "font stack" in Cascading Style Sheets (CSS).
---
---@param fallbackfont1 Font The first fallback Font to use.
---@param ... Font Additional fallback Fonts.
function Font.setFallbacks(fallbackfont1, ...) end

---
--- Sets the filter mode for a font.
---
---@param min FilterMode How to scale a font down.
---@param mag FilterMode How to scale a font up.
---@param anisotropy number Maximum amount of anisotropic filtering used.
function Font.setFilter(min, mag, anisotropy) end

---
--- Sets the line height. When rendering the font in lines the actual height will be determined by the line height multiplied by the height of the font. The default is 1.0.
---
---@param height number The new line height.
function Font.setLineHeight(height) end

---
--- A 2D polygon mesh used for drawing arbitrary textured shapes.
---@class Mesh
Mesh = {}

---
--- Attaches a vertex attribute from a different Mesh onto this Mesh, for use when drawing. This can be used to share vertex attribute data between several different Meshes.
---
---@param name string The name of the vertex attribute to attach.
---@param mesh Mesh The Mesh to get the vertex attribute from.
function Mesh.attachAttribute(name, mesh) end

---
--- Removes a previously attached vertex attribute from this Mesh.
---
---@param name string The name of the attached vertex attribute to detach.
--- returns:
---     boolean success - Whether the attribute was successfully detached.
---@return boolean
function Mesh.detachAttribute(name) end

---
--- Gets the mode used when drawing the Mesh.
---
--- returns:
---     MeshDrawMode mode - The mode used when drawing the Mesh.
---@return MeshDrawMode
function Mesh.getDrawMode() end

---
--- Gets the range of vertices used when drawing the Mesh.
--- 
--- If the Mesh's draw range has not been set previously with Mesh:setDrawRange, this function will return nil.
---
--- returns:
---     number min - The index of the first vertex used when drawing, or the index of the first value in the vertex map used if one is set for this Mesh.
---     number max - The index of the last vertex used when drawing, or the index of the last value in the vertex map used if one is set for this Mesh.
---@return number, number
function Mesh.getDrawRange() end

---
--- Gets the texture (Image or Canvas) used when drawing the Mesh.
---
--- returns:
---     Texture texture - The Image or Canvas to texture the Mesh with when drawing, or nil if none is set.
---@return Texture
function Mesh.getTexture() end

---
--- Gets the properties of a vertex in the Mesh.
---
---@param index number The index of the the vertex you want to retrieve the information for.
--- returns:
---     number attributecomponent - The first component of the first vertex attribute in the specified vertex.
---     number ... - Additional components of all vertex attributes in the specified vertex.
---@return number, number
function Mesh.getVertex(index) end

---@param index number The index of the the vertex you want to retrieve the information for.
--- returns:
---     number x - The position of the vertex on the x-axis.
---     number y - The position of the vertex on the y-axis.
---     number u - The horizontal component of the texture coordinate.
---     number v - The vertical component of the texture coordinate.
---     number r - The red component of the vertex's color.
---     number g - The green component of the vertex's color.
---     number b - The blue component of the vertex's color.
---     number a - The alpha component of the vertex's color.
---@return number, number, number, number, number, number, number, number
function Mesh.getVertex(index) end

---
--- Gets the properties of a specific attribute within a vertex in the Mesh.
--- 
--- Meshes without a custom vertex format specified in love.graphics.newMesh have position as their first attribute, texture coordinates as their second attribute, and color as their third attribute.
---
---@param vertexindex number The index of the the vertex to be modified.
---@param attributeindex number The index of the attribute within the vertex to be modified.
--- returns:
---     number value1 - The value of the first component of the attribute.
---     number value2 - The value of the second component of the attribute.
---     number ... - Any additional vertex attribute components.
---@return number, number, number
function Mesh.getVertexAttribute(vertexindex, attributeindex) end

---
--- Returns the total number of vertices in the Mesh.
---
--- returns:
---     number num - The total number of vertices in this Mesh.
---@return number
function Mesh.getVertexCount() end

---
--- Gets the vertex format that the Mesh was created with.
---
--- returns:
---     table format - The vertex format of the Mesh, which is a table containing tables for each vertex attribute the Mesh was created with, in the form of {attribute, ...}.
---@return table
function Mesh.getVertexFormat() end

---
--- Gets the vertex map for the Mesh. The vertex map describes the order in which the vertices are used when the Mesh is drawn. The vertices, vertex map, and mesh draw mode work together to determine what exactly is displayed on the screen.
--- 
--- If no vertex map has been set previously via Mesh:setVertexMap, then this function will return nil in LÖVE 0.10.0+, or an empty table in 0.9.2 and older.
---
--- returns:
---     table map - A table containing a list of vertex indices used when drawing.
---@return table
function Mesh.getVertexMap() end

---
--- Gets whether a specific vertex attribute in the Mesh is enabled. Vertex data from disabled attributes is not used when drawing the Mesh.
---
---@param name string The name of the vertex attribute to enable or disable.
--- returns:
---     boolean enabled - Whether the vertex attribute is used when drawing this Mesh.
---@return boolean
function Mesh.isAttributeEnabled(name) end

---
--- Enables or disables a specific vertex attribute in the Mesh. Vertex data from disabled attributes is not used when drawing the Mesh.
---
---@param name string The name of the vertex attribute to enable or disable.
---@param enable boolean Whether the vertex attribute is used when drawing this Mesh.
function Mesh.setAttributeEnabled(name, enable) end

---
--- Sets the mode used when drawing the Mesh.
---
---@param mode MeshDrawMode The mode to use when drawing the Mesh.
function Mesh.setDrawMode(mode) end

---
--- Restricts the drawn vertices of the Mesh to a subset of the total.
--- 
--- If a vertex map is used with the Mesh, this method will set a subset of the values in the vertex map array to use, instead of a subset of the total vertices in the Mesh.
--- 
--- For example, if Mesh:setVertexMap(1, 2, 3, 1, 3, 4) and Mesh:setDrawRange(4, 6) are called, vertices 1, 3, and 4 will be drawn.
---
---@param min number The index of the first vertex to use when drawing, or the index of the first value in the vertex map to use if one is set for this Mesh.
---@param max number The index of the last vertex to use when drawing, or the index of the last value in the vertex map to use if one is set for this Mesh.
function Mesh.setDrawRange(min, max) end

function Mesh.setDrawRange() end

---
--- Sets the texture (Image or Canvas) used when drawing the Mesh.
--- 
--- When called without an argument disables the texture. Untextured meshes have a white color by default.
---
function Mesh.setTexture() end

---@param texture Texture The Image or Canvas to texture the Mesh with when drawing.
function Mesh.setTexture(texture) end

---
--- Sets the properties of a vertex in the Mesh.
---
---@param index number The index of the the vertex you want to modify.
---@param attributecomponent number The first component of the first vertex attribute in the specified vertex.
---@param ... number Additional components of all vertex attributes in the specified vertex.
function Mesh.setVertex(index, attributecomponent, ...) end

---@param index number The index of the the vertex you want to modify.
---@param vertex table A table with vertex information, in the form of {attributecomponent, ...}.
function Mesh.setVertex(index, vertex) end

---@param index number The index of the the vertex you want to modify.
---@param x number The position of the vertex on the x-axis.
---@param y number The position of the vertex on the y-axis.
---@param u number The horizontal component of the texture coordinate.
---@param v number The vertical component of the texture coordinate.
---@param r number The red component of the vertex's color.
---@param g number The green component of the vertex's color.
---@param b number The blue component of the vertex's color.
---@param a number The alpha component of the vertex's color.
function Mesh.setVertex(index, x, y, u, v, r, g, b, a) end

---@param index number The index of the the vertex you want to modify.
---@param vertex table A table with vertex information.
function Mesh.setVertex(index, vertex) end

---
--- Sets the properties of a specific attribute within a vertex in the Mesh.
--- 
--- Meshes without a custom vertex format specified in love.graphics.newMesh have position as their first attribute, texture coordinates as their second attribute, and color as their third attribute.
---
---@param vertexindex number The index of the the vertex to be modified.
---@param attributeindex number The index of the attribute within the vertex to be modified.
---@param value1 number The value of the first component of the attribute.
---@param value2 number The value of the second component of the attribute.
---@param ... number Any additional vertex attribute components.
function Mesh.setVertexAttribute(vertexindex, attributeindex, value1, value2, ...) end

---
--- Sets the vertex map for the Mesh. The vertex map describes the order in which the vertices are used when the Mesh is drawn. The vertices, vertex map, and mesh draw mode work together to determine what exactly is displayed on the screen.
--- 
--- The vertex map allows you to re-order or reuse vertices when drawing without changing the actual vertex parameters or duplicating vertices. It is especially useful when combined with different Mesh Draw Modes.
---
---@param map table A table containing a list of vertex indices to use when drawing. Values must be in the range of [1, Mesh:getVertexCount()].
function Mesh.setVertexMap(map) end

---@param vi1 number The index of the first vertex to use when drawing. Must be in the range of [1, Mesh:getVertexCount()].
---@param vi2 number The index of the second vertex to use when drawing.
---@param vi3 number The index of the third vertex to use when drawing.
function Mesh.setVertexMap(vi1, vi2, vi3) end

---
--- Replaces a range of vertices in the Mesh with new ones. The total number of vertices in a Mesh cannot be changed after it has been created.
---
---@param vertices table The table filled with vertex information tables for each vertex, in the form of {vertex, ...} where each vertex is a table in the form of {attributecomponent, ...}.
function Mesh.setVertices(vertices) end

---@param vertices table The table filled with vertex information tables for each vertex as follows:
function Mesh.setVertices(vertices) end

---
--- Drawable image type.
---@class Image
Image = {}

---
--- Gets the width and height of the Image.
---
--- returns:
---     number width - The width of the Image, in pixels.
---     number height - The height of the Image, in pixels.
---@return number, number
function Image.getDimensions() end

---
--- Gets the filter mode for an image.
---
--- returns:
---     FilterMode min - Filter mode used when minifying the image.
---     FilterMode mag - Filter mode used when magnifying the image.
---@return FilterMode, FilterMode
function Image.getFilter() end

---
--- Gets the flags used when the image was created.
---
--- returns:
---     table flags - A table with ImageFlag keys.
---@return table
function Image.getFlags() end

---
--- Gets the height of the Image.
---
--- returns:
---     number height - The height of the Image, in pixels.
---@return number
function Image.getHeight() end

---
--- Gets the mipmap filter mode for an Image.
---
--- returns:
---     FilterMode mode - The filter mode used in between mipmap levels. nil if mipmap filtering is not enabled.
---     number sharpness - Value used to determine whether the image should use more or less detailed mipmap levels than normal when drawing.
---@return FilterMode, number
function Image.getMipmapFilter() end

---
--- Gets the width of the Image.
---
--- returns:
---     number width - The width of the Image, in pixels.
---@return number
function Image.getWidth() end

---
--- Gets the wrapping properties of an Image.
--- 
--- This function returns the currently set horizontal and vertical wrapping modes for the image.
---
--- returns:
---     WrapMode horizontal - Horizontal wrapping mode of the image.
---     WrapMode vertical - Vertical wrapping mode of the image.
---@return WrapMode, WrapMode
function Image.getWrap() end

---
--- Replaces the contents of an Image.
---
---@param data ImageData The new ImageData to replace the contents with.
---@param slice number Which slice to replace, if applicable.
---@param mipmap number The mimap level of the new ImageData. If 0 Image:replacePixels will generate new mimaps.
function Image.replacePixels(data, slice, mipmap) end

---
--- Sets the filter mode for an image.
---
---@param min FilterMode How to scale an image down.
---@param mag FilterMode How to scale an image up.
function Image.setFilter(min, mag) end

---
--- Sets the mipmap filter mode for an Image.
--- 
--- Mipmapping is useful when drawing an image at a reduced scale. It can improve performance and reduce aliasing issues.
--- 
--- In 0.10.0 and newer, the Image must be created with the mipmaps flag enabled for the mipmap filter to have any effect.
---
---@param filtermode FilterMode The filter mode to use in between mipmap levels. "nearest" will often give better performance.
---@param sharpness number A positive sharpness value makes the image use a more detailed mipmap level when drawing, at the expense of performance. A negative value does the reverse.
function Image.setMipmapFilter(filtermode, sharpness) end

function Image.setMipmapFilter() end

---
--- Sets the wrapping properties of an Image.
--- 
--- This function sets the way an Image is repeated when it is drawn with a Quad that is larger than the image's extent. An image may be clamped or set to repeat in both horizontal and vertical directions. Clamped images appear only once, but repeated ones repeat as many times as there is room in the Quad.
--- 
--- If you use a Quad that is larger than the image extent and do not use repeated tiling, there may be an unwanted visual effect of the image stretching all the way to fill the Quad. If this is the case, setting Image:getWrap("repeat", "repeat") for all the images to be repeated, and using Quad of appropriate size will result in the best visual appearance.
---
---@param horizontal WrapMode Horizontal wrapping mode of the image.
---@param vertical WrapMode Vertical wrapping mode of the image.
function Image.setWrap(horizontal, vertical) end

---
--- Used to create cool effects, like fire. The particle systems are created and drawn on the screen using functions in love.graphics. They also need to be updated in the update(dt) callback for you to see any changes in the particles emitted.
---@class ParticleSystem
ParticleSystem = {}

---
--- Creates an identical copy of the ParticleSystem in the stopped state.
--- 
--- Cloned ParticleSystem inherit all the set-able state of the original ParticleSystem, but they are initialized stopped.
---
--- returns:
---     ParticleSystem particlesystem - The new identical copy of this ParticleSystem.
---@return ParticleSystem
function ParticleSystem.clone() end

---
--- Emits a burst of particles from the particle emitter.
---
---@param numparticles number The amount of particles to emit. The number of emitted particles will be truncated if the particle system's max buffer size is reached.
function ParticleSystem.emit(numparticles) end

---
--- Gets the amount of particles that are currently in the system.
---
--- returns:
---     number count - The current number of live particles.
---@return number
function ParticleSystem.getCount() end

---
--- Gets the area-based spawn parameters for the particles.
---
--- returns:
---     AreaSpreadDistribution distribution - The type of distribution for new particles.
---     number dx - The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.
---     number dy - The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.
---@return AreaSpreadDistribution, number, number
function ParticleSystem.getAreaSpread() end

---
--- Gets the size of the buffer (the max allowed amount of particles in the system).
---
--- returns:
---     number buffer - The buffer size.
---@return number
function ParticleSystem.getBufferSize() end

---
--- Gets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle's lifetime. Color modulation needs to be activated for this function to have any effect.
--- 
--- Arguments are passed in groups of four, representing the components of the desired RGBA value. At least one color must be specified. A maximum of eight may be used.
---
--- returns:
---     number r1 - First color, red component (0-255).
---     number g1 - First color, green component (0-255).
---     number b1 - First color, blue component (0-255).
---     number a1 - First color, alpha component (0-255).
---     number r2 - Second color, red component (0-255).
---     number g2 - Second color, green component (0-255).
---     number b2 - Second color, blue component (0-255).
---     number a2 - Second color, alpha component (0-255).
---     number ... - Etc.
---@return number, number, number, number, number, number, number, number, number
function ParticleSystem.getColors() end

---
--- Gets the direction the particles will be emitted in.
---
--- returns:
---     number direction - The direction of the particles (in radians).
---@return number
function ParticleSystem.getDirection() end

---
--- Gets the amount of particles emitted per second.
---
--- returns:
---     number rate - The amount of particles per second.
---@return number
function ParticleSystem.getEmissionRate() end

---
--- Gets the mode to use when the ParticleSystem adds new particles.
---
--- returns:
---     ParticleInsertMode mode - The mode to use when the ParticleSystem adds new particles.
---@return ParticleInsertMode
function ParticleSystem.getInsertMode() end

---
--- Gets the linear acceleration (acceleration along the x and y axes) for particles.
--- 
--- Every particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.
---
--- returns:
---     number xmin - The minimum acceleration along the x axis.
---     number ymin - The minimum acceleration along the y axis.
---     number xmax - The maximum acceleration along the x axis.
---     number ymax - The maximum acceleration along the y axis.
---@return number, number, number, number
function ParticleSystem.getLinearAcceleration() end

---
--- Gets the amount of linear damping (constant deceleration) for particles.
---
--- returns:
---     number min - The minimum amount of linear damping applied to particles.
---     number max - The maximum amount of linear damping applied to particles.
---@return number, number
function ParticleSystem.getLinearDamping() end

---
--- Gets how long the particle system should emit particles (if -1 then it emits particles forever).
---
--- returns:
---     number life - The lifetime of the emitter (in seconds).
---@return number
function ParticleSystem.getEmitterLifetime() end

---
--- Get the offget position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.
---
--- returns:
---     number x - The x coordinate of the rotation offget.
---     number y - The y coordinate of the rotation offget.
---@return number, number
function ParticleSystem.getOffset() end

---
--- Gets the life of the particles.
---
--- returns:
---     number min - The minimum life of the particles (seconds).
---     number max - The maximum life of the particles (seconds).
---@return number, number
function ParticleSystem.getParticleLifetime() end

---
--- Gets the series of Quads used for the particle sprites.
---
--- returns:
---     table quads - A table containing the Quads used.
---@return table
function ParticleSystem.getQuads() end

---
--- Gets the position of the emitter.
---
--- returns:
---     number x - Position along x-axis.
---     number y - Position along y-axis.
---@return number, number
function ParticleSystem.getPosition() end

---
--- Get the radial acceleration (away from the emitter).
---
--- returns:
---     number min - The minimum acceleration.
---     number max - The maximum acceleration.
---@return number, number
function ParticleSystem.getRadialAcceleration() end

---
--- Gets the rotation of the image upon particle creation (in radians).
---
--- returns:
---     number min - The minimum initial angle (radians).
---     number max - The maximum initial angle (radians).
---@return number, number
function ParticleSystem.getRotation() end

---
--- Gets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle's lifetime.
--- 
--- At least one size must be specified. A maximum of eight may be used.
---
--- returns:
---     number size1 - The first size.
---     number size2 - The second size.
---     number ... - Etc.
---@return number, number, number
function ParticleSystem.getSizes() end

---
--- Gets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
---
--- returns:
---     number variation - The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
---@return number
function ParticleSystem.getSizeVariation() end

---
--- Gets the speed of the particles.
---
--- returns:
---     number min - The minimum linear speed of the particles.
---     number max - The maximum linear speed of the particles.
---@return number, number
function ParticleSystem.getSpeed() end

---
--- Gets the spin of the sprite.
---
--- returns:
---     number min - The minimum spin (radians per second).
---     number max - The maximum spin (radians per second).
---@return number, number
function ParticleSystem.getSpin() end

---
--- Gets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
---
--- returns:
---     number variation - The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
---@return number
function ParticleSystem.getSpinVariation() end

---
--- Gets the amount of spread for the system.
---
--- returns:
---     number spread - The amount of spread (radians).
---@return number
function ParticleSystem.getSpread() end

---
--- Gets the Image or Canvas which is to be emitted.
---
--- returns:
---     Texture texture - An Image or Canvas to use for the particle.
---@return Texture
function ParticleSystem.getTexture() end

---
--- Gets the tangential acceleration (acceleration perpendicular to the particle's direction).
---
--- returns:
---     number min - The minimum acceleration.
---     number max - The maximum acceleration.
---@return number, number
function ParticleSystem.getTangentialAcceleration() end

---
--- Gets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.
---
--- returns:
---     boolean enabled - True if relative particle rotation is enabled, false if it's disabled.
---@return boolean
function ParticleSystem.hasRelativeRotation() end

---
--- Checks whether the particle system is actively emitting particles.
---
--- returns:
---     boolean active - True if system is active, false otherwise.
---@return boolean
function ParticleSystem.isActive() end

---
--- Checks whether the particle system is paused.
---
--- returns:
---     boolean paused - True if system is paused, false otherwise.
---@return boolean
function ParticleSystem.isPaused() end

---
--- Checks whether the particle system is stopped.
---
--- returns:
---     boolean stopped - True if system is stopped, false otherwise.
---@return boolean
function ParticleSystem.isStopped() end

---
--- Moves the position of the emitter. This results in smoother particle spawning behaviour than if ParticleSystem:setPosition is used every frame.
---
---@param x number Position along x-axis.
---@param y number Position along y-axis.
function ParticleSystem.moveTo(x, y) end

---
--- Pauses the particle emitter.
---
function ParticleSystem.pause() end

---
--- Resets the particle emitter, removing any existing particles and resetting the lifetime counter.
---
function ParticleSystem.reset() end

---
--- Sets area-based spawn parameters for the particles. Newly created particles will spawn in an area around the emitter based on the parameters to this function.
---
---@param distribution AreaSpreadDistribution The type of distribution for new particles.
---@param dx number The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution.
---@param dy number The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution.
function ParticleSystem.setAreaSpread(distribution, dx, dy) end

---
--- Sets the size of the buffer (the max allowed amount of particles in the system).
---
---@param buffer number The buffer size.
function ParticleSystem.setBufferSize(buffer) end

---
--- Sets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle's lifetime. Color modulation needs to be activated for this function to have any effect.
--- 
--- Arguments are passed in groups of four, representing the components of the desired RGBA value. At least one color must be specified. A maximum of eight may be used.
---
---@param r1 number First color, red component (0-255).
---@param g1 number First color, green component (0-255).
---@param b1 number First color, blue component (0-255).
---@param a1 number First color, alpha component (0-255).
---@param r2 number Second color, red component (0-255).
---@param g2 number Second color, green component (0-255).
---@param b2 number Second color, blue component (0-255).
---@param a2 number Second color, alpha component (0-255).
---@param ... number Etc.
function ParticleSystem.setColors(r1, g1, b1, a1, r2, g2, b2, a2, ...) end

---
--- Sets the direction the particles will be emitted in.
---
---@param direction number The direction of the particles (in radians).
function ParticleSystem.setDirection(direction) end

---
--- Sets the amount of particles emitted per second.
---
---@param rate number The amount of particles per second.
function ParticleSystem.setEmissionRate(rate) end

---
--- Sets how long the particle system should emit particles (if -1 then it emits particles forever).
---
---@param life number The lifetime of the emitter (in seconds).
function ParticleSystem.setEmitterLifetime(life) end

---
--- Sets the mode to use when the ParticleSystem adds new particles.
---
---@param mode ParticleInsertMode The mode to use when the ParticleSystem adds new particles.
function ParticleSystem.setInsertMode(mode) end

---
--- Sets the linear acceleration (acceleration along the x and y axes) for particles.
--- 
--- Every particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.
---
---@param xmin number The minimum acceleration along the x axis.
---@param ymin number The minimum acceleration along the y axis.
---@param xmax number The maximum acceleration along the x axis.
---@param ymax number The maximum acceleration along the y axis.
function ParticleSystem.setLinearAcceleration(xmin, ymin, xmax, ymax) end

---
--- Sets the amount of linear damping (constant deceleration) for particles.
---
---@param min number The minimum amount of linear damping applied to particles.
---@param max number The maximum amount of linear damping applied to particles.
function ParticleSystem.setLinearDamping(min, max) end

---
--- Set the offset position which the particle sprite is rotated around. If this function is not used, the particles rotate around their center.
---
---@param x number The x coordinate of the rotation offset.
---@param y number The y coordinate of the rotation offset.
function ParticleSystem.setOffset(x, y) end

---
--- Sets the life of the particles.
---
---@param min number The minimum life of the particles (seconds).
---@param max number The maximum life of the particles (seconds).
function ParticleSystem.setParticleLifetime(min, max) end

---
--- Sets the position of the emitter.
---
---@param x number Position along x-axis.
---@param y number Position along y-axis.
function ParticleSystem.setPosition(x, y) end

---
--- Sets a series of Quads to use for the particle sprites. Particles will choose a Quad from the list based on the particle's current lifetime, allowing for the use of animated sprite sheets with ParticleSystems.
---
---@param quad1 Quad The first Quad to use.
---@param quad2 Quad The second Quad to use.
function ParticleSystem.setQuads(quad1, quad2) end

---@param quads table A table containing the Quads to use.
function ParticleSystem.setQuads(quads) end

---
--- Set the radial acceleration (away from the emitter).
---
---@param min number The minimum acceleration.
---@param max number The maximum acceleration.
function ParticleSystem.setRadialAcceleration(min, max) end

---
--- Sets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.
---
---@param enable boolean True to enable relative particle rotation, false to disable it.
function ParticleSystem.setRelativeRotation(enable) end

---
--- Sets the rotation of the image upon particle creation (in radians).
---
---@param min number The minimum initial angle (radians).
---@param max number The maximum initial angle (radians).
function ParticleSystem.setRotation(min, max) end

---
--- Sets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle's lifetime.
--- 
--- At least one size must be specified. A maximum of eight may be used.
---
---@param size1 number The first size.
---@param size2 number The second size.
---@param ... number Etc.
function ParticleSystem.setSizes(size1, size2, ...) end

---
--- Sets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
---
---@param variation number The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
function ParticleSystem.setSizeVariation(variation) end

---
--- Sets the speed of the particles.
---
---@param min number The minimum linear speed of the particles.
---@param max number The maximum linear speed of the particles.
function ParticleSystem.setSpeed(min, max) end

---
--- Sets the spin of the sprite.
---
---@param min number The minimum spin (radians per second).
---@param max number The maximum spin (radians per second).
function ParticleSystem.setSpin(min, max) end

---
--- Sets the degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
---
---@param variation number The degree of variation (0 meaning no variation and 1 meaning full variation between start and end).
function ParticleSystem.setSpinVariation(variation) end

---
--- Sets the amount of spread for the system.
---
---@param spread number The amount of spread (radians).
function ParticleSystem.setSpread(spread) end

---
--- Sets the Image or Canvas which is to be emitted.
---
---@param texture Texture An Image or Canvas to use for the particle.
function ParticleSystem.setTexture(texture) end

---
--- Sets the tangential acceleration (acceleration perpendicular to the particle's direction).
---
---@param min number The minimum acceleration.
---@param max number The maximum acceleration.
function ParticleSystem.setTangentialAcceleration(min, max) end

---
--- Starts the particle emitter.
---
function ParticleSystem.start() end

---
--- Stops the particle emitter, resetting the lifetime counter.
---
function ParticleSystem.stop() end

---
--- Updates the particle system; moving, creating and killing particles.
---
---@param dt number The time (seconds) since last frame.
function ParticleSystem.update(dt) end

---
--- A quadrilateral (a polygon with four sides and four corners) with texture coordinate information.
--- 
--- Quads can be used to select part of a texture to draw. In this way, one large texture atlas can be loaded, and then split up into sub-images.
---@class Quad
Quad = {}

---
--- Gets reference texture dimensions initially specified in love.graphics.newQuad.
---
--- returns:
---     number sw - The Texture width used by the Quad.
---     number sh - The Texture height used by the Quad.
---@return number, number
function Quad.getTextureDimensions() end

---
--- Gets the current viewport of this Quad.
---
--- returns:
---     number x - The top-left corner along the x-axis.
---     number y - The top-left corner along the y-axis.
---     number w - The width of the viewport.
---     number h - The height of the viewport.
---@return number, number, number, number
function Quad.getViewport() end

---
--- Sets the texture coordinates according to a viewport.
---
---@param x number The top-left corner along the x-axis.
---@param y number The top-right corner along the y-axis.
---@param w number The width of the viewport.
---@param h number The height of the viewport.
function Quad.setViewport(x, y, w, h) end

---
--- A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.
--- 
--- Potential uses for shaders include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, bump mapping, and much more! Here is a collection of basic shaders and good starting point to learn: https://github.com/vrld/shine
---@class Shader
Shader = {}

---
--- Returns any warning and error messages from compiling the shader code. This can be used for debugging your shaders if there's anything the graphics hardware doesn't like.
---
--- returns:
---     string warnings - Warning messages (if any).
---@return string
function Shader.getWarnings() end

---
--- Gets whether a uniform / extern variable exists in the Shader.
--- 
--- If a graphics driver's shader compiler determines that a uniform / extern variable doesn't affect the final output of the shader, it may optimize the variable out. This function will return false in that case.
---
---@param name string The name of the uniform variable.
--- returns:
---     boolean hasuniform - Whether the uniform exists in the shader and affects its final output.
---@return boolean
function Shader.hasUniform(name) end

---
--- Sends one or more values to a special (uniform) variable inside the shader. Uniform variables have to be marked using the uniform or extern keyword.
---
---@param name string Name of the number to send to the shader.
---@param number number Number to send to store in the uniform variable.
---@param ... number Additional numbers to send if the uniform variable is an array.
function Shader.send(name, number, ...) end

---@param name string Name of the vector to send to the shader.
---@param vector table Numbers to send to the uniform variable as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -> vec2). At least two and at most four numbers can be used.
---@param ... table Additional vectors to send if the uniform variable is an array. All vectors need to be of the same size (e.g. only vec3's).
function Shader.send(name, vector, ...) end

---@param name string Name of the matrix to send to the shader.
---@param matrix table 2x2, 3x3, or 4x4 matrix to send to the uniform variable. Using table form: {{a,b,c,d}, {e,f,g,h}, ... }.
---@param ... table Additional matrices of the same type as matrix to store in a uniform array.
function Shader.send(name, matrix, ...) end

---@param name string Name of the Texture to send to the shader.
---@param texture Texture Texture (Image or Canvas) to send to the uniform variable.
function Shader.send(name, texture) end

---@param name string Name of the boolean to send to the shader.
---@param boolean boolean Boolean to send to store in the uniform variable.
---@param ... boolean Additional booleans to send if the uniform variable is an array.
function Shader.send(name, boolean, ...) end

---
--- Sends one or more colors to a special (extern / uniform) vec3 or vec4 variable inside the shader. The color components must be in the range of [0, 255], unlike Shader:send. The colors are gamma-corrected if global gamma-correction is enabled.
---
---@param name string The name of the color extern variable to send to in the shader.
---@param color table A table with red, green, blue, and optional alpha color components in the range of [0, 255] to send to the extern as a vector.
---@param ... table Additional colors to send in case the extern is an array. All colors need to be of the same size (e.g. only vec3's).
function Shader.sendColor(name, color, ...) end

---
--- Using a single image, draw any number of identical copies of the image using a single call to love.graphics.draw. This can be used, for example, to draw repeating copies of a single background image.
--- 
--- A SpriteBatch can be even more useful when the underlying image is a Texture Atlas (a single image file containing many independent images); by adding Quad to the batch, different sub-images from within the atlas can be drawn.
---@class SpriteBatch
SpriteBatch = {}

---
--- Add a sprite to the batch.
---
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shear factor (x-axis).
---@param ky number Shear factor (y-axis).
--- returns:
---     number id - An identifier for the added sprite.
---@return number
function SpriteBatch.add(x, y, r, sx, sy, ox, oy, kx, ky) end

---@param quad Quad The Quad to add.
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shear factor (x-axis).
---@param ky number Shear factor (y-axis).
--- returns:
---     number id - An identifier for the added sprite.
---@return number
function SpriteBatch.add(quad, x, y, r, sx, sy, ox, oy, kx, ky) end

---
--- Attaches a per-vertex attribute from a Mesh onto this SpriteBatch, for use when drawing. This can be combined with a Shader to augment a SpriteBatch with per-vertex or additional per-sprite information instead of just having per-sprite colors.
--- 
--- Each sprite in a SpriteBatch has 4 vertices in the following order: top-left, bottom-left, top-right, bottom-right. The index returned by SpriteBatch:add (and used by SpriteBatch:set) can used to determine the first vertex of a specific sprite with the formula "1 + 4 * ( id - 1 )".
---
---@param name string The name of the vertex attribute to attach.
---@param mesh Mesh The Mesh to get the vertex attribute from.
function SpriteBatch.attachAttribute(name, mesh) end

---
--- Removes all sprites from the buffer.
---
function SpriteBatch.clear() end

---
--- Immediately sends all new and modified sprite data in the batch to the graphics card.
---
function SpriteBatch.flush() end

---
--- Gets the maximum number of sprites the SpriteBatch can hold.
---
--- returns:
---     number size - The maximum number of sprites the batch can hold.
---@return number
function SpriteBatch.getBufferSize() end

---
--- Gets the color that will be used for the next add and set operations.
--- 
--- If no color has been set with SpriteBatch:setColor or the current SpriteBatch color has been cleared, this method will return nil.
---
--- returns:
---     number r - The red component (0-255).
---     number g - The green component (0-255).
---     number b - The blue component (0-255).
---     number a - The alpha component (0-255).
---@return number, number, number, number
function SpriteBatch.getColor() end

---
--- Gets the amount of sprites currently in the SpriteBatch.
---
--- returns:
---     number count - The amount of sprites currently in the batch.
---@return number
function SpriteBatch.getCount() end

---
--- Returns the Image or Canvas used by the SpriteBatch.
---
--- returns:
---     Texture texture - The Image or Canvas for the sprites.
---@return Texture
function SpriteBatch.getTexture() end

---
--- Changes a sprite in the batch. This requires the identifier returned by add and addq.
---
---@param id number The identifier of the sprite that will be changed.
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shear factor (x-axis).
---@param ky number Shear factor (y-axis).
function SpriteBatch.set(id, x, y, r, sx, sy, ox, oy, kx, ky) end

---@param id number The identifier of the sprite that will be changed.
---@param quad Quad The quad used on the image of the batch.
---@param x number The position to draw the object (x-axis).
---@param y number The position to draw the object (y-axis).
---@param r number Orientation (radians).
---@param sx number Scale factor (x-axis).
---@param sy number Scale factor (y-axis).
---@param ox number Origin offset (x-axis).
---@param oy number Origin offset (y-axis).
---@param kx number Shear factor (x-axis).
---@param ky number Shear factor (y-axis).
function SpriteBatch.set(id, quad, x, y, r, sx, sy, ox, oy, kx, ky) end

---
--- Sets the color that will be used for the next add and set operations. Calling the function without arguments will clear the color.
--- 
--- In version [[0.9.2]] and older, the global color set with love.graphics.setColor will not work on the SpriteBatch if any of the sprites has its own color.
---
---@param r number The amount of red.
---@param g number The amount of green.
---@param b number The amount of blue.
---@param a number The amount of alpha.
function SpriteBatch.setColor(r, g, b, a) end

function SpriteBatch.setColor() end

---
--- Restricts the drawn sprites in the SpriteBatch to a subset of the total.
---
---@param start number The index of the first sprite to draw. Index 1 corresponds to the first sprite added with SpriteBatch:add.
---@param count number The number of sprites to draw.
function SpriteBatch.setDrawRange(start, count) end

function SpriteBatch.setDrawRange() end

---
--- Replaces the Image or Canvas used for the sprites.
---
---@param texture Texture The new Image or Canvas to use for the sprites.
function SpriteBatch.setTexture(texture) end

---
--- Drawable text.
---@class Text
Text = {}

---
--- Adds additional colored text to the Text object at the specified position.
---
---@param textstring string The text to add to the object.
---@param x number The position of the new text on the x-axis.
---@param y number The position of the new text on the y-axis.
---@param angle number The orientation of the new text in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
--- returns:
---     number index - An index number that can be used with Text:getWidth or Text:getHeight.
---@return number
function Text.add(textstring, x, y, angle, sx, sy, ox, oy, kx, ky) end

---@param coloredtext table A table containing colors and strings to use as the new text, in the form of { color1, string1, color2, string2, ... }.
---@param x number The position of the new text on the x-axis.
---@param y number The position of the new text on the y-axis.
---@param angle number The orientation of the new text in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
--- returns:
---     number index - An index number that can be used with Text:getWidth or Text:getHeight.
---@return number
function Text.add(coloredtext, x, y, angle, sx, sy, ox, oy, kx, ky) end

---
--- Adds additional formatted / colored text to the Text object at the specified position.
---
---@param textstring string The text to add to the object.
---@param wraplimit number The maximum width in pixels of the text before it gets automatically wrapped to a new line.
---@param align AlignMode The alignment of the text.
---@param x number The position of the new text on the x-axis.
---@param y number The position of the new text on the y-axis.
---@param angle number The orientation of the object in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
--- returns:
---     number index - An index number that can be used with Text:getWidth or Text:getHeight.
---@return number
function Text.addf(textstring, wraplimit, align, x, y, angle, sx, sy, ox, oy, kx, ky) end

---@param coloredtext table A table containing colors and strings to use as the new text, in the form of { color1, string1, color2, string2, ... }.
---@param wraplimit number The maximum width in pixels of the text before it gets automatically wrapped to a new line.
---@param align AlignMode The alignment of the text.
---@param x number The position of the new text on the x-axis.
---@param y number The position of the new text on the y-axis.
---@param angle number The orientation of the object in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
--- returns:
---     number index - An index number that can be used with Text:getWidth or Text:getHeight.
---@return number
function Text.addf(coloredtext, wraplimit, align, x, y, angle, sx, sy, ox, oy, kx, ky) end

---
--- Clears the contents of the Text object.
---
function Text.clear() end

---
--- Gets the width and height of the text in pixels.
---
--- returns:
---     number width - The width of the text. If multiple sub-strings have been added with Text:add, the width of the last sub-string is returned.
---     number height - The height of the text. If multiple sub-strings have been added with Text:add, the height of the last sub-string is returned.
---@return number, number
function Text.getDimensions() end

---@param index number An index number returned by Text:add or Text:addf.
--- returns:
---     number width - The width of the sub-string (before scaling and other transformations).
---     number height - The height of the sub-string (before scaling and other transformations).
---@return number, number
function Text.getDimensions(index) end

---
--- Gets the Font used with the Text object.
---
--- returns:
---     Font font - The font used with this Text object.
---@return Font
function Text.getFont() end

---
--- Gets the height of the text in pixels.
---
--- returns:
---     number height - The height of the text. If multiple sub-strings have been added with Text:add, the height of the last sub-string is returned.
---@return number
function Text.getHeight() end

---@param index number An index number returned by Text:add or Text:addf.
--- returns:
---     number height - The height of the sub-string (before scaling and other transformations).
---@return number
function Text.getHeight(index) end

---
--- Gets the width of the text in pixels.
---
--- returns:
---     number width - The width of the text. If multiple sub-strings have been added with Text:add, the width of the last sub-string is returned.
---@return number
function Text.getWidth() end

---@param index number An index number returned by Text:add or Text:addf.
--- returns:
---     number width - The width of the sub-string (before scaling and other transformations).
---@return number
function Text.getWidth(index) end

---
--- Replaces the contents of the Text object with a new unformatted string.
---
---@param textstring string The new string of text to use.
function Text.set(textstring) end

---@param coloredtext table A table containing colors and strings to use as the new text, in the form of { color1, string1, color2, string2, ... }.
function Text.set(coloredtext) end

---
--- Replaces the contents of the Text object with a new formatted string.
---
---@param textstring string The new string of text to use.
---@param wraplimit number The maximum width in pixels of the text before it gets automatically wrapped to a new line.
---@param align AlignMode The alignment of the text.
function Text.setf(textstring, wraplimit, align) end

---@param coloredtext table A table containing colors and strings to use as the new text, in the form of { color1, string1, color2, string2, ... }.
---@param wraplimit number The maximum width in pixels of the text before it gets automatically wrapped to a new line.
---@param align AlignMode The alignment of the text.
function Text.setf(coloredtext, wraplimit, align) end

function Text.setf() end

---
--- Replaces the Font used with the text.
---
---@param font Font The new font to use with this Text object.
function Text.setFont(font) end

---
--- Superclass for drawable objects which represent a texture. All Textures can be drawn with Quads. This is an abstract type that can't be created directly.
---@class Texture
Texture = {}

---
--- Gets the depth of a Volume Texture. Returns 1 for 2D, Cubemap, and Array textures.
---
--- returns:
---     number depth - The depth of the volume Texture.
---@return number
function Texture.getDepth() end

---
--- Gets the PixelFormat of the Texture.
---
--- returns:
---     PixelFormat format - The pixel format the Texture was created with.
---@return PixelFormat
function Texture.getFormat() end

---
--- Gets the number of layers / slices in an Array Texture. Returns 1 for 2D, Cubemap, and Volume textures.
---
--- returns:
---     number layers - The number of layers in the Array Texture.
---@return number
function Texture.getLayerCount() end

---
--- Gets the number of mipmaps contained in the Texture. If the texture was not created with mipmaps, it will return 1.
---
--- returns:
---     number mipmaps - The number of mipmaps in the Texture.
---@return number
function Texture.getMipmapCount() end

---
--- Gets the type of the Texture.
---
--- returns:
---     TextureType texturetype - The type of the Texture.
---@return TextureType
function Texture.getTextureType() end

---
--- Gets whether the Texture can be drawn and sent to a Shader.
--- 
--- Canvases created with stencil and/or depth PixelFormats are not readable by default, unless readable=true is specified in the settings table passed into love.graphics.newCanvas.
--- 
--- Non-readable Canvases can still be rendered to.
---
--- returns:
---     boolean readable - Whether the Texture is readable.
---@return boolean
function Texture.isReadable() end

---
--- A drawable video.
---@class Video
Video = {}

---
--- Gets the width and height of the Video in pixels.
---
--- returns:
---     number width - The width of the Video.
---     number height - The height of the video.
---@return number, number
function Video.getDimensions() end

---
--- Gets the scaling filters used when drawing the Video.
---
--- returns:
---     FilterMode min - The filter mode used when scaling the Video down.
---     FilterMode mag - The filter mode used when scaling the Video up.
---     number anisotropy - Maximum amount of anisotropic filtering used.
---@return FilterMode, FilterMode, number
function Video.getFilter() end

---
--- Gets the height of the Video in pixels.
---
--- returns:
---     number height - The height of the Video.
---@return number
function Video.getHeight() end

---
--- Gets the audio Source used for playing back the video's audio. May return nil if the video has no audio, or if Video:setSource is called with a nil argument.
---
--- returns:
---     Source source - The audio Source used for audio playback, or nil if the video has no audio.
---@return Source
function Video.getSource() end

---
--- Gets the VideoStream object used for decoding and controlling the video.
---
--- returns:
---     VideoStream stream - The VideoStream used for decoding and controlling the video.
---@return VideoStream
function Video.getStream() end

---
--- Gets the width of the Video in pixels.
---
--- returns:
---     number width - The width of the Video.
---@return number
function Video.getWidth() end

---
--- Gets whether the Video is currently playing.
---
--- returns:
---     boolean playing - Whether the video is playing.
---@return boolean
function Video.isPlaying() end

---
--- Pauses the Video.
---
function Video.pause() end

---
--- Starts playing the Video. In order for the video to appear onscreen it must be drawn with love.graphics.draw.
---
function Video.play() end

---
--- Rewinds the Video to the beginning.
---
function Video.rewind() end

---
--- Sets the current playback position of the Video.
---
---@param offset number The time in seconds since the beginning of the Video.
function Video.seek(offset) end

---
--- Sets the scaling filters used when drawing the Video.
---
---@param min FilterMode The filter mode used when scaling the Video down.
---@param mag FilterMode The filter mode used when scaling the Video up.
---@param anisotropy number Maximum amount of anisotropic filtering used.
function Video.setFilter(min, mag, anisotropy) end

---
--- Sets the audio Source used for playing back the video's audio. The audio Source also controls playback speed and synchronization.
---
---@param source Source The audio Source used for audio playback, or nil to disable audio synchronization.
function Video.setSource(source) end

---
--- Gets the current playback position of the Video.
---
---@param seconds number The time in seconds since the beginning of the Video.
function Video.tell(seconds) end

---
--- Provides an interface to decode encoded image data.
---
local image = {}
love.image = image

---
--- Determines whether a file can be loaded as CompressedImageData.
---
---@param filename string The filename of the potentially compressed image file.
--- returns:
---     boolean compressed - Whether the file can be loaded as CompressedImageData or not.
---@return boolean
function image.isCompressed(filename) end

---@param fileData FileData A FileData potentially containing a compressed image.
--- returns:
---     boolean compressed - Whether the FileData can be loaded as CompressedImageData or not.
---@return boolean
function image.isCompressed(fileData) end

---
--- Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.
---
---@param filename string The filename of the compressed image file.
--- returns:
---     CompressedImageData compressedImageData - The new CompressedImageData object.
---@return CompressedImageData
function image.newCompressedData(filename) end

---@param fileData FileData A FileData containing a compressed image.
--- returns:
---     CompressedImageData compressedImageData - The new CompressedImageData object.
---@return CompressedImageData
function image.newCompressedData(fileData) end

---
--- Create a new ImageData object.
---
---@param width number The width of the ImageData.
---@param height number The height of the ImageData.
--- returns:
---     ImageData imageData - The new blank ImageData object. Each pixel's color values, (including the alpha values!) will be set to zero.
---@return ImageData
function image.newImageData(width, height) end

---@param width number The width of the ImageData.
---@param height number The height of the ImageData.
---@param data string The data to load into the ImageData (RGBA bytes, left to right and top to bottom).
--- returns:
---     ImageData imageData - The new ImageData object.
---@return ImageData
function image.newImageData(width, height, data) end

---@param filename string The filename of the image file.
--- returns:
---     ImageData imageData - The new ImageData object.
---@return ImageData
function image.newImageData(filename) end

---@param filedata FileData The encoded file data to decode into image data.
--- returns:
---     ImageData imageData - The new ImageData object.
---@return ImageData
function image.newImageData(filedata) end

---
--- Represents compressed image data designed to stay compressed in RAM.
--- 
--- CompressedImageData encompasses standard compressed texture formats such as DXT1, DXT5, and BC5 / 3Dc.
--- 
--- You can't draw CompressedImageData directly to the screen. See Image for that.
---@class CompressedImageData
CompressedImageData = {}

---
--- Gets the width and height of the CompressedImageData.
---
--- returns:
---     number width - The width of the CompressedImageData.
---     number height - The height of the CompressedImageData.
---@return number, number
function CompressedImageData.getDimensions() end

---@param level number A mipmap level. Must be in the range of [1, CompressedImageData:getMipmapCount()].
--- returns:
---     number width - The width of the CompressedImageData.
---     number height - The height of the CompressedImageData.
---@return number, number
function CompressedImageData.getDimensions(level) end

---
--- Gets the format of the CompressedImageData.
---
--- returns:
---     CompressedImageFormat format - The format of the CompressedImageData.
---@return CompressedImageFormat
function CompressedImageData.getFormat() end

---
--- Gets the height of the CompressedImageData.
---
--- returns:
---     number height - The height of the CompressedImageData.
---@return number
function CompressedImageData.getHeight() end

---@param level number A mipmap level. Must be in the range of [1,  CompressedImageData:getMipmapCount()].
--- returns:
---     number height - The height of the CompressedImageData.
---@return number
function CompressedImageData.getHeight(level) end

---
--- Gets the number of mipmap levels in the CompressedImageData. The base mipmap level (original image) is included in the count.
---
--- returns:
---     number mipmaps - The number of mipmap levels stored in the CompressedImageData.
---@return number
function CompressedImageData.getMipmapCount() end

---
--- Gets the width of the CompressedImageData.
---
--- returns:
---     number width - The width of the CompressedImageData.
---@return number
function CompressedImageData.getWidth() end

---@param level number A mipmap level. Must be in the range of [1, CompressedImageData:getMipmapCount()].
--- returns:
---     number width - The width of the CompressedImageData.
---@return number
function CompressedImageData.getWidth(level) end

---
--- Raw (decoded) image data.
--- 
--- You can't draw ImageData directly to screen. See Image for that.
---@class ImageData
ImageData = {}

---
--- Encodes the ImageData and optionally writes it to the save directory.
---
---@param format ImageFormat The format to encode the image as.
---@param filename string The filename to write the file to. If nil, no file will be written but the FileData will still be returned.
--- returns:
---     FileData filedata - The encoded image as a new FileData object.
---@return FileData
function ImageData.encode(format, filename) end

---
--- Gets the width and height of the ImageData in pixels.
---
--- returns:
---     number width - The width of the ImageData in pixels.
---     number height - The height of the ImageData in pixels.
---@return number, number
function ImageData.getDimensions() end

---
--- Gets the height of the ImageData in pixels.
---
--- returns:
---     number height - The height of the ImageData in pixels.
---@return number
function ImageData.getHeight() end

---
--- Gets the color of a pixel at a specific position in the image.
--- 
--- Valid x and y values start at 0 and go up to image width and height minus 1. Non-integer values are floored.
---
---@param x number The position of the pixel on the x-axis.
---@param y number The position of the pixel on the y-axis.
--- returns:
---     number r - The red component (0-255).
---     number g - The green component (0-255).
---     number b - The blue component (0-255).
---     number a - The alpha component (0-255).
---@return number, number, number, number
function ImageData.getPixel(x, y) end

---
--- Gets the width of the ImageData in pixels.
---
--- returns:
---     number width - The width of the ImageData in pixels.
---@return number
function ImageData.getWidth() end

---
--- Transform an image by applying a function to every pixel.
--- 
--- This function is a higher order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.
--- 
--- The function parameter is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function parameter can return up to four number values, which become the new r, g, b and a values of the pixel. If the function returns fewer values, the remaining components are set to 0.
---
---@param pixelFunction function Function parameter to apply to every pixel.
function ImageData.mapPixel(pixelFunction) end

---
--- Paste into ImageData from another source ImageData.
---
---@param source ImageData Source ImageData from which to copy.
---@param dx number Destination top-left position on x-axis.
---@param dy number Destination top-left position on y-axis.
---@param sx number Source top-left position on x-axis.
---@param sy number Source top-left position on y-axis.
---@param sw number Source width.
---@param sh number Source height.
function ImageData.paste(source, dx, dy, sx, sy, sw, sh) end

---
--- Sets the color of a pixel at a specific position in the image.
--- 
--- Valid x and y values start at 0 and go up to image width and height minus 1.
---
---@param x number The position of the pixel on the x-axis.
---@param y number The position of the pixel on the y-axis.
---@param r number The red component (0-255).
---@param g number The green component (0-255).
---@param b number The blue component (0-255).
---@param a number The alpha component (0-255).
function ImageData.setPixel(x, y, r, g, b, a) end

---
--- Provides an interface to the user's joystick.
---
local joystick = {}
love.joystick = joystick

---
--- Gets the number of connected joysticks.
---
--- returns:
---     number joystickcount - The number of connected joysticks.
---@return number
function joystick.getJoystickCount() end

---
--- Gets a list of connected Joysticks.
---
--- returns:
---     table joysticks - The list of currently connected Joysticks.
---@return table
function joystick.getJoysticks() end

---
--- Loads a gamepad mappings string or file created with love.joystick.saveGamepadMappings.
---
---@param filename string The filename to load the mappings string from.
function joystick.loadGamepadMappings(filename) end

---@param mappings string The mappings string to load.
function joystick.loadGamepadMappings(mappings) end

---
--- Saves the virtual gamepad mappings of all Joysticks that are recognized as gamepads and have either been recently used or their gamepad bindings have been modified.
---
---@param filename string The filename to save the mappings string to.
--- returns:
---     string mappings - The mappings string that was written to the file.
---@return string
function joystick.saveGamepadMappings(filename) end

--- returns:
---     string mappings - The mappings string.
---@return string
function joystick.saveGamepadMappings() end

---
--- Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for all Dualshock 3 controllers used with the game when run in OS X.
--- 
--- LÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren't recognized as gamepads by default.
--- 
--- The virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.
---
---@param guid string The OS-dependent GUID for the type of Joystick the binding will affect.
---@param button GamepadButton The virtual gamepad button to bind.
---@param inputtype JoystickInputType The type of input to bind the virtual gamepad button to.
---@param inputindex number The index of the axis, button, or hat to bind the virtual gamepad button to.
---@param hatdirection JoystickHat The direction of the hat, if the virtual gamepad button will be bound to a hat. nil otherwise.
--- returns:
---     boolean success - Whether the virtual gamepad button was successfully bound.
---@return boolean
function joystick.setGamepadMapping(guid, button, inputtype, inputindex, hatdirection) end

---@param guid string The OS-dependent GUID for the type of Joystick the binding will affect.
---@param axis GamepadAxis The virtual gamepad axis to bind.
---@param inputtype JoystickInputType The type of input to bind the virtual gamepad axis to.
---@param inputindex number The index of the axis, button, or hat to bind the virtual gamepad axis to.
---@param hatdirection JoystickHat The direction of the hat, if the virtual gamepad axis will be bound to a hat. nil otherwise.
--- returns:
---     boolean success - Whether the virtual gamepad button was successfully bound.
---@return boolean
function joystick.setGamepadMapping(guid, axis, inputtype, inputindex, hatdirection) end

---
--- Represents a physical joystick.
---@class Joystick
Joystick = {}

---
--- Gets the direction of each axis.
---
--- returns:
---     number axisDir1 - Direction of axis1.
---     number axisDir2 - Direction of axis2.
---     number axisDirN - Direction of axisN.
---@return number, number, number
function Joystick.getAxes() end

---
--- Gets the direction of an axis.
---
---@param axis number The index of the axis to be checked.
--- returns:
---     number direction - Current value of the axis.
---@return number
function Joystick.getAxis(axis) end

---
--- Gets the number of axes on the joystick.
---
--- returns:
---     number axes - The number of axes available.
---@return number
function Joystick.getAxisCount() end

---
--- Gets the number of buttons on the joystick.
---
--- returns:
---     number buttons - The number of buttons available.
---@return number
function Joystick.getButtonCount() end

---
--- Gets a stable GUID unique to the type of the physical joystick which does not change over time. For example, all Sony Dualshock 3 controllers in OS X have the same GUID. The value is platform-dependent.
---
--- returns:
---     string guid - The Joystick type's OS-dependent unique identifier.
---@return string
function Joystick.getGUID() end

---
--- Gets the direction of a virtual gamepad axis. If the Joystick isn't recognized as a gamepad or isn't connected, this function will always return 0.
---
---@param axis GamepadAxis The virtual axis to be checked.
--- returns:
---     number direction - Current value of the axis.
---@return number
function Joystick.getGamepadAxis(axis) end

---
--- Gets the button, axis or hat that a virtual gamepad input is bound to.
---
---@param axis GamepadAxis The virtual gamepad axis to get the binding for.
--- returns:
---     JoystickInputType inputtype - The type of input the virtual gamepad axis is bound to.
---     number inputindex - The index of the Joystick's button, axis or hat that the virtual gamepad axis is bound to.
---     JoystickHat hatdirection - The direction of the hat, if the virtual gamepad axis is bound to a hat. nil otherwise.
---@return JoystickInputType, number, JoystickHat
function Joystick.getGamepadMapping(axis) end

---@param button GamepadAxis The virtual gamepad button to get the binding for.
--- returns:
---     JoystickInputType inputtype - The type of input the virtual gamepad button is bound to.
---     number inputindex - The index of the Joystick's button, axis or hat that the virtual gamepad button is bound to.
---     JoystickHat hatdirection - The direction of the hat, if the virtual gamepad button is bound to a hat. nil otherwise.
---@return JoystickInputType, number, JoystickHat
function Joystick.getGamepadMapping(button) end

---
--- Gets the direction of the Joystick's hat.
---
---@param hat number The index of the hat to be checked.
--- returns:
---     JoystickHat direction - The direction the hat is pushed.
---@return JoystickHat
function Joystick.getHat(hat) end

---
--- Gets the number of hats on the joystick.
---
--- returns:
---     number hats - How many hats the joystick has.
---@return number
function Joystick.getHatCount() end

---
--- Gets the joystick's unique identifier. The identifier will remain the same for the life of the game, even when the Joystick is disconnected and reconnected, but it will change when the game is re-launched.
---
--- returns:
---     number id - The Joystick's unique identifier. Remains the same as long as the game is running.
---     number instanceid - Unique instance identifier. Changes every time the Joystick is reconnected. nil if the Joystick is not connected.
---@return number, number
function Joystick.getID() end

---
--- Gets the name of the joystick.
---
--- returns:
---     string name - The name of the joystick.
---@return string
function Joystick.getName() end

---
--- Gets the current vibration motor strengths on a Joystick with rumble support.
---
--- returns:
---     number left - Current strength of the left vibration motor on the Joystick.
---     number right - Current strength of the right vibration motor on the Joystick.
---@return number, number
function Joystick.getVibration() end

---
--- Gets whether the Joystick is connected.
---
--- returns:
---     boolean connected - True if the Joystick is currently connected, false otherwise.
---@return boolean
function Joystick.isConnected() end

---
--- Checks if a button on the Joystick is pressed.
--- 
--- LÖVE 0.9.0 had a bug which required the button indices passed to Joystick:isDown to be 0-based instead of 1-based, for example button 1 would be 0 for this function. It was fixed in 0.9.1.
---
---@param ... number The index of a button to check.
--- returns:
---     boolean anyDown - True if any supplied button is down, false if not.
---@return boolean
function Joystick.isDown(...) end

---
--- Gets whether the Joystick is recognized as a gamepad. If this is the case, the Joystick's buttons and axes can be used in a standardized manner across different operating systems and joystick models via Joystick:getGamepadAxis and related functions.
--- 
--- LÖVE automatically recognizes most popular controllers with a similar layout to the Xbox 360 controller as gamepads, but you can add more with love.joystick.setGamepadMapping.
---
--- returns:
---     boolean isgamepad - True if the Joystick is recognized as a gamepad, false otherwise.
---@return boolean
function Joystick.isGamepad() end

---
--- Checks if a virtual gamepad button on the Joystick is pressed. If the Joystick is not recognized as a Gamepad or isn't connected, then this function will always return false.
---
---@param ... GamepadButton The gamepad button to check.
--- returns:
---     boolean anyDown - True if any supplied button is down, false if not.
---@return boolean
function Joystick.isGamepadDown(...) end

---
--- Gets whether the Joystick supports vibration.
---
--- returns:
---     boolean supported - True if rumble / force feedback vibration is supported on this Joystick, false if not.
---@return boolean
function Joystick.isVibrationSupported() end

---
--- Sets the vibration motor speeds on a Joystick with rumble support.
---
---@param left number Strength of the left vibration motor on the Joystick. Must be in the range of [0, 1].
---@param right number Strength of the right vibration motor on the Joystick. Must be in the range of [0, 1].
--- returns:
---     boolean success - True if the vibration was successfully applied, false if not.
---@return boolean
function Joystick.setVibration(left, right) end

--- returns:
---     boolean success - True if the vibration was successfully disabled, false if not.
---@return boolean
function Joystick.setVibration() end

---@param left number Strength of the left vibration motor on the Joystick. Must be in the range of [0, 1].
---@param right number Strength of the right vibration motor on the Joystick. Must be in the range of [0, 1].
---@param duration number The duration of the vibration in seconds. A negative value means infinite duration.
--- returns:
---     boolean success - True if the vibration was successfully applied, false if not.
---@return boolean
function Joystick.setVibration(left, right, duration) end

---
--- Provides an interface to the user's keyboard.
---
local keyboard = {}
love.keyboard = keyboard

---
--- Gets the key corresponding to the given hardware scancode.
--- 
--- Unlike key constants, Scancodes are keyboard layout-independent. For example the scancode "w" will be generated if the key in the same place as the "w" key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
--- 
--- Scancodes are useful for creating default controls that have the same physical locations on on all systems.
---
---@param scancode Scancode The scancode to get the key from.
--- returns:
---     KeyConstant key - The key corresponding to the given scancode, or "unknown" if the scancode doesn't map to a KeyConstant on the current system.
---@return KeyConstant
function keyboard.getKeyFromScancode(scancode) end

---
--- Gets the hardware scancode corresponding to the given key.
--- 
--- Unlike key constants, Scancodes are keyboard layout-independent. For example the scancode "w" will be generated if the key in the same place as the "w" key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
--- 
--- Scancodes are useful for creating default controls that have the same physical locations on on all systems.
---
---@param key KeyConstant The key to get the scancode from.
--- returns:
---     Scancode scancode - The scancode corresponding to the given key, or "unknown" if the given key has no known physical representation on the current system.
---@return Scancode
function keyboard.getScancodeFromKey(key) end

---
--- Gets whether key repeat is enabled.
---
--- returns:
---     boolean enabled - Whether key repeat is enabled.
---@return boolean
function keyboard.hasKeyRepeat() end

---
--- Gets whether text input events are enabled.
---
--- returns:
---     boolean enabled - Whether text input events are enabled.
---@return boolean
function keyboard.hasTextInput() end

---
--- Checks whether a certain key is down. Not to be confused with love.keypressed or love.keyreleased.
---
---@param key KeyConstant The key to check.
--- returns:
---     boolean down - True if the key is down, false if not.
---@return boolean
function keyboard.isDown(key) end

---@param key KeyConstant A key to check.
---@param ... KeyConstant Additional keys to check.
--- returns:
---     boolean anyDown - True if any supplied key is down, false if not.
---@return boolean
function keyboard.isDown(key, ...) end

---
--- Checks whether the specified Scancodes are pressed. Not to be confused with love.keypressed or love.keyreleased.
--- 
--- Unlike regular KeyConstants, Scancodes are keyboard layout-independent. The scancode "w" is used if the key in the same place as the "w" key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
---
---@param scancode Scancode A Scancode to check.
---@param ... Scancode Additional Scancodes to check.
--- returns:
---     boolean down - True if any supplied Scancode is down, false if not.
---@return boolean
function keyboard.isScancodeDown(scancode, ...) end

---
--- Enables or disables key repeat. It is disabled by default.
--- 
--- The interval between repeats depends on the user's system settings.
---
---@param enable boolean Whether repeat keypress events should be enabled when a key is held down.
function keyboard.setKeyRepeat(enable) end

---
--- Enables or disables text input events. It is enabled by default on Windows, Mac, and Linux, and disabled by default on iOS and Android.
---
---@param enable boolean Whether text input events should be enabled.
function keyboard.setTextInput(enable) end

---@param enable boolean Whether text input events should be enabled.
---@param x number On-screen keyboard x position.
---@param y number On-screen keyboard y position.
---@param w number On-screen keyboard width.
---@param h number On-screen keyboard height.
function keyboard.setTextInput(enable, x, y, w, h) end

---
--- Provides system-independent mathematical functions.
---
local math = {}
love.math = math

---
--- Compresses a string or data using a specific compression algorithm.
---
---@param rawstring string The raw (un-compressed) string to compress.
---@param format CompressedDataFormat The format to use when compressing the string.
---@param level number The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.
--- returns:
---     CompressedData compressedData - A new Data object containing the compressed version of the string.
---@return CompressedData
function math.compress(rawstring, format, level) end

---@param data Data A Data object containing the raw (un-compressed) data to compress.
---@param format CompressedDataFormat The format to use when compressing the data.
---@param level number The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.
--- returns:
---     CompressedData compressedData - A new Data object containing the compressed version of the raw data.
---@return CompressedData
function math.compress(data, format, level) end

---
--- Decompresses a CompressedData or previously compressed string or Data object.
---
---@param compressedData CompressedData The compressed data to decompress.
--- returns:
---     string rawstring - A string containing the raw decompressed data.
---@return string
function math.decompress(compressedData) end

---@param compressedString string A string containing data previously compressed with love.math.compress.
---@param format CompressedDataFormat The format that was used to compress the given string.
--- returns:
---     string rawstring - A string containing the raw decompressed data.
---@return string
function math.decompress(compressedString, format) end

---@param data Data A Data object containing data previously compressed with love.math.compress.
---@param format CompressedDataFormat The format that was used to compress the given data.
--- returns:
---     string rawstring - A string containing the raw decompressed data.
---@return string
function math.decompress(data, format) end

---
--- Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering and you need to do math in linear RGB in the few cases where LÖVE doesn't handle conversions automatically.
---
---@param r number The red channel of the sRGB color to convert.
---@param g number The green channel of the sRGB color to convert.
---@param b number The blue channel of the sRGB color to convert.
--- returns:
---     number lr - The red channel of the converted color in linear RGB space.
---     number lg - The green channel of the converted color in linear RGB space.
---     number lb - The blue channel of the converted color in linear RGB space.
---@return number, number, number
function math.gammaToLinear(r, g, b) end

---@param color table An array with the red, green, and blue channels of the sRGB color to convert.
--- returns:
---     number lr - The red channel of the converted color in linear RGB space.
---     number lg - The green channel of the converted color in linear RGB space.
---     number lb - The blue channel of the converted color in linear RGB space.
---@return number, number, number
function math.gammaToLinear(color) end

---@param c number The value of a color channel in sRGB space to convert.
--- returns:
---     number lc - The value of the color channel in linear RGB space.
---@return number
function math.gammaToLinear(c) end

---
--- Gets the seed of the random number generator.
--- 
--- The state is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer values above 2^53.
---
--- returns:
---     number low - Integer number representing the lower 32 bits of the random number generator's 64 bit state value.
---     number high - Integer number representing the higher 32 bits of the random number generator's 64 bit state value.
---@return number, number
function math.getRandomSeed() end

---
--- Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.
--- 
--- This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.
--- 
--- The value of the state string does not depend on the current operating system.
---
--- returns:
---     string state - The current state of the RandomGenerator object, represented as a string.
---@return string
function math.getRandomState() end

---
--- Checks whether a polygon is convex.
--- 
--- PolygonShapes in love.physics, some forms of Mesh, and polygons drawn with love.graphics.polygon must be simple convex polygons.
---
---@param vertices table The vertices of the polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.
--- returns:
---     boolean convex - Whether the given polygon is convex.
---@return boolean
function math.isConvex(vertices) end

---@param x1 number The position of the first vertex of the polygon on the x-axis.
---@param y1 number The position of the first vertex of the polygon on the y-axis.
---@param x2 number The position of the second vertex of the polygon on the x-axis.
---@param y2 number The position of the second vertex of the polygon on the y-axis.
---@param x3 number The position of the third vertex of the polygon on the x-axis.
---@param y3 number The position of the third vertex of the polygon on the y-axis.
---@param ... number Additional vertices.
--- returns:
---     boolean convex - Whether the given polygon is convex.
---@return boolean
function math.isConvex(x1, y1, x2, y2, x3, y3, ...) end

---
--- Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.
--- 
--- In general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.
---
---@param lr number The red channel of the linear RGB color to convert.
---@param lg number The green channel of the linear RGB color to convert.
---@param lb number The blue channel of the linear RGB color to convert.
--- returns:
---     number cr - The red channel of the converted color in gamma sRGB space.
---     number cg - The green channel of the converted color in gamma sRGB space.
---     number cb - The blue channel of the converted color in gamma sRGB space.
---@return number, number, number
function math.linearToGamma(lr, lg, lb) end

---@param color table An array with the red, green, and blue channels of the linear RGB color to convert.
--- returns:
---     number cr - The red channel of the converted color in gamma sRGB space.
---     number cg - The green channel of the converted color in gamma sRGB space.
---     number cb - The blue channel of the converted color in gamma sRGB space.
---@return number, number, number
function math.linearToGamma(color) end

---@param lc number The value of a color channel in linear RGB space to convert.
--- returns:
---     number c - The value of the color channel in gamma sRGB space.
---@return number
function math.linearToGamma(lc) end

---
--- Creates a new BezierCurve object.
--- 
--- The number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.
---
---@param vertices table The vertices of the control polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}.
--- returns:
---     BezierCurve curve - A Bézier curve object.
---@return BezierCurve
function math.newBezierCurve(vertices) end

---@param x1 number The position of the first vertex of the control polygon on the x-axis.
---@param y1 number The position of the first vertex of the control polygon on the y-axis.
---@param x2 number The position of the second vertex of the control polygon on the x-axis.
---@param y2 number The position of the second vertex of the control polygon on the y-axis.
---@param x3 number The position of the third vertex of the control polygon on the x-axis.
---@param y3 number The position of the third vertex of the control polygon on the y-axis.
---@param ... number Additional vertices.
--- returns:
---     BezierCurve curve - A Bézier curve object.
---@return BezierCurve
function math.newBezierCurve(x1, y1, x2, y2, x3, y3, ...) end

---
--- Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.
---
--- returns:
---     RandomGenerator rng - The new Random Number Generator object.
---@return RandomGenerator
function math.newRandomGenerator() end

---@param seed number The initial seed number to use for this object.
--- returns:
---     RandomGenerator rng - The new Random Number Generator object.
---@return RandomGenerator
function math.newRandomGenerator(seed) end

---@param low number The lower 32 bits of the state number to use for this instance of the object.
---@param high number The higher 32 bits of the state number to use for this instance of the object.
--- returns:
---     RandomGenerator rng - The new Random Number Generator object.
---@return RandomGenerator
function math.newRandomGenerator(low, high) end

---
--- Creates a new Transform object.
---
--- returns:
---     Transform transform - The new Transform object.
---@return Transform
function math.newTransform() end

---@param x number The position of the new Transform on the x-axis.
---@param y number The position of the new Transform on the y-axis.
---@param angle number The orientation of the new Transform in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
--- returns:
---     Transform transform - The new Transform object.
---@return Transform
function math.newTransform(x, y, angle, sx, sy, ox, oy, kx, ky) end

---
--- Generates a Simplex or Perlin noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.
--- 
--- Simplex noise is closely related to Perlin noise. It is widely used for procedural content generation.
--- 
--- There are many webpages which discuss Perlin and Simplex noise in detail.
---
---@param x number The number used to generate the noise value.
--- returns:
---     number value - The noise value in the range of [0, 1].
---@return number
function math.noise(x) end

---@param x number The first value of the 2-dimensional vector used to generate the noise value.
---@param y number The second value of the 2-dimensional vector used to generate the noise value.
--- returns:
---     number value - The noise value in the range of [0, 1].
---@return number
function math.noise(x, y) end

---@param x number The first value of the 3-dimensional vector used to generate the noise value.
---@param y number The second value of the 3-dimensional vector used to generate the noise value.
---@param z number The third value of the 3-dimensional vector used to generate the noise value.
--- returns:
---     number value - The noise value in the range of [0, 1].
---@return number
function math.noise(x, y, z) end

---@param x number The first value of the 4-dimensional vector used to generate the noise value.
---@param y number The second value of the 4-dimensional vector used to generate the noise value.
---@param z number The third value of the 4-dimensional vector used to generate the noise value.
---@param w number The fourth value of the 4-dimensional vector used to generate the noise value.
--- returns:
---     number value - The noise value in the range of [0, 1].
---@return number
function math.noise(x, y, z, w) end

---
--- Generates a pseudo-random number in a platform independent manner.
---
--- returns:
---     number number - The pseudo-random number.
---@return number
function math.random() end

---@param max number The maximum possible value it should return.
--- returns:
---     number number - The pseudo-random integer number.
---@return number
function math.random(max) end

---@param min number The minimum possible value it should return.
---@param max number The maximum possible value it should return.
--- returns:
---     number number - The pseudo-random integer number.
---@return number
function math.random(min, max) end

---
--- Get a normally distributed pseudo random number.
---
---@param stddev number Standard deviation of the distribution.
---@param mean number The mean of the distribution.
--- returns:
---     number number - Normally distributed random number with variance (stddev)² and the specified mean.
---@return number
function math.randomNormal(stddev, mean) end

---
--- Sets the seed of the random number generator using the specified integer number.
---
---@param seed number The integer number with which you want to seed the randomization. Must be within the range of [1, 2^53].
function math.setRandomSeed(seed) end

---@param low number The lower 32 bits of the state value. Must be within the range of [0, 2^32 - 1].
---@param high number The higher 32 bits of the state value. Must be within the range of [0, 2^32 - 1].
function math.setRandomSeed(low, high) end

---
--- Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.
--- 
--- This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.
--- 
--- The value of the state string does not depend on the current operating system.
---
---@param state string The current state of the RandomGenerator object, represented as a string.
function math.setRandomState(state) end

---
--- Triangulate a simple polygon.
---
---@param polygon table Polygon to triangulate. Must not intersect itself.
--- returns:
---     table triangles - List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3}, {x1, y1, x2, y2, x3, y3}, ...}.
---@return table
function math.triangulate(polygon) end

---@param x1 number The position of the first vertex of the polygon on the x-axis.
---@param y1 number The position of the first vertex of the polygon on the y-axis.
---@param x2 number The position of the second vertex of the polygon on the x-axis.
---@param y2 number The position of the second vertex of the polygon on the y-axis.
---@param x3 number The position of the third vertex of the polygon on the x-axis.
---@param y3 number The position of the third vertex of the polygon on the y-axis.
---@param ... number Additional vertices.
--- returns:
---     table triangles - List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3}, {x1, y1, x2, y2, x3, y3}, ...}.
---@return table
function math.triangulate(x1, y1, x2, y2, x3, y3, ...) end

---
--- A Bézier curve object that can evaluate and render Bézier curves of arbitrary degree.
---@class BezierCurve
BezierCurve = {}

---
--- Evaluate Bézier curve at parameter t. The parameter must be between 0 and 1 (inclusive).
--- 
--- This function can be used to move objects along paths or tween parameters. However it should not be used to render the curve, see BezierCurve:render for that purpose.
---
---@param t number Where to evaluate the curve.
--- returns:
---     number x - x coordinate of the curve at parameter t.
---     number y - y coordinate of the curve at parameter t.
---@return number, number
function BezierCurve.evaluate(t) end

---
--- Get coordinates of the i-th control point. Indices start with 1.
---
---@param i number Index of the control point.
--- returns:
---     number x - Position of the control point along the x axis.
---     number y - Position of the control point along the y axis.
---@return number, number
function BezierCurve.getControlPoint(i) end

---
--- Get the number of control points in the Bézier curve.
---
--- returns:
---     number count - The number of control points.
---@return number
function BezierCurve.getControlPointCount() end

---
--- Get degree of the Bézier curve. The degree is equal to number-of-control-points - 1.
---
--- returns:
---     number degree - Degree of the Bézier curve.
---@return number
function BezierCurve.getDegree() end

---
--- Get the derivative of the Bézier curve.
--- 
--- This function can be used to rotate sprites moving along a curve in the direction of the movement and compute the direction perpendicular to the curve at some parameter t.
---
--- returns:
---     BezierCurve derivative - The derivative curve.
---@return BezierCurve
function BezierCurve.getDerivative() end

---
--- Gets a BezierCurve that corresponds to the specified segment of this BezierCurve.
---
---@param startpoint number The starting point along the curve. Must be between 0 and 1.
---@param endpoint number The end of the segment. Must be between 0 and 1.
--- returns:
---     BezierCurve curve - A BezierCurve that corresponds to the specified segment.
---@return BezierCurve
function BezierCurve.getSegment(startpoint, endpoint) end

---
--- Insert control point as the new i-th control point. Existing control points from i onwards are pushed back by 1. Indices start with 1. Negative indices wrap around: -1 is the last control point, -2 the one before the last, etc.
---
---@param x number Position of the control point along the x axis.
---@param y number Position of the control point along the y axis.
---@param i number Index of the control point.
function BezierCurve.insertControlPoint(x, y, i) end

---
--- Removes the specified control point.
---
---@param index number The index of the control point to remove.
function BezierCurve.removeControlPoint(index) end

---
--- Get a list of coordinates to be used with love.graphics.line.
--- 
--- This function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.
--- 
--- If you are just interested to know the position on the curve given a parameter, use BezierCurve:evaluate.
---
---@param depth number Number of recursive subdivision steps.
--- returns:
---     table coordinates - List of x,y-coordinate pairs of points on the curve.
---@return table
function BezierCurve.render(depth) end

---
--- Get a list of coordinates on a specific part of the curve, to be used with love.graphics.line.
--- 
--- This function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.
--- 
--- If you are just need to know the position on the curve given a parameter, use BezierCurve:evaluate.
---
---@param startpoint number The starting point along the curve. Must be between 0 and 1.
---@param endpoint number The end of the segment to render. Must be between 0 and 1.
---@param depth number Number of recursive subdivision steps.
--- returns:
---     table coordinates - List of x,y-coordinate pairs of points on the curve.
---@return table
function BezierCurve.renderSegment(startpoint, endpoint, depth) end

---
--- Rotate the Bézier curve by an angle.
---
---@param angle number Rotation angle in radians.
---@param ox number X coordinate of the rotation center.
---@param oy number Y coordinate of the rotation center.
function BezierCurve.rotate(angle, ox, oy) end

---
--- Scale the Bézier curve by a factor.
---
---@param s number Scale factor.
---@param ox number X coordinate of the scaling center.
---@param oy number Y coordinate of the scaling center.
function BezierCurve.scale(s, ox, oy) end

---
--- Set coordinates of the i-th control point. Indices start with 1.
---
---@param i number Index of the control point.
---@param ox number Position of the control point along the x axis.
---@param oy number Position of the control point along the y axis.
function BezierCurve.setControlPoint(i, ox, oy) end

---
--- Move the Bézier curve by an offset.
---
---@param dx number Offset along the x axis.
---@param dy number Offset along the y axis.
function BezierCurve.translate(dx, dy) end

---
--- Represents byte data compressed using a specific algorithm.
--- 
--- love.math.decompress can be used to de-compress the data.
---@class CompressedData
CompressedData = {}

---
--- Gets the compression format of the CompressedData.
---
--- returns:
---     CompressedDataFormat format - The format of the CompressedData.
---@return CompressedDataFormat
function CompressedData.getFormat() end

---
--- A random number generation object which has its own random state.
---@class RandomGenerator
RandomGenerator = {}

---
--- Gets the state of the random number generator.
--- 
--- The state is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer values above 2^53.
---
--- returns:
---     number low - Integer number representing the lower 32 bits of the random number generator's 64 bit state value.
---     number high - Integer number representing the higher 32 bits of the random number generator's 64 bit state value.
---@return number, number
function RandomGenerator.getSeed() end

---
--- Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.
--- 
--- This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.
--- 
--- The value of the state string does not depend on the current operating system.
---
--- returns:
---     string state - The current state of the RandomGenerator object, represented as a string.
---@return string
function RandomGenerator.getState() end

---
--- Generates a pseudo-random number in a platform independent manner.
---
--- returns:
---     number number - The pseudo random number.
---@return number
function RandomGenerator.random() end

---@param max number The maximum possible value it should return.
--- returns:
---     number number - The pseudo-random integer number.
---@return number
function RandomGenerator.random(max) end

---@param min number The minimum possible value it should return.
---@param max number The maximum possible value it should return.
--- returns:
---     number number - The pseudo-random integer number.
---@return number
function RandomGenerator.random(min, max) end

---
--- Get a normally distributed pseudo random number.
---
---@param stddev number Standard deviation of the distribution.
---@param mean number The mean of the distribution.
--- returns:
---     number number - Normally distributed random number with variance (stddev)² and the specified mean.
---@return number
function RandomGenerator.randomNormal(stddev, mean) end

---
--- Sets the seed of the random number generator using the specified integer number.
---
---@param seed number The integer number with which you want to seed the randomization. Must be within the range of [1, 2^53].
function RandomGenerator.setSeed(seed) end

---@param low number The lower 32 bits of the state value. Must be within the range of [0, 2^32 - 1].
---@param high number The higher 32 bits of the state value. Must be within the range of [0, 2^32 - 1].
function RandomGenerator.setSeed(low, high) end

---
--- Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to RandomGenerator:getState.
--- 
--- This is different from RandomGenerator:setSeed in that setState directly sets the RandomGenerator's current implementation-dependent state, whereas setSeed gives it a new seed value.
--- 
--- The effect of the state string does not depend on the current operating system.
---
---@param state string The new state of the RandomGenerator object, represented as a string. This should originate from a previous call to RandomGenerator:getState.
function RandomGenerator.setState(state) end

---
--- Object containing a coordinate system transformation.
--- 
--- The love.graphics module has several functions and function variants which accept Transform objects.
---@class Transform
Transform = {}

---
--- Applies the given other Transform object to this one.
---
---@param other Transform The other Transform object to apply to this Transform.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.apply(other) end

---
--- Creates a new copy of this Transform.
---
--- returns:
---     Transform clone - The copy of this Transform.
---@return Transform
function Transform.clone() end

---
--- Gets the internal 4x4 transformation matrix stored by this Transform. The matrix is returned in row-major order.
---
--- returns:
---     number e1_1 - The first column of the first row of the matrix.
---     number e1_2 - The second column of the first row of the matrix.
---     number ... - Additional matrix elements.
---     number e4_4 - The fourth column of the fourth row of the matrix.
---@return number, number, number, number
function Transform.getMatrix() end

---
--- Creates a new Transform containing the inverse of this Transform.
---
--- returns:
---     Transform inverse - A new Transform object representing the inverse of this Transform's matrix.
---@return Transform
function Transform.inverse() end

---
--- Applies the reverse of the Transform object's transformation to the given 2D position.
--- 
--- This effectively converts the given position from the local coordinate space of the Transform into global coordinates.
--- 
--- One use of this method can be to convert a screen-space mouse position into global world coordinates, if the given Transform has transformations applied that are used for a camera system in-game.
---
---@param localX number The x component of the position with the transform applied.
---@param localY number The y component of the position with the transform applied.
--- returns:
---     number globalX - The x component of the position in global coordinates.
---     number globalY - The y component of the position in global coordinates.
---@return number, number
function Transform.inverseTransformPoint(localX, localY) end

---
--- Resets the Transform to an identity state. All previously applied transformations are erased.
---
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.reset() end

---
--- Applies a rotation to the Transform's coordinate system. This method does not reset any previously applied transformations.
---
---@param angle number The relative angle in radians to rotate this Transform by.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.rotate(angle) end

---
--- Scales the Transform's coordinate system. This method does not reset any previously applied transformations.
---
---@param sx number The relative scale factor along the x-axis.
---@param sy number The relative scale factor along the y-axis.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.scale(sx, sy) end

---
--- Directly sets the Transform's internal 4x4 transformation matrix.
---
---@param e1_1 number The first column of the first row of the matrix.
---@param e1_2 number The second column of the first row of the matrix.
---@param ... number Additional matrix elements.
---@param e4_4 number The fourth column of the fourth row of the matrix.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.setMatrix(e1_1, e1_2, ..., e4_4) end

---@param layout MatrixLayout How to interpret the matrix element arguments (row-major or column-major).
---@param e1_1 number The first column of the first row of the matrix.
---@param e1_2 number The second column of the first row of the matrix.
---@param ... number Additional matrix elements.
---@param e4_4 number The fourth column of the fourth row of the matrix.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.setMatrix(layout, e1_1, e1_2, ..., e4_4) end

---@param layout MatrixLayout How to interpret the matrix element arguments (row-major or column-major).
---@param matrix table A flat table containing the 16 matrix elements.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.setMatrix(layout, matrix) end

---@param layout MatrixLayout How to interpret the matrix element arguments (row-major or column-major).
---@param matrix table A table of 4 tables, with each sub-table containing 4 matrix elements.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.setMatrix(layout, matrix) end

---
--- Resets the Transform to the specified transformation parameters.
---
---@param x number The position of the Transform on the x-axis.
---@param y number The position of the Transform on the y-axis.
---@param angle number The orientation of the Transform in radians.
---@param sx number Scale factor on the x-axis.
---@param sy number Scale factor on the y-axis.
---@param ox number Origin offset on the x-axis.
---@param oy number Origin offset on the y-axis.
---@param kx number Shearing / skew factor on the x-axis.
---@param ky number Shearing / skew factor on the y-axis.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.setTransformation(x, y, angle, sx, sy, ox, oy, kx, ky) end

---
--- Applies a shear factor (skew) to the Transform's coordinate system. This method does not reset any previously applied transformations.
---
---@param kx number The shear factor along the x-axis.
---@param ky number The shear factor along the y-axis.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.shear(kx, ky) end

---
--- Applies the Transform object's transformation to the given 2D position.
--- 
--- This effectively converts the given position from global coordinates into the local coordinate space of the Transform.
---
---@param globalX number The x component of the position in global coordinates.
---@param globalY number The y component of the position in global coordinates.
--- returns:
---     number localX - The x component of the position with the transform applied.
---     number localY - The y component of the position with the transform applied.
---@return number, number
function Transform.transformPoint(globalX, globalY) end

---
--- Applies a translation to the Transform's coordinate system. This method does not reset any previously applied transformations.
---
---@param dx number The relative translation along the x-axis.
---@param dy number The relative translation along the y-axis.
--- returns:
---     Transform transform - The Transform object the method was called on. Allows easily chaining Transform methods.
---@return Transform
function Transform.translate(dx, dy) end

---
--- Provides an interface to the user's mouse.
---
local mouse = {}
love.mouse = mouse

---
--- Gets the current Cursor.
---
--- returns:
---     Cursor cursor - The current cursor, or nil if no cursor is set.
---@return Cursor
function mouse.getCursor() end

---
--- Returns the current position of the mouse.
---
--- returns:
---     number x - The position of the mouse along the x-axis.
---     number y - The position of the mouse along the y-axis.
---@return number, number
function mouse.getPosition() end

---
--- Gets whether relative mode is enabled for the mouse.
--- 
--- If relative mode is enabled, the cursor is hidden and doesn't move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.
--- 
--- The reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.
---
--- returns:
---     boolean enabled - True if relative mode is enabled, false if it's disabled.
---@return boolean
function mouse.getRelativeMode() end

---
--- Gets a Cursor object representing a system-native hardware cursor.
--- 
---  Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.
---
---@param ctype CursorType The type of system cursor to get.
--- returns:
---     Cursor cursor - The Cursor object representing the system cursor type.
---@return Cursor
function mouse.getSystemCursor(ctype) end

---
--- Returns the current x position of the mouse.
---
--- returns:
---     number x - The position of the mouse along the x-axis.
---@return number
function mouse.getX() end

---
--- Returns the current y position of the mouse.
---
--- returns:
---     number y - The position of the mouse along the y-axis.
---@return number
function mouse.getY() end

---
--- Gets whether cursor functionality is supported.
--- 
--- If it isn't supported, calling love.mouse.newCursor and love.mouse.getSystemCursor will cause an error. Mobile devices do not support cursors.
---
--- returns:
---     boolean hascursor - Whether the system has cursor functionality.
---@return boolean
function mouse.hasCursor() end

---
--- Gets whether cursor functionality is supported.
--- 
--- If it isn't supported, calling love.mouse.newCursor and love.mouse.getSystemCursor will cause an error. Mobile devices do not support cursors.
---
--- returns:
---     boolean supported - Whether the system has cursor functionality.
---@return boolean
function mouse.isCursorSupported() end

---
--- Checks whether a certain mouse button is down. This function does not detect mousewheel scrolling; you must use the love.wheelmoved (or love.mousepressed in version 0.9.2 and older) callback for that.
---
---@param button number The index of a button to check. 1 is the primary mouse button, 2 is the secondary mouse button, etc.
---@param ... number Additional button numbers to check.
--- returns:
---     boolean down - True if the specified button is down.
---@return boolean
function mouse.isDown(button, ...) end

---
--- Checks if the mouse is grabbed.
---
--- returns:
---     boolean grabbed - True if the cursor is grabbed, false if it is not.
---@return boolean
function mouse.isGrabbed() end

---
--- Checks if the cursor is visible.
---
--- returns:
---     boolean visible - True if the cursor to visible, false if the cursor is hidden.
---@return boolean
function mouse.isVisible() end

---
--- Creates a new hardware Cursor object from an image file or ImageData.
--- 
--- Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.
--- 
--- The hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.
---
---@param imageData ImageData The ImageData to use for the the new Cursor.
---@param hotx number The x-coordinate in the ImageData of the cursor's hot spot.
---@param hoty number The y-coordinate in the ImageData of the cursor's hot spot.
--- returns:
---     Cursor cursor - The new Cursor object.
---@return Cursor
function mouse.newCursor(imageData, hotx, hoty) end

---@param filepath string Path to the image to use for the new Cursor.
---@param hotx number The x-coordinate in the ImageData of the cursor's hot spot.
---@param hoty number The y-coordinate in the ImageData of the cursor's hot spot.
--- returns:
---     Cursor cursor - The new Cursor object.
---@return Cursor
function mouse.newCursor(filepath, hotx, hoty) end

---@param fileData FileData Data representing the image to use for the new Cursor.
---@param hotx number The x-coordinate in the ImageData of the cursor's hot spot.
---@param hoty number The y-coordinate in the ImageData of the cursor's hot spot.
--- returns:
---     Cursor cursor - The new Cursor object.
---@return Cursor
function mouse.newCursor(fileData, hotx, hoty) end

---
--- Sets the current mouse cursor.
--- 
--- Resets the current mouse cursor to the default when called without arguments.
---
function mouse.setCursor() end

---@param cursor Cursor The Cursor object to use as the current mouse cursor.
function mouse.setCursor(cursor) end

---
--- Grabs the mouse and confines it to the window.
---
---@param grab boolean True to confine the mouse, false to let it leave the window.
function mouse.setGrabbed(grab) end

---
--- Sets the current position of the mouse. Non-integer values are floored.
---
---@param x number The new position of the mouse along the x-axis.
---@param y number The new position of the mouse along the y-axis.
function mouse.setPosition(x, y) end

---
--- Sets whether relative mode is enabled for the mouse.
--- 
--- When relative mode is enabled, the cursor is hidden and doesn't move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.
--- 
--- The reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.
---
---@param enable boolean True to enable relative mode, false to disable it.
function mouse.setRelativeMode(enable) end

---
--- Sets the visibility of the cursor.
---
---@param visible boolean True to set the cursor to visible, false to hide the cursor.
function mouse.setVisible(visible) end

---
--- Sets the current X position of the mouse. Non-integer values are floored.
---
---@param x number The new position of the mouse along the x-axis.
function mouse.setX(x) end

---
--- Sets the current Y position of the mouse. Non-integer values are floored.
---
---@param y number The new position of the mouse along the y-axis.
function mouse.setY(y) end

---
--- Represents a hardware cursor.
---@class Cursor
Cursor = {}

---
--- Gets the type of the Cursor.
---
--- returns:
---     CursorType cursortype - The type of the Cursor.
---@return CursorType
function Cursor.getType() end

---
--- Can simulate 2D rigid body physics in a realistic manner. This module is based on Box2D, and this API corresponds to the Box2D API as closely as possible.
---
local physics = {}
love.physics = physics

---
--- Returns the two closest points between two fixtures and their distance.
---
---@param fixture1 Fixture The first fixture.
---@param fixture2 Fixture The second fixture.
--- returns:
---     number distance - The distance of the two points.
---     number x1 - The x-coordinate of the first point.
---     number y1 - The y-coordinate of the first point.
---     number x2 - The x-coordinate of the second point.
---     number y2 - The y-coordinate of the second point.
---@return number, number, number, number, number
function physics.getDistance(fixture1, fixture2) end

---
--- Get the scale of the world.
--- 
--- The world scale is the number of pixels per meter. Try to keep your shape sizes less than 10 times this scale.
--- 
--- This is important because the physics in Box2D is tuned to work well for objects of size 0.1m up to 10m. All physics coordinates are divided by this number for the physics calculations.
---
--- returns:
---     number scale - The size of 1 meter in pixels.
---@return number
function physics.getMeter() end

---
--- Creates a new body.
--- 
--- There are three types of bodies. Static bodies do not move, have a infinite mass, and can be used for level boundaries. Dynamic bodies are the main actors in the simulation, they collide with everything. Kinematic bodies do not react to forces and only collide with dynamic bodies.
--- 
--- The mass of the body gets calculated when a Fixture is attached or removed, but can be changed at any time with Body:setMass or Body:resetMassData.
---
---@param world World The world to create the body in.
---@param x number The x position of the body.
---@param y number The y position of the body.
---@param type BodyType The type of the body.
--- returns:
---     Body body - A new body.
---@return Body
function physics.newBody(world, x, y, type) end

---
--- Creates a new ChainShape.
---
---@param loop boolean If the chain should loop back to the first point.
---@param x1 number The x position of the first point.
---@param y1 number The y position of the first point.
---@param x2 number The x position of the second point.
---@param y2 number The y position of the second point.
---@param ... number Additional point positions.
--- returns:
---     ChainShape shape - The new shape.
---@return ChainShape
function physics.newChainShape(loop, x1, y1, x2, y2, ...) end

---@param loop boolean If the chain should loop back to the first point.
---@param points table A list of points to construct the ChainShape, in the form of {x1, y1, x2, y2, ...}.
--- returns:
---     ChainShape shape - The new shape.
---@return ChainShape
function physics.newChainShape(loop, points) end

---
--- Creates a new CircleShape.
---
---@param radius number The radius of the circle.
--- returns:
---     CircleShape shape - The new shape.
---@return CircleShape
function physics.newCircleShape(radius) end

---@param x number The x offset of the circle.
---@param y number The y offset of the circle.
---@param radius number The radius of the circle.
--- returns:
---     CircleShape shape - The new shape.
---@return CircleShape
function physics.newCircleShape(x, y, radius) end

---
--- Create a distance joint between two bodies.
--- 
--- This joint constrains the distance between two points on two bodies to be constant. These two points are specified in world coordinates and the two bodies are assumed to be in place when this joint is created. The first anchor point is connected to the first body and the second to the second body, and the points define the length of the distance joint.
---
---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param x1 number The x position of the first anchor point (world space).
---@param y1 number The y position of the first anchor point (world space).
---@param x2 number The x position of the second anchor point (world space).
---@param y2 number The y position of the second anchor point (world space).
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     DistanceJoint joint - The new distance joint.
---@return DistanceJoint
function physics.newDistanceJoint(body1, body2, x1, y1, x2, y2, collideConnected) end

---
--- Creates a edge shape.
---
---@param x1 number The x position of the first point.
---@param y1 number The y position of the first point.
---@param x2 number The x position of the second point.
---@param y2 number The y position of the second point.
--- returns:
---     EdgeShape shape - The new shape.
---@return EdgeShape
function physics.newEdgeShape(x1, y1, x2, y2) end

---
--- Creates and attaches a Fixture to a body.
---
---@param body Body The body which gets the fixture attached.
---@param shape Shape The shape of the fixture.
---@param density number The density of the fixture.
--- returns:
---     Fixture fixture - The new fixture.
---@return Fixture
function physics.newFixture(body, shape, density) end

---
--- Create a friction joint between two bodies. A FrictionJoint applies friction to a body.
---
---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param x number The x position of the anchor point.
---@param y number The y position of the anchor point.
---@param collideConnected boolean Specifies whether the two bodies should collide with eachother.
--- returns:
---     FrictionJoint joint - The new FrictionJoint.
---@return FrictionJoint
function physics.newFrictionJoint(body1, body2, x, y, collideConnected) end

---
--- Create a gear joint connecting two joints.
--- 
--- The gear joint connects two joints that must be either prismatic or revolute joints. Using this joint requires that the joints it uses connect their respective bodies to the ground and have the ground as the first body. When destroying the bodies and joints you must make sure you destroy the gear joint before the other joints.
--- 
--- The gear joint has a ratio the determines how the angular or distance values of the connected joints relate to each other. The formula coordinate1 + ratio * coordinate2 always has a constant value that is set when the gear joint is created.
---
---@param joint1 Joint The first joint to connect with a gear joint.
---@param joint2 Joint The second joint to connect with a gear joint.
---@param ratio number The gear ratio.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     GearJoint joint - The new gear joint.
---@return GearJoint
function physics.newGearJoint(joint1, joint2, ratio, collideConnected) end

---
--- Creates a joint between two bodies which controls the relative motion between them.
--- 
--- Position and rotation offsets can be specified once the MotorJoint has been created, as well as the maximum motor force and torque that will be be applied to reach the target offsets.
---
---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param correctionFactor number The joint's initial position correction factor, in the range of [0, 1].
--- returns:
---     MotorJoint joint - The new MotorJoint.
---@return MotorJoint
function physics.newMotorJoint(body1, body2, correctionFactor) end

---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param correctionFactor number The joint's initial position correction factor, in the range of [0, 1].
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     MotorJoint joint - The new MotorJoint.
---@return MotorJoint
function physics.newMotorJoint(body1, body2, correctionFactor, collideConnected) end

---
--- Create a joint between a body and the mouse.
--- 
--- This joint actually connects the body to a fixed point in the world. To make it follow the mouse, the fixed point must be updated every timestep (example below).
--- 
--- The advantage of using a MouseJoint instead of just changing a body position directly is that collisions and reactions to other joints are handled by the physics engine.
---
---@param body Body The body to attach to the mouse.
---@param x number The x position of the connecting point.
---@param y number The y position of the connecting point.
--- returns:
---     MouseJoint joint - The new mouse joint.
---@return MouseJoint
function physics.newMouseJoint(body, x, y) end

---
--- Creates a new PolygonShape.
--- 
--- This shape can have 8 vertices at most, and must form a convex shape.
---
---@param x1 number The position of first point on the x-axis.
---@param y1 number The position of first point on the y-axis.
---@param x2 number The position of second point on the x-axis.
---@param y2 number The position of second point on the y-axis.
---@param ... number You can continue passing more point positions to create the PolygonShape.
--- returns:
---     PolygonShape shape - A new PolygonShape.
---@return PolygonShape
function physics.newPolygonShape(x1, y1, x2, y2, ...) end

---@param vertices table A list of vertices to construct the polygon, in the form of {x1, y1, x2, y2, x3, y3, ...}.
--- returns:
---     PolygonShape shape - A new PolygonShape.
---@return PolygonShape
function physics.newPolygonShape(vertices) end

---
--- Create a prismatic joints between two bodies.
--- 
--- A prismatic joint constrains two bodies to move relatively to each other on a specified axis. It does not allow for relative rotation. Its definition and operation are similar to a revolute joint, but with translation and force substituted for angle and torque.
---
---@param body1 Body The first body to connect with a prismatic joint.
---@param body2 Body The second body to connect with a prismatic joint.
---@param x number The x coordinate of the anchor point.
---@param y number The y coordinate of the anchor point.
---@param ax number The x coordinate of the axis unit vector.
---@param ay number The y coordinate of the axis unit vector.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     PrismaticJoint joint - The new prismatic joint.
---@return PrismaticJoint
function physics.newPrismaticJoint(body1, body2, x, y, ax, ay, collideConnected) end

---@param body1 Body The first body to connect with a prismatic joint.
---@param body2 Body The second body to connect with a prismatic joint.
---@param x1 number The x coordinate of the first anchor point.
---@param y1 number The y coordinate of the first anchor point.
---@param x2 number The x coordinate of the second anchor point.
---@param y2 number The y coordinate of the second anchor point.
---@param ax number The x coordinate of the axis unit vector.
---@param ay number The y coordinate of the axis unit vector.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     PrismaticJoint joint - The new prismatic joint.
---@return PrismaticJoint
function physics.newPrismaticJoint(body1, body2, x1, y1, x2, y2, ax, ay, collideConnected) end

---@param body1 Body The first body to connect with a prismatic joint.
---@param body2 Body The second body to connect with a prismatic joint.
---@param x1 number The x coordinate of the first anchor point.
---@param y1 number The y coordinate of the first anchor point.
---@param x2 number The x coordinate of the second anchor point.
---@param y2 number The y coordinate of the second anchor point.
---@param ax number The x coordinate of the axis unit vector.
---@param ay number The y coordinate of the axis unit vector.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
---@param referenceAngle number The reference angle between body1 and body2, in radians.
--- returns:
---     PrismaticJoint joint - The new prismatic joint.
---@return PrismaticJoint
function physics.newPrismaticJoint(body1, body2, x1, y1, x2, y2, ax, ay, collideConnected, referenceAngle) end

---
--- Create a pulley joint to join two bodies to each other and the ground.
--- 
--- The pulley joint simulates a pulley with an optional block and tackle. If the ratio parameter has a value different from one, then the simulated rope extends faster on one side than the other. In a pulley joint the total length of the simulated rope is the constant length1 + ratio * length2, which is set when the pulley joint is created.
--- 
--- Pulley joints can behave unpredictably if one side is fully extended. It is recommended that the method setMaxLengths  be used to constrain the maximum lengths each side can attain.
---
---@param body1 Body The first body to connect with a pulley joint.
---@param body2 Body The second body to connect with a pulley joint.
---@param gx1 number The x coordinate of the first body's ground anchor.
---@param gy1 number The y coordinate of the first body's ground anchor.
---@param gx2 number The x coordinate of the second body's ground anchor.
---@param gy2 number The y coordinate of the second body's ground anchor.
---@param x1 number The x coordinate of the pulley joint anchor in the first body.
---@param y1 number The y coordinate of the pulley joint anchor in the first body.
---@param x2 number The x coordinate of the pulley joint anchor in the second body.
---@param y2 number The y coordinate of the pulley joint anchor in the second body.
---@param ratio number The joint ratio.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     PulleyJoint joint - The new pulley joint.
---@return PulleyJoint
function physics.newPulleyJoint(body1, body2, gx1, gy1, gx2, gy2, x1, y1, x2, y2, ratio, collideConnected) end

---
--- Shorthand for creating rectangular PolygonShapes.
--- 
--- By default, the local origin is located at the center of the rectangle as opposed to the top left for graphics.
---
---@param width number The width of the rectangle.
---@param height number The height of the rectangle.
--- returns:
---     PolygonShape shape - A new PolygonShape.
---@return PolygonShape
function physics.newRectangleShape(width, height) end

---@param x number The offset along the x-axis.
---@param y number The offset along the y-axis.
---@param width number The width of the rectangle.
---@param height number The height of the rectangle.
---@param angle number The initial angle of the rectangle.
--- returns:
---     PolygonShape shape - A new PolygonShape.
---@return PolygonShape
function physics.newRectangleShape(x, y, width, height, angle) end

---
--- Creates a pivot joint between two bodies.
--- 
--- This joint connects two bodies to a point around which they can pivot.
---
---@param body1 Body The first body.
---@param body2 Body The second body.
---@param x number The x position of the connecting point.
---@param y number The y position of the connecting point.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     RevoluteJoint joint - The new revolute joint.
---@return RevoluteJoint
function physics.newRevoluteJoint(body1, body2, x, y, collideConnected) end

---@param body1 Body The first body.
---@param body2 Body The second body.
---@param x1 number The x position of the first connecting point.
---@param y1 number The y position of the first connecting point.
---@param x2 number The x position of the second connecting point.
---@param y2 number The y position of the second connecting point.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
---@param referenceAngle number Specifies whether the two bodies should collide with each other.
--- returns:
---     RevoluteJoint joint - The new revolute joint.
---@return RevoluteJoint
function physics.newRevoluteJoint(body1, body2, x1, y1, x2, y2, collideConnected, referenceAngle) end

---
--- Create a joint between two bodies. Its only function is enforcing a max distance between these bodies.
---
---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param x1 number The x position of the first anchor point.
---@param y1 number The y position of the first anchor point.
---@param x2 number The x position of the second anchor point.
---@param y2 number The y position of the second anchor point.
---@param maxLength number The maximum distance for the bodies.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     RopeJoint joint - The new RopeJoint.
---@return RopeJoint
function physics.newRopeJoint(body1, body2, x1, y1, x2, y2, maxLength, collideConnected) end

---
--- Creates a constraint joint between two bodies. A WeldJoint essentially glues two bodies together. The constraint is a bit soft, however, due to Box2D's iterative solver.
---
---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param x number The x position of the anchor point (world space).
---@param y number The y position of the anchor point (world space).
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     WeldJoint joint - The new WeldJoint.
---@return WeldJoint
function physics.newWeldJoint(body1, body2, x, y, collideConnected) end

---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param x1 number The x position of the first anchor point (world space).
---@param y1 number The y position of the first anchor point (world space).
---@param x2 number The x position of the second anchor point (world space).
---@param y2 number The y position of the second anchor point (world space).
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     WeldJoint joint - The new WeldJoint.
---@return WeldJoint
function physics.newWeldJoint(body1, body2, x1, y1, x2, y2, collideConnected) end

---@param body1 Body The first body to attach to the joint.
---@param body2 Body The second body to attach to the joint.
---@param x1 number The x position of the first anchor point (world space).
---@param y1 number The y position of the first anchor point (world space).
---@param x2 number The x position of the second anchor point (world space).
---@param y2 number The y position of the second anchor point (world space).
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
---@param referenceAngle number The reference angle between body1 and body2, in radians.
--- returns:
---     WeldJoint joint - The new WeldJoint.
---@return WeldJoint
function physics.newWeldJoint(body1, body2, x1, y1, x2, y2, collideConnected, referenceAngle) end

---
--- Creates a wheel joint.
---
---@param body1 Body The first body.
---@param body2 Body The second body.
---@param x number The x position of the anchor point.
---@param y number The y position of the anchor point.
---@param ax number The x position of the axis unit vector.
---@param ay number The y position of the axis unit vector.
---@param collideConnected boolean Specifies whether the two bodies should collide with each other.
--- returns:
---     WheelJoint joint - The new WheelJoint.
---@return WheelJoint
function physics.newWheelJoint(body1, body2, x, y, ax, ay, collideConnected) end

---
--- Creates a new World.
---
---@param xg number The x component of gravity.
---@param yg number The y component of gravity.
---@param sleep boolean Whether the bodies in this world are allowed to sleep.
--- returns:
---     World world - A brave new World.
---@return World
function physics.newWorld(xg, yg, sleep) end

---
--- Sets the pixels to meter scale factor.
--- 
--- All coordinates in the physics module are divided by this number and converted to meters, and it creates a convenient way to draw the objects directly to the screen without the need for graphics transformations.
--- 
--- It is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters. The default meter scale is 30.
--- 
--- love.physics.setMeter does not apply retroactively to created objects. Created objects retain their meter coordinates but the scale factor will affect their pixel coordinates.
---
---@param scale number The scale factor as an integer.
function physics.setMeter(scale) end

---
--- Bodies are objects with velocity and position.
---@class Body
Body = {}

---
--- Applies an angular impulse to a body. This makes a single, instantaneous addition to the body momentum.
--- 
--- A body with with a larger mass will react less. The reaction does not depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.
---
---@param impulse number The impulse in kilogram-square meter per second.
function Body.applyAngularImpulse(impulse) end

---
--- Apply force to a Body.
--- 
--- A force pushes a body in a direction. A body with with a larger mass will react less. The reaction also depends on how long a force is applied: since the force acts continuously over the entire timestep, a short timestep will only push the body for a short time. Thus forces are best used for many timesteps to give a continuous push to a body (like gravity). For a single push that is independent of timestep, it is better to use Body:applyLinearImpulse.
--- 
--- If the position to apply the force is not given, it will act on the center of mass of the body. The part of the force not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia).
--- 
--- Note that the force components and position must be given in world coordinates.
---
---@param fx number The x component of force to apply to the center of mass.
---@param fy number The y component of force to apply to the center of mass.
function Body.applyForce(fx, fy) end

---@param fx number The x component of force to apply.
---@param fy number The y component of force to apply.
---@param x number The x position to apply the force.
---@param y number The y position to apply the force.
function Body.applyForce(fx, fy, x, y) end

---
--- Applies an impulse to a body. This makes a single, instantaneous addition to the body momentum.
--- 
--- An impulse pushes a body in a direction. A body with with a larger mass will react less. The reaction does not depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.
--- 
--- If the position to apply the impulse is not given, it will act on the center of mass of the body. The part of the impulse not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia).
--- 
--- Note that the impulse components and position must be given in world coordinates.
---
---@param ix number The x component of the impulse applied to the center of mass.
---@param iy number The y component of the impulse applied to the center of mass.
function Body.applyLinearImpulse(ix, iy) end

---@param ix number The x component of the impulse.
---@param iy number The y component of the impulse.
---@param x number The x position to apply the impulse.
---@param y number The y position to apply the impulse.
function Body.applyLinearImpulse(ix, iy, x, y) end

---
--- Apply torque to a body.
--- 
--- Torque is like a force that will change the angular velocity (spin) of a body. The effect will depend on the rotational inertia a body has.
---
---@param torque number The torque to apply.
function Body.applyTorque(torque) end

---
--- Explicitly destroys the Body. When you don't have time to wait for garbage collection, this function may be used to free the object immediately, but note that an error will occur if you attempt to use the object after calling this function.
---
function Body.destroy() end

---
--- Get the angle of the body.
--- 
--- The angle is measured in radians. If you need to transform it to degrees, use math.deg.
--- 
--- A value of 0 radians will mean "looking to the right". Although radians increase counter-clockwise, the y-axis points down so it becomes clockwise from our point of view.
---
--- returns:
---     number angle - The angle in radians.
---@return number
function Body.getAngle() end

---
--- Gets the Angular damping of the Body
--- 
--- The angular damping is the rate of decrease of the angular velocity over time: A spinning body with no damping and no external forces will continue spinning indefinitely. A spinning body with damping will gradually stop spinning.
--- 
--- Damping is not the same as friction - they can be modelled together. However, only damping is provided by Box2D (and LÖVE).
--- 
--- Damping parameters should be between 0 and infinity, with 0 meaning no damping, and infinity meaning full damping. Normally you will use a damping value between 0 and 0.1.
---
--- returns:
---     number damping - The value of the angular damping.
---@return number
function Body.getAngularDamping() end

---
--- Get the angular velocity of the Body.
--- 
--- The angular velocity is the rate of change of angle over time.
--- 
--- It is changed in World:update by applying torques, off centre forces/impulses, and angular damping. It can be set directly with Body:setAngularVelocity.
--- 
--- If you need the rate of change of position over time, use Body:getLinearVelocity.
---
--- returns:
---     number w - The angular velocity in radians/second.
---@return number
function Body.getAngularVelocity() end

---
--- Gets a list of all Contacts attached to the Body.
---
--- returns:
---     table contacts - A list with all contacts associated with the Body.
---@return table
function Body.getContactList() end

---
--- Returns a table with all fixtures.
---
--- returns:
---     table fixtures - A sequence with all fixtures.
---@return table
function Body.getFixtureList() end

---
--- Returns the gravity scale factor.
---
--- returns:
---     number scale - The gravity scale factor.
---@return number
function Body.getGravityScale() end

---
--- Gets the rotational inertia of the body.
--- 
--- The rotational inertia is how hard is it to make the body spin.
---
--- returns:
---     number inertia - The rotational inertial of the body.
---@return number
function Body.getInertia() end

---
--- Returns a table containing the Joints attached to this Body.
---
--- returns:
---     table joints - A sequence with the Joints attached to the Body.
---@return table
function Body.getJointList() end

---
--- Gets the linear damping of the Body.
--- 
--- The linear damping is the rate of decrease of the linear velocity over time. A moving body with no damping and no external forces will continue moving indefinitely, as is the case in space. A moving body with damping will gradually stop moving.
--- 
--- Damping is not the same as friction - they can be modelled together. However, only damping is provided by Box2D (and LÖVE).
---
--- returns:
---     number damping - The value of the linear damping.
---@return number
function Body.getLinearDamping() end

---
--- Gets the linear velocity of the Body from its center of mass.
--- 
--- The linear velocity is the rate of change of position over time.
--- 
--- If you need the rate of change of angle over time, use Body:getAngularVelocity. If you need to get the linear velocity of a point different from the center of mass:
--- 
--- Body:getLinearVelocityFromLocalPoint allows you to specify the point in local coordinates.
--- 
--- Body:getLinearVelocityFromWorldPoint allows you to specify the point in world coordinates.
---
--- returns:
---     number x - The x component of the velocity vector.
---     number y - The y component of the velocity vector.
---@return number, number
function Body.getLinearVelocity() end

---
--- Get the linear velocity of a point on the body.
--- 
--- The linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.
--- 
--- The point on the body must given in local coordinates. Use Body:getLinearVelocityFromWorldPoint to specify this with world coordinates.
---
---@param x number The x position to measure velocity.
---@param y number The y position to measure velocity.
--- returns:
---     number vx - The x component of velocity at point (x,y).
---     number vy - The y component of velocity at point (x,y).
---@return number, number
function Body.getLinearVelocityFromLocalPoint(x, y) end

---
--- Get the linear velocity of a point on the body.
--- 
--- The linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.
--- 
--- The point on the body must given in world coordinates. Use Body:getLinearVelocityFromLocalPoint to specify this with local coordinates.
---
---@param x number The x position to measure velocity.
---@param y number The y position to measure velocity.
--- returns:
---     number vx - The x component of velocity at point (x,y).
---     number vy - The y component of velocity at point (x,y).
---@return number, number
function Body.getLinearVelocityFromWorldPoint(x, y) end

---
--- Get the center of mass position in local coordinates.
--- 
--- Use Body:getWorldCenter to get the center of mass in world coordinates.
---
--- returns:
---     number x - The x coordinate of the center of mass.
---     number y - The y coordinate of the center of mass.
---@return number, number
function Body.getLocalCenter() end

---
--- Transform a point from world coordinates to local coordinates.
---
---@param worldX number The x position in world coordinates.
---@param worldY number The y position in world coordinates.
--- returns:
---     number localX - The x position in local coordinates.
---     number localY - The y position in local coordinates.
---@return number, number
function Body.getLocalPoint(worldX, worldY) end

---
--- Transform a vector from world coordinates to local coordinates.
---
---@param worldX number The vector x component in world coordinates.
---@param worldY number The vector y component in world coordinates.
--- returns:
---     number localX - The vector x component in local coordinates.
---     number localY - The vector y component in local coordinates.
---@return number, number
function Body.getLocalVector(worldX, worldY) end

---
--- Get the mass of the body.
---
--- returns:
---     number mass - The mass of the body (in kilograms).
---@return number
function Body.getMass() end

---
--- Returns the mass, its center, and the rotational inertia.
---
--- returns:
---     number x - The x position of the center of mass.
---     number y - The y position of the center of mass.
---     number mass - The mass of the body.
---     number inertia - The rotational inertia.
---@return number, number, number, number
function Body.getMassData() end

---
--- Get the position of the body.
--- 
--- Note that this may not be the center of mass of the body.
---
--- returns:
---     number x - The x position.
---     number y - The y position.
---@return number, number
function Body.getPosition() end

---
--- Returns the type of the body.
---
--- returns:
---     BodyType type - The body type.
---@return BodyType
function Body.getType() end

---
--- Returns the Lua value associated with this Body.
---
--- returns:
---     any value - The Lua value associated with the Body.
---@return any
function Body.getUserData() end

---
--- Gets the World the body lives in.
---
--- returns:
---     World world - The world the body lives in.
---@return World
function Body.getWorld() end

---
--- Get the center of mass position in world coordinates.
--- 
--- Use Body:getLocalCenter to get the center of mass in local coordinates.
---
--- returns:
---     number x - The x coordinate of the center of mass.
---     number y - The y coordinate of the center of mass.
---@return number, number
function Body.getWorldCenter() end

---
--- Transform a point from local coordinates to world coordinates.
---
---@param localX number The x position in local coordinates.
---@param localY number The y position in local coordinates.
--- returns:
---     number worldX - The x position in world coordinates.
---     number worldY - The y position in world coordinates.
---@return number, number
function Body.getWorldPoint(localX, localY) end

---
--- Transforms multiple points from local coordinates to world coordinates.
---
---@param x1 number The x position of the first point.
---@param y1 number The y position of the first point.
---@param x2 number The x position of the second point.
---@param y2 number The y position of the second point.
---@param ... number More x and y points.
--- returns:
---     number x1 - The transformed x position of the first point.
---     number y1 - The transformed y position of the first point.
---     number x2 - The transformed x position of the second point.
---     number y2 - The transformed y position of the second point.
---     number ... - The transformed x and y positions of additional points.
---@return number, number, number, number, number
function Body.getWorldPoints(x1, y1, x2, y2, ...) end

---
--- Transform a vector from local coordinates to world coordinates.
---
---@param localX number The vector x component in local coordinates.
---@param localY number The vector y component in local coordinates.
--- returns:
---     number worldX - The vector x component in world coordinates.
---     number worldY - The vector y component in world coordinates.
---@return number, number
function Body.getWorldVector(localX, localY) end

---
--- Get the x position of the body in world coordinates.
---
--- returns:
---     number x - The x position in world coordinates.
---@return number
function Body.getX() end

---
--- Get the y position of the body in world coordinates.
---
--- returns:
---     number y - The y position in world coordinates.
---@return number
function Body.getY() end

---
--- Returns whether the body is actively used in the simulation.
---
--- returns:
---     boolean status - True if the body is active or false if not.
---@return boolean
function Body.isActive() end

---
--- Returns the sleep status of the body.
---
--- returns:
---     boolean status - True if the body is awake or false if not.
---@return boolean
function Body.isAwake() end

---
--- Get the bullet status of a body.
--- 
--- There are two methods to check for body collisions:
--- 
--- at their location when the world is updated (default)
--- 
--- using continuous collision detection (CCD)
--- 
--- The default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.
--- 
--- Note that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.
---
--- returns:
---     boolean status - The bullet status of the body.
---@return boolean
function Body.isBullet() end

---
--- Gets whether the Body is destroyed. Destroyed bodies cannot be used.
---
--- returns:
---     boolean destroyed - Whether the Body is destroyed.
---@return boolean
function Body.isDestroyed() end

---
--- Returns whether the body rotation is locked.
---
--- returns:
---     boolean fixed - True if the body's rotation is locked or false if not.
---@return boolean
function Body.isFixedRotation() end

---
--- Returns the sleeping behaviour of the body.
---
--- returns:
---     boolean status - True if the body is allowed to sleep or false if not.
---@return boolean
function Body.isSleepingAllowed() end

---
--- Resets the mass of the body by recalculating it from the mass properties of the fixtures.
---
function Body.resetMassData() end

---
--- Sets whether the body is active in the world.
--- 
--- An inactive body does not take part in the simulation. It will not move or cause any collisions.
---
---@param active boolean If the body is active or not.
function Body.setActive(active) end

---
--- Set the angle of the body.
--- 
--- The angle is measured in radians. If you need to transform it from degrees, use math.rad.
--- 
--- A value of 0 radians will mean "looking to the right". Although radians increase counter-clockwise, the y-axis points down so it becomes clockwise from our point of view.
--- 
--- It is possible to cause a collision with another body by changing its angle.
---
---@param angle number The angle in radians.
function Body.setAngle(angle) end

---
--- Sets the angular damping of a Body.
--- 
--- See Body:getAngularDamping for a definition of angular damping.
--- 
--- Angular damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will look unrealistic.
---
---@param damping number The new angular damping.
function Body.setAngularDamping(damping) end

---
--- Sets the angular velocity of a Body.
--- 
--- The angular velocity is the rate of change of angle over time.
--- 
--- This function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost.
---
---@param w number The new angular velocity, in radians per second
function Body.setAngularVelocity(w) end

---
--- Wakes the body up or puts it to sleep.
---
---@param awake boolean The body sleep status.
function Body.setAwake(awake) end

---
--- Set the bullet status of a body.
--- 
--- There are two methods to check for body collisions:
--- 
--- at their location when the world is updated (default)
--- 
--- using continuous collision detection (CCD)
--- 
--- The default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.
--- 
--- Note that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.
---
---@param status boolean The bullet status of the body.
function Body.setBullet(status) end

---
--- Set whether a body has fixed rotation.
--- 
--- Bodies with fixed rotation don't vary the speed at which they rotate.
---
---@param fixed boolean Whether the body should have fixed rotation.
function Body.setFixedRotation(fixed) end

---
--- Sets a new gravity scale factor for the body.
---
---@param scale number The new gravity scale factor.
function Body.setGravityScale(scale) end

---
--- Set the inertia of a body.
---
---@param inertia number The new moment of inertia, in kilograms per meter squared.
function Body.setInertia(inertia) end

---
--- Sets the linear damping of a Body
--- 
--- See Body:getLinearDamping for a definition of linear damping.
--- 
--- Linear damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will make the objects look "floaty".
---
---@param ld number The new linear damping.
function Body.setLinearDamping(ld) end

---
--- Sets a new linear velocity for the Body.
--- 
--- This function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost.
---
---@param x number The x component of the velocity vector.
---@param y number The y component of the velocity vector.
function Body.setLinearVelocity(x, y) end

---
--- Sets the mass in kilograms.
---
---@param mass number The mass, in kilograms.
function Body.setMass(mass) end

---
--- Overrides the calculated mass data.
---
---@param x number The x component of the center of mass in local coordinates.
---@param y number The y component of the center of mass in local coordinates.
---@param mass number The mass, in kilograms.
---@param inertia number The rotational inertia, in kilograms per squared meter.
function Body.setMassData(x, y, mass, inertia) end

---
--- Set the position of the body.
--- 
--- Note that this may not be the center of mass of the body.
---
---@param x number The x position.
---@param y number The y position.
function Body.setPosition(x, y) end

---
--- Sets the sleeping behaviour of the body.
---
---@param allowed boolean True if the body is allowed to sleep or false if not.
function Body.setSleepingAllowed(allowed) end

---
--- Sets a new body type.
---
---@param type BodyType The new type.
function Body.setType(type) end

---
--- Associates a Lua value with the Body.
--- 
--- To delete the reference, explicitly pass nil.
---
---@param value any The Lua value to associate with the Body.
function Body.setUserData(value) end

---
--- Set the x position of the body.
---
---@param x number The x position.
function Body.setX(x) end

---
--- Set the y position of the body.
---
---@param y number The y position.
function Body.setY(y) end

---
--- A ChainShape consists of multiple line segments. It can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.
--- 
--- Unlike the PolygonShape, the ChainShape does not have a vertices limit or has to form a convex shape, but self intersections are not supported.
---@class ChainShape
ChainShape = {}

---
--- Returns a child of the shape as an EdgeShape.
---
---@param index number The index of the child.
--- returns:
---     number EdgeShape - The child as an EdgeShape.
---@return number
function ChainShape.getChildEdge(index) end

---
--- Gets the vertex that establishes a connection to the next shape.
--- 
--- Setting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
---@param x number The x-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called.
---@param y number The y-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called.
function ChainShape.getNextVertex(x, y) end

---
--- Returns a point of the shape.
---
---@param index number The index of the point to return.
--- returns:
---     number x - The x-coordinate of the point.
---     number y - The y-coordinate of the point.
---@return number, number
function ChainShape.getPoint(index) end

---
--- Returns all points of the shape.
---
--- returns:
---     number x1 - The x-coordinate of the first point.
---     number y1 - The y-coordinate of the first point.
---     number x2 - The x-coordinate of the second point.
---     number y2 - The y-coordinate of the second point.
---     number ... - Additional x and y values.
---@return number, number, number, number, number
function ChainShape.getPoints() end

---
--- Gets the vertex that establishes a connection to the previous shape.
--- 
--- Setting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
--- returns:
---     number x - The x-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called.
---     number y - The y-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called.
---@return number, number
function ChainShape.getPreviousVertex() end

---
--- Returns the number of vertices the shape has.
---
--- returns:
---     number count - The number of vertices.
---@return number
function ChainShape.getVertexCount() end

---
--- Sets a vertex that establishes a connection to the next shape.
--- 
--- This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
---@param x number The x component of the vertex.
---@param y number The y component of the vertex.
function ChainShape.setNextVertex(x, y) end

---
--- Sets a vertex that establishes a connection to the previous shape.
--- 
--- This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
---@param x number The x component of the vertex.
---@param y number The y component of the vertex.
function ChainShape.setPreviousVertex(x, y) end

---
--- Circle extends Shape and adds a radius and a local position.
---@class CircleShape
CircleShape = {}

---
--- Gets the center point of the circle shape.
---
--- returns:
---     number x - The x-component of the center point of the circle.
---     number y - The y-component of the center point of the circle.
---@return number, number
function CircleShape.getPoint() end

---
--- Gets the radius of the circle shape.
---
--- returns:
---     number radius - The radius of the circle.
---@return number
function CircleShape.getRadius() end

---
--- Sets the location of the center of the circle shape.
---
---@param x number The x-component of the new center point of the circle.
---@param y number The y-component of the new center point of the circle.
function CircleShape.setPoint(x, y) end

---
--- Sets the radius of the circle.
---
---@param radius number The radius of the circle.
function CircleShape.setRadius(radius) end

---
--- Contacts are objects created to manage collisions in worlds.
---@class Contact
Contact = {}

---
--- Gets the two Fixtures that hold the shapes that are in contact.
---
--- returns:
---     Fixture fixtureA - The first Fixture.
---     Fixture fixtureB - The second Fixture.
---@return Fixture, Fixture
function Contact.getFixtures() end

---
--- Get the friction between two shapes that are in contact.
---
--- returns:
---     number friction - The friction of the contact.
---@return number
function Contact.getFriction() end

---
--- Get the normal vector between two shapes that are in contact.
--- 
--- This function returns the coordinates of a unit vector that points from the first shape to the second.
---
--- returns:
---     number nx - The x component of the normal vector.
---     number ny - The y component of the normal vector.
---@return number, number
function Contact.getNormal() end

---
--- Returns the contact points of the two colliding fixtures. There can be one or two points.
---
--- returns:
---     number x1 - The x coordinate of the first contact point. 
---     number y1 - The y coordinate of the first contact point.
---     number x2 - The x coordinate of the second contact point.
---     number y2 - The y coordinate of the second contact point.
---@return number, number, number, number
function Contact.getPositions() end

---
--- Get the restitution between two shapes that are in contact.
---
--- returns:
---     number restitution - The restitution between the two shapes.
---@return number
function Contact.getRestitution() end

---
--- Returns whether the contact is enabled. The collision will be ignored if a contact gets disabled in the preSolve callback.
---
--- returns:
---     boolean enabled - True if enabled, false otherwise.
---@return boolean
function Contact.isEnabled() end

---
--- Returns whether the two colliding fixtures are touching each other.
---
--- returns:
---     boolean touching - True if they touch or false if not.
---@return boolean
function Contact.isTouching() end

---
--- Resets the contact friction to the mixture value of both fixtures.
---
function Contact.resetFriction() end

---
--- Resets the contact restitution to the mixture value of both fixtures.
---
function Contact.resetRestitution() end

---
--- Enables or disables the contact.
---
---@param enabled boolean True to enable or false to disable.
function Contact.setEnabled(enabled) end

---
--- Sets the contact friction.
---
---@param friction number The contact friction.
function Contact.setFriction(friction) end

---
--- Sets the contact restitution.
---
---@param restitution number The contact restitution.
function Contact.setRestitution(restitution) end

---
--- A EdgeShape is a line segment. They can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.
---@class EdgeShape
EdgeShape = {}

---
--- Returns the local coordinates of the edge points.
---
--- returns:
---     number x1 - The x component of the first vertex.
---     number y1 - The y component of the first vertex.
---     number x2 - The x component of the second vertex.
---     number y2 - The y component of the second vertex.
---@return number, number, number, number
function EdgeShape.getPoints() end

---
--- Gets the vertex that establishes a connection to the next shape.
--- 
--- Setting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
--- returns:
---     number x - The x-component of the vertex, or nil if EdgeShape:setNextVertex hasn't been called.
---     number y - The y-component of the vertex, or nil if EdgeShape:setNextVertex hasn't been called.
---@return number, number
function EdgeShape.getNextVertex() end

---
--- Gets the vertex that establishes a connection to the previous shape.
--- 
--- Setting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
--- returns:
---     number x - The x-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn't been called.
---     number y - The y-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn't been called.
---@return number, number
function EdgeShape.getPreviousVertex() end

---
--- Sets a vertex that establishes a connection to the next shape.
--- 
--- This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
---@param x number The x-component of the vertex.
---@param y number The y-component of the vertex.
function EdgeShape.setNextVertex(x, y) end

---
--- Sets a vertex that establishes a connection to the previous shape.
--- 
--- This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---
---@param x number The x-component of the vertex.
---@param y number The y-component of the vertex.
function EdgeShape.setPreviousVertex(x, y) end

---
--- Keeps two bodies at the same distance.
---@class DistanceJoint
DistanceJoint = {}

---
--- Gets the damping ratio.
---
--- returns:
---     number ratio - The damping ratio.
---@return number
function DistanceJoint.getDampingRatio() end

---
--- Gets the response speed.
---
--- returns:
---     number Hz - The response speed.
---@return number
function DistanceJoint.getFrequency() end

---
--- Gets the equilibrium distance between the two Bodies.
---
--- returns:
---     number l - The length between the two Bodies.
---@return number
function DistanceJoint.getLength() end

---
--- Sets the damping ratio.
---
---@param ratio number The damping ratio.
function DistanceJoint.setDampingRatio(ratio) end

---
--- Sets the response speed.
---
---@param Hz number The response speed.
function DistanceJoint.setFrequency(Hz) end

---
--- Sets the equilibrium distance between the two Bodies.
---
---@param l number The length between the two Bodies.
function DistanceJoint.setLength(l) end

---
--- Fixtures attach shapes to bodies.
---@class Fixture
Fixture = {}

---
--- Destroys the fixture
---
function Fixture.destroy() end

---
--- Returns the body to which the fixture is attached.
---
--- returns:
---     Body body - The parent body.
---@return Body
function Fixture.getBody() end

---
--- Returns the points of the fixture bounding box. In case the fixture has multiple children a 1-based index can be specified. For example, a fixture will have multiple children with a chain shape.
---
---@param index number A bounding box of the fixture.
--- returns:
---     number topLeftX - The x position of the top-left point.
---     number topLeftY - The y position of the top-left point.
---     number bottomRightX - The x position of the bottom-right point.
---     number bottomRightY - The y position of the bottom-right point.
---@return number, number, number, number
function Fixture.getBoundingBox(index) end

---
--- Returns the categories the fixture belongs to.
---
--- returns:
---     number category1 - The first category.
---     number category2 - The second category.
---     number ... - Additional categories.
---@return number, number, number
function Fixture.getCategory() end

---
--- Returns the density of the fixture.
---
--- returns:
---     number density - The fixture density in kilograms per square meter.
---@return number
function Fixture.getDensity() end

---
--- Returns the filter data of the fixture. Categories and masks are encoded as the bits of a 16-bit integer.
---
--- returns:
---     number categories - The categories as an integer from 0 to 65535.
---     number mask - The mask as an integer from 0 to 65535.
---     number group - The group as an integer from -32768 to 32767.
---@return number, number, number
function Fixture.getFilterData() end

---
--- Returns the friction of the fixture.
---
--- returns:
---     number friction - The fixture friction.
---@return number
function Fixture.getFriction() end

---
--- Returns the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it's negative. The group zero means no group.
--- 
--- The groups range from -32768 to 32767.
---
--- returns:
---     number group - The group of the fixture.
---@return number
function Fixture.getGroupIndex() end

---
--- Returns the category mask of the fixture.
---
--- returns:
---     number mask1 - The first category selected by the mask.
---     number mask2 - The second category selected by the mask.
---     number ... - Additional categories selected by the mask.
---@return number, number, number
function Fixture.getMask() end

---
--- Returns the mass, its center and the rotational inertia.
---
--- returns:
---     number x - The x position of the center of mass.
---     number y - The y position of the center of mass.
---     number mass - The mass of the fixture.
---     number inertia - The rotational inertia.
---@return number, number, number, number
function Fixture.getMassData() end

---
--- Returns the restitution of the fixture.
---
--- returns:
---     number restitution - The fixture restitution.
---@return number
function Fixture.getRestitution() end

---
--- Returns the shape of the fixture. This shape is a reference to the actual data used in the simulation. It's possible to change its values between timesteps.
--- 
--- Do not call any functions on this shape after the parent fixture has been destroyed. This shape will point to an invalid memory address and likely cause crashes if you interact further with it.
---
--- returns:
---     Shape shape - The fixture's shape.
---@return Shape
function Fixture.getShape() end

---
--- Returns the Lua value associated with this fixture.
--- 
--- Use this function in one thread only.
---
--- returns:
---     any value - The Lua value associated with the fixture.
---@return any
function Fixture.getUserData() end

---
--- Gets whether the Fixture is destroyed. Destroyed fixtures cannot be used.
---
--- returns:
---     boolean destroyed - Whether the Fixture is destroyed.
---@return boolean
function Fixture.isDestroyed() end

---
--- Returns whether the fixture is a sensor.
---
--- returns:
---     boolean sensor - If the fixture is a sensor.
---@return boolean
function Fixture.isSensor() end

---
--- Casts a ray against the shape of the fixture and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned.
--- 
--- The ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.
--- 
--- The childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.
--- 
--- The world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.
--- 
--- hitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction
---
---@param x1 number The x position of the ray starting point.
---@param y1 number The y position of the ray starting point.
---@param x2 number The x position of the ray end point.
---@param y2 number The y position of the ray end point.
---@param maxFraction number The maximum distance the ray is going to travel as a number from 0 to 1.
---@param childIndex number The index of the child the ray gets cast against.
--- returns:
---     number x - The x position where the ray intersects with the shape.
---     number y - The y position where the ray intersects with the shape.
---     number fraction - The position on the input vector where the intersection happened as a number from 0 to 1.
---@return number, number, number
function Fixture.rayCast(x1, y1, x2, y2, maxFraction, childIndex) end

---
--- Sets the categories the fixture belongs to. There can be up to 16 categories represented as a number from 1 to 16.
---
---@param category1 number The first category.
---@param category2 number The second category.
---@param ... number Additional categories.
function Fixture.setCategory(category1, category2, ...) end

---
--- Sets the density of the fixture. Call Body:resetMassData if this needs to take effect immediately.
---
---@param density number The fixture density in kilograms per square meter.
function Fixture.setDensity(density) end

---
--- Sets the filter data of the fixture.
--- 
--- Groups, categories, and mask can be used to define the collision behaviour of the fixture.
--- 
--- If two fixtures are in the same group they either always collide if the group is positive, or never collide if it's negative. If the group is zero or they do not match, then the contact filter checks if the fixtures select a category of the other fixture with their masks. The fixtures do not collide if that's not the case. If they do have each other's categories selected, the return value of the custom contact filter will be used. They always collide if none was set.
--- 
--- There can be up to 16 categories. Categories and masks are encoded as the bits of a 16-bit integer.
---
---@param categories number The categories as an integer from 0 to 65535.
---@param mask number The mask as an integer from 0 to 65535.
---@param group number The group as an integer from -32768 to 32767.
function Fixture.setFilterData(categories, mask, group) end

---
--- Sets the friction of the fixture.
---
---@param friction number The fixture friction.
function Fixture.setFriction(friction) end

---
--- Sets the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it's negative. The group zero means no group.
--- 
--- The groups range from -32768 to 32767.
---
---@param group number The group as an integer from -32768 to 32767.
function Fixture.setGroupIndex(group) end

---
--- Sets the category mask of the fixture. There can be up to 16 categories represented as a number from 1 to 16.
--- 
--- This fixture will collide with the fixtures that are in the selected categories if the other fixture also has a category of this fixture selected.
---
---@param mask1 number The first category.
---@param mask2 number The second category.
---@param ... number Additional categories.
function Fixture.setMask(mask1, mask2, ...) end

---
--- Sets the restitution of the fixture.
---
---@param restitution number The fixture restitution.
function Fixture.setRestitution(restitution) end

---
--- Sets whether the fixture should act as a sensor.
--- 
--- Sensor do not produce collisions responses, but the begin and end callbacks will still be called for this fixture.
---
---@param sensor boolean The sensor status.
function Fixture.setSensor(sensor) end

---
--- Associates a Lua value with the fixture.
--- 
--- Use this function in one thread only.
---
---@param value any The Lua value associated with the fixture.
function Fixture.setUserData(value) end

---
--- Checks if a point is inside the shape of the fixture.
---
---@param x number The x position of the point.
---@param y number The y position of the point.
--- returns:
---     boolean isInside - True if the point is inside or false if it is outside.
---@return boolean
function Fixture.testPoint(x, y) end

---
--- A FrictionJoint applies friction to a body.
---@class FrictionJoint
FrictionJoint = {}

---
--- Gets the maximum friction force in Newtons.
---
--- returns:
---     number force - Maximum force in Newtons.
---@return number
function FrictionJoint.getMaxForce() end

---
--- Gets the maximum friction torque in Newton-meters.
---
--- returns:
---     number torque - Maximum torque in Newton-meters.
---@return number
function FrictionJoint.getMaxTorque() end

---
--- Sets the maximum friction force in Newtons.
---
---@param maxForce number Max force in Newtons.
function FrictionJoint.setMaxForce(maxForce) end

---
--- Sets the maximum friction torque in Newton-meters.
---
---@param torque number Maximum torque in Newton-meters.
function FrictionJoint.setMaxTorque(torque) end

---
--- Keeps bodies together in such a way that they act like gears.
---@class GearJoint
GearJoint = {}

---
--- Get the Joints connected by this GearJoint.
---
--- returns:
---     Joint joint1 - The first connected Joint.
---     Joint joint2 - The second connected Joint.
---@return Joint, Joint
function GearJoint.getJoints() end

---
--- Get the ratio of a gear joint.
---
--- returns:
---     number ratio - The ratio of the joint.
---@return number
function GearJoint.getRatio() end

---
--- Set the ratio of a gear joint.
---
---@param ratio number The new ratio of the joint.
function GearJoint.setRatio(ratio) end

---
--- Attach multiple bodies together to interact in unique ways.
---@class Joint
Joint = {}

---
--- Explicitly destroys the Joint. When you don't have time to wait for garbage collection, this function may be used to free the object immediately, but note that an error will occur if you attempt to use the object after calling this function.
---
function Joint.destroy() end

---
--- Get the anchor points of the joint.
---
--- returns:
---     number x1 - The x component of the anchor on Body 1.
---     number y1 - The y component of the anchor on Body 1.
---     number x2 - The x component of the anchor on Body 2.
---     number y2 - The y component of the anchor on Body 2.
---@return number, number, number, number
function Joint.getAnchors() end

---
--- Gets the bodies that the Joint is attached to.
---
--- returns:
---     Body bodyA - The first Body.
---     Body bodyB - The second Body.
---@return Body, Body
function Joint.getBodies() end

---
--- Gets whether the connected Bodies collide.
---
--- returns:
---     boolean c - True if they collide, false otherwise.
---@return boolean
function Joint.getCollideConnected() end

---
--- Gets the reaction force on Body 2 at the joint anchor.
---
--- returns:
---     number x - The x component of the force.
---     number y - The y component of the force.
---@return number, number
function Joint.getReactionForce() end

---
--- Returns the reaction torque on the second body.
---
---@param invdt number How long the force applies. Usually the inverse time step or 1/dt.
--- returns:
---     number torque - The reaction torque on the second body.
---@return number
function Joint.getReactionTorque(invdt) end

---
--- Gets a string representing the type.
---
--- returns:
---     JointType type - A string with the name of the Joint type.
---@return JointType
function Joint.getType() end

---
--- Returns the Lua value associated with this Joint.
---
--- returns:
---     any value - The Lua value associated with the Joint.
---@return any
function Joint.getUserData() end

---
--- Gets whether the Joint is destroyed. Destroyed joints cannot be used.
---
--- returns:
---     boolean destroyed - Whether the Joint is destroyed.
---@return boolean
function Joint.isDestroyed() end

---
--- Associates a Lua value with the Joint.
--- 
--- To delete the reference, explicitly pass nil.
---
---@param value any The Lua value to associate with the Joint.
function Joint.setUserData(value) end

---
--- Controls the relative motion between two Bodies. Position and rotation offsets can be specified, as well as the maximum motor force and torque that will be applied to reach the target offsets.
---@class MotorJoint
MotorJoint = {}

---
--- Gets the target angular offset between the two Bodies the Joint is attached to.
---
--- returns:
---     number angularoffset - The target angular offset in radians: the second body's angle minus the first body's angle.
---@return number
function MotorJoint.getAngularOffset() end

---
--- Gets the target linear offset between the two Bodies the Joint is attached to.
---
--- returns:
---     number x - The x component of the target linear offset, relative to the first Body.
---     number y - The y component of the target linear offset, relative to the first Body.
---@return number, number
function MotorJoint.getLinearOffset() end

---
--- Sets the target angluar offset between the two Bodies the Joint is attached to.
---
---@param angularoffset number The target angular offset in radians: the second body's angle minus the first body's angle.
function MotorJoint.setAngularOffset(angularoffset) end

---
--- Sets the target linear offset between the two Bodies the Joint is attached to.
---
---@param x number The x component of the target linear offset, relative to the first Body.
---@param y number The y component of the target linear offset, relative to the first Body.
function MotorJoint.setLinearOffset(x, y) end

---
--- For controlling objects with the mouse.
---@class MouseJoint
MouseJoint = {}

---
--- Returns the damping ratio.
---
--- returns:
---     number ratio - The new damping ratio.
---@return number
function MouseJoint.getDampingRatio() end

---
--- Returns the frequency.
---
--- returns:
---     number freq - The frequency in hertz.
---@return number
function MouseJoint.getFrequency() end

---
--- Gets the highest allowed force.
---
--- returns:
---     number f - The max allowed force.
---@return number
function MouseJoint.getMaxForce() end

---
--- Gets the target point.
---
--- returns:
---     number x - The x component of the target.
---     number y - The x component of the target.
---@return number, number
function MouseJoint.getTarget() end

---
--- Sets a new damping ratio.
---
---@param ratio number The new damping ratio.
function MouseJoint.setDampingRatio(ratio) end

---
--- Sets a new frequency.
---
---@param freq number The new frequency in hertz.
function MouseJoint.setFrequency(freq) end

---
--- Sets the highest allowed force.
---
---@param f number The max allowed force.
function MouseJoint.setMaxForce(f) end

---
--- Sets the target point.
---
---@param x number The x component of the target.
---@param y number The y component of the target.
function MouseJoint.setTarget(x, y) end

---
--- Polygon is a convex polygon with up to 8 sides.
---@class PolygonShape
PolygonShape = {}

---
--- Get the local coordinates of the polygon's vertices.
--- 
--- This function has a variable number of return values. It can be used in a nested fashion with love.graphics.polygon.
--- 
--- This function may have up to 16 return values, since it returns two values for each vertex in the polygon. In other words, it can return the coordinates of up to 8 points.
---
--- returns:
---     number x1 - The x component of the first vertex.
---     number y1 - The y component of the first vertex.
---     number x2 - The x component of the second vertex.
---     number y2 - The y component of the second vertex.
---     number ... - Additional x and y values.
---@return number, number, number, number, number
function PolygonShape.getPoints() end

---
--- Restricts relative motion between Bodies to one shared axis.
---@class PrismaticJoint
PrismaticJoint = {}

---
--- Checks whether the limits are enabled.
---
--- returns:
---     boolean enabled - True if enabled, false otherwise.
---@return boolean
function PrismaticJoint.areLimitsEnabled() end

---
--- Gets the world-space axis vector of the Prismatic Joint.
---
--- returns:
---     number x - The x-axis coordinate of the world-space axis vector.
---     number y - The y-axis coordinate of the world-space axis vector.
---@return number, number
function PrismaticJoint.getAxis() end

---
--- Get the current joint angle speed.
---
--- returns:
---     number s - Joint angle speed in meters/second.
---@return number
function PrismaticJoint.getJointSpeed() end

---
--- Get the current joint translation.
---
--- returns:
---     number t - Joint translation, usually in meters.
---@return number
function PrismaticJoint.getJointTranslation() end

---
--- Gets the joint limits.
---
--- returns:
---     number lower - The lower limit, usually in meters.
---     number upper - The upper limit, usually in meters.
---@return number, number
function PrismaticJoint.getLimits() end

---
--- Gets the lower limit.
---
--- returns:
---     number lower - The lower limit, usually in meters.
---@return number
function PrismaticJoint.getLowerLimit() end

---
--- Gets the maximum motor force.
---
--- returns:
---     number f - The maximum motor force, usually in N.
---@return number
function PrismaticJoint.getMaxMotorForce() end

---
--- Get the current motor force.
---
--- returns:
---     number f - The current motor force, usually in N.
---@return number
function PrismaticJoint.getMotorForce() end

---
--- Gets the motor speed.
---
--- returns:
---     number s - The motor speed, usually in meters per second.
---@return number
function PrismaticJoint.getMotorSpeed() end

---
--- Gets the upper limit.
---
--- returns:
---     number upper - The upper limit, usually in meters.
---@return number
function PrismaticJoint.getUpperLimit() end

---
--- Checks whether the motor is enabled.
---
--- returns:
---     boolean enabled - True if enabled, false if disabled.
---@return boolean
function PrismaticJoint.isMotorEnabled() end

---
--- Sets the limits.
---
---@param lower number The lower limit, usually in meters.
---@param upper number The upper limit, usually in meters.
function PrismaticJoint.setLimits(lower, upper) end

---
--- Enables or disables the limits of the joint.
---
---@param enable boolean True to enable, false to disable.
function PrismaticJoint.setLimitsEnabled(enable) end

---
--- Sets the lower limit.
---
---@param lower number The lower limit, usually in meters.
function PrismaticJoint.setLowerLimit(lower) end

---
--- Set the maximum motor force.
---
---@param f number The maximum motor force, usually in N.
function PrismaticJoint.setMaxMotorForce(f) end

---
--- Starts or stops the joint motor.
---
---@param enable boolean True to enable, false to disable.
function PrismaticJoint.setMotorEnabled(enable) end

---
--- Sets the motor speed.
---
---@param s number The motor speed, usually in meters per second.
function PrismaticJoint.setMotorSpeed(s) end

---
--- Sets the upper limit.
---
---@param upper number The upper limit, usually in meters.
function PrismaticJoint.setUpperLimit(upper) end

---
--- Allows you to simulate bodies connected through pulleys.
---@class PulleyJoint
PulleyJoint = {}

---
--- Get the total length of the rope.
---
--- returns:
---     number length - The length of the rope in the joint.
---@return number
function PulleyJoint.getConstant() end

---
--- Get the ground anchor positions in world coordinates.
---
--- returns:
---     number a1x - The x coordinate of the first anchor.
---     number a1y - The y coordinate of the first anchor.
---     number a2x - The x coordinate of the second anchor.
---     number a2y - The y coordinate of the second anchor.
---@return number, number, number, number
function PulleyJoint.getGroundAnchors() end

---
--- Get the current length of the rope segment attached to the first body.
---
--- returns:
---     number length - The length of the rope segment.
---@return number
function PulleyJoint.getLengthA() end

---
--- Get the current length of the rope segment attached to the second body.
---
--- returns:
---     number length - The length of the rope segment.
---@return number
function PulleyJoint.getLengthB() end

---
--- Get the maximum lengths of the rope segments.
---
--- returns:
---     number len1 - The maximum length of the first rope segment.
---     number len2 - The maximum length of the second rope segment.
---@return number, number
function PulleyJoint.getMaxLengths() end

---
--- Get the pulley ratio.
---
--- returns:
---     number ratio - The pulley ratio of the joint.
---@return number
function PulleyJoint.getRatio() end

---
--- Set the total length of the rope.
--- 
--- Setting a new length for the rope updates the maximum length values of the joint.
---
---@param length number The new length of the rope in the joint.
function PulleyJoint.setConstant(length) end

---
--- Set the maximum lengths of the rope segments.
--- 
--- The physics module also imposes maximum values for the rope segments. If the parameters exceed these values, the maximum values are set instead of the requested values.
---
---@param max1 number The new maximum length of the first segment.
---@param max2 number The new maximum length of the second segment.
function PulleyJoint.setMaxLengths(max1, max2) end

---
--- Set the pulley ratio.
---
---@param ratio number The new pulley ratio of the joint.
function PulleyJoint.setRatio(ratio) end

---
--- Allow two Bodies to revolve around a shared point.
---@class RevoluteJoint
RevoluteJoint = {}

---
--- Checks whether the limits are enabled.
---
--- returns:
---     boolean enabled - True if enabled, false otherwise.
---@return boolean
function RevoluteJoint.areLimitsEnabled() end

---
--- Enables or disables the joint limits.
---
---@param enable boolean True to enable, false to disable.
function RevoluteJoint.setLimitsEnabled(enable) end

---
--- Starts or stops the joint motor.
---
---@param enable boolean True to enable, false to disable.
function RevoluteJoint.setMotorEnabled(enable) end

---
--- Get the current joint angle.
---
--- returns:
---     number angle - The joint angle in radians.
---@return number
function RevoluteJoint.getJointAngle() end

---
--- Get the current joint angle speed.
---
--- returns:
---     number s - Joint angle speed in radians/second.
---@return number
function RevoluteJoint.getJointSpeed() end

---
--- Gets the joint limits.
---
--- returns:
---     number lower - The lower limit, in radians.
---     number upper - The upper limit, in radians.
---@return number, number
function RevoluteJoint.getLimits() end

---
--- Gets the lower limit.
---
--- returns:
---     number lower - The lower limit, in radians.
---@return number
function RevoluteJoint.getLowerLimit() end

---
--- Gets the maximum motor force.
---
--- returns:
---     number f - The maximum motor force, in Nm.
---@return number
function RevoluteJoint.getMaxMotorTorque() end

---
--- Gets the motor speed.
---
--- returns:
---     number s - The motor speed, radians per second.
---@return number
function RevoluteJoint.getMotorSpeed() end

---
--- Get the current motor force.
---
--- returns:
---     number f - The current motor force, in Nm.
---@return number
function RevoluteJoint.getMotorTorque() end

---
--- Gets the upper limit.
---
--- returns:
---     number upper - The upper limit, in radians.
---@return number
function RevoluteJoint.getUpperLimit() end

---
--- Checks whether the motor is enabled.
---
--- returns:
---     boolean enabled - True if enabled, false if disabled.
---@return boolean
function RevoluteJoint.isMotorEnabled() end

---
--- Sets the limits.
---
---@param lower number The lower limit, in radians.
---@param upper number The upper limit, in radians.
function RevoluteJoint.setLimits(lower, upper) end

---
--- Sets the lower limit.
---
---@param lower number The lower limit, in radians.
function RevoluteJoint.setLowerLimit(lower) end

---
--- Set the maximum motor force.
---
---@param f number The maximum motor force, in Nm.
function RevoluteJoint.setMaxMotorTorque(f) end

---
--- Sets the motor speed.
---
---@param s number The motor speed, radians per second.
function RevoluteJoint.setMotorSpeed(s) end

---
--- Sets the upper limit.
---
---@param upper number The upper limit, in radians.
function RevoluteJoint.setUpperLimit(upper) end

---
--- The RopeJoint enforces a maximum distance between two points on two bodies. It has no other effect.
---@class RopeJoint
RopeJoint = {}

---
--- Gets the maximum length of a RopeJoint.
---
--- returns:
---     number maxLength - The maximum length of the RopeJoint.
---@return number
function RopeJoint.getMaxLength() end

---
--- Sets the maximum length of a RopeJoint.
---
---@param maxLength number The maximum length of the RopeJoint.
function RopeJoint.setMaxLength(maxLength) end

---
--- Shapes are solid 2d geometrical objects used in love.physics.
--- 
--- Shapes are attached to a Body via a Fixture. The Shape object is copied when this happens. Shape position is relative to Body position.
---@class Shape
Shape = {}

---
--- Returns the points of the bounding box for the transformed shape.
---
---@param tx number The translation of the shape on the x-axis.
---@param ty number The translation of the shape on the y-axis.
---@param tr number The shape rotation.
---@param childIndex number The index of the child to compute the bounding box of.
--- returns:
---     number topLeftX - The x position of the top-left point.
---     number topLeftY - The y position of the top-left point.
---     number bottomRightX - The x position of the bottom-right point.
---     number bottomRightY - The y position of the bottom-right point.
---@return number, number, number, number
function Shape.computeAABB(tx, ty, tr, childIndex) end

---
--- Computes the mass properties for the shape with the specified density.
---
---@param density number The shape density.
--- returns:
---     number x - The x postition of the center of mass.
---     number y - The y postition of the center of mass.
---     number mass - The mass of the shape.
---     number inertia - The rotational inertia.
---@return number, number, number, number
function Shape.computeMass(density) end

---
--- Returns the number of children the shape has.
---
--- returns:
---     number count - The number of children.
---@return number
function Shape.getChildCount() end

---
--- Gets the radius of the shape.
---
--- returns:
---     number radius - The radius of the shape.
---@return number
function Shape.getRadius() end

---
--- Gets a string representing the Shape. This function can be useful for conditional debug drawing.
---
--- returns:
---     ShapeType type - The type of the Shape.
---@return ShapeType
function Shape.getType() end

---
--- Casts a ray against the shape and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned. The Shape can be transformed to get it into the desired position.
--- 
--- The ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.
--- 
--- The childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.
--- 
--- The world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.
--- 
--- hitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction
---
---@param x1 number The x position of the input line starting point.
---@param y1 number The y position of the input line starting point.
---@param x2 number The x position of the input line end point.
---@param y2 number The y position of the input line end point.
---@param maxFraction number Ray length parameter.
---@param tx number The translation of the shape on the x-axis.
---@param ty number The translation of the shape on the y-axis.
---@param tr number The shape rotation.
---@param childIndex number The index of the child the ray gets cast against.
--- returns:
---     number xn - The x component of the normal vector of the edge where the ray hit the shape.
---     number yn - The y component of the normal vector of the edge where the ray hit the shape.
---     number fraction - The position on the input line where the intersection happened as a factor of the line length.
---@return number, number, number
function Shape.rayCast(x1, y1, x2, y2, maxFraction, tx, ty, tr, childIndex) end

---
--- Checks whether a point lies inside the shape. This is particularly useful for mouse interaction with the shapes. By looping through all shapes and testing the mouse position with this function, we can find which shapes the mouse touches.
---
---@param x number The x component of the point.
---@param y number The y component of the point.
--- returns:
---     boolean hit - True if inside, false if outside
---@return boolean
function Shape.testPoint(x, y) end

---
--- A WeldJoint essentially glues two bodies together.
---@class WeldJoint
WeldJoint = {}

---
--- Returns the damping ratio of the joint.
---
--- returns:
---     number ratio - The damping ratio.
---@return number
function WeldJoint.getDampingRatio() end

---
--- Returns the frequency.
---
--- returns:
---     number freq - The frequency in hertz.
---@return number
function WeldJoint.getFrequency() end

---
--- The new damping ratio.
---
---@param ratio number The new damping ratio.
function WeldJoint.setDampingRatio(ratio) end

---
--- Sets a new frequency.
---
---@param freq number The new frequency in hertz.
function WeldJoint.setFrequency(freq) end

---
--- Restricts a point on the second body to a line on the first body.
---@class WheelJoint
WheelJoint = {}

---
--- Gets the world-space axis vector of the Wheel Joint.
---
--- returns:
---     number x - The x-axis coordinate of the world-space axis vector.
---     number y - The y-axis coordinate of the world-space axis vector.
---@return number, number
function WheelJoint.getAxis() end

---
--- Returns the current joint translation speed.
---
--- returns:
---     number speed - The translation speed of the joint in meters per second.
---@return number
function WheelJoint.getJointSpeed() end

---
--- Returns the current joint translation.
---
--- returns:
---     number position - The translation of the joint in meters.
---@return number
function WheelJoint.getJointTranslation() end

---
--- Returns the maximum motor torque.
---
--- returns:
---     number maxTorque - The maximum torque of the joint motor in newton meters.
---@return number
function WheelJoint.getMaxMotorTorque() end

---
--- Returns the speed of the motor.
---
--- returns:
---     number speed - The speed of the joint motor in radians per second.
---@return number
function WheelJoint.getMotorSpeed() end

---
--- Returns the current torque on the motor.
---
---@param invdt number How long the force applies. Usually the inverse time step or 1/dt.
--- returns:
---     number torque - The torque on the motor in newton meters.
---@return number
function WheelJoint.getMotorTorque(invdt) end

---
--- Returns the damping ratio.
---
--- returns:
---     number ratio - The damping ratio.
---@return number
function WheelJoint.getSpringDampingRatio() end

---
--- Returns the spring frequency.
---
--- returns:
---     number freq - The frequency in hertz.
---@return number
function WheelJoint.getSpringFrequency() end

---
--- Sets a new maximum motor torque.
---
---@param maxTorque number The new maximum torque for the joint motor in newton meters.
function WheelJoint.setMaxMotorTorque(maxTorque) end

---
--- Starts and stops the joint motor.
---
---@param enable boolean True turns the motor on and false turns it off.
function WheelJoint.setMotorEnabled(enable) end

---
--- Sets a new speed for the motor.
---
---@param speed number The new speed for the joint motor in radians per second.
function WheelJoint.setMotorSpeed(speed) end

---
--- Sets a new damping ratio.
---
---@param ratio number The new damping ratio.
function WheelJoint.setSpringDampingRatio(ratio) end

---
--- Sets a new spring frequency.
---
---@param freq number The new frequency in hertz.
function WheelJoint.setSpringFrequency(freq) end

---
--- A world is an object that contains all bodies and joints.
---@class World
World = {}

---
--- Destroys the world, taking all bodies, joints, fixtures and their shapes with it.
--- 
--- An error will occur if you attempt to use any of the destroyed objects after calling this function.
---
function World.destroy() end

---
--- Get the number of bodies in the world.
---
--- returns:
---     number n - The number of bodies in the world.
---@return number
function World.getBodyCount() end

---
--- Returns a table with all bodies.
---
--- returns:
---     table bodies - A sequence with all bodies.
---@return table
function World.getBodyList() end

---
--- Returns functions for the callbacks during the world update.
---
--- returns:
---     function beginContact - Gets called when two fixtures begin to overlap.
---     function endContact - Gets called when two fixtures cease to overlap.
---     function preSolve - Gets called before a collision gets resolved.
---     function postSolve - Gets called after the collision has been resolved.
---@return function, function, function, function
function World.getCallbacks() end

---
--- Returns the number of contacts in the world.
---
--- returns:
---     number n - The number of contacts in the world.
---@return number
function World.getContactCount() end

---
--- Returns the function for collision filtering.
---
--- returns:
---     function contactFilter - The function that handles the contact filtering.
---@return function
function World.getContactFilter() end

---
--- Returns a table with all contacts.
---
--- returns:
---     table contacts - A sequence with all contacts.
---@return table
function World.getContactList() end

---
--- Get the gravity of the world.
---
--- returns:
---     number x - The x component of gravity.
---     number y - The y component of gravity.
---@return number, number
function World.getGravity() end

---
--- Get the number of joints in the world.
---
--- returns:
---     number n - The number of joints in the world.
---@return number
function World.getJointCount() end

---
--- Returns a table with all joints.
---
--- returns:
---     table joints - A sequence with all joints.
---@return table
function World.getJointList() end

---
--- Gets whether the World is destroyed. Destroyed worlds cannot be used.
---
--- returns:
---     boolean destroyed - Whether the World is destroyed.
---@return boolean
function World.isDestroyed() end

---
--- Returns if the world is updating its state.
--- 
--- This will return true inside the callbacks from World:setCallbacks.
---
--- returns:
---     boolean locked - Will be true if the world is in the process of updating its state.
---@return boolean
function World.isLocked() end

---
--- Returns the sleep behaviour of the world.
---
--- returns:
---     boolean allowSleep - True if the bodies are allowed to sleep or false if not.
---@return boolean
function World.isSleepingAllowed() end

---
--- Calls a function for each fixture inside the specified area.
---
---@param topLeftX number The x position of the top-left point.
---@param topLeftY number The y position of the top-left point.
---@param bottomRightX number The x position of the bottom-right point.
---@param bottomRightY number The y position of the bottom-right point.
---@param callback function This function gets passed one argument, the fixture, and should return a boolean. The search will continue if it is true or stop if it is false.
function World.queryBoundingBox(topLeftX, topLeftY, bottomRightX, bottomRightY, callback) end

---
--- Casts a ray and calls a function for each fixtures it intersects.
---
---@param x1 number The x position of the starting point of the ray.
---@param y1 number The y position of the starting point of the ray.
---@param x2 number The x position of the end point of the ray.
---@param y2 number The y position of the end point of the ray.
---@param callback function This function gets six arguments and should return a number.
function World.rayCast(x1, y1, x2, y2, callback) end

---
--- Sets functions for the collision callbacks during the world update.
--- 
--- Four Lua functions can be given as arguments. The value nil removes a function.
--- 
--- When called, each function will be passed three arguments. The first two arguments are the colliding fixtures and the third argument is the Contact between them. The PostSolve callback additionally gets the normal and tangent impulse for each contact point.
---
---@param beginContact function Gets called when two fixtures begin to overlap. 
---@param endContact function Gets called when two fixtures cease to overlap.
---@param preSolve function Gets called before a collision gets resolved.
---@param postSolve function Gets called after the collision has been resolved.
function World.setCallbacks(beginContact, endContact, preSolve, postSolve) end

---
--- Sets a function for collision filtering.
--- 
--- If the group and category filtering doesn't generate a collision decision, this function gets called with the two fixtures as arguments. The function should return a boolean value where true means the fixtures will collide and false means they will pass through each other.
---
---@param filter function The function handling the contact filtering.
function World.setContactFilter(filter) end

---
--- Set the gravity of the world.
---
---@param x number The x component of gravity.
---@param y number The y component of gravity.
function World.setGravity(x, y) end

---
--- Set the sleep behaviour of the world.
--- 
--- A sleeping body is much more efficient to simulate than when awake.
--- 
--- If sleeping is allowed, any body that has come to rest will sleep.
---
---@param allowSleep boolean True if the bodies are allowed to sleep or false if not.
function World.setSleepingAllowed(allowSleep) end

---
--- Translates the World's origin. Useful in large worlds where floating point precision issues become noticeable at far distances from the origin.
---
---@param x number The x component of the new origin with respect to the old origin.
---@param y number The y component of the new origin with respect to the old origin.
function World.translateOrigin(x, y) end

---
--- Update the state of the world.
---
---@param dt number The time (in seconds) to advance the physics simulation.
---@param velocityiterations number The maximum number of steps used to determine the new velocities when resolving a collision.
---@param positioniterations number The maximum number of steps used to determine the new positions when resolving a collision.
function World.update(dt, velocityiterations, positioniterations) end

---
--- This module is responsible for decoding sound files. It can't play the sounds, see love.audio for that.
---
local sound = {}
love.sound = sound

---
--- Attempts to find a decoder for the encoded sound data in the specified file.
---
---@param file File The file with encoded sound data.
---@param buffer number The size of each decoded chunk, in bytes.
--- returns:
---     Decoder decoder - A new Decoder object.
---@return Decoder
function sound.newDecoder(file, buffer) end

---@param filename string The filename of the file with encoded sound data.
---@param buffer number The size of each decoded chunk, in bytes.
--- returns:
---     Decoder decoder - A new Decoder object.
---@return Decoder
function sound.newDecoder(filename, buffer) end

---
--- Creates new SoundData from a file. It's also possible to create SoundData with a custom sample rate, channel and bit depth.
--- 
--- The sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.
---
---@param filename string The filename of the file to load.
--- returns:
---     SoundData soundData - A new SoundData object.
---@return SoundData
function sound.newSoundData(filename) end

---@param file File A File pointing to an audio file.
--- returns:
---     SoundData soundData - A new SoundData object.
---@return SoundData
function sound.newSoundData(file) end

---@param data Data The encoded data to decode into audio.
--- returns:
---     SoundData soundData - A new SoundData object.
---@return SoundData
function sound.newSoundData(data) end

---@param samples number Total number of samples.
---@param rate number Number of samples per second
---@param bits number Bits per sample (8 or 16).
---@param channels number Either 1 for mono or 2 for stereo.
--- returns:
---     SoundData soundData - A new SoundData object.
---@return SoundData
function sound.newSoundData(samples, rate, bits, channels) end

---
--- An object which can gradually decode a sound file.
---@class Decoder
Decoder = {}

---
--- Returns the number of bits per sample.
---
--- returns:
---     number bitDepth - Either 8 or 16.
---@return number
function Decoder.getBitDepth() end

---
--- Returns the number of channels in the stream.
---
--- returns:
---     number channels - 1 for mono, 2 for stereo.
---@return number
function Decoder.getChannelCount() end

---
--- Gets the duration of the sound file. It may not always be sample-accurate, and it may return -1 if the duration cannot be determined at all.
---
--- returns:
---     number duration - The duration of the sound file in seconds, or -1 if it cannot be determined.
---@return number
function Decoder.getDuration() end

---
--- Returns the sample rate of the Decoder.
---
--- returns:
---     number rate - Number of samples per second.
---@return number
function Decoder.getSampleRate() end

---
--- Contains raw audio samples. You can not play SoundData back directly. You must wrap a Source object around it.
---@class SoundData
SoundData = {}

---
--- Returns the number of bits per sample.
---
--- returns:
---     number bits - Either 8 or 16.
---@return number
function SoundData.getBitDepth() end

---
--- Returns the number of channels in the stream.
---
--- returns:
---     number channels - 1 for mono, 2 for stereo.
---@return number
function SoundData.getChannelCount() end

---
--- Gets the duration of the sound data.
---
--- returns:
---     number duration - The duration of the sound data in seconds.
---@return number
function SoundData.getDuration() end

---
--- Gets the sample at the specified position.
---
---@param i number An integer value specifying the position of the sample (0 points to the first sample).
--- returns:
---     number sample - The normalized sample (range -1.0 to 1.0).
---@return number
function SoundData.getSample(i) end

---
--- Returns the number of samples per channel of the SoundData.
---
--- returns:
---     number count - Total number of samples.
---@return number
function SoundData.getSampleCount() end

---
--- Returns the sample rate of the SoundData.
---
--- returns:
---     number rate - Number of samples per second.
---@return number
function SoundData.getSampleRate() end

---
--- Sets the sample at the specified position.
---
---@param i number The position of the sample (0 means first sample).
---@param sample number A normalized sample (range -1.0 to 1.0).
function SoundData.setSample(i, sample) end

---
--- Provides access to information about the user's system.
---
local system = {}
love.system = system

---
--- Gets text from the clipboard.
---
--- returns:
---     string text - The text currently held in the system's clipboard.
---@return string
function system.getClipboardText() end

---
--- Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)
---
--- returns:
---     string osString - The current operating system. "OS X", "Windows", "Linux", "Android" or "iOS".
---@return string
function system.getOS() end

---
--- Gets information about the system's power supply.
---
--- returns:
---     PowerState state - The basic state of the power supply.
---     number percent - Percentage of battery life left, between 0 and 100. nil if the value can't be determined or there's no battery.
---     number seconds - Seconds of battery life left. nil if the value can't be determined or there's no battery.
---@return PowerState, number, number
function system.getPowerInfo() end

---
--- Gets the amount of logical processor in the system.
---
--- returns:
---     number processorCount - Amount of logical processors.
---@return number
function system.getProcessorCount() end

---
--- Opens a URL with the user's web or file browser.
---
---@param url string The URL to open. Must be formatted as a proper URL.
--- 
--- To open a file or folder, "file://" must be prepended to the path.
--- returns:
---     boolean success - Whether the URL was opened successfully.
---@return boolean
function system.openURL(url) end

---
--- Puts text in the clipboard.
---
---@param text string The new text to hold in the system's clipboard.
function system.setClipboardText(text) end

---
--- Causes the device to vibrate, if possible. Currently this will only work on Android and iOS devices that have a built-in vibration motor.
---
---@param seconds number The duration to vibrate for. If called on an iOS device, it will always vibrate for 0.5 seconds due to limitations in the iOS system APIs.
function system.vibrate(seconds) end

---
--- Allows you to work with threads.
--- 
--- Threads are separate Lua environments, running in parallel to the main code. As their code runs separately, they can be used to compute complex operations without adversely affecting the frame rate of the main thread. However, as they are separate environments, they cannot access the variables and functions of the main thread, and communication between threads is limited.
--- 
--- All LOVE objects (userdata) are shared among threads so you'll only have to send their references across threads. You may run into concurrency issues if you manipulate an object on multiple threads at the same time.
--- 
--- When a Thread is started, it only loads the love.thread module. Every other module has to be loaded with require.
---
local thread = {}
love.thread = thread

---
--- Creates or retrieves a named thread channel.
---
---@param name string The name of the channel you want to create or retrieve.
--- returns:
---     Channel channel - A named channel object which can be further manipulated.
---@return Channel
function thread.getChannel(name) end

---
--- Create a new unnamed thread channel.
--- 
--- One use for them is to pass new unnamed channels to other threads via Channel:push
---
--- returns:
---     Channel channel - A unnamed channel object which can be further manipulated.
---@return Channel
function thread.newChannel() end

---
--- Creates a new Thread from a File or Data object.
---
---@param filename string The name of the Lua File to use as source.
--- returns:
---     Thread thread - A new Thread that has yet to be started.
---@return Thread
function thread.newThread(filename) end

---@param fileData FileData The FileData containing the Lua code to use as the source.
--- returns:
---     Thread thread - A new Thread that has yet to be started.
---@return Thread
function thread.newThread(fileData) end

---@param codestring string A string containing the Lua code to use as the source. It needs to either be at least 1024 characters long, or contain at least one newline.
--- returns:
---     Thread thread - A new Thread that has yet to be started.
---@return Thread
function thread.newThread(codestring) end

---
--- A Thread is a chunk of code that can run in parallel with other threads. Data can be sent between different threads with Channel objects.
---@class Thread
Thread = {}

---
--- Retrieves the error string from the thread if it produced an error.
---
--- returns:
---     string message - The error message.
---@return string
function Thread.getError() end

---
--- Starts the thread.
--- 
--- Threads can be restarted after they have completed their execution.
---
function Thread.start() end

---@param arg1 Variant A string, number, boolean, LÖVE object, or simple table.
---@param arg2 Variant A string, number, boolean, LÖVE object, or simple table.
---@param ... Variant You can continue passing values to the thread.
function Thread.start(arg1, arg2, ...) end

---
--- Wait for a thread to finish. This call will block until the thread finishes.
---
function Thread.wait() end

---
--- Returns whether the thread is currently running.
--- 
--- Threads which are not running can be (re)started with Thread:start.
---
--- returns:
---     boolean running - True if the thread is running, false otherwise.
---@return boolean
function Thread.isRunning() end

---
--- A channel is a way to send and receive data to and from different threads.
---@class Channel
Channel = {}

---
--- Clears all the messages in the Channel queue.
---
function Channel.clear() end

---
--- Retrieves the value of a Channel message and removes it from the message queue.
--- 
--- It waits until a message is in the queue then returns the message value.
---
--- returns:
---     Variant value - The contents of the message.
---@return Variant
function Channel.demand() end

---@param timeout number The maximum amount of time to wait.
--- returns:
---     Variant value - The contents of the message or nil if the timeout expired.
---@return Variant
function Channel.demand(timeout) end

---
--- Retrieves the number of messages in the thread Channel queue.
---
--- returns:
---     number count - The number of messages in the queue.
---@return number
function Channel.getCount() end

---
--- Gets whether a pushed value has been popped or otherwise removed from the Channel.
---
---@param id number An id value previously returned by Channel:push.
--- returns:
---     boolean hasread - Whether the value represented by the id has been removed from the Channel via Channel:pop, Channel:demand, or Channel:clear.
---@return boolean
function Channel.hasRead(id) end

---
--- Retrieves the value of a Channel message, but leaves it in the queue.
--- 
--- It returns nil if there's no message in the queue.
---
--- returns:
---     Variant value - The contents of the message.
---@return Variant
function Channel.peek() end

---
--- Executes the specified function atomically with respect to this Channel.
--- 
--- Calling multiple methods in a row on the same Channel is often useful. However if multiple Threads are calling this Channel's methods at the same time, the different calls on each Thread might end up interleaved (e.g. one or more of the second thread's calls may happen in between the first thread's calls.)
--- 
--- This method avoids that issue by making sure the Thread calling the method has exclusive access to the Channel until the specified function has returned.
---
---@param func function The function to call, the form of function(channel, arg1, arg2, ...) end. The Channel is passed as the first argument to the function when it is called.
---@param arg1 any Additional arguments that the given function will receive when it is called.
---@param ... any Additional arguments that the given function will receive when it is called.
--- returns:
---     any ret1 - The first return value of the given function (if any.)
---     any ... - Any other return values.
---@return any, any
function Channel.performAtomic(func, arg1, ...) end

---
--- Retrieves the value of a Channel message and removes it from the message queue.
--- 
--- It returns nil if there are no messages in the queue.
---
--- returns:
---     Variant value - The contents of the message.
---@return Variant
function Channel.pop() end

---
--- Send a message to the thread Channel.
--- 
--- See Variant for the list of supported types.
---
---@param value Variant The contents of the message.
function Channel.push(value) end

---
--- Send a message to the thread Channel and wait for a thread to accept it.
--- 
--- See Variant for the list of supported types.
---
---@param value Variant The contents of the message.
--- returns:
---     boolean success - Whether the message was successfully supplied (always true).
---@return boolean
function Channel.supply(value) end

---@param value Variant The contents of the message.
---@param timeout number The maximum amount of time to wait.
--- returns:
---     boolean success - Whether the message was successfully supplied before the timeout expired.
---@return boolean
function Channel.supply(value, timeout) end

---
--- Provides an interface to the user's clock.
---
local timer = {}
love.timer = timer

---
--- Returns the average delta time (seconds per frame) over the last second.
---
--- returns:
---     number delta - The average delta time over the last second.
---@return number
function timer.getAverageDelta() end

---
--- Returns the time between the last two frames.
---
--- returns:
---     number dt - The time passed (in seconds).
---@return number
function timer.getDelta() end

---
--- Returns the current frames per second.
---
--- returns:
---     number fps - The current FPS.
---@return number
function timer.getFPS() end

---
--- Returns the value of a timer with an unspecified starting time. This function should only be used to calculate differences between points in time, as the starting time of the timer is unknown.
---
--- returns:
---     number time - The time in seconds.
---@return number
function timer.getTime() end

---
--- Sleeps the program for the specified amount of time.
---
---@param s number Seconds to sleep for.
function timer.sleep(s) end

---
--- Measures the time between two frames. Calling this changes the return value of love.timer.getDelta.
---
function timer.step() end

--- returns:
---     number dt - The time passed (in seconds).
---@return number
function timer.step() end

---
--- Provides an interface to touch-screen presses.
---
local touch = {}
love.touch = touch

---
--- Gets the current position of the specified touch-press, in pixels.
---
---@param id light userdata The identifier of the touch-press. Use love.touch.getTouches, love.touchpressed, or love.touchmoved to obtain touch id values.
--- returns:
---     number x - The position along the x-axis of the touch-press inside the window, in pixels.
---     number y - The position along the y-axis of the touch-press inside the window, in pixels.
---@return number, number
function touch.getPosition(id) end

---
--- Gets the current pressure of the specified touch-press.
---
---@param id light userdata The identifier of the touch-press. Use love.touch.getTouches, love.touchpressed, or love.touchmoved to obtain touch id values.
--- returns:
---     number pressure - The pressure of the touch-press. Most touch screens aren't pressure sensitive, in which case the pressure will be 1.
---@return number
function touch.getPressure(id) end

---
--- Gets a list of all active touch-presses.
---
--- returns:
---     table touches - A list of active touch-press id values, which can be used with love.touch.getPosition.
---@return table
function touch.getTouches() end

---
--- This module is responsible for decoding, controlling, and streaming video files.
--- 
--- It can't draw the videos, see love.graphics.newVideo and Video objects for that.
---
local video = {}
love.video = video

---
--- Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can't draw videos, see love.graphics.newVideo for that.
---
---@param filename string The file path to the Ogg Theora video file.
--- returns:
---     VideoStream videostream - A new VideoStream.
---@return VideoStream
function video.newVideoStream(filename) end

---@param file File The File object containing the Ogg Theora video.
--- returns:
---     VideoStream videostream - A new VideoStream.
---@return VideoStream
function video.newVideoStream(file) end

---
--- An object which decodes, streams, and controls Videos.
---@class VideoStream
VideoStream = {}

---
--- Provides an interface for modifying and retrieving information about the program's window.
---
local window = {}
love.window = window

---
--- Closes the window. It can be reopened with love.window.setMode.
---
function window.close() end

---
--- Converts a number from pixels to density-independent units.
--- 
--- The pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.fromPixels(1600) would return 800 in that case.
--- 
--- This function converts coordinates from pixels to the size users are expecting them to display at onscreen. love.window.toPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.
--- 
--- Most LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.
---
---@param pixelvalue number A number in pixels to convert to density-independent units.
--- returns:
---     number value - The converted number, in density-independent units.
---@return number
function window.fromPixels(pixelvalue) end

---@param px number The x-axis value of a coordinate in pixels.
---@param py number The y-axis value of a coordinate in pixels.
--- returns:
---     number x - The converted x-axis value of the coordinate, in density-independent units.
---     number y - The converted y-axis value of the coordinate, in density-independent units.
---@return number, number
function window.fromPixels(px, py) end

---
--- Gets the name of a display.
---
---@param displayindex number The index of the display to get the name of.
--- returns:
---     string name - The name of the specified display.
---@return string
function window.getDisplayName(displayindex) end

---
--- Gets the DPI scale factor associated with the window.
--- 
--- The pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.getDPIScale() would return 2.0 in that case.
--- 
--- The love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.
--- 
--- The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.
---
--- returns:
---     number scale - The pixel scale factor associated with the window.
---@return number
function window.getDPIScale() end

---
--- Gets whether the window is fullscreen.
---
--- returns:
---     boolean fullscreen - True if the window is fullscreen, false otherwise.
---     FullscreenType fstype - The type of fullscreen mode used.
---@return boolean, FullscreenType
function window.getFullscreen() end

---
--- Gets a list of supported fullscreen modes.
---
---@param display number The index of the display, if multiple monitors are available.
--- returns:
---     table modes - A table of width/height pairs. (Note that this may not be in order.)
---@return table
function window.getFullscreenModes(display) end

---
--- Gets the window icon.
---
--- returns:
---     ImageData imagedata - The window icon imagedata, or nil of no icon has been set with love.window.setIcon.
---@return ImageData
function window.getIcon() end

---
--- Returns the current display mode.
---
--- returns:
---     number width - Window width.
---     number height - Window height.
---     table flags - Table containing the window properties.
---@return number, number, table
function window.getMode() end

---
--- Gets the DPI scale factor associated with the window.
--- 
--- The pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.getPixelScale() would return 2.0 in that case.
--- 
--- The love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.
--- 
--- The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.
---
--- returns:
---     number scale - The pixel scale factor associated with the window.
---@return number
function window.getPixelScale() end

---
--- Gets the position of the window on the screen.
--- 
--- The window position is in the coordinate space of the display it is currently in.
---
--- returns:
---     number x - The x-coordinate of the window's position.
---     number y - The y-coordinate of the window's position.
---     number display - The index of the display that the window is in.
---@return number, number, number
function window.getPosition() end

---
--- Gets the window title.
---
--- returns:
---     string title - The current window title.
---@return string
function window.getTitle() end

---
--- Checks if the game window has keyboard focus.
---
--- returns:
---     boolean focus - True if the window has the focus or false if not.
---@return boolean
function window.hasFocus() end

---
--- Checks if the game window has mouse focus.
---
--- returns:
---     boolean focus - True if the window has mouse focus or false if not.
---@return boolean
function window.hasMouseFocus() end

---
--- Gets whether the display is allowed to sleep while the program is running.
--- 
--- Display sleep is disabled by default. Some types of input (e.g. joystick button presses) might not prevent the display from sleeping, if display sleep is allowed.
---
--- returns:
---     boolean enabled - True if system display sleep is enabled / allowed, false otherwise.
---@return boolean
function window.isDisplaySleepEnabled() end

---
--- Gets whether the Window is currently maximized.
--- 
--- The window can be maximized if it is not fullscreen and is resizable, and either the user has pressed the window's Maximize button or love.window.maximize has been called.
---
--- returns:
---     boolean maximized - True if the window is currently maximized in windowed mode, false otherwise.
---@return boolean
function window.isMaximized() end

---
--- Gets whether the Window is currently minimized.
---
--- returns:
---     boolean maximized - True if the window is currently minimized, false otherwise.
---@return boolean
function window.isMinimized() end

---
--- Checks if the window is open.
---
--- returns:
---     boolean open - True if the window is open, false otherwise.
---@return boolean
function window.isOpen() end

---
--- Checks if the game window is visible.
--- 
--- The window is considered visible if it's not minimized and the program isn't hidden.
---
--- returns:
---     boolean visible - True if the window is visible or false if not.
---@return boolean
function window.isVisible() end

---
--- Makes the window as large as possible.
--- 
--- This function has no effect if the window isn't resizable, since it essentially programmatically presses the window's "maximize" button.
---
function window.maximize() end

---
--- Minimizes the window to the system's task bar / dock.
---
function window.minimize() end

---
--- Restores the size and position of the window if it was minimized or maximized.
---
function window.restore() end

---
--- Causes the window to request the attention of the user if it is not in the foreground.
--- 
--- In Windows the taskbar icon will flash, and in OS X the dock icon will bounce.
---
---@param continuous boolean Whether to continuously request attention until the window becomes active, or to do it only once.
function window.requestAttention(continuous) end

---
--- Sets whether the display is allowed to sleep while the program is running.
--- 
--- Display sleep is disabled by default. Some types of input (e.g. joystick button presses) might not prevent the display from sleeping, if display sleep is allowed.
---
---@param enable boolean True to enable system display sleep, false to disable it.
function window.setDisplaySleepEnabled(enable) end

---
--- Enters or exits fullscreen. The display to use when entering fullscreen is chosen based on which display the window is currently in, if multiple monitors are connected.
--- 
--- If fullscreen mode is entered and the window size doesn't match one of the monitor's display modes (in normal fullscreen mode) or the window size doesn't match the desktop size (in 'desktop' fullscreen mode), the window will be resized appropriately. The window will revert back to its original size again when fullscreen mode is exited using this function.
---
---@param fullscreen boolean Whether to enter or exit fullscreen mode.
--- returns:
---     boolean success - True if successful, false otherwise.
---@return boolean
function window.setFullscreen(fullscreen) end

---@param fullscreen boolean Whether to enter or exit fullscreen mode.
---@param fstype FullscreenType The type of fullscreen mode to use.
--- returns:
---     boolean success - True if successful, false otherwise.
---@return boolean
function window.setFullscreen(fullscreen, fstype) end

---
--- Sets the window icon until the game is quit. Not all operating systems support very large icon images.
---
---@param imagedata ImageData The window icon image.
--- returns:
---     boolean success - Whether the icon has been set successfully.
---@return boolean
function window.setIcon(imagedata) end

---
--- Sets the display mode and properties of the window.
--- 
--- If width or height is 0, setMode will use the width and height of the desktop.
--- 
--- Changing the display mode may have side effects: for example, canvases will be cleared and values sent to shaders with Shader:send will be erased. Make sure to save the contents of canvases beforehand or re-draw to them afterward if you need to.
---
---@param width number Display width.
---@param height number Display height.
---@param flags table The flags table with the options:
--- returns:
---     boolean success - True if successful, false otherwise.
---@return boolean
function window.setMode(width, height, flags) end

---
--- Sets the position of the window on the screen.
--- 
--- The window position is in the coordinate space of the specified display.
---
---@param x number The x-coordinate of the window's position.
---@param y number The y-coordinate of the window's position.
---@param display number The index of the display that the new window position is relative to.
function window.setPosition(x, y, display) end

---
--- Sets the window title.
---
---@param title string The new window title.
function window.setTitle(title) end

---
--- Displays a message box dialog above the love window. The message box contains a title, optional text, and buttons.
---
---@param title string The title of the message box.
---@param message string The text inside the message box.
---@param type MessageBoxType The type of the message box.
---@param attachtowindow boolean Whether the message box should be attached to the love window or free-floating.
--- returns:
---     boolean success - Whether the message box was successfully displayed.
---@return boolean
function window.showMessageBox(title, message, type, attachtowindow) end

---@param title string The title of the message box.
---@param message string The text inside the message box.
---@param buttonlist table A table containing a list of button names to show. The table can also contain the fields enterbutton and escapebutton, which should be the index of the default button to use when the user presses 'enter' or 'escape', respectively.
---@param type MessageBoxType The type of the message box.
---@param attachtowindow boolean Whether the message box should be attached to the love window or free-floating.
--- returns:
---     number pressedbutton - The index of the button pressed by the user. May be 0 if the message box dialog was closed without pressing a button.
---@return number
function window.showMessageBox(title, message, buttonlist, type, attachtowindow) end

---
--- Converts a number from density-independent units to pixels.
--- 
--- The pixel density inside the window might be greater (or smaller) than the "size" of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.toPixels(800) would return 1600 in that case.
--- 
--- This is used to convert coordinates from the size users are expecting them to display at onscreen to pixels. love.window.fromPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.
--- 
--- Most LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.
---
---@param value number A number in density-independent units to convert to pixels.
--- returns:
---     number pixelvalue - The converted number, in pixels.
---@return number
function window.toPixels(value) end

---@param x number The x-axis value of a coordinate in density-independent units to convert to pixels.
---@param y number The y-axis value of a coordinate in density-independent units to convert to pixels.
--- returns:
---     number px - The converted x-axis value of the coordinate, in pixels.
---     number py - The converted y-axis value of the coordinate, in pixels.
---@return number, number
function window.toPixels(x, y) end

---
--- Sets the display mode and properties of the window, without modifying unspecified properties.
--- 
--- If width or height is 0, updateMode will use the width and height of the desktop.
--- 
--- Changing the display mode may have side effects: for example, canvases will be cleared. Make sure to save the contents of canvases beforehand or re-draw to them afterward if you need to.
---
---@param width number Window width.
---@param height number Window height.
---@param settings table The settings table with the following optional fields. Any field not filled in will use the current value that would be returned by love.window.getMode.
--- returns:
---     boolean success - True if successful, false otherwise.
---@return boolean
function window.updateMode(width, height, settings) end

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

