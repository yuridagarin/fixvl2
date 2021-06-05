
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");

tbDieuKien = {
						[1] = {--option
									[1] = {59, "59 xu v�t ph�m"},	--tabb
									[2] = {139, "139 xu v�t ph�m"},	--cdpb
									[3] = {268, "268 xu v�t ph�m"},	--xtcv								
								},
						[2] = {--option
									[1] = {--tabb
												[1] = {250, "250 v�ng"},
												[2] = {25, "25 thi�n th�ch"},	
											},
									[2] = {--cdpb
												[1] = {77, "77 v�ng"},
												[2] = {7, "7 thi�n th�ch tinh th�ch"},
											},	
									[3] = {--xtcv
												[1] = {199, "199 xu v�t ph�m"},
												[2] = {4, "4 thi�n th�ch tinh th�ch"},
											},		
								},
					}
function main()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
--	if GetLevel() < 86 then
--		Talk(1, "", "��i hi�p ch�a �� c�p 86 �� c� th� m� ���c r��ng !!!")
--		return
--	end
--	if gf_Check55FullSkill == 0 then
--		Talk(1, "", "��i hi�p ch�a h�c �� k� n�ng c�p 55 �� c� th� m� ���c r��ng !!!")
--		return
--	end
	local npc_index = GetTargetNpc()
	local nNPC_name = GetNpcName(npc_index)
	local nLoaiBox = 0
	if nNPC_name == "Tuy�t �nh B� B�o" then
		nLoaiBox = 1
	elseif nNPC_name == "Chi�u D� Ph�p B�o" then
		nLoaiBox = 2	
	elseif nNPC_name == "X�ch Th� C� V�t" then
		nLoaiBox = 3
	end
	if nLoaiBox == 0 then
		Talk(1, "", "Lo�i r��ng n�y hi�n t�i ch�a c� !!!")
		return
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog, "S� d�ng v�t ph�m Xu �� m� r��ng/#open_QuyTy_box(1,"..nLoaiBox..")")
	tinsert(tbSayDialog, "S� d�ng v�t ph�m kh�c �� m� r��ng/#open_QuyTy_box(2,"..nLoaiBox..")")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/dialog_over"	)
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end

function open_QuyTy_box(nType, nLoaiBox)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	local npc_index = GetTargetNpc()
	local nNPC_name = GetNpcName(npc_index)
	if nType == 1 then
		if GetItemCount(2,1,30230) < tbDieuKien[nType][nLoaiBox][1] then
			Talk(1, "", "<color=green>"..nNPC_name.."<color>: ��i hi�p kh�ng �� "..tbDieuKien[nType][nLoaiBox][2].." �� m� r��ng.");
			return 0
		end
	end
	if nType == 2 then	
		if nLoaiBox == 1 or nLoaiBox == 2 then
			if GetCash() < tbDieuKien[nType][nLoaiBox][1][1]*10000 then
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: ��i hi�p kh�ng �� "..tbDieuKien[nType][nLoaiBox][1][2].."  �� m� r��ng.");
				return 0
			end	
		end
		if nLoaiBox == 2 or nLoaiBox == 3 then
			if GetItemCount(2,1,1009) < tbDieuKien[nType][nLoaiBox][2][1] then	--check thi�n th�ch tinh th�ch
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: ��i hi�p kh�ng �� "..tbDieuKien[nType][nLoaiBox][2][2].." �� m� r��ng.");
				return 0
			end
		end
		if nLoaiBox == 1 then
			if GetItemCount(2,2,8) < tbDieuKien[nType][nLoaiBox][2][1] then	--check thi�n th�ch 
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: ��i hi�p kh�ng �� "..tbDieuKien[nType][nLoaiBox][2][2].." �� m� r��ng.");
				return 0
			end
		end
		if nLoaiBox == 3 then
			if GetItemCount(2,1,30230) < tbDieuKien[nType][nLoaiBox][1][1] then	--check xu v�t ph�m
				Talk(1, "", "<color=green>"..nNPC_name.."<color>: ��i hi�p kh�ng �� "..tbDieuKien[nType][nLoaiBox][1][2].." �� m� r��ng.");
				return 0
			end
		end
	end
 	if gf_Judge_Room_Weight(5,500) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
-------------------------------------
	local box_index = GetTargetNpc()
--	Msg2Player("Gia tri box_index: "..box_index)
--	SetTask(2693,box_index)  --sau khi xong, ��i th�nh 2693 ##################################################

	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 5 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		 gf_WriteLogEx("GIAP NGO BAO RUONG", "m� r��ng th�nh c�ng", 1, "M� r��ng option "..nType.." ,lo�i "..nNPC_name)		
		if nLoaiBox == 1 then
			DoWait(28,29,1)	
		elseif nLoaiBox ==2 then
			DoWait(30,29,1)	
		elseif nLoaiBox == 3 then
			DoWait(31,29,1)	
		end
		if nType == 1 then
			DelItem(2,1,30230, tbDieuKien[nType][nLoaiBox][1])
		elseif nType == 2 then
			if nLoaiBox == 1 then
				Pay(tbDieuKien[nType][nLoaiBox][1][1]*10000)
				DelItem(2,2,8, tbDieuKien[nType][nLoaiBox][2][1])
			elseif nLoaiBox == 2 then
				Pay(tbDieuKien[nType][nLoaiBox][1][1]*10000)
				DelItem(2,1,1009, tbDieuKien[nType][nLoaiBox][2][1])
			elseif nLoaiBox == 3 then
				DelItem(2,1,30230, tbDieuKien[nType][nLoaiBox][1][1])
				DelItem(2,1,1009, tbDieuKien[nType][nLoaiBox][2][1])
			end
		end
		if nLoaiBox == 1 then
			local nCount1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 4,1)
			if nCount1< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_1, nCount1 + 1, 4,1)
				Msg2Player("M� r��ng "..nNPC_name.." th�nh c�ng, l�n th� :"..nCount1 + 1)
			end
		elseif nLoaiBox == 2 then
			local nCount2 = VNG_GetTaskPos(TSK_GIAPNGO_1, 9,6)
			if nCount2< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_1, nCount2 + 1, 9,6)
				Msg2Player("M� r��ng "..nNPC_name.." th�nh c�ng, l�n th� :"..nCount2 + 1)
			end
		elseif nLoaiBox == 3 then
			local nCount3 = VNG_GetTaskPos(TSK_GIAPNGO_2, 4,1)
			if nCount3< 1000 then
				VNG_SetTaskPos(TSK_GIAPNGO_2, nCount3 + 1, 4,1)
				Msg2Player("M� r��ng "..nNPC_name.." th�nh c�ng, l�n th� :"..nCount3 + 1)
			end
		end
	else
		Talk(1,"","Hi�n �� c� ng��i s� d�ng <color=red> B�o r��ng<color>.")
		return
	end
	
end

function tuyetanh_box_award()
	Msg2Player("Ph�n th��ng Tuy�t �nh")
	local tAward_QuyTy = {
				{1, 6000, "Qu�n C�ng Ch��ng", {2,1,9999, 4},7 * 24 * 3600},
				{1, 2000, "Qu�n C�ng ��i", {2,1,9998, 2},7 * 24 * 3600},
				{1, 1000, "Qu�n C�ng Huy Ho�ng", {2,1,9977, 1},7 * 24 * 3600},
				{2, 9500, 9999999},
				{2, 9500, 14000000},
				{2, 9500, 21000000},
				{31, 9500, "give_fruit1()"},
				{31, 9500, "give_fruit2()"},
				{31, 9500, "give_fruit3()"},
				{31, 9500, "give_fruit4()"},
				{31, 8499, "give_weapon7()"},
				{31, 800, "Book_Pet1(2)"},	
				{31, 8000, "Book_Pet2(1)"},
				{31, 1, "give_HHVD4()"},
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","m� r��ng th�nh c�ng")	
	--print("\n=====quyty_box_award==========\n")
end

function chieuda_box_award()
	Msg2Player("Ph�n th��ng Chi�u D�")
	local tAward_QuyTy = {
				{1, 5000, "Qu�n C�ng Huy Ho�ng", {2,1,9977, 1},7 * 24 * 3600},
				{2, 10000, 13000000},
				{2, 16798, 21000000},
				{2, 10000, 47000000},	
				{1, 100, "Thi�n Th�ch Linh Th�ch", {2,1,1068, 1},7 * 24 * 3600},
				{1, 100, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067, 1},7 * 24 * 3600},
				{31, 15000, "give_weapon7()"},
				{31, 5000, "give_weapon8()"},
				{31, 10000, "TrangBiKimXa3Sao(3)"},	
				{31, 8000, "Book_Pet1(2)"},
				{31, 12000, "Book_Pet2(1)"},			
				{31, 8000, "Book_Pet3(1)"},	
				{31, 1, "give_HHVD4()"},
				{31, 1, "give_HHVD5()"},
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","m� r��ng th�nh c�ng")	
	--print("\n=====quyty_box_award==========\n")
end

function xichtho_box_award()
	Msg2Player("Ph�n th��ng X�ch Th�")
	local tAward_QuyTy = {
				{1, 5000, "Qu�n C�ng Huy Ho�ng", {2,1,9977, 2},7 * 24 * 3600},
				{2, 4428, 74000000},
				{2, 12000, 123000000},
				{2, 10000, 147000000},	
				{1, 100, "Thi�n Th�ch Linh Th�ch", {2,1,1068, 1},7 * 24 * 3600},
				{1, 100, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067, 1},7 * 24 * 3600},
				{1, 100, "��i ��nh H�n", {2,1,1113, 1},7 * 24 * 3600},
				{1, 100, "Chuy�n Sinh ��n", {2,1,30345, 1},7 * 24 * 3600},
				{31, 15000, "give_weapon7()"},
				{31, 10000, "give_weapon8()"},
				{31, 5000, "give_weapon9()"},
				{31, 10000, "TrangBiKimXa3Sao(3)"},	
				{31, 10000, "Book_Pet2(3)"},	
				{31, 10000, "Book_Pet3(2)"},			
				{31, 8000, "Book_Pet4(1)"},		
				{31, 1, "give_HHVD4()"},
				{31, 1, "give_HHVD5()"},
				{31, 170, "MatTichMonPhai20_Random()"},	
			}		
	gf_EventGiveRandAward(tAward_QuyTy, 100000,1,"GIAP NGO BAO RUONG","m� r��ng th�nh c�ng")	
	--print("\n=====quyty_box_award==========\n")
end

function give_weapon7()
tAttribute_quyty_first = {	--tAttribute_bkl_first
					[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},							
			}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "V�n Nh�n", 0, 0, 14},
				{600, "M�n Thi�n Hoa V�",	 0, 1, 53},
				{1000, "H�a Tinh", 0, 2, 36},
				{600, "C� ��nh",	0, 3, 64},
				{600, "Th�n Cung", 0,	4,	119},
				{600, "Li�t Di�m", 0, 5, 40},
				{600, "��i H�o L�i Th��ng",	0,	6, 108},
				{600, "L�ng Phong", 0, 7, 12},
				{600, "A La H�n Tr��ng", 0, 8, 97},
				{600, "Th�n H�nh",	 0, 9, 86},
				{600, "Hi Nh�n C�m", 	0,	10, 75},
				{600, "M�nh H�", 0, 11, 12},
				{1200, "Minh B�ng", 0, 12, 12},
				{1200, "Ng�c Doanh", 0, 13, 12},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		--print("gia tri random "..nRandomAttr)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]	
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B�n m� B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
	end	
end
function give_weapon8()
tAttribute_quyty_first = {	--tAttribute_bkl_first
				[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},				
		}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "Th�n Quy", 0, 0, 15},
				{600, "Khoa Ph�",	 0, 1, 54},
				{1000, "H�a �nh", 0, 2, 37},
				{600, "L�u C�nh",	0, 3, 65},
				{600, "Vi�n ��", 0,	4,	120},
				{600, "Ng�c Tr�", 0, 5, 41},
				{600, "C�u Long To�n K�ch",	0,	6, 109},
				{600, "B�ch Th�y", 0, 7, 13},
				{600, "M�c Ki�n Li�n Tr��ng", 0, 8, 98},
				{600, "Toan D�",	 0, 9, 87},
				{600, "��i Th�nh Di �m", 	0,	10, 76},
				{600, "V� Ng�n", 0, 11, 13},
				{1200, "X�ch Ti�u", 0, 12, 13},
				{1200, "Di T�m", 0, 13, 13},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B�n m� B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
	end	
end
function give_weapon9()
	 tAttribute_quyty_first = {	--tAttribute_bkl_first
					[1]  	= {41,	60, 	{{5,600}, {6,400}}},
					[2]  	= {42,	60, 	{{5,600}, {6,400}}},
					[3]  	= {49,	60, 	{{6,500}, {7,500}}},		
					[4]  	= {53,	35, 	{{6,600}, {7,400}}},
					[5] 	= {54,	35, 	{{6,600}, {7,400}}},
					[6] 	= {63,	35, 	{{5,500}, {6,450}, {7,50}}},
					[7] 	= {64,	40, 	{{5,500}, {6,450}, {7,50}}},
					[8] 	= {85,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[9] 	= {86,	5,	 	{{5,700}, {6,250}, {7,50}}},
					[10] 	= {94,	75, 	{{5,300}, {6,500}, {7,200}}},
					[11] 	= {95,	75,	{{5,300}, {6,500}, {7,200}}},
					[12] 	= {96,	75, 	{{5,300}, {6,500}, {7,200}}},
					[13] 	= {97,	75, 	{{5,300}, {6,500}, {7,200}}},
					[14] 	= {98,	75, 	{{5,300}, {6,500}, {7,200}}},
					[15] 	= {102,	40, 	{{5,400}, {6,500}, {7,100}}},
					[16] 	= {111,	70, 	{{5,300}, {6,300}, {7,400}}},
					[17] 	= {252,	5,		{{3,800}, {4,150}, {5,50}}},
					[18]  	= {268,	5, 		{{4,800}, {5,150}, {6,50}}},		
					[19]  	= {277,	35,	{{3,400}, {4,400}, {5,200}}},		
					[20]  	= {278,	35,	{{3,400}, {4,400}, {5,200}}},
					[21]  	= {285,	15,	{{4,700}, {5,150}, {6,150}}},
					[22]  	= {304,	30, 	{{4,800}, {5,150}, {6,50}}},
					[23]  	= {308,	50, 	{{5,600}, {6,300}, {7,100}}},
					[24] 	= {390,	5,	 	{{3,750}, {4,200}, {5,50}}},				
		}	
	local tWeapon_quyty = { --tWeapon_bkl
				{600, "�m D��ng �n", 0, 0, 16},
				{600, "Kh�ng C�",	 0, 1, 55},
				{1000, "Nha C�u", 0, 2, 38},
				{600, "Ngh�ch L�n",	0, 3, 66},
				{600, "B�t X� Chi X�", 0,	4,	121},
				{600, "Th�n Ch�m", 0, 5, 42},
				{600, "Th��ng N�",	0,	6, 110},
				{600, "Thi�n T�n", 0, 7, 14},
				{600, "D��c S� Tr��ng", 0, 8, 99},
				{600, "Th�i H�",	 0, 9, 88},
				{600, "Kh� M�c Long Ng�m", 	0,	10, 77},
				{600, "Thanh Long", 0, 11, 14},
				{600, "U�n H��ng", 0, 12, 14},
				{600, "Hoan Linh", 0, 13, 14},
		}

	local add_flag = 0
	local prize_name = ""
	local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}
	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
		nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
		tremove(tAttribute_quyty_first, nRandomAttr)
	end	
	add_flag = AddItem(tWeapon_quyty[nRan_weapon][3],tWeapon_quyty[nRan_weapon][4],tWeapon_quyty[nRan_weapon][5],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon_quyty[nRan_weapon][2]
	if add_flag == 1 then
		Msg2Player("B�n m� B�o r��ng, nh�n ���c: "..prize_name.."!")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
	else
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
	end	
end
function get_random_quyty(tWeapon_quyty, nMaxPE, nDefault) --get_random_bkl
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tWeapon_quyty) do
		if nRand > nPos and nRand <= nPos + tWeapon_quyty[i][1] then
			return i;
		end
		nPos = nPos + tWeapon_quyty[i][1];
	end
	return nDefault;
end
function get_random_attrib_quyty(nTabQuyTy, nDeterminator) --get_random_attrib_bkl
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTabQuyTy) do
		nBase = nBase + nTabQuyTy[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
	--them gia tri default o day
	--return 1
end
-- M�t t�ch cao c�p 
VET_2012_GAOJIMIJI = {
				[2] = {"Kim Cang B�t Nh� Ch�n Quy�n ", {0, 107, 204, 1}},		
				[4] = {"Ti�m Long T�c Di�t Ch�n Quy�n", {0, 107, 205, 1}},
				[3] = {"V� Tr�n B� �� Ch�n Quy�n", {0, 107, 206, 1}},		
				[6] = {"Thi�n La Li�n Ch�u Ch�n Quy�n", {0, 107, 207,1 }},		
				[8] = {"Nh� � Kim ��nh Ch�n Quy�n", {0, 107, 208, 1}},		
				[9] = {"B�ch H�i Tuy�t �m Ch�n Quy�n", {0, 107, 209, 1}},		
				[11] = {"H�n ��n Tr�n Nh�c Ch�n Quy�n", {0, 107, 210, 1}},		
				[12] = {"Qu� Thi�n Du Long Ch�n Quy�n", {0, 107, 211, 1}},		
				[14] = {"Huy�n �nh M� T�ng Ch�n Quy�n", {0, 107, 212, 1}},		
				[15] = {"Qu�n T� ��i Phong Ch�n Quy�n", {0, 107, 213, 1}},		
				[17] = {"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n", {0, 107, 214, 1}},		
				[18] = {"Xuy�n V�n L�c H�ng Ch�n Quy�n", {0, 107, 215, 1}},		
				[20] = {"Huy�n Minh Phong Ma Ch�n Quy�n", {0, 107, 216, 1}},		
				[21] = {"Linh C� Huy�n T� Ch�n Quy�n", {0, 107, 217, 1}},		
				[23] = {"C�u Thi�n Phong L�i Ch�n Quy�n", {0, 107, 218, 1}},		
				[29] = {"H�ng Tr�n T�y M�ng Ch�n Quy�n", {0, 107, 222, 1}},		
				[30] = {"Phong Hoa Thi�n Di�p Ch�n Quy�n", {0, 107, 223, 1}},						
}

function give70GaojiMiji()
	local nRoute = GetPlayerRoute()
	gf_AddItemEx2(VET_2012_GAOJIMIJI[nRoute][2], VET_2012_GAOJIMIJI[nRoute][1], "GIAP NGO BAO RUONG BK", "nh�n ���c")	
	--gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
VET_2013_FRUIT = {
		[1] = {1, 5, "Nh�n", {2, 1, 30164, 1}, 0},
		[2] = {1, 5, "Ch�m Ch�m", {2, 1, 30165, 1}, 0},
		[3] = {1, 5, "Cam", {2, 1, 30165, 1}, 0},
		[4] = {1, 5, "D�a", {2, 1, 30167, 1}, 0},
		[5] = {1, 5, "M�ng C�t", {2, 1, 30168, 1}, 0},
		[6] = {1, 5, "M�ng c�u", {2, 1, 30179, 1}, 0},
		[7] = {1, 5, "Kh�m", {2, 1, 30180, 1}, 0},
		[8] = {1, 5, "L�", {2, 1, 30181, 1}, 0},
		[9] = {1, 5, "B�n Bon", {2, 1, 30182, 1}, 0},
		[10] = {1, 5, "Kh�", {2, 1, 30183, 1}, 0},
		[11] = {1, 5, "B��i", {2, 1, 30169, 1}, 0},
		[12] = {1, 5, "D�u", {2, 1, 30170, 1}, 0},
		[13] = {1, 5, "Chu�i", {2, 1, 30171, 1}, 0},
		[14] = {1, 5, "Xo�i", {2, 1, 30172, 1}, 0},
		[15] = {1, 5, "��o", {2, 1, 30173, 1}, 0},
		[16] = {1, 5, "M�n", {2, 1, 30174, 1}, 0},
		[17] = {1, 5, "V�i", {2, 1, 30175, 1}, 0},
		[18] = {1, 5, "T�o", {2, 1, 30176, 1}, 0},
		[19] = {1, 5, "B�", {2, 1, 30177, 1}, 0},
		[20] = {1, 5, "�u ��", {2, 1, 30178, 1}, 0},
		}
function give_fruit1()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[6][4][1]
	local nD = VET_2013_FRUIT[6][4][2]
	local nP = VET_2013_FRUIT[6][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[6][3], "GIAP NGO BAO RUONG BK", "tr�i c�y")
	Msg2Player("B�n nh�n ���c 77 M�ng C�u")
end
function give_fruit2()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[4][4][1]
	local nD = VET_2013_FRUIT[4][4][2]
	local nP = VET_2013_FRUIT[4][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[4][3], "GIAP NGO BAO RUONG BK", "tr�i c�y")
	Msg2Player("B�n nh�n ���c 77 D�a")
end
function give_fruit3()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[20][4][1]
	local nD = VET_2013_FRUIT[20][4][2]
	local nP = VET_2013_FRUIT[20][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[20][3], "GIAP NGO BAO RUONG BK", "tr�i c�y")
	Msg2Player("B�n nh�n ���c 77 �u ��")
end
function give_fruit4()
--	local nIndex = random(1,20)
	local nG = VET_2013_FRUIT[14][4][1]
	local nD = VET_2013_FRUIT[14][4][2]
	local nP = VET_2013_FRUIT[14][4][3]
	gf_AddItemEx2({nG, nD, nP, 77}, VET_2013_FRUIT[14][3], "GIAP NGO BAO RUONG BK", "tr�i c�y")
	Msg2Player("B�n nh�n ���c 77 Xo�i")
end
function give_HHVD2()
	gf_AddItemEx2({0,102,8840, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Ho�ng Chi Th�y", "GIAP NGO BAO RUONG BK", "Huy Ho�ng Chi Th�y")
	gf_AddItemEx2({0,102,8841, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh D� Chi Th�y", "GIAP NGO BAO RUONG BK", "Vinh D� Chi Th�y")
end
function give_HHVD3()
	gf_AddItemEx2({0,102,8842, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Ho�ng Chi K�", "GIAP NGO BAO RUONG BK", "Huy Ho�ng Chi K�")
	gf_AddItemEx2({0,102,8843, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh D� Chi K�", "GIAP NGO BAO RUONG BK", "Vinh D� Chi K�")
end
function give_HHVD4()
	gf_AddItemEx2({0,102,8844, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Ho�ng Qu�t Kh�i", "GIAP NGO BAO RUONG BK", "Huy Ho�ng Qu�t Kh�i")
	gf_AddItemEx2({0,102,8845, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh D� Qu�t Kh�i", "GIAP NGO BAO RUONG BK", "Vinh D� Qu�t Kh�i")
	Msg2Player("B�n nh�n ���c v�t ph�m Huy Ho�ng Vinh D� Qu�t Kh�i")
end
function give_HHVD5()
	gf_AddItemEx2({0,102,8846, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Huy Ho�ng", "GIAP NGO BAO RUONG BK", "Huy Ho�ng")
	gf_AddItemEx2({0,102,8847, 1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Vinh D�", "GIAP NGO BAO RUONG BK", "Vinh D�")
	Msg2Player("B�n nh�n ���c v�t ph�m Huy Ho�ng Vinh D�")
end

function giapngo()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Nh�n th��ng xong 3 lo�i (Tuy�t �nh B� B�o, Chi�u D� Ph�p B�o, X�ch Th� C� V�t) s� ���c nh�n ph�n th��ng h�p d�n M� ��o Th�nh C�ng"

	tinsert(tSay, "Nh�n th��ng Tuy�t �nh B� B�o (k�ch ho�t r��ng Tuy�t �nh th�nh c�ng 1000 l�n)/#get_MaDaoThanhCong(1)")
	tinsert(tSay, "Nh�n th��ng Chi�u D� Ph�p B�o (k�ch ho�t r��ng Chi�u D� th�nh c�ng 1000 l�n)/#get_MaDaoThanhCong(2)")
	tinsert(tSay, "Nh�n th��ng X�ch Th� C� V�t (k�ch ho�t r��ng X�ch Th� th�nh c�ng 1000 l�n)/#get_MaDaoThanhCong(3)")
	tinsert(tSay, "Nh�n th��ng M� ��o Th�nh C�ng (�� nh�n th��ng th�nh c�ng 3 lo�i r��ng)/#get_MaDaoThanhCong(4)")
	tinsert(tSay, "Ta ch�a mu�n nh�n th��ng/dialog_over")
	Say(tHeader, getn(tSay), tSay)	
end

function get_MaDaoThanhCong(nType)
 	if gf_Judge_Room_Weight(5,500) ~= 1 then
 		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
 		return 0
 	end	
	local nCheck = 0
	local nCount = 0
	if nType == 1 then
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_1, 5,5)
		nCount = VNG_GetTaskPos(TSK_GIAPNGO_1, 4,1)
	elseif nType == 2 then
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_1, 10,10)
		nCount = VNG_GetTaskPos(TSK_GIAPNGO_1, 9,6)
	elseif nType == 3 then
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 5,5)
		nCount = VNG_GetTaskPos(TSK_GIAPNGO_2, 4,1)
	elseif nType == 4 then	--check �k lo�i 4
		nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 6,6)
		local nCheck1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 5,5)
		local nCheck2 = VNG_GetTaskPos(TSK_GIAPNGO_1, 10,10)
		local nCheck3 = VNG_GetTaskPos(TSK_GIAPNGO_2, 5,5)
		if nCheck >= 1 then
			Talk(1,"", "��i hi�p �� nh�n ph�n th��ng n�y r�i. Ph�n th��ng ch� nh�n ���c 1 l�n duy nh�t !!!!")
			return 0
		end 
		if nCheck1 < 1 or nCheck2 < 1 or nCheck3 < 1 then
			Talk(1,"", "��i hi�p ch�a nh�n th��ng h�t 3 lo�i B�o R��ng � tr�n !!!!")
			return 0
		end
	end
	--check �k lo�i 1, 2, 3
	if nType == 1 or nType == 2 or nType == 3 then
		if nCheck >= 1 then
			Talk(1,"", "��i hi�p �� nh�n ph�n th��ng n�y r�i. Ph�n th��ng ch� nh�n ���c 1 l�n duy nh�t !!!!")
			return 0
		end
		if nCount < 1000 then
			Talk(1,"", "��i hi�p ch�a k�ch ho�t �� 1000 B�o R��ng !!!!")
			return 0
		end
	end
	--ph�t th��ng
	if nType == 1 then
		VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 5,5)
		ModifyExp(1000000000)
		give_weapon7()
		Msg2Player("Ph�t th��ng Tuy�t �nh B� B�o th�nh c�ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i Tuy�t �nh B� B�o")
	elseif nType == 2 then
		VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 10,10)
		ModifyExp(2000000000)
		MatTichMonPhai20_Random()
		Msg2Player("Ph�t th��ng Chi�u D� Ph�p B�o th�nh c�ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i Chi�u D� Ph�p B�o")
	elseif nType == 3 then
		VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 5,5)
		ModifyExp(2000000000)
		give_weapon8()
		Msg2Player("Ph�t th��ng X�ch Th� C� V�t th�nh c�ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i X�ch Th� C� V�t")
	elseif nType == 4 then
		VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 6,6)
		ModifyExp(2000000000)
		give_HHVD5()
		MatTichMonPhai20_HePhai()
		Msg2Player("Ph�t th��ng M� ��o Th�nh C�ng th�nh c�ng")
		gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i M� ��o Th�nh C�ng")
	end
end
VET_BOOK_PET1 = {
	{1, 699, "Ch�n kh� h� th� C�p 1", {2,150,1,1}, 0},
	{1, 699, "�ch Th� Di�n D��ng C�p 1", {2,150,5,1}, 0},
	{1, 699, "C��ng Th�n B� Th� C�p 1", {2,150,9,1}, 0},
	{1, 699, "�m Phong Th�c C�t C�p 1", {2,150,13,1}, 0},
	{1, 456, "Huy�n V� V� Song C�p 1", {2,150,17,1}, 0},
	{1, 699, "V� H�nh V� T��ng C�p 1", {2,150,21,1}, 0},
	{1, 699, "Kim Linh Ph� Th� C�p 1", {2,150,25,1}, 0},
	{1, 699, "M�c Linh Ph� Th� C�p 1", {2,150,29,1}, 0},
	{1, 699, "Th�y Linh Ph� Th� C�p 1", {2,150,33,1}, 0},
	{1, 699, "H�a Linh Ph� Th� C�p 1", {2,150,37,1}, 0},
	{1, 699, "Th� Linh Ph� Th� C�p 1", {2,150,41,1}, 0},
	{1, 699, "Ph� Kh�ng Tr�m �nh C�p 1", {2,150,45,1}, 0},
	{1, 699, "S�t th��ng gia n�ng C�p 1", {2,150,49,1}, 0},
	{1, 456, "Khinh Linh T�n T�t C�p 1", {2,150,53,1}, 0},
	{1, 700, "V� H�nh Chi C� C�p 1", {2,150,57,1}, 0},
}

VET_BOOK_PET2 = {
	{1, 699, "Ch�n kh� h� th� C�p 2", {2,150,2,1}, 0},
	{1, 699, "�ch Th� Di�n D��ng C�p 2", {2,150,6,1}, 0},
	{1, 699, "C��ng Th�n B� Th� C�p 2", {2,150,10,1}, 0},
	{1, 699, "�m Phong Th�c C�t C�p 2", {2,150,14,1}, 0},
	{1, 456, "Huy�n V� V� Song C�p 2", {2,150,18,1}, 0},
	{1, 699, "V� H�nh V� T��ng C�p 2", {2,150,22,1}, 0},
	{1, 699, "Kim Linh Ph� Th� C�p 2", {2,150,26,1}, 0},
	{1, 699, "M�c Linh Ph� Th� C�p 2", {2,150,30,1}, 0},
	{1, 699, "Th�y Linh Ph� Th� C�p 2", {2,150,34,1}, 0},
	{1, 699, "H�a Linh Ph� Th� C�p 2", {2,150,38,1}, 0},
	{1, 699, "Th� Linh Ph� Th� C�p 2", {2,150,42,1}, 0},
	{1, 699, "Ph� Kh�ng Tr�m �nh C�p 2", {2,150,46,1}, 0},
	{1, 699, "S�t th��ng gia n�ng C�p 2", {2,150,50,1}, 0},
	{1, 456, "Khinh Linh T�n T�t C�p 2", {2,150,54,1}, 0},
	{1, 700, "V� H�nh Chi C� C�p 2", {2,150,58,1}, 0},
}

VET_BOOK_PET3 = {
	{1, 718, "Ch�n kh� h� th� C�p 3", {2,150,3,1}, 0},
	{1, 718, "�ch Th� Di�n D��ng C�p 3", {2,150,7,1}, 0},
	{1, 718, "C��ng Th�n B� Th� C�p 3", {2,150,11,1}, 0},
	{1, 718, "�m Phong Th�c C�t C�p 3", {2,150,15,1}, 0},
	{1, 333, "Huy�n V� V� Song C�p 3", {2,150,19,1}, 0},
	{1, 718, "V� H�nh V� T��ng C�p 3", {2,150,23,1}, 0},
	{1, 718, "Kim Linh Ph� Th� C�p 3", {2,150,27,1}, 0},
	{1, 718, "M�c Linh Ph� Th� C�p 3", {2,150,31,1}, 0},
	{1, 718, "Th�y Linh Ph� Th� C�p 3", {2,150,35,1}, 0},
	{1, 718, "H�a Linh Ph� Th� C�p 3", {2,150,39,1}, 0},
	{1, 718, "Th� Linh Ph� Th� C�p 3", {2,150,43,1}, 0},
	{1, 718, "Ph� Kh�ng Tr�m �nh C�p 3", {2,150,47,1}, 0},
	{1, 718, "S�t th��ng gia n�ng C�p 3", {2,150,51,1}, 0},
	{1, 333, "Khinh Linh T�n T�t C�p 3", {2,150,55,1}, 0},
	{1, 718, "V� H�nh Chi C� C�p 3", {2,150,59,1}, 0},
}
VET_BOOK_PET4 = {
	{1, 718, "Ch�n kh� h� th� C�p 4",{2,150,4,1}, 0},
	{1, 718, "�ch Th� Di�n D��ng C�p 4",{2,150,8,1}, 0},
	{1, 718, "C��ng Th�n B� Th� C�p 4",{2,150,12,1}, 0},
	{1, 718, "�m Phong Th�c C�t C�p 4",{2,150,16,1}, 0},
	{1, 333, "Huy�n V� V� Song C�p 4",{2,150,20,1}, 0},
	{1, 718, "V� H�nh V� T��ng C�p 4",{2,150,24,1}, 0},
	{1, 718, "Kim Linh Ph� Th� C�p 4",{2,150,28,1}, 0},
	{1, 718, "M�c Linh Ph� Th� C�p 4",{2,150,32,1}, 0},
	{1, 718, "Thu� Linh Ph� Th� C�p 4",{2,150,36,1}, 0},
	{1, 718, "Ho� Linh Ph� Th� C�p 4",{2,150,40,1}, 0},
	{1, 718, "Th� Linh Ph� Th� C�p 4",{2,150,44,1}, 0},
	{1, 718, "Ph� Kh�ng Tr�m �nh C�p 4",{2,150,48,1}, 0},
	{1, 718, "S�t th��ng gia n�ng c�p 4",{2,150,52,1}, 0},
	{1, 333, "Khinh Linh T�n T�t  C�p 4",{2,150,56,1}, 0},
	{1, 718, "V� H�nh Chi C� C�p 4",{2,150,60,1}, 0},
}
function Book_Pet1(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "GIAP NGO BAO RUONG BK","S�ch PET 1")
		Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 1")
	end
end

function Book_Pet2(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET2,10000,"", "GIAP NGO BAO RUONG BK","S�ch PET 2")
		Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 2")
	end
end

function Book_Pet3(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET3,10000,"", "GIAP NGO BAO RUONG BK","S�ch PET 3")
		Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 3")
	end
end

function Book_Pet4(nNum)
	for i = 1, nNum do
		gf_EventGiveRandAward(VET_BOOK_PET4,10000,"", "GIAP NGO BAO RUONG BK","S�ch PET 4")
		Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 4")
	end
end

tbKimXa3sao = {
	[1] = {item={{gdp={0,152,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng H�a V�n"}}},
	[2] = {item={{gdp={0,152,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Kim Ch� ng� h�nh"}}},
	[3] = {item={{gdp={0,152,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng M�c Ch� ng� h�nh"}}},
	[4] = {item={{gdp={0,152,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Th�y Ch� ng� h�nh"}}},
	[5] = {item={{gdp={0,152,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng H�a Ch� ng� h�nh"}}},
	[6] = {item={{gdp={0,152,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Th� Ch� ng� h�nh"}}},
	[7] = {item={{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng �m Ch� ng� h�nh"}}},
	[8] = {item={{gdp={0,153,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Ng�c Ch�"}}},
	[9] = {item={{gdp={0,153,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Kim Ch� ng� h�nh"}}},
	[10] = {item={{gdp={0,153,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng M�c Ch� ng� h�nh"}}},
	[11] = {item={{gdp={0,153,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Th�y Ch� ng� h�nh"}}},
	[12] = {item={{gdp={0,153,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng H�a Ch� ng� h�nh"}}},
	[13] = {item={{gdp={0,153,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Th� Ch� ng� h�nh"}}},
	[14] = {item={{gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng �m Ch� ng� h�nh"}}},
	[15] = {item={{gdp={0,154,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="B� Ch� Cao ��ng Ngoa"}}},
	[16] = {item={{gdp={0,154,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Kim Ch� ng� h�nh"}}},
	[17] = {item={{gdp={0,154,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i M�c Ch� ng� h�nh"}}},
	[18] = {item={{gdp={0,154,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Th�y Ch� ng� h�nh"}}},
	[19] = {item={{gdp={0,154,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i H�a Ch� ng� h�nh"}}},
	[20] = {item={{gdp={0,154,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Th� Ch� ng� h�nh"}}},
	[21] = {item={{gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i �m Ch� ng� h�nh"}}},
}

tbAwardRate = {
	[1] = {[1] = 	tbKimXa3sao[1], nRate = 7},
	[2] = {[1] = 	tbKimXa3sao[2], nRate = 5},
	[3] = {[1] = 	tbKimXa3sao[3], nRate = 5},
	[4] = {[1] = 	tbKimXa3sao[4], nRate = 5},
	[5] = {[1] = 	tbKimXa3sao[5], nRate = 5},
	[6] = {[1] = 	tbKimXa3sao[6], nRate = 5},
	[7] = {[1] = 	tbKimXa3sao[7], nRate = 1},
	[8] = {[1] = 	tbKimXa3sao[8], nRate = 7},
	[9] = {[1] = 	tbKimXa3sao[9], nRate = 5},
	[10] = {[1] = 	tbKimXa3sao[10], nRate = 5},
	[11] = {[1] = 	tbKimXa3sao[11], nRate = 5},
	[12] = {[1] = 	tbKimXa3sao[12], nRate = 5},
	[13] = {[1] = 	tbKimXa3sao[13], nRate = 5},
	[14] = {[1] = 	tbKimXa3sao[14], nRate = 1.5},
	[15] = {[1] = 	tbKimXa3sao[15], nRate = 7},
	[16] = {[1] = 	tbKimXa3sao[16], nRate = 5},
	[17] = {[1] = 	tbKimXa3sao[17], nRate = 5},
	[18] = {[1] = 	tbKimXa3sao[18], nRate = 5},
	[19] = {[1] = 	tbKimXa3sao[19], nRate = 5},
	[20] = {[1] = 	tbKimXa3sao[20], nRate = 5},
	[21] = {[1] = 	tbKimXa3sao[21], nRate = 1.5},
}

function TrangBiKimXa3Sao(nQty)
	for i=1,nQty do
		LIB_Award:AwardByRate(tbAwardRate)
		Msg2Player("B�n nh�n ���c trang b� Kim X� !!!!")
	end
	gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "trang b� Kim X�")
end
tbMatTich_GN = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
function MatTichMonPhai20_HePhai()
	local nRoute = GetPlayerRoute()
	local _, nItemID = AddItem(tbMatTich_GN[nRoute][1], tbMatTich_GN[nRoute][2], tbMatTich_GN[nRoute][3], 1)
	if tbMatTich_GN[nRoute][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "M�t t�ch si�u c�p")
	Msg2Player("B�n nh�n ���c 1 m�t t�ch si�u c�p")
end
tbMatTich_random_GN = {
		[0] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[1] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[2] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[3] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[4] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[5] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[6] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[7] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[8] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[9] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[10] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[11] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[12] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[13] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[14] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[15] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[16] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
function MatTichMonPhai20_Random()
	local nAwardRand = mod(random(1,1000),17)
	local _, nItemID = AddItem(tbMatTich_random_GN[nAwardRand][1], tbMatTich_random_GN[nAwardRand][2], tbMatTich_random_GN[nAwardRand][3], 1)
	if tbMatTich_random_GN[nAwardRand][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "M�t t�ch si�u c�p")
	Msg2Player("B�n nh�n ���c 1 m�t t�ch si�u c�p")
end
function dialog_over()

end