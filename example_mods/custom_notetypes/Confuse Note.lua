function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Confuse Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'ConfuseNote_assets'); --Change texture
            if pixelArrows == false then
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'pixelUI/confuseSplash'); --Change texture
            else
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'confuseSplash'); -- change splash
            end
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 0);
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Plays no animation
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Confuse Note' then
--        if confused == false then
        if lowQuality == false then
            playSound("confused");
        end
--            confused = true;
        MoveArrow("MoveArrow", "4", "335, 0, 0, 1, 1")
        MoveArrow("MoveArrow", "5", "111, 0, 0, 1, 1")
        MoveArrow("MoveArrow", "6", "-111, 0, 0, 1, 1")
        MoveArrow("MoveArrow", "7", "-335, 0, 0, 1, 1")
        if middlescroll == true then
            MoveArrow("MoveArrow", "0", "965, 0, 0, 0.5, 1")
            MoveArrow("MoveArrow", "1", "741, 0, 0, 0.5, 1")
            MoveArrow("MoveArrow", "2", "-741, 0, 0, 0.5, 1")
            MoveArrow("MoveArrow", "3", "-965, 0, 0, 0.5, 1")
        else
	    	MoveArrow("MoveArrow", "0", "335, 0, 0, 1, 1")
            MoveArrow("MoveArrow", "1", "111, 0, 0, 1, 1")
            MoveArrow("MoveArrow", "2", "-111, 0, 0, 1, 1")
            MoveArrow("MoveArrow", "3", "-335, 0, 0, 1, 1")
        end
		runTimer('wait', 3);
--		end
	end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'wait' then
        if lowQuality == false then
            playSound("confusednomore");
        end
		MoveArrow("MoveArrow", "7", "335, 0, 0, 1, 1")
        MoveArrow("MoveArrow", "6", "111, 0, 0, 1, 1")
        MoveArrow("MoveArrow", "5", "-111, 0, 0, 1, 1")
        MoveArrow("MoveArrow", "4", "-335, 0, 0, 1, 1")

        if middlescroll == true then
            MoveArrow("MoveArrow", "3", "965, 0, 0, 0.5, 1")
            MoveArrow("MoveArrow", "2", "741, 0, 0, 0.5, 1")
            MoveArrow("MoveArrow", "1", "-741, 0, 0, 0.5, 1")
            MoveArrow("MoveArrow", "0", "-965, 0, 0, 0.5, 1")
        else
            MoveArrow("MoveArrow", "3", "335, 0, 0, 1, 1")
            MoveArrow("MoveArrow", "2", "111, 0, 0, 1, 1")
            MoveArrow("MoveArrow", "1", "-111, 0, 0, 1, 1")
            MoveArrow("MoveArrow", "0", "-335, 0, 0, 1, 1")
        end
--      confused = false;
    end
end

function mysplit (inputstr, sep)
    if sep == nil then
        sep = "%s";
    end
    local t={};
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end
    return t;
end

-- Event notes hooks
function MoveArrow(name, value1, value2)
    if name == "MoveArrow" then
        local tableee=mysplit(value2,", "); -- Splits value1 into a table
        value1 = tonumber(value1)

        if value1 < 4 then
            notePosX = getPropertyFromGroup('opponentStrums', value1, 'x');
            notePosY = getPropertyFromGroup('opponentStrums', value1, 'y');
        else
            notee = value1 - 4;
            notePosX = getPropertyFromGroup('playerStrums', notee, 'x');
            notePosY = getPropertyFromGroup('playerStrums', notee, 'y');
        end

        if tableee[1] == "return" then
            tableee[1] = 0;
        else
            newnotePosX = notePosX + tableee[1];
        end
        if tableee[2] == "return" then
            tableee[2] = 0;
        else
            newnotePosY = notePosY + tableee[2];
        end

        duration = tableee[5];
        rotation = tableee[3];
        opacity = tableee[4];

        tableee[1] = tonumber(tableee[1]);
        tableee[2] = tonumber(tableee[2]);
        tableee[3] = tonumber(tableee[3]);
        tableee[4] = tonumber(tableee[4]);
        tableee[5] = tonumber(tableee[5]);

        if value1 == 0 then
            noteTweenX("x1",0,newnotePosX,duration,"quartInOut");
            noteTweenY("y1",0,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r1",0,rotation,duration, "quartInOut");
            noteTweenAlpha("o1",0,opacity,duration,"quartInOut");
        elseif value1 == 1 then
            noteTweenX("x2",1,newnotePosX,duration,"quartInOut");
            noteTweenY("y2",1,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r2",1,rotation,duration, "quartInOut");
            noteTweenAlpha("o2",1,opacity,duration,"quartInOut");
        elseif value1 == 2 then
            noteTweenX("x3",2,newnotePosX,duration,"quartInOut");
            noteTweenY("y3",2,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r3",2,rotation,duration, "quartInOut");
            noteTweenAlpha("o3",2,opacity,duration,"quartInOut");
        elseif value1 == 3 then
            noteTweenX("x4",3,newnotePosX,duration,"quartInOut");
            noteTweenY("y4",3,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r4",3,rotation,duration, "quartInOut");
            noteTweenAlpha("o4",3,opacity,duration,"quartInOut");
        elseif value1 == 4 then
            noteTweenX("x5",4,newnotePosX,duration,"quartInOut");
            noteTweenY("y5",4,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r5",4,rotation,duration, "quartInOut");
            noteTweenAlpha("o5",4,opacity,duration,"quartInOut");
        elseif value1 == 5 then
            noteTweenX("x6",5,newnotePosX,duration,"quartInOut");
            noteTweenY("y6",5,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r6",5,rotation,duration, "quartInOut");
            noteTweenAlpha("o6",5,opacity,duration,"quartInOut");
        elseif value1 == 6 then
            noteTweenX("x7",6,newnotePosX,duration,"quartInOut");
            noteTweenY("y7",6,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r7",6,rotation,duration, "quartInOut");
            noteTweenAlpha("o7",6,opacity,duration,"quartInOut");
        elseif value1 == 7 then
            noteTweenX("x8",7,newnotePosX,duration,"quartInOut");
            noteTweenY("y8",7,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r8",7,rotation,duration, "quartInOut");
            noteTweenAlpha("o8",7,opacity,duration,"quartInOut");
        end
    end
end