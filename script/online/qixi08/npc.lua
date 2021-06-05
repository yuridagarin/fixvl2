Include("\\script\\online\\qixi08\\function.lua");
Include("\\script\\online\\qixi08\\star\\npc.lua");
Include("\\script\\online\\qixi08\\guess\\npc.lua");
Include("\\script\\online\\qixi08\\light\\npc.lua");
Include("\\script\\online\\qixi08\\box\\npc.lua");
Include("\\script\\lib\\time.lua");

g_tbEquipHead = 
{			--8�����			8���ڷ�				9��
	[1] = {{"B�ch Chi�n (Trang s�c ngo�i ph�ng c�p 8)",0,103,73},{"Huy�n V� (Trang s�c n�i ph�ng c�p 8)",0,103,77},{"L�c Ly (Trang s�c c�p 9)",0,103,81}},
	[2] = {{"� B�n (Trang s�c ngo�i ph�ng c�p 8)",0,103,74},{"C�u Anh (Trang s�c n�i ph�ng c�p 8)",0,103,78},{"Th�c Qu� (Trang s�c c�p 9)",0,103,82}},
	[3] = {{"H�a Hu�n (Trang s�c ngo�i ph�ng c�p 8)",0,103,75},{"Y�n Hoa (Trang s�c n�i ph�ng c�p 8)",0,103,79},{"Ph� V� (Trang s�c c�p 9)",0,103,83}},
	[4] = {{"Phi�n Tuy�t (Trang s�c ngo�i ph�ng c�p 8)",0,103,76},{"Y�n M�ng (Trang s�c n�i ph�ng c�p 8)",0,103,80},{"�m Nguy�t (Trang s�c c�p 9)",0,103,84}},
}
g_tbEquipCloth = 
{			--8�����				8���ڷ�				9��
	[1] = {{"Th�t Th�n Y (�o ngo�i ph�ng c�p 8)",0,100,73},{"Gi�ng T� B�o (�o n�i ph�ng c�p 8)",0,100,77},{"T� Ng�n B�o (�o c�p 8)",0,100,81}},
	[2] = {{"Long L�n � Kim Gi�p (�o ngo�i ph�ng c�p 8)",0,100,74},{"L�u Kim Gi�p Y (�o n�i ph�ng c�p 8)",0,100,78},{"X�ch Luy�n Gi�p Y (�o c�p 9)",0,100,82}},
	[3] = {{"L�c Oanh V� Y (�o ngo�i ph�ng c�p 8)",0,100,75},{"Song ��i V� Th��ng (�o n�i ph�ng c�p 8)",0,100,79},{"Ng�c Thoa V� Y (�o c�p 9)",0,100,83}},
	[4] = {{"Doanh V� Th��ng (�o ngo�i ph�ng c�p 8)",0,100,76},{"Ph�ng V� Ngh� Sa (�o n�i ph�ng c�p 8)",0,100,80},{"��i Y�n Ngh� Th��ng (�o c�p 9)",0,100,84}},
}
g_tbEquipTrousers = 
{			--8�����				8���ڷ�				9��
	[1] = {{"S� Ca (H� y ngo�i ph�ng c�p 8)",0,101,73},{"��nh M�c (H� y n�i ph�ng c�p 8)",0,101,77},{"Th� V�n (H� y c�p 9)",0,101,81}},
	[2] = {{"K�nh Th��ng (H� y ngo�i ph�ng c�p 8)",0,101,74},{"��ng Ng�c (H� y n�i ph�ng c�p 8)",0,101,78},{"Huy�n Ti�u (H� y c�p 9)",0,101,82}},
	[3] = {{"Ph� Th�y (H� y ngo�i ph�ng c�p 8)",0,101,75},{"V� M� (H� y n�i ph�ng c�p 8)",0,101,79},{"Kh� V�n (H� y c�p 9)",0,101,83}},
	[4] = {{"H�n �� (H� y ngo�i ph�ng c�p 8)",0,101,76},{"Tinh Lam (H� y n�i ph�ng c�p 8)",0,101,80},{"D� Ca (H� y c�p 9)",0,101,84}},
}

g_tbEquipWeapon = 
{
	[0] = {{"Th�n Qui (V� kh� c�p 9)",0,0,15},			{"�m D��ng �n (V� kh� c�p 10)",0,0,16}},	--��
	[1] = {{"Khoa Ph� (V� kh� c�p 9)",0,1,54},			{"M�t V� (V� kh� c�p 10)",0,1,55}},	--����
	[2] = {{"H�a �nh (V� kh� c�p 9)",0,2,37},			{"Nha C�u (V� kh� c�p 10)",0,2,38}},	--��
	[3] = {{"L�u C�nh (V� kh� c�p 9)",0,3,65},			{"Ngh�ch L�n (V� kh� c�p 10)",0,3,66}},	--��
	[4] = {{"Vi�n �� (V� kh� c�p 9)",0,4,120},			{"B�t X� Chi X� (V� kh� c�p 10)",0,4,121}},	--��
	[5] = {{"Ng�c Tr� (V� kh� c�p 9)",0,5,41},			{"Th�n Ch�m (V� kh� c�p 10)",0,5,42}},	--��
	[6] = {{"C�u Long To�n K�ch (V� kh� c�p 9)",0,6,109},		{"Th��ng N� (V� kh� c�p 10)",0,6,110}},	--ǹ
	[7] = {{"B�ch Th�y (V� kh� c�p 9)",0,7,13},			{"Thi�n T�n (V� kh� c�p 10)",0,7,14}},	--˫��
	[8] = {{"M�c Ki�n Li�n Tr��ng (V� kh� c�p 9)",0,8,98},		{"D��c S� Tr��ng (V� kh� c�p 10)",0,8,99}},	--��
	[9] = {{"Toan D� (V� kh� c�p 9)",0,9,87},			{"Th�i H� (V� kh� c�p 10)",0,9,88}},	--��
	[10] = {{"��i Th�nh Di �m (V� kh� c�p 9)",0,10,76},	{"Kh� M�c Long Ng�m (V� kh� c�p 10)",0,10,77}},	--��
	[11] = {{"V� Ng�n (V� kh� c�p 9)",0,11,13},		{"Thanh Long (V� kh� c�p 10)",0,11,14}},	--צ
}

g_tbRouteEquip = 
{
	[0]={1,2,3,4,5,6,7,8,9,10,11},
	[1]={0,3,5,8},
 	[2]={3,5},
	[3]={8},
	[4]={0},
 	[5]={1},
 	[6]={1},
	[7]={2,10},
	[8]={2},
	[9]={10},
	[10]={0,5},
	[11]={0},
	[12]={5},
	[13]={2,9},
	[14]={2},
	[15]={9},
	[16]={4,6},
	[17]={6},
	[18]={4},
	[19]={7,11},
	[20]={7},
	[21]={11},
}

g_tbEquip = {g_tbEquipHead,g_tbEquipCloth,g_tbEquipTrousers,g_tbEquipWeapon};

function main()
	local nLevel = GetLevel()
	if nLevel <= 30 then
		Talk(1,"",g_szInfoHead.."��ng c�p qu� th�p, ho�t ��ng y�u c�u c�p th�p nh�t l� <color=yellow>31<color>.");
		return 0;
	end;
	local selTab = {};
	local nDate = tonumber(date("%Y%m%d"));
	local nYear1,nMonth1,nDay1 = QX08_GetDate(g_nGameBeginDate);
	local nYear2,nMonth2,nDay2 = QX08_GetDate(g_nGameEndDate);
	local nYear3,nMonth3,nDay3 = QX08_GetDate(g_nAwardEndDate);
	if nDate < g_nGameBeginDate then
		Talk(1,"",g_szInfoHead.."Th�i gian ho�t ��ng <color=yellow>"..nYear1.."ni�n"..nMonth1.."Nguy�t"..nDay1.." ��n "..nYear2.."ni�n"..nMonth2.."Nguy�t"..nDay2.."<color>, v� thi�u hi�p n�y ��n l�c nh� gh� l�i xem.");
		return 0;
	end;
	if nDate > g_nGameEndDate then
		local selTab2 = {};
		if nDate <= g_nAwardEndDate then
			tinsert(selTab2,"D�ng �i�m thi ��u ��i ph�n th��ng (Th�i h�n: "..nYear3.."ni�n"..nMonth3.."Nguy�t"..nDay3..")/point_award");
		end;
		tinsert(selTab2,"K�t th�c ��i tho�i/nothing");
		Say(g_szInfoHead.."Th�i gian l�n ho�t ��ng n�y l� <color=yellow>"..nYear1.."ni�n"..nMonth1.."Nguy�t"..nDay1.." ��n "..nYear2.."ni�n"..nMonth2.."Nguy�t"..nDay2.."<color>, hi�n �� qu� th�i gian ho�t ��ng, xin l�n sau quay l�i.",getn(selTab2),selTab2);
		return 0;
	end;
	local szGameName,nGameID = QX08_GetTodayGame();
	local nYear4,nMonth4,nDay4 = QX08_GetDate(g_nQiXiBeginDate);
	local nYear5,nMonth5,nDay5 = QX08_GetDate(g_nQiXiEndDate);
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	if nDate <= g_nQiXiEndDate then
		tinsert(selTab,"L� th�t t�ch c�ng nhau c�u nguy�n (Th�i gian m�: "..nYear4.."ni�n"..nMonth4.."Nguy�t"..nDay4.." ��n "..nYear5.."ni�n"..nMonth5.."Nguy�t"..nDay5..")/aoyun_star_main");
	end;
	if nGameID == GAME_ID_GUESS then
		tinsert(selTab,"Thi ��u Thi�n C� Th�n To�n (Th� 2, th� 4, th� 6)/#enter_aoyun_game(1)");
	elseif nGameID == GAME_ID_BOX then
		tinsert(selTab,"Thi ��u �o�t B�o K� Binh (Th� 3, th� 5, th� 7)/#enter_aoyun_game(2)");
	elseif nGameID == GAME_ID_LIGHT then
		tinsert(selTab,"H�i th�p ��n (Ch� nh�t)/#enter_aoyun_game(3)");
	end;
	if nDate <= g_nAwardEndDate then
		tinsert(selTab,"D�ng �i�m thi ��u ��i ph�n th��ng (Th�i h�n: "..nYear3.."ni�n"..nMonth3.."Nguy�t"..nDay3..")/point_award");
	end;
--	tinsert(selTab,"��ȡ�����µ�һ�������뺯��/get_ticket");
	tinsert(selTab,"Xem th�i gian ho�t ��ng/see_game_schedule");
	tinsert(selTab,"Nh�n h��ng d�n ho�t ��ng tr�n 20 n�m/get_book");
	if nDate >= g_nYearsBeginDate and nDate <= g_nYearsEndDate then
		tinsert(selTab,"Nh�n danh hi�u M�ng tr�n 20 n�m (Th�i h�n nh�n: "..nYear6.."ni�n"..nMonth6.."Nguy�t"..nDay6..")/get_years_title");
	end
	if nDate <= 20080823 then
		tinsert(selTab,"Ta mu�n nh�n b�i th��ng H�i th�p ��n ch� nh�t tr��c (17/8). (Th�i h�n: 23/8)/diandeng_buchang");
	end 	
	tinsert(selTab,"Ta ��n xem th�/nothing");
	if DEBUG_VERSION == 1 then
		tinsert(selTab,"L�i v�o ki�m tra/test_entry");
	end;
	Say(g_szInfoHead.."N�m 1988 �ng C�u B� Qu�n vi�t ra wps, ��nh d�u th�nh l�p c�a c�ng ty Kingsoft, ��n nay �� 20 n�m, trong 20 n�m ��, Kingsoft ��ng cay c� vinh quang c� nh�ng cho d� l�c n�o c�ng c� s� �ng h� c�a m�i ng��i. T� b�y gi� ��n 23 gi� 27/1/2009, s� m� ho�t ��ng K� ni�m 20 n�m Kingsoft, hoan ngh�nh m�i ng��i tham gia, ta �� chu�n r�t nhi�u tr� ch�i nh� h�p d�n. M�i ng�y ch� c� th� tham gia m�t tr� ch�i nh�. <color=yellow>H�m nay: ["..szGameName.."]. Th�i gian ho�t ��ng: "..nYear1.."ni�n"..nMonth1.."Nguy�t"..nDay1.." ��n "..nYear2.."ni�n"..nMonth2.."Nguy�t"..nDay2.." m�i ng�y t� 9:00 ��n 23:00<color>. Xin ch� �, m�i ng��i nhi�u nh�t ch� c� th� t�ch l�y 200 �i�m.",getn(selTab),selTab);
end;

function see_game_schedule()
	local selTab = {
				"Th� 2: Thi�n C� Th�n To�n/#know_game_detail(1)",
				"Th� 3: �o�t B�o K� Binh/#know_game_detail(2)",
				"Th� 4: Thi�n C� Th�n To�n/#know_game_detail(1)",
				"Th� n�m: �o�t B�o K� Binh/#know_game_detail(2)",
				"Th� 6: Thi�n C� Th�n To�n/#know_game_detail(1)",
				"Th� 7: �o�t B�o K� Binh/#know_game_detail(2)",
				"Ch� nh�t: H�i th�p ��n/#know_game_detail(3)",
				"Ta �� hi�u/main",
				}
	Say(g_szInfoHead.."Sau ��y l� s�p x�p c�a th� 2:",getn(selTab),selTab);
end;

function know_game_detail(nGameID)
	if nGameID == GAME_ID_GUESS then
		Talk(1,"see_game_schedule",g_szInfoHead.."H� th�ng ch�n ng�u nhi�n 1 s� t� 0 ��n 100, sau �� b�n c� 5 c� h�i �o�n s� n�y, c�ng �o�n ���c s�m th� ph�n th��ng c�ng t�t. <color=red>Ch� �: Ph�n th��ng ph�i ���c nh�n trong ng�y<color>.");
	elseif nGameID == GAME_ID_BOX then
		Talk(1,"see_game_schedule",g_szInfoHead.."B�n v� h�o h�u �� v�o b�n ��, h� th�ng m�i v�ng s� gi�m 1 R��ng theo s� ng��i, ch� c� ng��i gi�nh ���c r��ng m�i c� th� � l�i ti�p t�c tr� ch�i. Gi� v�ng c�ng v� sau s� nh�n ph�n th��ng c�ng t�t. <color=red>Ch� �: Ph�n th��ng ph�i ���c nh�n trong ng�y<color>.");
	elseif nGameID == GAME_ID_LIGHT then
		Talk(1,"see_game_schedule",g_szInfoHead.."Quan s�t k� th� t� ��n ���c th�p, c�n c� g�i � c�a h� th�ng m� th�p ��n, t�ng c�ng c� 5 �i, v��t �i c�ng nhi�u ph�n th��ng c�ng t�t. <color=red>Ch� �: Ph�n th��ng ph�i ���c nh�n trong ng�y<color>.");
	end;
end;

function get_ticket()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_GET_TICKET_DATE) < nDate then
		if gf_JudgeRoomWeight(2,30,g_szInfoHead) == 0 then
			return 0;
		end;
		SetTask(TSK_AOYUN_GET_TICKET_DATE,nDate);
		AddItem(2,0,1069,10);
		Msg2Player("B�n nh�n ���c 10 t�m 'Th� m�i T� v� Thi�n h� �� nh�t'");
		Talk(1,"main",g_szInfoHead.."C� 'Th� m�i T� v� Thi�n h� �� nh�t' m�i c� th� tham gia thi ��u, h�m nay g�i ng��i 10 t�m, h�y nh�n l�y. D�ng h�t n�u v�n mu�n tham gia h�y <color=yellow>tham gia l�i ��i ��i h�i t� v� Thi�n h� �� nh�t, m�i l�n tham gia s� c� th� nh�n ���c 1 t�m 'Th� m�i ��i h�i t� v� Thi�n h� �� nh�t'.<color>");
	else
		Talk(1,"main",g_szInfoHead.."Xin l�i, ng��i �� nh�n 'Th� m�i ��i h�i t� v� Thi�n h� �� nh�t' h�m nay, nh�ng v�n c� th� nh�n th� m�i khi <color=yellow>tham gia ��i h�i t� v� Thi�n h� �� nh�t<color>, ho�c ng�y mai h�y ��n t�m ta.");
	end;
end;

function test_entry()
	local selTab = {
			"Thi ��u Thi�n C� Th�n To�n/aoyun_guess_main",
			"Thi ��u �o�t B�o K� Binh/aoyun_box_main",
			"�i�m ��ng H�i/aoyun_light_main",
			"Kh�ng c� g�/nothing",
			}
	Say(g_szInfoHead.."�� ki�m tra",getn(selTab),selTab);
end;

function use_point()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear,nMonth,nDay = QX08_GetDate(g_nAwardEndDate);
	if nDate > g_nAwardEndDate then
		Talk(1,"",g_szInfoHead.."Th�i gian ��i trang b� �� h�t, xin ch� ho�t ��ng l�n sau.");
		return 0;
	end;
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local selTab = {
				"D�ng �i�m ��i trang b� linh kh� cao (Th�i h�n: "..nYear.."ni�n"..nMonth.."Nguy�t"..nDay..")/exchange_equipment",
				"L�m sao ��i trang b� linh kh� cao/know_how_to_get_point",
				"T�m kh�ng ��i ph�n th��ng/nothing",
				}
	Say(g_szInfoHead.."H�nh t�u giang h�, kh�ng th� thi�u trang b�, n�u trang b� t�t n� c� th� gi�p b�n c�ng c� ��a v� tr�n giang h�. �� ban th��ng cho c�c v� anh h�ng, tham gia ho�t ��ng s� c� c� h�i nh�n ���c trang b� linh kh� cao. �i�m ho�t ��ng hi�n t�i c�a b�n l�: <color=yellow>"..nPoint.."<color>",getn(selTab),selTab);
end;

function point_award()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear,nMonth,nDay = QX08_GetDate(g_nAwardEndDate);
	if nDate > g_nAwardEndDate then
		Talk(1,"",g_szInfoHead.."Th�i gian ��i trang b� �� h�t, xin ch� ho�t ��ng l�n sau.");
		return 0;
	end;
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local strtab = {
				"D�ng �i�m ��i ph�n th��ng (Th�i h�n: "..nYear.."ni�n"..nMonth.."Nguy�t"..nDay..")/exchange_award",
				"L�m sao d�ng �i�m ��i ph�n th��ng/know_how_to_get_point",
				"T�m kh�ng ��i ph�n th��ng/nothing"
				};
	Say(g_szInfoHead.."Ng��i c� th� d�ng �i�m �� ��i c�c lo�i ph�n th��ng t�i ��y, �i�m kh�ng �� th� c� th� tham gia ho�t ��ng thu th�p, nh� v�y tuy kh�ng c� ph�n th��ng b�nh th��ng, nh�ng c� ph�n th��ng �i�m r�t cao. �i�m hi�n t�i l�: <color=yellow>"..nPoint.."<color>, xin tr��c 23 gi� ng�y "..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.." nh�n ph�n th��ng.",getn(strtab),strtab);
end

function exchange_award()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local strtab = {
				"Ta mu�n d�ng 1 �i�m t�ch l�y ��i 1 R��ng k� ni�m 20 n�m/change_one_box",
				"Ta mu�n d�ng 10 �i�m t�ch l�y ��i ph�n th��ng/#ask_exchange_award(10)",
				"Ta mu�n d�ng 50 �i�m t�ch l�y ��i ph�n th��ng/#ask_exchange_award(50)",
				"Ta mu�n d�ng 200 �i�m t�ch l�y ��i ph�n th��ng/#ask_exchange_award(200)",
				"Ta mu�n d�ng 200 �i�m t�ch l�y ��i 1 quy�n H�p Th�nh M�t T�ch/exchange_miji",
				"R��ng k� ni�m 20 n�m c� th� m� ra ph�n th��ng n�o/know_20box_award",
				"Tr� l�i ��i ph�n th��ng sau/nothing",
				}
	Say(g_szInfoHead.."�i�m hi�n l�: <color=yellow>"..nPoint.."<color>, ng��i mu�n ��i ph�n th��ng n�o?",getn(strtab),strtab);
end

function change_one_box()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 1 then
		Talk(1,"",g_szInfoHead.."Xin l�i, ng��i ch�a c� �i�m t�ch l�y.");
	else
		Say(g_szInfoHead.."Mu�n d�ng 1 �i�m t�ch l�y ��i 1 R��ng k� ni�m 20 n�m kh�ng?",
			3,
			"�, ta mu�n ��i./input_box_num",
			"Kh�ng, ta nh�m!/exchange_award",
			"Tr� l�i ��i ph�n th��ng sau/nothing")
	end
end

function input_box_num()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	AskClientForNumber("confirm_give_box",1,nPoint,"mu�n ��i m�y r��ng?");
end

function confirm_give_box(nCount)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nCount then
		return 0;
	end
	if gf_Judge_Room_Weight(1,nCount*10,g_szInfoHead) ~= 1 then
		return 0;
	end 
	SetTask(TSK_AOYUN_POINT,nPoint-nCount);
	AddItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],nCount);
	Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tItemName[6][1]);	
end

function know_20box_award()
	if IB_VERSION == 1 then
		Talk(2,"exchange_award",g_szInfoHead.."R��ng k� ni�m 20 n�m c� th� m� ���c: \nNg�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n l� chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)\nM�t t�ch cao c�p S� M�n (ng��i ch�i ch�a gia nh�p l�u ph�i s� nh�n ���c quy�n m�t t�ch l�u ph�i ng�u nhi�n)\n100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)\n��nh H�n Thi�n Th�ch Th�n Th�ch (c��ng h�a v�t ph�m, khi �� c��ng h�a l� 7 th� kh�ng th� c��ng h�a n�a)\nThi�n Qu�i Th�ch(d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i v� ��i trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)",g_szInfoHead.."\nM�nh Thi�n Th�ch (trang b� c��ng h�a c�p 1-4 ti�u hao v�t ph�m)\nThi�n Th�ch Tinh Th�ch (trang b� c��ng h�a c�p 8-15 ti�u hao v�t ph�m)\nKinh nghi�m l�p ph��ng ��ng c�p\nHuy Ho�ng Chi Th�y v� Vinh D� Chi Th�y\n    Ph�n th��ng � tr�n, s� c�n c� v�o ch�a kh�a d�ng �� m� b�o r��ng m� c� t� l� kh�c nhau, t�t c� nh�ng v�t ph�m � tr�n, tr� <color=yellow>kinh nghi�m, Thi�n Qu�i Th�ch, Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, ��u c� th� giao d�ch ���c, ch�c b�n may m�n!");
	else
		Talk(2,"exchange_award",g_szInfoHead.."R��ng k� ni�m 20 n�m c� th� m� ra ���c: \nNg�a di chuy�n 120%, �� b�n 200 �i�m (D��ng M�n l� chi�n m� di chuy�n 35%, �� b�n 1000 �i�m)\nM�t t�ch cao c�p S� M�n (ng��i ch�a gia nh�p l�u ph�i s� nh�n ���c 1 quy�n m�t t�ch l�u ph�i ng�u nhi�n)\n100 tri�u kinh nghi�m (l�u �, khi kinh nghi�m c�a b�n ��t ��n 2 t�, th� ph�n d� ra s� b� m�t, m�i tu�n ch� c� th� ��i th�nh c�ng 1 l�n)\nThi�n Th�ch Linh Th�ch (c��ng h�a trang b� tr�c ti�p ��n c�p )\nThi�n Qu�i Th�ch(d�ng th�ng c�p trang b� Vi�m ��, trang b� t��ng qu�n, trang b� nguy�n so�i v� ��i trang b� Thi�n ��a Huy�n Ho�ng th�nh trang b� Thi�n Qu�i)\nNguy�t Hoa ho�c N� Oa Tinh Th�ch",g_szInfoHead.."\nKinh nghi�m l�p ph��ng ��ng c�p\nHuy Ho�ng Chi Th�y v� Vinh D� Chi Th�y\n    Ph�n th��ng � tr�n, s� c�n c� v�o ch�a kh�a d�ng �� m� b�o r��ng m� c� t� l� kh�c nhau, t�t c� nh�ng v�t ph�m � tr�n, tr� <color=yellow>kinh nghi�m, Thi�n Qu�i Th�ch, Huy Ho�ng Chi Th�y v� Vinh D� Chi Th�y<color>, ��u c� th� giao d�ch ���c, ch�c b�n may m�n!");
	end
end

function ask_exchange_award(nJifen)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nJifen then
		Talk(1,"",g_szInfoHead.."Xin l�i, �i�m kh�ng �� �� ��i ph�n th��ng, �i�m hi�n l�: <color=yellow>"..nPoint.."<color>.")
		return 0
	end
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_EXP_NUM,0);
		SetTask(TSK_AOYUN_YI_EXP,0);
	end
	if GetTask(TSK_AOYUN_EXP_NUM) >= g_nExpNum then
		Talk(1,"",g_szInfoHead.."Xin l�i, ph�n th��ng kinh nghi�m m�i ng��i m�i tu�n ch� ���c ��i "..g_nExpNum.." l�n, tu�n n�y �� ��i r�i, tu�n sau ��n �i.");
		return 0
	end
	local nLv = GetLevel();
	local nExpArg = nLv^3/80^3;
	local nExp = floor(tJifenAward[nJifen][6]*nExpArg);
	local nExpNum = GetTask(TSK_AOYUN_EXP_NUM);
	Say(g_szInfoHead.."Mu�n d�ng "..nJifen.." �i�m t�ch l�y ��i "..tJifenAward[nJifen][5].."c�i"..tJifenAward[nJifen][1].." v�"..nExp.." kinh nghi�m kh�ng? <color=red>Ch� �, cho d� ��i ph�n th��ng n�o, ph�n th��ng kinh nghi�m m�i tu�n nhi�u nh�t ch� nh�n "..g_nExpNum.." l�n, ��y l� l�n "..(nExpNum+1).." nh�n ph�n th��ng.<color>",
			3,
			"�, ta mu�n ��i./#confirm_exchange_award("..nJifen..")",
			"Kh�ng, ta nh�m!/exchange_award",
			"Tr� l�i ��i ph�n th��ng sau/nothing")
end

function confirm_exchange_award(nJifen)
	if gf_Judge_Room_Weight(2,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nJifen then
		Talk(1,"",g_szInfoHead.."Xin l�i, �i�m kh�ng �� �� ��i ph�n th��ng, �i�m hi�n l�: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_EXP_NUM,0);
		SetTask(TSK_AOYUN_YI_EXP,0);
	end
	if GetTask(TSK_AOYUN_EXP_NUM) >= g_nExpNum then
		Talk(1,"",g_szInfoHead.."Xin l�i, ph�n th��ng kinh nghi�m m�i ng��i m�i tu�n ch� ���c ��i "..g_nExpNum.." l�n, tu�n n�y �� ��i r�i, tu�n sau ��n �i.");
		return 0;
	end
	local nLv = GetLevel();
	local nExpArg = nLv^3/80^3;
	local nExp = floor(tJifenAward[nJifen][6]*nExpArg);	
	SetTask(TSK_AOYUN_POINT,nPoint-nJifen);
	SetTask(TSK_AOYUN_EXP_NUM,GetTask(TSK_AOYUN_EXP_NUM)+1);
	AddItem(tJifenAward[nJifen][2],tJifenAward[nJifen][3],tJifenAward[nJifen][4],tJifenAward[nJifen][5]);
	ModifyExp(nExp);
	Msg2Player("B�n nh�n ���c "..tJifenAward[nJifen][5].."c�i"..tJifenAward[nJifen][1].." v�"..nExp.." kinh nghi�m.");
	WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."S� d�ng "..nJifen.."��i ph�n th��ng.");
	Talk(1,"exchange_award",g_szInfoHead.."Ch�c m�ng b�n nh�n ���c "..tJifenAward[nJifen][5].."c�i"..tJifenAward[nJifen][1].." v�"..nExp.." kinh nghi�m.");
end

function exchange_miji()
	local strtab = {
				"T� Linh Chi�n � Ph� (hi�u qu� Kim Thi�n v� Chi�m Y)/#ask_change_miji(1)",
				"T� Linh Thi�n Y Ph� (hi�u qu� Thi�n H� v� Chi�m Y)/#ask_change_miji(2)",
				"T� Linh T� Y Ph� (hi�u qu� T� H� v� Chi�m Y)/#ask_change_miji(3)",
				"Ta ch�n nh�m r�i./exchange_award",
				"T�m kh�ng ��i ph�n th��ng/nothing"
				}
	Say(g_szInfoHead.."mu�n ��i m�t t�ch n�o?",getn(strtab),strtab);	
end

function ask_change_miji(nType)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 200 then
		Talk(1,"",g_szInfoHead.."Xin l�i, �i�m kh�ng �� �� ��i ph�n th��ng, �i�m hi�n l�: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end	
	Say(g_szInfoHead.."Mu�n d�ng 200 �i�m t�ch l�y ��i <color=yellow>"..tMijiName[nType][1].."<color> ch�?",
			3,
			"�, ta mu�n ��i./#confirm_exchange_miji("..nType..")",
			"Kh�ng, ta nh�m!/exchange_miji",
			"T�m kh�ng ��i ph�n th��ng/nothing")	
end

function confirm_exchange_miji(nType)
	if gf_Judge_Room_Weight(1,50) ~= 1 then
		return 0;
	end	
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 200 then
		Talk(1,"",g_szInfoHead.."Xin l�i, �i�m kh�ng �� �� ��i ph�n th��ng, �i�m hi�n l�: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end
	SetTask(TSK_AOYUN_POINT,nPoint-200);
	AddItem(tMijiName[nType][2],tMijiName[nType][3],tMijiName[nType][4],1);
	Msg2Player("D�ng 200 �i�m t�ch l�y ��i 1 quy�n "..tMijiName[nType][1]);
	WriteLog("[Ho�t ��ng K� ni�m 20 n�m]: Ng��i ch�i "..GetName().."D�ng 200 �i�m t�ch l�y ��i 1 quy�n "..tMijiName[nType][1]);	
end

function exchange_equipment()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < g_nEquipPoint then
		Talk(1,"",g_szInfoHead.."Xin l�i, �i�m t�ch l�y kh�ng �� �� ��i 1 m�n trang b�, �t nh�t c�n c� <color=yellow>"..g_nEquipPoint.."<color> �i�m m�i c� th� ��i 1 m�n trang b�.");
		return 0;
	end;
	local selTab = {
				"Trang s�c/#exchange_equipment_1(1)",
				"Ngo�i trang/#exchange_equipment_1(2)",
				"H� y/#exchange_equipment_1(3)",
				"V� kh�/#exchange_equipment_1(4)",
				"T�m th�i kh�ng ��i/nothing",
				}
	Say(g_szInfoHead.."Xin ch�n v� tr� trang b�: ",getn(selTab),selTab);
end;

function exchange_equipment_1(nEquipType)
	local selTab = {};
	local nBody = GetBody();
	local tbEquip = g_tbEquip[nEquipType];
	if nEquipType ~= 4 then
		for i=1,getn(tbEquip[nBody]) do
			tinsert(selTab,tbEquip[nBody][i][1].."/#exchange_equipment_2("..nEquipType..","..i..")");
		end;
	else
		tinsert(selTab,"V� kh� c�p 9/#exchange_equipment_2("..nEquipType..",1)");
		tinsert(selTab,"V� kh� c�p 10/#exchange_equipment_2("..nEquipType..",2)");
	end;
	tinsert(selTab,"Ch�n l�i/exchange_equipment");
	tinsert(selTab,"T�m th�i kh�ng ��i/nothing");
	local szEquipName = get_equip_describe(nEquipType);
	Say(g_szInfoHead.."B�n �� ch�n 1 "..szEquipName..", ti�p theo xin ch�n ��ng c�p c�a trang b�: ",getn(selTab),selTab);
end;

function exchange_equipment_2(nEquipType,nLevel)
	local nPlayerRoute = GetPlayerRoute();
	SetTask(TSK_WEAPON_TYPE,0);
	if nPlayerRoute == 2 and nEquipType == 4 then 	--���������׼�
		local selTab = {
					"�ao/#exchange_equipment_2_1("..nEquipType..","..nLevel..",1)",
					"C�n/#exchange_equipment_2_1("..nEquipType..","..nLevel..",2)",
					"Ch�n l�i/exchange_equipment",
					"T�m th�i kh�ng ��i/nothing",
					}
		Say(g_szInfoHead.."Xin ch�n lo�i v� kh�: ",getn(selTab),selTab);
		return 0;
	end;
	exchange_equipment_2_1(nEquipType,nLevel);
end;

function exchange_equipment_2_1(nEquipType,nLevel,nType)
	if nType then
		SetTask(TSK_WEAPON_TYPE,nType);
	end;
	local selTab = {
				"S� l� (Linh kh� 111)/#exchange_equipment_3("..nEquipType..","..nLevel..",1)",
				"S� ch�n (Linh kh� 110)/#exchange_equipment_3("..nEquipType..","..nLevel..",2)",
				"Ch�n l�i/exchange_equipment",
				"T�m th�i kh�ng ��i/nothing",
				}
	local szEquipName = get_equip_describe(nEquipType,nLevel)
	Say(g_szInfoHead.."B�n �� ch�n 1 "..szEquipName..", ti�p theo xin ch�n �i�m linh kh� ch�n:",getn(selTab),selTab);

end;

function exchange_equipment_3(nEquipType,nLevel,nJO)
	local selTab = {
				"��ng � ��i /#exchange_equipment_4("..nEquipType..","..nLevel..","..nJO..")",
				"Ch�n l�i/exchange_equipment",
				"T�m th�i kh�ng ��i/nothing",
				}
	local szEquipName = get_equip_describe(nEquipType,nLevel,nJO);
	Say(g_szInfoHead.."B�n �� ch�n 1 "..szEquipName..", b�n x�c nh�n mu�n ��i?",getn(selTab),selTab);
end;

function exchange_equipment_4(nEquipType,nLevel,nJO)
	if gf_JudgeRoomWeight(2,200,g_szInfoHead) == 0 then
		return 0;
	end;
	local szEquipName,tbEquipInfo = get_equip_describe(nEquipType,nLevel,nJO);
	local nID1,nID2,nID3 = tbEquipInfo[2],tbEquipInfo[3],tbEquipInfo[4];
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < g_nEquipPoint then
		Talk(1,"",g_szInfoHead.."Xin l�i, �i�m t�ch l�y kh�ng �� �� ��i 1 m�n trang b�, �t nh�t c�n c� <color=yellow>"..g_nEquipPoint.."<color> �i�m m�i c� th� ��i 1 m�n trang b�.");
		return 0;
	end;
	local nLingqi = 0;
	if nJO == 1 then
		nLingqi = 111;
	else
		nLingqi = 110;
	end;
	local nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,1,4,0,0,0,0,0,0,0,0,nLingqi);
	SetEquipCanChouQu(nItemIdx,1);
	SetTask(TSK_AOYUN_POINT,nPoint-g_nEquipPoint);
	szEquipName = sf_RemoveTag(szEquipName,"<",">");
	Msg2Player("B�n ��i "..g_nEquipPoint.." �i�m t�ch lu� ho�t ��ng ��i 1 "..szEquipName);
	WriteLog("[Ho�t ��ng Olympic]:"..GetName().." �� ��i 1 "..szEquipName..". T�ch lu� c�n: "..(nPoint-g_nEquipPoint));
end;

function know_how_to_get_point()
	Talk(2,"point_award",g_szInfoHead.."Tham gia ho�t ��ng m�i ng�y, b�n s� nh�n ���c ph�n th��ng v� �i�m t�ch lu�. Ph�n th��ng c� ��ng c�p kh�c nhau s� nh�n ���c �i�m t�ch lu� kh�c nhau.\nPh�n th��ng c�p 1: 5 �i�m\nPh�n th��ng c�p 2: 4 �i�m\nPh�n th��ng c�p 3: 3 �i�m\nPh�n th��ng c�p 4: 2 �i�m\nPh�n th��ng c�p 5: 1 �i�m",g_szInfoHead.."\nS� d�ng 1 �i�m t�ch lu� �� ��i 1 'R��ng k� ni�m 20 n�m'\nS� d�ng 10 �i�m t�ch lu� �� ��i 1 'R��ng k� ni�m 20 n�m' + [2 tri�u*l�p ph��ng ��ng c�p ng��i ch�i/l�p ph��ng 80] �i�m kinh nghi�m\nS� d�ng 50 �i�m t�ch lu� �� ��i 8 'R��ng k� ni�m 20 n�m'+[5 tri�u*l�p ph��ng ��ng c�p ng��i ch�i/l�p ph��ng 80] �i�m kinh nghi�m\nS� d�ng 200 �i�m t�ch lu� �� ��i 35 'R��ng k� ni�m 20 n�m'+[10 tri�u*l�p ph��ng ��ng c�p ng��i ch�i/l�p ph��ng 80] �i�m kinh nghi�m\nS� d�ng 200 �i�m t�ch lu� �� ��i 1 H�p Th�nh M�t T�ch\n    <color=red>Ch� �, m�i tu�n ch� c� th� ��i ph�n th��ng kinh nghi�m nhi�u nh�t l� 21 l�n, b�o r��ng c� th� ��i kh�ng gi�i h�n.<color>");
end;

function get_equip_describe(nEquipType,nLevel,nJO)
	local tbEquipName = {"Trang s�c","Ngo�i trang","Qu�n ","V� kh�"};
	local szEquipName = "";
	local szLingQi = "";
	local tbEquipInfo = {};
	local nBody = GetBody();
	if nEquipType == nil then
		return "";
	end;
	local tbEquip = g_tbEquip[nEquipType];
	if nLevel == nil and nJO == nil then
		return "<color=yellow>"..tbEquipName[nEquipType].."<color>";
	elseif nLevel ~= nil and nJO == nil then
		if nEquipType ~= 4 then
			szEquipName = "<color=yellow>"..tbEquip[nBody][nLevel][1].."<color>";
		else
			if nLevel == 1 then
				szEquipName = "<color=yellow>V� kh� c�p 9<color>";
			elseif nLevel == 2 then
				szEquipName = "<color=yellow>V� kh� c�p 10<color>";
			end;
		end;
		return szEquipName;
	else
		if nEquipType ~= 4 then
			szEquipName ="<color=yellow>".. tbEquip[nBody][nLevel][1].."<color>";
			tbEquipInfo = tbEquip[nBody][nLevel];
		else
			if nLevel == 1 then
				szEquipName = "<color=yellow>V� kh� c�p 9<color>";
			elseif nLevel == 2 then
				szEquipName = "<color=yellow>V� kh� c�p 10<color>";
			end;
			local nRoute = GetPlayerRoute();
			local nWeaponIdx = 0;
			if nRoute == 2 then
				nWeaponIdx = g_tbRouteEquip[nRoute][GetTask(TSK_WEAPON_TYPE)];
			else
				nWeaponIdx = g_tbRouteEquip[nRoute][random(1,getn(g_tbRouteEquip[nRoute]))];
			end;
			tbEquipInfo = g_tbEquipWeapon[nWeaponIdx][nLevel];
			if gf_CheckPlayerRoute() == 1 then
				szEquipName = tbEquipInfo[1];
			end;
		end;
		if nJO == 1 then
			szLingQi = "<color=red>Linh kh� 111<color>";
		elseif nJO == 2 then
			szLingQi = "<color=red>Linh kh� 110<color>";
		end;
		szEquipName = szLingQi.." c�a <color=yellow>"..szEquipName.."<color>"
		return szEquipName,tbEquipInfo;
	end;
end;

function enter_aoyun_game(nType)	
	if nType == GAME_ID_GUESS then
		aoyun_guess_main();
	elseif nType == GAME_ID_BOX then
		aoyun_box_main();
	elseif nType == GAME_ID_LIGHT then
		aoyun_light_main();
	end;
end;

function diandeng_buchang()
	if GetTask(571) ~= 0 then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n b�i th��ng r�i.");
		return
	end
	local nGuan = GetTask(TSK_AOYUN_LIGHT_GUAN);
	if nGuan == 0 then
		Talk(1,"",g_szInfoHead.."Tu�n tr��c ng��i kh�ng tham gia h�i hoa ��ng n�n kh�ng th� nh�n ph�n th��ng.");
	else
		QX08_GetAward(3,6-nGuan,571); 		
	end
end

function get_book()
	if GetItemCount(2,0,1090) >= 1 then
		Talk(1,"",g_szInfoHead.."Kh�ng ph�i tr�n ng��i ng��i �� c� m�t c�i r�i sao?");
		return 0
	end
	AddItem(2,0,1090,1);
end

function get_years_title()
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	Say(g_szInfoHead.."Hai m��i n�m tr��c, C�u B� Qu�n ti�n sinh �� vi�t n�n ph�n m�m x� l� wps, ��nh d�u vi�c s�ng l�p Kingsoft. Ch�p m�t �� 20 n�m tr�i qua, Kingsoft �� tr�i qua bi�t bao th�ng tr�m, nh�ng kh�ng c� s� quan t�m �ng h� c�a ng��i d�ng th� s� kh�ng c� Kingsoft ng�y h�m nay. T� 18/11 ��n 23h 24/11, nh�n d�p k� ni�m 20 n�m th�nh l�p Kingsoft, ch�ng t�i �� chu�n b� m�t s� l� v�t, hy v�ng b�n s� th�ch!",
			3,
			"Nh�n danh hi�u M�ng tr�n 20 n�m (Th�i h�n nh�n: "..nYear6.."ni�n"..nMonth6.."Nguy�t"..nDay6..")/ask_get_title",
			"Ki�m tra th�i gian nh�n danh hi�u v� th�i gian hi�u qu�/check_title_time",
			"Ta ch� ��n xem th�/nothing");
end

function ask_get_title()
	local nHour = tonumber(date("%H"));
	if GetTask(TSK_YEARS_BEGIN_DATE) ~= 0 then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n danh hi�u r�i.");
		return 0;
	end
	if nHour >= 23 then
		Say(g_szInfoHead.."B�y gi� �� qu� 23h, n�u b�n nh�n danh hi�u l�c n�y, b�n s� kh�ng nh�n ���c kinh nghi�m 1h c�a ng�y h�m nay. Khuy�n b�n ng�y mai h�y nh�n danh hi�u. B�n c� mu�n nh�n l�c n�y kh�ng?",
			2,
			"Ta mu�n nh�n /ask_get_title2",
			"Ng�y mai l�i ��n nh�n /nothing");
	else
		ask_get_title2();
	end
end

function ask_get_title2()
	Say(g_szInfoHead.."Danh hi�u k� ni�m 20 n�m, sau khi s� d�ng, m�i ph�t s� t�ng 0.5% kinh nghi�m, l�n h�n <color=yellow>"..tYearsExp[IB_VERSION][1].."<color> gi�, t�i �a nh�n ���c "..tYearsExp[IB_VERSION][1]..", m�i ng�y c� hi�u qu� trong 1h, <color=yellow>7 ng�y<color> sau danh hi�u s� bi�n m�t.",
		2,
		"Ta bi�t r�i, ta mu�n nh�n danh hi�u/confirm_get_title",
		"Ta ch�a mu�n nh�n danh hi�u/nothing")
end

function confirm_get_title()
	local nDate = tonumber(date("%Y%m%d"));
	if IsTitleExist(3,8) > 0 then
		return
	end	
	if AddTitle(3, 8) > 0 then
		SetCurTitle(3,8);
	end
	SetTask(TSK_YEARS_BEGIN_DATE,nDate);
	local nEndDate = tf_GetResultDate(GetTask(TSK_YEARS_BEGIN_DATE),g_nYearsDays-1);
	SetTask(TSK_YEARS_END_DATE,nEndDate);	
end

function check_title_time()
	local nBeginDate = GetTask(TSK_YEARS_BEGIN_DATE);
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	if nBeginDate == 0 then
		Talk(1,"get_years_title",g_szInfoHead.."Th�i gian h�t h�n nh�n danh hi�u l�: <color=yellow>"..nYear6.."ni�n"..nMonth6.."Nguy�t"..nDay6.." ng�y<color>.");
	else
		local nEndDate = GetTask(TSK_YEARS_END_DATE);
		local nYear1,nMonth1,nDay1 = QX08_GetDate(nBeginDate);
		local nYear2,nMonth2,nDay2 = QX08_GetDate(nEndDate);
		Talk(1,"get_years_title",g_szInfoHead.."Th�i gian nh�n danh hi�u c�a b�n l� <color=yellow>"..nYear1.."ni�n"..nMonth1.."Nguy�t"..nDay1.." ng�y<color>, th�i gian h�t h�n nh�n kinh nghi�m l� <color=yellow>"..nYear2.."ni�n"..nMonth2.."Nguy�t"..nDay2.." ng�y<color>.");
	end
end