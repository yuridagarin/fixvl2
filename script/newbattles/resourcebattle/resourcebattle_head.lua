Include("\\script\\newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\resourcebattle\\position.lua");
		
MAX_RESOURCE_COUNT = 110;
		
BATTLE_TYPE = RESOURCE_ID;	--ս������

ENTRANCE_POINT = 	--�����
{
	[SONG_ID] = {MAPID_SONG,1572,3555},
	[LIAO_ID] = {MAPID_LIAO,1766,3182},
};

DIGGING_ACTION_ID = 890;	--�����ݶ���ID

DEATH_SCRIPT = "\\script\\newbattles\\resourcebattle\\playerdeath.lua";

CATERAN_GROUP_SONG = 23;	--ɽ��NPC������
CATERAN_GROUP_LIAO = 24;

CATERAN_COUNT = getn(tCateranSong);

TOE_MAX_USE_TIMES = 45;	--��ͷ���ʹ�ô���

--�õ������Դ
function Get_Random_Resource(nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	local nCamp = BT_GetCamp();
	local nRandomNum = random(1,100);
	if nRandomNum <= 60 then
		Get_Resource(1,nMultiple);	--��������
	elseif nRandomNum <= 80 then
		Get_Resource(2,nMultiple);	--�м�����
	elseif nRandomNum <= 90 then
		Msg2MSGroup(MISSION_ID,"Ng��i ch�i"..GetName().."t�i Nh�n M�n Quan-Th�o c�c chi�n ��o b�i b�a b�i �nh h��ng ��n m�i tr��ng n�n b� th� d�n truy �u�i, ch� t��ng s� ��n gi�i c�u.",nCamp);
		local npcIndex = CreateNpc("Ho�n tr��ng Th� d�n","Th� d�n h� r�ng",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\environmentalist_death.lua");
	else
		Msg2Player("Ng��i v�t v� ��o b�i v�n kh�ng t�m ���c g�");
	end;
end;
--�õ�ĳ�̶ֹ���Դ
function Get_Resource(nType,nMultiple)
	if nMultiple == nil then
		nMultiple = 1;
	end;
	AddItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nMultiple);
	Msg2Player("B�n nh�n ���c "..nMultiple.." ph�n"..tBattleItem[nType][1]);
end;
--��������
function Add_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)+nResNum);
end;
--���ݼ���
function Dec_Resource(nCamp,nResNum)
	SetMissionV(MV_RESOURCE_SONG+nCamp-1,GetMissionV(MV_RESOURCE_SONG+nCamp-1)-nResNum);
	if GetMissionV(MV_RESOURCE_SONG+nCamp-1) < 0 then
		SetMissionV(MV_RESOURCE_SONG+nCamp-1,0);
	end;
end;
--�õ����ݵ�����
function Get_ResCount(nCamp)
	return GetMissionV(MV_RESOURCE_SONG+nCamp-1);
end;
--������NPC����õ�����NPC��λ������
--function Get_ResIndex_ByPos2(nMapX,nMapY)	
--	local nX = ceil(floor(abs((abs(nMapX-1605)-1))/7)/2);	--�����û�кú÷������������µĸ��ӹ�ʽ
--	local nY = ceil(floor(abs((abs(nMapY-3240)-1))/13)/2);
--	return 11*nX+nY+1;
--end;
--������NPC����õ�����NPC��λ������
function Get_ResIndex_ByPos(nMapX,nMapY)
	local nX = floor((nMapX-1598)/14);	--�����ʽ������
	local nY = floor((nMapY-3227)/26);
	return 11*nX+nY+1;
end;
--������NPC��λ�������õ�����NPC������
function Get_ResPos_ByIndex(nIndex)
	local nMapX,nMapY = 0,0;	
	nMapX = floor((nIndex-1)/10)*14+1605;
	nMapY = mod((nIndex-1),10)*26+3240;
	return nMapX,nMapY;
end;
--ˢ����������
function Reflash_Res()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return
	end;
	local nGroup,nBit = 0,0;
	for i=1,MAX_RESOURCE_COUNT do
		nGroup = floor(i/32);
		nBit = mod((i-1),32)+1;
		if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,0));
		end;
	end;
end;
--��������NPC
function Create_Res_Npc(nCount)
	if nCount <= 0 then
		return
	end;
	if nCount == nil then
		nCount = 1;
	end;
	for i=1,nCount do
		local nRandPos = random(1,MAX_RESOURCE_COUNT);	
		local nMapX,nMapY = Get_ResPos_ByIndex(nRandPos);
		local npcIndex = CreateNpc("Khu v�c l��ng th�o cao c�p","L��ng th�o",MAPID,nMapX,nMapY,-1,1,1,20);
		SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\resource_npc.lua");
	end;
end;
--���������
function Create_QuarterMaster()
	local sCampName1,sCampName2 = "M� L��ng Quan-T�ng","M� l��ng quan phe Li�u";
	if GetGlbValue(RANDOM_PLACE) == 1 then
		sCampName1 = "M� l��ng quan phe Li�u";
		sCampName2 = "M� L��ng Quan-T�ng";
	end;
	local npcIndex = CreateNpc("V��ng An Th�ch",sCampName1,MAPID,1607,3494);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\quartermaster_npc.lua");
 	npcIndex = CreateNpc("V��ng An Th�ch",sCampName2,MAPID,1720,3248);
	SetNpcScript(npcIndex,"\\script\\newbattles\\resourcebattle\\quartermaster_npc.lua");
end;
--����һ��ɽ���ٺ�Ӫ�¼�
function Create_Cateran_Even()
	local nSongStone = GetMissionV(MV_STONE_COUNT_SONG);
	local nLiaoStone = GetMissionV(MV_STONE_COUNT_LIAO);
	if nSongStone > nLiaoStone then
		Msg2MSAll(MISSION_ID,"Huy�n thi�t kho�ng th�ch ��i b�n giao n�p v�ng n�y l�: T�ng"..nSongStone.." , Li�u "..nLiaoStone..", h�u doanh Li�u xu�t hi�n ��m s�n t�c �ang c��p b�c l��ng th�o.");
		Create_Cateran(SONG_ID,CATERAN_COUNT);
	elseif nSongStone < nLiaoStone then
		Msg2MSAll(MISSION_ID,"Huy�n thi�t kho�ng th�ch ��i b�n giao n�p v�ng n�y l�: T�ng"..nSongStone.." , Li�u "..nLiaoStone..", h�u doanh T�ng xu�t hi�n ��m s�n t�c �ang c��p b�c l��ng th�o.");
		Create_Cateran(LIAO_ID,CATERAN_COUNT);
	else
		Msg2MSAll(MISSION_ID,"Huy�n thi�t kho�ng th�ch ��i b�n giao n�p v�ng n�y ��u l�"..nSongStone..", ��m s�n t�c d��ng nh� ch�a c� ��ng t�nh");
	end;
	SetMissionV(MV_STONE_COUNT_SONG,0);
	SetMissionV(MV_STONE_COUNT_LIAO,0);
	SetMissionV(MV_CHANGEDRUMLEFT_SONG,DRUM_COUNT)	--��ʼ��ս������
	SetMissionV(MV_CHANGEDRUMLEFT_LIAO,DRUM_COUNT)	--��ʼ��ս������
end;
--������Ӫɽ��
function Create_Cateran(nCamp,nCount)
	local tPosTable = {tCateranSong,tCateranLiao};
	local nEnemyCamp = 3 - nCamp;
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = tPosTable[3-nCampPlace];
	if nCount > getn(tPos) then
		BT_ShowDebugInfor("Create_Cateran b�o l�i, tham s� nCount phi ph�p");
		return 0;
	end;
	local nNpcIndex = 0;
	for i=1,nCount do
		nNpcIndex = CreateNpc("S�n t�c l�u la","S�n t�c ("..tCampNameZ[nCamp]..")",MAPID,tPos[i][1],tPos[i][2]);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\resourcebattle\\cateran_death.lua");
		AddGroupUnit(CATERAN_GROUP_SONG+nCamp-1,nNpcIndex);
	end;
	SetMissionV(MV_SP_TIMER_LOOP,CATERAN_TIMER_LOOP);	--60�������¼�
	SetMissionV(MV_SP_TIMER_STATE,TM_STATE_CATERAN_SONG+nCamp-1);
	StartMissionTimer(MISSION_ID,CATERAN_TIMER_ID,CATERAN_TIME);
	Msg2MSGroup(MISSION_ID,"T�nh hu�ng kh�n c�p: H�u doanh phe ta xu�t hi�n nhi�u s�n t�c, n�u kh�ng k�p th�i ng�n ch�n, 15 gi�y sau kho l��ng s� b� t�n th�t nghi�m tr�ng.",nEnemyCamp);
end;

function Use_Hoe()
	BT_SetData(PTNC_USE_HOE_TIMES,BT_GetData(PTNC_USE_HOE_TIMES)+1);
	if BT_GetData(PTNC_USE_HOE_TIMES) >= TOE_MAX_USE_TIMES then
		DelItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1);
		Msg2Player("Cu�c c�a b�n �� h�ng!");
		return 1;	--����
	end;
	Msg2Player("Cu�c c�a b�n c�n s� d�ng ���c "..(TOE_MAX_USE_TIMES-BT_GetData(PTNC_USE_HOE_TIMES)).." l�n");
	return 0;	--��������
end;