--filename:chocolate_item.lua
--create date:2006-01-19
--author:yanjun
--describe:�ɿ������߽ű�
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110214 or nDate > 110220 then
		Talk(1, "", "S�c�la �� h�t h�n s� d�ng!")
		return
	end
	if IsLoversTeam() == 1 then
		if GetSex() ~= 1 then
			Say("Ch� c� nam nh�n m�i ���c ph�p s� d�ng.",0)
			return 0
		end
		local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
		if (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) then
			Talk(1,"","S�c�la ch� c� th� s� d�ng � 7 ��i th�nh th�!")
			return	
		end
		local nOldPlayerIndex = PlayerIndex
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if GetPlayerRoute() == 0 or GetLevel() < 77 then
				Talk(1, "", "Ch� c� nh�n v�t c�p 77 tr� l�n �� gia nh�p m�n ph�i m�i c� th� tham gia ho�t ��ng n�y!")
				return
			end
			local nDate = tonumber(date("%y%m%d"))
			local nUsedDate = floor(GetTask(TSK_VALENTINE_USE_FLAG_2011) / 100)
			if nDate ~= nUsedDate then
				SetTask(TSK_VALENTINE_USE_FLAG_2011, nDate * 100)
			end
			
			local nGetUsed = mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 10)
			if nGetUsed >= 4 then
				gf_Msg2Team("C� ng��i trong t� ��i c�a b�n �� s� d�ng S�c�la �� 4 l�n trong ng�y, kh�ng th� s� d�ng th�m!")
				return
			end
			
			local nUsedExp = GetTask(TSK_VALENTINE_USED_EXP_2011)
			if nUsedExp >= 28000000 then
				Talk(1, "", "B�n �� s� d�ng S�c�la ��t t�i �a s� �i�m kinh nghi�m cho ph�p, kh�ng th� s� d�ng th�m!")
				return
			end
		end
		PlayerIndex = nOldPlayerIndex
		
		if GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011) ~= 0 then
			Talk(1,"","B�n �ang s� d�ng S�c�la r�i, h�y ch� ��n khi s� d�ng xong!")
			return
		end
		
		if DelItemByIndex(nItemIdx, 1) == 1 then
			local nOldPlayerIndex = PlayerIndex
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				CreateTrigger(1, TRIGGER_TB_DEFINE_VALENTINE_2011, TRIGGER_USER_DEFINE_VALENTINE_2011);
	        		ContinueTimer(GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011))
	        		
	        		local nTimes = floor(mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 100) / 10)
	        		SetTask(TSK_VALENTINE_USE_FLAG_2011, GetTask(TSK_VALENTINE_USE_FLAG_2011) - (nTimes * 10) + 1)
	        		gf_WriteLogEx("Valentine 2011", "s� d�ng S�c�la")
	        	end
	        	local nOldPlayerIndex = PlayerIndex
		end
	else
		Say("2 ng��i kh�c ph�i t� ��i m�i c� th� �n S�c�la.",0)
	end		
end		
		--��2�ֽ����������ҵ����Ƿ�ʹ�ù��ɿ���
--		local nDay = tonumber(date("%d"))
--		if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),2) < nDay then
--			SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3,0))
--		end
--		
--		local qklleft = 7 - GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3)
--		if qklleft <= 0 then
--			Say("H�m nay b�n �� s� d�ng 7 thanh chocola, ng�y mai h�y s� d�ng ti�p nh�!",0)
--			return 0
--		end
--		
--		local selTab = {
--			"��ng �/ok",
--			"H�y b�/cancel"
--		}
--		Say("Tr��c khi �n, h�y x�c nh�n b�n v� ��i h�u �� k�t th�nh h�o h�u ch�a? N�u kh�ng, �n S�c�la s� kh�ng hi�u qu�. B�ng h�u c�n c� th� �n <color=yellow>"..qklleft.."<color> th�i S�c�la. B�ng h�u c� mu�n �n S�c�la kh�ng?",2,selTab)
--	else
--		Say("2 ng��i kh�c ph�i t� ��i m�i c� th� �n S�c�la.",0)
--	end
--end

function ok()
	local OldPlayerIndex = PlayerIndex
	local nDay = tonumber(date("%d"))
	if DelItem(2,0,361,1) == 1 then
		local player_name
		PlayerIndex = GetTeamMember(1)
		player_name = GetName()
		PlayerIndex = GetTeamMember(2)
		ModifyFriendliness(player_name,2+random(1,4))
		PlayerIndex = OldPlayerIndex
		WriteLog("[L� t�nh nh�n v� nguy�n ti�u]:"..GetName().."�� s� d�ng S�c�la. ")
		SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),2,nDay))
		SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3,GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),3)+1))
	end
end

function cancel()

end
