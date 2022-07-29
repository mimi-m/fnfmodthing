-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
function onCreate()
	makeAnimationList();
	makeOffsets();
	
	-- boxing guy
	makeAnimatedLuaSprite('minus', 'characters/BOYFRIEND', defaultOpponentX + 350, defaultOpponentY + 0);
	addAnimationByPrefix('minus', 'idle', 'BF idle dance', 24, false);
	addAnimationByPrefix('minus', 'singLEFT', 'BF NOTE LEFT0', 24, false);
	addAnimationByPrefix('minus', 'singDOWN', 'BF NOTE DOWN0', 24, false);
	addAnimationByPrefix('minus', 'singUP', 'BF NOTE UP0', 24, false);
	addAnimationByPrefix('minus', 'singRIGHT', 'BF NOTE RIGHT0', 24, false);
	
	addLuaSprite('minus', true);

	playAnimation('minus', 0, true);
end

animationsList = {}
holdTimers = {minus = -1.0};
noteDatas = {minus = 0};
function makeAnimationList()
	animationsList[0] = 'idle';
	animationsList[1] = 'singLEFT';
	animationsList[2] = 'singDOWN';
	animationsList[3] = 'singUP';
	animationsList[4] = 'singRIGHT';
end

offsetsminus = {};
function makeOffsets()
	offsetsminus[0] = {x = -5, y = 0}; --idle
	offsetsminus[1] = {x = 5, y = -6}; --left
	offsetsminus[2] = {x = -10, y = -50}; --down
	offsetsminus[3] = {x = -29, y = 27}; --up
	offsetsminus[4] = {x = -48, y = -7}; --right
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special Sing' then
		if not isSustainNote then
			noteDatas.minus = direction;
		end	
	characterToPlay = 'minus'
	animToPlay = noteDatas.minus;
	holdTimers.minus = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.minus >= 0 then
		holdTimers.minus = holdTimers.minus + elapsed;
		if holdTimers.minus >= holdCap then
			playAnimation('minus', 0, false);
			holdTimers.minus = -1;
		end
	end
end

function onCountdownTick(counter)
	beatHitDance(counter);
end

function onBeatHit()
	beatHitDance(curBeat);
end

function beatHitDance(counter)
	if counter % 2 == 0 then
		if holdTimers.minus < 0 then
			playAnimation('minus', 0, false);
		end
	end
end

function playAnimation(character, animId, forced)
	-- 0 = idle
	-- 1 = singLEFT
	-- 2 = singDOWN
	-- 3 = singUP
	-- 4 = singRIGHT
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'minus' then
		objectPlayAnimation('minus', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
		setProperty('minus.offset.x', offsetsminus[animId].x);
		setProperty('minus.offset.y', offsetsminus[animId].y);
	end
end