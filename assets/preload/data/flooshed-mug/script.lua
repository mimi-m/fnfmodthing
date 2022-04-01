--camera movin
local xx = 535;
local yy = 625;
local xx2 = 855;
local yy2 = 625;
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
	makeLuaSprite('pixelbg', 'pixelStage', -600, -175);
    addLuaSprite('pixelbg', false);
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
    else
        botPlay = true
        practice = true
        botplayTxt = 'Freeplay'
    end
	return Function_Continue;
end

--function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
--	if not practice and not seenCutscene then
--		setProperty('inCutscene', true);
--		runTimer('gameoverDialogue', 0.8);
--		allowCountdown = true;
--		return Function_Stop;
--	end
--	return Function_Continue;
--end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'gameoverDialogue' then -- Timer completed, play dialogue
		startDialogue('lostdialogue');
	end
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'first');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
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
    if curBeat >= 32 and curBeat <= 124 then
        triggerEvent('Screen Shake','0.1, 0.001','0.1, 0.0005')
    else
        triggerEvent('Screen Shake','0.1, 0.001','0.1, 0.001')
    end
    if curBeat <= 575 then
        if getProperty('health') > 0.35 then
            setProperty('health', health- 0.019);
        end
    end
    if curBeat >= 608 then
        triggerEvent('Screen Shake','0.1, 0.001','0.1, 0.001')
        if getProperty('health') > 0.15 then
            setProperty('health', health- 0.0195);
        end
    end
    if curBeat >= 624 and curBeat <= 639 or curBeat >= 668 and curBeat <= 672 then
        triggerEvent('Screen Shake','0.1, 0.001','0.1, 0.0015')
        if getProperty('health') > 0.15 then
            setProperty('health', health- 0.0200);
        end
    end
    if curBeat >= 352 and curBeat <= 383 or curBeat >= 448 and curBeat <= 575 or curBeat >= 640 and curBeat <= 655 then
        triggerEvent('Screen Shake','0.1, 0.001','0.1, 0.002')
        if getProperty('health') > 0.05 then
            setProperty('health', health- 0.0205);
        end
    end
    if curBeat >= 656 and curBeat <= 672 then
        triggerEvent('Screen Shake','0.1, 0.001','0.1, 0.003')
        if getProperty('health') > 0.05 then
            setProperty('health', health- 0.0215);
        end
    end
end

--end dialogue
local allowEndShit = false

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('dialogue2', 'flushed'); 
  allowEndShit = true;
  return Function_Stop;
 end
 return Function_Continue;
end