removeGF = false;

function onCreate()
    if dadName == 'gf' then
        close(true);
    else
    setProperty('gf.x', getProperty('gf.x') + 100)
    if removeGF then setProperty('gf.visible', false) end
    makeAnimatedLuaSprite('speaker', 'characters/GF_speaker', getProperty('gf.x') - 190, getProperty('gf.y') + 310)
    addAnimationByPrefix('speaker', 'bump', 'speaker', 24, false)
    addLuaSprite('speaker')
    end
end

function onUpdate()
    setProperty('speaker.alpha', getProperty('gf.alpha'))
    if not removeGF then setProperty('speaker.visible', getProperty('gf.visible')) end
    setProperty('speaker.x', getProperty('gf.x') - 190)
    setProperty('speaker.y', getProperty('gf.y') + 310)
end

function onBeatHit()
	if getPropertyFromClass('ClientPrefs', 'muteInstVoicesOption') ~= 'Inst' then
    objectPlayAnimation('speaker', 'bump')
    end
end