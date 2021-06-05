Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\online\\tong_feast\\npc\\tf_npc_exchg_meat.lua")

function main()
	if tf_IsOpen() ~= 1 then
		main_not_open();
	else
		main_open();
	end
end

function main_not_open()
	local tSay = {
		"Y�n ti�c bang h�i l� g�/what_tong_feast",
		"Ta c� th� thu th�p �� �n � ��u/where_collect",
		"Ta mu�n ��i th�c �n/npc_talk_exchg_meat",
		"Ch�n ��u b�p bang h�i nh� th� n�o/how_select",
		"Ta c� th� nh�n ���c nh�ng ph�n th��ng n�o/what_award",
		"Ta ch� ti�n ���ng gh� ngang/nothing",
	}
	Say("Ta c� th� n�i cho ng��i bi�t th�ng tin v� Y�n Ti�c Bao H�i, ��i hi�p mu�n bi�t c�i g� n�o?", getn(tSay), tSay);
end

function what_tong_feast()
	local tSay = {};
	tSay.msg = "Y�n Ti�c Bang H�i l� m�t ho�t ��ng l�n, c�c anh em trong bang h�i c� th� t� h�p l�i v�i nhau sau nhi�u ng�y b�n t�u giang h� vi�n x� c�ng nhau chia s� b�a c�m �o�n t�, ch�c r��u v� tr� chuy�n v�i nhau. B�nh th��ng th� c�c anh em trong bang h�i �i thu th�p c�c lo�i th�c �n, trong th�i gian bang ch� d� ki�n ��n NPC �� d�ng t�ng nguy�n li�u, khi t�ng s� ��t ��n m�c �� nh�t ��nh th� c� th� th�nh c�ng m� ra m�t ��i ti�c th�nh so�n, sau �� c�c anh em trong bang h�i c� th� d� ti�c v� c�ng nhau nh�n th��ng.";
	tSay.msg = tSay.msg.."V�o l�c 18:00, 19:00, 20:00 ng�y Th� B�y v� Ch� Nh�t, ng��i c� th� ��n c�c b�n �� xung quanh Bi�n Kinh, Th�nh ��, Tuy�n Ch�u �� t�m ��u b�p, ti�n h�nh ch� ��nh ��u b�p, v� d�ng t�ng nguy�n li�u �� l�m ��i ti�c c�a bang h�i.";
	tSay.sel = {
		{"tr� l�i", "main_not_open"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function where_collect()
	local tSay = {};
	tSay.msg = "�� �n ���c chia ra th�nh 4 ph�n, �� �n s� sinh ra � nh�ng n�i kh�c nhau. \n T�ng Ki�m S�n Trang v� V�n Ki�m Tr�ng sinh ra L�n C�p N�ch; \n L��ng S�n B�c v� ��a Huy�n Cung sinh ra B� KoBe; \n Th�i H� Huy�n C�nh v� Th�ng Thi�n ��nh r�i ra D� B�y N�; \n tham gia Chi�n Tr��ng Li�n Server v� Chi�n Tr��ng T�ng Li�u s� nh�n ���c Th�t Ngu�i. ";
	tSay.sel = {
		{"tr� l�i", "main_not_open"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function how_select()
	local tSay = {};
	tSay.msg = "Khi y�n ti�c bang h�i b�t ��u, ��i tho�i v�i NPC, ch�n ta l� ��u b�p bang h�i, ta s� bi�n th�nh ��u b�p chuy�n nghi�p �� ph�c v� cho qu� bang.";
	tSay.msg = tSay.msg.."Sau khi y�n ti�c ���c m� ra, n�i trong 10min c� th� ��t ��u b�p bang h�i, sau khi ��t xong, n�i trong 15min c� th� d�ng t�ng nguy�n li�u �� �n v� �� n�u b�p, 15min ��n 20min c� th� d�ng t�ng b�n gh�, sau khi t�t c� �� chu�n b� xong, th� y�n ti�c bang h�i s� ���c di�n ra!";
	tSay.sel = {
		{"tr� l�i", "main_not_open"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function what_award()
	local tSay = {};
	tSay.msg = "Khi d�ng t�ng �� �n v� c�c ��o c�, c� th� nh�n ���c kinh nghi�m, ch�n kh�, �i�m luy�n m�t t�ch. Trong qu� tr�nh d� ti�c c�ng c� th� nh�n ���c kinh nghi�m, ch�n kh�, �i�m luy�n m�t t�ch, l�nh b�i bang h�i v� c�c ph�n th��ng kh�c, l�nh b�i bang h�i c� th� ��i ph�n th��ng t�i Th��ng Nh�n Bang H�i. V� c� th� nh�n ���c hi�u qu� t�ng th�m, n�ng cao hi�u qu� thu�c t�nh c�a nh�n v�t.";
	tSay.sel = {
		{"tr� l�i", "main_not_open"},
		{"K�t th�c ��i tho�i", "nothing"},
	};
	temp_Talk(tSay);
end

function main_open()
	local x, y = tf_GetNpcTablePos();
	DebugOutput("main_open() x,y =", x, y)
	if x == 0 and y == 0 then
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s:apply2(callout(main_open_cb, x, y));
end

function main_open_cb(x, y, nCount, sdb)
	DebugOutput("main_open_cb", x, y, nCount, sdb);
	if nCount <= 0 then
		order_chef(x, y);
		return 0;
	end
	nCount = min(nCount, TF_CHEF_NUM_MAX);
	local nTimestamp = tf_GetTimestamp();
	local szTongName = nil;
	for i = 1, nCount do
		local tData = sdb[i-1];
		if tData then
			DebugOutput(tData[1], tData[2], tData[3], tData[4], tData[5]);
			DebugOutput("tData[4],nTimestamp =",tData[4],nTimestamp)
			if tData[4] < nTimestamp then
				DebugOutput("Thi�t ��t l�i ��u b�p bang ")
				local s = SDB(TF_FEAST_CHEF, 0, 0);
				s:delete();
				DebugOutput("Thi�t ��t l�i s� b�n ti�c");
				local s1 = SDB(TF_FEAST_CHEF, 0, 2);
				s1:delete(); 
				DebugOutput("Thi�t ��t l�i �� �n"); 
				local s2 = SDB(TF_FEAST_CHEF, 0, 3);
				s2:delete();
				DebugOutput("Thi�t ��t l�i s� ng��i ch�i");
				local s3 = SDB(TF_FEAST_CHEF, 0, 4);
				s3:delete();
				return 0;
			end
			if tData[2] == x and tData[3] == y then
				szTongName = tData[1];
			end
		end
	end
	DebugOutput("szTongName =", szTongName);
	if szTongName then
		if GetTongName() == szTongName then
			main_do();
		else
			for i = 1, nCount do
				local tData = sdb[i-1];
				if tData then
					if tData[1] == GetTongName() then
						goto_my_chef(tData[2], tData[3]);
						return 1;
					end
				end
			end
			--û���ҵ�
			Talk(1,"","Qu� bang kh�ng c� ��u b�p, nhanh ch�n th�ng b�o cho ng��i qu�n l� bang h�i ��t ��u b�p �i!")
		end
	else
		for i = 1, nCount do
			local tData = sdb[i-1];
			if tData then
				if tData[1] == GetTongName() then
					goto_my_chef(tData[2], tData[3]);
					return 1;
				end
			end
		end
		if nCount < TF_CHEF_NUM_MAX then
			order_chef(x, y);
		end
	end
end

function goto_my_chef(x, y)
	DebugOutput("goto_my_chef(x,y)", x, y)
	local tSay = {
		format("L�p t�c ��n ��/#NewWorld(%d,%d,%d)", TF_NPC_POS[x][y][1], TF_NPC_POS[x][y][2], TF_NPC_POS[x][y][3]),
		"B�n l�i sau/nothing",
	}
	Say(format("��u b�p chuy�n nghi�p c�a bang h�i kh�ng c� � ��y, ��u b�p ph�c v� cho qu� bang t�i <color=green> %s <color> �� th�i. ��i hi�p h�y nhanh ch�n ��n ��.",TF_NPC_POS[x][y][4]), getn(tSay), tSay);
end

function order_chef(x, y)
	DebugOutput("order_chef()", x, y);
	if tf_IsChefTime() ~= 1 then
		main_not_open();
		return 0;
	end
	local tSay = {
		format("���c r�i, quy�t ��nh l� nh� ng��i r�i/#order_chef_deal(%d, %d)", x, y),
		"�� ta suy ngh� l�i/nothing",	
	}
	Say("Ng��i mu�n ch�n ta l� ��u b�p chuy�n nghi�p c�a qu� bang ch�?", getn(tSay), tSay);
end

function order_chef_deal(x, y)
	if tf_IsTongManager() ~= 1 then
		Talk(1,"","Ch� c� th�nh vi�n qu�n l� bang h�i m�i c� th� ��t ��u b�p!");
		return 0;
	end
	if tf_CheckCondition() ~= 1 then
		return 0;
	end
	if tf_IsChefTime() ~= 1 then
		Talk(1,"","Th�i gian ��t ��u b�p l� v�o ��u m�i gi� n�i trong v�ng 10min, hi�n t�i kh�ng ph�i trong th�i gian ��t, d� ��t th�t b�i.")
		return 1;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 1);
	s:apply2(callout(order_chef_deal_cb, x, y))
end

function order_chef_deal_cb(x, y, nCount, sdb)
	if tf_IsChefTime() ~= 1 then
		Talk(1,"","Th�i gian ��t ��u b�p l� v�o ��u m�i gi� n�i trong v�ng 10min, hi�n t�i kh�ng ph�i trong th�i gian ��t, d� ��t th�t b�i.")
		return 1;
	end
	local sData = sdb[GetTongName()];
	if sData and sData[1] == 1 then
		Talk(1,"","M�t tu�n m�i bang h�i ch� ���c tham gia y�n ti�c 1 l�n, tu�n n�y bang h�i c�a ng��i �� tham gia 1 l�n r�i, kh�ng th� ti�p t�c tham gia th�m!");
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	local szTong = GetTongName();
	DebugOutput("order_chef_deal_cb", szTong, x, y, tf_GetTimestamp(), 0);
	s[szTong] = {TF_SHAREDATA_STRING00, x, y, tf_GetTimestamp(), 0};
	Talk(1,"main_do","Ng��i �� th�nh c�ng ��t ��u b�p n�y l�m ��u b�p chuy�n nghi�p c�a qu� bang!")
	Msg2Tong("Y�n ti�c bang h�i b�t ��u, nhanh ch�ng d�ng t�ng �� �n!")
	local _s = SDB(TF_FEAST_CHEF, 0, 1);
	_s[szTong] = {TF_SHAREDATA_STRING01, 1};
	local nHour = tonumber(date("%H"));
	if nHour == 18 then
		AddRuntimeStat(7,31,0,1);
	elseif nHour == 19 then
		AddRuntimeStat(7,32,0,1);
	elseif nHour == 20 then
		AddRuntimeStat(7,33,0,1);
	end
end

function main_do()
	local tSay = {
		"Ta mu�n xem nguy�n li�u bang h�i �� d�ng t�ng/check_tong_material",
		"Ta mu�n xem nguy�n li�u b�n th�n �� d�ng t�ng/check_player_material",
		"T�m hi�u tin t�c y�n ti�c bang h�i/main_not_open",
		"Ta ch� ti�n ���ng gh� ngang/nothing",
	}
	if tf_IsHangInTime() ~= 0 then
		tinsert(tSay, 1, "Ta mu�n d�ng t�ng nguy�n li�u/hang_in_material");
	end
	if tf_IsStartTime() ~= 0 then
		tinsert(tSay, 1, "L�m ti�c th�nh so�n/make_dinner");
	end	
	Say("Th�i kh�c �� ��n, n�u nh�n ���c ��y �� nguy�n li�u, ta c� th� l�m cho qu� bang m�t b�a ti�c th�nh so�n nh�t trong thi�n h�.", getn(tSay), tSay);
end

function check_tong_material()
	local x, y = tf_GetNpcTablePos();
	if x == 0 and y == 0 then
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(check_tong_material_cb);
end

function check_tong_material_cb(nCount, sdb)
	if nCount <= 0 then
		Talk(1,"","Hi�n t�i kh�ng c� ghi nh�n d�ng t�ng n�o");
		return 0;
	end
	local sData = sdb[GetTongName()];
	local tSay = {
		"tr� l�i/main_do",
		"Ta ch� ti�n ���ng gh� ngang/nothing",	
	}
	if sData then
		local szTemp = "";
		if sData[7] and sData[7] > 0 then
			szTemp = "<color=green> �� <color>";
		else
			szTemp = "<color=red> v�n ch�a <color>";
		end
		local nRet1, nRet2 = tf_GetTableNum(sData[1], sData[2], sData[3], sData[4]);
		local msg =format("Hi�n t�i c�c h� �� d�ng t�ng %d L�n C�p N�ch, %d B� KoBe, %d D� B�y N�, %d Th�t Ngu�i, qu� bang �� s� d�ng %s B� N�u B�p, c�n c� v�o s� l��ng nguy�n li�u �� �n d�ng t�ng, c� th� l�m ���c %d b�n ti�c, qu� bang c�n ph�i d�ng t�ng th�m B�n Ti�c v�i s� l��ng l� %d.", 
			sData[1], sData[2], sData[3], sData[4], szTemp, nRet1, nRet2);
		local nNeedHandCount = nRet2 - sData[6];
		if nNeedHandCount > 0 then
			msg = msg..format("(<color=red> c�n ph�i d�ng t�ng B�n Ti�c v�i s� l��ng l� %d c�i <color>)", nNeedHandCount);
		else
			msg = msg.."(<color=green> s� l��ng d�ng t�ng B�n Ti�c t�m th�i �� �� <color>)";
		end
		Say(msg, getn(tSay), tSay);
	else
		Say("Hi�n t�i qu� bang kh�ng c� b�t c� ghi nh�n n�o", getn(tSay), tSay);
	end
end

function check_player_material()
	local nPig = tf_GetPig();
	local nCow = tf_GetCow();
	local nSheep = tf_GetSheep();
	local nBacon = tf_GetBacon();
	local nTotal = nPig + nCow + nSheep + nBacon;
	local nCooker = tf_GetCooker();
	local nTc = tf_GetTc();
	local nWine = tf_GetWine();
	local nTableware = tf_GetIsUseTw();
	local tSay = {
		"tr� l�i/main_do",
		"Ta ch� ti�n ���ng gh� ngang/nothing",	
	}
	Say(format("T�ng s� th�c �n ��i hi�p �� d�ng t�ng l� %d<color=red> (gi�i h�n l� %d)<color>, �� d�ng t�ng L�n C�p N�ch %d, B� KoBe %d, D� B�y N� %d, Th�t Ngu�i %d, d�ng t�ng B� N�u B�p l� %d, d�ng t�ng B�n Ti�c l� %d, s� l�n k�nh t�u l� %d l�n, s� d�ng B� �� �n l� %d l�n.",
		nTotal, TF_HANG_IN_FOOD_MAX, nPig, nCow, nSheep, nBacon, nCooker, nTc, nWine, nTableware), getn(tSay), tSay);
end

function hang_in_material()
	local nKind = tf_IsHangInTime();
	if nKind ==  0 then return 0; end
	local tSay = {};
	if nKind == 1 then
		tSay = {
			"Ta mu�n d�ng t�ng �� �n/hang_in_material_food_say",
			"Ta mu�n d�ng t�ng B� N�u B�p/hang_in_material_cooker_say",
			"Ta mu�n d�ng t�ng B�n Ti�c/hang_in_material_tc_say",
			"tr� l�i/main_do",
			"Ta ch� ti�n ���ng gh� ngang/nothing",	
		}
	elseif nKind == 2 then
		tSay = {
			"Ta mu�n d�ng t�ng B�n Ti�c/hang_in_material_tc_say",
			"tr� l�i/main_do",
			"Ta ch� ti�n ���ng gh� ngang/nothing",	
		}
	end
	local szMsg = "\n giai �o�n n�y l� <color=green>%s<color>, kho�ng c�ch giai �o�n n�y k�t th�c v�n c�n <color=green>%d ph�t %d gi�y <color>, giai �o�n k� ti�p l� <color=red>%s<color>";
	local tTemp = {
		{"D�ng t�ng th�c �n v� B� N�u B�p", "D�ng t�ng B�n Ti�c"},
		{"D�ng t�ng B�n Ti�c", "L�m ti�c th�nh so�n"},
	}
	local nMinute = tonumber(date("%M"));
	local nSecond = tonumber(date("%S"));
	local tTime = {16,21};
	szMsg = format(szMsg, tTemp[nKind][1], tTime[nKind] - nMinute - 1, 60 - nSecond, tTemp[nKind][2]);
	Say("H�y ch�n d�ng t�ng v�t ph�m:"..szMsg, getn(tSay), tSay);
end

function hang_in_material_food_say()
	local tSay = {
		"D�ng t�ng L�n C�p N�ch/hang_in_material_food_1",
		"D�ng t�ng B� KoBe/hang_in_material_food_2",
		"D�ng t�ng D� B�y N�/hang_in_material_food_3",	
		"D�ng t�ng Th�t Ngu�i/hang_in_material_food_4",
		"\n Ph�n h�i/hang_in_material",
		"Ra kh�i/nothing",
	}
	Say("Xin h�i ��i hi�p ng��i mu�n d�ng t�ng lo�i th�c �n n�o?", getn(tSay), tSay);
end

function hang_in_material_food_1()
	local nCount = GetItemCount(TF_ITEM_PIG[1], TF_ITEM_PIG[2], TF_ITEM_PIG[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_1_cb", 0, min(nCount, nMax), "H�y nh�p s� l��ng d�ng t�ng:", "");
end

function hang_in_material_food_2()
	local nCount = GetItemCount(TF_ITEM_COW[1], TF_ITEM_COW[2], TF_ITEM_COW[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_2_cb", 0, min(nCount, nMax), "H�y nh�p s� l��ng d�ng t�ng:", "");
end

function hang_in_material_food_3()
	local nCount = GetItemCount(TF_ITEM_SHEEP[1], TF_ITEM_SHEEP[2], TF_ITEM_SHEEP[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_3_cb", 0, min(nCount, nMax), "H�y nh�p s� l��ng d�ng t�ng:", "");
end

function hang_in_material_food_4()
	local nCount = GetItemCount(TF_ITEM_BACON[1], TF_ITEM_BACON[2], TF_ITEM_BACON[3]);
	local nMax = max(TF_HANG_IN_FOOD_MAX - (tf_GetPig() + tf_GetCow() + tf_GetSheep() + tf_GetBacon()), 0);
	AskClientForNumber("hang_in_material_food_4_cb", 0, min(nCount, nMax), "H�y nh�p s� l��ng d�ng t�ng:", "");
end

function hang_in_material_food_1_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(1, nNum);
	end
end

function hang_in_material_food_2_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(2, nNum);
	end
end

function hang_in_material_food_3_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(3, nNum);
	end
end

function hang_in_material_food_4_cb(nNum)
	if nNum > 0 then
		hang_in_material_food(4, nNum);
	end
end

function hang_in_material_food(nKind, nNum)
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(callout(hang_in_material_food_cb, tonumber(nKind), tonumber(nNum)));
end

function hang_in_material_food_cb(nKind, nNum, nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData[1] or nCount <= 0 then
		sData = {0,0,0,0,0,0,0,0}; --û���κμ�¼������
	end
	local tFood = {
		[1] = TF_ITEM_PIG,
		[2] = TF_ITEM_COW,
		[3] = TF_ITEM_SHEEP,
		[4] = TF_ITEM_BACON,
	}
	if DelItem(tFood[nKind][1], tFood[nKind][2], tFood[nKind][3], nNum) ~= 1 then
		Talk(1, "", format("Kh�ng �� %s",tFood[nKind][4]));
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	DebugOutput("s[GetTongName()] =", sData[1], sData[2], sData[3], sData[4], sData[5], sData[6], sData[7], sData[8])
	sData[nKind] = sData[nKind] + nNum;
	s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], sData[4], sData[5], sData[6], sData[7], sData[8]}; 
	if nKind == 1 then
		tf_SetPig(tf_GetPig() + nNum);
		AddRuntimeStat(7,25,0,nNum);
	elseif nKind == 2 then
		tf_SetCow(tf_GetCow() + nNum);
		AddRuntimeStat(7,26,0,nNum);
	elseif nKind == 3 then
		tf_SetSheep(tf_GetSheep() + nNum);
		AddRuntimeStat(7,27,0,nNum);
	elseif nKind == 4 then
		tf_SetBacon(tf_GetBacon() + nNum);
		AddRuntimeStat(7,28,0,nNum);
	end	
	Talk(1,"",format("Ng��i �� d�ng t�ng %s*%d!", tFood[nKind][4], nNum));
	--����
	tf_Award_ShiCai(nNum);
end

function hang_in_material_cooker_say()
	Say("Ng��i x�c ��nh mu�n d�ng t�ng 1 B� N�u B�p ch�?", 3, "��ng �/hang_in_material_cooker", "\n Ph�n h�i/hang_in_material", "Ra kh�i/nothing");
end

function hang_in_material_cooker()
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(hang_in_material_cooker_cb);
end

function hang_in_material_cooker_cb(nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData[1] or nCount <= 0 then
		Talk(1,"","T�m th�i kh�ng c�n d�ng t�ng B� N�u B�p")
		return 0;
	end
	if sData[7] > 0 then
		Talk(1, "", "B� N�u B�p m�t l�n n��ng th�t ch� c� th� d�ng t�ng m�t l�n, qu� bang �� d�ng t�ng, kh�ng c�n ph�i t�ng th�m.");
		return 1;
	end
	if DelItem(TF_ITEM_COOKER[1], TF_ITEM_COOKER[2], TF_ITEM_COOKER[3], 1) ~= 1 then
		Talk(1,"","Trong h�nh trang kh�ng c� B� N�u B�p, kh�ng th� d�ng t�ng!")
		return 0;
	end		
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], 
		sData[4], sData[5], sData[6], 1, sData[8]};
	tf_SetCooker(1);
	Talk(1,"","Ng��i �� th�nh c�ng d�ng t�ng B� N�u B�p, nh� v�y s� n�ng cao t� l� c�a Y�n Ti�c Linh ��nh v� Y�n Ti�c H�o Hoa!");
	Msg2Tong(format("�� th��ng th�c b�a ti�c ngon h�n, %s �� d�ng t�ng %s !",GetName(),"B� N�u B�p"))
	--����
	tf_Award_JingZhiCooker();
	--ͳ��
	AddRuntimeStat(7,30,0,1)
end

function hang_in_material_tc_say()
	Say("Ng��i x�c ��nh mu�n d�ng t�ng 1 B�n Ti�c ch�?", 3, "��ng �/hang_in_material_tc", "\n Ph�n h�i/hang_in_material", "Ra kh�i/nothing");
end

function hang_in_material_tc()
	local nKind = tf_IsHangInTime();
	if nKind ~= 2 then
		Talk(1,"","T�m th�i v�n ch�a th� d�ng t�ng B�n Ti�c");
		return 0;
	end
	local s = SDB(TF_FEAST_CHEF, 0, 3);
	s:apply2(hang_in_material_tc_cb);
end

function hang_in_material_tc_cb(nCount, sdb)
	local sData = sdb[GetTongName()];
	if not sData[1] or nCount <= 0 then
		Talk(1,"","Do s� l��ng d�ng t�ng �� �n kh�ng ��, kh�ng c�n ph�i d�ng t�ng b�t c� B�n Ti�c n�o h�t!")
		return 0;
	end
	DebugOutput("hang_in_material_cooker_cb", sData[1], sData[2], sData[3], sData[4], sData[5], sData[6], sData[7], sData[8]);
	local nTcTotal, nTcNeed = tf_GetTableNum(sData[1], sData[2], sData[3], sData[4]);
	if nTcNeed > sData[6] then
		local s = SDB(TF_FEAST_CHEF, 0, 3);
		if DelItem(TF_ITEM_TC[1], TF_ITEM_TC[2], TF_ITEM_TC[3], 1) ~= 1 then
			Talk(1,"","Trong h�nh trang kh�ng c� B�n Ti�c, kh�ng th� d�ng t�ng!")
			return 0;
		end
		s[GetTongName()] = {TF_SHAREDATA_STRING03, sData[1], sData[2], sData[3], sData[4], sData[5], sData[6] + 1, sData[7], sData[8]};
		tf_SetTc(tf_GetTc() + 1);
		Talk(1,"","Ng��i �� th�nh c�ng d�ng t�ng m�t B�n Ti�c!")
		Msg2Tong(format("�� th��ng th�c b�a ti�c ngon h�n, %s �� d�ng t�ng %s !",GetName(),"B�n Ti�c"));
		--����
		tf_Award_JingzhiTableChair();
		--ͳ��
		AddRuntimeStat(7,29,0,1);
	else
		Talk(1,"","S� l��ng B�n Ti�c qu� bang d�ng t�ng �� ��t ��n gi�i h�n cho ph�p, kh�ng th� d�ng t�ng th�m.")
	end
end

function make_dinner()
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s:apply2(make_dinner_cb);
end

function make_dinner_cb(nCount, sdb)
	if nCount <= 0 then
		print("UDERROR: make_dinner nCount error!");
		return 0;
	end
	local sData = sdb[GetTongName()];
	if not sData[1] then
		print("UDERROR: make_dinner sData error!");
		return 0;
	end
	local x, y = tf_GetNpcTablePos();
	if sData[1] ~= x and sData[2] ~= y then
		print("UDERROR: make_dinner x, y error")
		return 0;
	end
	if sData[4] == 2 then
		Talk(1,"","Do s� l��ng d�ng t�ng �� �n kh�ng ��, m� y�n ti�c bang h�i th�t b�i!");
		return 0;
	end
	if sData[4] == 1 then
		Talk(1,"","Y�n ti�c bang h�i �� m�, m�i c�c ch� v� ��i hi�p c�ng th��ng th�c!");
		return 1;
	end
	if sData[4] == 0 then
		tf_OpenBanquet_Pre(x, y);
		return 1;
	end
	print("UDERROR: make_dinner sData[4] error!");
end

