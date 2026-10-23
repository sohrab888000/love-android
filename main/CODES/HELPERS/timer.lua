function newTimer()

local self = {}

self.time = 0
self.pause = true

self.setTime = function(time) self.time = time end
self.getTime = function() return self.time end

self.setStart = function() self.pause = false end
self.setPause = function() self.pause = true end

self.update = function(dt)                                         
if not self.pause then
self.time = self.time + dt
end
end

return self


end