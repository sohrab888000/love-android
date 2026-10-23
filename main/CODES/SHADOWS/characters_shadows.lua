require("CODES/HELPERS/SCALE")
function make_c_shodow() --used in world
local self = {}

self.img = love.graphics.newImage("ART/SHADOW/shadow.png")
main_scaler = NEW_MAIN_SCALER()

self.draw = function(x,y,scale_x,scale_y)
love.graphics.draw(self.img,x,y,0,scale_x,scale_y)
end


return self


end