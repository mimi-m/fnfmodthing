-- Script created by TKTems

-- SETTINGS FOR SCRIPT
local laneOffset = 0 -- Changes where you want the lane to be positioned. Positive numbers move it to the right and negative numbers move it to the left.
local laneTransparency = 0.3 -- Sets the transparency of the darken under your lane. Higher numbers make the lane darker.
local backDarken = 0.8 -- Sets how dark the whole background is. Higher numbers make the lane darker.
local noteTrans = 0.1 -- Changes how transparent the opponent's notes are. 0 makes the opponent's notes invisible and 1 makes them fully visible.

local showChars = false -- If set to true, then BF, GF, and the Opponent will show up on the screen.

local songList = {''}
-- END OF SETTINGS

function onCreate()
	newGraphic('screenDarken', -1000, -500, 3280, 1720, '000000', backDarken)
	newGraphic('laneUnderlay', 405 + laneOffset, -500, 480, 1720, '000000', laneTransparency)
	newGraphic('laneSide1', 395 + laneOffset, -500, 10, 1720, 'FFFFFF', laneTransparency)
	newGraphic('laneSide2', 875 + laneOffset, -500, 10, 1720, 'FFFFFF', laneTransparency)
	newGraphic('lowHealth', -1000, -500, 3280, 1720, 'c00000', 0)
end

function onCreatePost()
	if not showChars == true then
		setProperty('boyfriend.visible', false)
		setProperty('dad.visible', false)
		setProperty('gf.visible', false)
	end

	setProperty('timeBar.y', -1000)
	setProperty('timeTxt.y', 5)
	setProperty('scoreTxt.y', (screenHeight* 0.86) + 67)

	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',((415 + 115 * (i)) + laneOffset))
		setPropertyFromGroup('strumLineNotes',i,'visible', false)
    end

	for i = 4,7 do
		setPropertyFromGroup('strumLineNotes',i,'x',((415 + 115 * (i-4)) + laneOffset))
    end

	setProperty('healthBar.angle', 90)
	setProperty('healthBar.x', 600 + laneOffset)
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		setProperty('healthBar.y', 300)
	elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		setProperty('healthBar.y', 410)
	end

	triggerEvent('Camera Follow Pos', 685, 250)
end

function onUpdatePost(elapsed)
    for i = 0, getProperty('notes.length') - 1 do
        if getPropertyFromGroup('notes', i, 'mustPress') == false then
            setPropertyFromGroup('notes', i, 'alpha', noteTrans)
		end
    end
	setProperty('iconP1.x', screenWidth * 0.88)
	setProperty('iconP1.y', screenHeight * 0.8)
	setProperty('iconP2.x', screenWidth * 0.01)
	setProperty('iconP2.y', screenHeight * 0.8)
	if getProperty("health") <= 1 then
		setProperty('lowHealth.alpha', -(round((getProperty('health')), 2) - 0.25 ))
	end
end

function newGraphic(tag, x, y, width, height, color, alpha)
	makeLuaSprite(tag, '', x, y)
	makeGraphic(tag, width, height, color)
	setObjectCamera(tag, 'hud')
	setProperty(tag..'.alpha', alpha)
    addLuaSprite(tag)
end

function newText(tag, text, width, x, y, size, alignment)
	makeLuaText(tag, text, width, x, y)
	setTextSize(tag, size)
	setTextAlignment(tag, alignment)
	addLuaText(tag)
end

-- Functions taken from the internet (Credit included)

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end