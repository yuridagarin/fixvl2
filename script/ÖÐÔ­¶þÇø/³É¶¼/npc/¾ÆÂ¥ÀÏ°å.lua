
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��¥�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

--*****************************************���峣����Ԥ����*********************************

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv58\\task_main.lua");
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")
LEVELTASKID49=516					--����������
TASK_GATHER_FLAG=1931 		--������Ʒ�ɼ���ʾ

strName = "";
strTitle = "";
--*****************************************MAIN����*****************************************
function main()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
		local nState = TE_GetTeachState()
		local nLevel = GetLevel()

----------------------------------------------���Ի�-----------------------------------------------		
		if (nState==12) then
			task_012_00();
			return
		end
		
		if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,378) < 1 then
		--���ɶ���¥�ϰ���������
		buy_gift_talk(5);
		return
	end
	local sal_num = 97
	if dragon_boat_08_time_chk() ~= 1 then
		sal_num = 98
	end
	local tSel = {
--		"����Щ���Ӳ���/#Sale("..sal_num..")",
		"Ta ch� �i ngang th�i/end_dialog"
	}
	Say("<color=green>Ch� T�u l�u<color>: R��u v� th�c �n � ch� ta r�t ngon, c�n c� nguy�n li�u l�m b�nh �t n�a, kh�ch quan c� mu�n gh� qua kh�ng?",
		getn(tSel), tSel)
end;

