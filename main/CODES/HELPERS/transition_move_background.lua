
function new_transition_move_background(current_stage_index,next_stage_index,to_up,to_right,to_left,to_down)

local self = {}

self.current_stage_index = current_stage_index
self.next_stage_index = next_stage_index
self.to_up = to_up
self.to_right = to_right
self.to_left = to_left
self.to_down = to_down

self.get_current_stage_index = function()
return self.current_stage_index
end

self.get_next_stage_index = function()
return self.next_stage_index
end

self.get_to_up = function()
return self.to_up
end

self.get_to_right = function()
return self.to_right
end

self.get_to_left = function()
return self.to_left
end

self.get_to_down = function()
return self.to_down
end






return self

end