require("CODES/HELPERS/SCALE")
require("CODES/PLAYER/level_two_transforms/troll")         
require("CODES/PLAYER/level_two_transforms/orc_mb")
                       
function make_transform_level_two(detect,center_x_coordinate,center_y_coordinate)

local self = {}

self.detect = detect
if self.detect == "troll" then
self = troll_transform(center_x_coordinate,center_y_coordinate)
elseif self.detect == "orc_mb" then
self = orc_mb_transform(center_x_coordinate,center_y_coordinate)
end


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
if self.detect == "orc_mb" then
return false
elseif self.detect == "troll" then
return true
end
end


return self


end