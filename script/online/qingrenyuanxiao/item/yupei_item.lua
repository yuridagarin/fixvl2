--filename:yupei_item.lua
--create date:2006-01-22
--author:yanjun
--describe:����ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
function OnUse()
	if CanAcceptTask(TASK_LOVESTORY3,5) == 1 then
		local MapID,MapX,MapY = GetWorldPos()
		if MapID == 306 and GetItemCount(2,0,353) >= 1 then
			local timeleft = 21*60+4 - GetTime() + GetTask(TASK_USE_YUPEI)
			if GetTask(TASK_USE_YUPEI) == 0 or timeleft < 0 then
				if DelItem(2,0,354,1) == 1 then
					local npcIndex = CreateNpc("Qu� V�c L�o L�o","Qu� V�c L�o L�o",MapID,MapX,MapY,-1,1,1,100)
					SetNpcScript(npcIndex,"\\script\\online\\qingrenyuanxiao\\guiyulaolao_npc.lua")
					--NpcChat(npcIndex,"�����ɳ�����Ȼ���������ң��ף�����������˭��")
					OldPlayerIndex = PlayerIndex
					for i=1,2 do
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_USE_YUPEI,GetTime())
						TaskTip("mang Y�n X�ch H� b�o ki�m ��nh b�i Qu� V�c L�o L�o")
					end
					PlayerIndex = OldPlayerIndex
				end
			else
				Say("Ng�c b�i kh�ng th� s� d�ng li�n t�c, b�n h�y ch�"..timeleft.." gi�y m�i c� th� s� d�ng ti�p.",0)
			end
		else
			Say("Ng�c b�i ch� c� th� s� d�ng � Giang T�n th�n, ��ng th�i ph�i mang Y�n X�ch H� b�o ki�m.",0)
		end
	else
		Say("Kh�ng th� s� d�ng ng�c b�i",0)
	end
end