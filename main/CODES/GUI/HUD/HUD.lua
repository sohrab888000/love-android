--
require("CODES/HELPERS/SCALE")
function make_hud(x,y,img_bar,img_inbar--[[canbe animation]])

--for now just health bar 
local self = {}

self.x = x
self.y = y
self.bar = img_bar
self.inbar = img_inbar
self.inbar_frame = 1
self.inbar_framespeed = 10
self.health = nil
self.max_health = nil
self.img_for_inbar = self.inbar[1]


self.setX = function(x)
self.x = x
end
self.setY = function(y)
self.y = y
end
self.setBar = function(bar)
self.bar = bar
end
self.setInBar = function(inbar)
self.inbar = inbar
end
self.setHealth = function(health)
self.health = health
end
self.setMaxHealth = function(max_health)
self.max_health = max_health
end

self.getX = function()
return self.x
end
self.getY = function()
return self.y
end
self.getBar = function()
return self.bar
end
self.getInBar = function()
return self.inbar
end
self.getHealth = function()
return self.health
end
self.getMaxHealth = function()
return self.max_health
end

self.animate_inbar = function(dt)
if self.inbar_framespeed > 12 * dt then
if self.inbar_frame < #self.inbar then
self.inbar_frame = self.inbar_frame + 1	
else
self.inbar_frame = 1
end
self.inbar_framespeed = 0
else
self.inbar_framespeed = self.inbar_framespeed + dt
end
self.img_for_inbar = self.inbar[self.inbar_frame]
end

self.update = function(dt)
self.animate_inbar(dt)
end

self.draw = function()
main_scaler = NEW_MAIN_SCALER()
percent = (self.health/self.max_health)
love.graphics.draw(self.img_for_inbar,self.x,self.y,0,percent * (main_scaler.width/10 * main_scaler.scale_x) / self.bar:getWidth() , main_scaler.height/20 * main_scaler.scale_x / self.bar:getHeight())
love.graphics.draw(self.bar,self.x,self.y,0,(main_scaler.width/10 * main_scaler.scale_x) / self.bar:getWidth() , main_scaler.height/20 * main_scaler.scale_x / self.bar:getHeight())

end


return self

end