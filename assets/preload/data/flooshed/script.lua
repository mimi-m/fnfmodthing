function onCreate()
	-- triggered when the lua file is started
	addCharacterToList('bf', 'boyfriend');
	addCharacterToList('bf-pixel', 'boyfriend');
	addCharacterToList('gf', 'girlfriend');
	addCharacterToList('gf-pixel', 'girlfriend');
	addCharacterToList('mimi', 'dad');
	addCharacterToList('mimi-pixel', 'dad');
	makeLuaSprite('pixelbg', 'pixelStage', -600, -175);
end

function onStepHit()
	-- triggered 16 times per section
    if curBeat == 4 then
        characterPlayAnim (1, 'hey', false)
    end
	if lowQuality == false then
		    if curBeat == 256 or curBeat == 448 or curBeat == 672 then
--			if circleArrows == true then
--      	      triggerEvent('noteskinchange', 'pixelUI/Circles_NOTE_assets', 'pixelUI/noteSplashes');
--      	  else
--			    triggerEvent('noteskinchange', 'pixelUI/NOTE_assets', 'pixelUI/noteSplashes');
--      	  end
--			triggerEvent('imageflash', 'StaticLUL', 0.1);
			addLuaSprite('pixelbg', false);
			triggerEvent('Change Character', 0, 'bf-pixel');
			triggerEvent('Change Character', 1, 'mimi-pixel');
			triggerEvent('Change Character', 2, 'gf-pixel');
			setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-pixel-dead'); --Character json file for the death animation
			setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel'); --put in mods/sounds/
			setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
			setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	    end
    	if curBeat == 288 or curBeat == 512 or curBeat == 736 then
--			if circleArrows == true then
--     	      	triggerEvent('noteskinchange', 'Circles_NOTE_assets', 'noteSplashes');
--  	    else
--		    	triggerEvent('noteskinchange', 'NOTE_assets', 'noteSplashes');
--        	end
--			triggerEvent('imageflash', 'StaticLUL', 0.1);
			removeLuaSprite('pixelbg');
    	    makeLuaSprite('pixelbg', 'pixelStage', -600, -175);
			triggerEvent('Change Character', 0, 'bf');
			triggerEvent('Change Character', 1, 'mimi');
			triggerEvent('Change Character', 2, 'gf');
			setPropertyFromClass('GameOverSubstate', 'characterName', 'bf'); --Character json file for the death animation
			setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
			setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
			setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
    	end
	end
end