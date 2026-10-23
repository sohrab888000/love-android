function NEW_MAIN_SCALER()

local self = {}

self.screen_width = love.graphics.getWidth()
self.screen_height = love.graphics.getHeight()

self.width = 1600
self.height = 900

self.scale_x = self.screen_width/self.width
self.scale_y = self.screen_height/self.height


return self

end