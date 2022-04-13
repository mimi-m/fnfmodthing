-- Original Code by Sir Top Hat
-- Highly Modified by Kevin Kuntz
function onCreatePost()
	len = getProperty('eventNotes.length')-1;
	lem = getProperty('unspawnNotes.length')-1;
	for i = 0, len do
		for k = 0, lem do
			mustPress = getPropertyFromGroup('unspawnNotes', k, 'mustPress')
			noteType = getPropertyFromGroup('unspawnNotes', k, 'noteType')
			est = getPropertyFromGroup('eventNotes', i, 'strumTime')
			nst = getPropertyFromGroup('unspawnNotes', k, 'strumTime')
			event = getPropertyFromGroup('eventNotes', i, 'event')
			v1 = getPropertyFromGroup('eventNotes', i, 'value1')
			if event == 'PlayAsDad' then
				setPropertyFromGroup('eventNotes', i, 'strumTime', getPropertyFromGroup('eventNotes', i, 'strumTime') - stepCrochet / 1000 * 1)
				if est <= 0 then
					makeLuaText('OpponentU', 'You\'re the Opponent!', 300, screenWidth - 784, (not downscroll and getProperty('botplayTxt.y') + 55 or getProperty('botplayTxt.y') - 78))
					setTextSize('OpponentU', 32)
					addLuaText('OpponentU')
				end
				if est <= nst then
					if v1 == 'true' or v1 == 'True' then
						setPropertyFromGroup('unspawnNotes', k, 'noAnimation', true)
						if not mustPress then
							setPropertyFromGroup('unspawnNotes', k, 'mustPress', true)
							if noteType ~= 'Shifter' then
								setPropertyFromGroup('unspawnNotes', k, 'offsetX', getPropertyFromGroup('unspawnNotes', k, 'offsetX') - 640)
							end
						else
							setPropertyFromGroup('unspawnNotes', k, 'mustPress', false) --Change Side
						end
					elseif v1 == 'false' then
						if noteType ~= 'No Animation' then
							setPropertyFromGroup('unspawnNotes', k, 'noAnimation', false)
						end
						if mustPress then
							setPropertyFromGroup('unspawnNotes', k, 'mustPress', false)
						else
							setPropertyFromGroup('unspawnNotes', k, 'mustPress', true) --Change Side
							if noteType ~= 'Shifter' then
								setPropertyFromGroup('unspawnNotes', k, 'offsetX', getPropertyFromGroup('unspawnNotes', k, 'offsetX') - 640)
							end
						end
					end
				end
			end
		end
	end
end

local PlayerIsDad = 0
function onEvent(name, value1, value2)
	if name == 'PlayAsDad' then
		ogDC = getProperty('dad.color')
		if value1 == 'true' or value1 == 'True' then
			makeLuaText('OpponentU', 'You\'re the Opponent!', 300, screenWidth - 784, (not downscroll and getProperty('botplayTxt.y') + 55 or getProperty('botplayTxt.y') - 78))
			setTextSize('OpponentU', 32)
			addLuaText('OpponentU')
			removeLuaText('oppuTimer')
			runTimer('Ddelete', crochet / 1000, 4)
			cancelTimer('Dping')
			setProperty('boyfriend.hasMissAnimations', false)
			PlayerIsDad = 1
			
			for k = 0, 3 do
				setPropertyFromGroup('playerStrums', k, 'x', _G['defaultOpponentStrumX'..k])
				setPropertyFromGroup('opponentStrums', k, 'x', _G['defaultPlayerStrumX'..k])
				setPropertyFromGroup('opponentStrums', k, 'animation.curAnim.name', 'static')
				setPropertyFromGroup('opponentStrums', k, 'resetAnim', 0.0001)
			end
			
			
			for i = 0, getProperty('unspawnNotes.length')-1 do
				noteType = getPropertyFromGroup('unspawnNotes', i, 'noteType')
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and noteType ~= 'Shifter' then
					setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') + 640)
				end
			end
			
			for j = 0, getProperty('notes.length')-1 do
				noteType = getPropertyFromGroup('notes', j, 'noteType')
				if getPropertyFromGroup('notes', j, 'mustPress') and noteType ~= 'Shifter' then
					setPropertyFromGroup('notes', j, 'offsetX', getPropertyFromGroup('notes', j, 'offsetX') + 640)
				end
			end
		elseif value1 == 'false' or value1 == 'False' then
			makeLuaText('playu', 'You\'re the Player!', 300, screenWidth - 784, (not downscroll and getProperty('botplayTxt.y') + 55 or getProperty('botplayTxt.y') - 78))
			setTextSize('playu', 32)
			addLuaText('playu')
			removeLuaText('playTimer')
			runTimer('Pdelete', crochet / 1000, 4)
			cancelTimer('Pping')
			setProperty('boyfriend.hasMissAnimations', true)
			setProperty('health', 1)
			PlayerIsDad = 0

			
			for k = 0, 3 do
				setPropertyFromGroup('playerStrums', k, 'x', _G['defaultPlayerStrumX'..k])
				setPropertyFromGroup('opponentStrums', k, 'x', _G['defaultOpponentStrumX'..k])
				setPropertyFromGroup('playerStrums', k, 'animation.curAnim.name', 'static')
				setPropertyFromGroup('playerStrums', k, 'resetAnim', 0.0001)
			end
			
			for i = 0, getProperty('unspawnNotes.length')-1 do
				noteType = getPropertyFromGroup('unspawnNotes', i, 'noteType')
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') and noteType ~= 'Shifter' then
					setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') + 640)
				end
			end
			
			for j = 0, getProperty('notes.length')-1 do
				noteType = getPropertyFromGroup('notes', j, 'noteType')
				if not getPropertyFromGroup('notes', j, 'mustPress') and noteType ~= 'Shifter' then
					setPropertyFromGroup('notes', j, 'offsetX', getPropertyFromGroup('notes', j, 'offsetX') + 640)
				end
			end
		end
	end
end

function onSongStart()
	removeLuaText('OpponentU')
end

local hold = -1.0
local DadSingAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'} --sorry had to copy since it is 100% cleaner than what sir top hat used to have done
local DadSingDir = 1
function goodNoteHit(id, direction, noteType, isSustainNote)
	if PlayerIsDad == 1 then
		hold = 0;
		DadSingDir = direction
		setProperty('camZooming', true) -- just a lil something
		if noteType ~= 'No Animation' then 
			if not getPropertyFromGroup('notes', id, 'gfNote') and not (altAnim or noteType == 'Alt Animation') then
				characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
				setProperty('dad.holdTimer', 0)
				setProperty('dad.color', ogDC)
			end
			if altAnim or noteType == 'Alt Animation' then
				characterPlayAnim('dad', DadSingAnims[DadSingDir+1]..'-alt', true)
				setProperty('dad.holdTimer', 0)
				setProperty('dad.color', ogDC)
			end
			
			if noteType == 'Hey!' then
				characterPlayAnim('dad', 'hey', true)
				setProperty('dad.specialAnim', true)
				setProperty('dad.heyTimer', 0.6)
				setProperty('dad.color', ogDC)
			end
				
			if getPropertyFromGroup('notes', id, 'gfNote') then
				characterPlayAnim('gf', DadSingAnims[DadSingDir+1], true)
				setProperty('gf.holdTimer', 0)
			end
		end
		setProperty('health', getProperty('health')- 0.05)
		if getProperty('health') <= 0 then
			setProperty('health', 0)
		end
	end
end

local MissColor = '5f1ea4' --color the dad shifts to when missing a note
function noteMiss(id, direction, noteType, isSustainNote)
	if PlayerIsDad == 1 then
		DadSingDir = direction
		setProperty('health', getProperty('health')+0.10)
		if getProperty('dad.hasMissAnimations') then
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1]..'miss', true)
			setProperty('dad.specialAnim', true)
		else
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
			setProperty('dad.color', getColorFromHex(MissColor))
			setProperty('dad.specialAnim', true)
		end
	end
end

function noteMissPress(direction)
	if PlayerIsDad == 1 then
		DadSingDir = direction
		setProperty('health', getProperty('health')+0.10)
		if getProperty('dad.hasMissAnimations') then
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1]..'miss', true)
			setProperty('dad.specialAnim', true)
		else
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
			setProperty('dad.color', getColorFromHex(MissColor))
			setProperty('dad.specialAnim', true)
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --makes player sing when dad hits a note
	if PlayerIsDad == 1 then
		characterPlayAnim('boyfriend', DadSingAnims[direction+1], true)
		setProperty('boyfriend.holdTimer', 0)
		if getProperty('health') >= 0 then
			setProperty('health', getProperty('health') + 0.015);
		end
	end
end

local singKeys = {'left', 'down', 'up', 'right'}
local Pdead = false
function onUpdate(elapsed)
	if PlayerIsDad == 1 then
		holdCap = stepCrochet * 0.001 * getProperty('dad.singDuration')
		if hold >= 0 then
			hold = hold + elapsed
		end
		if hold >= holdCap then
			if keyPressed(singKeys[DadSingDir+1]) then
				if getProperty('dad.animation.curAnim.name') == DadSingAnims[DadSingDir+1]..'-loop' or getProperty('dad.animation.curAnim.name') == DadSingAnims[DadSingDir+1]..'-alt-loop' then
					characterPlayAnim('dad', getProperty('dad.animation.curAnim.name')..'-loop', true)
					setProperty('dad.specialAnim', true)
				else
					setProperty('dad.animation.curAnim', nil)
				end
			else
				hold = -1
				characterDance('dad')
				setProperty('dad.color', ogDC)
			end
		end
		if getProperty('dad.color') ~= ogDC and getProperty('dad.animation.curAnim.name') ~= DadSingAnims[DadSingDir+1] then
			setProperty('dad.color', ogDC)
		end
		if getProperty('health') >= 2 then
			Pdead = true
			setProperty('health', -2)
		end
	end
end

local DCountdown = 0
local PCountdown = 0
function onStepHit()
	len = getProperty('eventNotes.length')-1;
	for i = 0, len do
		event = getPropertyFromGroup('eventNotes', i, 'event')
		strumTime = getPropertyFromGroup('eventNotes', i, 'strumTime')
		value1 = getPropertyFromGroup('eventNotes', i, 'value1') 
		if value2 == '' or value2 == nil then value2 = 3 else value2 = getPropertyFromGroup('eventNotes', i, 'value2') end
		if event == 'PlayAsDad' then
			--if value1 == 'true' then tick = (strumTime / value2 * (value2 - 2)) * (curStep / 2) else tick = strumTime / value2 - (curStep / 2) end
			--if value1 == 'true' then tick = (strumTime / value2) else tick = strumTime / value2 - 2 end
			tick = (strumTime / value2 * (value2 - 2)) * (curStep / 2)
			if strumTime - getSongPosition() <= tick then
				if (value1 == 'true' or value1 == 'True') and getProperty('oppuTimer.active') ~= true and PlayerIsDad == 0 then
					if curStep % 1 == 0 then -- hotfix for desync
						runTimer('Dping', crochet / 1000, value2)
						DCountdown = value2
					else
						runTimer('Dping', crochet / 1000, value2 + 1)
						debugPrint(curStep)
						DCountdown = value2 + 1
					end
					playSound('Metronome_Tick', 0.6)
					makeLuaText('oppuTimer', 'You will be the Opponent In '..DCountdown, 300, defaultPlayerStrumX0 * 1.1, (not downscroll and getProperty('botplayTxt.y') + 55 or getProperty('botplayTxt.y') - 78) * 2.2)
					setTextSize('oppuTimer', 32)			
					addLuaText('oppuTimer')
				elseif (value1 == 'false' or value1 == 'False') and getProperty('playTimer.active') ~= true and PlayerIsDad == 1 then
					if curStep % 2 == 0 then
						runTimer('Pping', crochet / 1000, value2)
						PCountdown = value2
					else
						runTimer('Pping', crochet / 1000, value2 + 1)
						PCountdown = value2 + 1
					end
					playSound('Metronome_Tick', 0.6)
					makeLuaText('playTimer', 'You will be the Player In '..PCountdown, 300, defaultOpponentStrumX0 * 2, (not downscroll and getProperty('botplayTxt.y') + 55 or getProperty('botplayTxt.y') - 78) * 2.2)
					setTextSize('playTimer', 32)
					addLuaText('playTimer')
				end
			end
			setTextString('oppuTimer', 'You will be the Opponent In '..DCountdown)
			setTextString('playTimer', 'You will be the Player In '..PCountdown)
		end
	end
end

function onTimerCompleted(t, l, ll)
	if t == 'Dping' then
		DCountdown = ll
		if ll > 0 then
			playSound('Metronome_Tick', 0.6)
		end
		if ll == 0 then
			removeLuaText('oppuTimer')
		end
	elseif t == 'Pping' then
		PCountdown = ll
		if ll > 0 then
			playSound('Metronome_Tick', 0.6)
		end
		if ll == 0 then
			removeLuaText('playTimer')
		end
	elseif t == 'Ddelete' and ll == 0 then
		removeLuaText('OpponentU')
	elseif t == 'Pdelete' and ll == 0 then
		removeLuaText('playu')
	end
end



function onGameOver()
	if not Pdead and PlayerIsDad == 1 then
		return Function_Stop;
	end
	return Function_Continue;
end