-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������Ʒ���������̻�Script
-- By StarryNight
-- 2007/06/12 AM 10:43

-- ����仯��̫�죬��ϧֻ���޻�̸֮��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nMapName = "";
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = 0,0,0,0,0;
local mapID,xPos,yPos = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {};

	--�ж�������
	if GetTask(TASK_XB_ID) == 19 then
	
		nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
		nMapName = Map_Data[nMapDataID][1];
		nMapID = Map_Data[nMapDataID][2];
		nXworldpos = Map_Data[nMapDataID][3];
		nYworldpos = Map_Data[nMapDataID][4];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];
		
		--�ж�Ŀ��ص��Ƿ���ȷ
		if nMapID == mapID and ((nXworldpos - 50) <= xPos ) and (xPos <=(nXworldpos + 50)) and ((nYworldpos - 50) <= yPos ) and (yPos<=(nYworldpos + 50)) then
			DelItem(2,0,692,1);
			DoFireworks(808,1);--�̻�Ч��
			nNpcIndex = CreateNpc("Vi�n Phi V�n ","Danh b� Vi�n Phi V�n ",nMapID,nXworldpos,nYworldpos);
			SetNpcLifeTime(nNpcIndex,1200);
			SetNpcScript(nNpcIndex,"\\script\\������\\���踮\\npc\\Ԭ����.lua");
			SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--��¼Ԭ����NpcIndex
		else			
			strTalk = {
			"Theo nh� l�i B�ch Hi�u Sinh ti�n b�i, Vi�n b� ��u hi�n �ang � g�n "..nMapName.."("..nXpos..", "..nYpos.."), s� d�ng Ph�o hi�u L�c Phi�n m�n l� c� th� g�p nhau r�i.",
				}
			TalkEx("",strTalk);
		end
	
	
	else
		strTalk = {
			"Ph�o hi�u n�y d��ng nh� ch�ng c� t�c d�ng g�, n�n v�t �i �� �� chi�m ch�.",
				}
		TalkEx("",strTalk);
		DelItem(2,0,692,1);
	end		

end
