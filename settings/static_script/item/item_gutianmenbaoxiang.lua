--古天门宝箱物品脚本
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\task_access_code_def.lua")

--必定不出天门金令的次数限制
N_NEVER_X_AWARD_LIMIT=100

SZ_LOG_TITLE="C? Thi猲 M玭 B秓 Rng"

--用来表示随到了天门金令
GET_TIAMMENJINLING_FLAG=65535

t_special_award = --如果有必出在这个表配置
{
	nSaveTaskId = 3080,
	nSaveTaskAccessCode = TASK_ACCESS_CODE_GUTIANMENBAOXIANG,
	nSaveTaskWordIdx = 1,
	nSureAwardCount = 600,
	nAddcounterPerUpdate=1,--每执行一次Update计数器增加值
	t_award =
	{
		{{MA_TianMenJinLing, {}}, 10000},
	},
}

--表示随到了天门金令，但是不给任何东西
function _PreGetTianMenJinLing()
	local r = GET_TIAMMENJINLING_FLAG;
	return r, r, r, r;
end

--概率没满100% 剩下的概率给天门金令
t_normal_award=
{
	{{"Qu﹏ C玭g Huy Ho祅g",{2,1,9977,1},30,1, {1, 100}},1},-----------600
	
	{{"H綾 Ng鋍 筺 T鬰 Cao",{1,0,6,1},nil,nil, {1, 100}},500},
	{{"Sinh Sinh H鉧 T竛",{1,0,16,1},nil,nil, {1, 100}},500},
	
	{{"Thi猲 Th筩h linh th筩h",{2,1,1068,1},nil,1, {1, 100}},1},------3000
	
	{{"V筺 V藅 Quy Nguy猲 Кn",{1,0,11,1},nil,nil, {1, 100}},500},
	{{"T骾 ti襫",{2,1,30367,1},nil,nil, {1, 100}},500},
	{{"C鰑 chuy觧 h錳 h錸 n",{1,0,32,1},nil,nil, {1, 100}},200},
	
	{{"Qu﹏ C玭g Huy Ho祅g",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"C﹜ B竧 Nh? nh?",{2,0,504,1},30,nil, {1, 100}},400},
	{{"M秐h Thi猲 th筩h",{2,2,7,1},nil,nil, {1, 100}},400},
	
	{{"Qu﹏ C玭g Huy Ho祅g",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"T骾 ti襫",{2,1,30367,2},nil,nil, {1, 100}},2500},
	
	{{"Qu﹏ C玭g Huy Ho祅g",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"L鬰 Th莕 ho祅",{2,1,1064,1},30,nil, {1, 100}},200},
	{{"Tu Ch﹏ Y誹 Quy誸",{2,0,554,1},30,nil, {1, 100}},200},
	{{"B筩h C﹗ Ho祅",{2,1,270,1},30,nil, {1, 100}},200},
	{{"Tam Thanh ho祅",{2,1,1097,1},30,nil, {1, 100}},200},
	
	--天门金令5个位置可以随到，嘿嘿,总概率为5
	---表示随到了天门金令，但是不给任何东西
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"T骾 ti襫",{2,1,30367,3},nil,nil, {1, 100}},1000},
	
	{{"Qu﹏ C玭g Huy Ho祅g",{2,1,9977,1},30,1, {1, 100}},3},-----------600
	
	{{"T骾 ti襫",{2,1,30367,4},nil,nil, {1, 100}},500},
	
	{{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h",{2,1,1067,1},nil,1, {1, 100}},1},---------3000
	
	{{"Cng L鬰 Th莕 ho祅",{2,1,1065,1},30,nil, {1, 100}},200},
	{{"C﹜ B竧 Nh?",{2,0,398,1},30,nil, {1, 100}},100},
	{{"Th莕 N玭g Кn",{2,1,343,1},30,nil, {1, 100}},100},
	{{"Чi B筩h C﹗ ho祅",{2,1,1007,1},30,nil, {1, 100}},200},
	{{"Cng Tam Thanh ho祅",{2,1,1098,1},30,nil, {1, 100}},200},
	{{"T骾 ti襫",{2,1,30367,8},nil,nil, {1, 100}},333},
	
	--天门金令5个位置可以随到，嘿嘿,总概率为5
	---表示随到了天门金令，但是不给任何东西
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"L鬰 Th莕 Ti猲 n",{2,1,1066,1},30,nil, {1, 100}},100},
	{{"Qu﹏ C玭g Chng",{2,1,9999,1},30,nil, {1, 100}},100},
	{{"Чi Nh﹏ s﹎",{2,0,553,1},30,nil, {1, 100}},100},
	{{"B筩h C﹗ Ti猲 n",{2,1,1008,1},30,nil, {1, 100}},100},
	{{"Tam Thanh Ti猲 n",{2,1,1099,1},30,nil, {1, 100}},100},
	
	--天门金令5个位置可以随到，嘿嘿,总概率为5
	---表示随到了天门金令，但是不给任何东西
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"Qu﹏ C玭g b礽",{2,1,9997,1},30,nil, {1, 100}},100},
	{{"T骾 h箃 gi鑞g",{2,1,30087,1},30,nil, {1, 100}},100},
	{{"T骾 ti襫",{2,1,30367,16},nil,nil, {1, 100}},100},
	
	--天门金令5个位置可以随到，嘿嘿,总概率为5
	---表示随到了天门金令，但是不给任何东西
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"S? m玭 l謓h k?",{2,1,1017,1},30,nil, {1, 100}},50},
	{{"T骾 ti襫",{2,1,30367,32},nil,nil, {1, 100}},90},
	{{"T? Linh Quy Nguy猲 Кn",{2,1,30352,1},30,nil, {1, 100}},50},
	{{"Ho祅g Kim Чi H錸g Bao (tr鑞g)",{2,1,538,1},30,nil, {1, 100}},10},
	{{"T? Kim H錸g Bao (tr鑞g)",{2,1,536,1},30,nil, {1, 100}},10},
	{{"Qu﹏ C玭g Чi",{2,1,9998,1},30,nil, {1, 100}},10},
	
	--天门金令5个位置可以随到，嘿嘿,总概率为5
	---表示随到了天门金令，但是不给任何东西
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"T骾 ti襫",{2,1,30367,40},nil,nil, {1, 100}},10},
	{{"Thi猲 Th筩h Tinh Th筩h",{2,1,1009,1},nil,nil, {1, 100}},10},
	
	{{"B筩h Kim Чi H錸g Bao (kh玭g)",{2,1,30228,1},30,nil, {1, 100}},10},--400
}

t_require=
{
	{"C? Linh Ng鋍",{2,1,30369,1}},
}

function OnUse_Real(nItemIdx)
	local szTitle = format("M? B秓 Rng C? Thi猲 M玭 c莕 ti猽 hao th猰 C? Linh Ng鋍 x 1, c? mu鑞 m? kh玭g? ")
	local strtab = {
			format("\n mu鑞 m?/#_ConfirmUse(%d)", nItemIdx),
			"\n r髏 lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function _ConfirmUse(nItemIdx)
	
	local nNeedRoom = 1
	local nNeedWeight = 100
	if gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,"") ~= 1 then
		Talk(1,"",format("H祅h trang kh玭g  ? tr鑞g %d ho芻 nh﹏ v藅 kh玭g  s鴆 l鵦.!", nNeedRoom))
		return 0,0,0,-1
	end
	
	if 1 == _MissionAward_CheckCost(t_require, 1) then
		if 1 == DelItemByIndex(nItemIdx, 1) then
			local nAdd = t_special_award.nAddcounterPerUpdate or 1
			local g,d,p,n = MissionAward_UpdateSpecialAward(t_special_award, SZ_LOG_TITLE, nAdd, 1)--必出天门金令
			
			local N_MAX_TRY_CNT = 5
			local nTryCnt = 0;
			while not n or n<=0 or _IsTianMenJinLing(g,d,p,n)==1 do
				
				local nCnt,nMax = MissionAward_GetSpecialAwardCounter(t_special_award)
				nTryCnt = nTryCnt + 1
				if nTryCnt > N_MAX_TRY_CNT then
					WriteLog(format("[%s] open [gutianmenbaoxiang][%s], for [%d/%d] times rand, get none item, specitial counter=[%d/%d] ", GetName(), SZ_LOG_TITLE, nTryCnt, N_MAX_TRY_CNT, nCnt,nMax))
					return 0,0,0,-1
				end
				
				g,d,p,n = _MissionAward_RandAward(t_normal_award, SZ_LOG_TITLE)
				
				if _IsTianMenJinLing(g,d,p,n)==1 then
					--1~N_NEVER_X_AWARD_LIMIT必不出天门金令需要继续循环重新随机
					if nCnt and nCnt > N_NEVER_X_AWARD_LIMIT then
    					return MA_SpecialAward(t_special_award, SZ_LOG_TITLE)--随到了天门金令
    				end
				end
			end
			return g,d,p,n
		end
	end
end

function _IsTianMenJinLing(g,d,p,n)
	local r = GET_TIAMMENJINLING_FLAG;
	if g==r and d==r and p==r and n==r then
		return 1
	end
	return 0
end

function nothing()
end
