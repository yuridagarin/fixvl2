-- �����ռ�����Ľű�ͷ�ļ�
Include("\\script\\task\\collection\\task_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

FILE_NAME = "\\script\\��ԭ����\\����\\npc\\�н�����.lua"

Zgc_com_jue_table = {}						--��Ҫtable
Zgc_adv_jue_talbe = {}						--�߼���Ҫtable
Zgc_com_jue_num = 0
Zgc_adv_jue_num = 0
Zgc_change_date_id = 951					--�һ�����
Zgc_change_date_num_id = 952				--�һ�����
Zgc_adv_jue_remain_day_id = 953				--�ϴζһ��߼���Ҫ��ʱ��
Zgc_adv_jue_remain_times_id = 954			--�ϴζһ��߼���Ҫ�����ڵĴ���
Zgc_com_jue_table = {
	{1,"Thi�u L�m �ao quy�t"},
	{2,"Thi�u L�m C�n quy�t"},
	{3,"Tr�m Ma �ao quy�t"},
	{4,"Phong C�n quy�t"},
	{6,"Nhi�n M�c �ao quy�t"},
	{7,"V� Th��ng C�n quy�t"},
	{8,"X� Th�n Quy�t"},
	{9,"��i Nh� Lai quy�t"},
	{11,"Th�t B�o Chi�u quy�t"},
	{12,"La H�n Quy�n quy�t"},
	{13,"Ca Di�p Th�i quy�t"},
	{15,"Vi �� quy�t"},
	{16,"V�n V�n quy�t"},
	{17,"La H�n Tr�n quy�t"},
	{18,"��i Tu Di Ch��ng"},
	{19,"V� �nh quy�t"},
	{21,"Ph�c H� quy�t"},
	{22,"Tu T�m quy�t"},
	{23,"Ng� Chuy�n Ch� quy�t"},
	{24,"Ph� Ma Ch� quy�t"},
	{25,"Kim Cang y�u quy�t"},
	{26,"La L�i quy�t"},
	{27,"Ph�c Ma Th�n quy�t"},
	{28,"V� T��ng quy�t"},
	{30,"Minh Ch� quy�t"},
	{32,"Ch� �m y�u quy�t"},
	{33,"T�m Nh�n quy�t"},
	{34,"��c Th�ch C�t quy�t"},
	{35,"Gi�i ��c B� quy�t"},
	{36,"C�u H�n T�nh quy�t"},
	{37,"Ph� Quan quy�t"},
	{38,"Truy T�m Ti�n quy�t"},
	{39,"Thu Minh quy�t"},
	{40,"Xuy�n T�m quy�t"},
	{41,"Th�i ��c quy�t"},
	{42,"�o�n Ph�ch quy�t"},
	{43,"B�o Ch�m quy�t"},
	{44,"H�m Xa quy�t"},
	{45,"T�a M�nh Ch�m quy�t"},
	{47,"Quan �m Quy�t"},
	{48,"Nga My Ph�t quy�t"},
	{49,"Ng�c N� Ki�m quy�t"},
	{50,"�� Nguy�n Quy�t"},
	{51,"Ph�t Ph� quy�t"},
	{52,"Li�n Hoa quy�t"},
	{54,"L�u Th�y y�u quy�t"},
	{55,"Ph� T� quy�t"},
	{56,"B�t Di�t quy�t"},
	{57,"Ph�t Chi�n quy�t"},
	{58,"Ph�t �m quy�t"},
	{60,"T�y Kh�c quy�t"},
	{61,"Kh�c Ngh� quy�t"},
	{62,"Nguy�t Th�c Kh�c quy�t"},
	{63,"�o�n Th�y quy�t"},
	{64,"T�nh D� T� quy�t"},
	{65,"D� Nhi�u quy�t"},
	{66,"D��ng Tam quy�t"},
	{68,"Ph�n C�m quy�t"},
	{69,"� D� �� quy�t"},
	{71,"C�i Bang Ch��ng quy�t"},
	{72,"Th�ng T� quy�t"},
	{73,"Thi�n C�n quy�t"},
	{74,"B� V��ng quy�t"},
	{75,"T�a H�u Th� quy�t"},
	{76,"Ti�u Dao Du quy�t"},
	{77,"L�c H�p y�u quy�t"},
	{80,"C�i Bang C�n quy�t"},
	{81,"Khu X� quy�t"},
	{82,"Kh�t Th�o quy�t"},
	{84,"Di�u Th� Quy�t"},
	{85,"Th�u Chuy�n quy�t"},
	{86,"T� Gi�p quy�t"},
	{87,"Th�u Ho�n quy�t"},
	{89,"V� �ang Ki�m quy�t"},
	{90,"L�u Quang Ki�m quy�t"},
	{91,"V� ��ng Ki�m quy�t"},
	{92,"Nhu V�n Ki�m quy�t"},
	{93,"Li�t Di�m Ki�m quy�t"},
	{94,"B�n Ki�m quy�t"},
	{95,"V� Ng� Ph�p quy�t"},
	{96,"Th�i Thanh Ki�m quy�t"},
	{97,"Tri�n Ki�m quy�t"},
	{98,"L�c Ki�m quy�t"},
	{100,"Huy�n Ki�m Tr�n quy�t"},
	{101,"Ng� Ki�m quy�t"},
	{102,"Ch�nh L��ng ki�m quy�t"},
	{103,"Th�i �t Ki�m quy�t"},
	{104,"Th�p Tam Ki�m quy�t"},
	{105,"Huy�n �m Ki�m quy�t"},
	{106,"Thi�n Thu�n ki�m quy�t"},
	{107,"B�t Qu�i Ki�m quy�t"},
	{109,"B�t Ph�p quy�t"},
	{110,"Th�i Ti�u C�ng quy�t"},
	{111,"L�c H�a C�ng quy�t"},
	{112,"Th� V�n Tung quy�t"},
	{113,"Th�t Tinh Tr�n"},
	{115,"Thi�u �m Quy�t"},
	{116,"B�c ��u Tr�n quy�t"},
	{117,"T�n �nh Quy�t"},
	{118,"C�n Kh�n Quy�t"},
	{120,"Th��ng Ph�p quy�t"},
	{121,"Ph� Phong Th��ng quy�t"},
	{122,"Ng� M� quy�t"},
	{123,"B�n Lang Th��ng quy�t"},
	{124,"Chi�n ��nh quy�t"},
	{125,"X�o Chi�n quy�t"},
	{126,"Thi�n Ho�nh Th��ng quy�t"},
	{127,"Anh H�ng quy�t"},
	{128,"��o H�i Th��ng quy�t"},
	{131,"Cung Ph�p quy�t"},
	{132,"Li�n X� Thu�t quy�t"},
	{133,"Tr�n Li�u quy�t"},
	{134,"H�i Long Ti�n quy�t"},
	{135,"Tri�n V�n Ti�n quy�t"},
	{136,"K� M�n ��n quy�t"},
	{137,"Kh� Ti�n quy�t"},
	{139,"Huy�n Th�n quy�t"},
	{140,"T�c M�nh quy�t"},
	{142,"B� ki�p Ng� ��c �ao Ph�p"},
	{143,"B� ki�p D�n H�n Ch�"},
	{144,"B� ki�p Thao Thi Thu�t"},
	{145,"B� ki�p Thi ��c Thu�t"},
	{146,"B� ki�p Thi B�c ��i Ph�p"},
	{147,"B� ki�p T�p Thi T� Kh�"},
	{148,"B� ki�p Ng� Thi Thu�t"},
	{149,"B� ki�p V�n ��c �o�t M�nh �ao"},
	{150,"B� ki�p �m T� H�p H�n Kh�"},
	{152,"B� ki�p T� Linh ��i Ph�p"},
	{153,"B� ki�p T� ��c C�ng"},
	{155,"B� ki�p H� C� M�t Ph��ng"},
	{156,"B� ki�p Phong C�"},
	{157,"B� ki�p D��ng C� B� Thu�t"},
	{158,"B� ki�p Cu�ng Phong Tr�o"},
	{159,"B� ki�p ��c C�"},
	{160,"B� ki�p Huy�t ��nh C�ng"},
	{161,"B� ki�p Huy�t C�"},
	{162,"B� ki�p H��ng C�"},
	{163,"B� ki�p Thi C�"},
	{164,"B� ki�p Y�u C�"},
	{165,"B� ki�p T�m C�"},
	{166,"B� ki�p V�n C� Th�c Thi�n"},			
}
Zgc_adv_jue_talbe = {
	{5,"Kim Chung Tr�o quy�t"},
	{10,"��t Ma V� quy�t"},
	{14,"Hu� Nh�n quy�t"},
	{20,"Long Tr�o Th� quy�t"},
	{29,"S� T� H�ng"},
	{31,"Kim Cang Ch� quy�t"},
	{46,"M�n Thi�n V� quy�t"},
	{53,"Thanh Ph�n quy�t"},
	{59,"��i Bi quy�t"},
	{67,"Ph�c Th�y ph�p"},
	{70,"M� T�m Kh�c quy�t"},
	{78,"T�y �i�p"},
	{79,"T�y Quy�n"},
	{83,"N� Thu quy�t"},
	{88,"�� C�u quy�t"},
	{99,"T�ch D��ng Ki�m quy�t"},
	{108,"Th�t Ti�t Ki�m quy�t"},
	{114,"Thi�u D��ng Quy�t"},
	{119,"Th��ng Thanh C�ng quy�t"},
	{129,"Ng� M� quy�t"},
	{130,"B�ch Th��ng quy�t"},
	{138,"To�i Ti�n quy�t"},
	{141,"L�u Tuy�t Ti�n quy�t"},
	{151,"B� ki�p Th�i Thi T� Kh�"},
	{154,"B� ki�p Thi Li�t Ma C�ng"},
	{168,"B� ki�p T�m C�"},
	{167,"B� ki�p Huy�n C�"}
}
Zgc_master_com_id = {
	205,206,207,208,209,350,390
}
--------------------------------------------������------------------------------------------
function main()
	local nMap, nX, nY = GetWorldPos()
	local strName = GetTargetNpcName()
	local time_h = tonumber(date("%H"))			--��õ�ǰСʱ����24Сʱ�ƣ�
	
	if checkCollectNpc(nMap, strName) ==1 then
		if time_h >= 18 then
		Say("��ng h�i ta sao c� b�n ba kh�p n�i! Tuy ta kh�ng ph�i l� ng��i xu�t gia nh�ng l�c n�o c�ng ti�u di�u t� t�i, k� ph�m phu t�c t� sao c� th� hi�u ���c?",
			3,
			"Ta ��n nh�n nhi�m v� thu th�p/#createCollectTalk(\"H�nh C��c Th��ng Nh�n\")",
			"Ta ��n ��i B� ki�p/Dialog_main",
			"R�i kh�i/Zgc_dialog_end"
		)
		elseif checkCollectNpc(nMap, strName) ==1 then
			createCollectTalk(strName)
		end
		return
	end
	if time_h >=18 then							--��ͬ��ʱ��Ի���ͬ
		Dialog_main()
	else
		Talk(2,"","��ng h�i ta sao c� b�n ba kh�p n�i! Tuy ta kh�ng ph�i l� ng��i xu�t gia nh�ng l�c n�o c�ng ti�u di�u t� t�i, k� ph�m phu t�c t� sao c� th� hi�u ���c?","X�a c� c�u: �i m�t ng�y ��ng h�c m�t s�ng kh�n.")
	end	
end
--*********************************���Ի�����************************
function Dialog_main()
	Say("G�n ��y v� l�m loan tin b� ki�p tuy�t h�c c�a c�c m�n ph�i ��t nhi�n bi�n m�t m�t c�ch k� l�, nghe n�i Minh Ch� Kim S�n s� r�i v�o tay k� x�u, h�u qu� kh�n l��ng do �� �� ��i b� ki�p ph�i c� L�nh b�i s� m�n, l�o phu ���c giao tr�ng tr�ch gi�p �� c�c hi�p kh�ch, xin h�i b�ng h�u t�m l�o phu c� chuy�n g�?",
		4,
		"��i l�nh b�i s� m�n l�y B� Ki�p/Zgc_jue_change_main",		
		"H�m nay c�n bao nhi�u l�n ��i/Zgc_jue_change_time_inq",
		--"��Ҫ������Щ��ϡ����Ҫ/Zgc_jue_change_com_jue_inq",
		"T�m hi�u quy t�c ��i/Zgc_jue_change_rule_inq",
		"K�t th�c/Zgc_dialog_end"
	)
end
------------------------------------------�һ��Ի�----------------------------------------
function Zgc_jue_change_main()
	Say("Xin h�y ch�n s� l��ng b� ki�p ng��i mu�n ��i.",
		5,
		"Ng��i mu�n ��i 5 b� ki�p b�t k� l�y 1 b� ki�p t� ch�n h� ph�i (c�n 12 ti�n V�ng v� 5 b� ki�p)/exchange_yue",
		"Ng��i mu�n ��i l�nh b�i s� m�n l�y 1 b� ki�p (c�n 2 ti�n V�ng v� 2 l�nh b�i s� m�n)/#Zgc_jue_chg_cond_chk(1)",
		"Ng��i mu�n ��i l�nh b�i s� m�n l�y 5 b� ki�p (c�n 10 ti�n V�ng v� 10 l�nh b�i s� m�n)/#Zgc_jue_chg_cond_chk(5)",
		"Ng��i mu�n ��i l�nh b�i s� m�n l�y 10 b� ki�p (c�n 20 ti�n V�ng v� 20 l�nh b�i s� m�n)/#Zgc_jue_chg_cond_chk(10)",
		"K�t th�c/Zgc_dialog_end"		
	)
end

----------------------------------------�һ�������--------------------------------------
function Zgc_jue_chg_cond_chk(change_num)
	local Actor_function = GetPlayerFaction()
	local time_date_today = floor((GetTime()-57600)/86400)
	if Actor_function == 0 or GetLevel() < 11 then						--�ж��Ƿ�������ɣ�δ�жϵȼ�����Ϊ�������ɵȼ��Ϳ϶��ﵽҪ��
		Say ("Ng��i ph�i ��t ��n c�p 11 v� gia nh�p m�t m�n ph�i m�i �� �i�u ki�n trao ��i.",
			1,
			"Ta bi�t r�i!/Zgc_dialog_end"
		)
	elseif GetItemCount(2,0,Zgc_master_com_id[Actor_function]) < (2 * change_num) or GetCash() < (20000 * change_num) then		--�ж϶һ���Ʒ�����Ƿ����
		Say ("��i hi�p ��ng ��a v�i l�o phu! H�y xem l�nh b�i v� ng�n l��ng trong h�nh trang c� �� kh�ng? Nh� k�! Nh�t ��nh ph�i c�"..(2*change_num).." l�nh b�i v� "..(2*change_num).." Xu m�i c� th� ��i"..change_num.." B� ki�p.",
			1,
			"Ta bi�t r�i!/Zgc_dialog_end"
		)
	elseif GetFreeItemRoom() < change_num or (GetMaxItemWeight() - GetCurItemWeight()) < change_num then									--=========================�ڴ˼��븺�غͿո������ж�
		Say ("V� huynh �� n�y! H�nh trang �� ��y, s�p x�p xong h�y quay l�i nh�!",
			1,
			"Ta bi�t r�i!/Zgc_dialog_end"
		)
	elseif GetTask(Zgc_change_date_num_id) >= 20 and time_date_today <= GetTask(Zgc_change_date_id) then
		Say ("T�n ti�u t� n�y tham qu�! L�o phu c�n ph�i chu�n b� cho v� b�ng h�u kh�c.",
			1,
			"Ta bi�t r�i!/Zgc_dialog_end"
		)
	elseif change_num > 1 and (GetTask(Zgc_change_date_num_id) >= (21 - change_num)) and time_date_today <= GetTask(Zgc_change_date_id) then
		Say ("H�m nay b�n ch� c� th� ��i b� ki�p"..(20 - GetTask(Zgc_change_date_num_id)).." l�n y�u quy�t!",
			1,
			"Ta bi�t r�i!/Zgc_dialog_end"
		)	
	elseif Pay(20000 * change_num) == 1 and DelItem(2,0,Zgc_master_com_id[Actor_function],(2 * change_num)) ==1 then
		local com_jue_num = getn(Zgc_com_jue_table)
		local adv_jue_num = getn(Zgc_adv_jue_talbe)
		for i = 1, change_num do
			if GetTask(Zgc_adv_jue_remain_day_id) == 0 then		--������û�л�ù��߼���Ҫ�����ܵڶ����������ơ�
				local change_num = random (1,((com_jue_num * 1000) + adv_jue_num))
				if change_num > (com_jue_num * 1000) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end
			elseif GetTask(Zgc_adv_jue_remain_times_id) >= 30 and (time_date_today - GetTask(Zgc_adv_jue_remain_day_id)) >= 30 then
				local change_num = random (1,((com_jue_num * 1000) + adv_jue_num))
				if change_num > (com_jue_num * 1000) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end				
			else
				Zgc_jue_pay(0)
			end	
		end
	else
		return	
	end
end

TSK_TMP_SELECT_YUE_YUE = 107
YUE_EXCHANGE = 5

tRouteYue =
{
		{"Thi�u L�m T�c Gia", 1, {1,8}, {1,2}},
		{"Thi�u L�m Thi�n T�ng", 2, {17,25}, {5,6}},
		{"Thi�u L�m V� T�ng", 3, {9,16}, {3,4}},
		{"���ng M�n", 4, {26,39}, {7,7}},
		{"Nga My Ph�t Gia", 5, {40,50}, {8,9}},
		{"Nga My T�c Gia", 6, {51,59}, {10,11}},
		{"C�i Bang T�nh Y", 7, {60,66}, {12,13}},
		{"C�i Bang � Y", 8, {67,73}, {14,15}},
		{"V� �ang ��o Gia", 9, {74,91}, {16,17}},
		{"V� �ang T�c Gia",10, {92,100}, {18,19}},	
		{"D��ng Gia Th��ng K�", 11, {101,109}, {20,21}},
		{"D��ng Gia Cung K�",12, {110,118}, {22,23}},
		{"Ng� ��c Hi�p ��c", 13, {119,129}, {24,25}},
		{"Ng� ��c T� ��c", 14, {130,141}, {26,27}},
}

function exchange_yue()	
	local tSay = {}
	for i=1,getn(tRouteYue) do
		tinsert(tSay,format("%s/#do_exchange(%d)",tRouteYue[i][1],tRouteYue[i][2]))
	end
	tinsert(tSay,"Ta ch�a c�n/Zgc_dialog_end")	
	Say("Ng��i mu�n ��i b� ki�p h� ph�i n�o?",getn(tSay),tSay)	
end

function do_exchange(nSelected)	
	local time_date_today = floor((GetTime()-57600)/86400)
	if nSelected == 0 then
		return 0;
	end
	if gf_CheckPlayerRoute() == 0 or GetLevel() < 11 then
		Talk (1,"","Ng��i ph�i ��t ��n c�p 11 v� gia nh�p m�t h� ph�i m�i �� �i�u ki�n trao ��i.")
		return 0;
	end
	if GetTask(Zgc_change_date_num_id) >= 20 and time_date_today <= GetTask(Zgc_change_date_id) then
		Talk (1,"","T�n ti�u t� n�y tham qu�! L�o phu c�n ph�i chu�n b� cho v� b�ng h�u kh�c.")
		return 0;
	end
	if GetCash() < 120000 then
		Talk(1, "", "Ng�n l��ng tr�n ng��i kh�ng ��!");
		return 0;
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end	
	SetTaskTemp(TSK_TMP_SELECT_YUE,nSelected)	
	local nSlot = YUE_EXCHANGE	
	PutinItemBox("��i Y�u Quy�t" ,nSlot , "X�c nh�n mu�n th�c hi�n?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end	
	if (genre == 2 and detail == 6 and particular >= 0) then	
		return 1;
	end	
	Talk(1, "", "Ch� c� th� b� v�o b� ki�p!");
	return 0;
end

function OnPutinComplete(param)	
	local nSelect = GetTaskTemp(TSK_TMP_SELECT_YUE)
	SetTaskTemp(TSK_TMP_SELECT_YUE,0)
	if param ~= 1 then
		Talk(1, "", "B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= YUE_EXCHANGE then
		Talk(1, "", "S� l��ng v�t ph�m kh�ng ��ng");
		return 0;
	end	
	if get_yue_count(t, 2, 6) ~= YUE_EXCHANGE then
		Talk(1, "", "S� l��ng v�t ph�m kh�ng ��ng");
		return 0;							
	end	
	if GetCash() < 120000 then
		Talk(1, "", "Ng�n l��ng tr�n ng��i kh�ng ��");
		return 0;
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end
	if Pay(120000) == 1 then
		local nResult = 1;
		for i = 1, getn(t) do			
			if DelItemByIndex(t[i][1], -1) ~= 1 then
				nResult = 0;
				break;
			end
		end		
		if nResult == 1 then
			local com_jue_num = getn(Zgc_com_jue_table)
			local adv_jue_num = getn(Zgc_adv_jue_talbe)
			local change_num = random (1,((com_jue_num * 1000) + adv_jue_num))
			local change_jue_seq = 0
			local change_jue_id = 0
			local change_jue_times_now = 0
			local change_jue_name = ""
			local date_now = floor((GetTime()-57600)/86400)
			if GetTask(Zgc_change_date_id) >= date_now then
				change_jue_times_now = GetTask(Zgc_change_date_num_id) + 1
			else
				change_jue_times_now = 1
			end
			if change_num > (com_jue_num * 1000) then
				local nRand = random(tRouteYue[nSelect][4][1],tRouteYue[nSelect][4][2])
				local nRet, nItemIdx = AddItem(2,6,Zgc_adv_jue_talbe[nRand][1],1)
				change_jue_name = Zgc_adv_jue_talbe[nRand][2]
				if nRet == 1 then
					if change_jue_times_now < 20 then
						Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", h�m nay b�n c�n"..(20-change_jue_times_now).." l�n ��i b� ki�p")
					else
						Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", ng�y mai h�y quay l�i ��y.")
					end
					SetTask(Zgc_change_date_id,date_now)
					SetTask(Zgc_change_date_num_id,change_jue_times_now)		
					SetTask(Zgc_adv_jue_remain_day_id,date_now)
					SetTask(Zgc_adv_jue_remain_times_id,0)
				end
			else
				local nRand = random(tRouteYue[nSelect][3][1],tRouteYue[nSelect][3][2])
				local nRet, nItemIdx = AddItem(2,6,Zgc_com_jue_table[nRand][1],1)
				change_jue_name = Zgc_com_jue_table[nRand][2]
				if nRet == 1 then
					if change_jue_times_now < 20 then
						Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", h�m nay b�n c�n"..(20-change_jue_times_now).." l�n ��i b� ki�p")
					else
						Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", ng�y mai h�y quay l�i ��y.")
					end				
					SetTask(Zgc_change_date_id,date_now)
					SetTask(Zgc_change_date_num_id,change_jue_times_now)
					local adv_jue_times = GetTask(Zgc_adv_jue_remain_times_id) + 1
					SetTask(Zgc_adv_jue_remain_times_id,adv_jue_times)
				end
			end		
		else
			WriteLogEx("Doi Yeu Quet","x�a item th�t b�i")		
		end
	end
end


function get_yue_count(t, id1, id2)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2) then
			nCount = nCount + 1;			
		end
	end
	return nCount;
end


-----------------------------------------��Ҫ���躯��--------------------------------------
function Zgc_jue_pay(adv_flag)
	local change_jue_seq = 0
	local change_jue_id = 0
	local change_jue_times_now = 0
	local change_jue_name = ""
	local date_now = floor((GetTime()-57600)/86400)
	if GetTask(Zgc_change_date_id) >= date_now then
		change_jue_times_now = GetTask(Zgc_change_date_num_id) + 1
	else
		change_jue_times_now = 1
	end
	if adv_flag == 1 then
		change_jue_seq = random(1,getn(Zgc_adv_jue_talbe))
		change_jue_id = Zgc_adv_jue_talbe[change_jue_seq][1]
		change_jue_name = Zgc_adv_jue_talbe[change_jue_seq][2]
		local add_flag = AddItem(2,6,change_jue_id,1)
		if add_flag ~= 0 then
			if change_jue_times_now < 20 then
				Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", h�m nay b�n c�n"..(20-change_jue_times_now).." l�n ��i b� ki�p")
			else
				Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", ng�y mai h�y quay l�i ��y.")
			end
			--AddGlobalNews("[�н�����]:"..GetName().."��ʿ�����ϡ����Ҫ"..change_jue_name.."һ����ף������������ѧ���С�")
			WriteLog("Ng��i ch�i:"..GetName().."��i 1 quy�n "..change_jue_name.."B� ki�p cao c�p.")
			SetTask(Zgc_change_date_id,date_now)
			SetTask(Zgc_change_date_num_id,change_jue_times_now)		
			SetTask(Zgc_adv_jue_remain_day_id,date_now)
			SetTask(Zgc_adv_jue_remain_times_id,0)
		else
			WriteLog("Ng��i ch�i:"..GetName().."��i 1 quy�n "..change_jue_name.." th�t b�i! Tr� quay l�i:"..add_flag..".")
		end
	else
		change_jue_seq = random (1,getn(Zgc_com_jue_table))
		change_jue_id = Zgc_com_jue_table[change_jue_seq][1]
		change_jue_name = Zgc_com_jue_table[change_jue_seq][2]
		local add_flag = AddItem(2,6,change_jue_id,1)
		if add_flag ~= 0 then
			if change_jue_times_now < 20 then
				Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", h�m nay b�n c�n"..(20-change_jue_times_now).." l�n ��i b� ki�p")
			else
				Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n"..change_jue_name..", ng�y mai h�y quay l�i ��y.")
			end
			SetTask(Zgc_change_date_id,date_now)
			SetTask(Zgc_change_date_num_id,change_jue_times_now)
			local adv_jue_times = GetTask(Zgc_adv_jue_remain_times_id) + 1
			SetTask(Zgc_adv_jue_remain_times_id,adv_jue_times)
		else
			WriteLog("Ng��i ch�i:"..GetName().."��i b� ki�p ph� th�ng"..change_jue_name.." th�t b�i, tr� quay l�i:"..add_flag..".")
		end
	end
end
------------------------------------------ʣ��һ�������ѯ--------------------------------
function Zgc_jue_change_time_inq()
	local time_save = GetTask(Zgc_change_date_id)
	local change_time = GetTask(Zgc_change_date_num_id)
	local time_now = floor((GetTime()-57600)/86400)
	local times_remain = 20 
	if time_now - time_save < 1 then
		times_remain = 20 - change_time
	end
	Say ("H�m nay b�n ch� c� th� ��i b� ki�p "..times_remain.."  l�n.",
		1,
		"Ta bi�t r�i!/Zgc_dialog_end"
	)
end
------------------------------------------ϡ����Ҫ��ѯ--------------------------------------
function Zgc_jue_change_com_jue_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_adv_jue_talbe) do
		dialog_string = dialog_string..Zgc_adv_jue_talbe[i][2]
		if floor(i/5)-(i/5) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(16-strlen(Zgc_adv_jue_talbe[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("D��i ��y ��u l� b� ki�p\n hi�m th�y c�a c�c m�n ph�i"..dialog_string,
		1,
		"Ta bi�t r�i!/Zgc_dialog_end"
	)
end
------------------------------------------�һ������ѯ---------------------------------------
function Zgc_jue_change_rule_inq()
	Say("�� t� <color=yellow>c�p 11 tr� l�n<color> gia nh�p m�n ph�i c� th� d�ng l�nh b�i b�n m�n ��i b� ki�p m�n ph�i, m�i ng�y c� th� ��i t�i �a <color=yellow>20 l�n<color>, m�i l�n t�n <color=yellow>2 l�nh b�i<color> v� <color=yellow>2 ti�n V�ng<color>. Nh� k�! M�i t�i t� <color=yellow>18 gi�-24 gi�<color> L�o phu m�i c� th� gi�p ng��i ��i.",
		1,
		"Ta bi�t r�i!/Zgc_dialog_end"
	)
end
---------------------------------------------�Ի�����------------------------------------------
function Zgc_dialog_end()

end
