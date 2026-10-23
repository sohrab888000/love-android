require("CODES/LEVELS/training")
require ("CODES/LEVELS/level_1/level_1_E1_load")
require ("CODES/LEVELS/level_1/level_1_E2_load")
require ("CODES/LEVELS/level_1/level_1_E3_load")
require ("CODES/LEVELS/level_2/level_2_E1_load")
require ("CODES/LEVELS/level_2/level_2_E2_load")
require ("CODES/LEVELS/level_2/level_2_E3_load")

function chossing_season_and_episode(sAnde)--[[tells the chooser class which season and which episode should load]]

local self
self = {}

--in future each season would have 5 episodes and one boss fights even may have more seasons!!!
if(sAnde == "train") then
self = training()	
elseif(sAnde == "s1e1") then
self = level_1_E1()
elseif(sAnde == "s1e2") then
self = level_1_E2()
elseif(sAnde == "s1e3") then
self = level_1_E3()
elseif(sAnde == "s2e1") then
self = level_2_E1()
elseif(sAnde == "s2e2") then
self = level_2_E2()
elseif(sAnde == "s2e3") then
self = level_2_E3()
--[[
elseif(sAnde == "s3e1") then
self = level_3_E1()
elseif(sAnde == "s3e2") then
self = level_3_E2()
elseif(sAnde == "s3e3") then
self = level_3_E3()
elseif(sAnde == "s4e1") then
self = level_4_E1()
elseif(sAnde == "s4e2") then
self = level_4_E2()
elseif(sAnde == "s4e3") then
self = level_4_E3()
--]]
end

return self


end	