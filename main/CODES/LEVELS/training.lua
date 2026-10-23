require ("CODES/LEVELS/level_2/level_two_load")

function training()


local self = {}

self = level_two()




self.time_to_finish = 10000 --just for test
self.name = "training"
self.get_time_for_finish = function() return self.time_to_finish end

--loading level(new function)

--override
self.loading = function()

if self.initial == false then--main condition

if self.loading_player == false then

self.Player_attacks_rage = {}
self.Player_attacks_rage[1] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (1).png")
self.Player_attacks_rage[2] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (2).png")
self.Player_attacks_rage[3] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (3).png")
self.Player_attacks_rage[4] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (4).png")
self.Player_attacks_rage[5] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (5).png")
self.Player_attacks_rage[6] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (6).png")
self.Player_attacks_rage[7] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (7).png")
self.Player_attacks_rage[8] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (8).png")
self.Player_attacks_rage[9] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (9).png")
self.Player_attacks_rage[10] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (10).png")
self.Player_attacks_rage[11] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (11).png")
self.Player_attacks_rage[12] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (12).png")
self.Player_attacks_rage[13] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (13).png")
self.Player_attacks_rage[14] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (14).png")
self.Player_attacks_rage[15] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (15).png")
self.Player_attacks_rage[16] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (16).png")
self.Player_attacks_rage[17] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (17).png")
self.Player_attacks_rage[18] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (18).png")
self.Player_attacks_rage[19] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (19).png")
self.Player_attacks_rage[20] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (20).png")
self.Player_attacks_rage[21] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (21).png")
self.Player_attacks_rage[22] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (22).png")
self.Player_attacks_rage[23] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (23).png")
self.Player_attacks_rage[24] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (24).png")
self.Player_attacks_rage[25] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (25).png")
self.Player_attacks_rage[26] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (26).png")
self.Player_attacks_rage[27] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (27).png")
self.Player_attacks_rage[28] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (28).png")
self.Player_attacks_rage[29] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (29).png")
self.Player_attacks_rage[30] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (30).png")
self.Player_attacks_rage[31] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (31).png")
self.Player_attacks_rage[32] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (32).png")
self.Player_attacks_rage[33] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (33).png")
self.Player_attacks_rage[34] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (34).png")
self.Player_attacks_rage[35] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (35).png")
self.Player_attacks_rage[36] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (36).png")
self.Player_attacks_rage[37] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (37).png")
self.Player_attacks_rage[38] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (38).png")
self.Player_attacks_rage[39] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (39).png")
self.Player_attacks_rage[40] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (40).png")
self.Player_attacks_rage[41] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (41).png")
self.Player_attacks_rage[42] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (42).png")
self.Player_attacks_rage[43] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (43).png")
self.Player_attacks_rage[44] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (44).png")
self.Player_attacks_rage[45] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (45).png")
self.Player_attacks_rage[46] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (46).png")
self.Player_attacks_rage[47] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (47).png")
self.Player_attacks_rage[48] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (48).png")
self.Player_attacks_rage[49] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (49).png")
self.Player_attacks_rage[50] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (50).png")
self.Player_attacks_rage[51] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (51).png")
self.Player_attacks_rage[52] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (52).png")
self.Player_attacks_rage[53] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (53).png")
self.Player_attacks_rage[54] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (54).png")
self.Player_attacks_rage[55] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (55).png")
self.Player_attacks_rage[56] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (56).png")
self.Player_attacks_rage[57] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (57).png")
self.Player_attacks_rage[58] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (58).png")
self.Player_attacks_rage[59] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (59).png")
self.Player_attacks_rage[60] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (60).png")
self.Player_attacks_rage[61] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (61).png")
self.Player_attacks_rage[62] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (62).png")
self.Player_attacks_rage[63] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (63).png")
self.Player_attacks_rage[64] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (64).png")
self.Player_attacks_rage[65] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (65).png")
self.Player_attacks_rage[66] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (66).png")
self.Player_attacks_rage[67] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (67).png")
self.Player_attacks_rage[68] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (68).png")
self.Player_attacks_rage[69] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (69).png")
self.Player_attacks_rage[70] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (70).png")
self.Player_attacks_rage[71] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (71).png")
self.Player_attacks_rage[72] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (72).png")
self.Player_attacks_rage[73] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (73).png")
self.Player_attacks_rage[74] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (74).png")
self.Player_attacks_rage[75] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (75).png")
self.Player_attacks_rage[76] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (76).png")
self.Player_attacks_rage[77] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (77).png")
self.Player_attacks_rage[78] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (78).png")
self.Player_attacks_rage[79] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (79).png")
self.Player_attacks_rage[80] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (80).png")
self.Player_attacks_rage[81] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (81).png")
self.Player_attacks_rage[82] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (82).png")
self.Player_attacks_rage[83] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (83).png")
self.Player_attacks_rage[84] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (84).png")
self.Player_attacks_rage[85] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (85).png")
self.Player_attacks_rage[86] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (86).png")
self.Player_attacks_rage[87] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (87).png")
self.Player_attacks_rage[88] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (88).png")
self.Player_attacks_rage[89] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (89).png")
self.Player_attacks_rage[90] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (90).png")
self.Player_attacks_rage[91] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (91).png")
self.Player_attacks_rage[92] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (92).png")
self.Player_attacks_rage[93] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (93).png")
self.Player_attacks_rage[94] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (94).png")
self.Player_attacks_rage[95] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (95).png")
self.Player_attacks_rage[96] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (96).png")
self.Player_attacks_rage[97] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (97).png")
self.Player_attacks_rage[98] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (98).png")
self.Player_attacks_rage[99] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (99).png")
self.Player_attacks_rage[100] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (100).png")
self.Player_attacks_rage[101] = love.graphics.newImage("ART/PLAYER/attacks_frames/Player_attacks_rage (101).png")


self.player_idle = love.graphics.newImage("ART/PLAYER/idle_spritesheet.png")
self.player_move = love.graphics.newImage("ART/PLAYER/walk_spritesheet.png")
self.player_thief = love.graphics.newImage("ART/PLAYER/thief_spritesheet.png")
self.player_dodge_gothit = love.graphics.newImage("ART/PLAYER/dodge_gothit_spritesheet.png")
self.player_die = love.graphics.newImage("ART/PLAYER/die_spritesheet.png")
self.player_shadow_transform = love.graphics.newImage("ART/PLAYER/shadowTransform_spritesheet.png")


self.player_sounds = {}
self.player_sounds[1] = love.audio.newSource('MUSIC/player/attack.mp3', 'stream')
self.player_sounds[1]:setVolume(1.0)
self.player_sounds[2] = love.audio.newSource('MUSIC/player/die.mp3', 'stream')
self.player_sounds[2]:setVolume(1.0)
self.player_sounds[3] = love.audio.newSource('MUSIC/player/gothit.mp3', 'stream')
self.player_sounds[3]:setVolume(1.0)
self.player_sounds[4] = love.audio.newSource('MUSIC/player/summon.mp3', 'stream')
self.player_sounds[4]:setVolume(1.0)
self.player_sounds[5] = love.audio.newSource('MUSIC/player/transform.wav', 'stream')
self.player_sounds[5]:setVolume(1.0)
self.player_sounds[6] = love.audio.newSource('MUSIC/player/transform.wav', 'stream')
self.player_sounds[6]:setVolume(1.0)
self.player_sounds[7] = love.audio.newSource('MUSIC/player/dodge.wav', 'stream')
self.player_sounds[7]:setVolume(1.0)


self.loading_player = true
self.loading_orc = false


elseif self.loading_orc == false then

self.orc_one_run_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/walk_spritesheet.png")

self.orc_one_idle_set1 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/idle_spritesheet.png")

self.orc_one_attack_set1 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/attack_spritesheet.png")

self.orc_one_dodge_set1 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/dodge_spritesheet.png")

self.orc_one_hurt_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/gothit_spritesheet.png")

self.orc_one_die_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/die_spritesheet.png")

self.orc_pics_for_thief = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/summon_spritesheet.png")	


self.orc_sounds = {}
self.orc_sounds[1] = love.audio.newSource('MUSIC/level_two/orc/attack.mp3', 'stream')
self.orc_sounds[1]:setVolume(1.0)
self.orc_sounds[2] = love.audio.newSource('MUSIC/level_two/orc/die.mp3', 'stream')
self.orc_sounds[2]:setVolume(1.0)
self.orc_sounds[3] = love.audio.newSource('MUSIC/level_two/orc/gethit.mp3', 'stream')
self.orc_sounds[3]:setVolume(1.0)

self.loading_orc = true
self.loading_orc_mb = false


elseif self.loading_orc_mb == false then

self.loading_orc_mb = true
self.loading_troll = false

elseif self.loading_troll == false then

self.loading_troll = true
self.loading_background_and_animations = false

elseif self.loading_background_and_animations == false then

self.background_img = love.graphics.newImage("ART/LEVELS/TRAINING/training.png")
self.stage1 = love.graphics.newImage("ART/LEVELS/TRAINING/stage1.png")
self.stage1_animation = {}
self.stage1_animation[1] = love.graphics.newImage("ART/LEVELS/TRAINING/stage1_animation/1.png")
self.stage1_animation[2] = love.graphics.newImage("ART/LEVELS/TRAINING/stage1_animation/2.png")
self.stage1_animation[3] = love.graphics.newImage("ART/LEVELS/TRAINING/stage1_animation/3.png")
self.stage1_animation[4] = love.graphics.newImage("ART/LEVELS/TRAINING/stage1_animation/4.png")
self.stage1_animation[5] = love.graphics.newImage("ART/LEVELS/TRAINING/stage1_animation/5.png")
self.stage1_animation[6] = self.stage1_animation[5]
self.stage1_animation[7] = self.stage1_animation[4]
self.stage1_animation[8] = self.stage1_animation[3]
self.stage1_animation[9] = self.stage1_animation[2]
self.stage1_animation[10] = self.stage1_animation[1]

self.stage1_animation_img_to_show = self.stage1_animation[1] 
self.stage1_animation_framespeed = 0
self.stage1_animation_frame = 1
self.attack_help = love.graphics.newImage("ART/LEVELS/TRAINING/attack.png")
self.thief_help = love.graphics.newImage("ART/LEVELS/TRAINING/thief.png")
self.release_help = love.graphics.newImage("ART/LEVELS/TRAINING/release.png")
self.dodge_help = love.graphics.newImage("ART/LEVELS/TRAINING/dodge.png")

self.effect_hit_player = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/effect_player_hit.png")

self.back_music = love.audio.newSource('MUSIC/training/training.mp3', 'stream')

self.loading_background_and_animations = true
self.initial = true

end

end--if intial == false

end











--override
--initial:(new function)

self.init = function()

if self.initial == true and self.loading_and_setting == true then


self.get_world().get_roof().set_to_be(true)
self.get_world().get_right_side().set_to_be(true)
self.get_world().get_left_side().set_to_be(true)
self.get_world().get_ground().set_to_be(true)
self.get_world().set_hero(create_player(0 ,(main_scaler.height/3)  * main_scaler.scale_y,20,self.Player_attacks_rage,self.player_idle,self.player_move,self.player_thief,self.player_dodge_gothit,self.player_die,self.player_shadow_transform,self.player_sounds))
--(main_scaler.width/3)  * main_scaler.scale_x
--just to test
self.get_background().set_all(self.background_img,self.all_tile,0,0,3,5,1,main_scaler.width*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)-- img , x_coordinate , y_coordinate , time_to_shake , x_pics , y_pics , width_of_stages , height_of_stages


local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()

--set stages start_x , start_y , end_x , end_y:
self.add_stage( 0 , 0 , -w_of_s , -h_of_s )--1              
self.add_stage( -w_of_s , 0 , -2*w_of_s , -h_of_s )--2              
self.add_stage( -2*w_of_s , 0 , -3*w_of_s , -h_of_s )--3          
self.add_stage( -3*w_of_s , 0 , -4*w_of_s , -h_of_s )--4
self.add_stage( -4*w_of_s , 0 , -5*w_of_s , -h_of_s )--5

--set the starter stage
self.stages[1].set_start_of_stage(true)

--set stages x , y limitations:
--1
self.stages[1].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[1].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[1].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[1].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--2
self.stages[2].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[2].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[2].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[2].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--3
self.stages[3].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[3].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[3].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[3].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--4
self.stages[4].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[4].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[4].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[4].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--5
self.stages[5].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[5].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[5].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[5].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)


--set current_stage and next_stage
self.set_current_stage_index(1)
self.set_next_stage_index(2)

--set x , y limitations from current_stage to world
self.set_side_limits_for_current_stage()

--adding transitions to handle switching stages
--(current_stage_index,next_stage_index,
------------------------up,right,left,down)
self.add_transition(1,2,false,true,false,false)--1to2
self.add_transition(2,3,false,true,false,false)--2to3
self.add_transition(3,4,false,true,false,false)--3to4
self.add_transition(4,5,false,true,false,false)--4to5



--stage1
--no enemy!
--stage2
self.stages[2].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage3
self.stages[3].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[3].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/1.5)*main_scaler.scale_y} )
--stage4
self.stages[4].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[4].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/1.5)*main_scaler.scale_y} )
self.stages[4].add_enemy_to_list_of_enemy3( {name = "orc_model_one" , x = (main_scaler.width/1.5)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage5
self.stages[5].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/1.5)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy3( {name = "orc_model_one" , x = (main_scaler.width/1.5)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )

self.stages[2].set_list_of_enemy1_timer_limit(5)

self.stages[3].set_list_of_enemy1_timer_limit(5)
self.stages[3].set_list_of_enemy2_timer_limit(5)

self.stages[4].set_list_of_enemy1_timer_limit(5)
self.stages[4].set_list_of_enemy2_timer_limit(5)
self.stages[4].set_list_of_enemy3_timer_limit(5)

self.stages[5].set_list_of_enemy1_timer_limit(5)
self.stages[5].set_list_of_enemy2_timer_limit(5)
self.stages[5].set_list_of_enemy3_timer_limit(5)

--stage should have enemies ::: 1 , 2 , 3 , 5 , 7 , 9 , 11 , 12 , 14 , 15

stages_should_gain_health_at = {2,3,5,7,9,11,12,14,15}
health_that_should_pass_at_stages = {10,20,25,25,25,30,30,25,40}
--at level_design_help.lua:
self.set_stages_should_gain_health_at(stages_should_gain_health_at)
self.set_health_that_should_pass_at_stages(health_that_should_pass_at_stages)

self.back_music:setVolume(1.0)
self.back_music:setLooping(true)
self.back_music:play()



self.loading_and_setting = false

end--level_1.loading_and_setting

end--end of function

self.draw_training_stuff = function(controller,level)
local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
if self.get_current_stage_index() == 1 then
love.graphics.draw(self.stage1,self.get_background().x_coordinate,self.get_background().y_coordinate,0,width/self.stage1:getWidth(),height/self.stage1:getHeight())
love.graphics.draw(self.stage1_animation_img_to_show,self.get_background().x_coordinate,self.get_background().y_coordinate,0,width/self.stage1_animation_img_to_show:getWidth(),height/self.stage1_animation_img_to_show:getHeight())
else
if level.name == "training" then
if (level.get_current_stage_index() == 2) then
love.graphics.draw(self.attack_help,controller.attack_button.x-100*main_scaler.scale_x,controller.attack_button.y-100*main_scaler.scale_y,0,200*main_scaler.scale_x/self.attack_help:getWidth(),120*main_scaler.scale_y/self.attack_help:getHeight())
end
if (level.get_current_stage_index() == 3) then
love.graphics.draw(self.dodge_help,controller.dodge_button.x-150*main_scaler.scale_x,controller.dodge_button.y-50*main_scaler.scale_y,0,300*main_scaler.scale_x/self.dodge_help:getWidth(),100*main_scaler.scale_y/self.dodge_help:getHeight())
end
if (level.get_current_stage_index() == 4) then
love.graphics.draw(self.thief_help,controller.thief_button.x-250*main_scaler.scale_x,controller.thief_button.y-50*main_scaler.scale_y,0,450*main_scaler.scale_x/self.thief_help:getWidth(),100*main_scaler.scale_y/self.thief_help:getHeight())
love.graphics.draw(self.release_help,controller.released_button.x-150*main_scaler.scale_x,controller.released_button.y-60*main_scaler.scale_y,0,300*main_scaler.scale_x/self.release_help:getWidth(),100*main_scaler.scale_y/self.release_help:getHeight())
end	
end
end

end

self.update_training_stuff = function(dt)
self.stage1_animation_update(dt)
end


self.stage1_animation_update = function(dt)
if self.stage1_animation_framespeed > 2 * dt then
if self.stage1_animation_frame < #self.stage1_animation then
self.stage1_animation_frame = self.stage1_animation_frame + 1	
else
self.stage1_animation_frame = 1
end
self.stage1_animation_framespeed = 0
else
self.stage1_animation_framespeed = self.stage1_animation_framespeed + dt
end
self.stage1_animation_img_to_show = self.stage1_animation[self.stage1_animation_frame]
end


return self

end