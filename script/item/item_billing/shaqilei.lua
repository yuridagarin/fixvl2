g_tbItem = {
		--ID1, ID2, ID3,     name,增加值,限制值
	[1] = {2,	1,	1156,	"Ngh辌h L﹏",	1,	10},
	[2] = {2,	1,	1157,	"u h錸",	10,	10},
	}
	
--镇派技能名字
g_tbSkillName = {
	[0] = "",
	[1] = "",
	[2] = "D辌h C﹏ Kinh",
	[3] = "T葃 T駓 Kinh",
	[4] = "Nh? Lai Th莕 Chng",
	[5] = "",
	[6] = "H蕄 Tinh Tr薾",
	[7] = "",
	[8] = "V筺 Tng Th莕 C玭g",
	[9] = "Thi猲  Tr蕁 H錸 Kh骳",
	[10] = "",
	[11] = "Gi竛g Long Th藀 B竧 Chng",
	[12] = "Ф C萿 c玭 ph竝",
	[13] = "",
	[14] = "V? Thng Th竔 C鵦 Ki誱",
	[15] = "Th竔 C鵦 Th莕 C玭g",
	[16] = "",
	[17] = "Li猲 Ho祅 To祅 Long thng",
	[18] = "B? Vng Tng Ph鬾g Ti詎",
	[19] = "",
	[20] = "V? Thi猲 Ma C玭g",
	[21] = "V? 秐h Ma C?",
	[22] ="",
	[23] ="V? C鵦 Phong L玦 Quy誸",
	[24] ="",
	[25] ="C祅 Kh玭 Чi Na Di",
	[26] ="Quang Minh Ng? H祅h Tr薾",
	[27] ="H祅 B╪g Mi猲 Chng",
	[28] ="",
	[29] ="Loan Ph鬾g C鰑 Thi猲",
	[30] ="C鰑 V? Hoa Ti猲 Quy誸",
	[31] = "Thi猲 秐h tuy謙 s竧",
	[32] = "V筺 ki誱 h鉧 v? tr薾",
};
	

function OnUse(nItemIdx)
	local nIdx = get_item_idx(nItemIdx);
	if nIdx == 0 then
		Talk(1,"","V藅 ph萴 b筺 s? d鬾g kh玭g th? t╪g tr? s竧 kh?! ");
		return 0;
	end;
	
	if chk_can_use() == 0 then
		Say("Khu v鵦 hi謓 t筰 kh玭g th? s? d鬾g "..g_tbItem[nIdx][4]..".",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","B筺 ch璦 h鋍 頲 tuy謙 k? Tr蕁 ph竔 n祇, kh玭g th? s? d鬾g "..g_tbItem[nIdx][4]..".");
		return 0;
	end;
	use(nItemIdx,nIdx)
--	local nCurShaQi = GetMomentum();
--	local selTab = {
--			format("уng ?/#use(%d,%d)",nItemIdx,nIdx),
--			"H駓 b?/nothing",
--			}
--	Say("Ngi ng ? s? d鬾g <color=yellow>"..g_tbItem[nIdx][4].."<color>? Sau khi s? d鬾g c? th? gia t╪g <color=yellow>"..g_tbItem[nIdx][5].."<color> Tr? s竧 kh?. Tr? s竧 kh? c馻 b筺 l? <color=yellow>"..nCurShaQi.."<color>.",getn(selTab),selTab);
end;

function use(nItemIdx,nIdx)
	local nCurShaQi = GetMomentum();
	if nCurShaQi >= g_tbItem[nIdx][6] then
		Talk(1,"","Tr? s竧 kh? hi謓 t筰 c馻 b筺 l? <color=yellow>"..nCurShaQi.."<color> kh玭g th? s? d鬾g <color=yellow>"..g_tbItem[nIdx][4].."<color>.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= 606 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("B筺  s? d鬾g 1 "..g_tbItem[nIdx][4]..", tr? s竧 kh? t╪g 1 . ");
			else
				SetMomentum(10);
				Msg2Player("B筺  s? d鬾g 1 "..g_tbItem[nIdx][4]..", tr? s竧 kh? th祅h 10 .");
			end;
		end;
	else
		SetMomentumBoundSwitch(0);
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("B筺  s? d鬾g 1 "..g_tbItem[nIdx][4]..", tr? s竧 kh? t╪g 1 . ");
			else
				SetMomentum(10);
				Msg2Player("B筺  s? d鬾g 1 "..g_tbItem[nIdx][4]..", tr? s竧 kh? th祅h 10 .");
			end;
		end;
		SetMomentumBoundSwitch(1);
	end	
	
end;

function get_item_idx(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function nothing()

end;

function chk_can_use()
	local nMapID = GetWorldPos()
	if nMapID >= 839 and nMapID <= 842 then
		return 0
	end
	if GetMissionS(10) == "秈 s? m玭" then	--看看是不是在特殊关卡里面
		return 0;
	end;
	return 1
end