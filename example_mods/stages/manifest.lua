local miniDance = true
local danceSpeed = 1
local bgboomspeed = 1

function onCreate()

	makeAnimatedLuaSprite('bg','manifest/bg',-427,-175)
	if flashing then
		addAnimationByIndices('bg','bg','bg','9,9,9,9,9,4,5,6,7',24)
	else
		addAnimationByPrefix('bg','bg','bg',24,false)
	end
		objectPlayAnimation('bg','bg',true)
		addLuaSprite('bg',false)
		setScrollFactor('bg',0,0.5)
	if not lowQuality then
		for i=1,6 do
			makeAnimatedLuaSprite('minisky'..i,'manifest/minisky',-485+(313*i),145)
			addAnimationByIndices('minisky'..i,'boop','minisky '..i,'2,2,1,3,4,5,6,7,8,9,10,11,12,13,14,15',24)
			addAnimationByIndices('minisky'..i,'pose','minisky '..i,'5,6,7,8,9,10,11,12,13,14,15',24)
			addAnimationByIndices('minisky'..i,'danceL','minisky '..i,'16,17,18,19,20,21,22,23',24)
			addAnimationByIndices('minisky'..i,'danceR','minisky '..i,'24,25,26,27,28,29,30,31',24)
			objectPlayAnimation('minisky'..i,'pose',true)
			addLuaSprite('minisky'..i,false)
		end
	end
end

function onCreatePost()
	setProperty('gf.visible',false)
end

function onEvent(name, value1, value2)
	if name == 'Set GF Speed' then
		danceSpeed = value1
		bgboomspeed = value2
	end
	if not lowQuality then
		if name == 'Hey!' then
			runTimer('startdancing', 0.6);
			miniDance = false
			for i=1,6 do
				objectPlayAnimation('minisky'..i,'boop',true)
			end
		end
	end
end

function onBeatHit()
	if curBeat % (bgboomspeed * 1) == 0 then
		objectPlayAnimation('bg','bg',true)
	end
	if not lowQuality then
		for i=1,6 do
			if curBeat >= 808 then
				objectPlayAnimation('minisky'..i,'boop',true)
			else
				if miniDance == true then
					if curBeat % (danceSpeed * 1) == 0 then
						objectPlayAnimation('minisky'..i,'danceR',false)
					end
					if curBeat % (danceSpeed * 2) == 0 then
						objectPlayAnimation('minisky'..i,'danceL',false)
					end
				end
			end
		end
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'startdancing' then
		miniDance = true;
	end
end