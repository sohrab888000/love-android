function episode_init()

local self = {}

jupiter = require "jupiter"
choosed_episode = jupiter.load("chooser.txt")
self.episode = choosed_episode[1] --real
--self.episode = "train" --test
self.pause = false

self.set_pause = function(bool)
self.pause = bool
end

self.get_pause = function()
return self.pause
end

self.get_current_episode = function()
return self.episode
end

self.write_to_next = function(file_name,value_write)
if not love.filesystem.exists(file_name) then
jupiter = require "jupiter"
data = {_fileName = file_name, value_write}
success = jupiter.save(data)
else
jupiter = require "jupiter"
newData = jupiter.load(file_name)
newData[1] = value_write
success1 = jupiter.save(newData)
end
end

self.unlock_next_episode = function()

if self.episode == "s1e1" then
self.write_to_next("season_one_e1.txt","1")
elseif self.episode == "s1e2" then
self.write_to_next("season_one_e2.txt","1")
elseif self.episode == "s1e3" then
self.write_to_next("season_one_e3.txt","1")
elseif self.episode == "s2e1" then
self.write_to_next("season_two_e1.txt","1")
elseif self.episode == "s2e2" then
self.write_to_next("season_two_e2.txt","1")
elseif self.episode == "s2e3" then
--self.write_to_next("season_two_e3.txt","1")
--elseif self.episode == "s3e1" then
--self.write_to_next("season_three_e1.txt","1")
--elseif self.episode == "s3e2" then
--self.write_to_next("season_three_e2.txt","1")
--[[other stage will come soon!
elseif self.episode == "s3e3" then
self.write_to_next("season_three_e3.txt","1")
elseif self.episode == "s4e1" then
self.write_to_next("season_four_e1.txt","1")
elseif self.episode == "s4e2" then
self.write_to_next("season_four_e2.txt","1")
--]]
end

end







return self

end