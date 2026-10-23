require ("CODES/CONTROLLER/ultimate_one_analog_controller")
require ("CODES/GUI/menu_WIN_LOSE_FA/button_inGame_menu")
require ("CODES/GUI/inGame_GUI/button_inGame_GUI")
require ("CODES/LEVELS/level_chooser")
require("CODES/HELPERS/SCALE")
require("CODES/HELPERS/episode_init_state")
require("CODES/HELPERS/timer")

function love.load()

love.window.setMode(0, 0)

hh = love.graphics.getHeight()
ww = love.graphics.getWidth()

main_scaler = NEW_MAIN_SCALER()

love.window.setMode(ww, hh)

one_analog_controller = make_controller(
--[[analog]](main_scaler.width/7)  * main_scaler.scale_x , (main_scaler.height/1.32)  * main_scaler.scale_y , (main_scaler.width/8)  * main_scaler.scale_x ,
--[[attack_button1]](main_scaler.width - main_scaler.width/12)  * main_scaler.scale_x , (main_scaler.height  * main_scaler.scale_y ) - (3.5 * (main_scaler.width/16)  * main_scaler.scale_x ) , ((25*main_scaler.width)/640)  * main_scaler.scale_x ,
--[[dodge_button2]](main_scaler.width - main_scaler.width/9)  * main_scaler.scale_x , (main_scaler.height  * main_scaler.scale_y ) - (1.35 * (main_scaler.width/16)  * main_scaler.scale_x ) , ((35*main_scaler.width)/640)  * main_scaler.scale_x ,
--[[thief_button3]](main_scaler.width - main_scaler.width/5.5)  * main_scaler.scale_x , (main_scaler.height  * main_scaler.scale_y ) - (2.9 * (main_scaler.width/16)  * main_scaler.scale_x ) , ((25*main_scaler.width)/640)  * main_scaler.scale_x ,
--[[released_button4]](main_scaler.width - main_scaler.width/4)  * main_scaler.scale_x , (main_scaler.height  * main_scaler.scale_y ) - (1.5 * (main_scaler.width/16)  * main_scaler.scale_x ) , ((25*main_scaler.width)/640)  * main_scaler.scale_x
)

--loading_animation_should go to GuI class -> main_menu that almost controll everything
loading = newAnimation2()
local img = love.graphics.newImage("ART/LEVELS/loading_spritesheet.png")
loading.set(img,492,297,0.0007)
loading.set_itrator(true)
loading.set_position(0,0)
loading.set_scale((main_scaler.width/492)*main_scaler.scale_x,(main_scaler.height/297)*main_scaler.scale_y)


game_controller = episode_init()

--should read from chooser.txt and pass to this function argument
level = chossing_season_and_episode(game_controller.get_current_episode())--using function from level level_chooser

--helping variables
one_time_init_handler_for_end_of_game_gui = true
player_has_won = true


--########################################gui_menu_inGame
--------------------------------------------------------------------------
pause_img = love.graphics.newImage("ART/GUI/pause.png")
play_img = love.graphics.newImage("ART/GUI/play.png")
restart_img = love.graphics.newImage("ART/GUI/restart.png")
music_on_img = love.graphics.newImage("ART/GUI/music_on.png")
music_off_img = love.graphics.newImage("ART/GUI/music_off.png")
menu_img = love.graphics.newImage("ART/GUI/menu.png")
music_init_img = music_on_img

should_mute = false --should read from music_state file and init
if not love.filesystem.exists("music_state.txt") then
jupiter = require "jupiter"
data = {_fileName = "music_state.txt", 1}
success = jupiter.save(data)
else
jupiter = require "jupiter"
newData = jupiter.load("music_state.txt")
if newData[1] == 0 then
should_mute = true
music_init_img = music_off_img
else
should_mute = false
music_init_img = music_on_img
end 
end



pause_play = new_button_in_GAME_GUI((main_scaler.width * main_scaler.scale_x) - ((main_scaler.height * 0.075)  * main_scaler.scale_y) , (main_scaler.height * 0.075)  * main_scaler.scale_y  , (main_scaler.height * 0.075)  * main_scaler.scale_y , pause_img)
restart = new_button_in_GAME_GUI((main_scaler.width * main_scaler.scale_x) - ((main_scaler.height * 0.075)  * main_scaler.scale_y) , (main_scaler.height * 0.225)  * main_scaler.scale_y , (main_scaler.height * 0.075)  * main_scaler.scale_y , restart_img)
music_on_off = new_button_in_GAME_GUI((main_scaler.width * main_scaler.scale_x) - ((main_scaler.height * 0.075)  * main_scaler.scale_y) , (main_scaler.height * 0.375)  * main_scaler.scale_y , (main_scaler.height * 0.075)  * main_scaler.scale_y , music_init_img)
menu = new_button_in_GAME_GUI((main_scaler.width * main_scaler.scale_x) - ((main_scaler.height * 0.075)  * main_scaler.scale_y) , (main_scaler.height * 0.525)  * main_scaler.scale_y , (main_scaler.height * 0.075)  * main_scaler.scale_y , menu_img)

--overriding the onclick functions of buttons just like android!!!
pause_play.onclick = function(level)
if pause_play.isReleased() then
   if pause_play.get_img() == play_img then	
    pause_play.set_img(pause_img)
    --resume the game
    resume_all_sounds()
    game_controller.set_pause(false)
   else
    pause_play.set_img(play_img)
    --pause the game
    pause_all_sounds()
    game_controller.set_pause(true)
   end	
pause_play.setReleased(false)
end
end
-------------------------------------------------------------------
restart.onclick = function()
if restart.isReleased() then
love.event.quit( "restart" )
restart.setReleased(false)
end
end
-------------------------------------------------------------------
music_on_off.onclick = function(level)
if music_on_off.isReleased() then
   if music_on_off.get_img() == music_on_img then	
    music_on_off.set_img(music_off_img)
    --mute the game
    should_mute = true

   jupiter = require "jupiter"
   newData = jupiter.load("music_state.txt")
   newData[1] = 0
   success1 = jupiter.save(newData)
   
   else
    music_on_off.set_img(music_on_img)
    --unmute the game
    should_mute = false
    unmute_all_sounds()
   
   jupiter = require "jupiter"
   newData = jupiter.load("music_state.txt")
   newData[1] = 1
   success1 = jupiter.save(newData)

   end	
music_on_off.setReleased(false)
end
end
-------------------------------------------------------------------
menu.onclick = function()
if menu.isReleased() then
love.event.quit()	
menu.setReleased(false)
end
end
--overriding the onclick functions of buttons just like android!!!
--------------------------------------------------------------------------
--########################################gui_menu_inGame
-------------------------------------------------------------------------
--#######################################gui at end of level

--calculating stars health in the end and time should effect the scoore
get_calculated_score = function(level)--(user_health,max_health,time_for_this_episode,time_user_finished_episode)
if player_has_won then
time_score = (level.time_for_this_episode / level.time_user_finished_episode) * 65
health_score = (level.user_health/level.max_health) * 35
total_score = (time_score + health_score) 
else
total_score = 0
end
return total_score
end



--calculate stars with informations from each episode
set_stars_and_win_lose = function(level)--should add these to episodes argument should change to just level

local stars = 0 

if (player_has_won) then
win_lose = love.graphics.newImage("ART/GUI/you_win.png")
if scoore >= level.three_star_scoore_needs then
stars_0_1_2_3 = love.graphics.newImage("ART/GUI/star_3.png")
stars = 3
elseif scoore < level.three_star_scoore_needs and scoore >= level.two_star_scoore_needs then
stars_0_1_2_3 = love.graphics.newImage("ART/GUI/star_2.png")
stars = 2
else	
stars_0_1_2_3 = love.graphics.newImage("ART/GUI/star_1.png")
stars = 1
end

else
stars_0_1_2_3 = love.graphics.newImage("ART/GUI/star_0.png")--update stars with time and time limit in arguments
win_lose = love.graphics.newImage("ART/GUI/you_lose.png")
stars = 0
end

if stars ~= 0 then 
if level.name ~= "training" then
save_best_score_for_episode(level.name,math.floor(scoore),stars,math.floor(level.time_user_finished_episode))
end
end

end

background = love.graphics.newImage("ART/GUI/bg.png")
board = love.graphics.newImage("ART/GUI/table.png")
text_img =  love.graphics.newImage("ART/GUI/text.png")
restart_score_menu = new_button_in_GAME_MENU((main_scaler.width/2 - 140)  * main_scaler.scale_x , (((main_scaler.height/1.5) + 200) * main_scaler.scale_y)-1200*main_scaler.scale_y , ((35*main_scaler.width)/640)  * main_scaler.scale_x , restart_img)
menu_score_menu = new_button_in_GAME_MENU((main_scaler.width/2 + 115)  * main_scaler.scale_x , (((main_scaler.height/1.5) + 200) * main_scaler.scale_y)-1200*main_scaler.scale_y , ((35*main_scaler.width)/640)  * main_scaler.scale_x , menu_img)
font = love.graphics.newFont("Cuprum.ttf",64)

--this is where at end of animation all thing should go:
end_ys={
restart = (((main_scaler.height/1.5) + 200) * main_scaler.scale_y) ,
menu = (((main_scaler.height/1.5) + 200) * main_scaler.scale_y) , 
background = main_scaler.height/8 * main_scaler.scale_y ,
board = (main_scaler.height/6 + 100) * main_scaler.scale_y,
stars = (main_scaler.height/6 + 150) * main_scaler.scale_y,
win_lose = (main_scaler.height/10 + 50) * main_scaler.scale_y,
text_img = (main_scaler.height/10 + 370) * main_scaler.scale_y,
text = (main_scaler.height/6 + 425) * main_scaler.scale_y
}
--this is start of animation all thing should move from:
start_ys={
restart = (((main_scaler.height/1.5) + 200) * main_scaler.scale_y)-1200*main_scaler.scale_y ,
menu = (((main_scaler.height/1.5) + 200) * main_scaler.scale_y)-1200*main_scaler.scale_y , 
background = (main_scaler.height/8 -1200) * main_scaler.scale_y,
board = (main_scaler.height/6 - 1100) * main_scaler.scale_y,
stars = (main_scaler.height/6 - 1050) * main_scaler.scale_y,
win_lose = (main_scaler.height/10 - 1150) * main_scaler.scale_y,
text_img = (main_scaler.height/10 - 830) * main_scaler.scale_y,
text = (main_scaler.height/6 - 775) * main_scaler.scale_y
}


--overriding the onclick functions of buttons just like android!!!
restart_score_menu.onclick = function()
if restart_score_menu.isReleased() then
love.event.quit( "restart" )
restart_score_menu.setReleased(false)
end
end
-------------------------------------------------------------------
menu_score_menu.onclick = function()
if menu_score_menu.isReleased() then
love.event.quit()	
menu_score_menu.setReleased(false)
end
end
--overriding the onclick functions of buttons just like android!!!

update_socre_menu = function()
if start_ys == end_ys then
menu_score_menu.onclick()
restart_score_menu.onclick()
elseif math.abs(start_ys.background - end_ys.background) > 10*main_scaler.scale_y then
start_ys.restart = start_ys.restart + 10*main_scaler.scale_y
start_ys.menu =  start_ys.menu + 10*main_scaler.scale_y
start_ys.background = start_ys.background + 10*main_scaler.scale_y
start_ys.board = start_ys.board + 10*main_scaler.scale_y
start_ys.stars = start_ys.stars + 10*main_scaler.scale_y
start_ys.win_lose = start_ys.win_lose + 10*main_scaler.scale_y
start_ys.text_img = start_ys.text_img + 10*main_scaler.scale_y
start_ys.text = start_ys.text + 10*main_scaler.scale_y
menu_score_menu.setY(start_ys.menu)
restart_score_menu.setY(start_ys.restart)
else
start_ys = end_ys
menu_score_menu.setY(start_ys.menu)
restart_score_menu.setY(start_ys.restart)
end	
end



draw_score_menu = function()
love.graphics.draw(background ,main_scaler.width/4 * main_scaler.scale_x , start_ys.background , 0 , main_scaler.width/2 * main_scaler.scale_x / background:getWidth() ,  main_scaler.height/1.3 * main_scaler.scale_y / background:getHeight())
love.graphics.draw(board ,(main_scaler.width/3 - 20) * main_scaler.scale_x, start_ys.board , 0 , main_scaler.width/2.5 * main_scaler.scale_x / background:getWidth() ,  (main_scaler.height/1.6 + 60) * main_scaler.scale_y / background:getHeight())
love.graphics.draw(stars_0_1_2_3 ,(main_scaler.width/3 + 30) * main_scaler.scale_x, start_ys.stars , 0 , (main_scaler.width/3 + 130) * main_scaler.scale_x / background:getWidth() ,  (main_scaler.height/3 + 300) * main_scaler.scale_y / background:getHeight())
love.graphics.draw(win_lose ,(main_scaler.width/3 - 55) * main_scaler.scale_x, start_ys.win_lose , 0 , main_scaler.width/2.7 * main_scaler.scale_x / background:getWidth() ,  (main_scaler.height/3 + 50) * main_scaler.scale_y / background:getHeight())
restart_score_menu.draw()
menu_score_menu.draw()
love.graphics.draw(text_img ,(main_scaler.width/3 + 70) * main_scaler.scale_x, start_ys.text_img , 0 , main_scaler.width/4.7 * main_scaler.scale_x / text_img:getWidth() ,  (main_scaler.height/14 + 30) * main_scaler.scale_y / text_img:getHeight())
love.graphics.setColor(0,1,0)
text = love.graphics.newText(font,tostring(math.floor(scoore)))
love.graphics.draw(text,(main_scaler.width/3 + 150) * main_scaler.scale_x, start_ys.text, 0 , main_scaler.width/8 * main_scaler.scale_x / text:getWidth() ,  (main_scaler.height/13) * main_scaler.scale_y / text:getHeight())
love.graphics.setColor(255,255,255,255)
end
--#######################################gui at end of level



--#### create timer ::
timer = newTimer()
timer.setStart()


--##sound for win/lose scoore board:
should_show_menu_scoore = false
should_play_win_lose_sound = true
not_should_play_win_lose_sound = false
win_sound = love.audio.newSource('MUSIC/wining.mp3', 'stream')
lose_sound = love.audio.newSource('MUSIC/losing.mp3', 'stream')
win_sound:setVolume(1.0)
lose_sound:setVolume(1.0)


end



function love.draw()

if level.get_end_of_level() == false then

if level.initial == true and level.loading_and_setting == false then

draw_game_when_not_finished(level)

elseif level.initial == false and level.loading_and_setting == true then

loading.draw(0,0)

end--end of two conditions

else--when game is finished

draw_game_when_finished()

end--if level.get_end_of_level() == false then

end--end of function




function love.update(dt)

level.loading()
level.init()


if level.initial == false and level.loading_and_setting == true then
loading.update(dt)
end


if level.get_end_of_level() == false then

if level.initial == true and level.loading_and_setting == false then
pause_play.onclick()
restart.onclick()
music_on_off.onclick()
menu.onclick()	

if should_mute then
mute_all_sounds()
end	


if game_controller.get_pause() == false then

if level.get_world().get_hero().get_isDead() then
--set end of level to false 
level.set_end_of_level(true)
player_has_won = false
--set bool win in ingame_gui to false
end

if level.get_world().get_hero().respawn == true then
timer.update(dt)
--print(timer.getTime())
end


one_analog_controller.update_thief_button(level)
pause_play.onclick()
restart.onclick()
music_on_off.onclick()
menu.onclick()

level.update_flow(dt,one_analog_controller.analog1.get_x_move(),one_analog_controller.analog1.get_y_move(),level.get_world().get_hero().speed_slowment)

level.get_world().update_beings(--[[1]]dt , --[[2]]level.get_world().get_hero().get_rectangle_for_damaged()
 , --[[3]]level.get_world().get_hero().get_collision_for_except_two_last_hits_and_transforms_attacks(one_analog_controller.analog1.analog_last_move()) 
 , --[[4]]level.get_world().get_hero().get_attacks_except_two_last_hits_and_transforms_attacks() 
 , --[[5]]level.get_world().get_hero().get_collision_for_attacks_two_last_hits_and_spells() 
 , --[[6]]level.get_world().get_hero().get_attacks_two_last_hits_and_spells() 
 , --[[7]]level.get_world().get_hero().get_summoned_get_rectangle_collision_for_attack() 
 , --[[8]]level.get_world().get_hero().get_summoned_is_attacking() )


local bool = (one_analog_controller.attack_button.isholding() == true )--or thief_button.isholding() == true or --released_button.isholding() == true) --or dodge_button.isholding() == true)

level.get_world().update_hero(--[[1]]dt 
	, --[[2]]one_analog_controller.analog1.analog_idle() 
	, --[[3]]one_analog_controller.thief_button.isholding() 
	, --[[4]]one_analog_controller.released_button.isholding() 
	, --[[5]]one_analog_controller.attack_button.isholding() 
	, --[[6]]one_analog_controller.analog1.get_x_move() 
	, --[[7]]one_analog_controller.analog1.get_y_move() 
	, --[[8]]one_analog_controller.dodge_button.isholding() 
	, --[[9]]one_analog_controller.analog1.analog_to_right() 
	, --[[10]]one_analog_controller.analog1.analog_to_left() 
	, --[[11]]one_analog_controller.analog1.analog_last_move()  
	, --[[12]]bool
	, --[[13]]level.get_world().get_all_beings() 
	, --[[14]]level.get_world().get_nearest_being_of_hero_rectangle() 
  , --[[15]]level.transitioning)


if level.name == "training" then
level.update_training_stuff(dt)
end  


end--pause or play
end--if level.initial == true and level.loading_and_setting == false then


else--if game was over (player wins or lose the episode)
--show gui for wining or losing (from ingamegui.getplayer_has_won)
--calculate score
--for plyaing sound before showing win lose board:

if should_mute then
mute_all_sounds()
end	

if player_has_won == true then
win_lose_sound = win_sound
else
win_lose_sound = lose_sound
end 
if not win_lose_sound:isPlaying() and should_play_win_lose_sound == true and not_should_play_win_lose_sound == false then
win_lose_sound:play()
should_show_menu_scoore = true
should_play_win_lose_sound = false
end
if not win_lose_sound:isPlaying() and should_play_win_lose_sound == false and not_should_play_win_lose_sound == false then
not_should_play_win_lose_sound = true
end
--for plyaing win_lose_sound before showing win lose board:
if should_show_menu_scoore and  not win_lose_sound:isPlaying() and should_play_win_lose_sound == false and not_should_play_win_lose_sound == true then
do_the_things_in_the_end()
end


end--if level.get_end_of_level() == false then

end--end of function	



--[[
function love.mousepressed( x, y, button, istouch, presses )
if level.get_end_of_level() == false then
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
pause_play.pressed(id, x , y)
if pause_play.get_img() == play_img then
music_on_off.pressed(id, x , y)
menu.pressed(id, x , y)
restart.pressed(id, x , y)
end
end
end
if game_controller.get_pause() == false then
one_analog_controller.mousepressed_controller(x,y,button,istouch,presses,level)
end
else
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
if start_ys == end_ys then	
restart_score_menu.pressed(id, x , y)
menu_score_menu.pressed(id, x , y)
end
end
end
end
end

function love.mousereleased(x, y, button)
if level.get_end_of_level() == false then
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
pause_play.released(id, x , y)
if pause_play.get_img() == play_img then
music_on_off.released(id, x , y)
menu.released(id, x , y)
restart.released(id, x , y)
end
end
end
if game_controller.get_pause() == false then
one_analog_controller.mousereleased_controller(x,y,button,level)
end
else
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
if start_ys == end_ys then	
restart_score_menu.released(id, x , y)
menu_score_menu.released(id, x , y)
end
end
end
end
end

function love.mousemoved( x, y, dx, dy, istouch )
if level.get_end_of_level() == false then
pause_play.check_range(id, x , y)
if pause_play.get_img() == play_img then
music_on_off.check_range(id, x , y)
menu.check_range(id, x , y)
restart.check_range(id, x , y)
end
if game_controller.get_pause() == false then
one_analog_controller.mousemoved_controller(x,y,dx,dy,istouch,level)
end
else
if start_ys == end_ys then
restart_score_menu.check_range(id, x , y)
menu_score_menu.check_range(id, x , y)
end
end
end
--]]

function love.touchpressed( id, x, y, pressure )
if level.get_end_of_level() == false then
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
pause_play.pressed(id, x , y)
if pause_play.get_img() == play_img then
music_on_off.pressed(id, x , y)
menu.pressed(id, x , y)
restart.pressed(id, x , y)
end
end
end
if game_controller.get_pause() == false then
one_analog_controller.touchpressed_controller(id,x,y,pressure,level)
end
else
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
if start_ys == end_ys then
restart_score_menu.pressed(id, x , y)
menu_score_menu.pressed(id, x , y)
end
end
end
end
end

function love.touchreleased( id, x, y, pressure )
if level.get_end_of_level() == false then
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
pause_play.released(id, x , y)
if pause_play.get_img() == play_img then
music_on_off.released(id, x , y)
menu.released(id, x , y)
restart.released(id, x , y)
end
end
end
if game_controller.get_pause() == false then
one_analog_controller.touchreleased_controller(id,x,y,pressure,level)
end
else
if level.loading_and_setting == false then
if level.get_world().get_hero().respawn == true then
if start_ys == end_ys then	
restart_score_menu.released(id, x , y)
menu_score_menu.released(id, x , y)
end
end
end
end
end

function love.touchmoved( id, x, y, dx, dy, pressure )
if level.get_end_of_level() == false then
if pause_play.get_img() == play_img then
music_on_off.check_range(id, x , y)
menu.check_range(id, x , y)
restart.check_range(id, x , y)
end
if game_controller.get_pause() == false then
one_analog_controller.touchmoved_controller(id,x,y,dx,dy,pressure,level)
end
else
if start_ys == end_ys then
restart_score_menu.check_range(id, x , y)
menu_score_menu.check_range(id, x , y)
end
end
end






--function for better coding
function draw_game_when_not_finished(level)
level.get_background().draw()
level.animation_draw_current_and_next_stage()





level.get_world().draw_hero(one_analog_controller.analog1.analog_to_right() , one_analog_controller.analog1.analog_to_left() , one_analog_controller.analog1.analog_last_move())
level.get_world().draw_beings()
if level.name ~= "training" then
level.get_background().draw_all_tile()
end
--to test coolisions:
--level.draw_test_for_environment_collisions()
--level.get_world().get_hero().draw_collision_environment_test()

if game_controller.get_pause() == false then
one_analog_controller.draw(level)
if level.name == "training" then
level.draw_training_stuff(one_analog_controller,level)
end    
end
pause_play.draw()
if pause_play.get_img() == play_img then
restart.draw()
music_on_off.draw()
menu.draw()
end

end


function draw_game_when_finished()

level.get_background().draw()
level.animation_draw_current_and_next_stage()
level.get_world().draw_hero(one_analog_controller.analog1.analog_to_right() , one_analog_controller.analog1.analog_to_left() , one_analog_controller.analog1.analog_last_move())
level.get_world().draw_beings()
if level.name ~= "training" then
level.get_background().draw_all_tile()
end
--to test coolisions:
--level.draw_test_for_environment_collisions()
--level.get_world().get_hero().draw_collision_environment_test()
if one_time_init_handler_for_end_of_game_gui == false then
draw_score_menu()
end
end

function do_the_things_in_the_end()

if one_time_init_handler_for_end_of_game_gui == true then
one_time_init_handler_for_end_of_game_gui = false

timer.setPause()

level_information={
name = level.name,  
user_health=level.get_world().get_hero().getHealth(),
max_health=level.get_world().get_hero().getMaxHealth(),
time_for_this_episode=level.get_time_for_finish(),
time_user_finished_episode=timer.getTime(),
three_star_scoore_needs=85, --const  ->it can change to make it easier or harder<-
two_star_scoore_needs=50 --const  ->it can change to make it easier or harder<-
}
scoore = get_calculated_score(level_information)
set_stars_and_win_lose(level_information)
game_controller.unlock_next_episode()

else
update_socre_menu()
end

end



function mute_all_sounds()
win_sound:setVolume(0)
lose_sound:setVolume(0)
level.back_music:setVolume(0)
--level.get_world().get_all_beings() = level.get_world().beings
if level.get_world().beings ~= nil and #level.get_world().beings ~= 0 then 
for i = 1 , #level.get_world().beings do
for j = 1 , #level.get_world().beings[i].sounds do
level.get_world().beings[i].sounds[j]:setVolume(0)
end  
end  
end
for i = 1 , #level.get_world().get_hero().sounds do
level.get_world().get_hero().sounds[i]:setVolume(0)
end
end
function unmute_all_sounds()
win_sound:setVolume(1.0)
lose_sound:setVolume(1.0)
level.back_music:setVolume(1.0)
--level.get_world().get_all_beings() = level.get_world().beings
if level.get_world().beings ~= nil and #level.get_world().beings ~= 0 then 
for i = 1 , #level.get_world().beings do
for j = 1 , #level.get_world().beings[i].sounds do
level.get_world().beings[i].sounds[j]:setVolume(1.0)
end  
end  
end  
for i = 1 , #level.get_world().get_hero().sounds do
level.get_world().get_hero().sounds[i]:setVolume(1.0)
end
end
function pause_all_sounds()
win_sound:pause()
lose_sound:pause()
level.back_music:pause()
--level.get_world().get_all_beings() = level.get_world().beings
if level.get_world().beings ~= nil and #level.get_world().beings ~= 0 then 
for i = 1 , #level.get_world().beings do
for j = 1 , #level.get_world().beings[i].sounds do
level.get_world().beings[i].sounds[j]:pause()
end  
end  
end  
for i = 1 , #level.get_world().get_hero().sounds do
level.get_world().get_hero().sounds[i]:pause()
end
end 
function resume_all_sounds()
if win_sound:tell() ~= 0 then  
love.audio.play(win_sound)
end
if lose_sound:tell() ~= 0 then  
love.audio.play(lose_sound)
end
if level.back_music:tell() ~= 0 then
love.audio.play(level.back_music)
end
--level.get_world().get_all_beings() = level.get_world().beings
if level.get_world().beings ~= nil and #level.get_world().beings ~= 0 then 
for i = 1 , #level.get_world().beings do
for j = 1 , #level.get_world().beings[i].sounds do
if level.get_world().beings[i].sounds[j]:tell() ~= 0 then  
love.audio.play(level.get_world().beings[i].sounds[j])
end
end  
end  
end  
for i = 1 , #level.get_world().get_hero().sounds do
if level.get_world().get_hero().sounds[i]:tell() ~= 0 then
love.audio.play(level.get_world().get_hero().sounds[i])
end
end
end   


function save_best_score_for_episode(file_name,scoore,stars,time)
if not love.filesystem.exists(file_name.."_save.txt") then
jupiter = require "jupiter"
newData = {}
newData[1] = scoore
newData[2] = stars
newData[3] = time
data = {_fileName = file_name.."_save.txt", newData[1] , newData[2] , newData[3]}
success = jupiter.save(data)
else
jupiter = require "jupiter"
newData = jupiter.load(file_name.."_save.txt")
if newData[2] < stars or newData[1] < scoore or (newData[1] <= scoore and newData[3] < time) then
newData[1] = scoore
newData[2] = stars
newData[3] = time
success1 = jupiter.save(newData)
end
end
end