-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC���������Script
-- By StarryNight
-- 2005/01/09 PM 15:38

--ũ����վ���ˣ��Ժ󿴲���ͨʤ�ˡ�����

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv80\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>�o�n T� Thu�n<color> : "
function main()
	selTab =
	{ 
		"Nhi�m v� Chuy�n Sinh - C�i L�o Ho�n ��ng/trans_talk_35",
		"Ta ch� gh� qua/no_thing"
	}
	Say("<color=green>Nh� Ho�ng T�<color>".." Nhi�m v� ti�u di�t h�n ma L�nh H��ng L�ng!",getn(selTab),selTab);
	
local nTask_DL_State_80 = GetTask(TASK_DL_LV80_ID);
--print("nTask_DL_State_80:"..nTask_DL_State_80)
	
	--��ܶγж���������ӶԻ�
	if nTask_DL_State_80 == 2 then
		task_000_00();
		return
	end
	
--	local strTalk = {
--		"��ng gh�t! C�n ph�i � n�i qu� �m n�y bao l�u n�a!",
--		}
--	TalkEx("",strTalk); 
	return
end

function no_thing()
end