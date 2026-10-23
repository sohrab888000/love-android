
require ("CODES/LEVELS/level_2/level_two_load")


function level_2_E3()


local self = {}

self = level_two()

self.time_to_finish = 674 --just for test
self.name = "s2e3"
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
self.orc_one_run_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc2/walk_spritesheet.png")
self.orc_one_run_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc3/walk_spritesheet.png")

self.orc_one_idle_set1 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/idle_spritesheet.png")
self.orc_one_idle_set2 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc2/idle_spritesheet.png")
self.orc_one_idle_set3 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc3/idle_spritesheet.png")

self.orc_one_attack_set1 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/attack_spritesheet.png")
self.orc_one_attack_set2 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc2/attack_spritesheet.png")
self.orc_one_attack_set3 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc3/attack_spritesheet.png")

self.orc_one_dodge_set1 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/dodge_spritesheet.png")
self.orc_one_dodge_set2 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc2/dodge_spritesheet.png")
self.orc_one_dodge_set3 =  love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc3/dodge_spritesheet.png")

self.orc_one_hurt_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/gothit_spritesheet.png")
self.orc_one_hurt_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc2/gothit_spritesheet.png")
self.orc_one_hurt_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc3/gothit_spritesheet.png")

self.orc_one_die_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc1/die_spritesheet.png")
self.orc_one_die_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc2/die_spritesheet.png")
self.orc_one_die_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC/orc3/die_spritesheet.png")	

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

self.orc_mb_one_run_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb1/run_spritesheet.png")
self.orc_mb_one_run_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb2/run_spritesheet.png")	
self.orc_mb_one_run_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb3/run_spritesheet.png")

self.orc_mb_one_idle_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb1/idle_spritesheet.png")
self.orc_mb_one_idle_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb2/idle_spritesheet.png")
self.orc_mb_one_idle_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb3/idle_spritesheet.png")

self.orc_mb_one_attack_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb1/attack_spritesheet.png")
self.orc_mb_one_attack_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb2/attack_spritesheet.png")
self.orc_mb_one_attack_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb3/attack_spritesheet.png")

self.orc_mb_one_jump_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb1/jump_spritesheet.png")
self.orc_mb_one_jump_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb2/jump_spritesheet.png")
self.orc_mb_one_jump_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb3/jump_spritesheet.png")

self.orc_mb_one_hurt_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb1/gothit_spritesheet.png")
self.orc_mb_one_hurt_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb2/gothit_spritesheet.png")
self.orc_mb_one_hurt_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb3/gothit_spritesheet.png")

self.orc_mb_one_die_set1 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb1/die_spritesheet.png")
self.orc_mb_one_die_set2 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb2/die_spritesheet.png")
self.orc_mb_one_die_set3 = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/orc_mb3/die_spritesheet.png")

self.orc_mb_pics_for_thief = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/ORC_MB/thief_spritesheet.png")


self.orc_mb_sounds = {}
self.orc_mb_sounds[1] = love.audio.newSource('MUSIC/level_two/orc_mb/attack.mp3', 'stream')
self.orc_mb_sounds[1]:setVolume(1.0)
self.orc_mb_sounds[2] = love.audio.newSource('MUSIC/level_two/orc_mb/die.mp3', 'stream')
self.orc_mb_sounds[2]:setVolume(1.0)
self.orc_mb_sounds[3] = love.audio.newSource('MUSIC/level_two/orc_mb/gethit.mp3', 'stream')
self.orc_mb_sounds[3]:setVolume(1.0)
self.orc_mb_sounds[4] = love.audio.newSource('MUSIC/level_two/orc_mb/attack_earth.mp3', 'stream')
self.orc_mb_sounds[4]:setVolume(1.0)
self.orc_mb_sounds[5] = love.audio.newSource('MUSIC/level_two/orc_mb/jump.mp3', 'stream')
self.orc_mb_sounds[5]:setVolume(1.0)


self.loading_orc_mb = true
self.loading_troll = false

elseif self.loading_troll == false then

--should be used in stage that respawns trolls


self.troll_idle = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/idle_spritesheet.png")
self.troll_move = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/walk_spritesheet.png")
self.troll_attack = {}
self.troll_attack[1] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (1).png")
self.troll_attack[2] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (2).png")
self.troll_attack[3] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (3).png")
self.troll_attack[4] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (4).png")
self.troll_attack[5] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (5).png")
self.troll_attack[6] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (6).png")
self.troll_attack[7] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (7).png")
self.troll_attack[8] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (8).png")
self.troll_attack[9] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (9).png")
self.troll_attack[10] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (10).png")
self.troll_attack[11] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (11).png")
self.troll_attack[12] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (12).png")
self.troll_attack[13] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (13).png")
self.troll_attack[14] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (14).png")
self.troll_attack[15] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (15).png")
self.troll_attack[16] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (16).png")
self.troll_attack[17] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (17).png")
self.troll_attack[18] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (18).png")
self.troll_attack[19] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (19).png")
self.troll_attack[20] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (20).png")
self.troll_attack[21] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (21).png")
self.troll_attack[22] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/attack/troll_attack (22).png")
self.troll_hittwirl = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/hittwirl_spritesheet.png")
self.troll_gothit = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/gothit_spritesheet.png")
self.troll_knockdown = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/knockdown_spritesheet.png")
self.troll_onground = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/onground_spritesheet.png")
self.troll_getup = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/getup_spritesheet.png")
self.troll_dead = {}
self.troll_dead[1] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (1).png")
self.troll_dead[2] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (2).png")
self.troll_dead[3] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (3).png")
self.troll_dead[4] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (4).png")
self.troll_dead[5] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (5).png")
self.troll_dead[6] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (6).png")
self.troll_dead[7] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (7).png")
self.troll_dead[8] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (8).png")
self.troll_dead[9] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (9).png")
self.troll_dead[10] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (10).png")
self.troll_dead[11] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (11).png")
self.troll_dead[12] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (12).png")
self.troll_dead[13] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (13).png")
self.troll_dead[14] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (14).png")
self.troll_dead[15] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (15).png")
self.troll_dead[16] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (16).png")
self.troll_dead[17] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (17).png")
self.troll_dead[18] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (18).png")
self.troll_dead[19] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (19).png")
self.troll_dead[20] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (20).png")
self.troll_dead[21] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (21).png")
self.troll_dead[22] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (22).png")
self.troll_dead[23] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (23).png")
self.troll_dead[24] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (24).png")
self.troll_dead[25] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (25).png")
self.troll_dead[26] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (26).png")
self.troll_dead[27] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (27).png")
self.troll_dead[28] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (28).png")
self.troll_dead[29] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (29).png")
self.troll_dead[30] = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/die/troll_dead (30).png")

self.troll_pics_for_thief = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/TROLL/thief_spritesheet.png")


self.troll_sounds = {}
self.troll_sounds[1] = love.audio.newSource('MUSIC/level_two/troll/attack.mp3', 'stream')
self.troll_sounds[1]:setVolume(1.0)
self.troll_sounds[2] = love.audio.newSource('MUSIC/level_two/troll/die.wav', 'stream')
self.troll_sounds[2]:setVolume(1.0)
self.troll_sounds[3] = love.audio.newSource('MUSIC/level_two/troll/gethit.mp3', 'stream')
self.troll_sounds[3]:setVolume(1.0)

--]]

self.loading_troll = true
self.loading_background_and_animations = false

elseif self.loading_background_and_animations == false then

self.background_img = love.graphics.newImage("ART/LEVELS/LEVEL_TWO/episode3/environment.png")
--just to test:
self.all_tile = love.graphics.newImage("ART/LEVELS/LEVEL_TWO/episode3/all_tiles.png")

self.windLike_p = love.graphics.newImage("ART/LEVELS/LEVEL_TWO/level_two_windLike_white.png")
self.windLike_w = self.windLike_p
self.windLike_y = self.windLike_p
self.windLike_g = self.windLike_p
self.effect_hit_player = love.graphics.newImage("ART/ENEMIES/LEVEL_TWO/effect_player_hit.png")

self.back_music = love.audio.newSource('MUSIC/level_two/level_two.ogg', 'stream')

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
self.get_background().set_all(self.background_img,self.all_tile,0,0,3,5,3,main_scaler.width*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)-- img , x_coordinate , y_coordinate , time_to_shake , x_pics , y_pics , width_of_stages , height_of_stages


local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()

--set stages start_x , start_y , end_x , end_y:
self.add_stage( 0 , 0 , -w_of_s , -h_of_s )--1              
self.add_stage( -w_of_s , 0 , -2*w_of_s , -h_of_s )--2              
self.add_stage( -2*w_of_s , 0 , -3*w_of_s , -h_of_s )--3          
self.add_stage( -2*w_of_s , -h_of_s , -3*w_of_s , -2*h_of_s )--4
self.add_stage( -3*w_of_s , -h_of_s , -4*w_of_s , -2*h_of_s )--5
self.add_stage( -3*w_of_s , 0 , -4*w_of_s , -h_of_s )--6
self.add_stage( -4*w_of_s , 0 , -5*w_of_s , -h_of_s )--7
self.add_stage( -4*w_of_s , -h_of_s , -5*w_of_s , -2*h_of_s )--8
self.add_stage( -4*w_of_s , -2*h_of_s , -5*w_of_s , -3*h_of_s )--9
self.add_stage( -3*w_of_s , -2*h_of_s , -4*w_of_s , -3*h_of_s )--10
self.add_stage( -2*w_of_s , -2*h_of_s , -3*w_of_s , -3*h_of_s )--11
self.add_stage( -w_of_s , -2*h_of_s , -2*w_of_s , -3*h_of_s )--12
self.add_stage( 0 , -2*h_of_s , -w_of_s , -3*h_of_s )--13
self.add_stage( 0 , -h_of_s , -w_of_s , -2*h_of_s )--14
self.add_stage( -w_of_s , -h_of_s , -2*w_of_s , -2*h_of_s )--15



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
--6
self.stages[6].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[6].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[6].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[6].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--7
self.stages[7].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[7].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[7].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[7].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--8
self.stages[8].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[8].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[8].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[8].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--9
self.stages[9].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[9].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[9].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[9].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--10
self.stages[10].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[10].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[10].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[10].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--11
self.stages[11].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[11].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[11].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[11].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--12
self.stages[12].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[12].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[12].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[12].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--13
self.stages[13].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[13].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[13].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[13].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--14
self.stages[14].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[14].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[14].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[14].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
--15
self.stages[15].set_roof(0 , 0 , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)
self.stages[15].set_right_side(main_scaler.width*main_scaler.scale_x , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[15].set_left_side(0 , 0 , 1*main_scaler.scale_x , main_scaler.height*main_scaler.scale_y)
self.stages[15].set_ground(0 , main_scaler.height*main_scaler.scale_y , main_scaler.width*main_scaler.scale_x , 1*main_scaler.scale_y)


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
self.add_transition(3,4,false,false,false,true)--3to4
self.add_transition(4,5,false,true,false,false)--4to5
self.add_transition(5,6,true,false,false,false)--5to6
self.add_transition(6,7,false,true,false,false)--6to7
self.add_transition(7,8,false,false,false,true)--7to8
self.add_transition(8,9,false,false,false,true)--8to9
self.add_transition(9,10,false,false,true,false)--9to10
self.add_transition(10,11,false,false,true,false)--10to11
self.add_transition(11,12,false,false,true,false)--11to12
self.add_transition(12,13,false,false,true,false)--12to13
self.add_transition(13,14,true,false,false,false)--13to14
self.add_transition(14,15,false,true,false,false)--14to15



--stage1
self.stages[1].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[1].add_enemy_to_list_of_enemy2( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage2
self.stages[2].add_enemy_to_list_of_enemy1( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[2].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[2].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[2].add_enemy_to_list_of_enemy3( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[2].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[2].add_enemy_to_list_of_enemy3( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[2].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
--stage3
self.stages[3].add_enemy_to_list_of_enemy1( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[3].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[3].add_enemy_to_list_of_enemy3( {name = "orc_mb_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage4
--no enemy!
--stage5
self.stages[5].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[5].add_enemy_to_list_of_enemy1( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
--stage6
--no enemy!
--stage7
self.stages[7].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[7].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[7].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[7].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[7].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage8
--no enemy!
--stage9
self.stages[9].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[9].add_enemy_to_list_of_enemy2( {name = "orc_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage10
--no enemy!
--stage11
self.stages[11].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy3( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy3( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[11].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
--stage12
self.stages[12].add_enemy_to_list_of_enemy1( {name = "orc_mb_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy1( {name = "orc_mb_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy1( {name = "orc_mb_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[12].add_enemy_to_list_of_enemy2( {name = "orc_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage13
--no enemy!
--stage14
self.stages[14].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[14].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
--stage15
self.stages[15].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy1( {name = "troll" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_two" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_one" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy2( {name = "orc_mb_model_three" , x = (main_scaler.width/8)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/8)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_two" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_one" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )
self.stages[15].add_enemy_to_list_of_enemy3( {name = "orc_model_three" , x = (main_scaler.width/1.2)*main_scaler.scale_x , y = (main_scaler.height/1.2)*main_scaler.scale_y} )


self.stages[1].set_list_of_enemy1_timer_limit(5)
self.stages[1].set_list_of_enemy2_timer_limit(5)

self.stages[2].set_list_of_enemy1_timer_limit(5)
self.stages[2].set_list_of_enemy2_timer_limit(5)
self.stages[2].set_list_of_enemy3_timer_limit(5)

self.stages[3].set_list_of_enemy1_timer_limit(5)
self.stages[3].set_list_of_enemy2_timer_limit(5)
self.stages[3].set_list_of_enemy3_timer_limit(5)

self.stages[5].set_list_of_enemy1_timer_limit(5)
self.stages[5].set_list_of_enemy2_timer_limit(5)
self.stages[5].set_list_of_enemy3_timer_limit(5)

self.stages[7].set_list_of_enemy1_timer_limit(5)
self.stages[7].set_list_of_enemy2_timer_limit(5)

self.stages[9].set_list_of_enemy1_timer_limit(5)
self.stages[9].set_list_of_enemy2_timer_limit(5)

self.stages[11].set_list_of_enemy1_timer_limit(5)
self.stages[11].set_list_of_enemy2_timer_limit(5)
self.stages[11].set_list_of_enemy3_timer_limit(5)

self.stages[12].set_list_of_enemy1_timer_limit(5)
self.stages[12].set_list_of_enemy2_timer_limit(5)

self.stages[14].set_list_of_enemy1_timer_limit(5)
self.stages[14].set_list_of_enemy2_timer_limit(5)

self.stages[15].set_list_of_enemy1_timer_limit(5)
self.stages[15].set_list_of_enemy2_timer_limit(5)
self.stages[15].set_list_of_enemy3_timer_limit(5)

--self.add_enemy_to_list_of_boss(enemy)

--stage should have enemies ::: 1 , 2 , 3 , 5 , 7 , 9 , 11 , 12 , 14 , 15

stages_should_gain_health_at = {2,3,5,7,9,11,12,14,15}
health_that_should_pass_at_stages = {10,20,25,25,25,30,30,25,40}
--at level_design_help.lua:
self.set_stages_should_gain_health_at(stages_should_gain_health_at)
self.set_health_that_should_pass_at_stages(health_that_should_pass_at_stages)



--self.stages[2].add_environment_collision(true,main_scaler.width*main_scaler.scale_x,(main_scaler.height-100)*main_scaler.scale_y,645*main_scaler.scale_x,230*main_scaler.scale_y)
--self.stages[2].add_environment_collision(true,(2*main_scaler.width-680)*main_scaler.scale_x,(main_scaler.height-100)*main_scaler.scale_y,675*main_scaler.scale_x,230*main_scaler.scale_y)
--self.stages[5].add_environment_collision(true,0,-115*main_scaler.scale_y,685*main_scaler.scale_x,230*main_scaler.scale_y)
--self.stages[5].add_environment_collision(true,(main_scaler.width-640)*main_scaler.scale_x,-115*main_scaler.scale_y,675*main_scaler.scale_x,230*main_scaler.scale_y)

--self.stages[4].add_environment_collision(true,((1/2*main_scaler.width)-200)*main_scaler.scale_x,((main_scaler.height/2.5)-100)*main_scaler.scale_y,((1/4*main_scaler.width)-190)*main_scaler.scale_x,main_scaler.height/3*main_scaler.scale_y)

--very important functions in intialize won't work!!!
--it means for stage two should make manual

--adding animations: add_animation(img,width,height,duration,bool,x,y,main_scaler.scale_x,main_scaler.scale_y) should think about loading animations (like enemies!)

self.windLike_p = love.graphics.newImage("ART/LEVELS/LEVEL_TWO/level_two_windLike_white.png")
self.windLike_w = self.windLike_p
self.windLike_y = self.windLike_p
self.windLike_g = self.windLike_p

self.stages[1].add_animation("up_left_wind",true,0,0)
self.stages[1].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[1].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[1].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[1].animations[1].animation.set(self.windLike_p,(500/5)-1,375/5,0.032)
self.stages[1].animations[2].animation.set(self.windLike_w,(500/5)-1,375/5,0.032)
self.stages[1].animations[3].animation.set(self.windLike_y,(500/5)-1,375/5,0.032)
self.stages[1].animations[4].animation.set(self.windLike_g,(500/5)-1,375/5,0.032)

self.stages[1].animations[1].animation.set_scale(5*main_scaler.scale_x,5*main_scaler.scale_y)
self.stages[1].animations[2].animation.set_scale(5*main_scaler.scale_x,-5*main_scaler.scale_y)
self.stages[1].animations[3].animation.set_scale(-5*main_scaler.scale_x,5*main_scaler.scale_y)
self.stages[1].animations[4].animation.set_scale(-5*main_scaler.scale_x,-5*main_scaler.scale_y)

self.stages[2].add_animation("up_left_wind",true,main_scaler.width*main_scaler.scale_x,0)
self.stages[2].add_animation("down_left_wind",true,main_scaler.width*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)
self.stages[2].add_animation("up_right_wind",true,2*(main_scaler.width)*main_scaler.scale_x,0)
self.stages[2].add_animation("down_right_wind",true,2*(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[2].animations[1].animation.set(self.windLike_w,(500/5)-1,375/5,0.032)
self.stages[2].animations[2].animation.set(self.windLike_p,(500/5)-1,375/5,0.032)
self.stages[2].animations[3].animation.set(self.windLike_g,(500/5)-1,375/5,0.032)
self.stages[2].animations[4].animation.set(self.windLike_y,(500/5)-1,375/5,0.032)

self.stages[2].animations[1].animation.set_scale(5*main_scaler.scale_x,5*main_scaler.scale_y)
self.stages[2].animations[2].animation.set_scale(5*main_scaler.scale_x,-5*main_scaler.scale_y)
self.stages[2].animations[3].animation.set_scale(-5*main_scaler.scale_x,5*main_scaler.scale_y)
self.stages[2].animations[4].animation.set_scale(-5*main_scaler.scale_x,-5*main_scaler.scale_y)

self.stages[3].add_animation("up_left_wind",true,0,0)
self.stages[3].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[3].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[3].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[4].add_animation("up_left_wind",true,0,0)
self.stages[4].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[4].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[4].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[5].add_animation("up_left_wind",true,0,0)
self.stages[5].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[5].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[5].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[6].add_animation("up_left_wind",true,0,0)
self.stages[6].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[6].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[6].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[7].add_animation("up_left_wind",true,0,0)
self.stages[7].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[7].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[7].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[8].add_animation("up_left_wind",true,0,0)
self.stages[8].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[8].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[8].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[9].add_animation("up_left_wind",true,0,0)
self.stages[9].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[9].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[9].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[10].add_animation("up_left_wind",true,0,0)
self.stages[10].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[10].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[10].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[11].add_animation("up_left_wind",true,0,0)
self.stages[11].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[11].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[11].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[12].add_animation("up_left_wind",true,0,0)
self.stages[12].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[12].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[12].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[13].add_animation("up_left_wind",true,0,0)
self.stages[13].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[13].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[13].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[14].add_animation("up_left_wind",true,0,0)
self.stages[14].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[14].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[14].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)

self.stages[15].add_animation("up_left_wind",true,0,0)
self.stages[15].add_animation("down_left_wind",true,0,main_scaler.height*main_scaler.scale_y)
self.stages[15].add_animation("up_right_wind",true,(main_scaler.width)*main_scaler.scale_x,0)
self.stages[15].add_animation("down_right_wind",true,(main_scaler.width)*main_scaler.scale_x,main_scaler.height*main_scaler.scale_y)


self.back_music:setVolume(1.0)
self.back_music:setLooping(true)
self.back_music:play()



self.loading_and_setting = false

end--level_1.loading_and_setting

end--end of function








--override
self.ready_two_stages_animations_to_use = function(stage_index_1 , stage_index_2)

local transition = 0

for i = 1 , #self.transitions_to_move_background do

if self.transitions_to_move_background[i].get_current_stage_index() == stage_index_1 and
self.transitions_to_move_background[i].get_next_stage_index() == stage_index_2 then

transition = self.transitions_to_move_background[i]


end

end


if transition == 0 then return transition end


local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()





if transition.get_to_up() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].animations do
local anim = self.stages[transition.get_next_stage_index()].animations[i].animation
local x = anim.get_x()
local y = anim.get_y()
y = y - h_of_s 
self.stages[transition.get_next_stage_index()].animations[i].animation.set_position(x,y)

if self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_p,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_w,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_y,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,-5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_g,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,-5*main_scaler.scale_y)

--elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then	


end

end



elseif transition.get_to_right() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].animations do
local anim = self.stages[transition.get_next_stage_index()].animations[i].animation
local x = anim.get_x()
local y = anim.get_y()
x = x + w_of_s 

self.stages[transition.get_next_stage_index()].animations[i].animation.set_position(x,y)

if self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_p,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_w,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_y,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,-5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_g,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,-5*main_scaler.scale_y)

--elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then	

end

end



elseif transition.get_to_left() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].animations do
local anim = self.stages[transition.get_next_stage_index()].animations[i].animation
local x = anim.get_x()
local y = anim.get_y()
x = x - w_of_s 

self.stages[transition.get_next_stage_index()].animations[i].animation.set_position(x,y)

if self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_w,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_p,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_g,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,-5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_y,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,-5*main_scaler.scale_y)

--elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then	


end


end



elseif transition.get_to_down() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].animations do
local anim = self.stages[transition.get_next_stage_index()].animations[i].animation
local x = anim.get_x()
local y = anim.get_y()
y = y + h_of_s 

self.stages[transition.get_next_stage_index()].animations[i].animation.set_position(x,y)

if self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_w,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_p,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_left_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_g,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(5*main_scaler.scale_x,-5*main_scaler.scale_y)

elseif self.stages[transition.get_next_stage_index()].animations[i].name == "down_right_wind" then

self.stages[transition.get_next_stage_index()].animations[i].animation.set(self.windLike_y,(500/5)-1,375/5,0.032)
self.stages[transition.get_next_stage_index()].animations[i].animation.set_scale(-5*main_scaler.scale_x,-5*main_scaler.scale_y)

--elseif self.stages[transition.get_next_stage_index()].animations[i].name == "up_left_wind" then	


end


end

end


end--end of function






return self

end






