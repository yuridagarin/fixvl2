-- 常用功能函数

-- cf : Common Function

-- Danexx
-- 2005.5.30
------------------------------------------------------------

-- 通过函数返回一段文字的颜色
-- text : 需要显示的文字
-- color : 颜色
function cf_ox_SetColor(text, color)
	return "<color="..color..">"..text.."<color>"
end

-- 通过函数返回玩家性别称呼
-- male : 如果是男性则返回这个字符串
-- female : 如果是女性则返回这个字符串
function cf_ox_GetSex(male, female)
	if (GetSex() == 1) then
		return male
	else
		return female
	end
end

-- 通过函数返回一条分割线
-- length : 分割线的长度
function cf_ox_partingline(length)
	local partingline = "\n"
	if (length == 0) then
		length = 8
	end
	for i=1,length do 
		partingline = partingline.."?"
	end
	return partingline.."\n"
end

--function cf_ox_questnote(mode)
--	if (mode == 0) then
--		return " [任务已经接取] "
--	elseif (mode == 1) then
--		return " [任务还未完成] "	
--	elseif (mode == 2) then
--		return " [任务已经完成] "	
--	end
--end