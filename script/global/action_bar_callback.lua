--�ļ������������ص�������
--��    �ܣ�������������ɹ���ʧ�ܵ��õĺ���
--���򿪷��ˣ�˧��
--�ű������ύ�ˣ��峤
--����ʱ�䣺20070126
--��	ע��	���ã�DoWait(n1,n2,n3) n1: �ɹ�����õĺ��������� n1: ʧ�ܺ���õĺ��������� n3: �������ȴ�ʱ��
--		�ص���main(deal_suc,deal_fail,deal_flag)����һ�������ǳɹ����ñ�־���ڶ���������ʧ�ܵ��ñ�־���������Ǵ���ɹ����ı�־�����е��õ�һ���������������ظ���
--		�磺10���ӵĿ���ʱ�䡣DoWait(1,2,10)���ͻ��˳���10��Ľ��������ɹ���main(1,2,1)����ʧ�ܣ�main(1,2,0)�������ûص�������ֻ�ǳɹ�����main������deal_flag����Ϊ1��ʧ��Ϊ0
--		������������ѯ�峤��˧�硣
--�Թ󴺹����ļ�
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\gongcheng\\prison\\prison_head.lua")
Include("\\script\\task\\npc\\��������.lua")
Include("\\script\\lib\\writelog.lua");
--2010��1�´��ڻ
Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

--============================��������������===============================
g_szThisFile = "\\script\\global\\action_bar_callback.lua"

---------��ṥ��ս֮��Դ�������
	--1����¼�Ƿ�ռ��
	box_belong_ID = 2					--��ֵ��ʼ��Ϊ1
	--2��������
	box_open_week_ID = 4				--��ֵ��ʼ��Ϊ0
	--��ʼ�򿪵�ʱ��
	box_open_time_ID = 5				--��ʼ��Ϊ0
	--NPC������¼ID
	TasktempID_npc_index = 166
	--�ǽ���Ӧ�ĳ���
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
--�������ؿ����Ĺ�ID
	grass_index_TasktempID = 188		--��Ųݵ�����
	grass_id_state = 0					--��Ÿò�Ŀǰ��״̬��0Ϊ��ʼ״̬��1Ϊʹ�ðγ�״̬
	grass_id_sys_time = 1			--��Ÿò��ϴβ�����ʱ�䣬����һ��������ռ�л���
	grass_kill_num = 1424			--�γ��˶���ҩ�˲�
--����
--===============================���߼���==================================
function main(deal_suc,deal_fail,deal_flag)
	--��ͨ����table�ķ�ʽʵ�ֵ��ö�Ӧ����---------------
	----------------------------------------------------
	local deal_action_total = {
			--��Ӧ���ú���������������ʾ�ɹ������õĺ�����ż��������ʾʧ�������õĺ���
			[1] = af_spring_huashan_open_suc,		--2007�괺�ڻ�ɽ�����
			[2] = af_spring_huashan_open_fail,	
			[3] = af_killer_hall_open_box_suc,		--ɱ���ñ���
			[4] = af_killer_hall_open_box_fail,	
			[5] = af_arrest_finish,
			[6] = af_arrest_fail,
			[7] = af_conf_resource_open_suc,		--�����Դ���� 
			[8] = af_conf_resource_open_fail,
			[9]	= conf_task_open_suc,
			[10]= conf_task_open_fail,
			[11] = northwest_stage4_grass_suc,
			[12] = northwest_stage4_grass_fail,
			[13] = confirm_lucky_award_suc,
			[14] = confirm_lucky_award_fail,
			[15] = confirm_translife_suc,
			[16] = open_vet_201001_hongbao_success,
			[17] = open_vet_201001_hongbao_failed,
			[19] = open_newres_success,
			[20] = open_newres_failed,
			[21] = open_golden_chest_success,	
		  	[22] = FG_GatherSuccess,
		  	[23] = FG_GatherFailure,
		  	[24] = gtask_WuZi_116_suc,
		  	[25] = gtask_WuZi_116_fail,
		  	[26] = bkl_openbox_suc,
		  	[27] = bkl_openbox_fail,
		  	[28] = tuyetanh_openbox_suc,
		  	[29] = tuyetanh_openbox_fail,
		  	[30] = chieuda_openbox_suc,
		  	[31] = xichtho_openbox_suc,
			
			--���ǽ�ʹ��100�Ժ������
			--We will use the table index after 100
			[101] = ttd_talk_suc,
			[102] = ttd_talk_fail,
			[103] = gtask_Mfzp_80_suc,
			[104] = gtask_Mfzp_80_fail,
			[105] = qht_diji_box_suc,
			[106] = qht_diji_box_fail,
			[107] = qht_zhongji_box_suc,
			[108] = qht_zhongji_box_fail,
			[109] = qht_gaoji_box_suc,
			[110] = qht_gaoji_box_fail,
			[111] = zq_battle_song_lingqi_suc,
			[112] = zq_battle_song_lingqi_fail,
			[113] = zq_battle_liao_lingqi_suc,
			[114] = zq_battle_liao_lingqi_fail,
			[115] = vet_201305_refinedan_suc,
			[116] = vet_201305_refinedan_fail,
			[117] = tm_use_siling_keyin_suc,
			[118] = tm_use_siling_keyin_fail,
			[119] = eyt_open_flag_suc,
			[120] = eyt_open_flag_fail,
			--the max table index is 255
	}
	if deal_flag == 1 then
		deal_action_total[deal_suc]();
	else
		deal_action_total[deal_fail]();
	end;
end

--=====================2007�괺�ڻ�ɽ�����=========================
--***********************������ɹ�������****************************
function af_spring_huashan_open_suc()
	if IsTongMember() == 0 then
		Say("Ph�i gia nh�p bang h�i m�i nh�t ���c b�o r��ng!", 0)
		return
	end

	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "B�o r��ng Hoa s�n" then			--�ж������Ƿ����
		return
	end
	SetUnitCurStates(npc_index,2,1)
	SetUnitCurStates(npc_index,4,zgc_pub_day_turn(1))						--�������ʱ��
	SetNpcLifeTime(npc_index,0)

--	local player_sex = GetSex()
	local add_flag = 0
	local prize_name = ""
	local nRandom = random(1,100)
	
	if nRandom <= 50 then
		add_flag = AddItem(0,102,15,1,1,2,24,3,14,0,0)
		prize_name = "H�ng Ph� Th�y H� Th�n Ph�"
	else
		add_flag = AddItem(0,102,20,1,1,2,24,3,14,0,0)
		prize_name = "To�n Th�ch Gi�i Ch�"
	end
	--���������Ƿ�ɹ�����ش���
	if add_flag == 1 then
		Msg2Player("B�n m� b�o r��ng, nh�n ���c: "..prize_name.."!")
		Msg2SubWorld(format("%s �� �o�t ���c b�o r��ng Hoa S�n, trong b�o r��ng c� ch�a: %s ", GetName(), prize_name))
		WriteLogEx("Bang hoi tinh anh","nh�n","1",prize_name,"",GetTongName())
	else
		WriteLog("[Ho�t ��ng bang h�i tinh anh] : ".."Ng��i ch�i "..GetName().." Nh�n ���c ph�n th��ng:"..prize_name.." Th�m th�t b�i, k� hi�u:"..add_flag)
	end

	local tBook =
	{
		[1] = {"Chi�m Y Ph�",	0,	107,	66,	1,	},
		[2] = {"T� H� M�t t�ch",	0,	107,	65,	1,	},
		[3] = {"Thi�n H� M�t t�ch",	0,	107,	64,	1,	},
	}

	for i=1, getn(tBook) do
		add_item_first_tong(tBook[i])
	end

	local tWeapon =
	{
		[1] = {"��i H�o L�i Th��ng",	0,	6,	108,	130,	},
		[2] = {"Th�n Cung",		0,	4,	119,	130,	},
		[3] = {"V�n Nh�n",		0,	0,	14,		220,	},
		[4] = {"A La H�n Tr��ng",	0,	8,	97,		100,	},
		[5] = {"C� ��nh",		0,	3,	64,		200,	},
		[6] = {"Li�t Di�m",		0,	5,	40,		200,	},
		[7] = {"Th�n H�nh",		0,	9,	86,		130,	},
		[8] = {"H�a Tinh",		0,	2,	36,		90,		},
		[9] = {"Hi Nh�n C�m",	0,	10,	75,		140,	},
		[10] = {"M�nh h�",		0,	11,	12,		200,	},
		[11] = {"L�ng Phong",		0,	7,	12,		200,	},
		[12] = {"M�n Thi�n Hoa V�",	0,	1,	53,		130,	},
	}
	local tAttribute =
	{
		[1]  	= {28,	100, 	{{5,500}, {6,300}, {7,200}}},
		[2]  	= {41,	80, 	{{5,800}, {6,200}}},
		[3]  	= {42,	80, 	{{5,800}, {6,200}}},
		[4]  	= {63,	20, 	{{5,900}, {6,95}, {7,5}}},
		[5]  	= {64,	20, 	{{5,900}, {6,95}, {7,5}}},
		[6]  	= {7, 		50, 	{{5,700}, {6,250}, {7,50}}},
		[7] 	= {94,	70, 	{{5,500}, {6,300}, {7,200}}},
		[8]  	= {95,	70, 	{{5,500}, {6,300}, {7,200}}},
		[9]  	= {96,	70, 	{{5,500}, {6,300}, {7,200}}},
		[10] 	= {97,	70, 	{{5,500}, {6,300}, {7,200}}},
		[11] 	= {98,	70, 	{{5,500}, {6,300}, {7,200}}},
		[12] 	= {69,	80, 	{{5,500}, {6,300}, {7,200}}},
		[13] 	= {99,	80,	{{2,700}, {3,300}}},
		[14] 	= {30,	50, 	{{5,500}, {6,300}, {7,200}}},
		[15] 	= {50,	20, 	{{6,500}, {7,500}}},
		[16] 	= {49,	20, 	{{6,500}, {7,500}}},
		[17] 	= {102,	15,	{{5,800}, {6,200}}},
		[18] 	= {27,	15, 	{{3,950}, {4,50}}},
		[19] 	= {85,	10, 	{{3,600}, {4,400}}},
		[20] 	= {86,	10, 	{{3,600}, {4,400}}},
	}
	local nRandomWeapon = random(1, getn(tWeapon))
	local nRandomAttr = 0
	local nRandomAttrLevel = 0
	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}

	local nPerTurn = 1000
	for i=1, 3 do
		nRandomAttr =get_random_attrib(tAttribute,nPerTurn)
		nPerTurn = nPerTurn - tAttribute[nRandomAttr][2]		
		nRandomAttrLevel = get_random_attrib(tAttribute[nRandomAttr][3],1000)
		tWeaponAttr[i][1] = tAttribute[nRandomAttr][3][nRandomAttrLevel][1]
		tWeaponAttr[i][2] = tAttribute[nRandomAttr][1]
		tremove(tAttribute, nRandomAttr)
	end
	
	add_flag = AddItem(tWeapon[nRandomWeapon][2],tWeapon[nRandomWeapon][3],tWeapon[nRandomWeapon][4],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
	prize_name = tWeapon[nRandomWeapon][1]
	if add_flag == 1 then
		Msg2Player("B�n m� b�o r��ng, nh�n ���c: "..prize_name.."!")
		Msg2SubWorld(format("%s �� �o�t ���c b�o r��ng Hoa S�n, trong b�o r��ng c� ch�a: %s ", GetName(), prize_name))
		WriteLogEx("Bang hoi tinh anh","nh�n","1",prize_name,"",GetTongName())
	else
		WriteLog("[Ho�t ��ng bang h�i tinh anh] : ".."Ng��i ch�i "..GetName().." Nh�n ���c ph�n th��ng:"..prize_name.." Th�m th�t b�i, k� hi�u:"..add_flag)
	end

	local nDateStart = tonumber(date("%y%m%d"))		--��¼���ڿ����콱����ʼʱ��
	local nPrizeFlag = 1							--��¼�����Ƿ������ȡ����(ֻ����ȡһ�Σ���ȡ����������Ϊ0)
	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlag, GetTongName())
	
	--����ʤ��������	
	local flag_index = CreateNpc("Ti�u s�-��i tho�i",GetTongName(),GetWorldPos())
	SetNpcLifeTime(flag_index,21600)
	
	Msg2Global("Ho�t ��ng bang h�i tinh anh �� k�t th�c, bang h�i tinh anh l�n n�y l�:  "..GetTongName())
	mf_Talk2Camp(46, 0, "Ho�t ��ng bang h�i tinh anh �� k�t th�c, bang h�i tinh anh l�n n�y l�:  "..GetTongName());
	for i=1, 3 do
		AddGlobalNews("Ho�t ��ng bang h�i tinh anh �� k�t th�c, bang h�i tinh anh l�n n�y l�:  "..GetTongName())
	end

	mf_SetMissionV(46,7,1,969)
	mf_SetMissionV(46,1,3,969)
	WriteLogEx("Bang hoi tinh anh","m� b�o r��ng th�nh c�ng","","","",GetTongName())
end

function get_random_attrib(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function add_item_first_tong(tItem)
	local szLogTitle = "[Ho�t ��ng bang h�i tinh anh] : "
	local nRetCode = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		Msg2Player("B�n m� b�o r��ng, nh�n ���c: "..tItem[1].."!")
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c�i "..tItem[1]);
	else
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c�i "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

--***********************������ʧ�ܴ�����****************************
function af_spring_huashan_open_fail()
	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "B�o r��ng Hoa s�n" then
		return
	end
--	SetUnitCurStates(npc_index,2,0)
end

--***************�����Դ�����������ӿ������ɹ���**********************
function af_conf_resource_open_suc()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--��ȡNPC����
	if GetNpcName(npc_index) ~= "B�o r��ng T�i nguy�n" then
		return
	end
	if GetFightState() == 0 then
		return
	end
	if GetPKFlag() == 0 then
		Talk(1,"","B�n ph�i � tr�ng th�i chi�n ��u m�i c� th� m� r��ng.")
		return
	end
	SetUnitCurStates(npc_index,box_open_week_ID,zgc_pub_day_turn(7))
	SetUnitCurStates(npc_index,box_belong_ID,1)
	--�Ѷ�Ӧ�ط���Ǯ����
	local mapid = GetWorldPos()
	local map_2_city = Tb_map_2_city[mapid]
	if map_2_city == nil then
		return
	end
	if AddCityBoxCount(map_2_city,-1) == 1 then
		if random(1,100) <= 33 then
			Earn(1000000)
			Msg2Player("B�n �� m� ���c B�o r��ng, nh�n ���c 100 v�ng!")
			WriteLogEx("Cong Thanh Chien","M� R��ng T�i Nguy�n",100,"v�ng")
		else
			local nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,24*60*60)
				Msg2Player("B�n �� m� ���c B�o r��ng, nh�n ���c B�o r��ng T�i nguy�n!")				
			end
			WriteLogEx("Cong Thanh Chien","M� R��ng T�i Nguy�n",1,"B�o r��ng T�i nguy�n")
		end
		Msg2SubWorld("Ng��i ch�i: "..GetName().." M� B�o r��ng T�i nguy�n th�nh c�ng!")
		local flag_index = CreateNpc("Ti�u s�-��i tho�i","Ng��i m�:"..GetName(),GetNpcWorldPos(npc_index))
		SetNpcLifeTime(flag_index,21600)	
	end
end
--***************�����Դ�����������ӿ�����ʧ�ܣ�**********************
function af_conf_resource_open_fail()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--��ȡNPC����
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TasktempID_npc_index,0)
end

function open_newres_success()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	if GetNpcName(npc_index) == "" then
		return
	end
	if GetFightState() == 0 then
		return
	end	
	SetUnitCurStates(npc_index,box_belong_ID,1)	
	local mapid = GetWorldPos()	
	if mapid ~= 606 then
		return
	end
	award_point()
end

function open_newres_failed()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TSK_TMP_NEWRES,0)
end

function award_point()
	local nChuyenSinh = GetTranslifeCount()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nLev_GetExp = 0
	local nMapID1, nX1, nY1 = GetWorldPos()
	local nMapID2, nX2, nY2 = 0,0,0
	local nTeamSize = GetTeamSize();
	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT_TNC) -- th�m t�n task 2285
	local nRemain = GetTime() - nTimeBegin
	nRemain = 60 - floor(nRemain/60)
	if nRemain < 0 then
		nRemain = 0
	end
	if nPhucSinh >= 1 then
		nLev_GetExp = 5*100 + nPhucSinh*120 + GetLevel()
	else
		nLev_GetExp = nChuyenSinh*100 + GetLevel()
	end
	
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	if nTeamSize == 0 or nTeamSize == 1 then		
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
			local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				if 0 < nRemain then
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1 * nTypeDouble)
					ModifyExp(nLev_GetExp * 8 * nTypeDouble)
					Msg2Player("Th�i gian h� tr� c�n l�i l�: "..nRemain.." ph�t")
				else
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
					ModifyExp(nLev_GetExp * 8)
				end
			end
			nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				Msg2Player("T�ch l�y thu th�p: "..nPoint.."/2500")
			else
				Msg2Player("T�ch l�y thu th�p: 2500/2500")
			end
			if nPoint >= 2500 then
				gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
				TaskTip("B�n �� ho�n th�nh nhi�m v� thu th�p t�i nguy�n.")
				WriteLogEx("TL TNChien","Ho�n th�nh nhi�m v�")
			end
		end
	else
	    	local nOldIndex = PlayerIndex;
	    	for i = 1, nTeamSize do
	     		PlayerIndex = GetTeamMember(i);
	     		nMapID2, nX2, nY2 = GetWorldPos()
	     		if nMapID2 == 606 and GetFightState()== 1 then
	     			if IsPlayerDeath() == 0 then
		     			if DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) <= 23 then
				        	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
				        		local nTypeDoublePT = floor(GetTask(TSK_NEWRES_POINT)/10000)
							local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							local nTimeBeginPT = GetTask(TSK_TIME_KICHHOAT_TNC) -- th�m t�n task 2285
							local nRemainPT = GetTime() - nTimeBeginPT
							nRemainPT = 60 - floor(nRemainPT/60)
							if nRemainPT < 0 then
								nRemainPT = 0
							end
							local nChuyenSinh_mem = GetTranslifeCount()
							local nPhucSinh_mem = GetPlayerRebornParam(0)
							local nLev_GetExp_mem = 0
							if nPhucSinh_mem >= 1 then
								nLev_GetExp_mem = 5*100 + nPhucSinh_mem*120 + GetLevel()
							else
								nLev_GetExp_mem = nChuyenSinh_mem*100 + GetLevel()
							end
							if nPoint < 2500 then
								if 0 < nRemainPT then
									SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) + (1 * nTypeDoublePT - 1))
									ModifyExp(nLev_GetExp_mem * 8 * ( nTypeDoublePT - 1))
									Msg2Player("Th�i gian h� tr� c�n l�i l�: "..nRemainPT.." ph�t")
								end
								SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
								ModifyExp(nLev_GetExp_mem * 8)							
							end
							nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							if nPoint < 2500 then
								Msg2Player("B�n �� thu th�p th�nh c�ng: "..nPoint.."/2500")
							else
								Msg2Player("B�n �� thu th�p th�nh c�ng: 2500/2500")
							end
							if nPoint >= 2500 then
								gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
								TaskTip("B�n �� ho�n th�nh nhi�m v� thu th�p t�i nguy�n.")
								WriteLogEx("TL TNChien","Ho�n th�nh nhi�m v�")
							end
						end
					end
				end
			end
		end
	    	PlayerIndex = nOldIndex;
	end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;


function af_killer_hall_open_box_suc()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	local sNpcName = GetNpcName(nNpcIdx);
	if sNpcName == "H��ng ch� B�o r��ng" then
		KH_Give_Award(NPC_TYPE_XIANGZHU);
	elseif sNpcName == "Ph� ���ng Ch� B�o R��ng" then
		KH_Give_Award(NPC_TYPE_FUTANGZHU);	
	elseif sNpcName == "L� ��i Ch�y B�o R��ng" then
		KH_Give_Award(NPC_TYPE_LIDAZUI);
	else
		WriteLog("[S�t Th� ���ng b�o l�i]: L�c m� r��ng ph�t hi�n t�n Npc sai:"..tostring(sNpcName));
	end;
end;

function af_killer_hall_open_box_fail()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	KH_SetUnit_CurStates(nNpcIdx,2,0)
end;
function af_arrest_finish()
	if GetTaskTemp(10) ~= 2132 then		-- ������һ���жϣ�������п����ǿͻ������ⷢ����������
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	-- �������ĸ����ɵ�
	local szTixiaTong = GetTongName()
	if IsTongMember() == 0 then
		szTixiaTong = ""
	end
	-- �������ж�
	local nSelfMapID, nSelfX, nSelfY = GetWorldPos()
	local nTarMapID, nTarX, nTarY
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("Ph�i c� 1 Th�nh �� T�m N� L�nh m�i c� th� truy n�.")
		return
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTask(450)
	if PlayerIndex > 0 then
		nTarMapID, nTarX, nTarY = GetWorldPos()
		local nDist = distance_between_points(nSelfMapID, nSelfX, nSelfY, nTarMapID, nTarX, nTarY)
		if nDist ~= -1 and nDist <= 20 then	-- ����Ч����֮��
			-- ץ��������ȥ
			if IsPlayerDeath() > 0 then			-- ��������ģ���ԭ�ػ����ٷ�
				RevivePlayer(0)
			end
			
			local nPrisonMap = citywar_get_throw_where()
			print("nPrisonMap = "..nPrisonMap)
			if nPrisonMap ~= nil and nPrisonMap > 0 then
				CleanInteractive()
				if NewWorld(nPrisonMap, tCityWarPrisonPos[1], tCityWarPrisonPos[2]) == 1 then
					SetPlayerRevivalPos(nPrisonMap, nPrisonMap)
					
					StallEnable(0)	-- ���ܰ�̯
					ForbidRead(1)	--��������
					UseScrollEnable(0)	--��ֹʹ�ûس�
					SetFightState(0)	-- ս��״̬
					CreateTrigger(1, 1109, CITYWAR_STEP_TRIGGER)		-- �η�ʱ��Ʋ���
					ContinueTimer(GetTrigger(CITYWAR_STEP_TRIGGER))
					-- ���ݱ�ץ��һ˲���ж�Ҫ������Ǯ
					local nPay = 0
					local nRet = IsTongMember()
					if nRet == 0 then								-- �ް���
						nPay = 1
					elseif nRet == 1 or nRet == 2 or nRet == 3 then	-- ����,�������ͳ���
						nPay = 100
					elseif nRet == 4 then
						nPay = 50
					elseif nRet == 5 then
						nPay = 10
					elseif nRet ~= 0 then
						nPay = 3
					end
					
					-- �����70��һ��,�Ͳ��ý�Ǯ
					if GetLevel() < 70 then
						nPay = 0
					end
					CustomDataSave("tongcitywar_arrest_tong", "sd", szTixiaTong, nPay)	--  ��¼ץ�����������İ�����Ҫ������Ǯ
					Msg2Player("B�n b� "..szSelfName.."Truy n�")
					PlayerIndex = nOldPlayer
					DelItem(2,1,1211,1)
				end
			end
		else
			Msg2Player("B�n �� tr�n tho�t th�nh c�ng s� truy n� c�a "..szSelfName..". ")
			PlayerIndex = nOldPlayer
			Msg2Player("M�c ti�u kh�ng � trong ph�m vi hi�u l�c, truy n� th�t b�i")
		end
	end
	PlayerIndex = nOldPlayer
end

function af_arrest_fail()
	if GetTaskTemp(10) ~= 2132 then
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	Msg2Player("Truy n� b� gi�n �o�n, truy n� th�t b�i")
	local nOldPlayer = PlayerIndex
	-- 
	PlayerIndex = GetTask(450)
	Msg2Player("B�n �� tr�n tho�t th�nh c�ng s� truy n� c�a "..szSelfName..". ")
	PlayerIndex = nOldPlayer
end
--=================��Ჽ����������ʰȡ�����޸�================
function conf_task_open_suc()
		local npc_index = GetTaskTemp(166) 
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		local add_flag_total = 0
		local npc_name = GetNpcName(npc_index)
		if npc_name == "R��ng c�a C�n L�n N� �� l�i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,526,1)
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: C�n L�n N� b� l�i r��ng th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R��ng c�a B�i H�ng �� l�i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,527,1)
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: B�i H�ng b� l�i r��ng th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R��ng c�a Li�u Ngh� �� l�i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,528,1)
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: Li�u Ngh� b� l�i r��ng th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R��ng c�a H�ng Tuy�n �� l�i" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,529,1)
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: H�ng Tuy�n b� l�i r��ng th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R��ng s�t c�a H� C�nh Th�ng" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,530,1)
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: Th�m r��ng s�t H� C�nh Th�ng th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "R��ng s�t c�a Nhi�p ��i Ch�y" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,531,1)
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: Th�m r��ng s�t Nhi�p ��i Ch�y th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "B�o r��ng c�a B� Phi Y�n" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,532,1)
			if random(1,100) <= 30 then
				AddItem(2,1,30130,2)
				SendTongMessage(GetName().." Nh�t ���c 2 Phi Y�n Th�ch.")
				WriteLogEx("Mo ruong Bo Phi Yen","nh�n",2,"Phi Y�n Th�ch")
			end			
			AddItem(2,1,30071,1)
			SendTongMessage(GetName().." Nh�t ���c 1 Nh�m S�m V�n N�m.")
			WriteLogEx("Mo ruong Bo Phi Yen","nh�n",1,"Nh�m S�m V�n N�m")
			if add_flag == 0 then
				WriteLog("Nhi�m v� BOSS ng�u nhi�n bang h�i: Th�m B�ch B�o r��ng B� Phi Y�n th�t b�i, k� hi�u:"..add_flag)
			else
				add_flag_total = 1
				AddGlobalNews(GetTongName().."H� g�c B� Phi Y�n nh�n ���c B�ch B�o r��ng!")
			end
		end
		if add_flag_total == 1 then
			SendTongMessage(GetName().." Nh�t ���c "..npc_name..".")
			Msg2SubWorld(GetTongName().." Bang h�i: "..GetName().." Nh�t ���c "..npc_name..".")
			WriteLog("Nhi�m v� B� Phi Y�n: Ng��i ch�i ["..GetName().."] t�i Map :"..GetWorldPos() .."Nh�t ���c "..npc_name)
		end
end

function conf_task_open_fail()
	local npc_index = GetTaskTemp(166) 
	SetUnitCurStates(npc_index,Box_belong_ID,0)
end
--=================�������ؿ����Ĺ�ҩ�ݰγ�======================
Tb_stage4_buff_info = {
	{61210625,60,21},
	{61210626,60,22},
	{61210627,60,23},
	{61210628,60,24},
	{61210629,60,25},
}
--�γ��ɹ�
function northwest_stage4_grass_suc()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetNpcLifeTime(grass_index,0)
	local num_now = GetTask(grass_kill_num)+1
	SetTask(grass_kill_num,num_now)
	--����buff���Ӻ���
	local poision_level = num_now/5
	if mod(poision_level,1) == 0 then
		if poision_level > 5 then
			poision_level = 5 
		end
		--��buff
		CastState("state_diffuse_skill_effect",Tb_stage4_buff_info[poision_level][1],-1,1,19801223)
		AddTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		SetCurTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		Msg2Player("B�n �� h�i ���c "..num_now.." 'D��c Nh�n Th�o', ��c c�a D��c Nh�n Th�o �� th�m v�o ng��i b�n!")
	else--δ�ж��Ի�
		Msg2Player("B�n �� h�i ���c "..num_now.." 'D��c Nh�n Th�o', s� l��ng h�i c�ng nhi�u ��c tr�ng c�ng n�ng, h�y c�n th�n!")
	end
end
--�γ�ʧ��
function northwest_stage4_grass_fail()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetUnitCurStates(grass_index,grass_id_state,0)
end
--��������⺯��
function grass_index_chk(grass_index)
	if grass_index == 0 then
		return 0
	elseif GetNpcName(grass_index) ~= "D��c Nh�n Th�o" then
		return 0
	else
		return 1
	end
end

tlucky_award = {
				{"V�n V�t Quy Nguy�n ��n", 909, {1,0,11,1}, 0},
				{"H�c Ng�c �o�n T�c Cao", 909, {1,0,6,1}, 0},
				{"Sinh Sinh H�a T�n", 909,{1,0,16,1}, 0},
				{"Ma �ao Th�ch C�p 1", 789, {2,1,30428,1}, 15*24*60*60},
				{"Ma �ao Th�ch C�p 2", 312, {2,1,30429,1}, 15*24*60*60},	
				{"Ma �ao Th�ch C�p 3", 99, {2,1,30430,1}, 15*24*60*60},			
				{"B�ng Th�ch", 600, {2,1,149,1}, 0},			
				{"M�nh B�ng Th�ch", 1464, {2,1,148,1}, 0},	
				{"C� Linh Th�ch", 100, {2,1,30368,1}, 0},	
				{"C� Linh Ng�c", 100, {2,1,30369,1}, 0},	
				{"M�nh Thi�n Cang", 253, {2,1,30390,1}, 0},
				{"M�c R��ng", 3553, {2,1,30340,1}, 0},
				{"Thi�n Th�ch Linh Th�ch", 1, {2,1,1068,1}, 7*24*60*60},
				{"��nh H�n Thi�n Th�ch Th�n Th�ch", 1, {2,1,1067,1}, 7*24*60*60},
				{"��i ��nh H�n", 1, {2,1,1113,1}, 7*24*60*60},								
		}

-------------------------Quay s� Ingame-----------------------------------------------

tbAwardQuaySo  = {
	[1] = {[1] = {nCheckExp = 0, nExp = 5000000}, nRate = 30.00},
	[2] = {[1] = {nCheckExp = 0,nExp = 10000000}, nRate = 12.00},
	[3] = {[1] = {nCheckExp = 0,nExp = 20000000}, nRate = 5.00},
	[4] = {[1] = {nCheckExp = 0,nExp = 50000000}, nRate = 3.00},
	[5] = {[1] = {nCheckExp = 0,nExp = 100000000}, nRate = 2.00},
	[6] = {[1] = {nDanhvong = 100}, nRate = 15.00},
	[7] = {[1] = {nSumon = 100}, nRate = 15.00},
	[8] = {[1] = {nQuancong = 3000}, nRate = 5.00},
	[9] = {[1] = {item={{gdp={2,1,30497,10,4}, name = "Ma Tinh"}}}, nRate = 5.00},
	[10] = {[1] = {item={{gdp={2,1,149,1,1}, name = "B�ng Th�ch"}}}, nRate = 2.00},
	[11] = {[1] = {item={{gdp={2,1,30428,1,1}, name = "Ma �ao Th�ch c�p 1", nExpired = 7*24*3600}}}, nRate = 2.00},
	[12] = {[1] = {item={{gdp={2,1,30429,1,1}, name = "Ma �ao Th�ch c�p 2", nExpired = 7*24*3600}}}, nRate = 2.00},
	[13] = {[1] = {item={{gdp={2,1,1009,1,1}, name = "Thi�n Th�ch Tinh Th�ch"}}}, nRate = 1.50},
	[14] = {[1] = {item={{gdp={2,1,1000,1,1}, name = "B�n Long B�ch", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[6] = {[1] = {item={{gdp={2,1,30523,1,1}, name = "C�p 3 T�y T�m Th�ch"}}}, nRate = 5.00},
--	[7] = {[1] = {item={{gdp={2,1,30529,1,1}, name = "C�p 3 Luy�n L� Thi�t"}}}, nRate = 5.00},
--	[8] = {[1] = {item={{gdp={2,1,30534,1,1}, name = "Thi�t Tinh c�p 2"}}}, nRate = 5.00},
--	[9] = {[1] = {item={{gdp={2,1,30535,1,1}, name = "Thi�t Tinh c�p 3"}}}, nRate = 5.00},	
--	[11] = {[1] = {item={{gdp={2,1,30426,1,1}, name = "C��ng H�a Quy�n 14", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[12] = {[1] = {item={{gdp={2,1,30427,1,1}, name = "C��ng H�a Quy�n 15", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[17] = {[1] = {item={{gdp={2,1,30430,1,1}, name = "Ma �ao Th�ch c�p 3", nExpired = 7*24*3600}}}, nRate = 2.00},
--	[21] = {[1] = {item={{gdp={2,1,3356,1,1}, name = "T�i Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[22] = {[1] = {item={{gdp={2,1,1051,1,1}, name = "Bao Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[24] = {[1] = {item={{gdp={2,1,1001,1,1}, name = "H�a Th� B�ch", nExpired = 7*24*3600}}}, nRate = 0.50},
}
--VET_2012_QUAYSOINGAME  = {
--	{1, 555, "C��ng H�a Quy�n 12", {2,1,30424, 1}, 15* 24 * 3600},
--	{1, 666, "C��ng H�a Quy�n 13", {2,1,30425, 1}, 15* 24 * 3600},
--	{1, 777, "C��ng H�a Quy�n 14", {2,1,30426, 1}, 15* 24 * 3600},	
--	{1, 888, "C��ng H�a Quy�n 15", {2,1,30427, 1}, 15* 24 * 3600},	
--	{1, 3003, "6 M�c R��ng", {2,1,30340, 6}, 0},	
--	{1, 1616, "6 T�i ti�n", {2,1,30367, 6}, 0},	
--	{1, 1234, "M�nh Thi�n Cang", {2,1,30390, 1}, 0},
--	{1, 1234, "M�nh Thi�n M�n", {2,1,30410, 1}, 0},
--	{1, 22, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067, 1}, 7* 24 * 3600},
--	{1, 5, "��i ��nh H�n", {2,1,1113, 1}, 7*24*60*60},				
--}
-- M�t t�ch cao c�p 
VET_2012_GAOJIMIJI = {
	{1, 988, "Kim Cang B�t Nh� Ch�n Quy�n ", {0, 107, 204, 1}, 0},
	{1, 368, "Ti�m Long T�c Di�t Ch�n Quy�n", {0, 107, 205, 1}, 0},
	{1, 714, "V� Tr�n B� �� Ch�n Quy�n", {0, 107, 206, 1}, 0},
	{1, 888, "Thi�n La Li�n Ch�u Ch�n Quy�n", {0, 107, 207, 1}, 0},
	{1, 348, "Nh� � Kim ��nh Ch�n Quy�n", {0, 107, 208, 1}, 0},
	{1, 524, "B�ch H�i Tuy�t �m Ch�n Quy�n", {0, 107, 209, 1}, 0},
	{1, 888, "H�n ��n Tr�n Nh�c Ch�n Quy�n", {0, 107, 210, 1}, 0},
	{1, 888, "Qu� Thi�n Du Long Ch�n Quy�n", {0, 107, 211, 1}, 0},
	{1, 668, "Huy�n �nh M� T�ng Ch�n Quy�n", {0, 107, 212, 1}, 0},
	{1, 714, "Qu�n T� ��i Phong Ch�n Quy�n", {0, 107, 213, 1}, 0},
	{1, 568, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n", {0, 107, 214, 1}, 0},
	{1, 668, "Xuy�n V�n L�c H�ng Ch�n Quy�n", {0, 107, 215, 1}, 0},
	{1, 888, "Huy�n Minh Phong Ma Ch�n Quy�n", {0, 107, 216, 1}, 0},
	{1, 888, "Linh C� Huy�n T� Ch�n Quy�n", {0, 107, 217, 1}, 0},
	{1, 0, "C�u Thi�n Phong L�i Ch�n Quy�n", {0, 107, 218, 1}, 0},
	{1, 0, "H�ng Tr�n T�y M�ng Ch�n Quy�n", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thi�n Di�p Ch�n Quy�n", {0, 107, 223, 1}, 0},
}

function VIET_Give70GaojiMiji()
	gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
--------------------------------------------------------------------
	
--TSK_LUCKY_DRAW = 1539

function confirm_lucky_award_suc()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."S� l�n nh�n th��ng may m�n c�a c�c h� kh�ng c�n.");
		return
	end
	
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	
	if PayExtPoint(EXT_QUAYSOINGAME,1) == 1 then
--		SetTask(TSK_LUCKY_DRAW, GetTask(TSK_LUCKY_DRAW) + 1)
		LIB_Award.szLogTitle = "QUAY SO IN GAME 201312"
		LIB_Award.szLogAction = "nh�n"
		LIB_Award:AwardByRate(tbAwardQuaySo)
	end
end

function confirm_lucky_award_fail()
end

function confirm_translife_suc()
	Say("Ch�c m�ng ng��i �� l�nh h�i ���c th�m 2 th�nh H�n Nguy�n C�ng! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")
end

t_dig_award_1 = {		    
	    	{1, 15, "Thi�n th�ch", {2, 2, 8, 1}, 0},
	    	{1, 15, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
	    	{1, 25, "B�ng th�ch", {2, 1, 149, 1}, 0},
	    	{3, 45, 100000, 1},
}

t_dig_award_2 = {
		{1, 1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 30*24*3600},
	    	{1, 10, "Thi�n Th�ch Linh Th�ch", {2, 1, 1068, 1}, 30*24*3600},
	    	{1, 5000, "Phi Y�n Th�ch", {2, 1, 30130, 1}, 0},
	    	{1, 5000, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}, 0},
	    	{1, 10000, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
	    	{3, 1, 100000000, 1},
	    	{3, 100, 10000000, 1},
	    	{3, 100000, 1000000, 1},
	    	{3, 879888, 100000, 1},	
}
	
function open_golden_chest_success()	
	local npc_index = GetTargetNpc()
	if npc_index < 0 then
		return
	end	
	local nDigCount = GetTask(2189)
	if mod(nDigCount,7) == 0 then
		local nRand = gf_GetRandItemByTable(t_dig_award_2,1000000,9)
		if t_dig_award_2[nRand][1] == 1 then
			gf_AddItemEx2(t_dig_award_2[nRand][4],t_dig_award_2[nRand][3],szHKLBLogHeader,"T�n L�ng b�o t�ng",t_dig_award_2[nRand][5],1)
		else
			gf_EventGiveCustomAward(t_dig_award_2[nRand][1] - 1, t_dig_award_2[nRand][3], t_dig_award_2[nRand][4] or 1, szHKLBLogHeader, "T�n L�ng b�o t�ng");
		end		
		if nRand >= 1 and nRand <= 4 then
			AddGlobalNews("[T�n L�ng B�o T�ng] Nghe n�i ��i hi�p <color=green>"..GetName().."<color> �� may m�n ��o ���c kho b�u <color=yellow>"..t_dig_award_2[nRand][3].."<color>, xung quanh khu v�c �� ch�c ch�n c�n r�t  nhi�u B�o V�t.")
		end				
	else
		gf_EventGiveRandAward(t_dig_award_1,100,4,szHKLBLogHeader,"T�n L�ng b�o t�ng")
	end
end


TASK_USE_HONGBAO = 1542
BYTE_USE_DAY = 1
BYTE_USE_COUNT = 2

function open_vet_201001_hongbao_success()
	local nTaskVal = GetTask(TASK_USE_HONGBAO)
	local nDay = tonumber(date("%d"))
	if GetByte(nTaskVal,BYTE_USE_DAY) ~= nDay then
		nTaskVal = SetByte(nTaskVal,BYTE_USE_DAY,nDay)
		nTaskVal = SetByte(nTaskVal,BYTE_USE_COUNT,0)
		SetTask(TASK_USE_HONGBAO,nTaskVal)
	end
	
	nTaskByte = GetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT)
	if nTaskByte >= 8 then
		Talk(1,"","M�i ng�y ch� c� th� s� d�ng 8 Bao l� x� may m�n!")
		return 0;
	end
	
	SetTask(TASK_USE_HONGBAO, SetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT, nTaskByte + 1))
	
    	VET_201001_GiveHongBaoAward(GetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX));
    	SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);    
end

function open_vet_201001_hongbao_failed()
    SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);
end

function go_exit()
	ExitGame()
end

function gtask_WuZi_116_suc()
	shaohui_wuzi()
end

function gtask_WuZi_116_fail()
	--do_nothing
end

function ttd_talk_suc()
	SendScript2VM("\\settings\\static_script\\missions\\hunduantongtianding\\mission.lua","stageFight3:callBack()");
end

function ttd_talk_fail()
	return 0;
end

function gtask_Mfzp_80_suc()
	SendScript2VM("\\script\\task\\item\\������.lua","deal_rezult()");
end

function gtask_Mfzp_80_fail()
	return 0;
end

function qht_diji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\diji_box.lua","diji_suc_call_back()");
end

function qht_diji_box_fail()
end

function qht_zhongji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\zhongji_box.lua","zhongji_suc_call_back()");
end

function qht_zhongji_box_fail()
end

function qht_gaoji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\gaoji_box.lua","gaoji_suc_call_back()");
end

function qht_gaoji_box_fail()
end

function zq_battle_song_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_song_lq.lua", "exec_transmit()");
end

function zq_battle_song_lingqi_fail()
end

function zq_battle_liao_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_liao_lq.lua", "exec_transmit()");
end

function zq_battle_liao_lingqi_fail()
end

function bkl_openbox_suc()
	SendScript2VM("\\script\\vng\\bkl_box\\bkl_box_npc.lua","bkl_box_award()");
end

function bkl_openbox_fail()
end

function  tuyetanh_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","tuyetanh_box_award()");
end

function  chieuda_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","chieuda_box_award()");
end

function  xichtho_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","xichtho_box_award()");
end

function  tuyetanh_openbox_fail()
end

function vet_201305_refinedan_suc()
	SendScript2VM("\\script\\online_activites\\201305\\refine_dan.lua", "Vet_201305_Refine_Dan_Suc()");
end

function vet_201305_refinedan_fail()
end

function tm_use_siling_keyin_suc()
	SendScript2VM("\\script\\missions\\tong_melee\\item\\siling_keyin.lua", "dowait_cb()");
end

function tm_use_siling_keyin_fail()
end

function eyt_open_flag_suc()
	SetPlayerScript("\\script\\missions\\eyt_battle\\eyt_head.lua");
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_OpenFlag()");
end

function eyt_open_flag_fail()
end
