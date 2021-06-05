--date:2007-3-6
--author:yanjun
--describe:this script define some constant values and some public functions,is the header file of killer hall task;
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")
--========================================================================================
SETTING_DYNAMIC_MISSION = 0;	--�Ƿ�֧�ֶ�̬������Mission
DEBUG_VERSION = 0;				--��Ҫ���������Ϣ��

THIS_FILE_NAME = "\\script\\task\\killer_hall\\killer_hall_head.lua";
MAP_ID = 885;					--ɱ���õ�ͼID
PLAY_TIME = 60;					--ˢɱ�ֵ���ʱ�䣬Ҳ����Mission�е�STARTED_TIMEʱ�䡣���������Ƶú�ûˮƽ
--�������================================================================================
KH_TASK_GOT_MASK_DATE = 433;	--��ȡ��Ƥ��ߵ�����
KH_TASK_MSUID = 434;			--��¼���֮ǰ���������һ��Mission
KH_TASK_OPEN_BOX_TIME = 435;	--��¼���������ӵĴ���
KH_TASK_USE_MIHAN_TIME = 436;	--��¼�ϴ�ʹ��ɱ�����غ���ʱ��
--��ʱ�������============================================================================
KH_TASK_TEMP_BOX_INDEX = 115;	--��¼�������ӵ�NPC����
--����������==============================================================================
GLB_KILLER_HALL_FORBIDEN = 600;	--�Ƿ��ֹɱ��������
--��ͼ����================================================================================
MAPV_BEGIN = 1;
MAPV_OPENED_BOX1_COUNT = 1;		--��¼���������ӵ�����  
MAPV_OPENED_BOX2_COUNT = 2;     --��¼�����������ӵ�����
MAPV_OPENED_BOX3_COUNT = 3;     --��¼����������ӵ�����
MAPV_OPEN_BOX_FORBIDDEN = 4;	--�����Ƿ���Կ����ӣ�����Ԥ��ˢ����
MAPV_END = 4;
--========================================================================================
XIANGZHU_KILLER_COUNT = 10
FUTANGZHU_KILLER_COUNT = 20;	--ɱ���������������ɱ������
LIDAZUI_KILLER_COUNT = 40;		--ɱ�������������ɱ������
--========================================================================================
NPC_TYPE_XIANGZHU = 1;
NPC_TYPE_FUTANGZHU = 2;
NPC_TYPE_LIDAZUI = 3;
NPC_TYPE_KILLER = 4;
--========================================================================================
tItemInfo = --����ɱ�������������Ʒ��Ϣ
--2��3���Ϊ��̫�׻�Ԫ��ͼ�� edited by vivi
{
	[1] = {"M�t n� S�t Th� ���ng",2,1,1087},
	[2] = {"Th�i D�ch H�n Nguy�n C�ng ��",2,0,1082},
	[3] = {"Th�i D�ch H�n Nguy�n C�ng ��",2,0,1082},
}

tExpAward = {	--���������ľ���
	[NPC_TYPE_XIANGZHU] = {500000},
	[NPC_TYPE_FUTANGZHU] = {1000000},
	[NPC_TYPE_LIDAZUI] = {2000000},
	}

tTaoAward = {	--���������ľ���
	[NPC_TYPE_XIANGZHU] = {1},
	[NPC_TYPE_FUTANGZHU] = {2},
	[NPC_TYPE_LIDAZUI] = {4},
	}
	
tbThuongMoRuong = {
	[NPC_TYPE_XIANGZHU] = {2,1,30340,100},
	[NPC_TYPE_FUTANGZHU] = {2,1,30341,2},
	[NPC_TYPE_LIDAZUI] = {2,1,30341,3},
}
	
tMysticThing = 	--��СѾ������Ʒ
{
	{"Ho�ng Kim b�o r��ng",2,1,108},
	{"X� L�i Truy�n C�ng",2,1,109},
	{"M�nh b�n �� SHXT",2,1,110},
	{"Hoa h�ng",2,1,111},
	{"Ch�n th�",2,1,112},
	{"Nanh s�i",2,1,113},
	{"T� kh�ng Th�y",2,1,114},
	{"Ph� Thi�n Cung",2,1,115},
	{"X��ng r�ng",2,1,116},
	{"T�y Ti�n C�c",2,1,117},
	{"Thi V��ng L�c C�t",2,1,118},
	{"Thi Kh� B�nh",2,1,119},
	{"Qu�n T�",2,1,120},
	{"T�i Phi Ng�",2,1,121},
	{"B�nh Song Tinh",2,1,122},
	{"Th� V��ng T�m",2,1,123},
	{"X��ng s�",2,1,124},
	{"T� H�n ��nh",2,1,125},
	{"L�p Ho�n",2,1,126},
	{"D�i ��c",2,1,127},
	{"Quan m�o",2,1,128},
	{"M�t S�t L�nh",2,1,129},
	{"Ch�n Thi�n Tuy�t",2,1,130},
	{"T�ng B�o ��",2,1,131},
	{"Di�u",2,1,132},
	{"Con r�i",2,1,133},
	{"T�o Ng�n",2,1,134},
	{"Hoa Th�ch C��ng",2,1,135},
	{"D�u �en",2,1,136},
	{"Tr��ng Th�nh K�nh",2,1,137},
	{"B�n ch� T�t Th�ng",2,1,138},
	{"Nh�n ��u Ni�m Ch�u",2,1,139},
	{"Kh� S�n ch�",2,1,140},
	{"Y�u V��ng chi�n k�",2,1,141},
	{"Ho�ng Tri�u Ng�c T�",2,1,142},
	{"Thi�n C��ng Ng� L�i ��i Ph�p",2,1,143},
	{"Kim Chuy�n",2,1,144},
	{"L�i Vi�m Kim Sa",2,1,146},
	{"Thi�n Y V� Phong",2,1,147},
	{"B� ��",2,1,151},
	{"B� Ng�n",2,1,152},
	{"Ph�m m�u",2,1,153},
}

tFactionTokenRing = --���ɶ�Ӧ��ʦ������
{
	[1] = {2,0,205},	--����
	[2] = {2,0,206},	--�䵱
	[3] = {2,0,207},	--����
	[4] = {2,0,208},	--ؤ��
	[5] = {2,0,209},	--����
	[6] = {2,0,350},	--����
	[7] = {2,0,390},	--�嶾
}

tRouteInfo = --����ID��������ߵȼ���������Ϣ
{
	[0] = {0,0,{}},--"��������",
	[1] = {0,0,{}},--����
	[2] = {31,7,{{"C� ��nh ch�a gi�m ��nh",2,1,379},{"Li�t Di�m ch�a gi�m ��nh",2,1,377}}},--"�׼�",
	[3] = {56,7,{{"A La H�n Tr��ng ch�a gi�m ��nh",2,1,382}}},--"��ɮ",
	[4] = {43,7,{{"V�n Nh�n ch�a gi�m ��nh",2,1,375}}},--"��ɮ",
	[5] = {0,0,{}},--"����",
	[6] = {73,7,{{"M�n Thi�n Hoa V� ch�a gi�m ��nh",2,1,378}}},--"����",
	[7] = {0,0,{}},--"����",
	[8] = {88,7,{{"H�a Tinh ch�a gi�m ��nh",2,1,376}}},--"���ҷ��",
	[9] = {101,7,{{"Hi Nh�n C�m ch�a gi�m ��nh",2,1,380}}},--"�����׼�",
	[10] = {0,0,{}},--"ؤ��",
	[11] = {112,7,{{"V�n Nh�n ch�a gi�m ��nh",2,1,375}}},--"ؤ�ﾻ��",
	[12] = {123,7,{{"Li�t Di�m ch�a gi�m ��nh",2,1,377}}},--"ؤ������",
	[13] = {0,0,{}},--"�䵱",
	[14] = {145,7,{{"H�a Tinh ch�a gi�m ��nh",2,1,376}}},--"�䵱����",
	[15] = {158,7,{{"Th�n H�nh ch�a gi�m ��nh",2,1,381}}},--"�䵱�׼�",
	[16] = {0,0,{}},--"����",
	[17] = {731,7,{{"��i H�o L�i Th��ng ch�a gi�m ��nh",2,1,383}}},--"����ǹ��",
	[18] = {744,7,{{"Th�n Cung ch�a gi�m ��nh",2,1,384}}},--"���Ź���",
	[19] = {0,0,{}},--"�嶾",
	[20] = {377,7,{{"L�ng Phong ch�a gi�m ��nh",2,1,386}}},--"�嶾а��",
	[21] = {363,7,{{"M�nh H� ch�a gi�m ��nh",2,1,385}}},--"�嶾��ʦ",
	[23] = {1030,8,{{"M�nh H� ch�a gi�m ��nh",2,1,385}}},
	[29] = {1176,7,{{"M�nh H� ch�a gi�m ��nh",2,1,385}}},
	[30] = {1229,7,{{"M�nh H� ch�a gi�m ��nh",2,1,385}}},
}

tNpcInfo = --����NPC��ģ����������������ʱ��
{
	[NPC_TYPE_XIANGZHU] = {"H��ng ch� S�t Th� ���ng","H��ng ch� S�t Th� ���ng",5*60-30},
	[NPC_TYPE_FUTANGZHU] = {"Ph� ���ng ch� S�t Th� ���ng","Ph� ���ng ch� S�t Th� ���ng",5*60-30},
	[NPC_TYPE_LIDAZUI] = {"Nh�n �� ph� -Qu� Ng��c","Nh�n �� ph� -L� ��i Ch�y",15*60-30},
	[NPC_TYPE_KILLER] = {"Kim b�i s�t th�","Kim b�i s�t th�",5*60-30},
}

tNpcRegion = --������������ˢ�µ�
{
	[NPC_TYPE_XIANGZHU] = 	--�����������
		  {	
			[1] = {{MAP_ID,1533,3137}},	--ĳ��������������п��ܻ��ж��ˢ�µ�
			[2] = {{MAP_ID,1565,3106}}, 
			[3] = {{MAP_ID,1593,3077}},
			[4] = {{MAP_ID,1682,3165}},
			[5] = {{MAP_ID,1653,3194}},
			[6] = {{MAP_ID,1629,3222}},
			[7] = {{MAP_ID,1711,2960}},
			[8] = {{MAP_ID,1738,2986}},
			[9] = {{MAP_ID,1770,3016}},
		  },
	[NPC_TYPE_FUTANGZHU] = --���澺����������
		  {
		  	[1] = {{MAP_ID,1630,3039}},
		  	[2] = {{MAP_ID,1718,3126}},
		  	[3] = {{MAP_ID,1784,3070}},
		  	[4] = {{MAP_ID,1734,3048}},
		  	[5] = {{MAP_ID,1700,3026}},
		  	[6] = {{MAP_ID,1682,2990}},
		  },
	[NPC_TYPE_LIDAZUI] = 	--�����������
		  {	
			[1] = {{MAP_ID,1672,3082}},
		  },
	[NPC_TYPE_KILLER] = 	--�����ɢ����
		  {	
		  	[1] = {{MAP_ID,1611,3147}},
		  },
}

tEntrancePos = --�����
{
	[1] = {MAP_ID,1573,3186},
	[2] = {MAP_ID,1586,3204},
	[3] = {MAP_ID,1548,3168},
	--�����������ſڴ��͵㣬����9���Ƿ��䴫�͵�
	[4] = {MAP_ID,1533,3137},
	[5] = {MAP_ID,1565,3106},
	[6] = {MAP_ID,1593,3077},
	[7] = {MAP_ID,1682,3165},
	[8] = {MAP_ID,1653,3194},
	[9] = {MAP_ID,1629,3222},
	[10] = {MAP_ID,1711,2960},
	[11] = {MAP_ID,1738,2986},
	[12] = {MAP_ID,1770,3016},
}

tExitPos = --���ڵ�
{
	[1] = {300,1654,3643},
	[2] = {300,1893,3648},
	[3] = {300,1908,3449},
	[4] = {300,1679,3463},
}
--=========================================================================================
BOSS1_POS_COUNT = getn(tNpcRegion[NPC_TYPE_XIANGZHU]);
BOSS2_POS_COUNT = getn(tNpcRegion[NPC_TYPE_FUTANGZHU]);
BOSS3_POS_COUNT = getn(tNpcRegion[NPC_TYPE_LIDAZUI]);
MAX_BOX1_COUNT = ceil(PLAY_TIME/5)*BOSS1_POS_COUNT;	--�������ӵ�����
MAX_BOX2_COUNT = ceil(PLAY_TIME/5)*BOSS2_POS_COUNT;	--���������ӵ�����
MAX_BOX3_COUNT = ceil(PLAY_TIME/15)*BOSS3_POS_COUNT;	--��������ӵ�����
--=========================================================================================
--����Ƿ�ѱ��������ѧ�����˼���
function KH_Check_Skill_Level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteInfo[nRoute][1];
	local nMaxLevel = tRouteInfo[nRoute][2];
	if tRouteInfo[nRoute][1] == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nMaxLevel then
			return 1
		else
			return 0;
		end;
	end;
end;
--�������ƣ�NPC����ֵ�趨
--��        �ܣ�ֱ���趨NPC����λ�õ�ֵ
function KH_SetUnit_CurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("Thi�t l�p tr� s� NPC nh�m: V� tr�:"..att_seq.."Tr�:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--������
function KH_Give_Award(nType)
	if GetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN) == 1 then
		local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
		SetNpcLifeTime(nNpcIdx,0);
		gf_Msg2Team("S� l��ng r��ng �� v��t gi�i h�n!");
		return 0;
	end;
--	local nFrui = tTaoAward[nType][1];
	local tbAward = tbThuongMoRuong[nType]
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tMPVID = {
					[1] = MAPV_OPENED_BOX1_COUNT,
					[2] = MAPV_OPENED_BOX2_COUNT,
					[3] = MAPV_OPENED_BOX3_COUNT,
					}
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			KH_Normal_Award(nType);
			VIET_0908_Aword(nType);		--2009��8�»����
			VIET_1009_DoQuest(nType)
--			gf_AddItemEx2({2,1,30176,nFrui}, "T�o", "Nhiem vu STD", "nh�n")
--			gf_AddItemEx2(	tbAward, "Mo ruong", "Nhiem vu STD", "nh�n")
		end;
		PlayerIndex = nOldPlayerIdx;
	else
		KH_Normal_Award(nType);
		VIET_0908_Aword(nType);		--2009��8�»����
		VIET_1009_DoQuest(nType)
	end;
	if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 100815 then
		VIET_1005_Award(nType)
	end
	if tonumber(date("%y%m%d")) >= 101008 and tonumber(date("%y%m%d")) <= 101025 then
		VIET_1010_Bhta4(nType)
	end
	-- Bang h�i tinh anh 6 , ngu�n ra hoa h�ng
	if tonumber(date("%y%m%d")) >= 110930 and tonumber(date("%y%m%d")) <= 111023 then
		VIET_1103_BHTA6(nType)
	end
	KH_Special_Award(nType);	--��������˵Ľ���
	VIET_0908_Aword(nType);		--2009��8�»����
	-- B� ph�n th��ng v� kh�
--	VET_Tier4GiveKillerHallAward(nType);-- ʦ��4��
	local nMapVID = tMPVID[nType];
	--< Added by SunZhuoshi
	if 1 == GetMapTaskTemp(MAP_ID, nMapVID) then
		HBRewardInKillerHall();
	end
	-->
	SetMapTaskTemp(MAP_ID,nMapVID,GetMapTaskTemp(MAP_ID,nMapVID)+1);	--�����������Ӽ���
	KH_Check_Box_Count();	--�����������
end;
--������ͨ����
function KH_Normal_Award(nType)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--�������ɱ���õ�ͼ�Ͳ��ܻ�ý���
		return 0;
	end;
	if IsPlayerDeath() == 0 then --��������״̬
		KH_Exp_Award(nType);	--���齱��
	end;
	KH_LingShiPF_Award(nType);	--��ʯ�䷽����
	SetTask(KH_TASK_OPEN_BOX_TIME,GetTask(KH_TASK_OPEN_BOX_TIME)+1);	--��ý���������1
end;
--��ʯ����
function KH_LingShiPF_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nRandPro = {30,50,100};
	local nRand = random(1,100);
	local nPFLevel = 0;
	local nLevel = GetLevel();
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		if nRand <= floor(nRandPro[nType]*2/3) then	--��7����11�Σ�˥��Ϊԭ����2/3
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		if nRand <= floor(nRandPro[nType]*1/2) then	--��12����17�Σ�˥��Ϊԭ����1/2
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 18 then
		if nRand <= floor(nRandPro[nType]*1/4) then	--��18��֮��˥��Ϊԭ����1/4
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	else
		if nLevel < 80 then
			nPFLevel = random(1,5);
		else
			nPFLevel = random(2,5);
		end;
	end;
	if nPFLevel ~= 0 then
		lspf_AddPeiFangInBottle(nPFLevel,1);
		Msg2Player("B�n nh�n ���c 1 "..nPFLevel.." (c�p) Linh th�ch ph�i ph��ng, �� nh�p v�o T� Linh ��nh");
	end;
end;
--������ͨ�����еľ��齱��
function KH_Exp_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nExp = tExpAward[nType][1];
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		nExp = floor(nExp*2/3);	--��7����11�Σ�˥��Ϊԭ����2/3
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		nExp = floor(nExp*1/2);	--��12����17�Σ�˥��Ϊԭ����1/2
	elseif nGotAwardTime >= 18 then
		nExp = floor(nExp*1/4);	--��18��֮��˥��Ϊԭ����1/4
	end; 
	ModifyExp(nExp);
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
end;
--�������⽱��
function KH_Special_Award(nType)
	local nRand = 0;
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tProb1 = {10,15,50};	--�������ĸ���
	local tProb2 = {0,0,1};	--��ʦ��������ͼֽ��Ƭ�ĸ��ʣ���λ���֮һ
	local tProb3 = {0,0,20};	--���ؼ���Ƭ�ĸ���
	nRand = random(1,100);
	if nRand <= tProb1[nType] then	--������
		if nTeamSize <= 1 then
--			KH_Add_Weapon();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
--				KH_Add_Weapon();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;
	nRand = random(1,100);
	if nRand <= tProb3[nType] then	--���ؼ���Ƭ
		if nTeamSize <= 1 then
			KH_Book_Frag();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
				KH_Book_Frag();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;	
	nRand = random(1,100);
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nRand <= tProb2[nType] then	--��ʦ��������ͼֽ��Ƭ
		KH_Drop_Weapon_Map(nNpcIdx);	--������ɫ�Ӻ�ɾ��NPC
	else
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);	--���������ɫ�Ӿ�ɾ��NPC
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--��һ���ؼ���Ƭ
--��Ϊ����һ��̫�׻�Ԫ��ͼ�� edited by vivi
function KH_Book_Frag()
	local nCurMapID = GetWorldPos();
	local nRetCode = 0;
	if nCurMapID ~= MAP_ID then	--�������ɱ���õ�ͼ�Ͳ��ܻ�ý���
		return 0;
	end;
	nRetCode = AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1);
	if nRetCode == 1 then
		Msg2Player("B�n ���c 1 "..tItemInfo[2][1]);
		WriteLog("[S�t Th� ���ng]::"..GetName().."Nh�n ���c "..tItemInfo[2][1]);
	else
		WriteLog("[S�t Th� ���ng b�o l�i]:"..GetName().."Nh�n ���c"..tItemInfo[2][1].." th�t b�i, nRetCode:"..nRetCode);
	end;
end;
--����һ��������Ʒ
function KH_Add_Random_Mystic_Thing(nCount)
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,getn(tMysticThing));
		if AddItem(tMysticThing[nRand][2],tMysticThing[nRand][3],tMysticThing[nRand][4],1) == 1 then
			Msg2Player("B�n nh�n ���c m�t v�t ph�m th�n b�:"..tMysticThing[nRand][1]);
		end;
	end;
end;
--�����·�����Ӧ������
function KH_Add_Weapon()
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--�������ɱ���õ�ͼ�Ͳ��ܻ�ý���
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local tWeaponList = tRouteInfo[nRoute][3];
	local nWeaponCount = getn(tWeaponList);
	local nRetCode = 0;
	if nWeaponCount > 0 then
		local nRand = random(1,nWeaponCount);
		nRetCode = AddItem(tWeaponList[nRand][2],tWeaponList[nRand][3],tWeaponList[nRand][4],1)
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 "..tWeaponList[nRand][1]);
			WriteLog("[S�t Th� ���ng]::"..GetName().."Nh�n ���c"..tWeaponList[nRand][1]);
		else
			WriteLog("[S�t Th� ���ng b�o l�i]:"..GetName().."Nh�n v� kh� th�t b�i, nRetCode:"..nRetCode);
		end;
	end;
end;
--��ö���������ɱ���õ�ͼ�Ķ�Ա����
function KH_Get_InMap_Member_Count()
	local nTeamSize = GetTeamSize();
	local nTeamMemberCount = 0;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nCurMapID = GetWorldPos()
		if nCurMapID == MAP_ID then
			nTeamMemberCount = nTeamMemberCount + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	return nTeamMemberCount;
end;
--�����������ͼ��Ƭ
--��Ϊ10��̫�һ�Ԫ��ͼ�� edited by vivi 
function KH_Drop_Weapon_Map(nNpcIdx)
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	local nTeamSize = GetTeamSize();
	local nRetCode = 0;
	if nTeamSize <= 1 then	--���û��ӻ����ֻ���Լ�һ����
		nRetCode = AddItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 10 t�m "..tItemInfo[3][1]);
			WriteLog("[S�t Th� ���ng]::"..GetName().."Nh�n ���c "..tItemInfo[3][1]);
		else
			WriteLog("[S�t Th� ���ng b�o l�i]:"..GetName().."Nh�n ���c"..tItemInfo[3][1].." th�t b�i, nRetCode:"..nRetCode);
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);
		return 0;
	end;
	if nNpcIdx <= 0 then
		return
	end
	local dwID = GetUnitCurStates(nNpcIdx, 3)	--1,2�������Ѿ�����
	if dwID == 0 then
		local nRet = ApplyItemDice(1, 100, 40, THIS_FILE_NAME, "KH_Time_Over", nInMapMemberCount,nNpcIdx)
		AddDiceItemInfo(nRet,tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		AddUnitStates(nNpcIdx, 3, nRet);
		local nPlayerOld = PlayerIndex;
		local nCurMapID = 0;
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nCurMapID = GetWorldPos();
			if nCurMapID == MAP_ID then
				RollItem(nRet);
			end;
		end
		PlayerIndex = nPlayerOld;
		return
	end
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("�ang gi�m ��nh thu�c t�nh v�t ph�m!")
	elseif nState == 1 then
		local n = DiceLootItem(dwID)
		if n == 0 then
			gf_Msg2Team(GetName().."Nh�n ���c "..tItemInfo[3][1],1)
		elseif n == 1 then
			Msg2Player("H�nh trang kh�ng c�n tr�ng, kh�ng th� nh�n v�t ph�m")
		end
	elseif nState == 2 then
		--Msg2Player("�������Ѿ�û����Ʒ��")
	end
end
--ɫ����ɴ���
function KH_Time_Over(dwID)
	local t, nSize = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."N�m"..value[2].." �i�m"
		if value[3] == 0 then
			str = value[1].."Ph�ng"
		elseif value[3] == 1 then
			str = str.." (Tuy�t c�u)"
			if value[4] == 1 then
				str = str.." -- Nh�n ���c "..tItemInfo[3][1]
				WriteLog("[S�t Th� ���ng]::"..value[1].."Nh�n ���c "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- Nh�n ���c "..tItemInfo[3][1]
				WriteLog("[S�t Th� ���ng]::"..value[1].."Nh�n ���c "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("T�t c� ng��i ch�i �� b� cu�c")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh�ng ng��i ch�i kh�c �� v��t qu� th�i gian, xem nh� b� cu�c")
	end
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nNpcIdx > 0 then
		if GetNpcWorldPos(nNpcIdx) == MAP_ID then
			SetNpcLifeTime(nNpcIdx,0);
		else
			WriteLog("[S�t Th� ���ng b�o l�i]:"..GetName().."���ng d�n t�m NPC b� sai:"..GetNpcName(nNpcIdx));
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	end
end
--������е�ͼ����
function KH_Clear_Map_Value()
	for i=MAPV_BEGIN,MAPV_END do
		SetMapTaskTemp(MAP_ID,i,0);
	end;
end;
--��鿪�������Ƿ��쳣
function KH_Check_Box_Count()
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	--���ڼ�����IB���߿��Դ���BOSS�������������û��Ҫ��0
	if nBox1Count > MAX_BOX1_COUNT or nBox2Count > MAX_BOX2_COUNT or nBox3Count > MAX_BOX3_COUNT then
		--SetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN,1);
		--gf_ShowDebugInfor("���������쳣��������nBox1Count:"..nBox1Count.."��nBox2Count:"..nBox2Count.."��nBox3Count:"..nBox3Count);
	end;
end;

--2009��8�»����
function VIET_0908_Aword(nType)
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		local nDayWeek = tonumber(date("%w"));
		if nDayWeek == 0 or nDayWeek == 1 or nDayWeek == 5 or nDayWeek == 6 then 
			if GetTask(2081) < tonumber(date("%y%m%d")) then
				SetTask(2082, 0);
			end
			if GetTask(2082) >= 5000000 then return end;
			local nRand = random(1, 100);
			local nExp = 0;
			if nType == NPC_TYPE_XIANGZHU then
				if nRand <= 20 then
					nExp = 100000;
				elseif nRand > 20 and nRand <= 40 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			elseif nType == NPC_TYPE_FUTANGZHU then
				if nRand <= 40 then
					nExp = 100000;
				elseif nRand > 40 and nRand <= 80 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			elseif nType == NPC_TYPE_LIDAZUI then
				if nRand <= 45 then
					nExp = 100000;
				elseif nRand > 45 and nRand <= 90 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			end
			ModifyExp(nExp);
			SetTask(2082, GetTask(2082) + nExp);
			SetTask(2081, tonumber(date("%y%m%d")));
		end
	end
end

tFruitAward = {
	{"Cam", 2, 1, 30166},
	{"B��i", 2, 1, 30169},
	{"D�u", 2, 1, 30170},
}

function VIET_1005_Award(nType)
	local nRand = random(1, 100)
	local nAward = 0
	local nQuanlity = 0
	
	if nType == NPC_TYPE_XIANGZHU then
		nAward = 1
		nQuanlity = 1
	elseif nType == NPC_TYPE_FUTANGZHU then
		if nRand <= 60 then
			nAward = 1
			nQuanlity = 2
		else
			nAward = 2
			nQuanlity = 2
		end
	elseif nType == NPC_TYPE_LIDAZUI then
		if nRand <= 40 then
			nAward = 1
			nQuanlity = 3
		elseif nRand <= 70 then
			nAward = 2
			nQuanlity = 3
		else
			nAward = 3
			nQuanlity = 3
		end
	end
	
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				gf_AddItemEx2({tFruitAward[nAward][2], tFruitAward[nAward][3], tFruitAward[nAward][4], nQuanlity}, tFruitAward[nAward][1], "Sat Thu Duong", "nh�n")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			gf_AddItemEx2({tFruitAward[nAward][2], tFruitAward[nAward][3], tFruitAward[nAward][4], nQuanlity}, tFruitAward[nAward][1], "Sat Thu Duong", "nh�n")
		end
	end
end

function VIET_1009_DoQuest(nType)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if nStatus > 0 then
		if nStatus < 2 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10)
		end
		local nBox1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
		local nBox2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
		local nBox3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
		if nType == NPC_TYPE_XIANGZHU and nBox1 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 100)
			--gf_AddItemEx2({2,1,30176,1}, "T�o", "Nhiem vu STD", "nh�n")
		elseif nType == NPC_TYPE_FUTANGZHU and nBox2 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1000)
			--gf_AddItemEx2({2,1,30176,2}, "T�o", "Nhiem vu STD", "nh�n")
		elseif nType == NPC_TYPE_LIDAZUI and nBox3 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10000)
			--gf_AddItemEx2({2,1,30176,4}, "T�o", "Nhiem vu STD", "nh�n")
		end
		Msg2Player("Ho�n th�nh nhi�m v� m� r��ng!")
	end
end

function VIET_1010_Bhta4(nType)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				if nType == NPC_TYPE_XIANGZHU then
					gf_AddItemEx2({2,0,1162,5}, "Hoa H�ng ��", "Bang Hoi Tinh Anh 4", "m� r��ng H��ng Ch�")
				elseif nType == NPC_TYPE_FUTANGZHU then
					gf_AddItemEx2({2,0,1162,10}, "Hoa H�ng ��", "Bang Hoi Tinh Anh 4", "m� r��ng Ph� ���ng Ch�")
				elseif nType == NPC_TYPE_LIDAZUI then
					gf_AddItemEx2({2,0,1164,1}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 4", "m� r��ng L� ��i Ch�y")
				end
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			if nType == NPC_TYPE_XIANGZHU then
				gf_AddItemEx2({2,0,1162,5}, "Hoa H�ng ��", "Bang Hoi Tinh Anh 4", "m� r��ng H��ng Ch�")
			elseif nType == NPC_TYPE_FUTANGZHU then
				gf_AddItemEx2({2,0,1162,10}, "Hoa H�ng ��", "Bang Hoi Tinh Anh 4", "m� r��ng Ph� ���ng Ch�")
			elseif nType == NPC_TYPE_LIDAZUI then
				gf_AddItemEx2({2,0,1164,1}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 4", "m� r��ng L� ��i Ch�y")
			end
		end
	end
end

function VIET_1103_BHTA6(nType)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				if nType == NPC_TYPE_XIANGZHU then
					gf_AddItemEx2({2,0,1164,5}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "m� r��ng H��ng Ch�")
				elseif nType == NPC_TYPE_FUTANGZHU then
					gf_AddItemEx2({2,0,1164,10}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "m� r��ng Ph� ���ng Ch�")
				elseif nType == NPC_TYPE_LIDAZUI then
					gf_AddItemEx2({2,1,30255,5}, "Hoa H�ng V�ng", "Bang Hoi Tinh Anh 6", "m� r��ng L� ��i Ch�y")
				end
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			if nType == NPC_TYPE_XIANGZHU then
				gf_AddItemEx2({2,0,1164,5}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "m� r��ng H��ng Ch�")
			elseif nType == NPC_TYPE_FUTANGZHU then
				gf_AddItemEx2({2,0,1164,10}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "m� r��ng Ph� ���ng Ch�")
			elseif nType == NPC_TYPE_LIDAZUI then
				gf_AddItemEx2({2,1,30255,5}, "Hoa H�ng V�ng", "Bang Hoi Tinh Anh 6", "m� r��ng L� ��i Ch�y")
			end
		end
	end
end