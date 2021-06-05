--=============================================
--create by baiyun 2009.8.25
--describe:Խ�ϰ�8�·ݵ��� ����ʹ�߽ű�
--=============================================
Include("\\script\\task\\plant_tuoguan\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua")

--�ճ�����ͷ�ļ�
Include("\\script\\task\\richangrenwu\\head.lua");
g_strNpc = "<color=green>V� l�m s� gi�: <color>";
function main()
	-- do
		-- Say("Ch�c n�ng th��ng tr�ng B�t Nh� t�m th�i ��ng ��n khi c� ch�nh s�a ph� h�p h�n",0)
		-- return
	-- end

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = g_strNpc.."Hi�n t�i ch� c�a ta c� v�i vi�c c�n Thi�u hi�p gi�p ��, Ch�ng hay thi�u hi�p c� s�n l�ng hay kh�ng?"

	
	
	local nDate = tonumber(date("%Y%m%d"))	
	if   nDate <= 20120229 then
		tinsert(tbSayDialog,"Ta mu�n mua v�t ph�m V� L�m Ho�ng Kim L�nh/buy_HKL")
	end
	tinsert(tbSayDialog,"Nh�n ph�n th��ng tr�ng c�y b�t nh�/get_tuanguan_award")
	tinsert(tbSayDialog,"T�i h� mu�n tr�ng c�y gi�p ng��i kh�c/#plant_tuoguan(2, 0,0)")
	tinsert(tbSayDialog,"T�i h� ��n nh�n ph�n th��ng gi�p tr�ng c�y./get_help_tuoguan_award")
	tinsert(tbSayDialog,"H�m nay �� n�p �� 5 B�t Nh� Ch�ng Th� /already_give_16_banruozhengshu")
	
	tinsert(tbSayDialog,"Nh�n ph�n th��ng theo c�c n�c �i�m t�ch l�y tr�ng c�y/#get_award(1)")	

	tinsert(tbSayDialog,"Ki�m tra s� �i�m t�ch l�y nh�n tr�ng c�y gi�p ng��i kh�c th�nh c�ng./see_point")
	tinsert(tbSayDialog,"T�i h� ch� gh� ngang!/nothing")
	
--      if DAILY_TASK_0912_SWITCH == 1 then
--           tinsert(tbSayDialog, 1, "Nhi�m v� th��ng nh�t/DaliyTask0912About");
--     end
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function buy_HKL()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = g_strNpc.."Hi�n t�i ch� c�a ta c� b�n V� L�m Ho�ng Kim L�nh"
	
	tinsert(tbSayDialog,"Ta mu�n mua 10 V� L�m Ho�ng Kim L�nh (20 Xu v�t ph�m)/#confirm_buy_HKL(1)")
	tinsert(tbSayDialog,"Ta mu�n mua 100 V� L�m Ho�ng Kim L�nh (200 Xu v�t ph�m)/#confirm_buy_HKL(2)")	
	tinsert(tbSayDialog,"Ta mu�n mua 1000 V� L�m Ho�ng Kim L�nh(2000 Xu v�t ph�m)/#confirm_buy_HKL(3)")
	tinsert(tbSayDialog,"T�i h� ch� gh� ngang!/main")
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

local tNum = {10, 100, 1000}
function confirm_buy_HKL(nSelected)
	if nSelected == 1 then
		if GetItemCount(2,1,30230) < 20  then
			Talk(1, "", "B�n kh�ng mang theo �� Xu v�t ph�m!")
			return
		end
		if DelItem(2,1,30230,20) == 1 then
			gf_AddItemEx2({2,1,30284,10}, "Ho�ng Kim L�nh", "MUA HOANG KIM LENH", "th�nh c�ng")
		end
	end
	if nSelected == 2 then
		if GetItemCount(2,1,30230) < 200  then
			Talk(1, "", "B�n kh�ng mang theo �� Xu v�t ph�m!")
			return
		end
		if DelItem(2,1,30230,200) == 1 then
			gf_AddItemEx2({2,1,30284,100}, "Ho�ng Kim L�nh", "MUA HOANG KIM LENH", "th�nh c�ng")
		end
	end	
	if nSelected == 3 then
		if GetItemCount(2,1,30230) < 2000  then
			Talk(1, "", "B�n kh�ng mang theo �� Xu v�t ph�m!")
			return
		end
		if DelItem(2,1,30230,2000) == 1 then
			gf_AddItemEx2({2,1,30284,1000}, "Ho�ng Kim L�nh", "MUA HOANG KIM LENH", "th�nh c�ng")
		end
	end	
end

function get_token()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20090922 and nDate <= 20090927 then
		if GetLevel() < 99 then
			Say(g_strNpc.."Ch� c� cao th� ��ng c�p 99 m�i s� h�u ���c �n t�n! Thi�u hi�p h�y r�n luy�n th�m!",0)
			return
		end
		local nExtVal = GetExtPoint(4)
		if nExtVal < 1 then
			Say(g_strNpc.."Thi�u hi�p kh�ng c� trong danh s�ch nh�n th��ng!",0)
			return
		elseif  nExtVal == 2 then
			Say(g_strNpc.."Ch�ng ph�i ��i hi�p �� nh�n �n t�n r�i sao?",0)
			return
		end
		if GetFreeItemRoom() <1  then
			Say(g_strNpc.."H�nh trang c�a ��i hi�p kh�ng �� � tr�ng. H�y s�p x�p l�i!",0)
			return
		end		
		if nExtVal == 1 then
			AddExtPoint(4,1)
		end	
	end
end

function get_tuanguan_award()
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 0 or GetTask(TASK_TUOGUAN_PLANT_TYPE) ~= 1 then
		Say(g_strNpc.."Thi�u hi�p th�t kh�o ��a, thi�u hi�p �� c� �y th�c tr�ng c�y B�t Nh� ch�a m� ��i nh�n th��ng.", 1, "Th�t ng�i qu�! T�i h� s� quay l�i sau./nothing");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME)
	if nDiff < 900 then
		Say(g_strNpc.."Thi�u hi�p c�n"..(900 - nDiff).." gi�y sau m�i c� th� nh�n ph�n th��ng �y th�c tr�ng c�y", 1, "K�t th�c ��i tho�i/nothing");
		return 0;
	end
	if gf_JudgeRoomWeight(5, 50, g_strNpc) == 0 then
		return 0;
	end
	--������
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_EXP[1], 100, 1);
	local nExp = t_TUOGUAN_EXP[1][nRand][1];
	ModifyExp(nExp);
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
	--����Ʒ
	nRand = gf_GetRandItemByTable(t_TUOGUAN_AWARD, 1000, 2);
	nName = t_TUOGUAN_AWARD[nRand][1];
	if nRand >=1 and nRand <= 5 then
		nName = "V�ng Th�i H� B�t Qu�i";
	end
	local nRet, nIndex = gf_AddItemEx(t_TUOGUAN_AWARD[nRand][3], nName);
	if nRet == 1 then
		WriteLogEx("Uy thac trong cay", "Phan Thuong Uy Thac", 1, t_TUOGUAN_AWARD[nRand][1]);
		if nRand == 10 then
			SetItemExpireTime(nIndex, 15 * 24 * 60 * 60);
		end
	end
	SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 0);
	SetTask(TASK_TUOGUAN_PLANT_TYPE, 0);
end

function get_help_tuoguan_award()
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 0 or GetTask(TASK_TUOGUAN_PLANT_TYPE) ~= 2 then
		Say(g_strNpc.."Thi�u hi�p th�t kh�o ��a, thi�u hi�p �� c� nh�n tr�ng c�y B�t Nh� gi�p ai ch�a m� ��i nh�n th��ng.", 1, "Th�t ng�i qu�! T�i h� s� quay l�i sau./nothing");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME)
	if nDiff < 360 then
		Say(g_strNpc.."Thi�u hi�p c�n"..(360 - nDiff).." gi�y sau m�i c� th� nh�n th��ng gi�p ng��i kh�c tr�ng c�y", 1, "K�t th�c ��i tho�i/nothing");
		return 0;
	end
	if gf_JudgeRoomWeight(5, 50, g_strNpc) == 0 then
		return 0;
	end
	--������
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_HELP_POINT, 100, 1);
	local nMul = 1;
	if GetTask(TASK_TUOGUAN_PLANT_POINT) < 200 then
		nMul = 5
	end
	local nPoint = t_TUOGUAN_HELP_POINT[nRand][1] * 3 * nMul;
	SetTask(TASK_TUOGUAN_PLANT_POINT, GetTask(TASK_TUOGUAN_PLANT_POINT) + nPoint);
	Msg2Player("B�n nh�n ���c "..nPoint.." �i�m tr�ng c�y");
	WriteLogEx("Uy thac trong cay", "nh�n", nPoint, "Diem tich luy");
	--������
	local nRand = gf_GetRandItemByTable(t_TUOGUAN_EXP[2], 100, 1);
	local nExp = t_TUOGUAN_EXP[2][nRand][1];
	ModifyExp(nExp);
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
	--- �i�m V�n May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*nExp
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--	else
--		Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--	end
	---------	
	--����Ʒ
	nRand = gf_GetRandItemByTable(t_TUOGUAN_AWARD, 1000, 2);
	nName = t_TUOGUAN_AWARD[nRand][1];
	if nRand >=1 and nRand <= 5 then
		nName = "V�ng Th�i H� B�t Qu�i";
	end
	local nRet, nIndex = gf_AddItemEx(t_TUOGUAN_AWARD[nRand][3], nName);
	if nRet == 1 then
		WriteLogEx("Uy thac trong cay", "Phan Thuong Nhan Uy Thac", 1, t_TUOGUAN_AWARD[nRand][1]);
		if nRand == 10 then
			SetItemExpireTime(nIndex, 15 * 24 * 60 * 60);
		end
	end
	if tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, 50}, "nguy�n li�u event 201011", "Hoat dong thang 11 nam 2010", "N�p BNCT")
	end
	if tonumber(date("%y%m%d")) >= 110114 and tonumber(date("%y%m%d")) <= 110220 then
		gf_AddItemEx2({ 2, 1, 30277, 30}, "Nguy�n li�u event T�t", "Hoat dong thang 1 nam 2011", "N�p BNCT")
	end
	SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 0);
	SetTask(TASK_TUOGUAN_PLANT_TYPE, 0);
end

function see_point()
	Say(g_strNpc.."Hi�n t�i b�n c� <color=red>"..GetTask(TASK_TUOGUAN_PLANT_POINT).."<color> �i�m tr�ng c�y.", 1, "tr� l�i/main");
end


function nothing()
end

function already_give_16_banruozhengshu()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE) < nDate then
		SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, 0);
	end
	if GetTask(TASK_TUOGUAN_GET_AWARD_DATE) >= nDate then
		Say(g_strNpc.."H�m nay thi�u hi�p �� nh�n ph�n th��ng B�t Nh� Ch�ng Th� r�i, xin h�y ��i ng�y mai r�i quay l�i.", 1, "Th�t ng�i qu�! Ta s� quay l�i sau./nothing");
		return 0;
	end
	if GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT) < 5 then
		Say(g_strNpc.."Thi�u hi�p m�i n�p <color=yellow>"..GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT).."/5<color> B�t Nh� Ch�ng Th� trong ng�y. H�y n�p th�m �i!!", 1, "Th�t ng�i qu�! Ta s� quay l�i sau./nothing");
		return 0;
	else
		if gf_Judge_Room_Weight(2, 50, g_strNpc) == 0 then
			return 0;
		end
		local nRand = gf_GetRandItemByTable(t_TUOGUAN_8_AWARD, 100, 3);
		gf_SetLogCaption(str_TUOGUAN_LOG);
		local nRetCode, nIndex = gf_AddItemEx(t_TUOGUAN_8_AWARD[nRand][3], t_TUOGUAN_8_AWARD[nRand][1]);
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, t_TUOGUAN_8_AWARD[nRand][4]);
			SetTask(TASK_TUOGUAN_GET_AWARD_DATE, nDate);
			WriteLogEx("Uy thac trong cay", "Nop 16 Bat nha chung thu", 1, t_TUOGUAN_8_AWARD[nRand][1]);
		end
		gf_SetLogCaption("");
		SetTask(TASK_TUOGUAN_GET_AWARD_DATE, nDate);
		Give_BNCT_16_Award()
	end
end

function get_award(nPage)
	local tb_say = {};
	if nPage == 1 then
    	tinsert(tb_say, "250 �i�m t�ch l�y � nh�n 2 M�t t�ch s� m�n 70/#confirm_get_award(1, 250)");
		tinsert(tb_say, "500 �i�m t�ch l�y �  nh�n 6 Nh�n s�m v�n n�m/#confirm_get_award(2, 500)");
		tinsert(tb_say, "750 �i�m t�ch l�y � nh�n 100 tr�i c�y ng�u nhi�n/#confirm_get_award(3, 750)");	
--		tinsert(tb_say, "1000 �i�m t�ch l�y � nh�n 1 Thi�n Th�ch Linh Th�ch/#confirm_get_award(4, 1000)");
		tinsert(tb_say, "1250 �i�m t�ch l�y � nh�n 6 nh�n s�m v�n n�m/#confirm_get_award(5, 1250)");
--		tinsert(tb_say, "400 �i�m t�ch l�y � nh�n 2 M�t t�ch s� m�n cap c�p 70/#confirm_get_award(6, 400)");
		tinsert(tb_say, "Trang k�/#get_award(2)");
		tinsert(tb_say, "Trang tr��c/#get_award(1)");
	elseif nPage == 2 then
		tinsert(tb_say, "1750 �i�m t�ch l�y �  nh�n 100 tr�i c�y ng�u nhi�n/#confirm_get_award(7, 1750)");
		tinsert(tb_say, "2000 �i�m t�ch l�y � nh�n 6 nh�n s�m v�n n�m/#confirm_get_award(8, 2000)");
--		tinsert(tb_say, "2250 �i�m t�ch l�y � nh�n 1 ��nh H�n Thi�n Th�ch Th�n Th�ch/#confirm_get_award(9, 2250)");
--		tinsert(tb_say, "2500 �i�m t�ch l�y � nh�n 2 Thi�n Cang L�nh/#confirm_get_award(10, 2500)");
		tinsert(tb_say, "2750 �i�m t�ch l�y � nh�n 6 nh�n s�m v�n n�m/#confirm_get_award(11, 2750)");
--		tinsert(tb_say, "3000 �i�m t�ch l�y � nh�n 1 ��i ��nh H�n/#confirm_get_award(12, 3000)");
		tinsert(tb_say, "Trang k�/#get_award(3)");
		tinsert(tb_say, "Trang tr��c/#get_award(1)");
	elseif nPage == 3 then	
--		tinsert(tb_say, "3250 �i�m t�ch l�y � nh�n 2Thi�n M�n Kim L�nh/#confirm_get_award(13, 3250)");
		tinsert(tb_say, "3500 �i�m t�ch l�y � nh�n 6 nh�n s�m v�n n�m/#confirm_get_award(14, 3500)");
--		tinsert(tb_say, "3750 �i�m t�ch l�y � nh�n 1 L�ng Ba Vi B�/#confirm_get_award(15, 3750)");
--		tinsert(tb_say, "4000 �i�m t�ch l�y � nh�n 1 t�i Thi�n Th�ch Tinh Th�ch/#confirm_get_award(16, 4000)");
		tinsert(tb_say, "4250 �i�m t�ch l�y � nh�n 100 tr�i c�y ng�u nhi�n/#confirm_get_award(17, 4250)");
--		tinsert(tb_say, "4500 �i�m t�ch l�y � nh�n 1 Chuy�n sinh ��n/#confirm_get_award(18, 4500)");
		tinsert(tb_say, "Trang k�/#get_award(4)");
		tinsert(tb_say, "Trang tr��c/#get_award(2)");
	elseif nPage == 4 then
--		tinsert(tb_say, "4750 �i�m t�ch l�y � nh�n 1 Thi�n Th�ch Linh Th�ch/#confirm_get_award(19, 4750)");
--		tinsert(tb_say, "5000 �i�m t�ch l�y � nh�n 2 H�a Th� B�ch/#confirm_get_award(20, 5000)");
		tinsert(tb_say, "5250 �i�m t�ch l�y � nh�n 6 nh�n s�m v�n n�m/#confirm_get_award(21, 5250)");
--		tinsert(tb_say, "5500 �i�m t�ch l�y � nh�n 1 ��nh H�n Thi�n Th�ch Th�n Th�ch/#confirm_get_award(22, 5500)");
--		tinsert(tb_say, "5750 �i�m t�ch l�y � nh�n 1 t�i Thi�n Th�ch Tinh Th�ch/#confirm_get_award(23, 5750)");
--		tinsert(tb_say, "6000 �i�m t�ch l�y � nh�n 1 L�ng Ba Vi B� To�n T�p/#confirm_get_award(24, 6000)");
		tinsert(tb_say, "Trang k�/#get_award(5)");		
		tinsert(tb_say, "Trang tr��c/#get_award(3)");
	elseif nPage == 5 then
		tinsert(tb_say, "6250 �i�m t�ch l�y � nh�n 100 tr�i c�y ng�u nhi�n/#confirm_get_award(25, 6250)");
--		tinsert(tb_say, "6500 �i�m t�ch l�y � nh�n 2 H�a Th� B�ch/#confirm_get_award(26, 6500)");
		tinsert(tb_say, "6750 �i�m t�ch l�y � nh�n 6 nh�n s�m v�n n�m/#confirm_get_award(27, 6750)");
--		tinsert(tb_say, "7000 �i�m t�ch l�y � nh�n 1 Chuy�n sinh ��n/#confirm_get_award(28, 7000)");
--		tinsert(tb_say, "7250 �i�m t�ch l�y � nh�n 2 Thi�n M�n Kim L�nh/#confirm_get_award(29, 7250)");
		tinsert(tb_say, "7500 �i�m t�ch l�y � nh�n 18 nh�n s�m v�n n�m/#confirm_get_award(30, 7500)");
		tinsert(tb_say, "Trang tr��c/#get_award(4)");
	else
		tinsert(tb_say, "Trang k�/#get_award(2)");
		tinsert(tb_say, "Trang tr��c/#get_award(1)");
	end		
	tinsert(tb_say, "K�t th�c ��i tho�i/nothing");
	Say(g_strNpc.."��i hi�p mu�n ��i ph�n th��ng n�o", getn(tb_say), tb_say);
end

function confirm_get_award(nIndex, nNeedPoint)
	local nPoint = GetTask(TASK_TUOGUAN_PLANT_POINT);
	local nFlag = GetTask(TASK_TUOGUAN_GET_AWARD_FLAG);
	if GetBit(nFlag, nIndex) == 1 then
		Talk(1, "", g_strNpc.."��i hi�p �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n th�m ���c n�a");
		return 0;
	end
	if nPoint < nNeedPoint then
		Talk(1, "", g_strNpc.."�i�m t�ch l�y c�a ��i hi�p kh�ng ��, kh�ng th� nh�n ph�n th��ng n�y");
		return 0;
	end
	if t_TUOGUAN_POINT_TO_AWARD[nIndex][2] == nil then
		if gf_JudgeRoomWeight(2, 50, g_strNpc) == 0 then
			Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
			return 0;
		end
	else
		if gf_JudgeRoomWeight(t_TUOGUAN_POINT_TO_AWARD[nIndex][2][4], 50, g_strNpc) == 0 then
			Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
			return 0;
		end
	end
	SetTask(TASK_TUOGUAN_GET_AWARD_FLAG, SetBit(nFlag, nIndex, 1));
	gf_SetLogCaption(str_TUOGUAN_LOG);
	if nIndex ~= 1 and nIndex ~= 3 and nIndex ~= 7 and nIndex ~= 17 and nIndex ~= 25 then
		gf_AddItemEx2(t_TUOGUAN_POINT_TO_AWARD[nIndex][2], t_TUOGUAN_POINT_TO_AWARD[nIndex][1], "BNCT doi diem tich luy", "B�t Nh� Ch�ng Th�",t_TUOGUAN_POINT_TO_AWARD[nIndex][3])
--		local _, nItemIndex = gf_AddItemEx(t_TUOGUAN_POINT_TO_AWARD[nIndex][2], t_TUOGUAN_POINT_TO_AWARD[nIndex][1]);		
--		if t_TUOGUAN_POINT_TO_AWARD[nIndex][3] then
--			SetItemExpireTime(nItemIndex, t_TUOGUAN_POINT_TO_AWARD[nIndex][3]);
--		end
	elseif nIndex == 1  then
		--�����ɸ��ؼ�
		local nRoute = GetPlayerRoute();
		if not t_TUOGUAN_LOW[nRoute] then
			Talk(1, "", g_strNpc.."��i hi�p v�n ch�a gia nh�p m�n ph�i n�o c�, kh�ng th� nh�n ���c m�t t�ch s� m�n");
			return 0;
		end
		gf_AddItemEx(t_TUOGUAN_MIJI[nRoute][2], t_TUOGUAN_MIJI[nRoute][1])
	elseif  nIndex == 3 or nIndex == 7 or nIndex == 17  or nIndex == 25 then
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),100}, "Tr�i C�y")
	end
	WriteLogEx("Uy thac trong cay", "Doi diem", 1, t_TUOGUAN_POINT_TO_AWARD[nIndex][1]);
	gf_SetLogCaption("");
end

function get_award_2010(nPage)
	local tb_say = {};
	if nPage == 1 then
		tinsert(tb_say, "300 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(1, 300)");
		tinsert(tb_say, "600 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(2, 600)");
		tinsert(tb_say, "900 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(3, 900)");	
		tinsert(tb_say, "1200 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(4, 1200)");
		tinsert(tb_say, "1500 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(5, 1500)");
		tinsert(tb_say, "1800 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(6, 1800)");
		tinsert(tb_say, "Trang k�/#get_award_2010(2)");
		tinsert(tb_say, "Trang tr��c/#get_award_2010(1)");
	elseif nPage == 2 then
		tinsert(tb_say, "2100 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(7, 2100)");
		tinsert(tb_say, "2400 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(8, 2400)");
		tinsert(tb_say, "2700 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(9, 2700)");
		tinsert(tb_say, "3000 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(10, 3000)");
		tinsert(tb_say, "3300 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(11, 3300)");
		tinsert(tb_say, "3600 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(12, 3600)");
		tinsert(tb_say, "Trang k�/#get_award_2010(3)");
		tinsert(tb_say, "Trang tr��c/#get_award_2010(1)");
	elseif nPage == 3 then	
		tinsert(tb_say, "3900 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(13, 3900)");
		tinsert(tb_say, "4200 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(14, 4200)");
		tinsert(tb_say, "4500 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(15, 4500)");
		tinsert(tb_say, "4800 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(16, 4800)");
		tinsert(tb_say, "5100 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(17, 5100)");
		tinsert(tb_say, "5400 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(18, 5400)");
		tinsert(tb_say, "Trang k�/#get_award_2010(4)");
		tinsert(tb_say, "Trang tr��c/#get_award_2010(2)");
	elseif nPage == 4 then
		tinsert(tb_say, "5700 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(19, 5700)");
		tinsert(tb_say, "6000 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(20, 6000)");
		tinsert(tb_say, "6300 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(21, 6300)");
		tinsert(tb_say, "6600 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(22, 6600)");
		tinsert(tb_say, "6900 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(23, 6900)");
		tinsert(tb_say, "7200 �i�m t�ch l�y � nh�n 4 Nh�n S�m V�n N�m/#confirm_get_award_2010(24, 7200)");		
		tinsert(tb_say, "Trang tr��c/#get_award_2010(3)");
	else
		tinsert(tb_say, "Trang k�/#get_award_2010(2)");
		tinsert(tb_say, "Trang tr��c/#get_award_2010(1)");
	end		
	tinsert(tb_say, "K�t th�c ��i tho�i/nothing");
	Say(g_strNpc.."��i hi�p mu�n ��i ph�n th��ng n�o", getn(tb_say), tb_say);
end

function confirm_get_award_2010(nIndex, nNeedPoint)
	local nPoint = GetTask(TASK_TUOGUAN_PLANT_POINT);
	local nFlag = GetTask(TASK_TUOGUAN_GET_AWARD_FLAG);
	if GetBit(nFlag, nIndex) == 1 then
		Talk(1, "", g_strNpc.."��i hi�p �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n th�m ���c n�a");
		return 0;
	end
	if nPoint < nNeedPoint then
		Talk(1, "", g_strNpc.."�i�m t�ch l�y c�a ��i hi�p kh�ng ��, kh�ng th� nh�n ph�n th��ng n�y");
		return 0;
	end
	if gf_JudgeRoomWeight(2, 50, g_strNpc) == 0 then
		return 0;
	end
	gf_AddItemEx2({2,1,30071,4}, "4 Nh�n S�m V�n N�m", "Uy thac trong cay 2010", "nh�n th��ng")
	gf_SetTaskBit(TASK_TUOGUAN_GET_AWARD_FLAG, nIndex, 1)
end