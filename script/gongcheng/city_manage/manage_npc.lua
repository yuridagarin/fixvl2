-- ����ս���й���NPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\lib\\writelog.lua");

function get_tong_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "Th�nh Ch�"
	else
		sex_name = "Qu�n Ch�a "
	end
	return sex_name
end

function deal_abnormal()
	-- ȥRelay�Ͽ�����û��
	local nMapID = GetWorldPos()
	ApplyRelayShareData("_TongCityWar", 0, nMapID, "\\script\\gongcheng\\city_manage\\manage_npc.lua", "cb_citywar")
end

function cb_citywar(szKey, nKey1, nKey2, nCount)
	if szKey == "_TongCityWar" then
		-- Relay�������ݵ�,��ô��ֱ�ӹ���������Ϣ��
		BuildCityWarData(szKey, nKey1, nKey2)
		main()
	else
		-- Relay��û���˾����û����
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 
			3, 
			"Gi�i thi�u Qu�n l� th�nh th�/jieshao_city", 
			"\nNhi�m v� H�i Phong tr�i/tongcitywar_task", 
--			"Thu h�i trang b� x�ng hi�u/shou_zhuang", 
			"R�i kh�i/no_say")
	end
end

function main()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")
	if szTongName == nil then
		deal_abnormal()
		return
	end
	if szTongName == "" then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 
			3, 
			"Gi�i thi�u Qu�n l� th�nh th�/jieshao_city", 
			"\nNhi�m v� H�i Phong tr�i/tongcitywar_task", 
--			"Thu h�i trang b� x�ng hi�u/shou_zhuang", 
			"R�i kh�i/no_say")
		return
	end
	if GetTongName() ~= szTongName then		-- ����ռ����еİ��ɶԻ�
		local szTongViewName = szTongName
		szTongViewName = replace(szTongViewName, "/" ,"-")
		szTongViewName = replace(szTongViewName, "|" ,"-")
		szTongViewName = replace(szTongViewName, ":" ,"-")
		Say("Th�nh n�y do <color=yellow>"..szTongViewName.."<color> chi�m l�nh", 
			3, 
			"Gi�i thi�u Qu�n l� th�nh th�/jieshao_city", 
			"\nNhi�m v� H�i Phong tr�i/tongcitywar_task", 
--			"Thu h�i trang b� x�ng hi�u/shou_zhuang", 
			"R�i kh�i/no_say")
		return
	end
	Say("Th�nh n�y do qu� bang chi�m l�nh",
		7,
		"Gi�i thi�u Qu�n l� th�nh th�/jieshao_city",
		"Qu�n l� th�nh th�/manage_city",
		"X�ng hi�u trang b�/fuli_city",
		"Ta ch�a c� x�ng hi�u, ph�i l�y l�i x�ng hi�u/get_title_again",
		"Nhi�m v� H�i Phong tr�i/tongcitywar_task",
		"Ph�c v� ��c bi�t th�nh vi�n bang h�i/#tongcitywar_service(0)",
--		"Thu h�i trang b� x�ng hi�u/shou_zhuang",
		"R�i kh�i/no_say")
end

function tongcitywar_service(nParam)
	if GetLevel() < 70 then
		Say("B�n ch�a �� c�p 70, kh�ng ���c ph�c v� ��c bi�t",0)
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	
	if nParam == 0 then
		Say("<color=green>Qu�n l� th�nh th�<color>: T�t c� th�nh vi�n trong bang th�nh ch� ph�i gia nh�p bang tr�n 7 ng�y v� c�p 70 tr� l�n ��n NPC ch� ��nh nh�n 8 gi� �y th�c b�ch c�u ho�n ho�c 4 ti�ng th�n n�ng ��n ho�c 8 ti�ng l�c th�n ho�n ho�c 8 ti�ng tam th�nh ho�n. M�i tu�n ch� ���c nh�n 1 l�n",
			5,
			"Nh�n 8 gi� �y th�c B�ch C�u Ho�n/#tongcitywar_service(1)",
			"L�nh Th�n n�ng ��n 4 gi� /#tongcitywar_service(2)",
			"Nh�n 8 gi� �y th�c L�c Th�n Ho�n/#tongcitywar_service(3)",
			"Nh�n 8 gi� �y th�c Tam Thanh Ho�n/#tongcitywar_service(4)",
			"K�t th�c ��i tho�i/no_say")
	elseif nParam == 1 then		
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th�i gian nh�p bang ch�a ���c 7 ng�y, kh�ng nh�n ���c ph�c v� ��c bi�t", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu�n n�y b�n �� l�nh h�n 1 l�n ph�c v� ��c bi�t.",0)
			return
		end
		SetTask(2501, GetTask(2501) + 8 * 60)
		SetTask(447, nTime)
		Msg2Player("��i hi�p thu ���c 8 gi� �y th�c B�ch C�u Ho�n")
		WriteLog("[C�ng th�nh chi�n-ph�c v� ��c bi�t]:"..GetName().."Thu ���c 8 gi� �y th�c B�ch C�u Ho�n")
	elseif nParam == 2 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th�i gian nh�p bang ch�a ���c 7 ng�y, kh�ng nh�n ���c ph�c v� ��c bi�t", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu�n n�y b�n �� l�nh h�n 1 l�n ph�c v� ��c bi�t.",0)
			return
		end
		SetTask(2502, GetTask(2502) + 4 * 60)
		SetTask(447, nTime)
		Msg2Player("��i hi�p thu ���c 8 gi� �y th�c Th�n N�ng ��n")
		WriteLog("[C�ng th�nh chi�n-ph�c v� ��c bi�t]:"..GetName().."Thu ���c 8 gi� �y th�c Th�n N�ng ��n")
	elseif nParam == 3 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th�i gian nh�p bang ch�a ���c 7 ng�y, kh�ng nh�n ���c ph�c v� ��c bi�t", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu�n n�y b�n �� l�nh h�n 1 l�n ph�c v� ��c bi�t.",0)
			return
		end
		--SetTask(2296, GetTask(2296) + 8 * 60)
		EatLiushen(1, 8 * 60);
		SetTask(447, nTime)
		Msg2Player("��i hi�p thu ���c 8 gi� �y th�c L�c Th�n Ho�n")
		WriteLog("[C�ng th�nh chi�n-ph�c v� ��c bi�t]:"..GetName().."Thu ���c 8 gi� �y th�c L�c Th�n Ho�n")
	elseif nParam == 4 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("th�i gian nh�p bang ch�a ���c 7 ng�y, kh�ng nh�n ���c ph�c v� ��c bi�t", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" Tu�n n�y b�n �� l�nh h�n 1 l�n ph�c v� ��c bi�t.",0)
			return
		end
		EatSanqin(1, 8 * 60)
		SetTask(447, nTime)
		Msg2Player("��i hi�p thu ���c 8 gi� �y th�c Tam Thanh Ho�n")
		WriteLog("[C�ng th�nh chi�n-ph�c v� ��c bi�t]:"..GetName().."Thu ���c 8 gi� �y th�c Tam Thanh Ho�n")
	end
end

function tongcitywar_task()
	Talk(1,"","Nhi�m v� n�y hi�n t�i ch�a m�!")
	do return end
	local nMapID = GetWorldPos()
	local szTongName = GetCityWarInfo(nMapID, "base")
	local szMsg = " Th�nh �� Th�i th� ph�t hi�n t�i ch�nh Th�nh �� b� th�t tho�t l�n�ch�c ch�c �� c� k� th�ng ��ng v�i ��ch�"
	if szTongName == nil then
		local tSay =
		{
			"\nHuy ch��ng Th�nh th� ��i gi�i th��ng/task_jiangli",
			"\nC� h�i/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	elseif GetTongName() ~= szTongName then
		local tSay =
		{
			"\nChi�n s�/task_zhankuang",
			"Ta ph�i ��n H�i Phong tr�i/task_huifeng",
			"��ch binh H� gi�p/task_hujia",
			"Huy ch��ng th�nh th� ��i gi�i th��ng/task_jiangli",
			"C� h�i/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		local tSay =
		{
			"\nChi�n s�/task_zhankuang",
			"Ta ph�i ��n H�i Phong tr�i/task_huifeng",
			"��ch binh H� gi�p/task_hujia",
			"Huy ch��ng th�nh th� ��i gi�i th��ng/task_jiangli",
			"C� h�i/no_say",
		}
		if szName == szBoss or szName == szManager then
			tinsert(tSay, 2, "Lo�n trong gi�c ngo�i/task_youhuan")
		end
		Say(szMsg,getn(tSay),tSay)
	end
end

function task_huifeng()
	if GetPlayerRoute() == 0 then
		Say("V� danh ti�u t�t c�n kh�ng n�n v�o H�i Phong tr�i! Ng��i n�n gia nh�p m�n ph�i r�n luy�n tr��c ��",0)
		return
	end
	
	if GetLevel() < 75 then
		Say(" Ng��i ch�a ��t c�p 75, ��n H�i Phong tr�i r�t nguy hi�m",0)
		return
	end
	CleanInteractive()
	LeaveTeam()
	local nIsExist = CustomDataRead("tongcitywar_person_map_task")	-- ��ʼ��ÿ������
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0,0,0,0,0,0,0)
	end
	nIsExist = CustomDataRead("tongcitywar_person_task")
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_task", "dddd", 0, 0, 0, 0)
	end
	
	CreateTrigger(2, 1811, 267)
	NewWorld(889,1764,3808)
end

function task_youhuan()
	Say("Th�i th� c�m th�y Tr�i ch� L� Thu�n lo ng�i , g�n ��y d�n ch�ng Th�nh �� l�m than kh� c�c, L� Thu�n m�i t�p h�p m�u ph�n... �ang l�c d�u s�i l�a b�ng, tri�u ��nh c� m�t ch� ��n sai Th�nh �� Th�i th� t�n c�ng H�i Phong tr�i�",
	2,
	"Tuy�n chi�n/task_xuanzhan",
	"K�t th�c ��i tho�i/no_say")
end

tTaskInfo =
{
	{30000, "Tu�n n�y thu ���c 30000 ��ch binh H� gi�p - Gi�i th��ng:", "500 l��ng"},
	{45000, "Tu�n n�y thu ���c 45000 ��ch binh H� gi�p - Gi�i th��ng:", "1200 l��ng"},
	{60000, "Tu�n n�y thu ���c 60000 ��ch binh H� gi�p - Gi�i th��ng:", "2000 l��ng"},
	{90000, "Tu�n n�y thu ���c 90000 ��ch binh H� gi�p - Gi�i th��ng:", "2 t�i huy ch��ng, 1 t�i 50 huy ch��ng"},
	{150000, "Tu�n n�y thu ���c 150000 ��ch binh H� gi�p - Gi�i th��ng:", "4 t�i huy ch��ng, 1 t�i 50 huy ch��ng"},
	{210000, "Tu�n n�y thu ���c 210000 ��ch binh H� gi�p - Gi�i th��ng:", "6 t�i huy ch��ng, 1 t�i 50 huy ch��ng"},
	{300000, "Tu�n n�y thu ���c 300000 ��ch binh H� gi�p - Gi�i th��ng:", "1 m�n v� kh� Ho�ng kim B� Phi Y�n t�y �"},
}

function task_xuanzhan()
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" Bang h�i �� tuy�n chi�n v�i H�i Phong tr�i.",0)
	else
		Say(" Tuy�n chi�n kh�ng ph�i vi�c t�y ti�n, ng��i ph�i huy ��ng m�i ng��i, ti�u di�t ��ch s� l�y ���c l�nh H� gi�p c�a ch�ng, ng��i t� ��nh ra m�c ti�u, tr��c th� b�y ho�n th�nh s� th��ng c�ng h�u h�nh",
			8,
			tTaskInfo[1][2]..tTaskInfo[1][3].."/#task_shouji(1)",
			tTaskInfo[2][2]..tTaskInfo[2][3].."/#task_shouji(2)",
			tTaskInfo[3][2]..tTaskInfo[3][3].."/#task_shouji(3)",
			tTaskInfo[4][2]..tTaskInfo[4][3].."/#task_shouji(4)",
			tTaskInfo[5][2]..tTaskInfo[5][3].."/#task_shouji(5)",
			tTaskInfo[6][2]..tTaskInfo[6][3].."/#task_shouji(6)",
			tTaskInfo[7][2]..tTaskInfo[7][3].."/#task_shouji(7)",
			"Kh�ng nh�n nhi�m v�/no_say")
	end
end

function task_shouji(nType)
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" Bang h�i �� tuy�n chi�n v�i H�i Phong tr�i.",0)
		return
	end
	SetCityWarTask(nMapID, nType)
	Say(" Bang h�i tuy�n chi�n v�i H�i Phong tr�i, tu�n n�y ��nh m�c ti�u:"..tTaskInfo[nType][2]..tTaskInfo[nType][3], 0)
	SendTongMessage(GetName().."M� nhi�m v� tuy�n chi�n v�i H�i Phong tr�i.")
	SendTongMessage("M�c ti�u tu�n n�y:"..tTaskInfo[nType][2]..tTaskInfo[nType][3])
end

function task_zhankuang()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" Tu�n n�y Th�nh Ch� bang ph�i kh�ng tuy�n chi�n v�i H�i Phong tr�i.",0)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		if nItemCount < tTaskInfo[nType][1] then
			Say(" Tu�n n�y �� thu ���c ��ch Binh H� Gi�p <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, v�n ch�a ��t ���c m�c ti�u\nGi�i th��ng chi�m th�nh: <color=green>"..tTaskInfo[nType][3].."<color>",0)
			return
		end
		local szSay = " Tu�n n�y �� thu ���c ��ch Binh H� Gi�p <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, ��t m�c ti�u, c� th� l�nh th��ng.\nGi�i th��ng chi�m th�nh: <color=green>"..tTaskInfo[nType][3].."<color>"
		if szName == szBoss or szName == szManager then
			Say(szSay,3,"L�nh ph�n th��ng bang h�i/task_tong_finish","Hu�n ch��ng th�nh th� ng�u nhi�n/task_person_more","K�t th�c ��i tho�i/no_say")
		else
			Say(szSay,2,"Hu�n ch��ng th�nh th� ng�u nhi�n/task_person_more","K�t th�c ��i tho�i/no_say")
		end
	end
end

function task_tong_finish()
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 then
		Say("Bang h�i c�a ban �� l�nh Ph�n th��ng bang h�i c�a tu�n n�y r�i!",0)
		return
	end
	
	if nType == 0 then
		return
	elseif nType == 1 then
		Earn(5000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 500 l��ng")
		WriteLog(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 500 l��ng")
	elseif nType == 2 then
		Earn(12000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 1200 l��ng")
		WriteLog(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 1200 l��ng")
	elseif nType == 3 then
		Earn(20000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 2000 l��ng")
		WriteLog(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 2000 l��ng")
	elseif nType == 4 then
		if Zgc_pub_goods_add_chk(2,2) == 1 then
			if AddItem(2,0,766,2) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 2 t�i Hu�n ch��ng th�nh th�")
				WriteLog(GetName().."�� nh�n 2 t�i Hu�n ch��ng th�nh th�")
			end
		end
	elseif nType == 5 then
		if Zgc_pub_goods_add_chk(4,4) == 1 then
			if AddItem(2,0,766,4) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 4 t�i Hu�n ch��ng th�nh th�")
				WriteLog(GetName().."�� nh�n 4 t�i Hu�n ch��ng th�nh th�")
			end
		end
	elseif nType == 6 then	
		if Zgc_pub_goods_add_chk(6,6) == 1 then
			if AddItem(2,0,766,6) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: 6 t�i Hu�n ch��ng th�nh th�")
				WriteLog(GetName().."�� nh�n 6 t�i Hu�n ch��ng th�nh th�")
			end
		end
	elseif nType == 7 then
		sel_task_weapon(1)
	end
end

tTaskWeapon = 
{
	{0,3,6001,"Ph� Y�n �ao"},
	{0,5,6002,"Ph� Y�n c�n"},
	{0,8,6003,"Ph� Y�n tr��ng"},
	{0,0,6004,"H�m Y�n th�"},
	{0,1,6005,"T�ng Y�n ch�m"},
	{0,2,6006,"Phi Y�n ki�m"},
	{0,10,6007,"V�n Y�n c�m"},
	{0,0,6008,"V�n Y�n th�"},
	{0,5,6009,"L�u Y�n c�n"},
	{0,2,6010,"Huy�n Y�n ki�m"},
	{0,9,6011,"V� Y�n b�t"},
	{0,6,6012,"H� Ti�m Th��ng"},
	{0,4,6013,"H�nh Y�n Cung"},
	{0,7,6014,"Tr�c Y�n nh�n"},
	{0,11,6015,"Y�u Y�n tr�o"},
}

function sel_task_weapon(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang tr��c/#sel_task_weapon("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tTaskWeapon) then
		nEnd = getn(tTaskWeapon)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tTaskWeapon[i][4].."/#sel_task_weapon_one("..i..")"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tTaskWeapon) then
		tSay[nTabIndex] = "Trang k�/#sel_task_weapon("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "R�i kh�i/no_say"
	
	Say("Xin ch�n V� Kh� B� Phi Y�n mu�n nh�n!",getn(tSay),tSay)
end

function sel_task_weapon_one(nIndex)
	Say("Ng��i �� ch�n "..tTaskWeapon[nIndex][4]..", x�c ��nh ch�?",
		3,
		"��ng �/#sel_task_weapon_yes("..nIndex..")",
		"Ch�n l�i/#sel_task_weapon(1)",
		"K�t th�c ��i tho�i/no_say")
end

function sel_task_weapon_yes(nIndex)
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 or nType ~= 7 then
		return
	end
	if Zgc_pub_goods_add_chk(1,50) == 1 then
		if AddItem(tTaskWeapon[nIndex][1],tTaskWeapon[nIndex][2],tTaskWeapon[nIndex][3],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			SetCityWarTaskAwardFlag(nMapID, 1)
			SendTongMessage(GetName().."L�nh ph�n th��ng bang h�i tu�n n�y: "..tTaskWeapon[nIndex][4].."_1")
			WriteLog("Ph�n th��ng bang h�i "..GetName().."��i "..tTaskWeapon[nIndex][4])
		end
	end
end

function task_person_more()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" Tu�n n�y Th�nh Ch� bang ph�i kh�ng tuy�n chi�n v�i H�i Phong tr�i.",0)
		return
	end
	
	local szMsg = "Bang ph�i Th�nh Ch� ho�n th�nh nhi�m v� to�n m�y ch� xong. N�i trong tu�n ng��i ch�i c� ���c s� c�ng hi�n s� ng�u nhi�n nh�n ���c Hu�n ch��ng th�nh th�. M�i l�n giao <color=yellow>60<color> ��ch binh H� gi�p s� ng�u nhi�n nh�n th�m ���c <color=yellow>1<color> Hu�n ch��ng th�nh th�.? (T�i �a 300 c�i)"

	if nItemCount < tTaskInfo[nType][1] then
		Say(szMsg.."\nTu�n n�y ��ch Binh H� Gi�p thu ���c "..nItemCount.."/"..tTaskInfo[nType][1]..", v�n ch�a ��t m�c ti�u ",0)
		return
	end

	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount > 300 or nJHCount > 300 then
		WriteLog("[C�ng th�nh -qu�n l�] name="..GetName().." event=H� gi�p ng�u nhi�n error=data d� th��ng C="..nSJCount..";J="..nJHCount)
		return
	end
	
	if nDLCount == nil then
		Say(szMsg.."\nTu�n n�y b�n ch�a giao ��ch Binh H� Gi�p, kh�ng th� nh�n ph�n th��ng!",0)
		return
	end
	
	if nSJCount < 60 then
		Say(szMsg.."\nTu�n n�y b�n ch�a giao �� 60 ��ch Binh H� Gi�p, kh�ng th� nh�n ph�n th��ng!",0)
		return
	end
	
	if nSJCount - nJHCount < 60 then
		Say(szMsg.."\nTu�n n�y b�n giao ���c ��ch Binh H� Gi�p <color=yellow>"..nSJCountView.."<color>, trong �� s� l��ng c� th� ��i Hu�n ch��ng th�nh th� l� <color=yellow>"..nSJCount.."<color>, �� s� d�ng <color=yellow>"..nJHCount.."<color> ��ch Binh H� Gi�p ��i Hu�n ch��ng th�nh th�, ph�n c�n d� kh�ng �� ��i Hu�n ch��ng th�nh th�, kh�ng th� nh�n ph�n th��ng!",0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end
	
	local nCount = floor((nSJCount - nJHCount)/60)
	Say(szMsg.."\nTu�n n�y b�n giao ���c ��ch Binh H� Gi�p <color=yellow>"..nSJCountView.."<color>, trong �� s� l��ng c� th� ��i Hu�n ch��ng th�nh th� l� <color=yellow>"..nSJCount.."<color>, �� s� d�ng <color=yellow>"..nJHCount.."<color>��ch Binh H� Gi�p ��i Hu�n ch��ng th�nh th�, ph�n c�n d� c� th� ��i <color=yellow>"..nCount.."<color> Hu�n ch��ng th�nh th�! ��i b�y gi� ch�?",2,"��i Hu�n ch��ng th�nh th�/#task_person_more_yes("..nCount..")","K�t th�c ��i tho�i/no_say")
end

function task_person_more_yes(nCount)
	if AddItem(2,0,765,nCount) == 1 then
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		nJHCount = nJHCount + nCount * 60
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount, nSJCount, nJHCount, nSJCountView)
		Msg2Player("B�n nh�n ���c "..nCount.." Hu�n ch��ng th�nh th�")
		WriteLog(GetName().."��i "..nCount.." Hu�n ch��ng th�nh th� ng�u nhi�n")
	end
end

function task_hujia()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	local szMsg = "M�i l�n giao <color=yellow>10<color> ��ch binh H� gi�p s� nh�n ���c <color=yellow>1<color>Hu�n ch��ng th�nh th�, <color=yellow>v��t qu� 300<color> s� <color=yellow>kh�ng th� ��i<color> Hu�n ch��ng th�nh th�. M�i ng��i m�i tu�n th�ng qua ti�u di�t ��ch c� th� thu ���c t�i �a <color=yellow>600<color> ��ch Binh H� Gi�p "
	if nType > 0 then
		szMsg = szMsg.."\nM�c ti�u nhi�m v� tu�n n�y l� thu th�p ��ch Binh H� Gi�p <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>"
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount >= 300 then
		szMsg = szMsg.."\nTu� n�y �� giao ��ch binh H� gi�p <color=yellow>"..nSJCountView.."/300<color>, v��t qu� <color=yellow>300<color> b� s� kh�ng th� nh�n ���c Hu�n ch��ng th�nh th�, nh�ng s� ���c t�ch l�y qua cho nhi�m v� tuy�n chi�n bang h�i. Giao ch�?"
	else
		szMsg = szMsg.."\nTu� n�y �� giao ��ch binh H� gi�p <color=yellow>"..nSJCountView.."/300<color>, c� ph�i mu�n giao ��ch Binh H� Gi�p. M�i l�n giao 10 ��ch Binh H� Gi�p s� nh�n ���c 1 Hu�n ch��ng th�nh th�. (v��t qu� <color=yellow>300<color> b� s� kh�ng th� nh�n ���c Hu�n ch��ng th�nh th�)"
	end
	Say(szMsg,3,
		"Giao 10 ��ch binh H� gi�p/#task_hujia_sj(10)",
		"Giao 100 ��ch binh H� gi�p/#task_hujia_sj(100)",
		"K�t th�c ��i tho�i/no_say")
end

function task_hujia_sj(nCount)
	local nMaxCount = GetItemCount(2,0,764)
	if nMaxCount < nCount then
		Say("Ng��i kh�ng mang �� ��ch binh H� gi�p "..nCount..", c� ph�i �� qu�n trong r��ng r�i kh�ng?",0)
		return
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCountView > 300 and nSJCount < 300 then
		WriteLog("[C�ng th�nh -qu�n l�] name="..GetName().." event=Giao h� gi�p error=data d� th��ng CV="..nSJCountView..";C="..nSJCount)
		return
	elseif nSJCount > 300 then
		WriteLog("[C�ng th�nh -qu�n l�] name="..GetName().." event=Giao h� gi�p error=data d� th��ng C="..nSJCount)
		return
	end

	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end

	local nDiff = nCount + nSJCount - 300
	local nGiveCount = floor(nCount / 10)
	if nDiff > 0 then
		nGiveCount = floor((nCount-nDiff)/10)
	end
	
	if DelItem(2,0,764,nCount) == 1 then
		local szMsg = "<color=green>Qu�n th�nh s�<color>: "
		local szMsg2 = ""
		if nGiveCount > 0 then
			AddItem(2,0,765,nGiveCount)
			szMsg = "B�n nh�n ���c "..nGiveCount.." Hu�n ch��ng th�nh th�."
			szMsg2 = "B�n nh�n ���c "..nGiveCount.." Hu�n ch��ng th�nh th�."
		end
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount,(nGiveCount*10)+nSJCount,nJHCount,nSJCountView+nCount)
		
		szMsg = szMsg.."\nTu� n�y �� giao ��ch binh H� gi�p <color=yellow>"..(nSJCountView+nCount).."/300<color>."
		szMsg2 = szMsg2.."Tu�n n�y �� giao ��ch binh H� gi�p "..(nSJCountView+nCount).."/300."
		
		local nMapID = GetWorldPos()
		local nType, nItemCount = GetCityWarInfo(nMapID, "task")
		if nType > 0 then			-- ����г�������,���Ͻ��ĵб����׼ӵ��ܼ�������
			SetCityWarTask(nMapID, nType, nCount)
			szMsg = szMsg.."\nM�c ti�u nhi�m v� tu�n n�y l� thu th�p ��ch Binh H� Gi�p <color=yellow>"..(nItemCount+nCount).."/"..tTaskInfo[nType][1].."<color>"
			szMsg2 = szMsg2.."M�c ti�u nhi�m v� tu�n n�y l� thu th�p ��ch Binh H� Gi�p"..(nItemCount+nCount).."/"..tTaskInfo[nType][1]
		end
		Say(szMsg,2,"Ti�p t�c giao ��ch binh H� gi�p /task_hujia", "R�i kh�i/no_say")
		Msg2Player(szMsg2)
	end
end

function task_jiangli()
	Say("C�c h� c� th� d�ng Hu�n ch��ng th�nh th� ��i c�c ph�n th��ng sau: ",
		3,
		"\nM�t t�ch trang b�\n/#task_jiangli_zm(0,0,0)",
		"\nHi�u qu� c��ng h�a\n/#task_jiangli_xg(1)",
		"\nK�t th�c ��i tho�i/no_say")
end

tRoute2Weapon = 
{
	[2] = {{0,3,6001,"Ph� Y�n �ao"}, {0,5,6002,"Ph� Y�n c�n"}},
	[3] = {{0,8,6003,"Ph� Y�n tr��ng"},},
	[4] = {{0,0,6004,"H�m Y�n th�"}},
	[6] = {{0,1,6005,"T�ng Y�n ch�m"}},
	[8] = {{0,2,6006,"Phi Y�n ki�m"}},
	[9] = {{0,10,6007,"V�n Y�n c�m"}},
	[11] = {{0,0,6008,"V�n Y�n th�"}},
	[12] = {{0,5,6009,"L�u Y�n c�n"}},
	[14] = {{0,2,6010,"Huy�n Y�n ki�m"}},
	[15] = {{0,9,6011,"V� Y�n b�t"}},
	[17] = {{0,6,6012,"H� Ti�m Th��ng"}},
	[18] = {{0,4,6013,"H�nh Y�n Cung"}},
	[20] = {{0,7,6014,"Tr�c Y�n nh�n"}},
	[21] = {{0,11,6015,"Y�u Y�n tr�o"}},
}

function task_jiangli_zm(nType,nParam1,nParam2)
	if nType == 0 then
		Say("Ng��i c� th� ch�n c�c ph�n th��ng sau",
			4,
			"Khu�t Nguy�n B�i (C�n 600 Hu�n ch��ng th�nh th�)/#task_jiangli_zm(1,0,0)",
			"��i L�c Th�n H�ng Li�n (C�n 750 Hu�n ch��ng th�nh th�)/#task_jiangli_zm(2,0,0)",
			--"��Ӧ���ɲ����̻ƽ���������Ҫ500���н��£�/#task_jiangli_zm(3,0,0)",
			"L�ng Ba Vi B� (C�n 600 Hu�n ch��ng th�nh th�)/#task_jiangli_zm(4,0,0)",
			"K�t th�c ��i tho�i/no_say")
	elseif nType == 1 then
		Say("��i Khu�t Nguy�n B�i c�n 600 Hu�n ch��ng th�nh th�, ��i ch�?",2,"��ng �/#task_jiangli_zm(11,0,0)","�� ta suy ngh�!/no_say")
	elseif nType == 2 then
		Say("��i ��i L�c Th�n H�ng Li�n c�n 750 Hu�n ch��ng th�nh th�, ��i ch�?",2,"��ng �/#task_jiangli_zm(12,0,0)","�� ta suy ngh�!/no_say")
	elseif nType == 3 then
		local nRoute = GetPlayerRoute()
		if tRoute2Weapon[nRoute] == nil then
			Say("Ng��i v�n ch�a gia nh�p L�u ph�i n�o, ch�a th� nh�n V� Kh� B� Phi Y�n.",0)
			return
		end
		if getn(tRoute2Weapon[nRoute]) > 1 then
			local tSay = {}
			for index, value in tRoute2Weapon[nRoute] do
				tSay[index] = value[4].."/#task_jiangli_zm(10,"..nRoute..","..index..")"
			end
			Say("Ng��i c� th� ch�n 1 m�n v� kh� Ho�ng Kim t�y �",getn(tSay),tSay)
		else
			Say("��i "..tRoute2Weapon[nRoute][1][4].." c�n 500 Hu�n ch��ng th�nh th�, ��i ch�?",2,"��ng �/#task_jiangli_zm(13,"..nRoute..",1)", "�� ta suy ngh�!/no_say")
		end
	elseif nType == 4 then
		Say("��i L�ng Ba Vi B� c�n 600 Hu�n ch��ng th�nh th�, ��i ch�?",2,"��ng �/#task_jiangli_zm(14,0,0)","�� ta suy ngh�!/no_say")
	elseif nType == 10 then
		Say("��i "..tRoute2Weapon[nParam1][nParam2][4].." c�n 900 Hu�n ch��ng th�nh th�, ��i ch�?",2,"��ng �/#task_jiangli_zm(13,"..nParam1..","..nParam2..")", "�� ta suy ngh�!/no_say")
	elseif nType == 11 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,102,27,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B�n �� ��i 1 Khu�t Nguy�n B�i ")
				WriteLog(GetName().." �� ��i 1 Khu�t Nguy�n B�i ")
			else
				Say("C�c h� kh�ng c� �� Hu�n ch��ng th�nh th�.",0)
			end
		end
	elseif nType == 12 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,750) == 1 then
				AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B�n �� ��i ��i L�c Th�n h�ng li�n")
				WriteLog(GetName().."�� ��i ��i L�c Th�n h�ng li�n")
			else
				Say("C�c h� kh�ng c� �� Hu�n ch��ng th�nh th�.",0)
			end
		end
	elseif nType == 13 then
		if tRoute2Weapon[nParam1][nParam2] == nil then
			return
		end
		if Zgc_pub_goods_add_chk(1,50) == 1 then
			if DelItem(2,0,765,500) == 1 then
				AddItem(tRoute2Weapon[nParam1][nParam2][1],tRoute2Weapon[nParam1][nParam2][2],tRoute2Weapon[nParam1][nParam2][3],1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B�n �� ��i "..tRoute2Weapon[nParam1][nParam2][4])
				WriteLog(GetName().."��i "..tRoute2Weapon[nParam1][nParam2][4])
			else
				Say("C�c h� kh�ng c� �� Hu�n ch��ng th�nh th�.",0)
			end
		end
	elseif nType == 14 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,112,78,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("B�n �� ��i L�ng Ba Vi B�")
				WriteLog(GetName().."�� ��i L�ng Ba Vi B�")
			else
				Say("C�c h� kh�ng c� �� Hu�n ch��ng th�nh th�.",0)
			end
		end
	end
end

tMagicAttr=
{
	{"state_add_vitality",				30, 194400,"G�n c�t t�ng 30 (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_add_strength", 				30, 194400,"S�c m�nh t�ng 30 (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_add_dexterity", 			30, 194400,"Th�n ph�p t�ng 30 (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_add_observe",				30, 194400,"Linh ho�t t�ng 30 (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_add_energy",				30, 194400,"N�i c�ng t�ng 30 (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_add_allability",			20, 194400,"To�n b� thu�c t�nh t�ng 20 (C�n 10 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 150)",10,150},
	{"state_life_max_percent_add",		10,	194400,"Sinh l�c t�ng 10% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_receive_half_damage", 		10, 194400,"Gi�m s�t th��ng khi th� th��ng 10% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_inc_exp_gain", 				5,  194400,"Kinh nghi�m nh�n ���c t�ng 5% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_paralysis_time_dec",		30, 194400,"Gi�m th�i gian t� li�t 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_vertigo_time_dec",          30, 194400,"R�t ng�n th�i gian h�n m� 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_fetter_time_dec",           30, 194400,"R�t ng�n th�i gian ��nh th�n 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_confusion_time_dec",        30, 194400,"R�t ng�n th�i gian h�n lo�n 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_sleep_time_dec",            30, 194400,"R�t ng�n th�i gian ng� m� 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_attack_burst_dec_time_dec", 30, 194400,"Gi�m th�i gian l�m ch�m 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_slow_time_dec",             30, 194400,"R�t ng�n th�i gian gi�m t�c 30% (C�n 5 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 75)",5,75},
	{"state_p_attack_percent_add",		8, 194400,"T�ng ngo�i c�ng 8% (C�n 6 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 90)",6,90},
	{"state_m_attack_percent_add",		8, 194400,"T�ng N�i c�ng 8% (C�n 6 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 90)",6,90},
	{"state_damage_point",				30, 194400,"T�ng s�t th��ng 30 (C�n 6 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 90)",6,90},
	{"state_move_speed_percent_add", 	10, 194400,"T�ng t�c �� di chuy�n 10% (C�n 10 Hu�n ch��ng th�nh th� ho�c ��ch Binh H� Gi�p 150)",10,150},
}

function task_jiangli_xg(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang tr��c/#task_jiangli_xg("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tMagicAttr) then
		nEnd = getn(tMagicAttr)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tMagicAttr[i][4].."/#task_jiangli_xg_buy("..i..",0)"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tMagicAttr) then
		tSay[nTabIndex] = "Trang k�/#task_jiangli_xg("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "R�i kh�i/no_say"
	
	Say("Hi�u qu� n�y kh�ng th� d�ng chung v�i lo�i kh�c, duy tr� 3 gi�, r�i m�ng ho�c t� vong ��u b�o l�u, nh�ng trong m�t v�i tr��ng h�p ��c bi�t s� b� c��ng ch� h�y b�",getn(tSay),tSay)
end

function task_jiangli_xg_buy(nIndex,nParam)
	if nParam == 0 then
		Say("��i "..tMagicAttr[nIndex][4].."C�n"..tMagicAttr[nIndex][5].." Hu�n ch��ng th�nh th� ho�c c�n "..tMagicAttr[nIndex][6].." ��ch Binh H� Gi�p, ��i ch�?\n<color=red>N�u hi�u qu� lo�i n�y �� t�n t�i, ��i lo�i m�i s� c� hi�u qu� <color>",
			4,
			"D�ng Hu�n ch��ng th�nh th� ��i /#task_jiangli_xg_buy("..nIndex..",1)",
			"D�ng ��ch Binh H� Gi�p ��i /#task_jiangli_xg_buy("..nIndex..",2)",
			"V� trang tr��c/#task_jiangli_xg(1)",
			"�� ta suy ngh�!/no_say")
	elseif nParam == 1 then
		if DelItem(2,0,765,tMagicAttr[nIndex][5]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("Ng��i kh�ng mang theo �� Hu�n ch��ng th�nh th�",0)
		end
	elseif nParam == 2 then
		if DelItem(2,0,764,tMagicAttr[nIndex][6]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("Ng��i kh�ng mang theo �� ��ch Binh H� Gi�p ",0)
		end
	end
end

function get_title_again()
	local nMapID = GetWorldPos()
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local szName = GetName()
	local n, szBoss = GetCityWarInfo(nMapID, "boss")
	if szBoss == szName then
		local tBossTitle =
		{
			[100] = {5},
			[300] = {1},
			[350] = {9},
		}
		AddTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		SetCurTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		Say("Ta �� gi�p ng��i ph�c h�i l�i X�ng hi�u r�i!", 0)
		return
	end
	
	local n, szManager = GetCityWarInfo(nMapID, "manager")
	if szManager == szName then
		local tManagerTitle =
		{
			[100] = {7},
			[300] = {3},
			[350] = {11},
		}
		AddTitle(51, tManagerTitle[nMapID][1])
		SetCurTitle(51, tManagerTitle[nMapID][1])
		Say("Ta �� gi�p ng��i ph�c h�i l�i X�ng hi�u r�i!", 0)
		return
	end
	
	local n, szF1, szF2, szF3, szF4 = GetCityWarInfo(nMapID, "fighter")
	if szName == szF1 or szName == szF2 or szName == szF3 or szName == szF4 then
		local tFighterTitle =
		{
			[100] = {8},
			[300] = {4},
			[350] = {12},
		}
		AddTitle(51, tFighterTitle[nMapID][1])
		SetCurTitle(51, tFighterTitle[nMapID][1])
		Say("Ta �� gi�p ng��i ph�c h�i l�i X�ng hi�u r�i!", 0)
		return
	end
	Say("Ng��i kh�ng c� ch�c v� g� � th�nh n�y, kh�ng th� ph�c h�i X�ng hi�u!", 0)
end

function shou_zhuang()
	Say("N�u c�c h� kh�ng mu�n s� d�ng Trang b� X�ng hi�u, ta s� thu h�i l�i rang b� n�y. Xin ��t l�i c�c trang b� mu�n thu h�i v�o hang trang!",
		5,
		"Thu h�i trang b� Th�nh Ch�/hui_taishou",
		"Thu h�i trang b� Qu�n S�/hui_shiye",
		"Thu h�i trang b� Danh B�/hui_tixia",
		"Thu h�i Trang b� V� binh/hui_weibin",
		"R�i kh�i/no_say")
end

function hui_taishou()
	Say("<color=green>Qu�n l� th�nh th�<color>: C�c h� x�c nh�n mu�n thu h�i trang b� Th�nh Ch� trong h�nh trang?", 2, "��ng �/yes_hui_taishou", "�� ta suy ngh�!/no_say")
end

function yes_hui_taishou()
	local nBeDelete = 0
	for i=8013, 8016 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Th�nh Ch�]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Th�nh Ch�]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Th�nh Ch�]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8013,8020 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Th�nh Ch�]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu�n l� th�nh th�<color>: �� thu h�i trang b� Th�nh Ch� trong h�nh trang th�nh c�ng", 0)
	else
		Say("<color=green>Qu�n l� th�nh th�<color>: Trong h�nh trang c�c h� kh�ng c� trang b� Th�nh Ch�.", 0)
	end
end

function hui_shiye()
	Say("<color=green>Qu�n l� th�nh th�<color>: C�c h� x�c nh�n mu�n thu h�i trang b� Qu�n S� trong h�nh trang? ", 2, "��ng �/yes_hui_shiye", "�� ta suy ngh�!/no_say")
end

function yes_hui_shiye()
	local nBeDelete = 0
	if DelItem(0,102,8021,1) == 1 then
		WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Qu�n S�]: "..GetName()..";102,8021")
		nBeDelete = 1
	end
	if DelItem(0,102,8022,1) == 1 then
		WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Qu�n S�]: "..GetName()..";102,8022")
		nBeDelete = 1
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu�n l� th�nh th�<color>: �� thu h�i th�nh c�ng trang b� Qu�n S�", 0)
	else
		Say("<color=green>Qu�n l� th�nh th�<color>: Trong h�nh trang kh�ng c� trang b� Qu�n S�", 0)
	end
end

function hui_tixia()
	Say("<color=green>Qu�n l� th�nh th�<color>: C�c h� x�c nh�n mu�n thu h�i trang b� Danh B� trong h�nh trang?", 2, "��ng �/yes_hui_tixia", "�� ta suy ngh�!/no_say")
end

function yes_hui_tixia()
	local nBeDelete = 0
	for i=8005, 8008 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Danh B�]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Danh B�]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Danh B�]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Danh B�]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8023,8026 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-Thu h�i trang b� Danh B�]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>Qu�n l� th�nh th�<color>: �� thu h�i th�nh c�ng trang b� Danh B�.", 0)
	else
		Say("<color=green>Qu�n l� th�nh th�<color>: Trong h�nh trang kh�ng c� trang b� Danh B�.", 0)
	end
end

function hui_weibin()
	Say("C�c h� x�c ��nh mu�n thu h�i Trang b� V� binh trong h�nh trang?", 2, "��ng �/yes_hui_weibin", "�� ta suy ngh�!/no_say")
end

function yes_hui_weibin()
	local nBeDelete = 0
	for i=8009, 8012 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i Trang b� V� binh]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i Trang b� V� binh]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i Trang b� V� binh]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i Trang b� V� binh]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	for i=0,3 do
		if DelItem(0,110,221+i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i V� Binh trangThu h�i ]:"..GetName()..";110,"..(224+i))
			nBeDelete = 1
		end
		if DelItem(0,108,481+i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i V� Binh trangThu h�i ]:"..GetName()..";108,"..(481+i))
			nBeDelete = 1
		end
		if DelItem(0,109,491+i,1) == 1 then
			WriteLog("[C�ng th�nh chi�n-thu h�i V� Binh trangThu h�i ]:"..GetName()..";109,"..(491+i))
			nBeDelete = 1
		end
	end
	
	if nBeDelete == 1 then
		Say("�� thu h�i th�nh c�ng Trang b� V� binh trong h�nh trang!", 0)
	else
		Say("H�nh trang c�a ng��i kh�ng c� Trang b� V� binh", 0)
	end
end

function fuli_city()
	Say("Ng��i ch�i c� X�ng hi�u ��c bi�t c� th� l�nh ho�c ch� t�o trang b� ��c bi�t, to�n b� th�nh vi�n trong bang h�i ��u c� th� l�nh V� binh Kh�i gi�p",
		6,
		"Ch� t�o trang b� Th�nh Ch�/mk_taishou_equip",
		"Ch� t�o trang b� Danh B�/mk_tixia_equip",
		"Ch� t�o trang b� Qu�n S�/get_shiye_equip",
		"L�nh Trang b� V� binh/get_weibing_suit",
		"��i trang b� Th�nh Ch� m�i/#change_old_taishou_equip(0)",
		"Ta ch� gh� ch�i/no_say")
end

function change_old_taishou_equip(nParam)
	local nWhen = 1196028000			-- 2007-11-26 6:00 AM
	local nBody = GetBody() - 1
	if nParam == 0 then
		Say("<color=green>Qu�n l� th�nh th�<color>: Ta c� th� l�y trang b� Th�nh Ch� (qu�n ch�) c� ��i th�nh trang b� m�i m�nh h�n.",
			3,
			--"��ȡ�µĳ���(����)ս��/#change_old_taishou_equip(1)",
			"��i Th�nh Ch� (qu�n ch�) chi�n gi�p/#change_old_taishou_equip(2)",
			"��i Th�nh Ch� (qu�n ch�) chi�n trang/#change_old_taishou_equip(3)",
			--"��ȡ�µĳ���(����)��ӡ/#change_old_taishou_equip(4)",
			--"��ȡ�µĳ���(����)����/#change_old_taishou_equip(5)",
			"K�t th�c ��i tho�i/no_say")
	elseif nParam == 1 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(0)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu�n l� th�nh th�<color>: Th�nh Ch� (qu�n ch�) chi�n kh�i c�a c�c h� l� m�i, kh�ng c�n ph�i ��i l�i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,103,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."��i Th�nh Ch� chi�n kh�i;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu�n l� th�nh th�<color>: H�y mang tr�n ng��i Th�nh Ch� (qu�n ch�) chi�n kh�i r�i quay l�i ��y.",0)
		end
	elseif nParam == 2 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(1)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu�n l� th�nh th�<color>: Th�nh Ch� (qu�n ch�) chi�n gi�p c�a c�c h� l� m�i, kh�ng c�n ph�i ��i l�i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,100,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."��i Th�nh Ch� chi�n gi�p;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu�n l� th�nh th�<color>: H�y mang tr�n ng��i Th�nh Ch� (qu�n ch�) chi�n gi�p r�i quay l�i ��y.",0)
		end
	elseif nParam == 3 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(3)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu�n l� th�nh th�<color>: Th�nh Ch� qu�n ch�) chi�n trang c�a c�c h� �� ��i m�i, kh�ng c�n ph�i ��i l�i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,101,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."��i Th�nh Ch� chi�n gi�p;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu�n l� th�nh th�<color>: H�y mang tr�n ng��i Th�nh Ch� (qu�n ch�) chi�n trang r�i quay l�i ��y",0)
		end
	elseif nParam == 4 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8013 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu�n l� th�nh th�<color>: Th�nh Ch� (Qu�n Ch�a) kim �n c�a c�c h� �� ��i m�i, kh�ng c�n ph�i ��i l�i.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."��i Th�nh Ch� kim �n;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu�n l� th�nh th�<color>: H�y mang Th�nh Ch� (Qu�n Ch�a) kim �n r�i l�i ��y.",0)
		end
	elseif nParam == 5 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8017 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8017 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu�n l� th�nh th�<color>: Th�nh Ch� (Qu�n Ch�a) ng�c b�i c�a c�c h� �� ��i m�i, kh�ng c�n ph�i ��i th�m",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8017+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."��i Th�nh Ch� ng�c b�i;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>Qu�n l� th�nh th�<color>: Xin h�y mang Th�nh Ch� (Qu�n Ch�a) ng�c b�i r�i ��n ��y l�i.",0)
		end
	end
end

function manage_city()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")

	local ldiff = nTime - GetTime()
	local nDay = floor(ldiff / 86400)
	local nHour = floor(mod(ldiff, 86400) / 3600)
	local nMin = floor(mod(ldiff, 3600) / 60)
	local nSec = mod(ldiff, 60)
	
	if nCount == 0 then
		if GetTongName() ~= szTongName then		-- ����ռ����еİ��ɶԻ�
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")			
			Say("Th�nh n�y do <color=yellow>"..szTongViewName.."<color> chi�m l�nh", 0)
		else										-- ��ռ����еİ��ɶԻ�
			if IsTongMaster() == 1 then				-- �ǰ���
				yes_get_boss()
			else
				Say("Th�nh n�y do Qu� bang chi�m l�nh", 0)
			end
		end
	else
		local szSelfName = GetName()
		if szBoss == szSelfName or szManager == szSelfName then		-- �������ʦ
			local tTab = 
			{
				"Nh�n Th�nh �� �n/manager_getarchivebox",
				--"��ȡ������/manager_getmoney",
				--"����˰��/manager_setcess",
				"L�nh B�o r��ng t�i nguy�n/res_box_add",
				"K�t th�c ��i tho�i/no_say"
			}
			Say("Th�nh n�y do Qu� bang chi�m l�nh", getn(tTab), tTab)
		elseif GetTongName() == szTongName then
			Say("Th�nh n�y do Qu� bang chi�m l�nh", 1, "R�i kh�i/no_say")
		else
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")
			Say("Th�nh n�y do <color=yellow>"..szTongViewName.."<color> chi�m l�nh", 0)
		end
	end
end

function mk_taishou_equip()
	Say("<color=green>Qu�n l� th�nh th�<color>: Trang b� Th�nh Ch� c� th�i h�n v�nh c�u, nh�ng m�t khi m�t �i danh hi�u Th�nh Ch� th� s� kh�ng mang ���c, v� cho d� mang l�n ���c th� c�ng kh�ng c� b�t k� hi�u �ng n�o.",
		7,
		"Ch� t�o Th�nh Ch� (Qu�n Ch�a) chi�n kh�i (8 h�a th� b�ch + 15 ho�ng kim ��i h�ng bao)/#mk_taishou_ep(10,103,8013)",  --0��103��8013--0��103��8016
		"Ch� t�o Th�nh Ch� (Qu�n Ch�a) chi�n gi�p (8 h�a th� b�ch + 15 ho�ng kim ��i h�ng bao)/#mk_taishou_ep(10,100,8013)",   --0��100��8013--0��100��8016
		"Ch� t�o Th�nh Ch� (Qu�n Ch�a) chi�n trang (8 h�a th� b�ch + 15 ho�ng kim ��i h�ng bao)/#mk_taishou_ep(12,101,8013)",   --0��101��8013--0��101��8016
		"Ch� t�o Th�nh Ch� (Qu�n Ch�a) ng�c b�i (8 h�a th� b�ch + 15 ho�ng kim ��i h�ng bao)/#mk_taishou_ep(8,102,8017)", --0��102��8017--0��102��8020
		"Ch� t�o Th�nh Ch� (Qu�n Ch�a) kim �n (8 h�a th� b�ch + 15 ho�ng kim ��i h�ng bao)/#mk_taishou_ep(0,102,8013)", --0��102��8013--0��102��8016
		"Nh�n Th�nh Ch� (Qu�n Ch�a) ngo�i trang/#mk_taishou_ep_3(0,109,300)",  --0��109��300 --0��109��303
		"R�i kh�i/no_say")
end

function mk_taishou_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B�n �� c� v�t ph�m n�y r�i!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 8 or GetItemCount(2, 1, 539) < 15 then
		Talk(1, "", "H�nh trang kh�ng �� h�a th� b�ch ho�c ho�ng kim ��i h�ng bao.");
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh�ng ph�i l� Th�nh Ch� c�a th�nh n�y, kh�ng th� nh�n ���c lo�i trang b� n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[C�ng th�nh chi�n]:"..GetName().."Ch� ra 1 trang b� Th�nh Ch� (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			if nDetail == 109 then
				local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
				SetItemExpireTime(nIndex, nTime - GetTime())
			else
				AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			end
			WriteLog("[C�ng th�nh chi�n]:"..GetName().."Ch� ra 1 trang b� Th�nh Ch� (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	end
end

function mk_taishou_ep_1(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8013 + nBody) > 0 then
		Say("B�n �� c� v�t ph�m n�y r�i!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("Ban kh�ng mang theo �� N� Oa Tinh Th�ch"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh�ng ph�i l� Th�nh Ch� c�a th�nh n�y, kh�ng th� nh�n ���c lo�i trang b� n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,100,8013+nBody,1,1,4,394,-1,-1,-1,-1)
		WriteLog("[C�ng th�nh chi�n]:"..GetName().."Ch� ra 1 trang b� Th�nh Ch�+ s�t th��ng(0,100"..(8013+nBody)..")")
	end
end

function mk_taishou_ep_3(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B�n �� c� v�t ph�m n�y r�i!", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh�ng ph�i l� Th�nh Ch� c�a th�nh n�y, kh�ng th� nh�n ���c lo�i trang b� n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end	

	if nDetail == 109 then
			local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
			SetItemExpireTime(nIndex, nTime - GetTime())
	end
end

function mk_taishou_ep_2(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,101,8013 + nBody) > 0 then
		Say("B�n �� c� v�t ph�m n�y r�i!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("Ban kh�ng mang theo �� N� Oa Tinh Th�ch"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("Kh�ng ph�i l� Th�nh Ch� c�a th�nh n�y, kh�ng th� nh�n ���c lo�i trang b� n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,101,8013+nBody,1,1,2,268,-1,-1,-1,-1)
		WriteLog("[C�ng th�nh chi�n]:"..GetName().."Ch� ra 1 trang b� Th�nh Ch�+ s�t th��ng(0,101"..(8013+nBody)..")")
	end
end

function mk_tixia_equip()
	Say("<color=green>Qu�n l� th�nh th�<color>: Trang b� Danh B� c� th�i h�n v�nh c�u, nh�ng m�t khi m�t �i danh hi�u Th�nh Ch� th� s� kh�ng mang ���c v� cho d� mang l�n ���c th� c�ng kh�ng c� b�t k� hi�u �ng n�o.",
		7,
		"Ch� t�o Danh B� chi�n kh�i (4 h�a th� b�ch + 6 ho�ng kim ��i h�ng bao)/#mk_tixia_ep(0,103,8005)",  	--0��103��8005--0��103��8008
		"Ch� t�o Danh B� chi�n gi�p (4 h�a th� b�ch + 6 ho�ng kim ��i h�ng bao)/#mk_tixia_ep(0,100,8005)",  	--0��100��8005--0��100��8008
		"Ch� t�o Danh B� chi�n trang (4 h�a th� b�ch + 6 ho�ng kim ��i h�ng bao)/#mk_tixia_ep(0,101,8005)",  	--0��101��8005 -0��101��8008
		"Ch� t�o Danh B� li�n kh�o  (4 h�a th� b�ch + 6 ho�ng kim ��i h�ng bao)/#mk_tixia_ep(0,102,8005)",						--0��102��8005--0��102��8008
		"Ch� t�o Danh B� l�nh (4 h�a th� b�ch + 6 ho�ng kim ��i h�ng bao)/#mk_tixia_ep(0,102,8023)",                    	--0��102��8023--0��102��8026
		"Nh�n Danh B� ngo�i trang/mk_tixia_wai",
		"R�i kh�i/no_say")
end

function mk_tixia_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("B�n �� c� v�t ph�m n�y r�i!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 4 or GetItemCount(2, 1, 539) < 6 then
		Talk(1, "", "H�nh trang kh�ng �� h�a th� b�ch ho�c ho�ng kim ��i h�ng bao.");
		return
	end
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("C�c h� kh�ng ph�i l� Danh B� th�nh n�y, kh�ng th� nh�n lo�i trang b� n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			Msg2Player("C�c h� nh�n ���c 1 trang b� Danh B�")
			WriteLog("[C�ng th�nh chi�n]:"..GetName().."Ch� t�o 1 trang b� Danh B� (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[C�ng th�nh chi�n]:"..GetName().."Ch� t�o 1 trang b� Danh B� (0,"..nDetail..","..(nParticular+nBody)..")")
			Msg2Player("C�c h� nh�n ���c 1 trang b� Danh B�")
		end
	end
end

function mk_tixia_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,308+nBody) > 0 and BigGetItemCount(0,108,300+nBody) > 0 and
	 	BigGetItemCount(0,110,300+nBody) > 0 then
		Say("C�c h� �� c� �� b� trang b� Danh B� r�i.", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("C�c h� kh�ng ph�i l� Danh B� th�nh n�y, kh�ng th� nh�n lo�i trang b� n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(3, 150) == 0 then
		return
	end
	
	if BigGetItemCount(0,109,308+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,308+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("C�c h� �� c� �� 1 b� ngo�i trang Danh B� r�i.")
end

function get_shiye_equip()
	Say("<color=green>Qu�n l� th�nh th�<color>: Trang b� Qu�n S� ���c h�p b�i ngo�i trang Qu�n S� v� 1 b� trang s�c Qu�n S�",
		4,
		"Ch� t�o trang s�c Tr� Gi� C�m Nang (5 h�a th� b�ch + 7 ho�ng kim ��i h�ng bao)/mk_shiye_ring_1",
		"Ch� t�o trang s�c Th�nh Hi�n Ng�c B�i (5 h�a th� b�ch + 7 ho�ng kim ��i h�ng bao)/mk_shiye_ring_2",
		"Nh�n ngo�i trang Qu�n S�/mk_shiye_wai",
		"R�i kh�i/no_say")
end

function mk_shiye_ring_1()
	if BigGetItemCount(0,102,8021) > 0 then
		Say("C�c h� �� c� Tr� Gi� C�m Nang r�i.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "H�nh trang kh�ng �� h�a th� b�ch ho�c ho�ng kim ��i h�ng bao.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("��i hi�p kh�ng ph�i l� Qu�n S� th�nh n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8021) < 1 then
			local nResult, nIndex = AddItem(0,102,8021, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("��i hi�p nh�n ���c 1 Tr� Gi� C�m Nang")
	end
end

function mk_shiye_ring_2()
	if BigGetItemCount(0,102,8022) > 0 then
		Say("C�c h� �� c� Th�nh Hi�n Ng�c B�i r�i.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "H�nh trang kh�ng �� h�a th� b�ch ho�c ho�ng kim ��i h�ng bao.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("��i hi�p kh�ng ph�i l� Qu�n S� th�nh n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8022) < 1 then
			local nResult, nIndex = AddItem(0,102,8022, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("��i hi�p nh�n ���c 1 Th�nh Hi�n Ng�c B�i.")
	end
end

function mk_shiye_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,304+nBody) > 0 then
		Say("��i hi�p �� �� 1 b� ngo�i trang Qu�n S�", 0)
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("��i hi�p kh�ng ph�i l� Qu�n S� th�nh n�y.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if BigGetItemCount(0,109,304+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,304+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("��i hi�p thu ���c ngo�i trang Qu�n S�.")
end

function get_weibing_suit()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8009+nBody) > 0 and BigGetItemCount(0,101,8009+nBody) > 0 and
		BigGetItemCount(0,103,8009+nBody) > 0 and BigGetItemCount(0,102,8009+nBody) > 0 and
		BigGetItemCount(0,110,221+nBody) > 0 and BigGetItemCount(0,108,481+nBody) > 0 and
		BigGetItemCount(0,109,491+nBody) > 0 then
		
		Say("B�n �� c� 1 b� V� binh Kh�i gi�p!", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(6, 250) == 0 then
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	
	if BigGetItemCount(0,100,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,100,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,101,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,101,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,103,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,103,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,102,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,102,8009+nBody,1,1,-1,-1,-1,-1,-1,-1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,221+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,221+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,481+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,481+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,109,491+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,491+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	Msg2Player("B�n nh�n ���c 1 b� V� binh Kh�i gi�p")
end

function yes_get_boss()
	local nMapID = GetWorldPos()
	local tMapTitleID =
	{
		[300] = {51, 1},
		[100] = {51, 5},
		[350] = {51, 9},
	}
	if tMapTitleID[nMapID] == nil then		-- ������
		Talk(1,"","<color=red>S� d�ng script [C�ng th�nh chi�n] b� nhi�m Th�nh Ch� l�i! Xin h�y b�o l�i cho nh� ph�t h�nh!!<color>")
		return
	end
	
	local nRet = SetCityWarPlayerDuty(nMapID, 0)
	if nRet == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nRet == 1 then
		Say("Th�nh th� n�y �� c� 1 Th�nh Ch� ho�c ng��i �� c� m�t ch�c v� kh�c, kh�ng th� nh�n th�m ch�c t��c.", 0)
	elseif nRet == 0 then
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nDetail = tMapTitleID[nMapID][2] + GetSex() - 1
		AddTitle(tMapTitleID[nMapID][1], nDetail)
		SetCurTitle(tMapTitleID[nMapID][1], nDetail)
		SaveNow()
		Say("B�n ��m nh�n ch�c "..get_tong_sex_name(), 2, "V�o Qu�n l� th�nh th�/manage_city", "R�i kh�i/no_say")
		WriteLog("C�ng th�nh chi�n-Qu�n l�:"..GetTongName().."-"..GetName().." tr� th�nh Th�nh Ch�")
	end
end

function manager_getarchivebox()
	if Zgc_pub_goods_add_chk(1, 1) == 0 then		-- ����ж�Ҫ��������ΪCanGetArchiveBox�����ɹ�����Ϊ��ȡ�ɹ���
		return
	end
	local nMapID = GetWorldPos()
	local nRet = CanGetArchiveBox(nMapID)
	if nRet == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nRet == 7 then
		Say("Qu� bang �� nh�n Th�nh �� �n r�i", 0)
	elseif nRet == 5 or nRet == 6 then
		Say("Ch� c� Th�nh Ch� m�i c� th� nh�n ���c Th�nh �� �n", 0)
	elseif nRet == 0 then
		local _, nIdx = AddItem(2 ,1 ,1207 ,1 , 1)
		local nMapID = GetWorldPos()
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nExpireTime = nTime - GetTime() - 64800
		if nExpireTime < 0 then								-- �����ˣ����ٸ����3��ʱ���
			nExpireTime = 3 * 24 * 3600
		end
		SetItemParam(nIdx, 0, nMapID)						-- �ĸ����е�
		SetItemParam(nIdx, 1, 0)							-- ��ʦ������
		SetItemParam(nIdx, 2, 0)							-- ����������
		SetItemExpireTime(nIdx, nExpireTime)				-- ��Ʒ��ʱ����ʧ
		SaveNow()
		Msg2Player("Thu ���c 1 Th�nh �� �n")
		SendTongMessage(GetName().."�� nh�n ���c Th�nh �� �n")
		WriteLog("C�ng th�nh chi�n-Qu�n l�:"..GetTongName().."-"..GetName().."R�t ���c 1 Th�nh �� �n")
	end
end

function manager_getmoney()
	
end

function yes_get_money(nGold)
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 0)
	if nCD == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nCD > 2100000000 then
		print("Kh�ng c� thao t�c n�y ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("C�n c�n "..nHour.."h "..nMin.." Ph�t "..nSec.." gi�y n�a m�i ti�n h�nh ���c thao t�c n�y!", 0)
	elseif nCD == 0 then
		local _1, _2, _3, _4, nMoney = GetCityWarInfo(nMapID, "base")
		local nGetMaxMoney = (1000000 + (GetLevel() - 1) * 500000) * 2
		
		local nMax = 0
		if nGold < nGetMaxMoney then
			nMax = nGold
		else
			nMax = nGetMaxMoney
		end
		if nGold <= nMax then
			-- ����ǰ�����⻹����Ͳ���Ҫ����ʾ��..ֱ�ӷ�ɱ
			local nMapID = GetWorldPos()
			local nRet = GetCityWarMoney(nMapID, nMax)
		end
	end
end

function manager_setcess()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore = GetCityWarInfo(nMapID, "base")
	if szTongName == nil then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
		return
	end
	Say("Qu� bang �� thi�t l�p thu� su�t bu�n b�n l� <color=yellow>"..(nCessBuysell / 10).."%<color>, thu� b�y b�n l� <color=yellow>"..(nCessStore / 10).."%<color>. C� ph�i mu�n thay ��i?",
		2, --"��������˰/change_mai_cess", 
		"Thay ��i thu� b�y b�n/change_bai_cess",
		"R�i kh�i/no_say")
end

function change_mai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 1)
	if nCD == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nCD > 2100000000 then
		print("Kh�ng c� thao t�c n�y ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("C�n c�n "..nHour.."h "..nMin.." Ph�t "..nSec.." gi�y n�a m�i ti�n h�nh ���c thao t�c n�y!", 0)
	elseif nCD == 0 then
		AskClientForNumber("yes_change_mai_cess", 0, 100, "��n v�: ph�n ng�n")
	end
end

function change_bai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 2)
	if nCD == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nCD > 2100000000 then
		print("Kh�ng c� thao t�c n�y ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("C�n c�n "..nHour.."h "..nMin.." Ph�t "..nSec.." gi�y n�a m�i ti�n h�nh ���c thao t�c n�y!", 0)
	elseif nCD == 0 then
		AskClientForNumber("yes_change_bai_cess", 0, 100, "��n v�: ph�n ng�n")
	end
end

function yes_change_mai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 0, n)
		if nRet == 0 then
			Msg2Player("B�n �� thi�t l�p thu� mua b�n l�: "..(n / 10).."%")
		end
	end
end

function yes_change_bai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 1, n)
		if nRet == 0 then
			Msg2Player("B�n �� thi�t l�p thu� b�y b�n l�: "..(n / 10).."%")
		end
	end
end

function res_box_add()
	--��ȡȨ���ж�
	local nMapID, nDuty = GetCityWarDutyFlag()
	local Map_ID_player = GetWorldPos()
	if Map_ID_player ~= nMapID or (nDuty ~= 1 and nDuty ~= 0 )then
		Talk(1,"","<color=yellow>Qu�n l� th�nh th�<color>: Ch� c� b�n <color=yellow> Th�nh Ch� <color>v� <color=yellow>Qu�n S�<color> m�i c� th� nh�n ���c <color=yellow> b�o r��ng t�i nguy�n<color>?")
		return
	end
	--ʱ����ж�
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local nDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H"))
	if (nDay == 3 and nHour < 21) or nDay == 0 or nDay == 1 or nDay == 2 or nDay == 6 or nDay == 5 then
		Talk(1,"","Th�i gian �� l�nh <color=yellow>B�o r��ng t�i nguy�n<color> l� gi�a th�i gian <color=yellow>B�o h� t�i nguy�n chi�n (m�i t�i th� T� t� 19h-20h)<color> v� <color=yellow>th� N�m<color> m�i tu�n")
		return
	end
	--�Ի�
	local box_num = GetCityBoxCount(Map_ID_player) - 10	
	if box_num <= 0 then
		Talk(1,"","Hi�n kh�ng c� <color=yellow>B�o r��ng t�i nguy�n<color> n�o �� l�nh!")
		return
	else
		Say("Tu�n n�y qu� bang c�n <color=yellow>"..box_num.."<color> <color=yellow>B�o r��ng t�i nguy�n<color> c� th� l�nh! B�y gi� l�nh ch�?",
		2,
		"L�nh th��ng/res_box_get",
		"�� ta suy ngh� l�i/end_dialog"
		)
	end
end
--��Դ����Ļ�ȡ
function res_box_get()
	local Map_ID_player = GetWorldPos()
	local box_num = GetCityBoxCount(Map_ID_player) - 10
	--������⣬��ʽ������ͬʱ��
	if box_num <= 0 then
		return
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(box_num+2,box_num) ~= 1 then
		return
	end
	--����
		--�ȼ�������
	if AddCityBoxCount(Map_ID_player,-(box_num + 10)) > 0 then			
		local nRet, nItemIdx = 0,0
		for i=1,box_num do
			nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet ==1 then
				SetItemExpireTime(nItemIdx,24*60*60)
			end
		end
		SendTongMessage(GetName().." �� nh�n cho bang m�nh "..box_num.." R��ng t�i nguy�n!")
		WriteLogEx("Cong Thanh Chien","B�o v� t�i nguy�n",box_num,"R��ng t�i nguy�n","",GetTongName())
		Talk(1,"","Ng��i �� nh�n "..box_num.." <color=yellow>B�o r��ng t�i nguy�n<color>, nh�p chu�t ph�i ph�i nh�n ���c t�i nguy�n trong ��!")
		if box_num >= 20 then
			nRet, nItemIdx = AddItem(2,1,1067,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." �� nh�n cho bang m�nh 1 ��nh H�n Thi�n Th�ch Th�n Th�ch")
				WriteLogEx("Cong Thanh Chien","B�o v� t�i nguy�n",1,"��nh H�n Thi�n Th�ch Th�n Th�ch","",GetTongName())
			end
		elseif box_num >= 15 then
			nRet, nItemIdx = AddItem(2,1,1068,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." �� nh�n cho bang m�nh 1 Thi�n Th�ch Linh Th�ch")
				WriteLogEx("Cong Thanh Chien","B�o v� t�i nguy�n",1,"Thi�n Th�ch Linh Th�ch","",GetTongName())
			end
		elseif box_num >= 10 then
			nRet, nItemIdx = AddItem(2,1,1001,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." �� nh�n cho bang m�nh 1 H�a Th� B�ch")
				WriteLogEx("Cong Thanh Chien","B�o v� t�i nguy�n",1,"H�a Th� B�ch","",GetTongName())
			end
		end			
	end
end

function jieshao_city()
	Say("Thuy�t minh qu�n l� th�nh th�", 3, "Thuy�t minh X�ng hi�u/chenghao_shuoming", "Thuy�t minh X�ng hi�u Trang b�/fuli_shuoming", "K�t th�c ��i tho�i/no_say")
end

function chenghao_shuoming()
	Say("Danh hi�u: Sau khi k�t th�c c�ng th�nh chi�n v� bang ch� s� ��n NPC qu�n l� th�nh th� nh�n danh hi�u Th�nh Ch� v� b� nhi�m th�. Ng��i ch�i c�n ph�i k�ch ho�t danh hi�u Th�nh Ch� m�i c� th� th�c thi c�c quy�n l�c Th�nh Ch�. C�c lo�i danh hi�u c�ng th�nh chi�n kh�ng th� nh��ng ho�c ��i cho ng��i kh�c\nB� nhi�m th�: Th�nh Ch� ��n qu�n l� th�nh th� �� nh�n 1 ti�n c� Qu�n S� v� 4 ti�n c� b� ��u. Th�nh Ch� ph�i ti�n h�nh t� ��i v�i ng��i c�n b� nhi�m r�i tra quy�n l�c t��ng �ng, khi ng��i ch�i s� d�ng b� nhi�m th� s� thu ���c danh hi�u t��ng �ng.\nH�n ch� s� d�ng b� nhi�m th�: Ng��i ch�i �� c� c�c danh hi�u (Th�nh Ch�, Th�nh Ch�, Danh B�) th� kh�ng th� s� d�ng th�m b� nhi�m th�, t�t c� c�c lo�i b� nhi�m th� s� bi�n m�t v�o s�ng th� 7, danh hi�u s� bi�n m�t sau khi k�t th�c c�ng th�nh.", 3, "Thuy�t minh ch�c v�/zhiwu_shuoming", "tr� l�i/jieshao_city", "K�t th�c ��i tho�i/no_say")
end

function zhiwu_shuoming()
	Say("Ch� th�ch ch�c v�:", 2, "tr� l�i/jieshao_city", "K�t th�c ��i tho�i/no_say")
end

function ziyuan_shuoming()
	Say("B�o h� T�i nguy�n: C�ng ph�m cho tri�u ��nh s� do Bang ph�i Th�nh Ch� chuy�n �i. S� t�i nguy�n n�y c� 4 ph�n s� ���c tr�c ti�p ��a v�o th�nh, 6 ph�n c�n l�i s� b� l�u l�i � 2 th�nh th� l�n c�n trong v�ng 2 canh gi�, c�n c� Bang ph�i Th�nh Ch� t� b�o v�. C�c t�i nguy�n kh�ng b� c��p v� c�c t�i nguy�n ���c ��a tr�c ti�p v�o th�nh s� ���c b�o qu�n t�i ch� Qu�n th�nh s�.", 3, "Xem c�c ��a �i�m b�o h� T�i nguy�n/wuzi_didian", "tr� l�i/jieshao_city", "K�t th�c ��i tho�i/no_say")
end

function wuzi_didian()
	Say("��a �i�m t�i nguy�n: \nTh�nh ��: Nam m�n (189.191); (192.186); (188. 186)\n B�c m�n (181.198); (186.194); (178.191)",  2, "tr� l�i/jieshao_city", "K�t th�c ��i tho�i/no_say")
	--\n	Ȫ�ݣ�Ȫ�ݸ��� ��189��191����184��195����192��195��\n      Ȫ�ݸ��� ��195��196����190��196����184��194��\n	�������鱦ɽ   ��207��221����214��220����221��221��\n      ����ɽ   ��195��177����192��183����187��180��", 2, "����/jieshao_city", "�����Ի�/no_say")
end

function fuli_shuoming()
	Say("Thuy�t minh X�ng hi�u Trang b�: Ng��i ch�i c� X�ng hi�u ��c bi�t c� th� l�nh ho�c ch� t�o trang b� ��c bi�t, to�n b� th�nh vi�n trong bang h�i ��u c� th� l�nh V� binh Kh�i gi�p v� ngo�i trang th�nh th�", 2, "tr� l�i/jieshao_city", "K�t th�c ��i tho�i/no_say")
end

function no_say()
end
