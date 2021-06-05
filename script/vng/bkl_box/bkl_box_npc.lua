
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");

tbBox_everyday = {
							[0] = {2, 6, {25, 25, 40, 60, 75, 100}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[1] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[2] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[3] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[4] = {1, 6, {25, 40, 60, 75, 100, 175}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[5] = {2, 6, {25, 25, 40, 60, 75, 100}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
							[6] = {2, 6, {25, 25, 40, 60, 75, 100}, {4, 4, 4, 4, 4, 5}, {3, 3, 3, 3, 3, 4}},
					}
function main()
	Talk(1, "", "��y l� r��ng r�ng !!!!")
	do return end
	--Msg2Player("M� r��ng")
	if CheckActivatedExt_BKL() ~= 2 then		
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i V� L�m Ti�n B�i!");
		return
	end	
	local nWeek = tonumber(date("%w"))
	local nNumRec = gf_GetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX)

--	Msg2Player("Ng�y: "..nWeek)	
--	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
--		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� nh�n ph�n th��ng n�y v�o th� s�u, th� b�y v� ch� nh�t.");
--		return
--	end
	if nNumRec > tbBox_everyday[nWeek][2] then
		Talk(1, "", "<color=green>B�ch Kim B�o R��ng<color>: H�m nay ��i hi�p �� h�t l�n m� r��ng, vui l�ng quay l�i v�o ng�y mai.");
		return
	end
	Msg2Player("L�n m� r��ng th� "..nNumRec.." trong ng�y, m� r��ng c�n "..tbBox_everyday[nWeek][3][nNumRec].." xu v�t ph�m")
	if GetItemCount(2,1,30230) < tbBox_everyday[nWeek][3][nNumRec] then
		Talk(1, "", "<color=green>B�ch Kim B�o R��ng<color>: ��i hi�p kh�ng �� Xu v�t ph�m �� m� r��ng.");
		return
	end
 	if gf_Judge_Room_Weight(2,100) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
-------------------------------------
	local box_index = GetTargetNpc()
--	Msg2Player("Gia tri box_index: "..box_index)
--	SetTask(2693,box_index)  --sau khi xong, ��i th�nh 2693 ##################################################

	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 30 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		DoWait(26,27,5)	
	else
		Talk(1,"","Hi�n �� c� ng��i s� d�ng <color=red>B�ch Kim B�o r��ng<color>.")
		return
	end

end

function bkl_box_award()
	local tWeapon_bkl = {
		[1] =	{
				{700, "V�n Nh�n", 0, 0, 14},
				{700, "M�n Thi�n Hoa V�",	 0, 1, 53},
				{700, "H�a Tinh", 0, 2, 36},
				{700, "C� ��nh",	0, 3, 64},
				{700, "Th�n Cung", 0,	4,	119},
				{700, "Li�t Di�m", 0, 5, 40},
				{700, "��i H�o L�i Th��ng",	0,	6, 108},
				{700, "L�ng Phong", 0, 7, 12},
				{700, "A La H�n Tr��ng", 0, 8, 97},
				{700, "Th�n H�nh",	 0, 9, 86},
				{700, "Hi Nh�n C�m", 	0,	10, 75},
				{700, "M�nh H�", 0, 11, 12},
				{668, "M�nh Thi�n M�n", 2, 1, 30410},
				{668, "M�nh Thi�n Cang",	2,	1,	30390},		
				{132, "T� M�u L�c Gi�i Ch�", {0,102,17,1,1,2,24,3,14,3,305}},
				{132, "Kinh B�ch Ng�c B�i", {0,102,7,1,1,2,24,3,14,3,305}},
			},
		[5] =	{
				{554, "Th�n Quy", 0, 0, 15},
				{666, "Khoa Ph�",	 0, 1, 54},
				{666, "H�a �nh", 0, 2, 37},
				{666, "L�u C�nh",	0, 3, 65},
				{555, "Vi�n ��", 0,	4,	120},
				{666, "Ng�c Tr�", 0, 5, 41},
				{555, "C�u Long To�n K�ch",	0,	6, 109},
				{679, "B�ch Th�y", 0, 7, 13},
				{555, "M�c Ki�n Li�n Tr��ng", 0, 8, 98},
				{666, "Toan D�",	 0, 9, 87},
				{535, "��i Th�nh Di �m", 	0,	10, 76},
				{679, "V� Ng�n", 0, 11, 13},
				{968, "M�nh Thi�n M�n", 2, 1, 30410},
				{968, "M�nh Thi�n Cang",	2,	1,	30390},		
				{311, "Lam B�o Th�ch Gi�i Ch�", {0,102,18,1,1,2,24,4,14,4,305}},
				{311, "��o Hoa Ng�c B�i", {0,102,8,1,1,2,24,4,14,4,305}},
			},	
		[6] =	{
				{269, "�m D��ng �n1", 0, 0, 16},
				{709, "Kh�ng C�",	 0, 1, 55},
				{555, "Nha C�u", 0, 2, 38},
				{709, "Ngh�ch L�n",	0, 3, 66},
				{468, "B�t X� Chi X�", 0,	4,	121},
				{709, "Th�n Ch�m", 0, 5, 42},
				{666, "Th��ng N�",	0,	6, 110},
				{709, "Thi�n T�n", 0, 7, 14},
				{269, "D��c S� Tr��ng", 0, 8, 99},
				{679, "Th�i H�",	 0, 9, 88},
				{357, "Kh� M�c Long Ng�m", 	0,	10, 77},
				{679, "Thanh Long", 0, 11, 14},
				{1221, "M�nh Thi�n M�n", 2, 1, 30410},
				{1221, "M�nh Thi�n Cang",	2,	1,	30390},		
				{390, "Ti�n X� H��ng Nang", {0,102,4,1,1,3,24,4,14,4,305}},
				{390, "Ng� S�c Ng�c B�i", {0,102,9,1,1,3,24,4,14,4,305}},
			},					
	}
	local tAttribute_bkl_first = {
			[1] =	{
					[1]  	= {27,	30, 	{{3,700}, {4,300}}},
					[2]  	= {28,	60, 	{{6,600}, {7,400}}},
					[3]  	= {41,	70, 	{{4,400}, {5,600}}},
					[4]  	= {42,	70, 	{{4,400}, {5,600}}},
					[5]  	= {49,	80, 	{{6,500}, {7,500}}},
					[6]  	= {50, 	10, 	{{6,800}, {7,200}}},
					[7] 	= {53,	30, 	{{6,600}, {7,400}}},
					[8]  	= {54,	30, 	{{6,600}, {7,400}}},
					[9]  	= {63,	20, 	{{5,500}, {6,500}}},
					[10] 	= {64,	20, 	{{5,500}, {6,500}}},
					[11] 	= {69,	100, 	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {85,	10, 	{{4,600}, {5,400}}},
					[13] 	= {86,	10,	{{4,600}, {5,400}}},
					[14] 	= {94,	80, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {95,	80, 	{{5,300}, {6,500}, {7,200}}},
					[16] 	= {96,	80, 	{{5,300}, {6,500}, {7,200}}},
					[17] 	= {97,	80,	{{5,300}, {6,500}, {7,200}}},
					[18] 	= {98,	80, 	{{5,300}, {6,500}, {7,200}}},
					[19] 	= {102,	30, 	{{5,400}, {6,600}}},
					[20] 	= {111,	30, 	{{5,300}, {6,300}, {7,400}}},
				},
			[5] = {
					[1]  	= {27,	30, 	{{3,700}, {4,300}}},
					[2]  	= {28,	60, 	{{6,600}, {7,400}}},
					[3]  	= {41,	70, 	{{5,400}, {6,600}}},
					[4]  	= {42,	70, 	{{5,400}, {6,600}}},
					[5]  	= {49,	80, 	{{6,500}, {7,500}}},
					[6]  	= {50, 	10, 	{{6,800}, {7,200}}},
					[7] 	= {53,	30, 	{{6,600}, {7,400}}},
					[8]  	= {54,	30, 	{{6,600}, {7,400}}},
					[9]  	= {63,	20, 	{{5,500}, {6,400}, {7,100}}},
					[10] 	= {64,	20, 	{{5,500}, {6,400}, {7,100}}},
					[11] 	= {69,	100, 	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {85,	10, 	{{4,500}, {5,500}}},
					[13] 	= {86,	10,	{{4,500}, {5,500}}},
					[14] 	= {94,	80, 	{{6,500}, {7,500}}},
					[15] 	= {95,	80, 	{{6,500}, {7,500}}},
					[16] 	= {96,	80, 	{{6,500}, {7,500}}},
					[17] 	= {97,	80,	{{6,500}, {7,500}}},
					[18] 	= {98,	80, 	{{6,500}, {7,500}}},
					[19] 	= {102,	30, 	{{5,400}, {6,600}}},
					[20] 	= {111,	30, 	{{6,300}, {7,700}}},
				},
			[6] =	{
					[1]  	= {27,	80, 	{{3,700}, {4,300}}},
					[2]  	= {28,	80, 	{{6,600}, {7,400}}},
					[3]  	= {41,	60, 	{{6,400}, {7,600}}},
					[4]  	= {42,	60, 	{{6,400}, {7,600}}},
					[5]  	= {49,	80, 	{{6,500}, {7,500}}},
					[6]  	= {50, 	10, 	{{6,800}, {7,200}}},
					[7] 	= {53,	30, 	{{6,600}, {7,400}}},
					[8]  	= {54,	30, 	{{6,600}, {7,400}}},
					[9]  	= {63,	10, 	{{5,300}, {6,600}, {7,100}}},
					[10] 	= {64,	10, 	{{5,300}, {6,600}, {7,100}}},
					[11] 	= {69,	60, 	{{6,500}, {7,500}}},
					[12] 	= {85,	10, 	{{4,300}, {5,700}}},
					[13] 	= {86,	10,	{{4,300}, {5,700}}},
					[14] 	= {94,	70, 	{{6,200}, {7,800}}},
					[15] 	= {95,	70, 	{{6,200}, {7,800}}},
					[16] 	= {96,	70, 	{{6,200}, {7,800}}},
					[17] 	= {97,	70,	{{6,200}, {7,800}}},
					[18] 	= {98,	70, 	{{6,200}, {7,800}}},
					[19] 	= {102,	60, 	{{6,200}, {7,800}}},
					[20] 	= {111,	60, 	{{6,200}, {7,800}}},
				},		
	}	
	local tItem = {
		[1] = {{0,102,17,1,1,2,24,3,14,3,305}, {0,102,7,1,1,2,24,3,14,3,305}},
		[5] = {{0,102,18,1,1,2,24,4,14,4,305}, {0,102,8,1,1,2,24,4,14,4,305}},
		[6] = {{0,102,4,1,1,3,24,4,14,4,305}, {0,102,9,1,1,3,24,4,14,4,305}},
	}
--	Msg2Player("B�n �ang m� r��ng")
--	local npc_index = GetTask(2693)
--	if npc_index == 0 or GetNpcName(npc_index) ~= "B�o r��ng B�ch Kim L�nh" then			--�ж������Ƿ����
--		return
--	end
--	SetUnitCurStates(npc_index,2,1)
--	SetUnitCurStates(npc_index,4,zgc_pub_day_turn(1))						--�������ʱ��
--	SetNpcLifeTime(npc_index,0)
	local nNumRec = gf_GetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX)
	local nNumRec_Att = nNumRec
	if nNumRec_Att <= 4 then
		nNumRec_Att = 1
	end
--	Msg2Player("Gia tri nhan "..nNumRec_Att)
	local nWeek = tonumber(date("%w"))
	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_bkl(tWeapon_bkl[nNumRec_Att], 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
--	Msg2Player("Gia tri Random: "..nRan_weapon)
	
	--if GetItemCount(2,1,30230) < tbBox_everyday[nWeek][3][nNumRec] then
	if DelItem(2,1,30230,tbBox_everyday[nWeek][3][nNumRec]) ~= 1 then
		Talk(1,"","<color=red>B�ch Kim B�o r��ng: <color>��i hi�p kh�ng c� �� Xu v�t ph�m trong ng��i !!!!")
		--gf_WriteLogEx("BKL RUONG", "X�a Xu th�nh c�ng", tbBox_everyday[nWeek][3][nNumRec], "XOA XU")	
		gf_WriteLogEx("Bach Kim Lenh Bai", "m� th�nh c�ng", 1, "6/2013 M� r��ng lo�i "..tbBox_everyday[nWeek][3][nNumRec])
		return	
	end
	gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_BOX, nNumRec + 1)
	--SetTask(TSK_BKLB_FLAG,SetByte(GetTask(TSK_BKLB_FLAG),BYTE_BKLB_BOX,nNumRec + 1))  --Set s� l�n nh�n trong ng�y th�m 1
	AddItem(2,1,30368, tbBox_everyday[nWeek][4][nNumRec])			
	AddItem(2,1,30369, tbBox_everyday[nWeek][4][nNumRec])			
	gf_WriteLogEx("MO BKL RUONG", "M� r��ng BKL th�nh c�ng", 1, "C� Linh Th�ch & Ng�c")	
	if nRan_weapon == 13 or nRan_weapon == 14 or nRan_weapon == 15 or nRan_weapon == 16 then
		if nRan_weapon == 13 then
			AddItem(2,1,30410,tbBox_everyday[nWeek][5][nNumRec])
		end
		if nRan_weapon == 14 then
			AddItem(2,1,30390,tbBox_everyday[nWeek][5][nNumRec])
		end
		if nRan_weapon == 15 then
			if nNumRec == 5 then
				AddItem(0,102,18,1,1,2,24,4,14,4,305)
			elseif nNumRec == 6 then
				AddItem(0,102,4,1,1,3,24,4,14,4,305)		
			else
				AddItem(0,102,17,1,1,2,24,3,14,3,305)			
			end
		end
		if nRan_weapon == 16 then
			if nNumRec == 5 then
				AddItem(0,102,8,1,1,2,24,4,14,4,305)
			elseif nNumRec == 6 then
				AddItem(0,102,9,1,1,3,24,4,14,4,305)		
			else
				AddItem(0,102,7,1,1,2,24,3,14,3,305)			
			end
		end
		add_flag = 1
	else
		for i=1, 3 do
			nRandomAttr =get_random_attrib_bkl(tAttribute_bkl_first[nNumRec_Att], nPerTurn)
			--Msg2Player("Test gia tri random Att: "..nRandomAttr)
			nPerTurn = nPerTurn - tAttribute_bkl_first[nNumRec_Att][nRandomAttr][2]		
		--	Msg2Player("Test gia tri 1: "..nPerTurn)
			nRandomAttrLevel = get_random_attrib_bkl(tAttribute_bkl_first[nNumRec_Att][nRandomAttr][3],1000)
			tWeaponAttr[i][1] = tAttribute_bkl_first[nNumRec_Att][nRandomAttr][3][nRandomAttrLevel][1]
			tWeaponAttr[i][2] = tAttribute_bkl_first[nNumRec_Att][nRandomAttr][1]
			tremove(tAttribute_bkl_first[nNumRec_Att], nRandomAttr)
		end	
		add_flag = AddItem(tWeapon_bkl[nNumRec_Att][nRan_weapon][3],tWeapon_bkl[nNumRec_Att][nRan_weapon][4],tWeapon_bkl[nNumRec_Att][nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	end
	
	prize_name = tWeapon_bkl[nNumRec_Att][nRan_weapon][2]
	
	if add_flag == 1 then
		Msg2Player("B�n m� B�ch Kim B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("MO BKL RUONG", "M� r��ng BKL th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("MO BKL RUONG", "M� r��ng BKL th�t b�i", 1, prize_name)
	end	

end

function get_random_bkl(tWeapon_bkl, nMaxPE, nDefault)
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tWeapon_bkl) do
		if nRand > nPos and nRand <= nPos + tWeapon_bkl[i][1] then
			return i;
		end
		nPos = nPos + tWeapon_bkl[i][1];
	end
	return nDefault;
end
function get_random_attrib_bkl(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end