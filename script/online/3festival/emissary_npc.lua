--File name:emissary_npc.lua 
--Describe:����������������ʹ
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\class\\ktabfile.lua")

tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");

function main()
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 080911 then
		Talk(1,"","<color=green>Ni�n s�<color>: Ho�t ��ng s� b�t ��u v�o 11-9, v�  "..tSexName[GetSex()].."��n l�c �� nh� ��n ��y.");
		return 0;
	end;
	if GetLevel() < 30 then
		Talk(1,"","��ng c�p c�a ng��i qu� th�p, kh�ng th� tham gia ho�t ��ng n�y, luy�n ��n c�p <color=yellow>30 <color> quay l�i g�p ta nh�!");
		return 0;
	end;
	local selTab = {
				"Nh�n nguy�n li�u l�m b�nh/want_mooncake_resource",
				"Nh�n ���c B�nh Trung Thu Tinh M�/want_mooncake",
				"B�nh Trung Thu, l�y ��o c� ��i ph�n th��ng /want_reward",
--				"��ȡ��������Ʒ/want_anniversary",
				"Ta mu�n nh�n b�nh trung thu/require_mooncake",
				"Mua v�t ph�m l� m�ng/buy_things",
				"Nh�n h��ng d�n ho�t ��ng/get_intro_book",
				"Xem n�i dung ho�t ��ng./know_detail",
				"[-K�t th�c ��i tho�i-]/nothing",
				}
	if nDate > 081012 then
		Talk(1,"","Ho�t ��ng l�n n�y �� k�t th�c, c�m �n b�n �� tham gia!");
		return 0;
	end;
	if nDate > 081007 then
		tremove(selTab,1);
		tremove(selTab,1);
	end;
	Say("<color=green>Ni�n s�<color>: JX2 tr�n 3 n�m c�ng v�a d�p t�t Trung Thu, ch�c c�c v� giang h� n� hi�p �n t�t vui v�!",getn(selTab),selTab);
end;

function want_reward()
	local selTab = {
				"Ta mu�n d�ng th� k� ni�m ��i l�y ph�n th��ng /use_card",
				"Ta mu�n d�ng B�nh Trung Thu ��i B�o r��ng/use_mooncake",
				"Xem thu�c t�nh trang s�c Vinh D�, Huy Ho�ng (kh�ng mua ���c)/ring_Sale",
				"[-Thuy�t minh-]/know_reward",
				"[-Quay l�i ��i tho�i-]/main",
				"[-K�t th�c ��i tho�i-]/nothing",
				}
	Say("B�n d�ng v�t ph�m n�o ��i ph�n th��ng?",getn(selTab),selTab);
end;

function use_card()
	local selTab = {
				"��i  10 th� k� ni�m JX2 tr�n 3 n�m l�y 1 B�ng Lai ti�n l�/#ask_is_use_card(10)",
				"��i  20 th� k� ni�m JX2 tr�n 3 n�m l�y ph�n th��ng kinh nghi�m/#ask_is_use_card(20)",
				"��i  40 th� k� ni�m JX2 tr�n 3 n�m l�y ph�n th��ng kinh nghi�m/#ask_is_use_card(40)",
				"��i  100 th� k� ni�m JX2 tr�n 3 n�m l�y 1 H�p Ng�n B�i Vinh D�/#ask_is_use_card(100)",
				"��i  500 th� k� ni�m JX2 tr�n 3 n�m l�y 1 Ch�a Kh�a B�c Vinh D�/#ask_is_use_card(500)",
				"Trang k�/use_card_page_2",
				"Ta kh�ng mu�n ��i n�a./nothing",
				}
	local nCount = GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]);
	Say("Hi�n b�n c� <color=yellow>"..nCount.."<color>Th� k� ni�m JX2 tr�n 3 n�m, t�y theo s� l��ng <color=red>th� k� ni�m JX2 tr�n 3 n�m<color> c�a b�n, b�n c� th� ��i ph�n th��ng sau ��y: ",getn(selTab),selTab);
end;

function use_card_page_2()
	local selTab = {
				"��i 1000 th� k� ni�m JX2 tr�n 3 n�m l�y H�p Kim B�i Vinh D�/#ask_is_use_card(1000)",
				"��i 2000 th� k� ni�m JX2 tr�n 3 n�m l�y trang s�c Huy Ho�ng Chi Th�y/#ask_is_use_card(2000)",
				"��i 3000 th� k� ni�m JX2 tr�n 3 n�m l�y 1 trang s�c Vinh D� Chi Th�y/#ask_is_use_card(3000)",
				"��i 6000 th� k� ni�m JX2 tr�n 3 n�m l�y 1 trong 3 m�n Ho�ng ��/use_card_exchange_equip",
				"Trang tr��c/use_card",
				"Ta kh�ng mu�n ��i n�a./nothing",
				}
	local nCount = GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]);
	Say("Hi�n b�n c� <color=yellow>"..nCount.."<color>Th� k� ni�m JX2 tr�n 3 n�m, t�y theo s� l��ng <color=red>th� k� ni�m JX2 tr�n 3 n�m<color> c�a b�n, b�n c� th� ��i ph�n th��ng sau ��y: ",getn(selTab),selTab);

end;

function ask_is_use_card(nCount)
	local tCardInfo = {
						 [10] = "1 B�ng Lai ti�n l�",
						 [20] = "Ph�n th��ng kinh nghi�m",
						 [40] = "Ph�n th��ng kinh nghi�m",	
						 [100] = "H�p Ng�n B�i Vinh D�",	
						 [500] = "Ch�a Kh�a B�c Vinh D�",	
						 [1000] = "H�p Kim B�i Vinh D�",				
						 [2000] = "Trang s�c Huy Ho�ng Chi Th�y",	
						 [3000] = "Trang s�c Vinh D�"
							};
	Say("<color=green>Ni�n s�<color>: B�n mu�n s� d�ng <color=yellow>"..nCount.."<color> th� k� ni�m JX2 tr�n 3 n�m ��i <color=yellow>"..tCardInfo[nCount].."<color> ch�?",
			2,
			"Ta mu�n ��i/#use_card_confirm("..nCount..")",
			"Ta ch�n nh�m r�i./use_card");						
end

function use_card_confirm(nCount)
	if nCount ~= 1 and nCount ~= 20 and nCount ~= 40 then
		if gf_JudgeRoomWeight(2,100,".") == 0 then
			return 0;
		end;
	end;
	local nChangeTimes = 0;
	local nRetCode = 0;
	if nCount == 20 then
		nChangeTimes = GetTask(TASK_USE_CARD_20);
		if nChangeTimes >= 60 then
			Talk(1,"","C�c h� kh�ng th� ��i ph�n th��ng n�y n�a! ");
			return 0;
		end;
	end		
	if nCount == 40 then
		nChangeTimes = GetTask(TASK_USE_CARD_40);
		if nChangeTimes >= 20 then
			Talk(1,"","C�c h� kh�ng th� ��i ph�n th��ng n�y n�a! ");
			return 0;
		end;	
	end
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],nCount) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
--		if nCount == 1 then
--			nExp = floor(80000*(nLevel^3)/(80^3));
--			nChangeTimes = GetTask(TASK_USE_CARD_1);
--			if nChangeTimes >= 600 then
--				Talk(1,"","<color=green>������ʹ<color>���㲻���ٻ�ȡ�˽����ˣ�");
--				return 0;
--			end;
--			ModifyExp(nExp);
--			Msg2Player("����"..nExp.."�㾭�齱��");
--			SetTask(TASK_USE_CARD_1,nChangeTimes+1);
--			Say("����ע�⣺�������Ի�ȡ<color=yellow>"..(599-nChangeTimes).."<color>�θý�����",0);
		if nCount == 10 then
			AddItem(tItemInfo[24][2],tItemInfo[24][3],tItemInfo[24][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[24][1]);
		elseif nCount == 20 then
			nExp = floor(800000*(nLevel^3)/(80^3));
			nChangeTimes = GetTask(TASK_USE_CARD_20);
			if nChangeTimes >= 60 then
				Talk(1,"","C�c h� kh�ng th� ��i ph�n th��ng n�y n�a! ");
				return 0;
			end;
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
			SetTask(TASK_USE_CARD_20,nChangeTimes+1);	
			Talk(1,"use_card","<color=green>Ni�n s�<color>: B�n c�n c� th� ��i <color=yellow>"..(59-nChangeTimes).."<color> ph�n th��ng. ");
		elseif nCount == 40 then
			nExp = floor(3000000*(nLevel^3)/(80^3));
			nChangeTimes = GetTask(TASK_USE_CARD_40);
			if nChangeTimes >= 20 then
				Talk(1,"","C�c h� kh�ng th� ��i ph�n th��ng n�y n�a! ");
				return 0;
			end;
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");		
			SetTask(TASK_USE_CARD_40,nChangeTimes+1);
			Talk(1,"use_card","<color=green>Ni�n s�<color>: B�n c�n c� th� ��i <color=yellow>"..(19-nChangeTimes).."<color> ph�n th��ng. ");
		elseif nCount == 100 then
			nRetCode = AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[17][1]);		
		elseif nCount == 500 then
			nRetCode = AddItem(tItemInfo[22][2],tItemInfo[22][3],tItemInfo[22][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[22][1]);
		elseif nCount == 1000 then
			nRetCode = AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[18][1]);		
		elseif nCount == 2000 then
			--�Ի�
			nRetCode = AddItem(0,102,8840,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c trang s�c Huy Ho�ng Chi Th�y");
			Talk(1,"","<color=green>Ni�n s�<color>: Ch�c m�ng b�n nh�n ���c trang s�c Huy Ho�ng Chi Th�y, b�n c� th� ��n T��ng D��ng t�m <color=yellow>�� t� th� r�n L�u<color> �� th�ng c�p hi�u qu�.");
			Msg2Global(GetName().."S� d�ng "..nCount.."Th� k� ni�m ��i trang s�c Huy Ho�ng Chi Th�y");
		elseif nCount == 3000 then
			--��ҫ	
			nRetCode = AddItem(0,102,8841,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c trang s�c Vinh D�");
			Talk(1,"","<color=green>Ni�n s�<color>: Ch�c m�ng b�n nh�n ���c trang s�c Vinh D�, b�n c� th� ��n T��ng D��ng t�m <color=yellow>�� t� th� r�n L�u<color> �� th�ng c�p hi�u qu�");
			Msg2Global(GetName().."S� d�ng "..nCount.."Th� k� ni�m ��i trang s�c Vinh D�.");				
		end;
		if nRetCode == 1 then
			WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."S� d�ng "..nCount.."Th� k� ni�m ��i ph�n th��ng.");
		else
			WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."S� d�ng "..nCount.."��i th� k� ni�m ��i th�t b�i, v� tr� th�t b�i: "..nRetCode);
		end
	else
		Talk(1,"use_card","<color=green>Ni�n s�<color>: Xin l�i! S� l��ng th� k� ni�m JX2 tr�n 3 n�m c�a b�n kh�ng ��.");
	end;
end;

function use_card_exchange_exp()
	local nTimes = 0;
	local nX = 100;
	local nLevel = GetLevel();
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],1000) == 1 then
		nTimes = GetTask(TASK_USE_CARD_1000)+1;
		if nTimes > 10 then
			nX = max(20,100-(nTimes-10)*5);
		end;
		nExp = floor((nX/100)*(90000000*nLevel^3)/(80^3));
		SetTask(TASK_USE_CARD_1000,nTimes);
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		Talk(1,"","��y l� l�n th� <color=yellow>"..nTimes.."<color> thay ��i ph�n th��ng kinh nghi�m. <color=yellow>10<color> l�n ��u s� kh�ng b� suy gi�m, nh�ng t� l�n th� 11 tr� �i ph�n th��ng s� b� suy gi�m <color=yellow>5%<color>, t�i �a <color=yellow>20%<color>. ");
		WriteLog("[07 Tam ti�t li�n th�ng]:"..GetName().."th�"..nTimes.." l�n d�ng 1000 th� k� ni�m ��i ���c "..nExp.." �i�m kinh nghi�m");
	else
		Talk(1,"use_card","<color=green>Ni�n s�<color>: Xin l�i! S� l��ng th� k� ni�m JX2 tr�n 3 n�m c�a b�n kh�ng ��.");
	end;
end;

function use_card_exchange_equip()
	local selTab = {
			"Ta mu�n thay ��i Hi�n Vi�n v� kh� /#use_card_exchange_equip_confirm(1)",
			"Ta mu�n thay ��i Hi�n Vi�n Chi�n/#use_card_exchange_equip_confirm(2)",
			"Ta mu�n thay ��i Hi�n Vi�n ��u /#use_card_exchange_equip_confirm(3)",
			"Ta mu�n ��i th� kh�c /use_card",
			"�� ta xem/nothing",
			}
	Say("<color=green>Ni�n s�<color>: B�n mu�n ��i trang b� n�o sau ��y? <color=red>Ch� �: Ng��i ch�a v�o l�u ph�i ch� nh�n ���c 1 v� kh� ho�c trang s�c ng�u nhi�n.<color>",getn(selTab),selTab);
end;

function use_card_exchange_equip_confirm(nType)
	if GetItemCount(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4]) < 6000 then
		Talk(1,"use_card","<color=green>Ni�n s�<color>: Xin l�i! S� l��ng th� k� ni�m JX2 tr�n 3 n�m c�a b�n kh�ng ��.");
		return 0;
	end;
	local selTab = {
			"��ng �/#get_emperor_equip("..nType..")",
			"Kh�ng,Ta mu�n ��i th� kh�c c�/use_card_exchange_equip",
			"Ta suy ngh� m�t ch�t /nothing",
			}
	local tbItemName = {"Hi�n Vi�n v� kh�","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u"};
	Say("B�n x�c nh�n mu�n ��i <color=yellow>"..tbItemName[nType].."<color> ch�?",getn(selTab),selTab);		
end;

function get_emperor_equip(nType)
	if gf_JudgeRoomWeight(1,100,".") == 0 then
		return 0;
	end;
	local tbItemName = {"Hi�n Vi�n v� kh�","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u"};
	local nRoute = GetPlayerRoute();
	local nRetCode = 0;
	local nRand = 0;
	if nType == 1 then
		select_emperor_weapon();
		return 0;
	end;
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],6000) ~= 1 then
		Talk(1,"use_card","<color=green>Ni�n s�<color>: Xin l�i! S� l��ng th� k� ni�m JX2 tr�n 3 n�m c�a b�n kh�ng ��.");
		return 0;
	end;
	if nType == 2 then
		nRand = random(1,getn(tbHuangDiRing1[nRoute]));
		nRetCode = AddItem(tbHuangDiRing1[nRoute][nRand][2],tbHuangDiRing1[nRoute][nRand][3],tbHuangDiRing1[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
	elseif nType == 3 then
		nRand = random(1,getn(tbHuangDiRing2[nRoute]));
		nRetCode = AddItem(tbHuangDiRing2[nRoute][nRand][2],tbHuangDiRing2[nRoute][nRand][3],tbHuangDiRing2[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
	end;
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c "..tbItemName[nType]);
		WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."�� d�ng th� k� ni�m ��i."..tbItemName[nType]);
	else
		WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."D�ng th� k� ni�m ��i."..tbItemName[nType].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
	end;
end;

function select_emperor_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		local selTab = {
					"Ta mu�n Hi�n Vi�n To�i V� �ao/#give_emperor_weapon(2,1)",
					"Ta mu�n Hi�n Vi�n To�i V� C�n/#give_emperor_weapon(2,2)",
					"�� ta xem/nothing",
					}
		Say("B�n ch�n nh�ng v� kh� g� sau ��y?",getn(selTab),selTab);
	else
		local nIdx = random(1,getn(tHuangDiWeapon[nRoute]));
		give_emperor_weapon(nRoute,nIdx);
	end;
end;

function give_emperor_weapon(nRoute,nIdx)
	if gf_JudgeRoomWeight(1,100,".") == 0 then
		return 0;
	end;
	if DelItem(tItemInfo[19][2],tItemInfo[19][3],tItemInfo[19][4],6000) ~= 1 then
		Talk(1,"use_card","<color=green>Ni�n s�<color>: Xin l�i! S� l��ng th� k� ni�m JX2 tr�n 3 n�m c�a b�n kh�ng ��.");
		return 0;
	end;
	local nRetCode = AddItem(tHuangDiWeapon[nRoute][nIdx][2],tHuangDiWeapon[nRoute][nIdx][3],tHuangDiWeapon[nRoute][nIdx][4],1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c "..tHuangDiWeapon[nRoute][nIdx][1]);
		WriteLog("[08 Tam ti�t li�n th�ng]:"..GetName().."�� d�ng th� k� ni�m ��i."..tHuangDiWeapon[nRoute][nIdx][1]);
	else
		WriteLog("[L�i 08 Tam ti�t li�n th�ng]:"..GetName().."D�ng th� k� ni�m ��i."..tHuangDiWeapon[nRoute][nIdx][1].."B�o l�i khi AddItem, nRetCode:"..nRetCode);
	end;
end;

function use_mooncake()
	local selTab = {
				"Ta mu�n d�ng Th�nh Th� Kim Mai H�n H��ng Nguy�t ��i ph�n th��ng /#use_mooncake_confirm(1)",
				"Ta mu�n d�ng Th�nh Th� B�ch Ng�c Song Ho�ng Nguy�t ��i ph�n th��ng /#use_mooncake_confirm(2)",
				"Ta mu�n d�ng Th�nh Th� K� H��ng Ng� Nh�n Nguy�t ��i ph�n th��ng /#use_mooncake_confirm(3)",
				"Ta mu�n d�ng Th�nh Th� B�ch Hoa Th�p C�m Nguy�t ��i ph�n th��ng /#use_mooncake_confirm(4)",
				"Ta mu�n d�ng Th�nh Th� Th�t Tinh B�n Qu�n Nguy�t ��i ph�n th��ng /#use_mooncake_confirm(5)",
				"Ta mu�n d�ng Th�nh Th� Th��ng Nga Th�y Tinh Nguy�t ��i ph�n th��ng /#use_mooncake_confirm(6)",
				"Ta mu�n bi�t lo�i B�nh Trung Thu n�y c� th� ��i ���c ph�n th��ng g� /know_mookcake_use",
				"Ta �� d�nh �n v�y./nothing",
				}
	Say("N�m nay ch�ng ta h�y dung b�o h�p c�a V� L�m Minh ch� ph�t l�m gi�i th��ng cho ng��i l�m b�nh trung thu ngon nh�t, �� xem h� c� l�m ra nh�ng lo�i B�nh Trung Thu n�y kh�ng:",getn(selTab),selTab);
end;

function know_mookcake_use()
	Talk(1,"use_mooncake","<color=green>Ni�n s�<color>:\nTh�nh Th� Mai H�n H��ng Nguy�t c� th� ��i: 100 �i�m danh v�ng v� 1 H�p Ng�c B�i Huy Ho�ng\nTh�nh Th� B�ch Ng�c Song Ho�ng Nguy�t ��i: 5-20 �i�m t�ch l�y T� Quang C�c v� 1 H�p ��ng B�i Huy Ho�ng\nTh�nh Th� K� H��ng Ng� Nh�n Nguy�t ��i: 10-30 �i�m c�ng hi�n s� m�n v� 1 H�p ��ng B�i Huy Ho�ng\nTh�nh Th� B�ch Hoa Th�p C�m Nguy�t ��i: 20-40 �i�m t�ch l�y chi�n tr��ng v� 1 H�p ��ng B�i Huy Ho�ng\nTh�nh Th� Th�t Tinh B�n Qu�n Nguy�t ��i: �i�m kinh nghi�m. M�i l�n n�p 1 c�i c� th� nh�n 1 H�p Ng�n B�i Vinh D�\nTh�nh Th� Th��ng Nga Th�y Tinh Nguy�t ��i: �i�m kinh nghi�m. M�i l�n n�p 10 c�i c� th� nh�n 1 H�p Kim B�i Vinh D�\n<color=red>Ch� �: Ng��i ch�a v�o m�n ph�i kh�ng nh�n ���c �i�m c�ng hi�n s� m�n v� �i�m t�ch l�y chi�n tr��ng.<color>");
end;

function use_mooncake_confirm(nType)
	if gf_JudgeRoomWeight(2,60,".") == 0 then
		return 0;
	end;
	local nPoint = 0;
	local nTimes = 0;
	local nLevel = GetLevel();
	local nExp = 0;
	local nX = 100;
	local nRoute = GetPlayerRoute();
	local nNums = 0;
	if DelItem(tMoonCake[10+nType][2],tMoonCake[10+nType][3],tMoonCake[10+nType][4],1) == 1 then
		if nType == 1 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),1);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni�n s�<color>: M�i ng��i t�i �a c� th� ��i b�nh trung thu n�y 100 l�n, b�n �� ��i 100 l�n r�i, kh�ng th� ��i ti�p.");
				return
			end
			ModifyReputation(100,0);
			AddItem(tItemInfo[15][2],tItemInfo[15][3],tItemInfo[15][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[15][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),1,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni�n s�<color>: B�n �� ��i <color=yellow>"..(nNums+1).." l�n<color> Th�nh Th� Mai H�n H��ng Nguy�t, b�n c�n ��i ���c <color=yellow>"..(99-nNums).." l�n<color>.");
		elseif nType == 2 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),2);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni�n s�<color>: M�i ng��i t�i �a c� th� ��i b�nh trung thu n�y 100 l�n, b�n �� ��i 100 l�n r�i, kh�ng th� ��i ti�p.");
				return
			end		
			nPoint = random(5,20);
			SetTask(652,GetTask(652)+nPoint);
			Msg2Player("B�n nh�n ���c "..nPoint.." �i�m t�ch l�y T� Quang C�c ");
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),2,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni�n s�<color>: B�n �� ��i <color=yellow>"..(nNums+1).." l�n<color> Th�nh Th� B�ch Ng�c Song Ho�ng Nguy�t, b�n c�n ��i ���c <color=yellow>"..(99-nNums).." l�n<color>.");			
		elseif nType == 3 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),3);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni�n s�<color>: M�i ng��i t�i �a c� th� ��i b�nh trung thu n�y 100 l�n, b�n �� ��i 100 l�n r�i, kh�ng th� ��i ti�p.");
				return
			end		
			if nRoute ~= 0 then
				nPoint = random(10,30);
				SetTask(336,GetTask(336)+nPoint);
				Msg2Player("B�n nh�n ���c "..nPoint.." �i�m c�ng hi�n S� M�n ");
			else
				--nExp = floor(100000*(nLevel^3)/(80^3));
				--ModifyExp(nExp);
				--Msg2Player("����"..nExp.."�㾭��");
			end;
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),3,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni�n s�<color>: B�n �� ��i <color=yellow>"..(nNums+1).." l�n<color> Th�nh Th� K� H��ng Ng� Nh�n Nguy�t, b�n c�n ��i ���c <color=yellow>"..(99-nNums).." l�n<color>.");						
		elseif nType == 4 then
			nNums = GetByte(GetTask(TASK_CHANGE_YUEBING),4);
			if nNums >= 100 then
				Talk(1,"","<color=green>Ni�n s�<color>: M�i ng��i t�i �a c� th� ��i b�nh trung thu n�y 100 l�n, b�n �� ��i 100 l�n r�i, kh�ng th� ��i ti�p.");
				return
			end				
			if nRoute ~= 0 then
				nPoint = random(20,40);
				SetTask(707,GetTask(707)+nPoint);
				Msg2Player("B�n nh�n ���c "..nPoint.." �i�m t�ch l�y chi�n tr��ng");
			else
				--nExp = floor(100000*(nLevel^3)/(80^3));
				--ModifyExp(nExp);
				--Msg2Player("����"..nExp.."�㾭��");
			end;
			AddItem(tItemInfo[16][2],tItemInfo[16][3],tItemInfo[16][4],1);
			Msg2Player("B�n nh�n ���c 1 "..tItemInfo[16][1]);
			SetTask(TASK_CHANGE_YUEBING,SetByte(GetTask(TASK_CHANGE_YUEBING),4,nNums+1));
			Talk(1,"use_mooncake","<color=green>Ni�n s�<color>: B�n �� ��i <color=yellow>"..(nNums+1).." l�n<color> Th�nh Th� B�ch Hoa Th�p C�m Nguy�t, b�n c�n ��i ���c <color=yellow>"..(99-nNums).." l�n<color>.");			
		elseif nType == 5 then
			nTimes = GetTask(TASK_QIXING_EXCHANGE)+1;
			if nTimes > 10 then
				nX = max(20,100-(nTimes-10)*5);
			end;
			if nLevel ~= 99 then	
				nExp = floor((nX/100)*(1500000*nLevel^3)/(80^3));
				ModifyExp(nExp);
				Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
			else
				AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],30);
				Msg2Player("B�n nh�n ���c 30 quy�n "..tItemInfo[27][1]);
			end
--			if mod(nTimes,5) == 0 then
				AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
				Msg2Player("B�n nh�n ���c 1 "..tItemInfo[17][1]);
--				Msg2Global(GetName().."ʹ��ʢ�����ǰ���»�ȡ����1��"..tItemInfo[17][1]);
--				WriteLog("[08��������]"..GetName().."��ʢ�����ǰ���»�ȡ��1��"..tItemInfo[17][1]);
--			end;
			Msg2Player("��y l� l�n th� "..nTimes.." l�n d�ng Th�nh Th� Th�t Tinh B�n Qu�n Nguy�t ��i th��ng ");
			SetTask(TASK_QIXING_EXCHANGE,nTimes);
		elseif nType == 6 then
			nTimes = GetTask(TASK_CHANGE_EXCHANGE)+1;
			if nTimes > 10 then
				nX = max(20,100-(nTimes-10)*5);
			end;
			if nLevel ~= 99 then	
				nExp = floor((nX/100)*(3000000*nLevel^3)/(80^3));
				ModifyExp(nExp);
				Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
			else
				AddItem(tItemInfo[27][2],tItemInfo[27][3],tItemInfo[27][4],60);
				Msg2Player("B�n nh�n ���c 60 quy�n "..tItemInfo[27][1]);			
			end
			if mod(nTimes,10) == 0 then
				AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
				Msg2Player("B�n nh�n ���c 1 "..tItemInfo[18][1]);
				Msg2Global(GetName().." l�n d�ng Th�nh Th� Th��ng Nga Th�y Tinh Nguy�t ��i 1"..tItemInfo[18][1]);
				WriteLog("[08 Tam ti�t li�n th�ng]"..GetName().." d�ng Th�nh Th� Th��ng Nga Th�y Tinh Nguy�t ��i 1"..tItemInfo[18][1]);
			end;
			SetTask(TASK_CHANGE_EXCHANGE,nTimes);
			Msg2Player("��y l� l�n th� "..nTimes.." l�n d�ng Th�nh Th� Th��ng Nga Th�y Tinh Nguy�t ��i th��ng ");
		end;
		WriteLog("[08 Tam ti�t li�n th�ng]"..GetName().."�� d�ng B�nh Trung Thu ��i ph�n th��ng, c�c lo�i b�nh Trung Thu:"..nType);
	else
		Talk(1,"use_mooncake","B�n kh�ng c� <color=yellow>"..tMoonCake[10+nType][1].."<color> �!!");
	end;
end;

function know_reward()
	Talk(3,"want_reward","<color=green>Ni�n s�<color>: M�i ng�y v�o 16:30, 19:30, 21:45 7 Boss l�n s� xu�t hi�n b�n ngo�i 3 th�nh l�n Ph�ng T��ng, Tuy�n Ch�u, Th�nh ��, ��nh b�i Boss c� th� g�i ra Ti�u qu�i, nh�n v�o Ti�u qu�i nh�n ���c B�o h�p ho�c Ch�a kh�a (m�i ng��i m�i gi� ch� c� th� nh�n 1 l�n).","<color=green>Ni�n s�<color>: T�t Trung Thu l�i ��n, n�m nay ngo�i vi�c l�m c�c b�nh trung thu �� th��ng th�c c�n c� th� ��n ch� ta ��i c�c lo�i b�o h�p c�a V� l�m minh ch� ph�t. Mu�n bi�t b�o h�p c� c�ng d�ng g� h�y ��n g�p ��c s� V� L�m.","<color=green>Ni�n s�<color>: Trong b�o h�p c� th� k� ni�m JX2 tr�n 3 n�m, ta mu�n thu th�p c�c th� n�y, n�u ng��i t�m ���c �em ��n ch� ta �� ��i th��ng!");
end;

function want_mooncake_resource()
	if gf_JudgeRoomWeight(8,100) == 0 then
		Talk(1,"","B�n trang b� qu� nhi�u, kh�ng th� th�m ph�n th��ng m�i v�o.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nRetCode = 0;
	if GetItemCount(tMaterial[9][2],tMaterial[9][3],tMaterial[9][4]) == 0 then
		nRetCode = AddItem(tMaterial[9][2],tMaterial[9][3],tMaterial[9][4],1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 "..tMaterial[9][1]);
		end;
	end;
	if nDate <= GetTask(TASK_GOT_RESOURCE) then
		Talk(1,"main","H�m nay ng��i �� nh�n nguy�n li�u l�m b�nh, ng�y mai h�y quay l�i nh�n ti�p!");
		return 0;
	end;
	SetTask(TASK_GOT_RESOURCE,nDate);
	nRetCode = AddItem(tMaterial[1][2],tMaterial[1][3],tMaterial[1][4],1); 
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 "..tMaterial[1][1]);
	end;
	nRetCode = AddItem(tMaterial[4][2],tMaterial[4][3],tMaterial[4][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 "..tMaterial[4][1]);
	end;
	nRetCode = AddItem(tMaterial[5][2],tMaterial[5][3],tMaterial[5][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 "..tMaterial[5][1]);
	end;
	nRetCode = AddItem(tMaterial[6][2],tMaterial[6][3],tMaterial[6][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 "..tMaterial[6][1]);
	end;
	nRetCode = AddItem(tMaterial[7][2],tMaterial[7][3],tMaterial[7][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 "..tMaterial[7][1]);
	end;
	nRetCode = AddItem(tMaterial[8][2],tMaterial[8][3],tMaterial[8][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 "..tMaterial[8][1]);
	end;
	Talk(1,"main","��y l� nguy�n li�u l�m b�nh c�a b�n, hy v�ng b�n c� th� l�m ra b�nh Trung Thu h�o h�ng!");
end;

function want_mooncake()
	local nDate = tonumber(date("%y%m%d"));
	local nMapID = GetWorldPos();
	local sCityName = "";
	if nMapID == 100 then
		sCityName = "Tuy�n Ch�u";
	elseif nMapID == 200 then
		sCityName = "Bi�n Kinh";
	elseif nMapID == 300 then
		sCityName = "Th�nh ��";
	end;
	local nLv = GetLevel();
	if IB_VERSION ~= 1 then
		if nLv < 60 then
			Talk(1,"","<color=green>Ni�n s�<color>: ��ng c�p c�a b�n qu� th�p, kh�ng th� nh�n b�nh trung thu, ��t  <color=yellow>c�p 60<color> h�y quay l�i ��y.");
			return
		end
	else
		if nLv < 30 then
			Talk(1,"","<color=green>Ni�n s�<color>: ��ng c�p c�a b�n qu� th�p, kh�ng th� nh�n b�nh trung thu, ��t <color=yellow>c�p 30<color> h�y quay l�i ��y.");
			return
		end 
	end
	if GetTask(TASK_GOT_MOONCATE) >= nDate then
		Talk(1,"main","H�m nay b�n �� nh�n b�nh Trung Thu, ng�y mai h�y quay l�i l�nh ti�p. Ch�c b�n Trung Thu vui v�!");
		return 0;
	end;
	local nCounter = GetMapTaskTemp(nMapID,3);
	if nCounter == 0 then
		Talk(1,"main","B�nh Trung Thu v�n ch�a chu�n b� xong,"..tSexName[GetSex()].."Th�i gian ��n l�y B�nh Trung Thu l� <color=yellow>11h30, 14h30, 21h00, 23:00<color>, s� l��ng c� h�n. Xin h�y nhanh ch�n.");
		return 0;
	elseif nCounter == 1 then
		AddGlobalNews(sCityName.."Ni�n s� �� ph�t xong b�nh Trung Thu, xin c�c b�n l�n sau ti�p t�c t�ch c�c tham gia.");
		Msg2SubWorld(sCityName.."Ni�n s� �� ph�t xong b�nh Trung Thu, xin c�c b�n l�n sau ti�p t�c t�ch c�c tham gia.");
	end;
	SetTask(TASK_GOT_MOONCATE,nDate);
	local nRetCode = AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1);
	if nRetCode == 1 then
		Talk(1,"main","B�nh Trung Thu n�y tuy ch�ng c� g� ��c bi�t nh�ng h�y coi nh� l� m�t ch�t t�m � c�a ta.");
	else
		WriteLog("[L�i Tam ti�t li�n th�ng]:"..GetName().."L�i AddItem khi nh�n b�nh trung thu, tr� quay l�i:"..nRetCode);
	end;
	SetMapTaskTemp(nMapID,3,nCounter-1);
	SetTask(TASK_GOT_MOONCANT_COUNT,GetTask(TASK_GOT_MOONCANT_COUNT)+1);
	if nCounter > 10 and mod(nCounter-1,10) == 0 then
		Msg2SubWorld(sCityName.."Ch� Ni�n s� c�n "..(10*floor(nCounter/10)).." ph�n b�nh Trung Thu c� th� l�nh.");
	end;
end;

function know_detail()
	local selTab = {
			"Nh�n ���c b�nh Trung Thu M� V�/detail_1",
			"Nh�n th��ng V� L�m Minh/detail_6",
--			"��ȡ�����꽱��/detail_2",
			"B�nh Trung Thu, l�y ��o c� ��i ph�n th��ng /detail_3",
			"L�m c�c lo�i b�nh Trung Thu/detail_4",
			"��i th� k� ni�m nh�n ph�n th��ng/detail_5",
			"[-Quay l�i ��i tho�i-]/main",
			"[-K�t th�c ��i tho�i-]/nothing",
			}
	Say("<color=green>H��ng d�n<color>: B�n mu�n t�m hi�u ph��ng di�n n�o?",getn(selTab),selTab);
end;

function detail_1()
	Talk(1,"know_detail","<enter>Th�i gian nh�n b�nh Trung Thu:<color=yellow> M�i ng�y 4 l�n 11h30, 14h30, 21h00, 23h00<color>, ng��i ch�i c� th� g�p Ni�n s� �� l�y b�nh, ch� � s� l��ng c� h�n, ai ��n tr��c s� l�y tr��c, <color=yellow> ch� ���c l�y 1 l�n trong ng�y<color>. ");
end;

function detail_2()
	Talk(1,"know_detail","Kim S�n ch��ng m�n �� chu�n b� r�t nhi�u ph�n th��ng cho ng��i ch�i c�, b�n n�o tham gia V� L�m 2 v�o 3 th�i �i�m kh�c nhau s� c� ph�n th��ng t��ng �ng. \nQuy t�c ph�n th��ng: \n1, x�y d�ng nh�n v�t nhi�u h�n 600 ng�y ���c t�ng 20 r��ng s�t ho�c 5 r��ng ��ng ho�c 1 r��ng b�c\n2, x�y d�ng nh�n v�t tr�n 300 ng�y ���c t�ng 10 r��ng s�t ho�c 2 r��ng ��ng \n3, x�y d�ng nh�n v�t �t h�n 100 ng�y ���c t�ng 5 r��ng s�t ho�c 1 r��ng ��ng.");
end;

function detail_3()
	Talk(1,"detail_3_ex","<color=green>Ni�n s�<color>: M�i ng�y v�o <color=yellow>16:30, 19:30, 21:45<color> c�c Boss s� xu�t hi�n b�n ngo�i <color=yellow>Ph�ng T��ng. Tuy�n Ch�u, Th�nh ��<color>, ��nh b�i c�c BOSS n�y c� th� g�i ra Ti�u qu�i, nh�n v�o Ti�u qu�i nh�n ���c c�c B�o h�p (m�i ng��i m�i gi� ch� c� th� nh�n 1 l�n), m�i ng��i ph�i c� ch�a kh�a t��ng �ng m� c�c b�o h�p �� nh�n ph�n th��ng.");
end;

function detail_3_ex()
	Talk(1,"know_detail","<color=green>Ni�n s�<color>: T�t Trung Thu l�i ��n, n�m nay ngo�i vi�c l�m c�c b�nh trung thu �� th��ng th�c c�n c� th� ��n ch� ta ��i c�c lo�i b�o h�p c�a V� l�m minh ch� ph�t. Mu�n bi�t b�o h�p c� c�ng d�ng g� h�y ��n g�p <color=yellow>��c s� V� L�m<color>. Ngo�i ra n�u b�n nh�n ���c th� k� ni�m JX2 tr�n 3 n�m c� th� ��n g�p Ni�n s� ��i th��ng.");
end;

function detail_4()
	Talk(1,"detail_4_ex","<color=green>Ni�n s�<color>: <enter>C�ch l�m b�nh trung thu: <enter>M�i ng�y ��n g�p Ni�n s� nh�n nguy�n li�u v� c�ng c� l�m b�nh, �n c�c b�nh trung thu s� nh�n ���c c�c hi�u qu� ��c bi�t.<enter><color=yellow>1. Nh�n nguy�n li�u<color>: Trong th�i gian ho�t ��ng, m�i ng�y online ��n g�p Ni�n s� �� nh�n nguy�n li�u, ngo�i ra c� th� mua th�m c�c nguy�n li�u l�m b�nh t�i ��y.<enter><color=yellow>2. N�u b�nh<color>: ��u ti�n, nh�n ch�n c�ng c�, sau �� b� nguy�n li�u v�o theo h��ng d�n, c� th� ch�n b� 1 trong 3 nguy�n li�u ch�nh v�o, sau �� ch�n than hay c�i �� n�u.");
end;

function detail_4_ex()
	Talk(1,"know_detail","<color=green>H��ng d�n<color>: Ch� �: <enter>1) N�u ch�n than g� th� nhi�t �� ban ��u l� 600 ��, ch�n c�i th� nhi�t �� ban ��u l� 300 ��. <enter>2)Nhi�t �� l� s� gi�m kh�ng ng�ng gi�m xu�ng. <enter>3)B�t c� l�c n�o c�ng c� th� th�m nhi�n li�u v�o l� nh�ng nhi�t �� v��t qu� 900 �� b�nh s� b� ch�y. <enter>4) Nhi�t �� trong l� n��ng kh�ng th� bi�t ���c n�n sau khi b�t ��u n��ng b�nh 3 ph�t s� c� 1 l�n �o nhi�t �� hi�n t�i, n�u qu� 3 ph�t sau s� kh�ng th� �o nhi�t ��. <enter><color=yellow>3, l�y b�nh<color><enter>1) Th�i gian n��ng b�nh l� 5 ph�t. 5 ph�t sau nh�n chu�t ph�i v�o l� n��ng b�nh �� l�y b�nh. <enter>2) Sau khi nhi�t �� l� n��ng b�nh c�n 0 �� kh�ng th� ti�p t�c th�m nhi�n li�u v�o.");
end;

function detail_5()
	Talk(2,"know_detail","<color=green>Ni�n s�<color>: M� b�o h�p c� th� nh�n ���c th� k� ni�m JX2 tr�n 3 n�m\n  10 th� k� ni�m ��i ���c 1 B�ng Lai ti�n l�\n  20 th� k� ni�m ��i ���c ph�n th��ng �i�m kinh nghi�m\n  40 th� k� ni�m ��i ���c ph�n th��ng �i�m kinh nghi�m\n  100 k� ni�m c� th� ��i 1 H�p Ng�n B�i Vinh D�\n  500 th� k� ni�m ��i 1 Ch�a Kh�a B�c Vinh D�","<color=green>Ni�n s�<color>:\n1000 th� k� ni�m ��i 1 H�p Kim B�i Vinh D�\n2000 th� k� ni�m ��i trang s�c Huy Ho�ng Chi Th�y\n3000 th� k� ni�m ��i trang s�c Vinh D�\n6000 th� k� ni�m ��i 1 trong 3 trang b� Ho�ng ��.");
end;

function detail_6()
	Talk(1,"know_detail","<color=green>Ni�n s�<color>:\nTrong th�i gian ho�t ��ng, m�i ng�y ��n g�p V� l�m truy�n nh�n �� nh�n th��ng c�a V� l�m minh ch�, ph�n th��ng n�y s� thay ��i t�y theo v�n may c�a b�n. Mu�n bi�t v�n may h�y ��n t�m Th� Ti�u Nha.");
end;


function cancel()
	SetTaskTemp(73,0);
end;

function get_intro_book()
	if GetItemCount(tItemInfo[11][2],tItemInfo[11][3],tItemInfo[11][4]) >=1 then
		Talk(1,"main","<color=green>H��ng d�n<color>: Kh�ng ph�i ng��i c� 1 quy�n"..tItemInfo[11][1].."?");
	elseif AddItem(tItemInfo[11][2],tItemInfo[11][3],tItemInfo[11][4],1) == 1 then
		Msg2Player("B�n nh�n ���c 1 quy�n"..tItemInfo[11][1]);
		Talk(1,"main","��y l� s�ch h��ng d�n ho�t ��ng trong n�m nay, h�y gi� k� v� t�m l�i gi�i ��p cho nh�ng c�u h�i c�a b�n nh�!");
	end;
end;

function buy_fireworks()
	Sale(89);
end;

function require_mooncake()
	local nGotTimes = GetTask(TASK_GOT_MOONCANT_COUNT);
	local nPassDay = tonumber(date("%j")) - 255;
	if nPassDay > 27 then
		nPassDay = 27;
	end;	
	local nNum = nPassDay - nGotTimes;	--���������ˣ��������Ͳ����ʡ�2008��9��11����2008��ĵ�255��
	if nNum <= 0 then
		Talk(1,"","B�n �� nh�n �� s� b�nh r�i.");
		return 0;
	end;
	Say("Ho�t ��ng l�n n�y b�n �� th�c hi�n r�i.<color=yellow>"..nGotTimes.."<color> l�n B�nh Trung Thu M� V�, b�n c�n <color=yellow>"..nNum.."<color> b�nh ch�a nh�n, nh�n<color=yellow>1 l�n <color>ph�i c� <color=yellow>danh s�ch ng��i ch�i c�<color>, b�n x�c nh�n nh�n kh�ng?",
		2,
		"Ta mu�n nh�n/require_mooncake_confirm",
		"T�m th�i kh�ng d�ng/nothing")
end;

function require_mooncake_confirm()
	local nGotTimes = GetTask(TASK_GOT_MOONCANT_COUNT);
	if gf_JudgeRoomWeight(1,10,".") == 0 then
		return 0;
	end;
	if DelItem(2,0,1024,1) == 1 then
		AddItem(tMoonCake[17][2],tMoonCake[17][3],tMoonCake[17][4],1);
		SetTask(TASK_GOT_MOONCANT_COUNT,nGotTimes+1);
		Msg2Player("B�n nh�n ���c 1 "..tMoonCake[17][1]);
	else
		Talk(1,"","Ph�i c� <color=yellow>Danh s�ch ng��i ch�i c�<color> m�i c� th� nh�n b�nh. ");
	end;
end;

function buy_things()
	Sale(89);
end;

function ring_Sale()
	Sale(100,100,1);
end 