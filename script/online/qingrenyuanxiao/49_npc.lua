--filename:49_npc.lua
--create date:2006-01-21
--author:yanjun
--describe:��ͯ�����ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	if CanAcceptTask(TASK_LOVESTORY1,4) == 1 then
		Talk(5,"gethzmty","T� C�u, b� ngoan kh�ng ���c n�i d�i, �� c� l�y Kim Lan thi�p c�a L��ng thi�u gia kh�ng?",
				"��ng v�y!",
				"V�y ��a cho ta nh�, ta tr� l�i cho L��ng thi�u gia.",
				"Kh�ng ���c ��u. C�c huynh (t�) mua <color=red>Ch� m� �en<color> cho ��, �� ��a l�i <color=red>Kim Lan thi�p<color> cho.",
				"���c, <color=yellow>C�n ��<color> ngo�i th�nh ch�c c�.")
		local OldPlayerIndex = PlayerIndex
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			SetTask(TASK_LOVESTORY1,5)
			CreateTrigger(0,1204,3112)	--��ֵ���֥����Բ������
			TaskTip("��nh C�n �� ngo�i th�nh l�y ch� m� �en.")
		end
		PlayerIndex = OldPlayerIndex
	elseif CanAcceptTask(TASK_LOVESTORY1,5) == 1 then
		if DelItem(2,0,355,1) == 1 then
			Talk(2,"","Haha, ��y ��ng l� ch� m� �en m� �� th�ch, Kim Lan thi�p n�, c�c huynh (t�) l�y �i.",
					"�� th�t l� tinh ngh�ch!")
			AddItem(2,0,356,1)
			local OldPlayerIndex = PlayerIndex
			for i=1,2 do
				PlayerIndex = GetTeamMember(i)
				SetTask(TASK_LOVESTORY1,6)
				RemoveTrigger(GetTrigger(3112))	--ɾ����ֵ����Ǻ�«������
				TaskTip("��a Kim Lan thi�p cho L��ng S�n B�")
			end
			PlayerIndex = OldPlayerIndex
		else
			Say("C�c huynh (t�) mua <color=red>ch� m� �en<color> cho ��, �� tr� l�i <color=red>Kim Lan thi�p<color> cho.",0)
		end	
	else
		Say("Ch� m� �en th�t l� ngon!",0)
	end
	
	if AllTaskComplete() ==1 then
		TaskTip("H�y ��n Nguy�t l�o l�nh th��ng.")
		Msg2Player("Cu�i c�ng �� gi�p Nguy�t l�o t�c h�p cho 4 c�p t�nh nh�n, h�y mau g�p Nguy�t l�o l�nh th��ng.")
	end
end
