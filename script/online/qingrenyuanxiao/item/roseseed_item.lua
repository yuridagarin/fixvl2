--filename:roseseed_item.lua
--create date:2006-01-19
--author:yanjun
--describe:õ�廨����
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse()
	local selTab = {
				"��ng r�i./plant",
				"Ta suy ngh� l�i!/nothing"
				}
	Say("B�n mu�n tr�ng h�t hoa h�ng �?",2,selTab)
end

function plant()
	local OldPlayerIndex = PlayerIndex
	if GetTask(TASK_ROSE_LIFE) ~= 0 and GetTime() - GetTask(TASK_ROSE_LIFE) <= ROSELIFE then
		Say("B�n �� tr�ng 1 ��a hoa, h�y c� g�ng ch�m s�c n�.",0)
		return 0
	end
	if GetItemCount(2,0,351) == 0 then
		Say("B�n mu�n t��i n��c nh�ng sao kh�ng mang {L� th�y} v�y?",0)
		return 0
	end 
	if IsLoversTeam() == 1 then
		if GetSex() == 1 then
			if DelItem(2,0,352,1) == 1 then
				if DelItem(2,0,351,1) == 1 then
					local nameMale,nameFemale = GetLoversName()		
					local MapID,MapX,MapY = GetWorldPos()
					local npcRoseIndex = CreateNpc("M�m hoa h�ng","��"..nameFemale.." cho ra hoa h�ng non",MapID,MapX,MapY)
					SetNpcLifeTime(npcRoseIndex,ROSELIFE)
					for i=1,2 do
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_ROSE_LIFE,GetTime())
						SetTask(TASK_ROSE_GROW,0)
						SetTask(TASK_ROSE_INDEX,npcRoseIndex)
						Say("Trong khi tr�ng hoa, kh�ng ���c c�ng ng��i ch�i kh�c tr�ng th�m, n�u kh�ng hoa h�ng kh�ng th� tr� b�ng.",0);
					end
					PlayerIndex = OldPlayerIndex
					SetNpcScript(npcRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
				end
			end
		else
			Say("Hoa h�ng ch� c� th� do nh�n v�t nam tr�ng, nh�n v�t n� h�i.",0)
		end
	else
		Say("��i h�u c�a ng��i ��u? Ph�i 2 ng��i m�i tr�ng ���c hoa h�ng! ��y kh�ng ph�i ��i h�u ban ��u, hai ng��i ph�i chung th�y m�i tr�ng ���c hoa h�ng.",0)
	end
end

function nothing()

end