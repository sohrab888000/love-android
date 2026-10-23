

function new_environment_collision()



local self = {}


self.rectangle = {x = 1 , y = 1 , width = 1 , height = 1}

self.U_rect = {x = 1 , y = 1 , width = 1 , height = 1}
self.R_rect = {x = 1 , y = 1 , width = 1 , height = 1}
self.L_rect = {x = 1 , y = 1 , width = 1 , height = 1}
self.D_rect = {x = 1 , y = 1 , width = 1 , height = 1}

self.first_x = 1
self.first_y = 1
--self.be = false --this boolean is used for deleting from list of environment_collisions or disabling for a reason

self.be = true

self.set_to_be = function(be)
self.be = be
end

self.get_to_be = function()
return self.be


end

self.set_first = function(x,y)
self.first_x = x
self.first_y = y
end

self.set_rectangle = function (x,y,width,height)
self.rectangle.x = x
self.rectangle.y = y
self.rectangle.width = width
self.rectangle.height = height

self.U_rect.x = x 
self.U_rect.y = y 
self.U_rect.width = width
self.U_rect.height = 5

self.R_rect.x = x + width - 5 
self.R_rect.y = y 
self.R_rect.width = 1 + 5
self.R_rect.height = height + 1

self.L_rect.x = x 
self.L_rect.y = y
self.L_rect.width = 1 + 5
self.L_rect.height = height + 1

self.D_rect.x = x
self.D_rect.y = y + height - 5 
self.D_rect.width = width
self.D_rect.height = 1 + 5

end


self.get_rectangle = function()
return self.rectangle
end

self.get_U_rect = function()
return self.U_rect
end

self.get_R_rect = function()
return self.R_rect
end

self.get_L_rect = function()
return self.L_rect
end

self.get_D_rect = function()
return self.D_rect
end


self.get_x = function()
return self.get_rectangle().x
end

self.get_y = function()
return self.get_rectangle().y
end

self.get_width = function()
return self.get_rectangle().width
end

self.get_height = function()
return self.get_rectangle().height
end

--this function helps to do what we want when an environment_collision happens.
self.detected_collision = function(rectangle_x , rectangle_y , rectangle_width , rectangle_height)

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

return CheckCollision(rectangle_x , rectangle_y , rectangle_width , rectangle_height , self.rectangle.x , self.rectangle.y , self.rectangle.width , self.rectangle.height)

end



--in level design if self.be == false then it shold be remove from environment_collisions list



--helper functions for better detections:
self.U_rect_detected_collision = function(rectangle_x , rectangle_y , rectangle_width , rectangle_height)

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

return CheckCollision(rectangle_x , rectangle_y , rectangle_width , rectangle_height , self.U_rect.x , self.U_rect.y , self.U_rect.width , self.U_rect.height)

end




self.R_rect_detected_collision = function(rectangle_x , rectangle_y , rectangle_width , rectangle_height)

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

return CheckCollision(rectangle_x , rectangle_y , rectangle_width , rectangle_height , self.R_rect.x , self.R_rect.y , self.R_rect.width , self.R_rect.height)

end



self.L_rect_detected_collision = function(rectangle_x , rectangle_y , rectangle_width , rectangle_height)

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

return CheckCollision(rectangle_x , rectangle_y , rectangle_width , rectangle_height , self.L_rect.x , self.L_rect.y , self.L_rect.width , self.L_rect.height)

end



self.D_rect_detected_collision = function(rectangle_x , rectangle_y , rectangle_width , rectangle_height)

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

return CheckCollision(rectangle_x , rectangle_y , rectangle_width , rectangle_height , self.D_rect.x , self.D_rect.y , self.D_rect.width , self.D_rect.height)

end

self.moving_right = function(bool_to_move,speed)
if bool_to_move then
self.rectangle.x = self.rectangle.x + speed
self.set_rectangle(self.get_rectangle().x,self.get_rectangle().y,self.get_rectangle().width,self.get_rectangle().height)
end	
end

self.moving_left = function(bool_to_move,speed)
if bool_to_move then
self.rectangle.x = self.rectangle.x - speed
self.set_rectangle(self.get_rectangle().x,self.get_rectangle().y,self.get_rectangle().width,self.get_rectangle().height)
end	
end

self.moving_up = function(bool_to_move,speed)
if bool_to_move then
self.rectangle.y = self.rectangle.y - speed
self.set_rectangle(self.get_rectangle().x,self.get_rectangle().y,self.get_rectangle().width,self.get_rectangle().height)
end	
end

self.moving_down = function(bool_to_move,speed)
if bool_to_move then
self.rectangle.y = self.rectangle.y + speed
self.set_rectangle(self.get_rectangle().x,self.get_rectangle().y,self.get_rectangle().width,self.get_rectangle().height)
end	
end

self.draw_collision_test = function()

love.graphics.rectangle("fill",self.get_U_rect().x,self.get_U_rect().y,self.get_U_rect().width,self.get_U_rect().height)
love.graphics.rectangle("fill",self.get_R_rect().x,self.get_R_rect().y,self.get_R_rect().width,self.get_R_rect().height)
love.graphics.rectangle("fill",self.get_L_rect().x,self.get_L_rect().y,self.get_L_rect().width,self.get_L_rect().height)
love.graphics.rectangle("fill",self.get_D_rect().x,self.get_D_rect().y,self.get_D_rect().width,self.get_D_rect().height)

end


return self

end