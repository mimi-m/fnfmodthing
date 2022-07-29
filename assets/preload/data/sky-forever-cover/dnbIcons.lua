local turnvalue = 20
local doThing = true
local difficultyMultiplier = 2
function onBeatHit()

turnvalue = turnvalue
if curBeat % 1 == 0 then
turnvalue = -turnvalue
end


if doThing == true then
setProperty('iconP2.angle',-turnvalue)
setProperty('iconP1.angle',turnvalue)

doTweenAngle('iconTween1','iconP1',0,crochet/1000,'circOut')
doTweenAngle('iconTween2','iconP2',0,crochet/1000,'circOut')
end


end


function opponentNoteHit(id, dir, nt, sus)
    health = getProperty('health')
    if difficultyName == 'Mania' then
        difficultyMultiplier = 1
    end
    if getProperty('health') > (0.1175 * difficultyMultiplier) then
        setProperty('health', health- 0.0196);
    end
end