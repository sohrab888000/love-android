


function new_button_in_GAME_MENU(x , y , size , img)


local self = {}

self.x = x
self.y = y
self.size = size
self.img = img
self.held = false
self.release = false
self.id = 0

self.draw = function()


--love.graphics.setColor(255, 255, 255, 15)

--love.graphics.circle("line", self.x, self.y, self.size, 100)

local real_size = 2 * self.size

love.graphics.draw(self.img , self.x - size, self.y - size , 0 ,  real_size/self.img:getWidth() ,  real_size/self.img:getHeight())



end


self.pressed = function(id,x,y)

local X_ = math.abs(self.x - x)
local Y_ = math.abs(self.y - y)

if x >= 0 and x <= love.graphics.getWidth() and y >= 0 and y <= love.graphics.getHeight() then

if math.sqrt( (X_ * X_) + (Y_ * Y_) ) <= self.size then

self.held = true
self.release = false
self.id = id

end

end

end

self.check_range = function(id, x , y)

local X_ = math.abs(self.x - x)
local Y_ = math.abs(self.y - y)

if self.held == true and id == self.id then

if not( math.sqrt( (X_ * X_) + (Y_ * Y_) ) <= self.size) then

self.held = false
self.id = 0

end


end

end

self.released = function(id,x,y)


local X_ = math.abs(self.x - x)
local Y_ = math.abs(self.y - y)

if self.held == true and id == self.id then

if x >= 0 and x <= love.graphics.getWidth() and y >= 0 and y <= love.graphics.getHeight() then

--if math.sqrt( (X_ * X_) + (Y_ * Y_) ) <= self.size then

self.held = false
self.release = true
self.id = 0
--end--if math.sqrt( (X_ * X_) + (Y_ * Y_) ) <= self.size then

--else

--self.held = true

end--if x >= love.graphics.getWidth()/2 and x <= love.graphics.getWidth() and y >= 0 and y <= love.graphics.getHeight() then

end--if self.held == true then

end--end of function




self.isholding = function ()

return self.held

end

self.isReleased = function ()

return self.release

end


self.set_img = function(img)

self.img = img

end


self.setReleased = function(bool)

self.release = bool

end

self.setX = function(x)
self.x = x
end

self.setY = function(y)
self.y = y
end

--needs to be override when want to use!!! -> like android
self.onclick = function()
end

self.get_img = function()

return self.img 

end

self.update_for_multitouch = function(bool)

if bool == true then

self.held = false

end 	

end



return self

end