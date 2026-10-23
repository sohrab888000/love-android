require("CODES/HELPERS/SCALE")
require("CODES/PLAYER/level_one_transforms/darksaber")         
require("CODES/PLAYER/level_one_transforms/hopper") 
                       
function make_transform_level_one(detect,center_x_coordinate,center_y_coordinate)

local self = {}

self.detect = detect
if self.detect == "darksaber" then
self = darksaber_transform(center_x_coordinate,center_y_coordinate)
elseif self.detect == "hopper" then
self = hopper_transform(center_x_coordinate,center_y_coordinate)
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
if self.detect == "darksaber" then
return false
elseif self.detect == "hopper" then
return false
end
end


return self


end