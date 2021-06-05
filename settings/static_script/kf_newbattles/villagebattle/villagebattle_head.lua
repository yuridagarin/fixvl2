--filename:villagebattle_head.lua
--create date:2006-05-31
--describe:��������ս��ͷ�ļ�����������һ��ͷ�ļ�������ս�������ű�ֻ��������ͷ�ļ�������
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\position.lua");

MAX_TASK_STEP = 99;	--���������

SICK_NPC = 1;	--NPC�������ͣ����
ANGRY_NPC = 2;	--��ŭ
RAGING_NPC = 3;	--��

BATTLE_TYPE = VILLAGE_ID;	--ս������

SELECT_COUNT = 3;	--��ѡ��ȥѰ��Ŀ��NPC����ҵ�������ֻ������1��2��3��4
KNOWMAN_COUNT = 10;	--֪�������������ܸĶ�������Ķ������ȿ����ű���

ENTRANCE_POINT = 	--�����
{
	[SONG_ID] = {MAPID_SONG,1553,3618},
	[LIAO_ID] = {MAPID_LIAO,1783,3152},
};

DEATH_SCRIPT = "\\settings\\static_script\\kf_newbattles\\villagebattle\\playerdeath.lua";

--��table��ʽ����nPlayerCount�������ҵ�����
function Get_Random_Player(nCamp,nPlayerCount)
	local tPlayer = {};
	local tSelectedPlayer = {};
	local nMSPlayerCount = GetMSPlayerCount(MISSION_ID,nCamp);
	if nMSPlayerCount == 0 then
		WriteLog("[Chi�n tr��ng b�o l�i]: H�m s� Get_Random_Player nh�n ���c s� ng��i c�a phe MS n�o �� l� 0");
		return 0;
	end;
	tPlayer = BT_GetMSPlayerIndex(nCamp);
	if nPlayerCount > nMSPlayerCount then	--���Ҫ��õ��������������Ŀǰ�������
		--��ô�ͷ��ص�ǰ���е����
		for i=1,nMSPlayerCount do	
			tSelectedPlayer[i] = tPlayer[i];
		end;
		return tSelectedPlayer;
	end;
	if getn(tPlayer) ~= nMSPlayerCount then
		WriteLog("[Chi�n tr��ng b�o l�i]: H�m s� Get_Random_Player trong tPlayer("..getn(tPlayer)..") l�n nh� so v�i nMSPlayerCount("..nMSPlayerCount..") kh�ng ��ng nh�t");
	end;
	for i=1,nPlayerCount do
		local nSel = random(1,getn(tPlayer));
		tSelectedPlayer[i] = tPlayer[nSel];
		tremove(tPlayer,nSel);
	end;
	if getn(tSelectedPlayer) ~= nPlayerCount then
		WriteLog("[Chi�n tr��ng b�o l�i]: H�m s� Get_Random_Player tr� ph�n h�i tSelectedPlayer("..getn(tSelectedPlayer)..") l�n nh� so v�i nPlayerCount("..nPlayerCount..") kh�ng ��ng nh�t");
	end;
	return tSelectedPlayer;
end;
--����Ŀ��NPC��֪����
function Create_Task_NPC(nCamp,sName)
	local tPosition = {};
	local nNpcCount = KNOWMAN_COUNT+1;	--������֪���˼�һ��Ŀ��NPC
	tPosition = Get_Position_Index(nCamp);	--tPosition���һ��Ԫ����Ŀ��NPC��λ������������nNpcCount��Ԫ��
	if getn(tPosition) ~= nNpcCount then
		WriteLog("[Chi�n tr��ng b�o l�i]: H�m s� Create_Task_NPC trong Get_Position_Index ph�n h�i table l�n nh� kh�ng ph�i"..nNpcCount..",��ng:"..getn(tPosition))
		for i=1,nNpcCount do	--�ݴ����п�����ͬһ��λ�ô������NPC
			tPosition[i] = random(1,g_PosCount);	
		end;
	end;
	local npcIndex = CreateNpc("V��ng An Th�ch",sName,MAPID,tNpcPos[tPosition[nNpcCount]][1],tNpcPos[tPosition[nNpcCount]][2],6,1,1,20);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);	--��¼Ŀ��NPC������
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\targetnpc_npc.lua");
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,sName);	--��¼Ŀ��NPC������
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	for i=0,9 do
		npcIndex = CreateNpc("Ho�n tr��ng Th� d�n",sName.."B�ch S� T�ng",MAPID,tNpcPos[tPosition[i+1]][1],tNpcPos[tPosition[i+1]][2]);
		SetMissionV(nIndexBase+i,npcIndex);
		SetNpcDeathScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\knowmandeath.lua");
	end;
end;
--�������NPC
function Clear_Task_NPC(nCamp)
	SetNpcLifeTime(GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp),0);	--ɾ��Ŀ��NPC
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,0);
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	local npcIndex = 0;
	for i=0,9 do
		npcIndex = GetMissionV(nIndexBase+i);
		if npcIndex ~= 0 then
			SetNpcDeathScript(npcIndex,"");	--�ÿ������ű�
			SetNpcLifeTime(npcIndex,0);	--ɾ��֪����
			SetMissionV(nIndexBase+i,0);
		end;
	end;
end;	
--�޸���Ӫ��������
function Modify_Task_Step(nCamp,nStep)
	local nCurStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	nCurStep = nCurStep + nStep;
	if nCurStep < 0 then
		nCurStep = 0;
	elseif nCurStep > MAX_TASK_STEP then
		nCurStep = MAX_TASK_STEP;
	end;
	SetMissionV(MV_SONG_TASKSTEP+nCamp-1,nCurStep);
	if nCurStep == MAX_TASK_STEP then
		return 1;	--��ʾ���Ѱ��������ʱӦ����������
	end;
	return 0;
end;
--�������һ������з�Ŀ��NPCͬ���ֵı���Ŀ��NPC����
function Create_Target_Name()
	local sName = "��i ph��ng NPC";
	for i=1,20 do
		sName = Create_Name();
		if sName ~= GetMissionS(MSTR_SONG_TARGETNAME) and sName ~= GetMissionS(MSTR_LIAO_TARGETNAME) then
			return sName;
		end;
	end;
	WriteLog("[Chi�n tr��ng b�o l�i]: Tu�n ho�n 20 l�n v�n ch�a t�m ra t�n th�ch h�p");
	return sName;
end;
--ѡ�����������������£����˶�
function Select_Task_Player(nCamp)
	local OldPlayerIndex = PlayerIndex;
	local tSelPlayer = Get_Random_Player(nCamp,SELECT_COUNT);
	if tSelPlayer == 0 then
		PlayerIndex = OldPlayerIndex;
		return 0;	--nCamp������Ϊ0
	end;
	local nSelPlayerCount = getn(tSelPlayer);
	if nSelPlayerCount > SELECT_COUNT then
		WriteLog("[Chi�n tr��ng b�o l�i]: Select_Task_Player h�m s� Get_Random_Player(nCamp,SELECT_COUNT) ph�n h�i sai, tSelPlayer l�n nh� l�:"..nSelPlayerCount);
	end;
	Clear_Task_Player(nCamp);
	for i=1,nSelPlayerCount do
		PlayerIndex = tSelPlayer[i];
		if PlayerIndex > 0 then
			local sName = GetName();
			BT_SetTempData(PTT_SELECTED,1);
			SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sName);	--��¼���ǵ�����
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--��ռ�¼������ֵ�MS����
function Clear_Task_Player(nCamp)
	for i=1,SELECT_COUNT do
		SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,"");	--�����
	end;
end;
--��������NPC
function Create_Header(nCamp)
	local nPosIndex = random(1,g_PosCount);
	local npcIndex = CreateNpc("V��ng An Th�ch","Th� l�nh th� d�n",MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2]);
	SetMissionV(MV_HEADER_APPEAR,npcIndex);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\header_npc.lua");
end;
--�õ�NPCλ�õ��������飬һ����11�������е�11����Ŀ��NPC��λ������
function Get_Position_Index(nCamp)
	local tResult = {};
	local nPosIndex = 0;
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_POS_INDEX_SONG_BEGIN;
	else
		nIndexBase = MV_POS_INDEX_LIAO_BEGIN;
	end;
	for i=0,10 do
		nPosIndex = Get_Right_Pos();
		SetMissionV(nIndexBase+i,nPosIndex);
		tResult[i+1] = nPosIndex;
	end;
	return tResult;
end;
--���һ�����õ�λ�����������ѭ����10�λ��Ҳ���һ�����ʵ�λ�������������������һ��ѭ����λ������
function Get_Right_Pos()
	local nPosIndex = random(1,g_PosCount);
	for j=1,10 do
		nPosIndex = random(1,g_PosCount);
		if Check_Position(nPosIndex) == 1 then
			return nPosIndex;
		end;
	end;
	WriteLog("[Chi�n tr��ng b�o l�i]: Tu�n ho�n 10 l�n v�n ch�a t�m ra v� tr� th�ch h�p");
	return nPosIndex;
end;
--����λ��������������λ���Ƿ���ã�����û�б��NPCռ�������λ��
function Check_Position(nPosIndex)
	for i=MV_POS_INDEX_SONG_BEGIN,MV_POS_INDEX_LIAO_END do
		if nPosIndex == GetMissionV(i) then
			return 0;
		end;
	end;
	return 1;
end;

tFirstName = {"L�","V��ng","Tr��ng","L�u","Tr�n","D��ng","Tri�u","Ho�ng","Chu",
			  "Chu","Cao","L�m","H�","Qu�ch","M�","La ","L��ng","T�ng","Tr�nh",
			  "T�","H�n","���ng","Ph�ng","Vu","��ng","Ti�u","Tr�nh","T�o","Vi�n",
			  "��ng","H�a","Ph�","Th�m","T�ng","B�nh","L�","T�","L�"," T��ng",
			  "Th�i","Gi�","�inh","Ng�y","Ti�t ","Di�p","Di�m","Xa","Phan","��t ",
			  "��i","H�","Chung","U�ng","�i�n","Nhi�m","Kh��ng","Ph�n ","Ph��ng ","Th�ch",
			  "Di�u","��m","Li�u","Tr�u","G�u"," Kim ","L�c","H�ch","Kh�ng","B�ch",
			  "Th�i","khang","Mao","Kh�u","T�n","Giang","S�","C�","H�u","Thi�u",
			  "M�nh","Long","V�n ","�o�n","Ch��ng","Ti�n","Thang","Do�n","L�"," D�ch ",
			  "Th��ng","V� ","�n","H�","L�i","Cung","T�n","Ng�","T�","T�n",
			  "B� ",
			 };
nFirstNameSize = getn(tFirstName);
tSecondName = {"ba","b�n","Ng� ","L�m","�i�n","Th�ch","B�ch","khang","Qu�nh","Giang",
				"Minh","Ch��ng","V� ","Ki�u","T�n","C�t","Tr�","Ch� ","D��ng","��t","Thanh",
				"To�n","Huy","B�n","Si�u","phi","V�","L��ng","Ki�n","Ho�ng","�","H�o",
				"Khanh","Quy�n","Qu�","D�ng","Phong","h�i","B�ng","T�ng","Thi�n","V�n ","Xu�n",
				"Anh","c�nh","S�u","Ti�m","H��ng","Th�m","Ho�n ","Ch�n","B�","Tr�c","Nguy�n",
				"Xung","To�n","Hy","Ch�y","Ti�n","��","Nhu�n","Ki�m","hai"

			  };
ntSecondNameSize = getn(tSecondName);
--����tFirstName��tSecondName�������һ������
function Create_Name()
	local sName = "";
	sName = tFirstName[random(1,nFirstNameSize)]..tSecondName[random(1,ntSecondNameSize)];
	return sName;
end;
--ת����һ��Ѱ������
function Go_To_Next_Step(nCamp)
	local sName = "";
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,0);	--����NPC����
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,0);		--����NPC״̬Ϊ��ƽ״̬
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,0);	
	
	BT_SetCampTempValue(nCamp,PTT_SELECTED,0);	--�����Ӫ������ҵġ����ˡ����
	
	if nCamp == SONG_ID then
		SetMissionV(MV_SONG_KILL_SONG,0);
		SetMissionV(MV_LIAO_KILL_SONG,0);		
	else
		SetMissionV(MV_SONG_KILL_LIAO,0);
		SetMissionV(MV_LIAO_KILL_LIAO,0);
	end;
	Clear_Task_NPC(nCamp);
	if Select_Task_Player(nCamp) == 0 then	--֮ǰ��������Ϊ0
		Clear_Task_Player(nCamp);	
		SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--�����ÿգ��Ա�����������ҿ������¿�ʼ��
		return "";
	end;
	sName = Create_Target_Name();
	Create_Task_NPC(nCamp,sName);
	local sContent = "";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	Msg2MSGroup(MISSION_ID,"Doanh tr�i c�p b�o: Nghe n�i "..sName.."  c� th� bi�t tung t�ch th� l�nh. M�i "..sContent.." nhanh ch�ng ph�n t�n �i t�m B�ch S� Th�ng. Hi�n phe ta nh�n ���c s� t�n nhi�m c�a Th� d�n l� "..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"T��ng s� nh�n nhi�m v� phe T�ng l�: "..sContent)
	else
		Msg2MSAll(MISSION_ID,"T��ng s� nh�n nhi�m v� phe Li�u l�: "..sContent)
	end;
	Tips_To_Selected_Player(nCamp);
	return sName;
end;
--��ѡ�е��˷�TIPS
function Tips_To_Selected_Player(nCamp)
	local nOldPlayerIndex = PlayerIndex;
	local tPlayer = BT_GetMSPlayerIndex(nCamp);
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if BT_GetTempData(PTT_SELECTED) == 1 then
			TaskTip("Nguy�n so�i c� l�nh, ng��i mau t�m"..GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1));
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--�������һ��Ѱ������
function Reach_Final_Step(nCamp)
	if GetMissionV(MV_HEADER_APPEAR) == 0 then
		Msg2MSAll(MISSION_ID,"Th�m m� h�i b�o: Th� l�nh �� xu�t hi�n, c�c v� t��ng s� mau ch�ng t�m ra!");
		Create_Header();
	end;
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"Phe T�ng �� ho�n th�nh c�c b��c, c� th� ��i tho�i v�i th� l�nh.");
	else
		Msg2MSAll(MISSION_ID,"Phe Li�u �� ho�n th�nh c�c b��c, c� th� ��i tho�i v�i th� l�nh.");
	end;
	Say("<color=green>"..GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp).."<color>: Nghe n�i th� l�nh �� xu�t hi�n, ng��i t�m trong th�n xem!",0);
	Clear_Task_NPC(nCamp);
end;
--�ǲ��Ǳ�ѡ����Ǽ�����
function Is_The_Selected(nCamp)
	if BT_GetCamp() == nCamp and BT_GetTempData(PTT_SELECTED) == 1 then
		return 1;
	else
		return 0;
	end;
end;
