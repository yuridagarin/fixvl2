
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ϵͳ���԰����ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- �ȴ����ϣ�ӭ�Ӱ���
-- �����ɨ��������
-- ��̫������Ѱ�ҷ���
-- ���ĺ��ǣ���Ѫ����
-- ����������˭����
-- ��˵��ã���˵����
-- �����磬ǧ������

-- ======================================================

-- ������������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");

MAIN_TITLE = "<color=green>D��i ��y l� nh�ng s� ki�n b�n �� tr�i qua. H�y ch�n s� ki�n b�n mu�n xem!<color>"
MAIN_EXIT = "Tho�t/pack_exit"
MAIN_BACK = "Quay l�i/main"

function main()

local i=0;
local aryTotalEvent = CTask:EnumTotalEvent();
local aryLiveEvent = {}
local nEventID = 0;
local strShowText = "";

	for i=1, getn(aryTotalEvent) do
		nEventID = aryTotalEvent[i][1];
		if aryTotalEvent[i][2]==1 then
			strShowText = CTask:GetEventText(nEventID).."/#showlist("..nEventID..")";
			rawset(aryLiveEvent,
					getn(aryLiveEvent)+1,
					strShowText);
		end;
	end;
	
	tinsert(aryLiveEvent,1,MAIN_TITLE);
	tinsert(aryLiveEvent,getn(aryLiveEvent)+1,MAIN_EXIT);
	
	CTask:SayEx(aryLiveEvent);
	
end;


function showlist(eventID)

local strMain = "Trong s� ki�n"..CTask:GetEventText(eventID)..", b�n c� nh�ng tr�i nghi�m nh� sau: <enter><enter>";
local aryTask = CTask:EnumEventTask(eventID)
local strTaskText = "";
local strShowText = "";

local strNever = "  <color=red>Ch�a b�t ��u<color>";
local strNow = "  <color=green>�ang ti�n h�nh<color>";
local strEnd = "  <color=yellow>�� ho�n th�nh<color>";

local strConnect = "";

local i=0;

	for i=1, getn(aryTask) do
		strTaskText = CTask:GetTaskTipText(aryTask[i][1]);
		
		if aryTask[i][2]==0 then strConnect = strNever end;
		if aryTask[i][2]==1 then strConnect = strNow end;
		if aryTask[i][2]==2 then strConnect = strEnd end;
		
		strShowText = strShowText..strTaskText..strConnect.."<enter>";
		
	end;
	
	Say(strMain..strShowText,2,MAIN_BACK,MAIN_EXIT);
	
end;


function pack_exit()

end;