--��ʮ�����챦��
--by vivi
--2008/11/05

Include("\\script\\online\\qixi08\\function.lua");

g_szBoxInfo = "<color=green>B�o r��ng k� ni�m<color>: ";

tBoxGiveItem = {
	--����ΪIB_VERSION��0Ϊ�շ�����1Ϊ�����
	[0] = {{"Nguy�t Hoa ",2,1,2002,1},{"Nguy�t Hoa ",2,1,2002,5},{"N� Oa Tinh Th�ch",2,1,504,1}},    
	[1] = {{"M�nh Thi�n th�ch",2,2,7,3},{"M�nh Thi�n th�ch",2,2,7,15},{"Thi�n Th�ch Tinh Th�ch",2,1,1009,10}}
};

function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear3,nMonth3,nDay3 = QX08_GetDate(g_nAwardEndDate);
	local strtab = {
				"Ta d�ng ch�a kh�a ��ng k� ni�m m� r��ng/#use_key_open(1)",
				"Ta d�ng ch�a kh�a b�c k� ni�m m� r��ng/#use_key_open(2)",
				"Ta d�ng ch�a kh�a v�ng k� ni�m m� r��ng/#use_key_open(3)",
				"Ta mu�n d�ng 6 ch�a kh�a v�ng k� ni�m m� r��ng �� c� Thi�n Qu�i Th�ch/use_manykey_open",
				"Ta mu�n d�ng 6 ch�a kh�a v�ng m� r��ng �� c� ng�a di chuy�n 120%/use_manykey_6",
				"Ta mu�n d�ng 10 ch�a kh�a v�ng m� r��ng �� c� Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y/use_manykey_10",
				"M� r��ng c� th� nh�n ���c nh�ng v�t ph�m n�o/know_20box_award",
				"Sau n�y h�n m�/nothing"
				};
	if nDate <= g_nAwardEndDate then
		tinsert(strtab,1,"Ta kh�ng d�ng b�t c� v�t ph�m n�o �� m� r��ng (ch� nh�n ���c ph�n th��ng kinh nghi�m)/ask_give_exp");
		Say(g_szBoxInfo.."Tr��c "..nYear3.."ni�n"..nMonth3.."Nguy�t"..nDay3.." m� r��ng, t� l� c� ���c c�c ph�m c�n t�y thu�c v�o ng��i d�ng v�t g� �� m� r��ng.",getn(strtab),strtab);
	else
		Say(g_szBoxInfo.."Th�i gian ho�t ��ng �� h�t, h� th�ng s� kh�ng thu l�i r��ng. N�u b�n kh�ng c� ch�a kh�a, �� kh�ng m�t th�i gian c�a m�nh, c� th� t�m b�t k� npc mua b�n n�o �� �� b�n.",getn(strtab),strtab);
	end
end

function use_key_open(nType)
	local strtab = {
	      "Ng�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n ���c chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)/#ask_open_box("..nType..",1)",
	      "M�t t�ch cao c�p S� M�n (ng��i ch�a gia nh�p l�u ph�i s� nh�n ���c 1 quy�n m�t t�ch ng�u nhi�n)/#ask_open_box("..nType..",2)",
	      "100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)/#ask_open_box("..nType..",3)",
	      "Thi�n Qu�i Th�ch (d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i, v� trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)/#ask_open_box("..nType..",4)",
	      "Ta ch�n nh�m r�i./OnUse",
	      "Sau n�y h�n m�/nothing"
				};
	if IB_VERSION == 1 then
		tinsert(strtab,5,"��nh H�n Thi�n Th�ch Th�n Th�ch (c��ng h�a v�t ph�m, �� c��ng h�a ��n c�p 7 th� kh�ng th� c��ng h�a n�a)/#ask_open_box("..nType..",5)");
	else
		tinsert(strtab,5,"Thi�n Th�ch Linh Th�ch (c��ng h�a trang b� tr�c ti�p ��n c�p 7)/#ask_open_box("..nType..",5)");
	end
	tinsert(strtab,6," Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y/#ask_open_box("..nType..",6)")
	Say(g_szBoxInfo.."B�n s� d�ng "..tItemName[nType+6][1].."M� r��ng, h�y ch�n ph�n th��ng m� b�n mu�n c�, n�u l�n n�y kh�ng ���c th� b�n c� th� nh�n ���c "..tBoxGiveItem[IB_VERSION][nType][1]..tBoxGiveItem[IB_VERSION][nType][5]..".",getn(strtab),strtab);
end

function ask_open_box(nType,nTbIdx)
	local tGiveNameIB = {"Ng�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n ���c chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)","M�t t�ch cao c�p S� M�n (ng��i ch�a gia nh�p l�u ph�i s� nh�n ���c 1 quy�n m�t t�ch ng�u nhi�n)","100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)","Thi�n Qu�i Th�ch (d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i, v� trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)","��nh H�n Thi�n Th�ch Th�n Th�ch (c��ng h�a v�t ph�m, �� c��ng h�a ��n c�p 7 th� kh�ng th� c��ng h�a n�a)"," Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y"};
	local tGiveName = {"Ng�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n ���c chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)","M�t t�ch cao c�p S� M�n (ng��i ch�a gia nh�p l�u ph�i s� nh�n ���c 1 quy�n m�t t�ch ng�u nhi�n)","100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)","Thi�n Qu�i Th�ch (d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i, v� trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)","Thi�n Th�ch Linh Th�ch (c��ng h�a trang b� tr�c ti�p ��n c�p 7)"," Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y"};
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_YI_EXP,0);
		SetTask(TSK_AOYUN_EXP_NUM,0);
	end
	if nTbIdx == 3 and GetTask(TSK_AOYUN_YI_EXP) ~= 0 then
		Talk(1,"","100 tri�u kinh nghi�m m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n, tu�n n�y b�n �� ��i th�nh c�ng 1 l�n, tu�n sau h�n ��n.");
		return 0;
	end
	if nTbIdx == 1 then
		local nRoute = GetPlayerRoute();
		if nRoute == 16 or nRoute == 17 or nRoute == 18 then 
			Say(g_szBoxInfo.."B�n x�c nh�n d�ng "..tItemName[nType+6][1].." m� r��ng �� c� "..tGiveNameIB[nTbIdx].." ch�? H�y ch�n m�u ng�a.",
				4,
				"Chi�n M� Nguy�n So�i cao c�p (tr�ng)/#ask_choose_horse("..nType..","..nTbIdx..",3)",
				"Chi�n M� Nguy�n So�i cao c�p (�en)/#ask_choose_horse("..nType..","..nTbIdx..",4)",
				"Ta ch�n nh�m r�i./#use_key_open("..nType..")",
				"Sau n�y h�n m�/nothing")
		else
			Say(g_szBoxInfo.."B�n x�c nh�n d�ng "..tItemName[nType+6][1].." m� r��ng �� c� "..tGiveNameIB[nTbIdx].." ch�? H�y ch�n m�u ng�a.",
				4,
				"B�ch Ngh�a (tr�ng)/#ask_choose_horse("..nType..","..nTbIdx..",1)",
				"Hi�p D�c (�en)/#ask_choose_horse("..nType..","..nTbIdx..",2)",
				"Ta ch�n nh�m r�i./#use_key_open("..nType..")",
				"Sau n�y h�n m�/nothing")		
		end
	else
		if IB_VERSION == 1 then
			Say(g_szBoxInfo.."B�n x�c nh�n d�ng "..tItemName[nType+6][1].." m� r��ng �� c� "..tGiveNameIB[nTbIdx].."?",
				3,
				"��ng, ta mu�n m� /#confirm_open_box("..nType..","..nTbIdx..",0)",
				"Ta ch�n nh�m r�i./#use_key_open("..nType..")",
				"Sau n�y h�n m�/nothing")	
		else
			Say(g_szBoxInfo.."B�n x�c nh�n d�ng "..tItemName[nType+6][1].." m� r��ng �� c� "..tGiveName[nTbIdx].."?",
				3,
				"��ng, ta mu�n m� /#confirm_open_box("..nType..","..nTbIdx..",0)",
				"Ta ch�n nh�m r�i./#use_key_open("..nType..")",
				"Sau n�y h�n m�/nothing")			
		end		
	end
end

function ask_choose_horse(nType,nTbIdx,nChoose)
	Say(g_szBoxInfo.."B�n x�c nh�n d�ng "..tItemName[nType+6][1].." m� r��ng �� c� "..tItemName[nChoose][1].."?",
		3,
		"���c/#confirm_open_box("..nType..","..nTbIdx..","..nChoose..")",
		"Ta ch�n nh�m r�i./#ask_open_box("..nType..","..nTbIdx..")",
		"Sau n�y h�n m�/nothing")
end

function confirm_open_box(nType,nTbIdx,nChoose)
	if GetItemCount(tItemName[nType+6][2],tItemName[nType+6][3],tItemName[nType+6][4]) < 1 then
		Talk(1,"",g_szBoxInfo.."B�n d�ng "..tItemName[nType+6][1].." m� R��ng k� ni�m 20 n�m, nh�ng tr�n ng��i b�n kh�ng c� "..tItemName[nType+6][1].." .");
		return 0
	end
	if gf_Judge_Room_Weight(2,100,g_szBoxInfo) ~= 1 then
		return 0;
	end 
	if DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 and DelItem(tItemName[nType+6][2],tItemName[nType+6][3],tItemName[nType+6][4],1) == 1 then
		local tb = {};
		local nAddFlag = 0;
		local nRoute = GetPlayerRoute();
		
		local nRand = random(1,10000);
		if IB_VERSION == 1 then
			tb = tAwardGailvIB;
		else
			tb = tAwardGailv;
		end
		if nRand <= tb[nType][nTbIdx] then
			if nTbIdx == 1 then
				nAddFlag = AddItem(tItemName[nChoose][2],tItemName[nChoose][3],tItemName[nChoose][4],1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemName[nChoose][1]);
				if nAddFlag == 1 then
					Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[nChoose][1]);
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[nChoose][1].." th�nh c�ng ");
				else
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[nChoose][1].." th�t b�i, k� hi�u:"..nAddFlag);
				end				
			elseif nTbIdx == 2 then
				local nRandMiji = random(1,getn(tGaojiMiji[nRoute]));
				nAddFlag = AddItem(tGaojiMiji[nRoute][nRandMiji][2],tGaojiMiji[nRoute][nRandMiji][3],tGaojiMiji[nRoute][nRandMiji][4],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tGaojiMiji[nRoute][nRandMiji][1]);
				if nAddFlag == 1 then
					Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tGaojiMiji[nRoute][nRandMiji][1]);
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tGaojiMiji[nRoute][nRandMiji][1].." th�nh c�ng ");
				else
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tGaojiMiji[nRoute][nRandMiji][1].." th�t b�i, k� hi�u:"..nAddFlag);
				end				
			elseif nTbIdx == 3 then
				SetTask(TSK_AOYUN_YI_EXP,1);
				ModifyExp(100000000);
				Msg2Player("Ch�c m�ng b�n �� nh�n ���c 100 tri�u kinh nghi�m");
				Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].." nh�n ���c 100 tri�u kinh nghi�m.");
				WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."D�ng th�"..tItemName[nType+6][1].."M� r��ng nh�n ���c 100 tri�u kinh nghi�m.");
			elseif nTbIdx == 4 then
				nAddFlag = AddItem(tItemName[5][2],tItemName[5][3],tItemName[5][4],1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemName[5][1]);
				if nAddFlag == 1 then
					Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[5][1]);
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[5][1].." th�nh c�ng ");
				else
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[5][1].." th�t b�i, k� hi�u:"..nAddFlag);
				end					
			elseif nTbIdx == 5 then
				if IB_VERSION == 1 then
					nAddFlag = AddItem(tItemName[12][2],tItemName[12][3],tItemName[12][4],1);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemName[12][1]);	
					if nAddFlag == 1 then
						Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[12][1]);
						WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[12][1].." th�nh c�ng ");
					else
						WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[12][1].." th�t b�i, k� hi�u:"..nAddFlag);
					end															
				else
					nAddFlag = AddItem(tItemName[13][2],tItemName[13][3],tItemName[13][4],1);
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemName[13][1]);	
					if nAddFlag == 1 then
						Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[13][1]);
						WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[13][1].." th�nh c�ng ");
					else
						WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tItemName[13][1].." th�t b�i, k� hi�u:"..nAddFlag);
					end										
				end
			elseif nTbIdx == 6 then
				if AddItem(tItemName[16][2],tItemName[16][3],tItemName[16][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
					nAddFlag = 1;
				end
				if AddItem(tItemName[17][2],tItemName[17][3],tItemName[17][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
					nAddFlag = 2;
				end
				if nAddFlag == 2 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemName[16][1].." v�"..tItemName[17][1]);
					Msg2Global("��i hi�p"..GetName().."S� d�ng "..tItemName[nType+6][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c"..tItemName[16][1].." v�"..tItemName[17][1]);
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c"..tItemName[16][1].." v�"..tItemName[17][1]);
				else
					WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c"..tItemName[16][1].." v�"..tItemName[17][1].." th�t b�i, k� hi�u:"..nAddFlag);
				end				
			end
		else
			AddItem(tBoxGiveItem[IB_VERSION][nType][2],tBoxGiveItem[IB_VERSION][nType][3],tBoxGiveItem[IB_VERSION][nType][4],tBoxGiveItem[IB_VERSION][nType][5]);
			Msg2Player("B�n nh�n ���c "..tBoxGiveItem[IB_VERSION][nType][1]..tBoxGiveItem[IB_VERSION][nType][5]..".");
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..tItemName[nType+6][1].."M�"..tItemName[6][1].."Nh�n ���c"..tBoxGiveItem[IB_VERSION][nType][1]..tBoxGiveItem[IB_VERSION][nType][5]..".");
		end
	end
end

function ask_give_exp()
	local nExpNum = GetTask(TSK_AOYUN_BOX_NUM);
	if nExpNum >= g_nBoxNum then
		Talk(1,"",g_szBoxInfo.."M�i ng��i nhi�u nh�t c� th� nh�n ph�n th��ng kinh nghi�m "..g_nBoxNum.." l�n, hi�n gi� b�n �� nh�n "..g_nBoxNum.." l�n .");
		return 0;
	end
	local nLv = GetLevel();
	local nExp = nLv^3;
	Say(g_szBoxInfo.."B�n kh�ng d�ng ch�a kh�a m� r��ng, n�n ch� nh�n ���c <color=yellow>"..nExp.."<color> kinh nghi�m, b�n x�c nh�n mu�n m� r��ng ch�? <color=red>Ph�n th��ng kinh nghi�m n�y, m�i ng��i nhi�u nh�t c� th� nh�n "..g_nBoxNum.." l�n, hi�n gi� b�n �� nh�n "..nExpNum.." l�n.<color>",
			3,
			"���c, ta mu�n ��i kinh nghi�m/give_exp_num",
			"Kh�ng, ta nh�m!/OnUse",
			"Sau n�y h�n m�/nothing");
end

function give_exp_num()
	local nExpNum = GetTask(TSK_AOYUN_BOX_NUM);
	if nExpNum >= g_nBoxNum then
		Talk(1,"",g_szBoxInfo.."M�i ng��i nhi�u nh�t c� th� nh�n ph�n th��ng kinh nghi�m "..g_nBoxNum.." l�n, hi�n gi� b�n �� nh�n "..g_nBoxNum.." l�n .");
		return 0;
	end
	local nNum = GetItemCount(tItemName[6][2],tItemName[6][3],tItemName[6][4]);
	local nLimitNum = g_nBoxNum-GetTask(TSK_AOYUN_BOX_NUM);
	AskClientForNumber("confirm_give_exp",1,min(nNum,nLimitNum),"B�n mu�n m� m�y r��ng?");
end

function confirm_give_exp(nNum)
	local nExpNum = GetTask(TSK_AOYUN_BOX_NUM);
	if nExpNum >= g_nBoxNum then
		Talk(1,"",g_szBoxInfo.."M�i ng��i nhi�u nh�t c� th� nh�n ph�n th��ng kinh nghi�m "..g_nBoxNum.." l�n, hi�n gi� b�n �� nh�n "..g_nBoxNum.." l�n .");
		return 0;
	end
	local nLv = GetLevel();
	local nExp = (nLv^3)*nNum;	
	if DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],nNum) == 1 then
		SetTask(TSK_AOYUN_BOX_NUM,nExpNum+nNum);
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		Talk(1,"","��y l� l�n th� <color=yellow>"..GetTask(TSK_AOYUN_BOX_NUM).."<color> b�n nh�n ph�n th��ng kinh nghi�m, m�i ng��i c� th� nh�n nhi�u nh�t "..g_nBoxNum.." l�n.");
	end
end

function use_manykey_open()
	Say(g_szBoxInfo.."B�n ch�n d�ng 6 ch�a kh�a v�ng �� m� r��ng, b�n s� nh�n ���c 1 <color=yellow>Thi�n Qu�i Th�ch<color>, b�n ch�c ch�n mu�n m� ch�?",
			3,
			"���c/confirm_give_stone",
			"Ta ch�n nh�m r�i./OnUse",
			"Sau n�y h�n m�/nothing")
end

function confirm_give_stone()
	if GetItemCount(tItemName[9][2],tItemName[9][3],tItemName[9][4]) < 6 then
		Talk(1,"",g_szBoxInfo.."B�n ch�n d�ng 25 "..tItemName[9][1].." m� R��ng k� ni�m 20 n�m, nh�ng tr�n ng��i b�n kh�ng c� 6 "..tItemName[9][1].." .");
		return 0
	end
	if gf_Judge_Room_Weight(1,100,g_szBoxInfo) ~= 1 then
		return 0;
	end  
	if DelItem(tItemName[9][2],tItemName[9][3],tItemName[9][4],6) == 1 and DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 then
		local nAddFlag = AddItem(tItemName[5][2],tItemName[5][3],tItemName[5][4],1);
		if nAddFlag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..tItemName[5][1]);
			Msg2Global("��i hi�p"..GetName().." d�ng 6 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].." ���c 1 "..tItemName[5][1]);
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().." d�ng 6 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].." ���c 1 "..tItemName[5][1]);
		else
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().." d�ng 6 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].." ���c 1 "..tItemName[5][1].." th�t b�i, k� hi�u:"..nAddFlag);
		end
	end
end

function know_20box_award()
	if IB_VERSION == 1 then
		Talk(2,"OnUse",g_szBoxInfo.."R��ng k� ni�m 20 n�m c� th� m� ���c: \nNg�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n l� chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)\nM�t t�ch cao c�p S� M�n (ng��i ch�i ch�a gia nh�p l�u ph�i s� nh�n ���c quy�n m�t t�ch l�u ph�i ng�u nhi�n)\n100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)\n��nh H�n Thi�n Th�ch Th�n Th�ch (c��ng h�a v�t ph�m, khi �� c��ng h�a l� 7 th� kh�ng th� c��ng h�a n�a)\nThi�n Qu�i Th�ch(d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i v� ��i trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)",g_szBoxInfo.."\nM�nh Thi�n Th�ch (trang b� c��ng h�a c�p 1-4 ti�u hao v�t ph�m)\nThi�n Th�ch Tinh Th�ch (trang b� c��ng h�a c�p 8-15 ti�u hao v�t ph�m)\nKinh nghi�m l�p ph��ng ��ng c�p\nHuy Ho�ng Chi Th�y v� Vinh D� Chi Th�y\n    Ph�n th��ng � tr�n, s� c�n c� v�o ch�a kh�a d�ng �� m� b�o r��ng m� c� t� l� kh�c nhau, t�t c� nh�ng v�t ph�m � tr�n, tr� <color=yellow>kinh nghi�m, Thi�n Qu�i Th�ch, Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, ��u c� th� giao d�ch ���c, ch�c b�n may m�n!");
	else
		Talk(2,"OnUse",g_szBoxInfo.."R��ng k� ni�m 20 n�m c� th� m� ra ���c: \nNg�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n l� chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)\nM�t t�ch cao c�p S� M�n (ng��i ch�a gia nh�p l�u ph�i s� nh�n ���c 1 quy�n m�t t�ch l�u ph�i ng�u nhi�n)\n100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)\nThi�n Th�ch Linh Th�ch (c��ng h�a trang b� tr�c ti�p ��n c�p )\nThi�n Qu�i Th�ch(d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i v� ��i trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)\nNguy�t Hoa ho�c N� Oa Tinh Th�ch",g_szBoxInfo.."\nKinh nghi�m l�p ph��ng ��ng c�p\nHuy Ho�ng Chi Th�y v� Vinh D� Chi Th�y\n    Ph�n th��ng � tr�n, s� c�n c� v�o ch�a kh�a d�ng �� m� b�o r��ng m� c� t� l� kh�c nhau, t�t c� nh�ng v�t ph�m � tr�n, tr� <color=yellow>kinh nghi�m, Thi�n Qu�i Th�ch, Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, ��u c� th� giao d�ch ���c, ch�c b�n may m�n!");
	end
end

function use_manykey_6()
	Say(g_szBoxInfo.."B�n ch�n d�ng 6 ch�a kh�a v�ng m� r��ng, s� nh�n ���c <color=yellow>Ng�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n ���c chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)<color>, b�n ch�c ch�n mu�n m� ch�?",
			3,
			"���c/choose_give_horse",
			"Ta ch�n nh�m r�i./OnUse",
			"Sau n�y h�n m�/nothing")		
end

function choose_give_horse()
	local nRoute = GetPlayerRoute();
	if nRoute == 16 or nRoute == 17 or nRoute == 18 then 
		Say(g_szBoxInfo.."B�n x�c nh�n d�ng 6 "..tItemName[9][1].." m� r��ng �� ���c Chi�n M� Nguy�n So�i cao c�p ch�? H�y ch�n m�u cho ng�a.",
			4,
			"Chi�n M� Nguy�n So�i cao c�p (tr�ng)/#ask_give_horse(3)",
			"Chi�n M� Nguy�n So�i cao c�p (�en)/#ask_give_horse(4)",
			"Ta ch�n nh�m r�i./OnUse",
			"Sau n�y h�n m�/nothing")
	else
		Say(g_szBoxInfo.."B�n x�c nh�n d�ng 6 "..tItemName[9][1].." m� r��ng �� ���c ng�a di chuy�n 120% ch�? H�y ch�n m�u cho ng�a.",
			4,
			"B�ch Ngh�a (tr�ng)/#ask_give_horse(1)",
			"Hi�p D�c (�en)/#ask_give_horse(2)",
			"Ta ch�n nh�m r�i./OnUse",
			"Sau n�y h�n m�/nothing")		
	end	
end

function ask_give_horse(nType)
	Say(g_szBoxInfo.."B�n x�c nh�n d�ng 6 "..tItemName[9][1].." m� r��ng �� c� "..tItemName[nType][1].."?",
			3,
			"���c/#confirm_give_horse("..nType..")",
			"Ta ch�n nh�m r�i./choose_give_horse",
			"Sau n�y h�n m�/nothing")
end

function confirm_give_horse(nType)
	if GetItemCount(tItemName[9][2],tItemName[9][3],tItemName[9][4]) < 6 then
		Talk(1,"",g_szBoxInfo.."B�n ch�n d�ng 6 "..tItemName[9][1].." m� R��ng k� ni�m 20 n�m, nh�ng tr�n ng��i b�n kh�ng c� 6 "..tItemName[9][1].." .");
		return 0
	end
	if gf_Judge_Room_Weight(1,100,g_szBoxInfo) ~= 1 then
		return 0;
	end
	if DelItem(tItemName[9][2],tItemName[9][3],tItemName[9][4],6) == 1 and DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 then
		local nAddFlag = AddItem(tItemName[nType][2],tItemName[nType][3],tItemName[nType][4],1,1,-1,-1,-1,-1,-1,-1);
		if nAddFlag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1  "..tItemName[nType][1]);
			Msg2Global("��i hi�p"..GetName().." d�ng 6 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c 1 "..tItemName[nType][1]);
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().." d�ng 6 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c 1 "..tItemName[nType][1]);
		else
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().." d�ng 6 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c 1 "..tItemName[nType][1].." th�t b�i, k� hi�u:"..nAddFlag);
		end
	end	
end

function use_manykey_10()
	Say(g_szBoxInfo.."B�n �� ch�n d�ng 10 Ch�a kh�a v�ng k� ni�m �� m� b�o r��ng v� s� nh�n ���c <color=yellow>Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, mu�n m� kh�ng?",
			3,
			"���c/confirm_give_ring",
			"Ta ch�n nh�m r�i./OnUse",
			"Sau n�y h�n m�/nothing")	
end

function confirm_give_ring()
	if GetItemCount(tItemName[9][2],tItemName[9][3],tItemName[9][4]) < 10 then
		Talk(1,"",g_szBoxInfo.."B�n ch�n d�ng 10 "..tItemName[9][1].." m� R��ng k� ni�m 20 n�m, nh�ng kh�ng mang �� 10 "..tItemName[9][1].." .");
		return 0
	end		
	if gf_Judge_Room_Weight(2,200,g_szBoxInfo) ~= 1 then
		return 0;
	end	
	if DelItem(tItemName[9][2],tItemName[9][3],tItemName[9][4],10) == 1 and DelItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],1) == 1 then	
		local nAddFlag = 0;
		if AddItem(tItemName[16][2],tItemName[16][3],tItemName[16][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			nAddFlag = 1;
		end
		if AddItem(tItemName[17][2],tItemName[17][3],tItemName[17][4],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			nAddFlag = 2;
		end
		if nAddFlag == 2 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..tItemName[16][1].." v�"..tItemName[17][1]);
			Msg2Global("��i hi�p"..GetName().."D�ng 10 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c"..tItemName[16][1].." v�"..tItemName[17][1]);
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."D�ng 10 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c"..tItemName[16][1].." v�"..tItemName[17][1]);
		else
			WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."D�ng 10 "..tItemName[9][1].."B�t ��u"..tItemName[6][1].."Nh�n ���c"..tItemName[16][1].." v�"..tItemName[17][1].." th�t b�i, k� hi�u:"..nAddFlag);
		end							
	end
end