function onBeatHit()
    if curBeat == 235 then
        if middlescroll == true then
            -- middlescroll, right strums only fade
            triggerEvent("MoveArrow", "4", "0, 0, 0, 0, 5.5")
            triggerEvent("MoveArrow", "5", "0, 0, 0, 0, 5.5")
            triggerEvent("MoveArrow", "6", "0, 0, 0, 0, 5.5")
            triggerEvent("MoveArrow", "7", "0, 0, 0, 0, 5.5")
            if downscroll == false then
                -- upscroll and middlescroll, left strums merge
                triggerEvent("MoveArrow", "0", "330, 0, 0, 0.5, 4.5")
                triggerEvent("MoveArrow", "1", "330, 0, 0, 0.5, 4.5")
                triggerEvent("MoveArrow", "2", "-335, 0, 0, 0.5, 4.5")
                triggerEvent("MoveArrow", "3", "-335, 0, 0, 0.5, 4.5")
            else
                -- downscroll and middlescroll, left strums merge and also become upscroll
                triggerEvent("MoveArrow", "0", "330, -710, 0, 0.5, 4.5")
                triggerEvent("MoveArrow", "1", "330, -710, 0, 0.5, 4.5")
                triggerEvent("MoveArrow", "2", "-335, -710, 0, 0.5, 4.5")
                triggerEvent("MoveArrow", "3", "-335, -710, 0, 0.5, 4.5")
            end
        else
            if downscroll == true then
            --  downscroll NOT middlescroll, strums merge and left becomes upscroll
--	    	    triggerEvent("Change Scrolltype", "swap", "320, 0, 0, 0.85, 7")
                triggerEvent("MoveArrow", "0", "320, -710, 0, 0.85, 5")
                triggerEvent("MoveArrow", "1", "320, -710, 0, 0.85, 5")
                triggerEvent("MoveArrow", "2", "320, -710, 0, 0.85, 5")
                triggerEvent("MoveArrow", "3", "320, -710, 0, 0.85, 5")
                triggerEvent("MoveArrow", "4", "-320, 0, 0, 0, 5.5")
                triggerEvent("MoveArrow", "5", "-320, 0, 0, 0, 5.5")
                triggerEvent("MoveArrow", "6", "-320, 0, 0, 0, 5.5")
                triggerEvent("MoveArrow", "7", "-320, 0, 0, 0, 5.5")
            else
            --  upscroll NOT middlescroll, strums merge
                triggerEvent("MoveArrow", "0", "320, 0, 0, 0.85, 7")
                triggerEvent("MoveArrow", "1", "320, 0, 0, 0.85, 7")
                triggerEvent("MoveArrow", "2", "320, 0, 0, 0.85, 7")
                triggerEvent("MoveArrow", "3", "320, 0, 0, 0.85, 7")
                triggerEvent("MoveArrow", "4", "-320, 0, 0, 0, 7")
                triggerEvent("MoveArrow", "5", "-320, 0, 0, 0, 7")
                triggerEvent("MoveArrow", "6", "-320, 0, 0, 0, 7")
                triggerEvent("MoveArrow", "7", "-320, 0, 0, 0, 7")
            end
        end
	end
end

-- switch to upscroll            
function onUpdatePost()
    if curStep == 964 then --964
        if downscroll == true then
			noteTweenDirection('scrollDir0', 0, 270, 1, 'elasticOut')
			noteTweenDirection('scrollDir1', 1, 270, 1, 'elasticOut')
			noteTweenDirection('scrollDir2', 2, 270, 1, 'elasticOut')
			noteTweenDirection('scrollDir3', 3, 270, 1, 'elasticOut')
	    	triggerEvent("MoveArrow", "0", "15, 0, 180, 0.85, 0.1")
            triggerEvent("MoveArrow", "1", "15, 0, 180, 0.85, 0.1")
            triggerEvent("MoveArrow", "2", "15, 0, 180, 0.85, 0.1")
            triggerEvent("MoveArrow", "3", "15, 0, 180, 0.85, 0.1")
        end
    end
end

function opponentNoteHit()
    if curStep >= 975 then
    health = getProperty('health')
        if getProperty('health') < 2 then
            setProperty('health', health+ 0.0199999);
        end
    end
end