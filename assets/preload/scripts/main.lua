local function noteHit(id, noteData, isSustainNote)
	removeLuaSprite('image', true);
	makeLuaSprite('image', ({"LEFT","DOWN","UP","RIGHT"})[noteData + 1] .. ' LIGHT', -200, -200);
	addLuaSprite('image', false);
	setObjectCamera('image', 'other');
	runTimer('wait', 0.1);
end
function onEvent(name,value1,value2)
	if name ~= 'cg_lights' then return end
	if value2 == "on" then
		if value1 == "dad" then

			opponentNoteHit = noteHit;
		else
			goodNoteHit = noteHit
		end
	end
	if value2 == "off" then
		opponentNoteHit = nil
		goodNoteHit = nil
	end
end
function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 0, 0.8, 'linear');
	end
end
function onTweenCompleted(tag)
	if tag == 'byebye' then
	-- 	doTweenAlpha("byebye but better",'image', 0, 6.2, 'linear'); --this is soo unneccessary and useless starting from 0.5 to 0.3 to 0.1 is same *maybe*
	-- elseif tag == "image" then
		removeLuaSprite('image', true);
	end
end
--Made by Luscious#7798
--Improved by Superpowers04#3887

function onCreate()
	triggerEvent('cg lights','bf','on')
end




function onCreatePost()
	--Vanilla UI stuff
	--end
	makeLuaText('rads', 'Rad: ' .. getProperty('rads'), 200, 0, 300);
	makeLuaText('sicks', 'Sick: ' .. getProperty('sicks'), 200, 0, 325);
	makeLuaText('goods', 'Good: ' .. getProperty('goods'), 200, 0, 350);
	makeLuaText('bads', 'Bad: ' .. getProperty('bads'), 200, 0, 375);
	makeLuaText('shits', 'Shit: ' .. getProperty('shits'), 200, 0, 400);
	makeLuaText('misses', 'Misses: ' .. getProperty('songMisses'), 200, 0, 425);
	setTextSize('rads', 26)
	setTextSize('sicks', 26)
	setTextSize('goods', 26)
	setTextSize('bads', 26)
	setTextSize('shits', 26)
	setTextSize('misses', 26)
	setTextAlignment('rads', 'left')
	setTextAlignment('sicks', 'left')
	setTextAlignment('goods', 'left')
	setTextAlignment('bads', 'left')
	setTextAlignment('shits', 'left')
	setTextAlignment('misses', 'left')
	addLuaText('rads');
	addLuaText('sicks');
	addLuaText('goods');
	addLuaText('bads');
	addLuaText('shits');
	addLuaText('misses');
	addLuaText('xd');
end

function onRecalculateRating()
    setTextString('rads', 'Rad: ' .. getProperty('sicks'));
	setTextString('sicks', 'Sick:'  .. getProperty('sicks'));
	setTextString('goods', 'Good: ' .. getProperty('goods'));
	setTextString('bads', 'Bad: ' .. getProperty('bads'));
	setTextString('shits', 'Shit: ' .. getProperty('shits'));
	setTextString('misses', 'Misses: ' .. getProperty('songMisses'));
	setTextString('combo', 'Combo: ' .. getProperty('combo'));
	setTextString('score', 'Score:' .. score)
end


function onNoteMiss()
cameraFlash('game', '0xFF0000', 0.4, true)
end