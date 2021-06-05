--filename:rose_npc.lua
--create date:2006-01-19
--author:yanjun
--describe:õ�廨�ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function main()
	local nOldPlayerIndex = PlayerIndex;
	local npcRoseIndex = GetTargetNpc()
	if GetTime() - GetTask(TASK_ROSE_LIFE) > ROSELIFE or npcRoseIndex ~= GetTask(TASK_ROSE_INDEX) then
		return 0
	end
	if IsLoversTeam() == 1 then
		for i=1,2 do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TASK_ROSE_INDEX) ~= npcRoseIndex then
				PlayerIndex = nOldPlayerIndex;
				Say("M�i t�nh chung th�y m�i tr�ng ���c hoa h�ng m� l�.",0)
				return 0;
			end;
		end
		PlayerIndex = nOldPlayerIndex;
		local selTabMale = {
					"Ta mu�n t��i n��c./manure",
					"Xem s�c s�ng c�a hoa h�ng./checklife",
					"Y�n t�m./nothing"
					}
		local selTabFemale = {
					"H�i hoa h�ng./getrose",
					"Xem s�c s�ng c�a hoa h�ng./checklife",
					"H�y ��i./nothing"
					}
		local selTab = {
					"Xem s�c s�ng c�a hoa h�ng./checklife",
					"Y�n t�m./nothing"
					}
		if GetSex() == 1 and GetTask(TASK_ROSE_GROW) == 3 then
			Say("Hoa h�ng �� tr� b�ng, h�y mau nh� � trung nh�n h�i xu�ng.",2,selTab)
			return 0
		end
		if GetSex() == 1 then
			Say("Hoa �i, h�y mau n�!",3,selTabMale)
		elseif GetSex() == 2 then
			Say("Hoa �i, h�y mau n�!",3,selTabFemale)	
		end
	elseif GetTeamSize() ~= 2 then
		Say("T� ��i c�a b�n ��u? Ph�i 2 ng��i m�i tr�ng ���c hoa h�ng!",0)
	else
		Say("��y kh�ng ph�i t� ��i ban ��u c�a b�n, hai ng��i ph�i chung th�y m�i tr�ng ���c hoa h�ng.",0)
	end
end

function manure()
	local OldPlayerIndex = PlayerIndex
	if GetTask(TASK_ROSE_INDEX) == GetTargetNpc() then
		if IsLoversTeam() == 1 then
			if GetTime() - GetTask(TASK_ROSE_LIFE) <= ROSELIFE/2 then
				Say("M�i t��i n��c, h�y ��i 1 l�t.",0)
				return 0
			end
			if GetItemCount(2,0,351) >=1 then
				if DelItem(2,0,351,1) == 1 then
					for i=1,2 do
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_ROSE_GROW,GetTask(TASK_ROSE_GROW)+1)
						SetTask(TASK_ROSE_LIFE,GetTime())
					end
					PlayerIndex = OldPlayerIndex
					local nameMale,nameFemale = GetLoversName()
					local npcRoseIndex = GetTargetNpc()
					local MapID,MapX,MapY = GetNpcWorldPos(npcRoseIndex)
					if GetTask(TASK_ROSE_GROW) == 1 then
						SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),0)
						local npcRoseIndex1 = CreateNpc("M�m Hoa h�ng","��"..nameFemale.." tr�ng hoa h�ng",MapID,MapX,MapY)
						SetNpcScript(npcRoseIndex1,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
						for i=1,2 do
							PlayerIndex = GetTeamMember(i)
							SetTask(TASK_ROSE_INDEX,npcRoseIndex1)
						end
						PlayerIndex = OldPlayerIndex
					elseif GetTask(TASK_ROSE_GROW) == 2 then
						SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),0)
						local npcRoseIndex2 = CreateNpc(" nh�nh hoa h�ng","��"..nameFemale.." n� hoa",MapID,MapX,MapY)
						SetNpcScript(npcRoseIndex2,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
						for i=1,2 do
							PlayerIndex = GetTeamMember(i)
							SetTask(TASK_ROSE_INDEX,npcRoseIndex2)
						end
						PlayerIndex = OldPlayerIndex
					elseif GetTask(TASK_ROSE_GROW) == 3 then
						SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),0)
						local nRandomNum = random(1,100)
						if nRandomNum <= 90 then
							local npcRedRoseIndex = CreateNpc("Hoa h�ng ��","��"..nameFemale.." tr�ng h�ng mai qu� hoa",MapID,MapX,MapY)
							SetNpcScript(npcRedRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
							for i=1,2 do
								PlayerIndex = GetTeamMember(i)
								SetTask(TASK_ROSE_INDEX,npcRedRoseIndex)
								SetTask(TASK_ROSE_TYPE,1)
							end
							PlayerIndex = OldPlayerIndex
						elseif nRandomNum <= 95 then
							local npcBlackRoseIndex = CreateNpc("Hoa h�ng tr�ng","��"..nameFemale.." tr�ng ph�n mai qu� hoa",MapID,MapX,MapY)
							SetNpcScript(npcBlackRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
							for i=1,2 do
								PlayerIndex = GetTeamMember(i)
								SetTask(TASK_ROSE_INDEX,npcBlackRoseIndex)
								SetTask(TASK_ROSE_TYPE,2)
							end
							PlayerIndex = OldPlayerIndex			
						elseif nRandomNum <= 100 then
							local npcyellowRoseIndex = CreateNpc("Hoa h�ng v�ng","��"..nameFemale.." tr�ng ho�ng mai qu� hoa",MapID,MapX,MapY)
							SetNpcScript(npcyellowRoseIndex,"\\script\\online\\qingrenyuanxiao\\rose_npc.lua")
							for i=1,2 do
								PlayerIndex = GetTeamMember(i)
								SetTask(TASK_ROSE_INDEX,npcyellowRoseIndex)
								SetTask(TASK_ROSE_TYPE,3)
							end
							PlayerIndex = OldPlayerIndex							
						end
					end
					SetNpcLifeTime(GetTask(TASK_ROSE_INDEX),ROSELIFE)
					--DebugOutput("rose's age is:"..GetTask(TASK_ROSE_GROW))
				end
			else
				Say("B�n kh�ng mang {L� th�y}!",0)
			end
		elseif GetTeamSize() ~= 2 then
			Say("T� ��i c�a b�n ��u? Ph�i 2 ng��i m�i tr�ng ���c hoa h�ng!",0)
		else
			Say("��y kh�ng ph�i t� ��i ban ��u c�a b�n, hai ng��i ph�i chung th�y m�i tr�ng ���c hoa h�ng.",0)
		end
	end
end

function checklife()
	if GetTask(TASK_ROSE_INDEX) == GetTargetNpc() then
		local timelapse = GetTime() - GetTask(TASK_ROSE_LIFE)
		local roselife = floor((ROSELIFE - timelapse)/60)+1
		local watertime = roselife - floor(ROSELIFE/2/60)
		if watertime < 0 then
			watertime = 0
		end
		if GetTask(TASK_ROSE_GROW) == 3 then
			Say("Hoa h�ng �� tr� b�ng, n�u trong <color=yellow>"..roselife.."<color> ph�t kh�ng h�i s� kh� ch�t.",0)
		else
			Say("Hoa h�ng ph�i m�t <color=yellow>"..watertime.."<color> ph�t m�i c� th� tr� b�ng. N�u trong v�ng <color=yellow>"..roselife.."<color> ph�t kh�ng t��i n��c s� kh� ch�t.",0)
		end
	else
		--DebugOutput("TASK("..TASK_ROSE_INDEX.."):"..GetTask(TASK_ROSE_INDEX))
		--DebugOutput("GetTargetNpc:"..GetTargetNpc())
	end
end

function getrose()
	local OldPlayerIndex = PlayerIndex
	if GetTask(TASK_ROSE_INDEX) == GetTargetNpc() then
		if IsLoversTeam() == 1 then
			if GetSex() == 2 and GetTask(TASK_ROSE_GROW) == 3 then
				local timeleft = ROSELIFE - (GetTime() - GetTask(TASK_ROSE_LIFE))
				if timeleft >= ROSELIFE/2 then
					local minleft = floor((timeleft-floor(ROSELIFE/2))/60)+1
					Say("Hoa h�ng v�a m�i h� n�, hi�n ch�a th� h�i. Sau <color=yellow>"..minleft.."<color> ph�t b�n c� th� h�i hoa h�ng.",0)
					return 0
				end
				local npcRoseIndex = GetTargetNpc()
				SetNpcLifeTime(npcRoseIndex,0)
				local rose = {
							{0,108,117},
							{0,108,118},
							{0,108,119},
							{0,108,120},
							{0,108,121},
							{0,108,122},							
							}
				local rosetype = GetTask(TASK_ROSE_TYPE)
				if GetBody() == 4 then
					rosetype = rosetype + 3
				end
				if AddItem(rose[rosetype][1],rose[rosetype][2],rose[rosetype][3],1) == 1 then
					Msg2Player("B�n nh�n ���c 1 ��a hoa h�ng.")
					for i=1,2 do 
						PlayerIndex = GetTeamMember(i)
						SetTask(TASK_ROSE_INDEX,0)
						SetTask(TASK_ROSE_GROW,0)
						SetTask(TASK_ROSE_LIFE,0)
					end
					PlayerIndex = OldPlayerIndex
				end
			else
				Say("Hoa h�ng v�n ch�a tr� b�ng.",0)
			end
		elseif GetTeamSize() ~= 2 then
			Say("T� ��i c�a b�n ��u? Ph�i 2 ng��i m�i tr�ng ���c hoa h�ng!",0)
		else
			Say("��y kh�ng ph�i t� ��i ban ��u c�a b�n, hai ng��i ph�i chung th�y m�i tr�ng ���c hoa h�ng.",0)
		end
	end
end

function nothing()

end
