--filename:����.lua
--create date:2006-01-08
--author:yanjun
--describe:ѩս��ͼ�еı���ű�
Include("\\script\\online\\���ڻ\\newyear_head.lua")	

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20091218
		Say("Xem ra ho�t ��ng �� k�t th�c",0)
		return 0
	end
	local MapID = GetWorldPos()
	local MapName
	if MapID == 961 then
		MapName = "B�n �� tuy�t Th�nh ��"
	elseif MapID == 962 then
		MapName = "B�n �� tuy�t Bi�n Kinh"
	elseif MapID == 963 then
		MapName = "B�n �� tuy�t Tuy�n Ch�u"	
	elseif MapID == 964 then
		MapName = "B�n �� tuy�t T��ng D��ng"	
	elseif MapID == 965 then
		MapName = "B�n �� tuy�t D��ng Ch�u"	
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
				WriteLog("[Ho�t ��ng m�a xu�n (m� b�o r��ng)]:"..GetName().."Nh�n ���c 1 b� trang b�.")
				SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
				nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
				if nPreBoxLeft == 0 then
					Msg2SubWorld("Ho�t ��ng"..MapName.."�o�t b�o l�n n�y �� k�t th�c, xin c�c b�n nh� tham gia ho�t ��ng l�n sau!")
				elseif mod(nPreBoxLeft,10) == 0 then	--ֻ����10��
					Msg2SubWorld(MapName.."Ho�t ��ng �o�t b�o c�n"..nPreBoxLeft.." b�o r��ng, trong c� nhi�u qu� b�t ng�!")
				end
			elseif nRandomNum <= 41 then
				local CardNo = random(228,237)
				if AddItem(2,1,CardNo,1) == 1 then
					Say("Ch�c m�ng b�n nh�n ���c 1 thi�p ch�c n�m m�i.",0)
					WriteLog("[Ho�t ��ng m�a xu�n (m� b�o r��ng)]:"..GetName().."Nh�n ���c 1 thi�p ch�c n�m m�i.")
					SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
					nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
					if nPreBoxLeft == 0 then
						Msg2SubWorld("Ho�t ��ng"..MapName.."�o�t b�o l�n n�y �� k�t th�c, xin c�c b�n nh� tham gia ho�t ��ng l�n sau!")
					elseif mod(nPreBoxLeft,10) == 0 then	--ֻ����10��
						Msg2SubWorld(MapName.."Ho�t ��ng �o�t b�o c�n"..nPreBoxLeft.." b�o r��ng, trong c� nhi�u qu� b�t ng�!")
					end
				end
			elseif nRandomNum <= 61 then
				local NianGaoNo = random(266,269)
				if AddItem(2,1,NianGaoNo,1) == 1 then
					Say("Ch�c m�ng b�n nh�n ���c 1 c�i b�nh t�.",0)
					WriteLog("[Ho�t ��ng m�a xu�n (m� b�o r��ng)]:"..GetName().."Nh�n ���c 1 c�i b�nh t� ("..NianGaoNo..").")
					SetMapTaskTemp(MapID,1,GetMapTaskTemp(MapID,1)+1)
					nPreBoxLeft = 100 - GetMapTaskTemp(MapID,1)
					if nPreBoxLeft == 0 then
						Msg2SubWorld("Ho�t ��ng"..MapName.."�o�t b�o l�n n�y �� k�t th�c, xin c�c b�n nh� tham gia ho�t ��ng l�n sau!")
					elseif mod(nPreBoxLeft,10) == 0 then	--ֻ����10��
						Msg2SubWorld(MapName.."Ho�t ��ng �o�t b�o c�n"..nPreBoxLeft.." b�o r��ng, trong c� nhi�u qu� b�t ng�!")
					end
				end
			elseif nRandomNum <= 71 then
				if AddItem(2,3,217,1) == 1 then
					Msg2Player("B�n nh�n ���c ��n trung tuy�t c�u.")
				end
			elseif nRandomNum <= 81 then
				if AddItem(2,3,220,1) == 1 then
					Msg2Player("B�n nh�n ���c trung tuy�t c�u.")
				end
			elseif nRandomNum <= 86 then
				if AddItem(2,3,218,1) == 1 then
					Msg2Player("B�n nh�n ���c ��n ��i tuy�t c�u.")
				end
			elseif nRandomNum <= 90 then
				if AddItem(2,3,221,1) == 1 then
					Msg2Player("B�n nh�n ���c ��i tuy�t c�u.")
				end
			elseif nRandomNum <= 100 then
				CastState("state_move_speed_percent_add",20,60*2*18,1,1)	--��λΪ֡��18֡1�롣���ܵ��ӡ�
				Msg2Player("T�c �� di chuy�n c�a b�n t�ng 20% trong v�ng 2 ph�t.")														
			end
		else
			nRandomNum = random(1,100)
			if nRandomNum <= 30 then
				if AddItem(2,3,220,1) == 1 then
					Msg2Player("B�n nh�n ���c trung tuy�t c�u.")
				end
			elseif nRandomNum <= 60 then
				if AddItem(2,3,217,1) == 1 then
					Msg2Player("B�n nh�n ���c ��n trung tuy�t c�u.")
				end
			elseif nRandomNum <= 70 then
				if AddItem(2,3,221,1) == 1 then
					Msg2Player("B�n nh�n ���c ��i tuy�t c�u.")
				end
			elseif nRandomNum <= 80 then
				if AddItem(2,3,218,1) == 1 then
					Msg2Player("B�n nh�n ���c ��n ��i tuy�t c�u.")
				end
			else
				CastState("state_move_speed_percent_add",20,60*2*18,1,1)	--��λΪ֡��18֡1�롣���ܵ��ӡ�
				Msg2Player("T�c �� di chuy�n c�a b�n t�ng 20% trong v�ng 2 ph�t.")
			end
		end
		SetTask(TASK_GOT_BOX,GetTime())
		CreateBox()
	else
		local time_left = 60 - (GetTime() - GetTask(TASK_GOT_BOX))
		Say("c�n <color=yellow>"..time_left.."<color> gi�y b�n m�i c� th� m� b�o r��ng!",0)
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
	local npcBox = CreateNpc("R��ng ti�n","B�o r��ng",MapID,BoxPos[i][1]+random(-5,5),BoxPos[i][2]+random(-5,5))
	SetNpcScript(npcBox,"\\script\\online\\���ڻ\\����.lua")
end
