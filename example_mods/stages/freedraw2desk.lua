function onCreate()
	-- background shit
	makeLuaSprite('stage', 'epiphany/bgchair', -950, -400);
	setScrollFactor('stage', 0.9, 0.9);
	scaleObject('stage', 1, 1);
	
	makeLuaSprite('stagefront', 'epiphany/desk', -950, -200);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1, 1);

	makeLuaSprite('milk', 'epiphany/chirumiru', -750, 750);
	setScrollFactor('milk', 0.9, 0.9);
	scaleObject('milk', 0.4, 0.4);

	-- sprites that only load if Low Quality is turned off
--	if not lowQuality then
--		makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
--		setScrollFactor('stagelight_left', 0.9, 0.9);
--		scaleObject('stagelight_left', 1.1, 1.1);
		
--		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
--		setScrollFactor('stagelight_right', 0.9, 0.9);
--		scaleObject('stagelight_right', 1.1, 1.1);
--		setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

--		makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
--		setScrollFactor('stagecurtains', 1.3, 1.3);
--		scaleObject('stagecurtains', 0.9, 0.9);
--	end

	addLuaSprite('stage', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('milk', false);
--	addLuaSprite('stagelight_right', false);
--	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end