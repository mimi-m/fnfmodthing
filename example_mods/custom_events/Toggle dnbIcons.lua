local bopStrength = 25
local enableBopping = false
function onEvent(name, value1, value2)
	if name == 'Toggle dnbIcons' then
		if value1 == 'true' then
            enableBopping = true
		else
            enableBopping = false
        end
		if value2 == '' then
            bopStrength = (bopStrength)
		else
            bopStrength = (value2)
        end
	end
end

function onBeatHit()
    if enableBopping == true then
        bopStrength = bopStrength
        if curBeat % 1 == 0 then
            bopStrength = -bopStrength
        end
        setProperty('iconP2.angle',-bopStrength)
        setProperty('iconP1.angle',bopStrength)

        doTweenAngle('iconTween1','iconP1',0,crochet/1000,'circOut')
        doTweenAngle('iconTween2','iconP2',0,crochet/1000,'circOut')
    end


end