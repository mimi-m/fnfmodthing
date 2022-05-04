function onCreate()
    setProperty("skipCountdown", true)
	setPropertyFromClass('GameOverSubstate', 'characterName', 'nobb-minus-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnb_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'escapism_gameover'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'fnb_confetti'); --put in mods/music/
end

function onCreatePost()
end

--camera movin effect
function onUpdate()
    if curStep == 2 then
        if middlescroll == false then
            triggerEvent("MoveArrow", "0", "-135, -70, 0, 1, 1")
            triggerEvent("MoveArrow", "1", "-135, -70, 0, 1, 1")
            triggerEvent("MoveArrow", "2", "-135, -70, 0, 1, 1")
            triggerEvent("MoveArrow", "3", "-135, -70, 0, 1, 1")
            triggerEvent("MoveArrow", "4", "-310, 0, 0, 1, 1")
            triggerEvent("MoveArrow", "5", "-310, 0, 0, 1, 1")
            triggerEvent("MoveArrow", "6", "-310, 0, 0, 1, 1")
            triggerEvent("MoveArrow", "7", "-310, 0, 0, 1, 1")
        end
    end
end

function onGameOver()
end