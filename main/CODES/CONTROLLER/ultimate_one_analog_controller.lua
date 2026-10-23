require ("CODES/CONTROLLER/my_analog")
require ("CODES/CONTROLLER/button")

function make_controller(
--[[analog]]x_coordinate_analog,y_coordinate_analog,size_analog,
--[[attack_button1]]x1 , y1 , size1,
--[[dodge_button2]]x2 , y2 , size2,
--[[thief_button3]]x3 , y3 , size3,
--[[released_button4]]x4 , y4 , size4
)


self = {}


stick_analog1_img = love.graphics.newImage("ART/CONTROLLER/stick_analog (1).png")
stick_analog2_img = love.graphics.newImage("ART/CONTROLLER/stick_analog (2).png")

attack_button_img = love.graphics.newImage("ART/CONTROLLER/attack_button.png")
dodge_button_img = love.graphics.newImage("ART/CONTROLLER/dodge_button.png")
thief_button_img = love.graphics.newImage("ART/CONTROLLER/thief_button.png")
special_button_img = love.graphics.newImage("ART/CONTROLLER/special.png")
released_button_img = love.graphics.newImage("ART/CONTROLLER/released_button.png")

self.thief_img = love.graphics.newImage("ART/CONTROLLER/thief_button.png")
self.special_img = love.graphics.newImage("ART/CONTROLLER/special.png")


self.analog1 = new_sohrab_analog(x_coordinate_analog,y_coordinate_analog,size_analog,stick_analog1_img,stick_analog2_img)
self.attack_button = new_button(x1 , y1 , size1 , attack_button_img)
self.dodge_button = new_button(x2 , y2 , size2 , dodge_button_img)
self.thief_button = new_button(x3 , y3 , size3 , thief_button_img)
self.released_button = new_button(x4 , y4 , size4 , released_button_img)








self.update_thief_button = function(level)

if level.get_world().get_hero().detect == nil then
self.thief_button.set_img(self.thief_img)
else
self.thief_button.set_img(self.special_img)
end

end



self.draw = function(level)

if self.analog1.held == true then
self.analog1.draw()
end
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.draw()
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.draw()
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.draw()
self.released_button.draw()
end
else
self.attack_button.draw()
self.dodge_button.draw()
self.thief_button.draw()
self.released_button.draw()
end
end



self.mousepressed_controller = function( x, y, button, istouch, presses , level)
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
if x <= ww/2 and x >= 0 and y <= hh and y >= 0 then
self.analog1.x_coordinate = x
self.analog1.y_coordinate = y	
end
self.analog1.mouse_pressed( x , y , button )
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.pressed(id, x , y)
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.pressed(id, x , y)
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.pressed(id, x , y)
self.released_button.pressed(id, x , y)
end
else
self.attack_button.pressed(id, x , y)
self.thief_button.pressed(id, x , y)
self.released_button.pressed(id, x , y)
self.dodge_button.pressed(id, x , y)
end
end
end
end

self.mousereleased_controller = function(x, y, button , level)
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
self.analog1.mouse_released(x,y)
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.released(id, x , y)
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.released(id, x , y)
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.released(id, x , y)
self.released_button.released(id, x , y)
end
else
self.attack_button.released(id, x , y)
self.thief_button.released(id, x , y)
self.released_button.released(id, x , y)
self.dodge_button.released(id, x , y)
end

end
end
end

self.mousemoved_controller = function( x, y, dx, dy, istouch , bool)
self.analog1.mouse_moved( x , y , dx , dy )
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.check_range(id, x , y)
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.check_range(id, x , y)
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.check_range(id, x , y)
self.released_button.check_range(id, x , y)
end
else
self.attack_button.check_range(id, x , y)
self.thief_button.check_range(id, x , y)
self.released_button.check_range(id, x , y)
self.dodge_button.check_range(id, x , y)
end

end

--]]

self.touchpressed_controller = function( id, x, y, pressure , level)
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
if x <= ww/2 and x >= 0 and y <= hh and y >= 0 then
self.analog1.x_coordinate = x
self.analog1.y_coordinate = y	
end
self.analog1.touch_pressed(id, x, y, dx, dy, pressure)
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.pressed(id, x , y)
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.pressed(id, x , y)
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.pressed(id, x , y)
self.released_button.pressed(id, x , y)
end
else
self.attack_button.pressed(id, x , y)
self.thief_button.pressed(id, x , y)
self.released_button.pressed(id, x , y)
self.dodge_button.pressed(id, x , y)
end

end
end
end

self.touchreleased_controller = function( id, x, y, pressure , level)
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
self.analog1.touch_released(id, x, y, dx, dy, pressure)
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.released(id, x , y)
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.released(id, x , y)
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.released(id, x , y)
self.released_button.released(id, x , y)
end
else
self.attack_button.released(id, x , y)
self.thief_button.released(id, x , y)
self.released_button.released(id, x , y)
self.dodge_button.released(id, x , y)
end

end
end
end

self.touchmoved_controller = function( id, x, y, dx, dy, pressure , level)
self.analog1.touch_moved(id, x, y, dx, dy, pressure)
if level.name == "training" then
if (level.get_current_stage_index() ~= 1) then
self.attack_button.check_range(id, x , y)
end
if (level.get_current_stage_index() == 3 or level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.dodge_button.check_range(id, x , y)
end
if (level.get_current_stage_index() == 4 or level.get_current_stage_index() == 5) then
self.thief_button.check_range(id, x , y)
self.released_button.check_range(id, x , y)
end
else
self.attack_button.check_range(id, x , y)
self.thief_button.check_range(id, x , y)
self.released_button.check_range(id, x , y)
self.dodge_button.check_range(id, x , y)
end

end







return self


end