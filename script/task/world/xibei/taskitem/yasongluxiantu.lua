-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������ƷѺ��·��ͼScript
-- By StarryNight
-- 2007/06/12 PM 3:15

-- û��ԭ�򣬺���һ��������ֱ�

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
local nStep_XBTask = GetTask(TASK_XB_ID);

	--�ж�������
	if nStep_XBTask >= 20 and nStep_XBTask <= 23 then
	
		nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
		nMapName = Map_Data[nMapDataID][1];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];
		
		--��δȡ����Ļ��
		if nStep_XBTask <= 22 or GetItemCount(2,0,694) <= 0 then
			strTalk = {
				"Theo b�n �� ���ng �i c�a Vi�n b� ��u, �o�n �p t�i S�t th� Oa Oa ch�c ch�n s� �i ngang "..nMapName.."("..nXpos..", "..nYpos..") n�y. N�u v�n ch�a t�m ���c ��n kh�i d�ng khi c��p t� nh�n, h�y mau t�i Ph�ng T��ng t�m Di�p l�o.",
				}
			TalkEx("",strTalk);
		else
			strTalk = {
				"Theo b�n �� ���ng �i c�a Vi�n b� ��u, �o�n �p t�i S�t th� Oa Oa ch�c ch�n s� �i ngang "..nMapName.."("..nXpos..", "..nYpos..") n�y. Nay �� c� ���c ��n kh�i n�n mau ch�ng �i c�u S�t th� Oa Oa. ",
				}
			TalkEx("",strTalk);
		end
	else
		strTalk = {
			"S�t th� Oa Oa �� ���c c�u, b�n �� n�y c�ng ch�ng c�n t�c d�ng n�a, n�n v�t �i �� tr�ng ch�.",
				}
		TalkEx("",strTalk);
		DelItem(2,0,693,1);
	end		

end
