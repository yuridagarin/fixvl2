--��������NPC�Ự�ű�
Include ("\\script\\system_switch_config.lua")

MONEY_TO_GOLD_RATE = 10000
t_need_gold = 
{
	[1] = 9,
	[2] = 99,
}

function OnNpcTalkToRestore()
	local tbSay = {}
	local szTitle = ""
	if 1 == IsMeridianSystemOpen() and MeridianGetLevel() >= 1 then
		szTitle = format("Ta c� th� gi�p ng��i d�ch c�n t�y t�y, c�nh gi�i V� Gi� c�n hao ph� 9 v�ng, c�nh gi�i V� T��ng c�n hao ph� 99 v�ng.")
		tinsert(tbSay, format("Ta mu�n d�ch c�n t�y t�y/_DoRestore"))
		tinsert(tbSay, "Ta ch� gh� ch�i/no")
	else
		szTitle = format("Hi�n t�i c�c h� v�n ch�a k�ch ho�t c�nh gi�i, r�t ti�c ta kh�ng th� gi�p ng��i d�ch c�n t�y t�y.")
		tinsert(tbSay, "Tho�t/no")
	end
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoRestore()
	if 1 == _CheckConsume() then
		if 1 == _DoConsume() then
			MeridianRestore(-1)
		end
	end
end

function _CheckConsume()
	local nNeedGold = _GetNeedGold()
	local nCash = GetCash()
	if nCash < (nNeedGold * MONEY_TO_GOLD_RATE) then
		Msg2Player(format("S� v�ng hi�n c� c�a c�c h� kh�ng �� %d v�ng", nNeedGold))
		return 0
	end
	return 1
end

function _DoConsume()
	local nNeedMoney = _GetNeedGold() * MONEY_TO_GOLD_RATE
	local nPayStatue = Pay(nNeedMoney) or 0
	return nPayStatue
end

function _GetNeedGold()
	local nLevel = MeridianGetLevel()
	local nRet = t_need_gold[nLevel] or -1
	return nRet
end



function no()
end
