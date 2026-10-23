require("CODES/HELPERS/SCALE")

function hopper_transform(detect,center_x_coordinate,center_y_coordinate,first_nearest_enemy)

local self = {}

self.thief_attack_bool = false
self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate

self.time_for_end_damage = 10
self.troll_time = 45

self.target = first_nearest_enemy

main_scaler = NEW_MAIN_SCALER()

self.transforms_draw = function(thief_pics,last_move,center_x_coordinate,center_y_coordinate,nearest_enemy)
--should draw animtion for effects too
if self.target ~= nil then
rect = self.target.get_rectangle_for_damaged()
local y = rect.y
local x = rect.x
thief_pics.set_position(x,y)
thief_pics.set_scale((-(0.05*main_scaler.width)/64)*main_scaler.scale_x , ((0.05*main_scaler.height)/64)*main_scaler.scale_y)
thief_pics.draw(232,0)
end

end



self.transforms_update = function(dt,thief,summon_pet,thief_pics,center_x_coordinate,center_y_coordinate,nearest_enemy)

if thief_pics.frame == 1 then
self.target = nearest_enemy
end	

self.transform__position_update(center_x_coordinate,center_y_coordinate)

if thief == true and summon_pet == nil and thief_pics.frame == #thief_pics.quads - 1 then
if self.time_for_end_damage > 1 then
self.thief_attack_bool = true 	
self.time_for_end_damage = 0
else
self.thief_attack_bool = false	
end

end

if thief == true and summon_pet == nil and thief_pics.frame ~= #thief_pics.quads - 1 then
self.time_for_end_damage = 10
end

end

--from transform levels:


self.transform__position_update = function(center_x_coordinate,center_y_coordinate)
self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate
end

self.get_x = function()
return self.center_x_coordinate
end

self.get_y = function()
return self.center_y_coordinate
end




self.transforms_attacking = function()

return self.thief_attack_bool

end



self.get_dont_stop_on_last_frame = function()
return false
end




return self	


end