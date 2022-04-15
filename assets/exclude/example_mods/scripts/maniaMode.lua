-- Script created by TKTems for Shufflebyte's Invitaional
-- Red glow when low health addition by mimi/Slugetta

-- To use, simply put this file in mods/scripts, then add "addLuaScript('maniaMode')" to the script.lua file of the song. 

function onCreate()
    if maniaMode == false then
        close(true);
    end

	makeLuaSprite('screenDarken', '', 0, 0)
	makeGraphic('screenDarken', 1280, 720, '000000')
	setObjectCamera('screenDarken', 'hud')
	setProperty('screenDarken.alpha', 0.5)
    addLuaSprite('screenDarken')

	makeLuaSprite('laneUnder', '', 405, 0)
	makeGraphic('laneUnder', 480, 720, '000000')
	setObjectCamera('laneUnder', 'hud')
	setProperty('laneUnder.alpha', 0.3)
    addLuaSprite('laneUnder')

	makeLuaSprite('laneSide1', '',395, 0)
	makeGraphic('laneSide1', 10, 720, 'FFFFFF')
	setObjectCamera('laneSide1', 'hud')
	setProperty('laneSide1.alpha', 0.3)
    addLuaSprite('laneSide1')

	makeLuaSprite('laneSide2', '',875, 0)
	makeGraphic('laneSide2', 10, 720, 'FFFFFF')
	setObjectCamera('laneSide2', 'hud')
	setProperty('laneSide2.alpha', 0.3)
    addLuaSprite('laneSide2')

	makeLuaSprite('lowHealth', '', 0, 0)
	makeGraphic('lowHealth', 1280, 720, 'c00000')
	setObjectCamera('lowHealth', 'hud')
	setProperty('lowHealth.alpha', 0)
    addLuaSprite('lowHealth')

	makeLuaText('newScore', '0', 1000, 10, 10)
	setTextSize('newScore', 50)
	setTextAlignment('newScore', 'left')
	addLuaText('newScore')

	makeLuaText('newAcc', '100% [N/A]', 1000, 10, getProperty('newScore.y') + 50)
	setTextSize('newAcc', 25)
	setTextAlignment('newAcc', 'left')
	addLuaText('newAcc')

	makeLuaText('newTime', 'Time', 1000, 10, getProperty('newAcc.y') + 30)
	setTextSize('newTime', 25)
	setTextAlignment('newTime', 'left')
	addLuaText('newTime')

	makeLuaText('newHealth', 'Health: 50%', 1000, 10, getProperty('newTime.y') + 30)
	setTextSize('newHealth', 25)
	setTextAlignment('newHealth', 'left')
	if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Disabled' then
		setProperty('newHealth.y', getProperty('newAcc.y') + 30)
	end
	addLuaText('newHealth')

	makeLuaText('judgeCounter', '', 1000, 10, getProperty('newHealth.y') + 50)
	setTextSize('judgeCounter', 25)
	setTextAlignment('judgeCounter', 'left')
	addLuaText('judgeCounter')
end

function onCreatePost()
	followchars = false
	setProperty('boyfriend.visible', false)
	setProperty('dad.visible', false)
	setProperty('gf.visible', false)

	setProperty('timeBar.y', -30)
	setProperty('timeTxt.y', -30)

	setProperty('scoreTxt.alpha', 0)

	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end

	for i = 4,7 do
		setPropertyFromGroup('strumLineNotes',i,'x',(415 + 115 * (i-4)))
		if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
			setPropertyFromGroup('strumLineNotes',i,'y', 10)
		elseif getPropertyFromClass('ClientPrefs', 'downScroll') == true then
			setPropertyFromGroup('strumLineNotes',i,'y', 600)
		end
    end

	setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', 600)
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		setProperty('healthBar.y', 300)
	elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		setProperty('healthBar.y', 410)
	end

	triggerEvent('Camera Follow Pos', (getProperty('boyfriend.x') - getProperty('dad.x')), getProperty('boyfriend.y'))
end

function onRecalculateRating()
	setTextString('newScore', getProperty('songScore'))
end

function onUpdate()
	if getProperty('songHits') == 0 then
		setTextString('newAcc', '100% [N/A]')
	else
		setTextString('newAcc', round((getProperty('ratingPercent') * 100), 2) .. '% [' .. ratingFC .. ']')
	end

	setTextString('newTime', getProperty('timeTxt.text'))
	if getProperty("health") >= 2 then
		setTextString('newHealth', 'Health: 100%')
	else
		setTextString('newHealth', 'Health: ' .. math.floor(getProperty("health") * 50) .. '%')
	end
	setTextString('judgeCounter', 'Max Combo: ' .. getProperty('maxCombo') .. '\nCombo: ' .. getProperty('combo') .. '\n\nSicks: ' .. getProperty('sicks') .. '\nGoods: ' .. getProperty('goods') .. '\nBads: ' .. getProperty('bads') .. '\nShits: ' .. getProperty('shits') .. '\nMisses: ' .. getProperty('songMisses'))
	
	if getProperty("health") <= 1 then
		setProperty('lowHealth.alpha', -(round((getProperty('health')), 2) - 0.5 ))
	end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end