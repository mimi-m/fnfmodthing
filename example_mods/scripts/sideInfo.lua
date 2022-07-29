-- borrowed some code in maniaModev2
local sideinfoAlign = 'left' -- Changes whether you want your info (score, accuracy, etc.) on the left side or the right side. Use 'left' or 'right' and KEEP the quotation marks.
local infoHidden = false -- Press TAB to either show or hide the side info
local hideoffset = 500 -- If sideinfoAlign is left, should be positive value.

function onCreate()
    if sideInfo == false or maniaMode == true then
        close(true);
    else
        if sideinfoAlign == 'right' then
            hideoffset = -500
        end
        makeLuaText("health", 'Health: 50%', screenWidth - 20, tnhx, 265);
        makeLuaText("tnh", 'Total Notes Hit: 0', screenWidth - 20, getProperty('health.x'), getProperty('health.y') + cmy);
        if botPlay == false or getPropertyFromClass('PlayState', 'chartingMode') then
        makeLuaText("maxcm", 'Max Combo: 0', screenWidth - 20, getProperty('tnh.x'), getProperty('tnh.y') + 20);
        makeLuaText("cm", 'Combo: 0', screenWidth - 20, getProperty('maxcm.x'), getProperty('maxcm.y') + 20);
        makeLuaText("sick", 'Sicks!: 0', screenWidth - 20, getProperty('cm.x'), getProperty('cm.y') + 20);
        makeLuaText("good", 'Goods: 0', screenWidth - 20, getProperty('cm.x'), getProperty('sick.y') + 20);
        makeLuaText("bad", 'Bads: 0', screenWidth - 20, getProperty('cm.x'), getProperty('good.y') + 20);
        makeLuaText("shit", 'Shits: 0', screenWidth - 20, getProperty('cm.x'), getProperty('bad.y') + 20);
        makeLuaText("miss", 'Misses: 0', screenWidth - 20, getProperty('cm.x'), getProperty('shit.y') + 20);

        setObjectCamera("maxcm", 'hud');
        setTextSize('maxcm', 20);
        addLuaText("maxcm");
        setTextColor('maxcm', '8070FF');
        setTextFont('maxcm', font)
        setTextAlignment('maxcm', sideinfoAlign)
        setObjectCamera("cm", 'hud');
        setTextSize('cm', 20);
        addLuaText("cm");
        setTextColor('cm', '8CC7FF');
        setTextFont('cm', font)
        setTextAlignment('cm', sideinfoAlign)
        setObjectCamera("sick", 'hud');
        setTextSize('sick', 20);
        addLuaText("sick");
        setTextColor('sick', '60FFFF');
        setTextFont('sick', font)
        setTextAlignment('sick', sideinfoAlign)
        setObjectCamera("good", 'hud');
        setTextSize('good', 20);
        addLuaText("good");
        setTextColor('good', '60FF70');
        setTextFont('good', font)
        setTextAlignment('good', sideinfoAlign)
        setObjectCamera("bad", 'hud');
        setTextSize('bad', 20);
        addLuaText("bad");
        setTextColor('bad', 'FFFF60');
        setTextFont('bad', font)
        setTextAlignment('bad', sideinfoAlign)
        setObjectCamera("shit", 'hud');
        setTextSize('shit', 20);
        addLuaText("shit");
        setTextColor('shit', 'FFC060');
        setTextFont('shit', font)
        setTextAlignment('shit', sideinfoAlign)
        setObjectCamera("miss", 'hud');
        setTextSize('miss', 20);
        setTextColor('miss', 'FF6060');
        addLuaText("miss");
        setTextFont('miss', font)
        setTextAlignment('miss', sideinfoAlign)

        end
    
        setObjectCamera("health", 'hud');
        setTextSize('health', 20);
        addLuaText("health");
        setTextColor('health', 'FEFEFE');
        setTextAlignment('health', sideinfoAlign)
        setTextFont('health', font)
    
        setObjectCamera("tnh", 'hud');
        setTextSize('tnh', 20);
        addLuaText("tnh");
        setTextColor('tnh', 'E060FF');
        setTextAlignment('tnh', sideinfoAlign)
        setTextFont('tnh', font)
    end
end

notehitlol = 0
flooshedhit = 0
hurthit = 0
confusehit = 0
font = "vcr.ttf" -- the font that the text will use.
cmy = 20
tnhx = 5

function onCountdownTick()
end


function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if not isSustainNote then    
         notehitlol = notehitlol + 1;
         setTextString('tnh', 'Total Notes Hit: ' .. tostring(notehitlol))
    end -- NOTE I DID NOT MAKE THIS FRANTASTIC24 MADE THIS!

	if noteType == 'Flooshed Note' or noteType == 'Healing Note' then
        if flooshedhit == 0 then
            makeLuaText("flooshed", 'Flooshed Notes: 0', screenWidth - 20, getProperty('cm.x'), getProperty('miss.y') + 36);
            setObjectCamera("flooshed", 'hud');
            setTextSize('flooshed', 16);
            setTextColor('flooshed', 'FFB1BF');
            addLuaText("flooshed");
            setTextFont('flooshed', font)
            setTextAlignment('flooshed', sideinfoAlign)
        end
        if not isSustainNote then    
            flooshedhit = flooshedhit + 1;
            setTextString('flooshed', 'Flooshed Notes: ' .. tostring(flooshedhit))
        end
    end
end


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Hurt Note' or noteType == 'Hurt Note (Miss Anim)' then
        if hurthit == 0 then
            makeLuaText("hurt", 'Hurt Notes: 0', screenWidth - 20, getProperty('cm.x'), getProperty('miss.y') + 20);
            setObjectCamera("hurt", 'hud');
            setTextSize('hurt', 16);
            setTextColor('hurt', 'A52121');
            addLuaText("hurt");
            setTextFont('hurt', font)
            setTextAlignment('hurt', sideinfoAlign)
        end
        if not isSustainNote then    
            hurthit = hurthit + 1;
            setTextString('hurt', 'Hurt Notes: ' .. tostring(hurthit))
        end
    end

	if noteType == 'Confuse Note' then
        if confusehit == 0 then
            makeLuaText("confuse", 'Confuse Notes: 0', screenWidth - 20, getProperty('cm.x'), getProperty('miss.y') + 52);
            setObjectCamera("confuse", 'hud');
            setTextSize('confuse', 16);
            setTextColor('confuse', 'AF2D43');
            addLuaText("confuse");
            setTextFont('confuse', font)
            setTextAlignment('confuse', sideinfoAlign)
        end
        if not isSustainNote then    
            confusehit = confusehit + 1;
            setTextString('confuse', 'Confuse Notes: ' .. tostring(confusehit))
        end
    end
    
	if noteType == 'Lava Note' then
        if hurthit == 0 then
            makeLuaText("lava", 'Lava Notes: 0', screenWidth - 20, getProperty('cm.x'), getProperty('miss.y') + 20);
            setObjectCamera("lava", 'hud');
            setTextSize('lava', 16);
            setTextColor('lava', '909090');
            addLuaText("lava");
            setTextFont('lava', font)
            setTextAlignment('lava', sideinfoAlign)
        end
        if not isSustainNote then    
            hurthit = hurthit + 1;
            setTextString('lava', 'Lava Notes: ' .. tostring(hurthit))
        end
    end
	if noteType == 'Step Note' then
        if flooshedhit == 0 then
            makeLuaText("step", 'Gravity: 0', screenWidth - 20, getProperty('cm.x'), getProperty('miss.y') + 36);
            setObjectCamera("step", 'hud');
            setTextSize('step', 16);
            setTextColor('step', '606060');
            addLuaText("step");
            setTextFont('step', font)
            setTextAlignment('step', sideinfoAlign)
        end
        if not isSustainNote then    
            flooshedhit = flooshedhit + 1;
            setTextString('step', 'Gravity: ' .. tostring(flooshedhit))
        end
    end
end


function onUpdate()
--  notehitloltosting = tostring(notehitlol)
	if getProperty("health") >= 2 then
		setTextString('health', 'Health: 100%')
	else
        setTextString('health', 'Health: ' .. math.floor(getProperty("health") * 50) .. '%')
	end
end

function onRecalculateRating()
    setTextString('maxcm', 'Max Combo: ' .. getProperty('maxCombo'))
    setTextString('cm', 'Combo: ' .. getProperty('combo'))
    setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
    setTextString('good', 'Goods: ' .. getProperty('goods'))
    setTextString('bad', 'Bads: ' .. getProperty('bads'))
    setTextString('shit', 'Shits: ' .. getProperty('shits'))
    setTextString('miss', 'Misses: ' .. getProperty('songMisses'))
	-- start of "update", some variables weren't updated yet
    -- setTextString('tnh', 'Total Notes Hit: ' + 1)
end

function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
        if infoHidden == false then
			runTimer('hideInfo', 0.1);
        end
        if infoHidden == true then
			runTimer('showInfo', 0.1);
        end
    end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'showInfo' then
        infoHidden = false
        doTweenX('ShowInfo1', 'health', getProperty('health.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo2', 'tnh', getProperty('tnh.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo3', 'maxcm', getProperty('maxcm.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo4', 'cm', getProperty('cm.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo5', 'sick', getProperty('sick.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo6', 'good', getProperty('good.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo7', 'bad', getProperty('bad.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo8', 'shit', getProperty('shit.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfo9', 'miss', getProperty('miss.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfoA', 'flooshed', getProperty('flooshed.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfoB', 'hurt', getProperty('hurt.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfoC', 'confuse', getProperty('confuse.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfoD', 'lava', getProperty('lava.x') + hideoffset, 0.1, 'CircInOut')
        doTweenX('ShowInfoE', 'step', getProperty('step.x') + hideoffset, 0.1, 'CircInOut')
    end
    if tag == 'hideInfo' then
        infoHidden = true
        doTweenX('HideInfo1', 'health', getProperty('health.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo2', 'tnh', getProperty('tnh.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo3', 'maxcm', getProperty('maxcm.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo4', 'cm', getProperty('cm.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo5', 'sick', getProperty('sick.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo6', 'good', getProperty('good.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo7', 'bad', getProperty('bad.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo8', 'shit', getProperty('shit.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfo9', 'miss', getProperty('miss.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfoA', 'flooshed', getProperty('flooshed.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfoB', 'hurt', getProperty('hurt.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfoC', 'confuse', getProperty('confuse.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfoD', 'lava', getProperty('lava.x') - hideoffset, 0.1, 'CircInOut')
        doTweenX('HideInfoE', 'step', getProperty('step.x') - hideoffset, 0.1, 'CircInOut')
    end
end