require("CODES/HELPERS/SCALE")

--should control background animations


function newBackground()

local self = {}

self.img = nil
--just to test--
self.all_tile = nil

--it can be like this or be like adding stages and add tile to stages -><-

self.x_coordinate = nil
self.y_coordinate = nil
self.time_to_shake = nil
self.rest_time_to_shake = nil
self.x_pics = nil
self.y_pics = nil
self.width_of_stages = nil
self.height_of_stages = nil


self.bool_to_shake = false
self.mid_shake = false
self.down_shake = false
self.mid2_shake = false
self.up_shake = true

self.mid_shake_time = 0
self.down_shake_time = 0
self.mid2_shake_time = 0
self.up_shake_time = 0


self.shake_time_limit = 3


main_scaler = NEW_MAIN_SCALER()

self.set_all = function(img,img2,x_coordinate,y_coordinate,time_to_shake,x_pics,y_pics,width_of_stages,height_of_stages)
self.img = img
self.all_tile = img2
self.x_coordinate = x_coordinate
self.y_coordinate = y_coordinate
self.time_to_shake = time_to_shake
self.x_pics = x_pics -- how many
self.y_pics = y_pics -- how many
self.width_of_stages = width_of_stages
self.height_of_stages = height_of_stages
end


self.set_img = function(img)
self.img = img
end

self.get_calculated_stages = function()
return self.x_pics * self.y_pics
end
                                       
self.get_width_of_stage = function() 
return self.width_of_stages
end

self.get_height_of_stage = function()
return self.height_of_stages
end

self.set_time_to_shake = function(time_to_shake)
self.time_to_shake = time_to_shake
self.rest_time_to_shake = time_to_shake
end

self.set_shake = function(bool_to_shake)--it should be use in each level that is wanted
self.bool_to_shake = bool_to_shake
end

self.shake_func = function(dt,MAIN_Y_COORDINATE)--it is used in level design help->update_flow function
if self.time_to_shake ~= nil then
if self.time_to_shake > 0 then
self.shake(dt,MAIN_Y_COORDINATE)
self.time_to_shake = self.time_to_shake - dt
else
self.set_shake(false)
self.time_to_shake = self.rest_time_to_shake
end
end
end

self.draw = function()

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
--print(height)
love.graphics.draw(self.img,self.x_coordinate,self.y_coordinate,0,self.x_pics * width/self.img:getWidth(),self.y_pics * height/self.img:getHeight())

end

self.draw_all_tile = function()

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

love.graphics.draw(self.all_tile,self.x_coordinate,self.y_coordinate,0,self.x_pics * width/self.img:getWidth(),self.y_pics * height/self.img:getHeight())

end


--bool to move -> for example when there is no enemy left.

self.moving_right = function(bool_to_move,speed,limit)
if bool_to_move then
if self.x_coordinate + speed < limit  then	
self.x_coordinate = self.x_coordinate + speed
else
self.x_coordinate = limit	
end	
end
end

self.moving_left = function(bool_to_move,speed,limit)
if bool_to_move then
if self.x_coordinate - speed > limit  then	
self.x_coordinate = self.x_coordinate - speed
else
self.x_coordinate = limit	
end	
end
end

self.moving_up = function(bool_to_move,speed,limit)
if bool_to_move then
if self.y_coordinate - speed > limit then	
self.y_coordinate = self.y_coordinate - speed
else
self.y_coordinate = limit	
end	
end
end

self.moving_down = function(bool_to_move,speed,limit)
if bool_to_move then
if self.y_coordinate + speed < limit then	
self.y_coordinate = self.y_coordinate + speed
else
self.y_coordinate = limit	
end	
end
end

--bool to shake -> for example when boss hit an attack!   --> update

self.shake = function(dt,MAIN_Y_COORDINATE)

if self.bool_to_shake then

--code for shake:

if self.up_shake == true then
self.y_coordinate = self.y_coordinate - 2 * main_scaler.scale_y
self.up_shake_time = self.up_shake_time + 1
if self.up_shake_time >= self.shake_time_limit then
self.up_shake_time = 0
self.up_shake = false
self.mid_shake = true
end
end

if self.mid_shake == true then
self.y_coordinate = self.y_coordinate + 2 * main_scaler.scale_y
self.mid_shake_time = self.mid_shake_time + 1
if self.mid_shake_time >= self.shake_time_limit then
self.mid_shake_time = 0
self.mid_shake = false
self.down_shake = true
end
end

if self.down_shake == true then
self.y_coordinate = self.y_coordinate + 2 * main_scaler.scale_y
self.down_shake_time = self.down_shake_time + 1
if self.down_shake_time >= self.shake_time_limit then
self.down_shake_time = 0
self.down_shake = false
self.mid2_shake = true
end
end

if self.mid2_shake == true then
self.y_coordinate = self.y_coordinate - 2 * main_scaler.scale_y
self.mid2_shake_time = self.mid2_shake_time + 1
if self.mid2_shake_time >= self.shake_time_limit then
self.mid2_shake_time = 0
self.mid2_shake = false
self.up_shake = true
end
end

else

self.y_coordinate = MAIN_Y_COORDINATE

end



end




return self

end