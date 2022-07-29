function onCreate()
    setProperty("skipCountdown", true)
	setPropertyFromClass('GameOverSubstate', 'characterName', 'nobb-minus-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnb_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'escapism_gameover'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'fnb_confetti'); --put in mods/music/
end

-- Code by: @cyn#5661 on Psych Engine's Official Discord Server
-- Make sure to read carefully in order to reach the result you want

function onCreatePost()
    -- replace "SKINPATH" with the location to your noteskin, replace "YOURSKIN" with your noteskin file name
    -- leave "SKINPATH" as nothing ("") in case your skin is inside mods/images
	local texture = '' .. 'ogNOTE_assets'

    -- make sure to replace "if not" with a "if" instead in case the skin needs to be applied to the player
    -- also make sure to replace "opponentStrums" with "playerStrums"

	for i = 0, 3 do setPropertyFromGroup('opponentStrums', i, 'texture', texture) end
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', texture)
        end
    end
end