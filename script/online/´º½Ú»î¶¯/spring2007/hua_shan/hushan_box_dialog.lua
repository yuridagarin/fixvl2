--�������-��ɽ����-��ɽ����Ի��ű�
--��߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-23
--�޸ļ�¼��
--============================��������������===============================
--�Թ󴺹����ļ�
Include("\\script\\online\\zgc_public_fun.lua")
--================================���߼�===================================
function main()
	local box_index = GetTargetNpc()
	SetGlbValue(501,box_index)
	local task_start_time =	66600
	local time_diff = task_start_time - Zgc_pub_today_sec_num_rtn()
	if GetPlayerRoute() == 0 then
		Msg2Player("Ng��i ch�a gia nh�p m�n ph�i kh�ng th� m� b�o r��ng!")
		return
	end
	if spring_2007_date_chk() == 0 then
		return
	end
	if time_diff > 0 then
		Talk(1,"","H�i Hoa S�n v�n ch�a b�t ��u, c�n "..Zgc_pub_time_sec_change(time_diff,0).." m�i c� th� m� b�o r��ng!")
		return
	end
	if GetUnitCurStates(box_index,4) >= zgc_pub_day_turn(1) then
		Talk(1,"","Ho�t ��ng Hoa S�n h�m nay �� k�t th�c, ng�y mai l�i ��n nh�!")
		return
	end
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end
	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > 30 then
		SetUnitCurStates(box_index,1,GetTime())
		SetUnitCurStates(box_index,2,1)
		DoWait(1,2,30)				--�������
	else
		Talk(1,"","Hi�n �� c� ng��i s� d�ng <color=red>Hoa S�n b�o r��ng<color>.")
		return
	end
end
