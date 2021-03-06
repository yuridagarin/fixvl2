--遗忘宠物技能

NEED_GOLD = 10
MONTE_TO_GOLD_RATE = 10000

t_player_pet_list = {}

function ForgetPetSkillMain()
	_ChoosePet()
end

function _ChoosePet()
	local tbSay = {}
	local nPetCount,tbPetList = GetPetList()
	t_player_pet_list[PlayerIndex] = tbPetList--更新宠物列表
	if nPetCount > 0 then
		local szTitle = format("C? ph秈 b筺 ng h祅h c馻 c竎 h? s? h鱱 nh鱪g k? n╪g h? tr? kh玭g 頲 璶g ?, kh玭g c莕 lo l緉g, ta c? th? gi髉 ngi x鉧 b? nh鱪g k? n╪g b譶h thng  d祅h v? tr? cho k? n╪g cao c蕄 h琻. Chi ph? cho m鏸 l莕 x鉧 k? n╪g l? %d v祅g. <color=red>K? n╪g b? x鉧 甶 s? kh玭g th? kh玦 ph鬰 l筰, ch? c? th? luy謓 l筰 t? u.<color> H穣 ch鋘 k? n╪g b筺 ng h祅h c莕 x鉧 b?:", NEED_GOLD);
		for i = 1, getn(tbPetList) do
			local szItem = format("%s(T? ch蕋 c遪 l筰:%d/%d)/#_ChooseSkill(%d)", tbPetList[i].szName, tbPetList[i].nCurTianZi, tbPetList[i].nMaxTianZi, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "Tho竧/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		Talk(1,"","C竎 h? ch璦 c? b筺 ng h祅h kh玭g th? x鉧 k? n╪g!")
	end
end

function _ChooseSkill(nPetListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 then
		local szTitle = format("C竎 h? x竎 nh x鉧 k? n╪g b筺 ng h祅h <color=yellow>%s(t? ch蕋 c遪 l筰:%d/%d)<color> kh玭g?<color=red>k? n╪g b? x鉧 s? kh玭g th? kh玦 ph鬰 l筰, c? th? th? luy謓 l筰 t? u<color>H穣 ch鋘 k? n╪g c莕 x鉧 (x鉧 k? n╪g c莕 ti猽 hao %d v祅g):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi, NEED_GOLD);
		for i = 1, getn(tbPetSkill) do
			local szItem = format("D穣 %d: %s%d c蕄 (Chi誱 t? ch蕋: %d)/#_ConfirmDelPetSkill(%d, %d)"
				, tbPetSkill[i].nSkillIndex + 1, tbPetSkill[i].szSkillName, tbPetSkill[i].nSkillLv, tbPetSkill[i].nNeedTianZi
				, nPetListIndex, i)
			tinsert(tbSay, szItem)
		end
		tinsert(tbSay, "tr? l筰/_ChoosePet")
		tinsert(tbSay, "Tho竧/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
		local szMsg = format("B筺 ng h祅h <color=yellow>%s<color> v蒼 ch璦 c? k? n╪g h? tr?, kh玭g th? x鉧", tbPetInfo.szName)
		Talk(1,"",szMsg)
	end
end

function _ConfirmDelPetSkill(nPetListIndex, nSkillListIndex)
	local tbSay = {}
	local tbPetInfo = t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) > 0 and getn(tbPetSkill) >= nSkillListIndex then
		local szTitle = format("X竎 nh cho b筺 ng h祅h <color=yellow>%s (T? ch蕋 c遪 l筰: %d/%d)<color>x鉧 k? n╪g<color=yellow>d穣 th? %d: %s%d c蕄 (chi誱 t? ch蕋 %d)<color> kh玭g? Th祅h c玭g x鉧 b? <color=yellow>頲 nh薾 l筰 甶觤 t? ch蕋: %d<color>. <color=red>K? n╪g b? x鉧 甶 s? kh玭g th? kh玦 ph鬰 l筰, ch? c? th? luy謓 l筰 t? u.<color>H穣 x竎 nh l莕 cu鑙 (x鉧 k? n╪g c莕 ti猽 hao %d v祅g):"
			, tbPetInfo.szName, tbPetInfo.nCurTianZi, tbPetInfo.nMaxTianZi
			, tbPetSkill[nSkillListIndex].nSkillIndex + 1, tbPetSkill[nSkillListIndex].szSkillName, tbPetSkill[nSkillListIndex].nSkillLv, tbPetSkill[nSkillListIndex].nNeedTianZi
			, tbPetSkill[nSkillListIndex].nNeedTianZi, NEED_GOLD);
		local szItem = format("X竎 nh x鉧/#_OnDelPetSkill(%d, %d)", nPetListIndex, nSkillListIndex)
		tinsert(tbSay, szItem)
		szItem = format("tr? l筰/#_ChooseSkill(%d)", nPetListIndex)
		tinsert(tbSay, szItem)
		tinsert(tbSay, "Tho竧/no")
		Say(szTitle, getn(tbSay), tbSay)
	else
		t_player_pet_list[PlayerIndex] = nil
	end
end

function _OnDelPetSkill(nPetListIndex, nSkillListIndex)
	local nNeedMoney = NEED_GOLD * MONTE_TO_GOLD_RATE
	local nCash = GetCash()
	if nCash < nNeedMoney then
		Msg2Player(format("S? v祅g hi謓 c? c馻 c竎 h? kh玭g  %d v祅g", NEED_GOLD))
		t_player_pet_list[PlayerIndex] = nil
		return
	end
	
	local tbPetInfo =t_player_pet_list[PlayerIndex][nPetListIndex] or {}
	local tbPetSkill = tbPetInfo.tbDynamicSkill or {}
	if getn(tbPetSkill) >= nSkillListIndex then
		local nResult = ForgetPetSkill(tbPetInfo.nIndex, tbPetSkill[nSkillListIndex].nSkillIndex, tbPetSkill[nSkillListIndex].nSkillId, tbPetSkill[nSkillListIndex].nSkillLv)
		if nResult == tbPetSkill[nSkillListIndex].nSkillIndex and nSkillListIndex >= 0 then
			Pay(nNeedMoney)
			local szMsg = format("B筺 ng h祅h %s  x鉧 k? n╪g %s th祅h c玭g", tbPetInfo.szName, tbPetSkill[nSkillListIndex].szSkillName)
			Msg2Player(szMsg)
		end
	end
	
	t_player_pet_list[PlayerIndex] = nil
end

function no()
	t_player_pet_list[PlayerIndex] = nil
end