function onCreate()
    if sideInfo == false or maniaMode == true then
        close(true);
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
    makeLuaText("health", 'Health: 50%', 400, tnhx, 265);
    makeLuaText("tnh", 'Total Notes Hit: 0', 400, getProperty('health.x'), getProperty('health.y') + cmy);
    makeLuaText("maxcm", 'Max Combo: 0', 400, getProperty('tnh.x'), getProperty('tnh.y') + 20);
    makeLuaText("cm", 'Combo: 0', 400, getProperty('maxcm.x'), getProperty('maxcm.y') + 20);
    makeLuaText("sick", 'Sicks!: 0', 400, getProperty('cm.x'), getProperty('cm.y') + 20);
    makeLuaText("good", 'Goods: 0', 400, getProperty('cm.x'), getProperty('sick.y') + 20);
    makeLuaText("bad", 'Bads: 0', 400, getProperty('cm.x'), getProperty('good.y') + 20);
    makeLuaText("shit", 'Shits: 0', 400, getProperty('cm.x'), getProperty('bad.y') + 20);
    makeLuaText("miss", 'Misses: 0', 400, getProperty('cm.x'), getProperty('shit.y') + 20);

    setObjectCamera("health", 'hud');
    setTextSize('health', 20);
    addLuaText("health");
    setTextColor('health', 'FEFEFE');
    setTextAlignment('health', 'left')
    setTextFont('health', font)

    setObjectCamera("tnh", 'hud');
    setTextSize('tnh', 20);
    addLuaText("tnh");
    setTextColor('tnh', 'E060FF');
    setTextAlignment('tnh', 'left')
    setTextFont('tnh', font)

    setObjectCamera("maxcm", 'hud');
    setTextSize('maxcm', 20);
    addLuaText("maxcm");
    setTextColor('maxcm', '8070FF');
    setTextFont('maxcm', font)
    setTextAlignment('maxcm', 'left')
    setObjectCamera("cm", 'hud');
    setTextSize('cm', 20);
    addLuaText("cm");
    setTextColor('cm', '8CC7FF');
    setTextFont('cm', font)
    setTextAlignment('cm', 'left')
    setObjectCamera("sick", 'hud');
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextColor('sick', '60FFFF');
    setTextFont('sick', font)
    setTextAlignment('sick', 'left')
    setObjectCamera("good", 'hud');
    setTextSize('good', 20);
    addLuaText("good");
    setTextColor('good', '60FF70');
    setTextFont('good', font)
    setTextAlignment('good', 'left')
    setObjectCamera("bad", 'hud');
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextColor('bad', 'FFFF60');
    setTextFont('bad', font)
    setTextAlignment('bad', 'left')
    setObjectCamera("shit", 'hud');
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextColor('shit', 'FFC060');
    setTextFont('shit', font)
    setTextAlignment('shit', 'left')
    setObjectCamera("miss", 'hud');
    setTextSize('miss', 20);
    setTextColor('miss', 'FF6060');
    addLuaText("miss");
    setTextFont('miss', font)
    setTextAlignment('miss', 'left')
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

	if noteType == 'Flooshed Note' then
        if flooshedhit == 0 then
            makeLuaText("flooshed", 'Flooshed Notes: 0', 400, getProperty('cm.x'), getProperty('miss.y') + 36);
            setObjectCamera("flooshed", 'hud');
            setTextSize('flooshed', 16);
            setTextColor('flooshed', 'FFB1BF');
            addLuaText("flooshed");
            setTextFont('flooshed', font)
            setTextAlignment('flooshed', 'left')
        end
        if not isSustainNote then    
            flooshedhit = flooshedhit + 1;
            setTextString('flooshed', 'Flooshed Notes: ' .. tostring(flooshedhit))
        end
    end

	if noteType == 'Confuse Note' then
        if confusehit == 0 then
            makeLuaText("confuse", 'Confuse Notes: 0', 400, getProperty('cm.x'), getProperty('miss.y') + 52);
            setObjectCamera("confuse", 'hud');
            setTextSize('confuse', 16);
            setTextColor('confuse', 'AF2D43');
            addLuaText("confuse");
            setTextFont('confuse', font)
            setTextAlignment('confuse', 'left')
        end
        if not isSustainNote then    
            confusehit = confusehit + 1;
            setTextString('confuse', 'Confuse Notes: ' .. tostring(confusehit))
        end
    end
end


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Hurt Note' or noteType == 'Hurt Note (Miss Anim)' then
        if hurthit == 0 then
            makeLuaText("hurt", 'Hurt Notes: 0', 400, getProperty('cm.x'), getProperty('miss.y') + 20);
            setObjectCamera("hurt", 'hud');
            setTextSize('hurt', 16);
            setTextColor('hurt', 'A52121');
            addLuaText("hurt");
            setTextFont('hurt', font)
            setTextAlignment('hurt', 'left')
        end
        if not isSustainNote then    
            hurthit = hurthit + 1;
            setTextString('hurt', 'Hurt Notes: ' .. tostring(hurthit))
        end
    end
	if noteType == 'Lava Note' then
        if hurthit == 0 then
            makeLuaText("lava", 'Lava Notes: 0', 400, getProperty('cm.x'), getProperty('miss.y') + 20);
            setObjectCamera("lava", 'hud');
            setTextSize('lava', 16);
            setTextColor('lava', '909090');
            addLuaText("lava");
            setTextFont('lava', font)
            setTextAlignment('lava', 'left')
        end
        if not isSustainNote then    
            hurthit = hurthit + 1;
            setTextString('lava', 'Lava Notes: ' .. tostring(hurthit))
        end
    end
	if noteType == 'Step Note' then
        if flooshedhit == 0 then
            makeLuaText("step", 'Gravity: 0', 400, getProperty('cm.x'), getProperty('miss.y') + 36);
            setObjectCamera("step", 'hud');
            setTextSize('step', 16);
            setTextColor('step', '606060');
            addLuaText("step");
            setTextFont('step', font)
            setTextAlignment('step', 'left')
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