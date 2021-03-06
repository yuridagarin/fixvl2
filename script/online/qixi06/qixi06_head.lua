--file name:7xi06_head.lua
--author:yanjun
--create date:2006-6-26
--describe:06年七夕活动脚本头文件
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\qixi06\\mission_head.lua");
tabPos = new(KTabFile, "\\settings\\task\\killer\\killer_pos.txt");

TASK_POS_INDEX = 1888;	--记录位置信息在表中的索引
TASK_GOTATLAS_DATE = 1889;	--记录得到星星地图的日期
TASK_PLANTSTAR_DATE = 1890;	--记录种下星星的日期
TASK_GOTPRESENT_DATE = 1891;	--记录领取奖励的日期
TASK_FIND_STAR_COUNT = 1892;	--记录找到星星的次数
TASK_PLANT_STAR_COUNT = 1893;	--记录种星星的次数
TASK_ADDED_AWARD_PLANTSTAR_DATE = 1894;	--记录得到种星星双人奖励的日期
TASK_ADDED_AWARD_FINDSTAR_DATE = 1895;	--记录得到找星星双人奖励的日期
TASK_QIAONV_AWARD_DATE = 1896;	--记录领取巧女奖励的日期
TASK_EXPIATION_AWARD = 1897;	--记录玩家有没有领取过奖励补偿
--===============================================================================
GALAXY_MAP1 = 966;
GALAXY_MAP2 = 967;
GALAXY_MAP3 = 968;

REQUIRE_STAR_COUNT = 7;
--===============================================================================
tSexName = {"Thi誹 hi謕","N? hi謕 "};

t7XiItem = {	--名字,物品编号1,物品编号2,物品编号3
		atlas = {"Tinh Tinh мa у",2,0,407},
		star = {"Sao b╪g r琲 xu鑞g tr莕 gian",2,0,408},
		}
--判断当前是不是一男一女组队且都大于１０级且相互距离不超过九屏
function Is_Lovers_Team()	
	local nOldPlayerIndex = PlayerIndex
	if GetTeamSize() == 2 then
		local Sex1,Sex2
		PlayerIndex = GetTeamMember(1)
		if IsPlayerNear(GetTeamMember(2)) < 0 then	--距离太远（超过九屏）
			return 0;
		end;
		Sex1 = GetSex()
		if GetLevel() <= 10 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		PlayerIndex = GetTeamMember(2)
		Sex2 = GetSex()
		if GetLevel() <= 10 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		if Sex1 ~= Sex2 then
			PlayerIndex = nOldPlayerIndex
			return 1
		else
			PlayerIndex = nOldPlayerIndex
			return 0
		end
	else
		PlayerIndex = nOldPlayerIndex
		return 0
	end
end

function Get_Qixi06_State()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 060728 and nDate <= 060806 then
		return 1;
	else
		return 0;
	end;
end;

function nothing()

end;