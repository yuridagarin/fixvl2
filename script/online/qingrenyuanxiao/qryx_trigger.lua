--filename:qryx_trigger.lua
--create date:2006-01-18
--author:yanjun
--describe:情人节＆元宵节活动触发器脚本
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function chocolate_drop()
	if Is_QRYX_Activity() == 1 then
		if IsLoversTeam() == 1 then
			local DropRate = GetLoversDropRate()
			local OldPlayerIndex = PlayerIndex
			DebugOutput("current droprate is:"..DropRate)
			if GetSex() == 2 then
				local maleIndex = GetLoversIndex()
				if IsPlayerNear(maleIndex) > 0 then	--如果另一半在自己的附近
					if IsLucky(1*DropRate,100*100) == 1 then
						local nDay = tonumber(date("%d"))			
						if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1) < nDay then
							SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1,0))
						end
						if GetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1) == 0 then
							if AddItem(2,0,361,1) == 1 then
								SetTask(TASK_GOTUSE_CHOCOLATE,SetByte(GetTask(TASK_GOTUSE_CHOCOLATE),1,nDay))
								Msg2Player("B筺 nh薾 頲 1 th醝 S玞玪a")
								WriteLog("[Ho箃 ng l� t譶h nh﹏ v� T誸 Nguy猲 Ti猽]"..GetName().."Цnh qu竔 nh薾 頲 1 S玞玪a")
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
			if IsPlayerNear(GetTeamMember(2)) > 0 then	--如果另一半在自己的附近
				PlayerIndex = OldPlayerIndex
				if IsLucky(20*DropRate,100*100) == 1 then
					AddItem(2,0,360,1)	--礼饼
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
			if IsPlayerNear(GetTeamMember(2)) > 0 then	--如果另一半在自己的附近
				PlayerIndex = OldPlayerIndex
				if IsLucky(3*DropRate,100*100) == 1 then
					AddItem(2,0,355,1)	--黑芝麻汤圆
				end	
			end
			PlayerIndex = OldPlayerIndex
		end
	end
end