--filename:qryx_trigger.lua
--create date:2006-01-18
--author:yanjun
--describe:���˽ڣ�Ԫ���ڻ�������ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function chocolate_drop()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			if GetSex() == 2 then
				local maleIndex = GetLoversIndex()
				if IsPlayerNear(maleIndex) > 0 then	--�����һ�����Լ��ĸ���
					if IsLucky(1*DropRate,100*100) == 1 then
						local nDay = tonumber(date("%d"))			
						if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1) < nDay then
							SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1,0))
						end
						if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1) == 0 then
							if AddItem(2,0,361,1) == 1 then
								SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1,nDay))
								Msg2Player("B�n nh�n ���c 1 th�i S�c�la")
								WriteLog("[Ho�t ��ng l� t�nh nh�n v� T�t Nguy�n Ti�u]"..GetName().."��nh qu�i nh�n ���c 1 S�c�la")
							end
						end
					end
				end
			end
		end
	end
end


function drop_libing()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			PlayerIndex = GetTeamMember(1)
			if IsPlayerNear(GetTeamMember(2)) > 0 then	--�����һ�����Լ��ĸ���
				PlayerIndex = OldPlayerIndex
				if IsLucky(20*DropRate,100*100) == 1 then
					AddItem(2,0,360,1)	--���
				end	
			end
			PlayerIndex = OldPlayerIndex
		end
	end
end

function drop_hzmty()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			PlayerIndex = GetTeamMember(1)
			if IsPlayerNear(GetTeamMember(2)) > 0 then	--�����һ�����Լ��ĸ���
				PlayerIndex = OldPlayerIndex
				if IsLucky(3*DropRate,100*100) == 1 then
					AddItem(2,0,355,1)	--��֥����Բ
				end	
			end
			PlayerIndex = OldPlayerIndex
		end
	end
end