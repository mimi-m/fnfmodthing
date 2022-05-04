--easy script configs
IntroTextSize = 20	--Size of the text for the Now Playing thing.
IntroSubTextSize = 25 --size of the text for the Song Name.
IntroTagColor = 'fefefe'	--Color of the tag at the end of the box.
IntroTagWidth = 20	--Width of the box's tag thingy.
ManiaModeOffset = 0
--easy script configs

--actual script
function onCreate()
	--the tag at the end of the box
        if downscroll == false then
			ManiaModeOffset = 576
		end
		if dadName == 'slugetta' or dadName == 'slugetta-alt' then
			IntroTagColor = '9c4538'
		end if dadName == 'mimi' then
			IntroTagColor = '89b5de'
		end if dadName == 'mimi-alt-pixel' then
			IntroTagColor = '5b9ceb'
		end if dadName == 'mugen' then
			IntroTagColor = 'f0eca0'
		end if dadName == 'genji' then
			IntroTagColor = '24e822'
		end if dadName == 'gf' or dadName == 'gf-og' then
			IntroTagColor = 'a5004d'
		end
	makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15 + ManiaModeOffset)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, getProperty('JukeBoxTag.y'))
	makeGraphic('JukeBox', 300, 100, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -405-IntroTagWidth, getProperty('JukeBoxTag.y')+15)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--the text for the difficulty
	makeLuaText('JukeBoxSubText', difficultyName, 290, -295-IntroTagWidth, getProperty('JukeBoxTag.y')+15)
	setTextAlignment('JukeBoxSubText', 'right')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroTextSize)
	addLuaText('JukeBoxSubText')
	
	--text for the song name
	makeLuaText('JukeBoxDomText', songName, 300, -305-IntroTagWidth, getProperty('JukeBoxText.y')+35)
	setTextAlignment('JukeBoxDomText', 'left')
	setObjectCamera('JukeBoxDomText', 'other')
	setTextSize('JukeBoxDomText', IntroSubTextSize)
	addLuaText('JukeBoxDomText')
--end

--motion functions
--function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFive', 'JukeBoxDomText', 10, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.55, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.55, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxDomText', -450, 1.75, 'CircInOut')
	end
end