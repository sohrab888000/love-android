

function new_sohrab_analog(x_coordinate,y_coordinate,size,stick1,stick2)

local self = {}

self.x_coordinate = x_coordinate
self.y_coordinate = y_coordinate
self.size = size
self.held = false
self.id = 0
self.x_def = 0
self.y_def = 0
self.detect_last_move = 1
self.img_stick1 = stick1
self.img_stick2 = stick2

self.draw = function()

--love.graphics.setColor(0, 0, 255, 15)
--love.graphics.circle("line", self.x_coordinate, self.y_coordinate, self.size, 100)
local real_size1 = 2 * self.size
love.graphics.draw(self.img_stick1 , self.x_coordinate - self.size , self.y_coordinate - self.size , 0 , real_size1/self.img_stick1:getWidth() , real_size1/self.img_stick1:getHeight())

--love.graphics.setColor(0, 0, 255, 15)
--love.graphics.circle("line", self.x_coordinate + self.x_def , self.y_coordinate + self.y_def , self.size * 25/80 , 100) -- for button
local real_size2 = 2 * self.size * 25/80
love.graphics.draw(self.img_stick2 , self.x_coordinate + self.x_def - (self.size * 25/80) , self.y_coordinate + self.y_def - (self.size * 25/80) , 0 , real_size2/self.img_stick2:getWidth() , real_size2/self.img_stick2:getHeight())



end


--function sohrab_analog:touch



self.touch_pressed = function(id, x, y, dx, dy, pressure)


local x_distance = ( math.abs(x - self.x_coordinate) * math.abs(x - self.x_coordinate) ) 
local y_distance = ( math.abs(y - self.y_coordinate) * math.abs(y - self.y_coordinate) )
local distance = math.sqrt( x_distance + y_distance )

if x >= 0 and x <= love.graphics.getWidth()/2 and y >= 0 and y <= love.graphics.getHeight() then

if distance <= self.size * 25/80 then

self.held = true
self.id = id

end

end

end


self.touch_moved = function(id, x, y, dx, dy, pressure)

if self.held == true and id == self.id then

if x >= 0 and x <= love.graphics.getWidth()/2 and y >= 0 and y <= love.graphics.getHeight() then

if math.sqrt(math.abs(self.x_def)*math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) < self.size and  math.sqrt(math.abs(self.x_def+dx)*math.abs(self.x_def+dx)+math.abs(self.y_def+dy)*math.abs(self.y_def+dy)) < self.size then

--if bool == false then

self.x_def = self.x_def + dx

self.y_def = self.y_def + dy 

self.detect_last_move = self.x_def


--end--if math.sqrt(math.abs(self.x_def)*math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) < self.size and  math.sqrt(math.abs(self.x_def+dx)*math.abs(self.x_def+dx)+math.abs(self.y_def+dy)*math.abs(self.y_def+dy)) < self.size then

end--if x >= 0 and x <= love.graphics.getWidth()/2 and y >= 0 and y <= love.graphics.getHeight() then

end--if self.held == true then

end

end--end of function




self.touch_released = function(id, x, y, dx, dy, pressure)

if self.held == true and id == self.id then

if x >= 0 and x <= love.graphics.getWidth()/2 and y >= 0 and y <= love.graphics.getHeight() then

self.held = false

self.detect_last_move = self.x_def

self.x_def = 0

self.y_def = 0

self.id = 0

end

end

end




self.mouse_pressed = function( x , y , button )


local x_distance = ( math.abs(x - self.x_coordinate) * math.abs(x - self.x_coordinate) ) 
local y_distance = ( math.abs(y - self.y_coordinate) * math.abs(y - self.y_coordinate) )
local distance = math.sqrt( x_distance + y_distance )

if distance <= self.size * 25/80 and button == 1 then

self.held = true

end



end


self.mouse_moved = function( x , y , dx , dy )

if self.held == true then

if math.sqrt(math.abs(self.x_def)*math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) < self.size and  math.sqrt(math.abs(self.x_def+dx)*math.abs(self.x_def+dx)+math.abs(self.y_def+dy)*math.abs(self.y_def+dy)) < self.size then

self.x_def = self.x_def + dx

self.y_def = self.y_def + dy 


end

end


end



 self.mouse_released = function( x , y )

if self.held == true then 

if x >= 0 and x <= love.graphics.getWidth() and y >= 0 and y <= love.graphics.getHeight() then

self.held = false

self.detect_last_move = self.x_def

self.x_def = 0

self.y_def = 0

end

end

end


self.get_x_move = function()

return self.x_def

end




self.get_y_move = function()

return self.y_def

end




self.iswalking = function()


if (math.sqrt(math.abs(self.x_def) *math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) < self.size/3 
and math.sqrt(math.abs(self.x_def) *math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) > 0)
or math.sqrt(math.abs(self.x_def) *math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) > self.size/3
then

return true

else

return false

end

end



self.isruning = function()


if math.sqrt(math.abs(self.x_def) *math.abs(self.x_def)+math.abs(self.y_def)*math.abs(self.y_def)) > self.size/3 then

return true

else

return false

end


end




self.analog_to_left = function()

if self.x_def < 0 then

return true

else	

return false

end	

end


self.analog_to_right = function()

if self.x_def >= 0 then

return true

else	

return false

end	

end



self.analog_last_move = function ()

if self.detect_last_move > 0 then

return true 

elseif self.detect_last_move < 0 then

return false

elseif self.detect_last_move == 0 then

return self.detect_last_move

end


end


self.analog_idle = function()


return self.id == 0 and self.x_def == 0 and self.y_def == 0


end


self.isholding = function()

return self.held 

end




self.update_for_multitouch = function(bool)

if bool == true then

self.held = false

self.detect_last_move = self.x_def

self.x_def = 0

self.y_def = 0

end 	

end



return self

end