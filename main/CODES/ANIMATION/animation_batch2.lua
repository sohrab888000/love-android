function newAnimation2()
    local self = {}
    
    self.intialize = false 

self.set = function(image, width, height, duration)    
--set for quads:start
    self.spriteSheet = image
    self.quads = {} 

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(self.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    self.duration = duration 
    self.framespeed = 0
    self.frame = 1
    self.intialize = true 
    self.wait_ = 0
--set for quads:end
end


self.set_duration = function(duration)
self.duration = duration
end

self.set_position = function(x,y)

self.x = x
self.y = y

end

self.get_x = function()
return self.x
end

self.get_y = function()
return self.y
end


self.set_scale = function(scale_x,scale_y)

self.scale_x = scale_x
self.scale_y = scale_y

end


self.set_itrator = function(bool)

self.itrator = bool

end


--for using when itrator = false
self.start = function()
self.frame = 1
end


self.update = function(DT,wait_time)

if self.intialize == true then


if self.itrator == false and self.frame == #self.quads then
return
end    

if self.wait_ <= 0 then

    self.framespeed = self.framespeed + DT
    if self.framespeed >= self.duration then
        self.framespeed = 0
    if self.frame < #self.quads then  
    
    self.frame = self.frame + 1

    else--if self.frame >= self.quads
    
    if self.itrator == true then
       self.frame = 1
       self.wait_ = 0 or wait_time
    else--if self.itrator == false   
       self.frame = #self.quads
    end
    
    end
    end

else

self.wait_ = self.wait_ - DT

end    


end

end


self.draw = function(width_for_rotating,height_for_rotating)
   
if self.intialize == true then    
    
    love.graphics.draw(self.spriteSheet, self.quads[self.frame] , self.x , self.y , 0 , self.scale_x , self.scale_y , width_for_rotating , height_for_rotating)
    

end

end


self.moving_right = function(bool_to_move,speed)
if bool_to_move then
self.x = self.x + speed
end
end

self.moving_left = function(bool_to_move,speed)
if bool_to_move then
self.x = self.x - speed
end
end

self.moving_up = function(bool_to_move,speed)
if bool_to_move then
self.y = self.y - speed
end
end

self.moving_down = function(bool_to_move,speed)
if bool_to_move then
self.y = self.y + speed
end
end



 
    return self
end




--[[

example of use:

function love.load()
    animation = newAnimation(love.graphics.newImage("oldHero.png"), 16, 18, 1)
end
 
function love.update(dt)
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end
 
function love.draw()
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 0, 0, 0, 4)
end
 
function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end


]]





