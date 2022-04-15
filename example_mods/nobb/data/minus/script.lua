--camera movin
local xx = 505;
local yy = 660;
local xx2 = 1100;
local yy2 = 660;
local ofs = 35;
--local followchars = true;
local del = 0;
local del2 = 0;
--start dialogue
local allowCountdown = false

function onCreate()
	-- triggered when the lua file is started
--	addCharacterToList('mugen', 'boyfriend');
--	addCharacterToList('mugen-pixel', 'boyfriend');
--	addCharacterToList('gf', 'girlfriend');
--	addCharacterToList('gf-pixel', 'girlfriend');
--	addCharacterToList('mimi', 'dad');
--	addCharacterToList('mimi-alt-pixel', 'dad');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'nobb-minus-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnb_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'minus_gameover'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'fnb_confetti'); --put in mods/music/
end

--camera movin effect
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end
function opponentNoteHit()
    health = getProperty('health')
        if getProperty('health') > 0.35 then
            setProperty('health', health- 0.0189);
        end
end

function onGameOver()
    if practiceMode == false then
        if getProperty('flixel.FlxG', 'save.data.WeekCompleteled', 'plus') == false then
            runTimer('unlock', 5);
        end
    end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'unlock' then
        if not seenCutscene then
            setProperty('inCutscene', true);
            setPropertyFromClass('flixel.FlxG', 'save.data.WeekCompleted', 'plus')
            startDialogue('losedialogue'); 
            allowEndShit = true;
            return Function_Stop;
           end
    end
end