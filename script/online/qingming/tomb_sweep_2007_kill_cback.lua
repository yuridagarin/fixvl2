--�ű�����2007�����ڻɱ�ֵ��ýű�
--�ű����ܣ�2007�������ڻɱ����ɺ����ز���
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-20
--�����޸ļ�¼��
tomb_sweep_2007_task_reel_step = 858				--��ǰ�����裨ɱ�֣�
function monster_killed()
	SetTask(tomb_sweep_2007_task_reel_step,1)
	TaskTip("Nh�c nh�: B�n �� ho�n th�nh nhi�m v� c� th� t�m th� l�ng nh�n nh�n th��ng!")
	for i = 900,903 do
		local trigger_ID = GetTrigger(i)
		if trigger_ID ~= 0  then
			RemoveTrigger(trigger_ID)
		end
	end
end
