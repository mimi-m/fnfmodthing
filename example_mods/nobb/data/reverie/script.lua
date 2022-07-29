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

function onCreatePost()
	setProperty('timeBar.y', -1000)
	setProperty('timeTxt.y', 19)
	setProperty('scoreTxt.y', (screenHeight* 0.86) + 67)
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		setProperty('healthBar.y', 100)
        setProperty('iconP1.y', 30)
        setProperty('iconP2.y', 30)
    end
end

function onUpdatePost()
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
        if curBeat >= 120 and curBeat <= 128 or curBeat >= 400 then
            setProperty('health', health- (0.0189 * (healthGainMult / healthLossMult)));
        else
            if getProperty('health') > 0.35 then
                setProperty('health', health- (0.0189));
            end
        end
end

function onGameOver()
    if curBeat >= 425 then
        return Function_Stop;
    end
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