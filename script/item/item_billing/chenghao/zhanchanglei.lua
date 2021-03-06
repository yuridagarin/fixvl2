--create date:07-04-03
--author:yanjun
--describe:use the battle title
tTab =
{
--物品大类，副类，详细类别，需要军衔，物品名称，称号名称，对应称号表内的大类，副类，持续时间(真实时间)
	{2,1,9990,	 2,	"Чi T鑞g Phong Thng l謓h (Hi謚 髖)",	"T鑞g_V? D騨g Hi謚 髖",		30,	 2,	3600 * 24 * 30},
	{2,1,9989,	-2,	"Чi Li猽 Phong Thng l謓h (Hi謚 髖)",	"Li猽_Ki猽 D騨g Й 髖",		30,	 8,	3600 * 24 * 30},
	{2,1,9988,	 3,	"Чi T鑞g Phong Thng l謓h (Й th鑞g)",	"T鑞g_Thng Th緉g Й th鑞g",		30,	 3,	3600 * 24 * 30},
	{2,1,9987,	-3,	"Чi Li猽 Phong Thng l謓h (Й th鑞g)",	"Li猽_Tuy謙 tr莕 Й th鑞g",		30,	 9,	3600 * 24 * 30},
	{2,1,9986,	 4,	"Чi T鑞g Phong Thng l謓h (Ti猲 phong)",	"T鑞g_мnh B綾 i Ti猲 phong",	30,	 4,	3600 * 24 * 30},
	{2,1,9985,	-4,	"Чi Li猽 Phong Thng l謓h (Ti猲 phong)",	"Li猽_B譶h Nam i Ti猲 phong",	30,	10,	3600 * 24 * 30},	
	{2,1,9984,	 5,	"Чi T鑞g Phong Thng l謓h (Tng qu﹏)",	"T鑞g_V? Song Чi tng qu﹏",	30,	 5,	3600 * 24 * 30},	
	{2,1,9983,	-5,	"Чi Li猽 Phong Thng l謓h (Tng qu﹏)",	"Li猽_Th玭g Thi猲 Чi tng qu﹏",	30,	11,	3600 * 24 * 30},	
	{2,1,9982,	 6,	"Чi T鑞g Phong Thng l謓h (Nguy猲 so竔)",	"T鑞g_H? Qu鑓 Чi nguy猲 so竔",	30,	 6,	3600 * 24 * 30},	
	{2,1,9981,	-6,	"Чi Li猽 Phong Thng l謓h (Nguy猲 so竔)",	"Nam Vi謓 i Vng",			30,	12,	3600 * 24 * 30},
} 

tRank = {
	[0] = "Binh s?",
	[1] = "Binh s?",
	[2] = "Hi謚 髖",
	[3] = "Й th鑞g",
	[4] = "Ti猲 phong",
	[5] = "Tng qu﹏",
	[6] = "Nguy猲 So竔",
	}
function OnUse(nItemIdx)
	local nTitleIdx = get_title_index(nItemIdx);
	if nTitleIdx == 0 then
		Talk(1,"","B筺 kh玭g s? d鬾g Phong Thng L謓h.");
		return 0;
	end;
	local selTab = {
				format("уng ?/#use_confirm(%d,%d)",nItemIdx,nTitleIdx),
				"Ta suy ngh? l筰!/nothing",
				}
	if check_player_state(nTitleIdx) == 1 then
		Say("s? d鬾g <color=yellow>"..tTab[nTitleIdx][5].."<color> b筺 nh薾 頲 <color=yellow>"..tTab[nTitleIdx][6].."<color> danh hi謚, <color=red>danh hi謚 trc y c騨g b? x鉧<color>, c? c遪 mu鑞 s? d鬾g kh玭g?",getn(selTab),selTab);
	end;
end;

function get_title_index(nItemIdx)
	nItemIdx = tonumber(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tTab do
		if tTab[i][1] == nGenre and tTab[i][2] == nDetail and tTab[i][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function check_player_state(nTitleIdx)
	local nCurRank = GetTask(704);
	local nNeedRank = tTab[nTitleIdx][4];
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Talk(1,"","B筺 hi謓 thu閏 phe <color=yellow>T鑞g<color>, kh玭g th? d飊g danh hi謚 c馻 phe Li猽");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Talk(1,"","B筺 hi謓 thu閏 phe <color=yellow>Li猽<color>, kh玭g th? d飊g danh hi謚 c馻 phe T鑞g");
			return 0;
		end
	end
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Talk(1,"","Qu﹏ h祄 c馻 b筺 qu? th蕄 kh玭g th? s? d鬾g danh hi謚 n祔.");
		return 0
	end
	return 1
end;

function use_confirm(nItemIdx,nTitleIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=2,12 do
			RemoveTitle(30,i);
		end;
		local nGenre,nDetail = tTab[nTitleIdx][7],tTab[nTitleIdx][8];
		local nTime = tTab[nTitleIdx][9];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("B筺 nh薾 頲 x璶g hi謚"..tTab[nTitleIdx][6]);
		SetCurTitle(nGenre, nDetail);
	end;
end;