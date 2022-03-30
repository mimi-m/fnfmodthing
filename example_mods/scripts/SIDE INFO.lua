notehitlol = 0
flooshedhit = 0
hurthit = 0
confusehit = 0
font = "vcr.ttf" -- the font that the text will use.
cmy = 20
tnhx = 5
function onCountdownTick()
    makeLuaText("tnh", 'Total Notes Hit: 0', 250, tnhx, 259);
    makeLuaText("cm", 'Max Combo: 0', 200, getProperty('tnh.x'), getProperty('tnh.y') + cmy);
    makeLuaText("sick", 'Sicks!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 20);
    makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 20);
    makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 20);
    makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 20);
    makeLuaText("miss", 'Misses: 0', 200, getProperty('cm.x'), getProperty('shit.y') + 20);

    setObjectCamera("tnh", 'other');
    setTextSize('tnh', 20);
    addLuaText("tnh");
    setTextColor('tnh', '8070FF');
    setTextAlignment('tnh', 'left')
    setTextFont('tnh', font)

    setObjectCamera("cm", 'other');
    setTextSize('cm', 20);
    addLuaText("cm");
    setTextColor('cm', '8CC7FF');
    setTextFont('cm', font)
    setTextAlignment('cm', 'left')
    setObjectCamera("sick", 'other');
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextColor('sick', '60FFFF');
    setTextFont('sick', font)
    setTextAlignment('sick', 'left')
    setObjectCamera("good", 'other');
    setTextSize('good', 20);
    addLuaText("good");
    setTextColor('good', '60FF70');
    setTextFont('good', font)
    setTextAlignment('good', 'left')
    setObjectCamera("bad", 'other');
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextColor('bad', 'FFFF60');
    setTextFont('bad', font)
    setTextAlignment('bad', 'left')
    setObjectCamera("shit", 'other');
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextColor('shit', 'FFC060');
    setTextFont('shit', font)
    setTextAlignment('shit', 'left')
    setObjectCamera("miss", 'other');
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
            makeLuaText("flooshed", 'Flooshed Notes: 0', 250, getProperty('cm.x'), getProperty('miss.y') + 36);
            setObjectCamera("flooshed", 'other');
            setTextSize('flooshed', 16);
            setTextColor('flooshed', 'FFB1BF');
            addLuaText("flooshed");
            setTextFont('flooshed', font)
            setTextAlignment('flooshed', 'left')
        end
        flooshedhit = flooshedhit + 1;
        setTextString('flooshed', 'Flooshed Notes: ' .. tostring(flooshedhit))
    end

	if noteType == 'Confuse Note' then
        if confusehit == 0 then
            makeLuaText("confuse", 'Confuse Notes: 0', 250, getProperty('cm.x'), getProperty('miss.y') + 52);
            setObjectCamera("confuse", 'other');
            setTextSize('confuse', 16);
            setTextColor('confuse', 'E060FF');
            addLuaText("confuse");
            setTextFont('confuse', font)
            setTextAlignment('confuse', 'left')
        end
        confusehit = confusehit + 1;
        setTextString('confuse', 'Confuse Notes: ' .. tostring(confusehit))
    end
end


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Hurt Note' then
        if hurthit == 0 then
            makeLuaText("hurt", 'Hurt Notes: 0', 250, getProperty('cm.x'), getProperty('miss.y') + 20);
            setObjectCamera("hurt", 'other');
            setTextSize('hurt', 16);
            setTextColor('hurt', 'A52121');
            addLuaText("hurt");
            setTextFont('hurt', font)
            setTextAlignment('hurt', 'left')
        end
        hurthit = hurthit + 1;
        setTextString('hurt', 'Hurt Notes: ' .. tostring(hurthit))
    end
end


function onRecalculateRating()
--  notehitloltosting = tostring(notehitlol)
    setTextString('cm', 'Max Combo: ' .. getProperty('maxCombo'))
    setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
    setTextString('good', 'Goods: ' .. getProperty('goods'))
    setTextString('bad', 'Bads: ' .. getProperty('bads'))
    setTextString('shit', 'Shits: ' .. getProperty('shits'))
    setTextString('miss', 'Misses: ' .. getProperty('songMisses'))
	-- start of "update", some variables weren't updated yet
    -- setTextString('tnh', 'Total Notes Hit: ' + 1)
end