--经脉重置NPC会话脚本
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
		szTitle = format("Ta c? th? gi髉 ngi d辌h c﹏ t葃 t駓, c秐h gi韎 V? Gi? c莕 hao ph? 9 v祅g, c秐h gi韎 V? Tng c莕 hao ph? 99 v祅g.")
		tinsert(tbSay, format("Ta mu鑞 d辌h c﹏ t葃 t駓/_DoRestore"))
		tinsert(tbSay, "Ta ch? gh? ch琲/no")
	else
		szTitle = format("Hi謓 t筰 c竎 h? v蒼 ch璦 k輈h ho箃 c秐h gi韎, r蕋 ti誧 ta kh玭g th? gi髉 ngi d辌h c﹏ t葃 t駓.")
		tinsert(tbSay, "Tho竧/no")
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
		Msg2Player(format("S? v祅g hi謓 c? c馻 c竎 h? kh玭g  %d v祅g", nNeedGold))
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
