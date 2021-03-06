--filename:宝箱.lua
--create date:2006-01-08
--author:yanjun
--describe:雪战地图中的宝箱脚本
Include("\\script\\online\\春节活动\\newyear_head.lua")	

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20091218
		Say("Xem ra ho箃 ng  k誸 th骳",0)
		return 0
	end
	local MapID = GetWorldPos()
	local MapName
	if MapID == 961 then
		MapName = "B秐  tuy誸 Th祅h Й"
	elseif MapID == 962 then
		MapName = "B秐  tuy誸 Bi謓 Kinh"
	elseif MapID == 963 then
		MapName = "B秐  tuy誸 Tuy襫 Ch﹗"	
	elseif MapID == 964 then
		MapName = "B秐  tuy誸 Tng Dng"	
	elseif MapID == 965 then
		MapName = "B秐  tuy誸 Dng Ch﹗"	
	end		
	if tonumber(date("%H")) ~= 12 and tonumber(date("%H")) ~= 18 and tonumber(date("%H")) ~= 21 then
		SetMapTaskTemp(MapID,1,0)
	end
	if (GetTask(TASK_GOT_BOX) == 0) or (GetTime() - GetTask(TASK_GOT_BOX) >= 60) or (GetTime() - GetTask(TASK_GOT_BOX) < 0) then
		local npcIndex = GetTriggeringUnit()
		SetNpcLifeTime(npcIndex,0)
		local nRandomNum
		local nPreBoxLeft
		if (tonumber(date("%H")) == 12 or tonumber(date("%H")) == 18 or tonumber(date("%H")) == 21) and GetMapTaskTemp(MapID,1) < 100 then
			nRandomNum = random(1,100)
			if nRandomNum <= 21 then
				if GetBody() == 1 then
				AddItem(0,109,113,1)
				elseif GetBody() == 2 then
					AddItem(0,109,114,1)
				elseif GetBody() == 3 then
					AddItem(0,109,116,1)
				elseif GetBody() == 4 then
					AddItem(0,109,115,1)
				end
				WriteLog("[Ho箃 ng m颽 xu﹏ (m? b秓 rng)]:"..GetName().."Nh薾 頲 1 b? trang b?.")
				SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
				nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
				if nPreBoxLeft == 0 then
					Msg2SubWorld("Ho箃 ng"..MapName.."畂箃 b秓 l莕 n祔  k誸 th骳, xin c竎 b筺 nh? tham gia ho箃 ng l莕 sau!")
				elseif mod(nPreBoxLeft,10) == 0 then	--只公告10次
					Msg2SubWorld(MapName.."Ho箃 ng 畂箃 b秓 c遪"..nPreBoxLeft.." b秓 rng, trong c? nhi襲 qu? b蕋 ng?!")
				end
			elseif nRandomNum <= 41 then
				local CardNo = random(228,237)
				if AddItem(2,1,CardNo,1) == 1 then
					Say("Ch骳 m鮪g b筺 nh薾 頲 1 thi謕 ch骳 n╩ m韎.",0)
					WriteLog("[Ho箃 ng m颽 xu﹏ (m? b秓 rng)]:"..GetName().."Nh薾 頲 1 thi謕 ch骳 n╩ m韎.")
					SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
					nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
					if nPreBoxLeft == 0 then
						Msg2SubWorld("Ho箃 ng"..MapName.."畂箃 b秓 l莕 n祔  k誸 th骳, xin c竎 b筺 nh? tham gia ho箃 ng l莕 sau!")
					elseif mod(nPreBoxLeft,10) == 0 then	--只公告10次
						Msg2SubWorld(MapName.."Ho箃 ng 畂箃 b秓 c遪"..nPreBoxLeft.." b秓 rng, trong c? nhi襲 qu? b蕋 ng?!")
					end
				end
			elseif nRandomNum <= 61 then
				local NianGaoNo = random(266,269)
				if AddItem(2,1,NianGaoNo,1) == 1 then
					Say("Ch骳 m鮪g b筺 nh薾 頲 1 c竔 b竛h t?.",0)
					WriteLog("[Ho箃 ng m颽 xu﹏ (m? b秓 rng)]:"..GetName().."Nh薾 頲 1 c竔 b竛h t? ("..NianGaoNo..").")
					SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
					nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
					if nPreBoxLeft == 0 then
						Msg2SubWorld("Ho箃 ng"..MapName.."畂箃 b秓 l莕 n祔  k誸 th骳, xin c竎 b筺 nh? tham gia ho箃 ng l莕 sau!")
					elseif mod(nPreBoxLeft,10) == 0 then	--只公告10次
						Msg2SubWorld(MapName.."Ho箃 ng 畂箃 b秓 c遪"..nPreBoxLeft.." b秓 rng, trong c? nhi襲 qu? b蕋 ng?!")
					end
				end
			elseif nRandomNum <= 71 then
				if AddItem(2,3,217,1) == 1 then
					Msg2Player("B筺 nh薾 頲 n trung tuy誸 c莡.")
				end
			elseif nRandomNum <= 81 then
				if AddItem(2,3,220,1) == 1 then
					Msg2Player("B筺 nh薾 頲 trung tuy誸 c莡.")
				end
			elseif nRandomNum <= 86 then
				if AddItem(2,3,218,1) == 1 then
					Msg2Player("B筺 nh薾 頲 n i tuy誸 c莡.")
				end
			elseif nRandomNum <= 90 then
				if AddItem(2,3,221,1) == 1 then
					Msg2Player("B筺 nh薾 頲 i tuy誸 c莡.")
				end
			elseif nRandomNum <= 100 then
				CastState("state_move_speed_percent_add",20,60*2*18,1,1)	--单位为帧。18帧1秒。不能叠加。
				Msg2Player("T鑓  di chuy觧 c馻 b筺 t╪g 20% trong v遪g 2 ph髏.")														
			end
		else
			nRandomNum = random(1,100)
			if nRandomNum <= 30 then
				if AddItem(2,3,220,1) == 1 then
					Msg2Player("B筺 nh薾 頲 trung tuy誸 c莡.")
				end
			elseif nRandomNum <= 60 then
				if AddItem(2,3,217,1) == 1 then
					Msg2Player("B筺 nh薾 頲 n trung tuy誸 c莡.")
				end
			elseif nRandomNum <= 70 then
				if AddItem(2,3,221,1) == 1 then
					Msg2Player("B筺 nh薾 頲 i tuy誸 c莡.")
				end
			elseif nRandomNum <= 80 then
				if AddItem(2,3,218,1) == 1 then
					Msg2Player("B筺 nh薾 頲 n i tuy誸 c莡.")
				end
			else
				CastState("state_move_speed_percent_add",20,60*2*18,1,1)	--单位为帧。18帧1秒。不能叠加。
				Msg2Player("T鑓  di chuy觧 c馻 b筺 t╪g 20% trong v遪g 2 ph髏.")
			end
		end
		SetTask(TASK_GOT_BOX,GetTime())
		CreateBox()
	else
		local time_left = 60 - (GetTime() - GetTask(TASK_GOT_BOX))
		Say("c遪 <color=yellow>"..time_left.."<color> gi﹜ b筺 m韎 c? th? m? b秓 rng!",0)
	end
end

BoxPos = {
	{1692,3289},
	{1727,3289},
	{1762,3289},
	{1795,3288},
	{1826,3289},
	{1827,3359},
	{1794,3361},
	{1762,3361},
	{1729,3359},
	{1692,3359},
	{1692,3424},
	{1730,3423},
	{1763,3424},
	{1795,3423},
	{1827,3423},
	{1826,3496},
	{1794,3497},
	{1763,3496},
	{1729,3496},
	{1693,3496},
	{1693,3582},
	{1730,3581},
	{1763,3581},
	{1795,3581},
	{1825,3581},
	{1826,3652},
	{1794,3654},
	{1762,3653},
	{1728,3651},
	{1693,3653}
	}
function CreateBox()
	local i = random(1,30)
	local MapID = GetWorldPos()
	local npcBox = CreateNpc("Rng ti襫","B秓 rng",MapID,BoxPos[i][1]+random(-5,5),BoxPos[i][2]+random(-5,5))
	SetNpcScript(npcBox,"\\script\\online\\春节活动\\宝箱.lua")
end
