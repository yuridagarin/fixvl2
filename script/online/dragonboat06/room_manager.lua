--File name:room_manager_CD.lua
--Describe:������������NPC�ű�
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\room.lua");

function main()
	do return end
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(ATTENDCOUNTPERDAY2) < nDate then
		SetTask(ATTENDCOUNTPERDAY1,0);
		SetTask(ATTENDCOUNTPERDAY3,0);
	end;
	SetTask(STATUS,0);	--������ҵ����
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--���һ��
	SetTask(FINISHTIME,0);
	SetTask(FLAG_COLOR,0);
	SetTask(ENTERORDER,0);	--����Ĳ�������Ϊ��ʹ״̬�������ҿ�������������Ϸ
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnBoat = 0;
	if nGenre == 0 and nDetail ==105 then
		for i=25,31 do
			if nParticular == i then
				bOnBoat = 1;
				break;
			end;
		end;
	end;
	if bOnBoat == 1 then
		UnEquipAtPosition(10);
	end;
	local selTab = {
			"Ta mu�n tham gia thi ��u/selectroom",
			"Ta mu�n ��ng thuy�n R�ng/wantboat",
			"Thi ��u n�n bi�t/knowdetail",
--			"��Ҫ��ȡ���Ӻͽ����ĵ�/wantzongzi",
			"Ta mu�n l�nh ch� nam thi thuy�n R�ng/wantzhinan",
--			"��Ҫ�û��ֻ�����/seebonus",
			"K�t th�c ��i tho�i/nothing",
			};
	if Get_DragonBoatDay_State() == 0 then
		Talk(1,"","T�t �oan Ng� �� ��n. Ch�c m�i ng��i m�t c�i T�t vui v�.");
		return 0;
	end;
	if Get_DragonBoatDay_State() == 1 then
		Talk(1,"","Ho�t ��ng t�t �oan Ng� �� k�t th�c. B�n �n t�t vui v� ch�?");
		return 0;
	end;
	local sContent = "T�t �oan Ng� �� ��n, m�i ng��i h�y tham gia thi ��u thuy�n R�ng!";
	if Get_DragonBoatDay_State() == 2 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		sContent = "�� k�t th�c thi ��u thuy�n R�ng, m�i b�n l�nh ph�n th��ng tr��c <color=yellow>6/7<color>.";
	end;
	if nDate <= 071021 then
		tinsert(selTab,7,"Ta mu�n nh�n b�i th��ng/get_compensation");
	end;
	Say(sContent,getn(selTab),selTab);
end;

function get_compensation()
	if GetCreateTime() > 1192032000 then	--MkTime��GmTime������ָ��ǶԳƵģ���
		Talk(1,"","Ch� nh�ng nh�n v�t ��ng k� tr��c <color=yellow>ng�y 11 th�ng 10 n�m 2007<color> m�i ���c nh�n b�i th��ng.");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ng��i kh�ng nh�p m�n ph�i kh�ng ���c nh�n b�i th��ng �ua thuy�n. ");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","��ng c�p c�a b�n qu� th�p, ph�i ��t c�p <color=yellow>10<color> tr� l�n (kh�ng bao g�m c�p 10) m�i c� th� nh�n b�i th��ng.");
		return 0;
	end;
	if GetTask(1898) ~= 0 then
		Talk(1,"","Ng��i �� l�nh ph�n b�i th��ng r�i! M�i ng��i ch� ���c l�nh b�i th��ng 1 l�n th�i!");
		return 0;
	end;
	if GetTask(BONUSPOINT) < 10 then
		Talk(1,"","�i�m t�ch l�y �ua thuy�n r�ng c�a ng��i �t qu�! Mu�n l�nh ph�i c� t� <color=yellow>10 �i�m tr� l�n<color>!");
		return 0;
	end;
	if GetFreeItemRoom() <= 3 or GetMaxItemWeight()-GetCurItemWeight() <= 60 then
		Talk(1,"main","Xin ki�m tra kho�ng tr�ng h�nh trang v� s�c l�c!");
		return 0;
	end;
	AddItem(2,1,967,30);
	Msg2Player("B�n nh�n ���c 30 T�m ��c giang h�");
	AddItem(2,1,394,20);
	Msg2Player("B�n nh�n ���c 20 B�nh �t g�o n�p");
	SetTask(1898,1);
end;

function selectroom()
	local nHour = tonumber(date("%H"));
	if nHour < 19 or nHour > 22 and nHour ~= 12 and nHour ~= 13 then
		Talk(1,"main","Khu v�c thi ��u �ang chu�n b�, t� <color=yellow>12h ��n 14h<color> v� <color=yellow>19h ��n 23h<color> s� m�. Nh� ��n tham gia nh�!");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho�t ��ng t�t �oan Ng� sai s�t","Khi nh�n v�o NPC b�o danh, s� ID b�n �� nh�n ���c sai, t�n nh�n v�t:"..GetName());
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"main","Xin l�i! Ng��i v� m�n v� ph�i kh�ng ���c tham gia thi ��u thuy�n R�ng.");
		return 0;
	end;
	local RoomTab = Init_Room();
	local selTab = {};
	local statTab = {
				"�ang ti�n h�nh thi ��u, kh�ng th� v�o trong!",
				"�ang trong giai �o�n b�o danh, kh�ng th� v�o trong",
				"C� th� v�o trong"
				}
	local nIndex = 1;
	local nNeedRoom = 0;
	local nIdelRoomCount,nReadyRoomCount,nMatchingRoomCount = Get_Room_Count_Info();

	if nIdelRoomCount == g_TotalRoomNum then
		for i=1,2 do
			selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
			nIndex = nIndex + 1;	
		end;
	elseif nReadyRoomCount >= 1 then
		for i=1,g_TotalRoomNum do
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSIGNUP then
				local state = RoomTab[i]:GetRoomState();
				if state == MS_STATE_WAITSIGNUP then
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[2].." S� ng��i hi�n c�:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";
				else
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].." S� ng��i hi�n c�:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				end;
				nIndex = nIndex + 1;
			end;	
		end;
	elseif nMatchingRoomCount ~= 0 and nMatchingRoomCount == g_TotalRoomNum - nIdelRoomCount then
		local bDisplayIdelRoom = 0;
		for i=1,g_TotalRoomNum do
			if bDisplayIdelRoom ~= 1 then
				if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
					bDisplayIdelRoom = 1;
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
					nIndex = nIndex + 1;	
				end;
			end;
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
				selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].." S� ng��i hi�n c�:"..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				nIndex = nIndex + 1;	
			end;
		end;	
	end;
	selTab[getn(selTab)+1] = "Quay l�i ��i tho�i ch�nh./main";
	selTab[getn(selTab)+1] = "R�i kh�i/nothing";
	Say("B�n mu�n v�o tr��ng ��u n�o?",getn(selTab),selTab);
end;

function joinconfirm(RoomID)
	if GetPlayerRoute() == 20 then --�嶾а��
		local selTab = {
				"��ng v�y!/#join("..RoomID..")",
				"�� ta suy ngh� l�i/main",
				}
		Say("B�n mu�n v�o thi ��u?",getn(selTab),selTab)
	else
		join(RoomID);
	end;
end;

function join(RoomID)
	if RoomID < 1 or RoomID > g_TotalRoomNum then
		Msg2Player("L�i m� s� ph�ng, xin th� l�i");
		return 0;
	end;
	if checkboat() == 0 then
		Talk(1,"","Xin l�i! Mu�n tham gia thi ��u b�n ph�i c� m�t chi�c thuy�n R�ng.");
		return 0;		
	end;
	if checkequipment() == 0 then
		Talk(1,"","�� c�ng b�ng, tr��c khi v�o tr��ng ��u xin b�n h�y b� <color=yellow>c�c trang b� tr� ngo�i trang<color> ra �� tr�nh t�n th�t ngo�i � mu�n. Xin x�c nh�n <color=yellow>h�nh trang c�n ch� tr�ng<color>.");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho�t ��ng t�t �oan Ng� sai s�t","Khi nh�n v�o NPC b�o danh, s� ID b�n �� nh�n ���c sai, t�n nh�n v�t:"..GetName());
	end;
	local RoomTab = Init_Room();
	if RoomTab[RoomID]:GetRoomState() <= MS_STATE_WAITSIGNUP then
		RoomTab[RoomID]:AddPlayer();
		WriteLog("[Ho�t ��ng t�t �oan Ng�]\t"..GetAccount().."\t"..GetName().."\t tham gia �ua thuy�n R�ng.")
	else
		Talk(1,"selectroom","Xin l�i! ���ng �ua b�n ch�n <color=yellow>"..RoomName[RoomID+RoomIndex].."<color>�� chu�n b� b�t ��u thi ��u ho�c �ang thi ��u kh�ng th� v�o ���c.");
	end;
end;

function seebonus()
	local selTab = {
			"Ta mu�n d�ng �i�m ��i th��ng/wantaward",
			"Thuy�t minh ��i th��ng/knowaward",
			"Quay l�i ��i tho�i ch�nh./main",
			"K�t th�c ��i tho�i/nothing",
			}
	Say("<enter>S� l�n tham gia thi ��u c�a b�n l�:<color=yellow>"..GetTask(ATTENDCOUNT).."<color><enter>�i�m t�ch l�y c�a b�n:<color=yellow>"..GetTask(BONUSPOINT).."<color>",getn(selTab),selTab);
end;

function wantaward()
	local selTab = {
			"��i 1 �i�m t�ch l�y l�y b�nh �t th�t quay/#askfornum(1)",	--������
			"��i 1 �i�m t�ch l�y l�y 1 �i�m danh v�ng/#askfornum(2)",	--��໻����������
			"D�ng 5 �i�m t�ch l�y ��i b�nh �t x� x�u/#askfornum(3)",--ÿ����ࣳ��
			"D�ng 8 �i�m t�ch l�y ��i b�nh �t th�p c�m/#askfornum(4)",--����
			"D�ng 8 �i�m t�ch l�y ��i b�nh nh�n m�t/#askfornum(5)",--����
			--"��15���ֻ�ȡ��������/#askfornum(6)",--ÿ�����3��,ע��ԭ��IBû��������
			"Xem trang sau/wantaward1",
			"Quay l�i ��i tho�i ch�nh./main",
			"K�t th�c ��i tho�i/nothing",
			}
	Say("�i�m t�ch l�y thi ��u thuy�n R�ng c�a b�n l� <color=yellow>"..GetTask(BONUSPOINT).."<color> �i�m, b�n mu�n ��i ph�n th��ng n�o?",getn(selTab),selTab);
end;

function wantaward1()
	local selTab = {
			"��i 50 �i�m t�ch l�y l�y b�nh �t Gia H�ng/#askfornum(7)",--ÿ�����3��
			"D�ng 100 �i�m t�ch l�y ��i t�i b�nh/#askfornum(8)",--ÿ�����һ��
			"��i 500 �i�m t�ch l�y l�y bao l� x� b�nh �t/#askfornum(9)",--���5�Σ�ÿ�����3��
			"D�ng 1000 �i�m t�ch l�y ��i th� th� ch� t�o v� kh�/#askfornum(10)",--���2�Σ�ÿ�����1��
			"��ng 1500 �i�m t�ch l�y ��i H�t L�i B�c/#askfornum(11)",--���2�Σ�ÿ�����1��
			"��i 2000 �i�m t�ch l�y l�y Khu�t Nguy�n Ng�c B�i/#askfornum(12)",--���1��
			"Xem trang tr��c/wantaward",
			--"�鿴��һҳ/wantaward2",
			"Quay l�i ��i tho�i ch�nh./main",
			"K�t th�c ��i tho�i/nothing",
			}
	Say("�i�m t�ch l�y thi ��u thuy�n R�ng c�a b�n l� <color=yellow>"..GetTask(BONUSPOINT).."<color> �i�m, b�n mu�n ��i ph�n th��ng n�o?",getn(selTab),selTab);
end;

function askfornum(nType)
	local selTab = {
				"1 nh�m/#giveaward("..nType..",1)",
				"2 nh�m/#giveaward("..nType..",2)",
				"5 nh�m/#giveaward("..nType..",5)",
				"10 nh�m/#giveaward("..nType..",10)",
				"20 nh�m/#giveaward("..nType..",20)",
				" 50 nh�m/#giveaward("..nType..",50)",
				"100 nh�m/#giveaward("..nType..",100)",
				"Ta suy ngh� l�i!/wantaward",
				"K�t th�c ��i tho�i/nothing",
				};
	if nType > 6 then
		for i=1,6 do 
			tremove(selTab,2)
		end;
	end;
	Say("B�n mu�n ��i bao nhi�u nh�m gi�i th��ng?",getn(selTab),selTab);
end;

function giveaward(nType,nNum)
	local DecBonusTab = {1,1,5,8,8,15,50,100,500,1000,1500,2000};
	local nRetCode = 0;		
	if GetTask(BONUSPOINT) < DecBonusTab[nType]*nNum then
		Talk(1,"wantaward","Xin l�i! �i�m t�ch l�y c�a b�n kh�ng ��, kh�ng th� ��i ph�n th��ng!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nType == 1 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,388,nNum);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c b�nh �t th�t quay");
		end;
	elseif nType == 2 then
		if GetTask(AWARD_REPUTATION)+nNum > 1000 then
			Talk(1,"wantaward","Xin l�i! Hi�n gi� b�n ch� c� th� ��i t�i �a <color=yellow>"..(1000-GetTask(AWARD_REPUTATION)).." �i�m<color> danh v�ng.")
			return 0;
		end;
		ModifyReputation(nNum,0);
		Msg2Player("B�n nh�n ���c "..nNum.." �i�m danh v�ng");
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_REPUTATION,GetTask(AWARD_REPUTATION)+nNum);
	elseif nType == 3 then
		if GetTask(AWARD_CSZZ2) < nDate then
			SetTask(AWARD_CSZZ1,0);
		end;
		if GetTask(AWARD_CSZZ1) >= 3 then
			Talk(1,"wantaward","Xin l�i! H�m nay b�n kh�ng th� ��i ph�n th��ng, ng�y mai h�y quay l�i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_CSZZ1,GetTask(AWARD_CSZZ1)+1);
		SetTask(AWARD_CSZZ2,nDate);
		nRetCode = AddItem(2,1,965,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..nNum.." B�nh �t x� x�u");
		end;
	elseif nType == 4 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,391,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..nNum.." b�nh �t th�p c�m");
		end;
	elseif nType == 5 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,389,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..nNum.." B�nh nh�n m�t");
		end;
	elseif nType == 6 then
--		if GetTask(AWARD_SLGZ2) < nDate then
--			SetTask(AWARD_SLGZ1,0);
--		end;
--		if GetTask(AWARD_SLGZ1) >= 3 then
--			Talk(1,"wantaward","<color=green>������ʹ�ߣ�<color>������˼�������㲻���ٻ�ȡ��������ˣ�����������ٻ���");
--			return 0;
--		end;
--		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
--		SetTask(AWARD_SLGZ1,GetTask(AWARD_SLGZ1)+1);
--		SetTask(AWARD_SLGZ2,nDate);
--		nRetCode = AddItem(2,0,392,nNum)
--		if nRetCode == 1 then
--			Msg2Player("���õ�"..nNum.."����������");
--			Write_Log("���ۻ��ֻ�����",GetName().."�õ���������")
--		else
--			Write_Log("���ۻ��ֻ���������",GetName().."AddItem(2,0,392,nNum)ʱ����ֵΪ:"..nRetCode)
--		end;	
	elseif nType == 7 then
		if GetTask(AWARD_JXZZ2) < nDate then
			SetTask(AWARD_JXZZ1,0);
		end;
		if GetTask(AWARD_JXZZ1) >= 3 then
			Talk(1,"wantaward","Xin l�i! H�m nay b�n kh�ng th� ��i ph�n th��ng, ng�y mai h�y quay l�i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_JXZZ1,GetTask(AWARD_JXZZ1)+1);
		SetTask(AWARD_JXZZ2,nDate);
		nRetCode = AddItem(2,1,392,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..nNum.." b�nh �t Gia H�ng");
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng",GetName().."Nh�n ���c b�nh �t Gia H�ng")
		else
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng c� sai s�t",GetName().."AddItem(2,1,392,nNum) tr� quay l�i:"..nRetCode)
		end;	
	elseif nType == 8 then			--�������
		if GetTask(AWARD_ZZLB) < nDate then
			SetTask(AWARD_ZZLB,0);
		end;
		if GetTask(AWARD_ZZLB) ~= 0 then
			Talk(1,"wantaward","Xin l�i! H�m nay b�n kh�ng th� ��i ph�n th��ng, ng�y mai h�y quay l�i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZLB,nDate);
		nRetCode = AddItem(2,1,966,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..nNum.." t�i b�nh");
		end;
	elseif nType == 9 then	--���Ӵ����
		if GetTask(AWARD_ZZDLB3) < nDate then
			SetTask(AWARD_ZZDLB2,0);
		end;
		if GetTask(AWARD_ZZDLB1) >= 5 then
			Talk(1,"wantaward","Xin l�i! B�n kh�ng th� ��i ph�n th��ng n�y, xin ch�n m�n kh�c.");
			return 0;
		end;
		if GetTask(AWARD_ZZDLB2) >= 3 then
			Talk(1,"wantaward","Xin l�i! H�m nay b�n kh�ng th� ��i ph�n th��ng, ng�y mai h�y quay l�i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZDLB1,GetTask(AWARD_ZZDLB1)+1);
		SetTask(AWARD_ZZDLB2,GetTask(AWARD_ZZDLB2)+1);
		SetTask(AWARD_ZZDLB3,nDate);
		nRetCode = AddItem(2,1,393,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..nNum.." t�i b�nh l�n");
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng",GetName().."Nh�n ���c bao l� x� b�nh �t");
		else
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng c� sai s�t",GetName().."AddItem(2,1,393,nNum) tr� quay l�i:"..nRetCode)
		end;	
	elseif nType == 10 then
		if GetTask(AWARD_DJSWQZZSC3) < nDate then
			SetTask(AWARD_DJSWQZZSC3,0);
		end;
		if GetTask(AWARD_DJSWQZZSC3) == 0 then
			SetTask(AWARD_DJSWQZZSC2,0);
		end;
		if GetTask(AWARD_DJSWQZZSC1) >= 2 then
			Talk(1,"wantaward","Xin l�i! B�n kh�ng th� ��i ph�n th��ng n�y, xin ch�n m�n kh�c.");
			return 0;
		end;
		if GetTask(AWARD_DJSWQZZSC2) >= 1 then
			Talk(1,"wantaward","Xin l�i! H�m nay b�n kh�ng th� ��i ph�n th��ng, ng�y mai h�y quay l�i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_DJSWQZZSC1,GetTask(AWARD_DJSWQZZSC1)+1);
		SetTask(AWARD_DJSWQZZSC2,GetTask(AWARD_DJSWQZZSC2)+1);
		SetTask(AWARD_DJSWQZZSC3,nDate);
		nRetCode = AddItem(2,0,397,nNum)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c s� tay c�a b�c th�y ch� v� kh�");
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng",GetName().."B�n nh�n ���c s� tay c�a b�c th�y ch� v� kh�");
		else
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng c� sai s�t",GetName().."AddItem(2,0,397,nNum) tr� quay l�i:"..nRetCode)
		end;	
	elseif nType == 11 then
		if GetTask(AWARD_HLB3) < nDate then
			SetTask(AWARD_HLB2,0);
		end;
		if GetTask(AWARD_HLB1) >= 1 then
			Talk(1,"wantaward","Xin l�i! B�n kh�ng th� ��i ph�n th��ng n�y, xin ch�n m�n kh�c.");
			return 0;
		end;
		if GetTask(AWARD_HLB2) >= 1 then
			Talk(1,"wantaward","Xin l�i! H�m nay b�n kh�ng th� ��i ph�n th��ng, ng�y mai h�y quay l�i.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_HLB1,GetTask(AWARD_HLB1)+1);
		SetTask(AWARD_HLB2,GetTask(AWARD_HLB2)+1);
		SetTask(AWARD_HLB3,nDate);
		nRetCode = AddItem(0,105,12,nNum,1,-1,-1,-1,-1,-1,-1)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c H�t L�i B�c");
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng",GetName().."Nh�n ���c H�t L�i B�c");
		else
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng c� sai s�t",GetName().."AddItem(0,105,12,nNum) tr� quay l�i:"..nRetCode)
		end;
	elseif nType == 12 then
		if GetTask(AWARD_QYZP) == 1 then
			Talk(1,"wantaward","B�n �� ��i qua ph�n th��ng n�y, kh�ng th� ��i n�a. H�y ch�n ph�n th��ng kh�c.");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_QYZP,1);
		nRetCode = AddItem(0,102,27,nNum,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c Khu�t Nguy�n Ng�c B�i");
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng",GetName().."Nh�n ���c Khu�t Nguy�n Ng�c B�i");
		else
			Write_Log("�i�m t�ch l�y �ua thuy�n ��i ph�n th��ng c� sai s�t",GetName().."AddItem(0,102,27,nNum) tr� quay l�i:"..nRetCode)
		end;
	else
		Write_Log("��i ph�n th��ng t�t �oan Ng� c� sai s�t","Lo�i h�nh gi�i th��ng c� sai s�t, tr� s� lo�i h�nh l�:"..nType);
	end;
	wantaward();
end;

function knowaward()
	local selTab = {
			"s� l�n gi�i h�n ��i ph�n th��ng /seerestriction1",
			"Quay l�i ��i tho�i tr�n/seebonus",
			"K�t th�c ��i tho�i/nothing",
			}
	Say("B�n c� th� tham gia thi ��u thuy�n R�ng �� nh�n �i�m t�ch l�y, sau �� b�n c� th� l�y �i�m th��ng ��i ph�n th��ng. Ch� �! C� m�t s� ph�n th��ng kh�ng c� h�n ch� s� l�n ��i v� ng��c l�i, c�ng c� m�t s� ph�n th��ng ch� cho ��i t�ng c�ng v�i l�n, chi ti�t xin tham kh�o <color=yellow>s� l�n h�n ch� ��i ph�n th��ng<color>.",getn(selTab),selTab);
end;

function seerestriction1()
	Talk(1,"seerestriction2","B�nh �t nh�n th�t: kh�ng h�n ch� s� l�n ��i<enter>Danh v�ng: t�i �a c� th� ��i <color=yellow>1000 �i�m<color><enter>B�nh �t x� x�u: m�i ng�y ���c ��i t�i �a <color=yellow>3 l�n<color><enter>B�nh �t Th�p c�m: kh�ng h�n ch� s� l�n ��i<enter>B�nh �t nh�n m�t: kh�ng h�n ch� s� l�n ��i<enter>B�nh �t Gia H�ng: m�i ng�y ��i t�i �a <color=yellow>3 l�n<color>");
end;

function seerestriction2()
	Talk(1,"seebonus","L� bao b�nh �t: m�i ng�y ��i t�i �a <color=yellow>1 l�n<color><enter>��i L� bao b�nh �t: t�i �a ��i ���c <color=yellow>5 l�n<color>, m�i ng�y ��i t�i �a <color=yellow>3 l�n<color><enter>S� tay ch� t�c v� kh� ��i T��ng s�: t�i �a ��i ���c <color=yellow>2 l�n<color>, m�i ng�y ��i t�i �a <color=yellow>1 l�n<color><enter>H�t L�i B�c: t�i �a ��i ���c <color=yellow>1 l�n<color><enter>Khu�t Nguy�n B�i: t�i �a ch� ��i ���c <color=yellow>1 l�n<color>");
end;

function knowdetail()
	Talk(1,"knowdetail1","M�ng 5 th�ng 5 �m l�ch l� T�t �oan Ng� truy�n th�ng. Th� gi�i trong VLTK 2 c�ng s� ��y m�u s�c nh� t�t �oan Ng�. ���ng nhi�n s� kh�ng th� thi�u l� h�i �ua thuy�n R�ng v� �n b�nh �t.");
end;

function knowdetail1()
	Talk(1,"knowdetail2","Th�i gian ho�t ��ng: <enter>T� <color=yellow>30 th�ng: m�i ng�y c� hai tr�n t� 13h-15h v� 19h-23h<color><enter>Y�u c�u: kh�ng ph�i l� ng��i ch�i t�n ch� tr�ng");
end;
function knowdetail2()
	Talk(1,"knowdetail3","<color=green>Ho�t ��ng 1: B�nh �t<color>:<enter>M�i ng�y ho�n th�nh <color=yellow>3 tr�n<color> thi ��u thuy�n R�ng c� th� ��n g�p Long Chu s� gi� nh�n b�nh �t n�p, s� d�ng c� th� nh�n ���c �i�m kinh nghi�m v� 5 �i�m danh v�ng. Ngo�i ra c�n c� th� nh�n ���c s� b�nh �t tr�ng mu�i b�ng v�i s� tr�n tham gia, s� d�ng b�nh �t tr�ng  mu�i s� nh�n ���c ph�n th��ng ho�c hi�u qu� ng�u nhi�n");
end;
function knowdetail3()
	Talk(1,"knowdetail4","Ho�t ��ng th� 2-�ua thuy�n R�ng: <enter>Thu th�p �� nguy�n li�u t�m Long Chu s� gi� ch�n ch� t�o thuy�n R�ng. Long Chu s� gi� s� l�m cho b�n m�t chi�c thuy�n R�ng. T� l� l�m ra thuy�n R�ng ph� th�ng l� r�t cao. Tr��c ti�n ch�n tham gia thi ��u sau �� ch�n tr��ng ��u b�n mu�n v�o. 4 ph�t 30 gi�y sau khi ng��i ��u ti�n v�o tr��ng ��u ho�c s� ng��i b�o danh �� 8 ng��i s� ch�nh th�c thi ��u. Khi ng��i ch�i b�o danh y�u c�u kh�ng mang v� kh� trang b�, n�n, �m kh�, �o, qu�n, nh�n, m�t t�ch nh�ng c� th� trang b� ngo�i trang ��ng th�i nh�t ��nh ph�i c� 1 chi�c thuy�n R�ng trong h�nh trang.");
end;
function knowdetail4()
	Talk(1,"knowdetail5","Sau khi v�o tr��ng ��u, b�n s� v�o khu v�c xu�t ph�t m�c ��nh �� ch� xu�t ph�t. Sau khi cu�c thi chu�n b� b�t ��u s� c� 30 gi�y �� chu�n b�. Trong th�i gian chu�n b�, tuy�n th� trang b� thuy�n R�ng �� h�t th�i gian chu�n b� s� xu�t ph�t. Trong qu� tr�nh thi ��u tuy�n th� kh�ng th� trang b� b�t c� trang b� v� kh�ng th� ��i thuy�n R�ng kh�c ho�c b� thuy�n R�ng. Sau khi v� ��ch tuy�n th� s� tr� l�i tr�ng th�i b�nh th��ng.");
end;
function knowdetail5()
	Talk(1,"knowdetail6","Trong qu� tr�nh thi ��u, tuy�n th� c� th� s� d�ng k� n�ng m� thuy�n R�ng c�. Trong khu v�c thi ��u c� c�c c�ng nh� ���c t�o th�nh b�i c�c c�y c� nhi�u m�u s�c, n�u l�n l��t v��t qua 2 c�ng nh� th� c� th� nh�n ���c hi�u qu� ��c ��nh. Xin ch� �: K� m�n m�u Xanh, ��, V�ng l� hi�u qu� ch�nh di�n. C�n c� m�u Cam v� m�u T�m n�u v��t qua s� b�t l�i cho b�n th�n. Trong khu v�c thi ��u s� xu�t hi�n ng�u nhi�n 1 lo�i b�o r��ng, khi m� b�o r��ng s� nh�n ���c hi�u qu� ng�u nhi�n. Thi ��u thuy�n R�ng c�n c� v�o th� t� c�c tuy�n th� v� ��ch l�m k�t qu�.");
end;
function knowdetail6()
	Talk(1,"main","Quy t�c thi ��u nh� sau theo s� ng��i nh� sau, s� �i�m ���c th��ng theo th� t� t� cao ��n th�p. <enter>S� ng��i thi ��u l� 2: 1, 0. <enter>S� ng��i thi ��u l� 3: 2, 1, 0. <enter>S� ng��i thi ��u l� 4: 2, 1, 1, 0. <enter>S� ng��i thi ��u l� 5: 3, 2, 1, 0, 0. <enter>S� ng��i thi ��u l� 6: 3, 2, 1, 1, 0, 0. <enter>S� ng��i thi ��u l� 7: 4, 3, 4, 1, 1, 0, 0. <enter>S� ng��i thi ��u l� 8: 5, 4, 3, 2, 1, 1, 0, 0.");
end;

--��������Ƿ�װ����װ֮���װ��
function checkequipment()
	for i=0,11 do
		if i~= 6 and i~= 7 and i~= 8 then
			local nGenre,nDetail,nParticular = GetPlayerEquipInfo(i);
			if nGenre ~= 0 or nDetail ~= 0 or nParticular ~= 0 then
				return 0;
			end;
		end;
	end;
	return 1;
end;
--��鱳�������Ƿ�������
function checkboat()
	for i=25,31 do
		if GetItemCount(0,105,i) >= 1 then
			return 1;
		end;
	end;
	return 0;
end;

function wantboat()
	local selTab = {
			"Ch� t�o thuy�n R�ng/makeboat",
			"Gi�i thi�u thuy�n R�ng/knowboat",
			"Quay l�i/main",
			"K�t th�c ��i tho�i/nothing"
			}
	Say("Ng��i h�y gi�p ta thu th�p <color=yellow>10 Chu Sa v� 10 �u�i Th�<color>, ta s� ch� t�o gi�p ng��i 1 chi�c thuy�n R�ng.",getn(selTab),selTab);
end;

function makeboat()
	if DelItem(2,2,30,10) == 1 and DelItem(2,1,2,10) == 1 then
		local nRandomNum = random(1,100);
		local nType = 0;
		if nRandomNum <= 50 then
			AddItem(0,105,25,1);
			nType = 1;
		else
			AddItem(0,105,29,1);
			nType = 5;
		end;
		Msg2Player("B�n nh�n ���c 1 chi�c"..BoatInfo[nType][1]);
	else
		Talk(1,"","Xin l�i! Ng��i kh�ng c� th� ta c�n, ta kh�ng th� gi�p ng��i l�m thuy�n R�ng.");
	end;
end;

function knowboat()
	local selTab = {};
	for i=1,getn(BoatInfo) do
		selTab[i] = BoatInfo[i][1].."/#knowboatdetail("..i..")";
	end;
	selTab[getn(selTab)+1] = "Quay l�i ��i tho�i tr�n/wantboat";
	selTab[getn(selTab)+1] = "K�t th�c ��i tho�i/nothing";
	Say("Kh�ch quan mu�n t�m hi�u lo�i thuy�n R�ng n�o?",getn(selTab),selTab);
end;

function knowboatdetail(nType)
	local sContent = ""
	if nType > 7 or nType <= 0 then
		Write_Log("Ho�t ��ng t�t �oan Ng� sai s�t","Lo�i thuy�n r�ng sai! T�n nh�n v�t:"..GetName())
		return 0;
	end;
	sConten = "<color=yellow>"..BoatInfo[nType][1].."<color>:"..BoatInfo[nType][2];
	Talk(1,"knowboat",sConten);
end;

function wantzongzi()
	local selTab = {
				"Ta mu�n l�nh b�nh �t tr�ng �n/givexdzz",
				"Ta mu�n l�nh b�nh �t g�o n�p/givenmzz",
				"Nh�n t�m ��c giang h�/givediary",
				"Ta s� quay l�i sau/main",
				};
	local nCount = GetTask(ATTENDCOUNTPERDAY1);
	Say("T�ng c�ng b�n �� tham gia <color=yellow>"..GetTask(ATTENDCOUNT).."<color> tr�n thi ��u, nh�n ���c <color=yellow>"..GetTask(GETXDZZCOUNT).."c�i<color> b�nh �t mu�i m�n, c�n c� th� l�nh <color=yellow>"..(GetTask(ATTENDCOUNT)-GetTask(GETXDZZCOUNT)).."<color> c�i. H�m nay b�n �� tham gia thi ��u thuy�n R�ng <color=yellow>"..nCount.."<color> l�n ��u thuy�n r�ng, ch� c�n <color=yellow>tham gia 3 tr�n ho�c nhi�u h�n<color> l� c� th� nh�n b�nh �t n�p, <color=yellow>1 ng�y ch� nh�n ���c 1 l�n<color>! M�i l�n tham gia ��u nh�n ���c 1 quy�n t�m ��c giang h�, t�i �a 4 quy�n, nh�n ch�?",getn(selTab),selTab);
end;

function givediary()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin ki�m tra kho�ng tr�ng h�nh trang v� s�c l�c!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(AWARD_DIARY2) < nDate then
		SetTask(AWARD_DIARY1,0);
	end;
	if GetTask(AWARD_DIARY1) >= GetTask(ATTENDCOUNTPERDAY1) then
		Talk(1,"wantzongzi","Xin l�i! S� l�n tham gia thi ��u ng�y h�m nay kh�ng �� �� nh�n t�m ��c giang h�.");
		return 0;
	end;
	if GetTask(AWARD_DIARY1) >= 4 then
		Talk(1,"wantzongzi","Xin l�i! Ng��i �� nh�n <color=yellow>4 quy�n<color> t�m ��c giang h�, ng�y mai h�y quay l�i!");
		return 0;
	end;
	SetTask(AWARD_DIARY1,GetTask(AWARD_DIARY1)+1);
	SetTask(AWARD_DIARY2,nDate);
	nRetCode = AddItem(2,1,967,1)
	if nRetCode == 1 then
--		Msg2Player("���õ�һ�������ĵ�");
	end;	
end;

function givexdzz()
	if GetTask(GETXDZZCOUNT) >= GetTask(ATTENDCOUNT) then
		Talk(1,"wantzongzi","Xin l�i! Kh�ch quan �� l�nh h�t b�nh �t mu�i m�n! Hh�y tham gia thi ��u thuy�n R�ng ti�p r�i quay l�i nh�!");
		return 0;
	end;
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	local selTab = {
			"Ta mu�n l�nh 1 b�nh �t mu�i m�n/giveonexdzz",
			"Ta mu�n l�nh to�n b� ("..nZzLeft.." c�i) b�nh �t mu�i m�n/giveallxdzz",
			"L�n sau h�y l�nh/main",
			}
	Say("B�n mu�n l�nh bao nhi�u b�nh �t mu�i m�n?",getn(selTab),selTab);
end;

function giveonexdzz()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin ki�m tra kho�ng tr�ng h�nh trang v� s�c l�c!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(GETXDZZCOUNT)+1);
	if AddItem(2,1,390,1) == 1 then
		Msg2Player("B�n nh�n ���c 1 b�nh �t mu�i m�n");
	end;
end;

function giveallxdzz()
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	if GetFreeItemRoom() <= 2 or GetMaxItemWeight()-GetCurItemWeight() <= nZzLeft then
		Talk(1,"main","Xin ki�m tra kho�ng tr�ng h�nh trang v� s�c l�c!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(ATTENDCOUNT));
	if AddItem(2,1,390,nZzLeft) == 1 then
		Msg2Player("B�n nh�n ���c "..nZzLeft.." B�nh �t mu�i m�n");
	end;
end;

function givenmzz()
	if GetTask(ATTENDCOUNTPERDAY3) ~= 0 then
		Talk(1,"main","H�m nay b�n �� l�nh b�nh �t g�o n�p r�i, ng�y mai h�y quay l�i.");
		return 0;
	end;
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","Xin ki�m tra kho�ng tr�ng h�nh trang v� s�c l�c!");
		return 0;
	end;
	if GetTask(ATTENDCOUNTPERDAY1) >= 3 then
		SetTask(ATTENDCOUNTPERDAY3,1);
		local nRetCode = AddItem(2,1,394,1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 b�nh �t g�o n�p");
			Write_Log("Nh�n b�nh �t g�o n�p",GetName().."�� nh�n 1 b�nh �t g�o n�p");
			Talk(1,"main","b�nh �t g�o n�p m�i ra l� ��y, ��i hi�p h�y nh�n l�y.");
		elseif nRetCode == 2 then
			Write_Log("Nh�n b�nh �t g�o n�p",GetName().."Khi nh�n b�nh �t g�o n�p, b�nh �t g�o n�p r�i xu�ng ��t, c�n �n ���c kh�ng?");
		else
			Write_Log("L�i nh�n b�nh �t g�o n�p",GetName().."Nh�n b�nh �t g�o n�p th�t b�i");
		end;
	else
		Talk(1,"main","Xin l�i! S� l�n b�n thi ��u thuy�n R�ng h�m n�y qu� �t, b�n ph�i tham gia �t nh�t <color=yellow>3 tr�n<color> m�i c� th� nh�n b�nh �t g�o n�p.");
	end;
end;

function wantzhinan()
	if GetItemCount(2,0,396) == 0 then
		AddItem(2,0,396,1);	--������ָ��
		Msg2Player("B�n nh�n ���c 1 quy�n h��ng d�n thi ��u thuy�n R�ng");
	else
		Talk(1,"main","Kh�ng ph�i b�n c� quy�n h��ng d�n thi ��u thuy�n R�ng?");
	end;
end;

function Get_Room_Count_Info()
	local RoomTab = Init_Room();
	local nIdelCounter,nReadyCounte,nMatchingCounter = 0,0,0;
	for i=1,g_TotalRoomNum do
		if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
			nIdelCounter = nIdelCounter + 1;
		end;
		if RoomTab[i]:GetRoomState() == MS_STATE_WAITSIGNUP then
			nReadyCounte = nReadyCounte + 1;
		end;
		if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
			nMatchingCounter = nMatchingCounter + 1;
		end;
	end;
	return nIdelCounter,nReadyCounte,nMatchingCounter;
end;
