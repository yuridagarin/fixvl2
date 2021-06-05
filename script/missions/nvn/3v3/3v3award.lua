Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\nvn\\3v3.lua")

function get_3v3_last_week_award()
	--�ж�����
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","T�nh n�ng n�y t�m th�i kh�ng m�");
		return 0;
	end
	local nTag = gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 1)
	if 0 == nTag then
		Talk(1,"","T�m th�i kh�ng th� nh�n ph�n th��ng tu�n tr��c!");
		return 0;
	end
	if 2 == nTag then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng t� v� 3v3 c�a tu�n tr��c, kh�ng th� nh�n th�m!");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100) ~= 1 then
		Talk(1,"","H�nh trang kh�ng gian �� ��y, kh�ng th� nh�n th��ng!");
		return 0;
	end
	--�콱
	if 1 == nTag then
		local nWin = gf_GetMyTaskByte(TASKID_3V3_LASTWEEK_FIGHT_TIMES, 3, 4);
		local nFail = gf_GetMyTaskByte(TASKID_3V3_LASTWEEK_FIGHT_TIMES, 1, 2);
		local nTotal = nWin + nFail;
		--����
		local nIndex = -1; 
		if nTotal == 10 then
			nIndex = 1
		elseif nTotal > 10 and nTotal <= 25 then
			nIndex = 2
		elseif nTotal > 25 and nTotal <= 49 then
			nIndex = 3
		elseif nTotal > 49 then
			nIndex = 4
		end
		if nIndex == -1 or nTotal == 0 then
			Talk(1,"","S� tr�n t� v� 3v3 tu�n tr��c c�a ��i hi�p qu� �t, kh�ng th� nh�n th��ng! ")
			return 0;
		end
		--ʤ��
		local nIndexSub = -1;
		local nRate = 100 * nWin / nTotal;
		if nRate >= 0 and nRate < 20 then
			nIndexSub = 1
		elseif nRate >= 20 and nRate < 40 then
			nIndexSub = 2
		elseif nRate >= 40 and nRate < 60 then
			nIndexSub = 3
		elseif nRate >= 60 and nRate < 80 then
			nIndexSub = 4
		elseif nRate >= 80 then
			nIndexSub = 5
		end
		if nIndexSub == -1 then
			Talk(1,"","S� tr�n th�ng t� v� 3v3 tu�n tr��c c�a ��i hi�p qu� th�p, kh�ng th� nh�n th��ng")
			return 0;
		end
		--�ñ��
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 1, 2);
		--������
		gf_AddItemEx2({2,1,30575,_3V3_LAST_WEEK_AWARD[nIndex][nIndexSub][1], 4}, "L� Bao V� L�m", "3V3", "Ph�n th��ng tu�n tr��c", 0, 1);
		gf_AddItemEx2({2,1,30576,_3V3_LAST_WEEK_AWARD[nIndex][nIndexSub][2], 4}, "L� Bao V� L�m H�o Ki�t", "3V3", "Ph�n th��ng tu�n tr��c", 0, 1);
		Talk(1,"","Ch�c m�ng ��i hi�p th�nh c�ng nh�n th��ng t� v� 3v3 c�a tu�n tr��c");
		Msg2Player("Ch�c m�ng ��i hi�p th�nh c�ng nh�n th��ng t� v� 3v3 c�a tu�n tr��c");
		return 1;
	end
end

g_LastSeasonLimitTime = {
	--[GetName()] = LimitTime;	
};
function get_3v3_last_season_award()
	--�ж�����
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","T�nh n�ng n�y t�m th�i kh�ng m�");
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= 200 then
		Talk(1,"","Gi�i th��ng qu� 3v3 ch� ���c nh�n t�i <color=red>b�n �� Bi�n Kinh<color>, nh�n th�t b�i !");
		return 0;
	end
	--------------------------------------
	local nTag = gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 2);
	if 1 ~= nTag then	
		--�����콱������ô����ȥ��������
		--�����ʱ�����Ƶģ������ܵ���ɵ��
		local nTime = GetTime() - (g_LastSeasonLimitTime[GetName()] or 0);
		if nTime < 5*60 then
			Talk(1,"",format("Hi�n nay server �ang b�n, h�y <color=red>%d ph�t %d gi�y<color> sau th� l�i !", floor((300 -nTime) / 60), mod((300 - nTime), 60)));
			return 0;
		end
		_3v3_CrossMatchRetsetPlayerTask()
		g_LastSeasonLimitTime[GetName()] = GetTime();
		--�ٲ�Ȼ�Һù��ҾͲ���������
		-----------------------------
		if 0 == nTag then
			Talk(1,"","Hi�n t�i kh�ng c� ph�n th��ng t� v� 3v3 c�a qu� tr��c, nh�n th��ng th�t b�i!");
			return 0;
		elseif 2 == nTag then
			Talk(1,"","��i hi�p �� nh�n ph�n th��ng t� v� 3v3 c�a qu� tr��c, kh�ng th� nh�n th�m!");
			return 0;
		end
	else
		if gf_Judge_Room_Weight(8, 100) ~= 1 then
			Talk(1,"","H�nh trang kh�ng gian �� ��y, kh�ng th� nh�n th��ng!");
			return 0;
		end
		local nRank = gf_GetMyTaskByte(TASKID_LAST_MATCH_RANK, 1, 2);
		return _get_3v3_last_season_award(nRank);
	end
end

function _get_3v3_last_season_award(nRank)
	local nIndex = -1;
	if nRank == 1 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 1;
		--
		--gf_AddItemEx2({2,1,30577,1,4}, "����Ь���", "3V3", "����������", 0, 1);
		--
		gf_AddItemEx2({0,105,141,1,4,-1,-1,-1,-1,-1,-1}, "Phi Hi�u", "3V3", "Ph�n th��ng qu� tr��c", 30 * 24 * 3600, 1)
		--
		--gf_AddItemEx2({2,1,30408,3,4}, "3��ǧ�ÿ̰�", "3V3", "����������", 30 * 24 * 3600, 1)
		gf_AddItemEx2({2,1,30668,6,4}, "Tinh Hoa U�n Linh C�p 6", "3V3", "Ph�n th��ng qu� tr��c", 30 * 24 * 3600, 1)
		--
		local tWaiZhuang = {
			{{"Thanh Minh M�o", {0,108,684,1,4}}, {"Thanh Minh M�o", {0,108,685,1,4}}, {"Thanh Minh M�o", {0,108,686,1,4}}, {"Thanh Minh M�o", {0,108,687,1,4}}},
			{{"Thanh Minh Th��ng Trang", {0,109,684,1,4}}, {"Thanh Minh Th��ng Trang", {0,109,685,1,4}}, {"Thanh Minh Th��ng Trang", {0,109,686,1,4}}, {"Thanh Minh Th��ng Trang", {0,109,687,1,4}}},
			{{"Thanh Minh H� Trang", {0,110,684,1,4}}, {"Thanh Minh H� Trang", {0,110,685,1,4}}, {"Thanh Minh H� Trang", {0,110,686,1,4}}, {"Thanh Minh H� Trang", {0,110,687,1,4}}},
		};
		local nBody = GetBody();
		local nSize = getn(tWaiZhuang);
		for i = 1, nSize do
			gf_AddItemEx2(tWaiZhuang[i][nBody][2], tWaiZhuang[i][nBody][1], "3V3", "Ph�n th��ng qu� tr��c", 30 * 24 * 3600, 1)
		end
		--
		RemoveTitle(66,1);
		AddTitle(66,1);
		SetTitleTime(66, 1, GetTime() + 30*24*3600);
		--SetCurTitle(66, 1);
	elseif nRank > 1 and nRank <= 5 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 2;
		--
		--gf_AddItemEx2({2,1,30577,1}, "����Ь���", "3V3", "����������", 0, 1);
		--
		--gf_AddItemEx2({2,1,30408,3,4}, "3��ǧ�ÿ̰�", "3V3", "����������", 30 * 24 * 3600, 1)
		gf_AddItemEx2({2,1,30668,6,4}, "Tinh Hoa U�n Linh C�p 6", "3V3", "Ph�n th��ng qu� tr��c", 30 * 24 * 3600, 1)
		--
		local tWaiZhuang = {
			{{"Thanh Minh M�o", {0,108,684,1,4}}, {"Thanh Minh M�o", {0,108,685,1,4}}, {"Thanh Minh M�o", {0,108,686,1,4}}, {"Thanh Minh M�o", {0,108,687,1,4}}},
			{{"Thanh Minh Th��ng Trang", {0,109,684,1,4}}, {"Thanh Minh Th��ng Trang", {0,109,685,1,4}}, {"Thanh Minh Th��ng Trang", {0,109,686,1,4}}, {"Thanh Minh Th��ng Trang", {0,109,687,1,4}}},
			{{"Thanh Minh H� Trang", {0,110,684,1,4}}, {"Thanh Minh H� Trang", {0,110,685,1,4}}, {"Thanh Minh H� Trang", {0,110,686,1,4}}, {"Thanh Minh H� Trang", {0,110,687,1,4}}},
		};
		local nBody = GetBody();
		local nSize = getn(tWaiZhuang);
		for i = 1, nSize do
			gf_AddItemEx2(tWaiZhuang[i][nBody][2], tWaiZhuang[i][nBody][1], "3V3", "Ph�n th��ng qu� tr��c", 30 * 24 * 3600, 1)
		end
		--
		RemoveTitle(66,2);
		AddTitle(66,2);
		SetTitleTime(66, 2, GetTime() + 30*24*3600);
		--SetCurTitle(66, 2);
	elseif nRank > 5 and nRank <= 10 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 3;
		--
		--gf_AddItemEx2({2,1,30577,1}, "����Ь���", "3V3", "����������", 0, 1);
		--
		RemoveTitle(66,3);
		AddTitle(66,3);
		SetTitleTime(66, 3, GetTime() + 30*24*3600);
		--SetCurTitle(66, 3);
	elseif nRank > 10 and nRank <= 20 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 2);
		nIndex = 4;
		--
		--gf_AddItemEx2({2,1,30577,1}, "����Ь���", "3V3", "����������", 0, 1);
		--
		RemoveTitle(66,4);
		AddTitle(66,4);
		SetTitleTime(66, 4, GetTime() + 30*24*3600);
		--SetCurTitle(66, 4);
	else
		Talk(1,"","Ch� c� c�c ��i hi�p n�m trong b�ng x�p h�ng top 20 c�a server m�i nh�n ���c ph�n th��ng qu�");
		return 0;
	end
	local tTitle = {
		"Ch� T�n V��ng Gi�",
		"��c B� Thi�n H�",
		"V� l�m h�o ki�t",
		"Giang H� Tinh Anh",
	}
	if nIndex ~= -1 and tTitle[nIndex] ~= nil then
		local msg = format("Ch�c m�ng ��i hi�p [%s] �� x�p h�ng th� %d li�n ��u ��i H�i T� V� 3v3 c�a qu� tr��c, nh�n ���c danh hi�u [%s] v� ph�n th��ng phong ph�!", GetName(), nRank, tTitle[nIndex]);
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		return 1;
	end
	return 0;
end
