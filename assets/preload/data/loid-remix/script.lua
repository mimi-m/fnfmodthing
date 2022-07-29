
local dadX = 500;
local dadY = 490;
local bfX = 790;
local bfY = 575;
local gfX = 660;
local gfY = 515;
local ofs = 35;
--local followchars = true;
local del = 0;
local del2 = 0;


--function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
--    dadX = getCharacterX('dad')
--    dadY = getCharacterY('dad')
--    bfX = getCharacterX('bf')
--    bfY = getCharacterY('bf')
--end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if curBeat >= 167 and curBeat < 199 or curBeat >= 392 and curBeat < 424 and difficultyName == 'Mania' then
            if mustHitSection == false then
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',dadX-ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',dadX+ofs,gfY)
                   end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',dadX,gfY-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                   triggerEvent('Camera Follow Pos',dadX,gfY+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',dadX-ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',dadX+ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',dadX,gfY-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',dadX,gfY+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',dadX,gfY)
                end
                    if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',dadX,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
                    triggerEvent('Camera Follow Pos',dadX,gfY-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'danceRight' then
                    triggerEvent('Camera Follow Pos',dadX,gfY+ofs)
                end
            else
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',bfX-ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',bfX+ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',bfX,gfY-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',bfX,gfY+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',bfX-ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',bfX+ofs,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',bfX,gfY-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',bfX,gfY+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',bfX,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',bfX,gfY)
                end
                if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
                    triggerEvent('Camera Follow Pos',bfX,gfY-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'danceRight' then
                    triggerEvent('Camera Follow Pos',bfX,gfY+ofs)
                end
            end
        else
            if mustHitSection == false then
                if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',dadX-ofs,dadY)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',dadX+ofs,dadY)
                   end
                if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'hey' or getProperty('dad.animation.curAnim.name') == 'hurt' or getProperty('dad.animation.curAnim.name') == 'scared' then
                    triggerEvent('Camera Follow Pos',dadX,dadY-ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                   triggerEvent('Camera Follow Pos',dadX,dadY+ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos',dadX-ofs,dadY)
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',dadX+ofs,dadY)
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',dadX,dadY-ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',dadX,dadY+ofs)
                end
                if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',dadX,dadY)
                end
                    if getProperty('dad.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',dadX,dadY)
                end
            else
                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',bfX-ofs,bfY)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',bfX+ofs,bfY)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',bfX,bfY-ofs)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',bfX,bfY+ofs)
                end
	            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos',bfX,bfY)
                end
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat == 8 then
        characterPlayAnim ('bf', 'hey', false)
        end
end


function onBeatHit()
--    health = getProperty('health')
--    if getProperty('health') > 0.4 then
--        setProperty('health', health- 0.017);
--    end
    if curBeat == 494 or curBeat == 568 then
            if getProperty(getProperty('ratingPercent')) > 0.95 or botPlay == true then
                triggerEvent('Play Animation','cheer','gf')
                triggerEvent('Play Animation','hey','dad')
            else
                if getProperty(getProperty('ratingPercent')) < 0.69 then
                    triggerEvent('Play Animation','cry','gf')
                    triggerEvent('Play Animation','hurt','dad')
                else
                    triggerEvent('Play Animation','scared','dad')
                end
            end
   end
end

local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
