require("CODES/HELPERS/SCALE")

function orc_mb_transform(detect,center_x_coordinate,center_y_coordinate)

local self = {}

self.thief_attack_bool = false
self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate

self.time_for_end_damage = 10
self.troll_time = 45


main_scaler = NEW_MAIN_SCALER()

self.transforms_draw = function(thief_pics,last_move,center_x_coordinate,center_y_coordinate)
--should draw animtion for effects too
local y = center_y_coordinate - ((177/2) * main_scaler.scale_y) + 8 * main_scaler.scale_y 	
if last_move == true then	
local x = center_x_coordinate - ((216/2) * main_scaler.scale_x) + 104 * main_scaler.scale_x
thief_pics.set_position(x+30*main_scaler.scale_x,y)
thief_pics.set_scale(((0.4*main_scaler.width)/216)*main_scaler.scale_x,((0.4*main_scaler.height)/177)*main_scaler.scale_y)
thief_pics.draw(0,0)
else
local x = center_x_coordinate - ((216/2) * main_scaler.scale_x) - 80 * main_scaler.scale_x
thief_pics.set_position(x,y)
thief_pics.set_scale(((-0.4*main_scaler.width)/216)*main_scaler.scale_x,((0.4*main_scaler.height)/177)*main_scaler.scale_y)
thief_pics.draw(216,0)
end


end



self.transforms_update = function(dt,thief,summon_pet,thief_pics,center_x_coordinate,center_y_coordinate)

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

--from level two make transforms:

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