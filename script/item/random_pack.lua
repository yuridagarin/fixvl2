-- �����������ͷ�ļ�
Include("\\script\\task\\random\\task_head.lua");

function OnUse()

local nState         = GetTask(TASKSTATE_ID);

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- �õ����� NPC ���ڵ�ͼID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- �õ����� NPC ������
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- �õ����� NPC ���ڵ�ͼ������


	if nState==1 then
		ShowTaskNpcByPack();
		return	
	elseif nState==2 then
		Say("H�y ho�n th�nh nhi�m v� "..strNpcMap.."-"..strNpcName.." giao cho ng��i!"..GetTaskClearInfo(),0);
		return
	else
		Say("S� ph� hi�n ch�a c� nhi�m v� m�i n�o giao cho b�n.", 0);
		return
	end;

end;


-- ����������� NPC ��λ��
function ShowTaskNpcByPack()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- �õ����� NPC ���ڵ�ͼID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- �õ����� NPC ������
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- �õ����� NPC ���ڵ�ͼ������

local strBossName    = FactionBossName[GetPlayerFaction()];
local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B�n nh�n ���c b� c�u ��a th� c�a"..strBossTitle.."{b� c�u ��a th�}"..strBossName.."nh� b�n ��n <color=yellow>"..strNpcMap.."<color> t�m <color=yellow>"..strNpcName.."<color>, ng��i n�y c�n s� gi�p �� c�a b�n, ��ng th�i d�n b�n d� th� n�o c�ng ph�i ho�n th�nh nhi�m v� ���c giao!",
		2,
		"��n n�i l�m nhi�m v�/#AcceptTask("..nNpcMapID..")",
		"��ng/Main_Exit");
end;