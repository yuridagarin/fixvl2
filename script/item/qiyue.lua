Include("\\script\\task\\plant_tuoguan\\head.lua");
-- �ٻ���Ӷ�ɼ��ӵĶ���

USE_SHENNONG_NUMBER = 100

GOLD_PER_8_HOUR = 4

function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi�u hi�p"
	else
		return "N� hi�p "
	end
end

function OnUse()

	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("Bi�n ng��i ��ng ngh�t, bi�t t�m � ��u ��y"..GetPlayerSex().."��n n�i kh�c thu th�p nh�!", 0)
		return
	end

	Say("Ngo�i vi�c d�ng Th�n N�ng ��n �� �y th�c thu th�p, Thi�u hi�p c�n c� th� �y th�c tr�ng c�y B�t Nh� l�n t�i ��y. Xem th�m th�ng tin b�n d��i",
		3,
		"�y th�c thu th�p b�ng Th�n N�ng ��n/use_shennong",
		"�y th�c tr�ng c�y B�t Nh� l�n/tuoguan_zhongshu",
		"K�t th�c ��i tho�i/end_say");
end

function use_shennong()
	Say("Xin h�i "..GetPlayerSex().."c�n d�ng m�y vi�n Th�n N�ng ��n �� �y th�c thu th�p?",
		4,
		"D�ng 1 Th�n N�ng ��n--nh�n ���c 8 gi� �y th�c thu th�p (thu ph� "..GOLD_PER_8_HOUR.." v�ng)/#yes_use(1)",
		"D�ng 2 Th�n N�ng ��n--nh�n ���c 16 gi� �y th�c thu th�p (thu ph� "..(GOLD_PER_8_HOUR * 2).." v�ng)/#yes_use(2)",
		"D�ng 3 Th�n N�ng ��n--nh�n ���c 24 gi� �y th�c thu th�p (thu ph� "..(GOLD_PER_8_HOUR * 3).." v�ng)/#yes_use(3)",
		"Kh�ng s� d�ng �y th�c thu th�p/end_say")
end

function tuoguan_zhongshu()
	Say("Xin h�i "..GetPlayerSex().."L�m th� n�o tr�ng ���c c�y b�t nh� l�n?",
		6,
		"T�i h� c�n �y th�c ng��i � < c�m TP H� Ch� Minh 1> tr�ng c�y gi�p (ti�n c�ng 20 v�ng v� 7 l� th�y)/#plant_tuoguan(1, 20, 1)",
		"T�i h� c�n �y th�c ng��i � < c�m TP H� Ch� Minh 2> tr�ng c�y gi�p (ti�n c�ng 20 v�ng v� 7 l� th�y)/#plant_tuoguan(1, 20, 2)",
		"T�i h� c�n �y th�c ng��i � < c�m TP H� Ch� Minh 3> tr�ng c�y gi�p (ti�n c�ng 18 v�ng v� 7 l� th�y)/#plant_tuoguan(1, 18, 3)",
		"T�i h� c�n �y th�c ng��i � < c�m H� N�i 1> tr�ng c�y gi�p (ti�n c�ng 20 v�ng v� 7 l� th�y)/#plant_tuoguan(1, 20, 4)",
		"T�i h� c�n �y th�c ng��i � < c�m H� N�i 2> tr�ng c�y gi�p (ti�n c�ng 18 v�ng v� 7 l� th�y)/#plant_tuoguan(1, 18, 5)",
		"Ch�a mu�n �y th�c tr�ng c�y B�t Nh�./end_say")
end

function yes_use(nCount)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh�ng �� Th�n N�ng ��n, kh�ng th� �y th�c thu th�p.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh�ng �� ti�n thu� ��i nh�n c�ng thu th�p.", 0)
		return
	end
	
	SetTaskTemp(USE_SHENNONG_NUMBER, nCount)
	
	local tSkillList = GetUseableGatherSkillList()
	if tSkillList == nil then
		Say("Kh�ng th� thu� nh�n c�ng �y th�c thu th�p trong khu v�c n�y.", 0)
		return
	end
	
	local tSay = {}
	if getn(tSkillList) == 0 then
		Say("B�n kh�ng th� d�ng k� n�ng thu th�p trong khu v�c n�y.", 0)
		return
	end
	
	if getn(tSkillList) > 1 then
		for index, value in tSkillList do
			tSay[index] = value[2].."/#sel_skill("..value[1]..")"
		end
		Say("Tr�n n�i n�y s�n v�t phong ph�, ch�ng hay"..GetPlayerSex().."Kh�c quan c�n g�?", getn(tSay), tSay)
	elseif getn(tSkillList) == 1 then
		sel_skill(tSkillList[1][1])
	end
end

function sel_skill(nSkillID)
	local nFreeCount, nSameTypeFreeCount = GetFreeTishenGather(nSkillID)
	
	if nFreeCount == 0 then
		Say("Ch�ng ph�i kh�ng mu�n l�y ti�n c�a ch� nh�n, th�c ra l� kh�ng c� ng��i l�m!\n<color=red>(��i ng� nh�n c�ng b�n thu� �� ��t m�c t�i �a: 6 ��i.)<color>", 0)
		return
	elseif nSameTypeFreeCount == 0 then
		Say("Ch�ng ph�i kh�ng mu�n l�y ti�n c�a ch� nh�n, th�c ra l� kh�ng c� ng��i l�m!\n<color=red>(B�n �� thu� hai ��i c�ng ti�n h�nh thu th�p lo�i n�y.)<color>", 0)
		return
	end
	
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("K� n�ng thu th�p c�a b�n qu� th�p, kh�ng th� thu th�p � khu v�c n�y!", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "Trang k�/#next_page("..nSkillID..")"
			break
		end
		-- ��������,��������!
		local nSss = strfind(t[i][1], "V� �ang ph� th�ch")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."Ph� th�ch c�a c�c m�n ph�i"
		else
			nSss = strfind(t[i][1], "Bi�n Kinh ph� th�ch")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."Ph� th�ch c�c th�nh th�"
			else
				s123 = t[i][1]
			end
		end
				
		tSay[i] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
	end
	
	if getn(tSay) == 0 then
		Say("C�i g� c�ng kh�ng c� v�y!", 0)
		return
	end
	
	tSay[getn(tSay)+1] = "Ta ch�a mu�n thu th�p/end_say"
	
	Say("!!"..GetPlayerSex().." c�n thu th�p lo�i v�t ph�m n�o?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("K� n�ng thu th�p c�a b�n qu� th�p, kh�ng th� thu th�p � khu v�c n�y!", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		-- ��������,��������!
		local nSss = strfind(t[i][1], "V� �ang ph� th�ch")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."Ph� th�ch c�a c�c m�n ph�i"
		else
			nSss = strfind(t[i][1], "Bi�n Kinh ph� th�ch")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."Ph� th�ch c�c th�nh th�"
			else
				s123 = t[i][1]
			end
		end

		tSay[nIndex] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	if getn(tSay) == 0 then
		Say("C�i g� c�ng kh�ng c� v�y!", 0)
		return
	end
	
	tSay[nIndex] = "Trang tr��c/#sel_skill("..nSkillID..")"
	tSay[nIndex+1] = "Ta ch�a mu�n thu th�p/end_say"
	
	Say("!!"..GetPlayerSex().." c�n thu th�p lo�i v�t ph�m n�o?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)
	
	Say("!!"..GetPlayerSex().."X�c nh�n mu�n thu th�p <color=yellow>"..szItem.."<color> ch�?",
		2,
		"��ng/#start_gather("..nMapLevel..","..nSkillID..")",
		"Sai/end_say")
end

function start_gather(nMapLevel, nSkillID)
	local nCount = GetTaskTemp(USE_SHENNONG_NUMBER)
	
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh�ng �� Th�n N�ng ��n, kh�ng th� �y th�c thu th�p.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh�ng �� ti�n thu� ��i nh�n c�ng thu th�p.", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,509,1) == 1 and DelItem(2,1,343,nCount) == 1 then
		--Msg2Player(nGerne, nDetail, nParticular)
		local nMaxTime = 8 * 3600
		StartTishenGather(nMapLevel, nSkillID, nMaxTime * nCount)
		
		local szSkillName = GetGatherSkillName(nSkillID)
		local szNpcName = GetName().."-"..szSkillName.."ti�u ��i"
		local szNpcMode = szSkillName
		if szNpcMode == "Canh t�c" then
			szNpcMode = "Thu ho�ch"
		end
		-- createnpc
		local nMapID, nX, nY = GetWorldPos()
		local nIndex = CreateNpc(szNpcMode, szNpcName, nMapID, nX, nY, 7, 1, 1)
		SetNpcDir(nIndex, random(63))
		SetNpcLifeTime(nIndex, nMaxTime * nCount)
	else
		Say(GetPlayerSex().."Kh�ng c� Kh� ��c th�, kh�ng th� �y th�c thu th�p.", 0)
	end
end

function end_say()

end
