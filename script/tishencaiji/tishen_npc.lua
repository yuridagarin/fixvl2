-- �ɼ�������  npc
-- 2006-8-21 12:12
Include("\\script\\voz\\xacthuc\\xacthuc.lua");
TISHEN_INDEX_ID = 100
TISHEN_ITEM_VALUE = 101

MAX_PAGE_ITEM_COUNT = 5
GOLD_PER_8_HOUR = 4
MAX_TISHEN_COUNT = 20

function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi�u hi�p"
	else
		return "N� hi�p "
	end
end

function main()
	local szSay = 
	{
		"Xem th� ng��i �y th�c thu th�p ���c bao nhi�u!/see_gather_item",
		"H�c t�p t� ng��i �y th�c thu th�p/learn_exp",
		"Nh� ng��i �y th�c thu th�p t�m nguy�n li�u kh�c/manage_tishen",
		"��i l�m thu�, ta ph�i nh� h� m�i ���c/employ_tishen",
		"T�m hi�u ng��i �y th�c thu th�p/tishen_shuoming",
		"Kh�ng c� g�!/end_say",
	}
	
	-- �����õ���Ʒ
	for i = 1, MAX_TISHEN_COUNT do
		CalcTishenGatherData(i)
	end
	
	-- ����ѵ���ߵȼ�������ɼ�����
	for i = 1, MAX_TISHEN_COUNT do
		local nSkillID = GetTishenGatherSkillID(i)
		local nSkillLevel = GetLifeSkillLevel(0, nSkillID)
		if nSkillLevel >= 99 then		-- ����ߵȼ���
			AddTishenGatherExp(i)		-- �Ӳ��ϣ�����Ҫ���
		end
	end
	
	Say("V� "..GetPlayerSex().."C�n g�?", getn(szSay), szSay)	
end

function employ_tishen()

	if CheckXacThuc() == 0 then
		Say("T�i kho�n ch�a x�c th�c. Xin th� ch� h�y d�ng tay.", 0)
		return
	end
	
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime >= 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- �ang thu th�p  : "..szGatherItem.."  C�n  : "..nHour.."h "..nMin.." Ph�t "..nSec.." Gi�y "
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."T�"..szMsg.."/#employ_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."T�"..szMsg.."/#employ_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R�i kh�i/end_say"
		Say("Kh�ng bi�t!"..GetPlayerSex().."��i n�o s� thu th�p?", getn(szSay), szSay)
	else
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex().."T�i ��y kh�ng m��n ��i ng� thu th�p", 0)
	end
end

function employ_tishen_info(nIndex)
	Say("Xin h�i "..GetPlayerSex().."C�n �y th�c bao l�u?",
		4,
		"D�ng 1 Th�n N�ng ��n--nh�n ���c 8 gi� �y th�c thu th�p (thu ph� "..GOLD_PER_8_HOUR.." v�ng)/#yes_use(1,"..nIndex..")",
		"D�ng 2 Th�n N�ng ��n--nh�n ���c 16 gi� �y th�c thu th�p (thu ph� "..(GOLD_PER_8_HOUR * 2).." v�ng)/#yes_use(2,"..nIndex..")",
		"D�ng 3 Th�n N�ng ��n--nh�n ���c 24 gi� �y th�c thu th�p (thu ph� "..(GOLD_PER_8_HOUR * 3).." v�ng)/#yes_use(3,"..nIndex..")",
		"�� ta xem/main")
end

function yes_use(nCount, nIndex)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh�ng �� Th�n N�ng ��n, kh�ng th� ti�p t�c c�ng vi�c �y th�c thu th�p.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh�ng �� Th�n N�ng ��n, kh�ng th� ti�p t�c c�ng vi�c �y th�c thu th�p.", 0)
		return
	end

	local szName, nLastTime, szGatherItem = IsTishenGatherExist(nIndex)
	if szName == nil then
		return
	end
	
	local nTime = nCount * 8 * 3600 + nLastTime
	if nTime > 25 * 3600 then
		Say("!!"..GetPlayerSex().."Ngh� ng�i m�t l�t. \n<color=red>(Th�i gian thu� 1 l�n kh�ng ���c qu� 25 gi�)", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,343,nCount) == 1 then
		AddTishenGatherTime(nIndex, nCount * 8 * 3600)
		Msg2Player("�ang thu th�p"..szGatherItem.." s� gi�p b�n th�m ["..(nCount * 8).."] gi�")
	end
end

function manage_tishen()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime > 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- �ang thu th�p  : "..szGatherItem.."  C�n  : "..nHour.."h "..nMin.." Ph�t "..nSec.." Gi�y "
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."T�"..szMsg.."/#manage_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."T�"..szMsg.."/#manage_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R�i kh�i/end_say"
		Say("Kh�ng bi�t!"..GetPlayerSex().."��i n�o s� thu th�p?", getn(szSay), szSay)
	else
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex().."T�i ��y kh�ng m��n ��i ng� thu th�p", 0)
	end
end

function manage_tishen_info(nIndex)
	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	
	local nSkillID = GetTishenGatherSkillID(nIndex)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("B�n kh�ng c� k� n�ng thu th�p, kh�ng th� thay ��i!", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "Trang k�/#next_page("..nSkillID..")"
			break
		end
		tSay[i] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
	end
	tSay[getn(tSay)+1] = "Kh�ng mu�n thu th�p nguy�n li�u kh�c, gi�ng ban ��u l� ���c/end_say"
	Say("!!"..GetPlayerSex().." c�n thu th�p lo�i v�t ph�m n�o?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("B�n kh�ng c� k� n�ng thu th�p, kh�ng th� thay ��i!", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		tSay[nIndex] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	local nIndexID = GetTaskTemp(TISHEN_INDEX_ID)
	tSay[nIndex] = "Trang tr��c/#manage_tishen_info("..nIndexID..")"
	tSay[nIndex+1] = "Kh�ng mu�n thu th�p nguy�n li�u kh�c, gi�ng ban ��u l� ���c/end_say"
	
	Say("!!"..GetPlayerSex().." c�n thu th�p lo�i v�t ph�m n�o?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)

	Say("!!"..GetPlayerSex().."X�c nh�n mu�n thu th�p <color=yellow>"..szItem.."<color> ch�?",
		2,
		"��ng/#change_gather("..nMapLevel..","..nSkillID..",\""..szItem.."\")",
		"Sai/end_say")
end

function change_gather(nMapLevel, nSkillID, szItem)
	local nIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nRet = ChangeTishenGather(nIndex, nMapLevel, nSkillID)
	if nRet > 0 then
		local nActionName = GetGatherSkillName(nSkillID)
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex()..", c�i ng��i n�y"..nActionName.."��i ng� chuy�n th�nh thu th�p <color=yellow>"..szItem.."<color>", 0)
	end
end

function see_gather_item()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			local szMsg = ""
			if nLastTime <= 0 then
				szMsg = " -- Thu th�p ho�n t�t"
			else
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				szMsg =  " -- �ang thu th�p  : "..szGatherItem.."  C�n  : "..nHour.."h "..nMin.." Ph�t "..nSec.." Gi�y "
			end
			
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."T�"..szMsg.."/#seeinfo("..i..")"
			else
				szSay[ntIndex] = szName.."T�"..szMsg.."/#seeinfo("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R�i kh�i/end_say"
		Say("Kh�ng bi�t!"..GetPlayerSex().."��nh cho ��m ng��i n�o �i thu th�p v�t ph�m?", getn(szSay), szSay)
	else
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex().."T�i ��y kh�ng m��n ��i ng� thu th�p", 0)
	end
end

function seeinfo(nIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	for index, value in t do
		if nCount > MAX_PAGE_ITEM_COUNT then
			szSay[nCount] = "Trang k�/#next_item_page("..nIndex..","..nCount..")"
			break
		end
		-- n = nGenre << 24 | nDetail << 16 | nParticular
		local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		szSay[nCount] = index.."["..(value.nItemCount).."] c�i/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
		nCount = nCount + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "L�y t�t c� v�t ph�m ra/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "R�i kh�i/end_say"
		Say("��m ng��i n�y thu th�p ���c m�y v�t ph�m sau. <color=yellow>(Tr��c khi l�y v�t ph�m xin x�c nh�n h�nh trang �� kho�ng tr�ng v� s�c l�c)<color>", getn(szSay), szSay)
	else
		Say("��m ng��i n�y t�m th�i ch�a thu th�p ���c v�t ph�m, m�i "..GetPlayerSex().."khi kh�c quay l�i!", 2, "tr� l�i/main", "R�i kh�i/end_say")
	end
end

function next_item_page(nIndex, nPageIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	local nPos = 1
	for index, value in t do
		if nPos >= nPageIndex then
			if nCount > MAX_PAGE_ITEM_COUNT then
				szSay[nCount] = "Trang k�/next_item_page("..nIndex..","..(MAX_PAGE_ITEM_COUNT + nPageIndex)..")"
				break
			end
			-- n = nGenre << 24 | nDetail << 16 | nParticular
			local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
			szSay[nCount] = index.."["..(value.nItemCount).."] c�i/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
			nCount = nCount + 1
		end
		nPos = nPos + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "L�y t�t c� v�t ph�m ra/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "R�i kh�i/end_say"
		Say("��m ng��i n�y thu th�p ���c m�y v�t ph�m sau. <color=yellow>(Tr��c khi l�y v�t ph�m xin x�c nh�n h�nh trang �� kho�ng tr�ng v� s�c l�c)<color>", getn(szSay), szSay)
	end
end

function get_all_gather_item(nIndex)
	if IsBoxLocking() == 1 then
		Say("<color=green>Ng��i �y th�c thu th�p<color>: R��ng ch�a �� c�a ng��i �� kh�a, kh�ng th� l�y v�t ph�m c�a nh�m thu th�p ra. ",0)
		return
	end

	local n = 0
	local t = GetTishenGatherItem(nIndex)
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		local nRet = UpdateTishenGatherInfo(nIndex, n, value.nItemCount)
		if nRet > 0 then
			local str = format("Chu�n b� nh�n (%d,%d,%d) %d",value.nGenre,value.nDetail,value.nParticular,value.nItemCount)
			str = "[�y th�c thu th�p]"..GetName()..str
			WriteLog(str)
			if AddItem(value.nGenre, value.nDetail, value.nParticular, value.nItemCount, 1) == 1 then
				WriteLog("[�y th�c thu th�p]"..GetName().."Nh�n v�t ph�m th�nh c�ng")
			end
		else
			Msg2Player("H�nh trang v� s�c l�c c�a b�n �� v��t m�c")
			break
		end
	end
end

--get_gather_item
function ggi(nItem, nMax, nIndex, sz)
	if IsBoxLocking() == 1 then
		Say("<color=green>Ng��i �y th�c thu th�p<color>: R��ng ch�a �� c�a ng��i �� kh�a, kh�ng th� l�y v�t ph�m c�a nh�m thu th�p ra. ",0)
		return
	end

	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	SetTaskTemp(TISHEN_ITEM_VALUE, nItem)
	
	AskClientForNumber("get_gather_item_callback", 1, tonumber(nMax), "L�y"..sz);
end

function get_gather_item_callback(nCount)
	local nTishenIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nItem = GetTaskTemp(TISHEN_ITEM_VALUE)
	if nTishenIndex == 0 or nItem == 0 then
		return
	end
	
	local t = GetTishenGatherItem(nTishenIndex)
	
	local nGatherCount = 0
	local nGenre = 0
	local nDetail = 0
	local nParticular = 0
	
	local n = 0
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		if n == nItem then
			nGatherCount = value.nItemCount
			nGenre = value.nGenre
			nDetail = value.nDetail
			nParticular = value.nParticular
			break
		end
	end
	
	if nCount > nGatherCount then
		nCount = nGatherCount
	end
	
	if nCount <= 0 then
		return
	end
	
	local nRet = UpdateTishenGatherInfo(nTishenIndex, n, nCount)
	if nRet > 0 then
		local str = format("Chu�n b� nh�n (%d,%d,%d) %d",nGenre,nDetail,nParticular,nCount)
		str = "[�y th�c thu th�p]"..GetName()..str
		WriteLog(str)
		if AddItem(nGenre, nDetail, nParticular, nCount, 1) == 1 then
			WriteLog("[�y th�c thu th�p]"..GetName().."Nh�n v�t ph�m th�nh c�ng")
		end
	else
		Msg2Player("H�nh trang v� s�c l�c c�a b�n �� v��t m�c")
	end
end

function learn_exp()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem, nExp = IsTishenGatherExist(i)
		if szName then
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."��i ng�-- nh�n ���c kinh nghi�m: ["..nExp.."]/#see_exp_info("..i..")"
			else
				szSay[ntIndex] = szName.."��i ng�-- nh�n ���c kinh nghi�m: ["..nExp.."]/#see_exp_info("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R�i kh�i/end_say"
		Say("Kh�ng bi�t!"..GetPlayerSex().."��nh cho ��m ng��i n�o �i thu th�p kinh nghi�m?", getn(szSay), szSay)
	else
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex().."T�i ��y kh�ng m��n ��i ng� thu th�p", 0)
	end
end

function see_exp_info(nIndex)
	local szSay = {}
	
	nRet = GetTishenGatherExp(nIndex)
	if nRet == nil then
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex().."Kh�ng c� k� n�ng s�ng, kh�ng th� nh�n kinh nghi�m t� nh�n c�ng thu th�p.", 0)
		AddTishenGatherExp(nIndex)	-- û�д�����ܵ�Add����Ϊ��մ�������ľ���
	elseif nRet > 0 then
		Say("<color=green>Ng��i �y th�c thu th�p<color>:"..GetPlayerSex().."C� th� nh�n "..nRet.." �i�m thu th�p kinh nghi�m. \n<color=red>Ch� �: Nh�ng ��i ng� thu th�p kh�c kinh nghi�m nh�n ���c s� b� x�a b�.<color>", 3, "Nh�n �i�m/#yes_get_exp("..nIndex..")", "Xem nh�ng ��i ng� kh�c/learn_exp", "R�i kh�i/end_say")
	else
		Say("��m ng��i n�y t�m th�i ch�a thu th�p ���c, m�i "..GetPlayerSex().."khi kh�c quay l�i!", 2, "tr� l�i/main", "R�i kh�i/end_say")
	end
end

function yes_get_exp(nIndex)
	local nAddExp, nSkillName = AddTishenGatherExp(nIndex)
	Msg2Player("B�n nh�n ���c ["..nAddExp.."] �i�m"..nSkillName.." Kinh nghi�m k� n�ng ")
end

function tishen_shuoming()
	Say("V� "..GetPlayerSex().."mu�n t�m hi�u g� v� �y th�c thu th�p?",
		4,
		"�y th�c thu th�p c�n nh�ng g�?/wupinshuoming",
		"Gi�i th�ch ��i ng� m��n/duiwushuoming",
		"Sau khi �y th�c thu th�p t�i n�i �� nh�n kinh nghi�m v� v�t ph�m/lingqushuoming",
		"R�i kh�i./main")
end

function wupinshuoming()
	Say("Mu�n �y th�c thu th�p c�n Kh� ��c th� v� Th�n N�ng ��n, t�i khu v�c thu th�p s� d�ng Kh� ��c th� l� c� th� �y th�c, Th�n N�ng ��n quy�t ��nh th�i gian �y th�c. Kh� ��c th� mua t�i t�p h�a, Th�n N�ng ��n mua t� ch�c n�ng Ng� c�c.",0)
end

function duiwushuoming()
	Say("S� d�ng Kh� ��c th� m��n 1 ��i ng�, ta s� tr�ng th�y ch�ng thu th�p v�t ph�m ���c ch� ��nh. C� th� ��n <color=green>Ng��i �y th�c thu th�p<color> xem �� m��n qua bao nhi�u ��i ng� �y th�c thu th�p, thu th�p ���c v�t ph�m g� ho�c ta c� th� thay ��i v�t ph�m thu th�p.",0)
end

function lingqushuoming()
	Say("Ng��i c� th� ��n <color=green>Ng��i �y th�c thu th�p<color> xem t�nh h�nh thu th�p, v�t ph�m thu th�p v� kinh nghi�m, khi ��ng th�i c� 2 ng��i �y th�c thu th�p, nh�n ph�n th��ng ng��i kia xong, kinh nghi�m ng��i c�n l�i s� x�a b�, v�t ph�m thu th�p kh�ng b� �nh h��ng.",0)
end

function end_say()

end

