--系统开关配置

SYS_SWITCH_MERIDIAN = 1
SYS_SWITCH_NEW_TASK = 2
SYS_SWITCH_WANJIAZHONG_MISSION = 3
SYS_SWITCH_TONGTIANHUANJING_MISSION = 4
SYS_SWITCH_CIXIU = 5
SYS_SWITCH_UNBIND = 6
SYS_SWITCH_MISSIONTASK = 7
SYS_SWITCH_QIANBIAN_BOX = 8
SYS_SWITCH_ZHENQI_BATTLE = 9
SYS_SWITCH_KF_BATTLE = 10
SYS_SWITCH_3V3 = 11
SYS_SWITCH_TONGMELEE = 12
SYS_SWITCH_CARD_VIP = 13
SYS_SWITCH_GEM_SYSTEM = 14 --宝石系统
SYS_SWITCH_TAIYI = 15 --太一塔
SYS_SWITCH_STATE_CHESS = 16 --仗剑天涯
SYS_SWITCH_MERIT = 17 --武林功勋和剑侠点数
SYS_SWITCH_EYT = 18 --恩怨台开关
SYS_SWITCH_KF_NEWBATTLE = 19 --跨服炮台战

t_switch_config =
{
	--{nSwitchIndex, nOpenStatus, szDesc},
	{ 1, 0, "Meridian"},
	{ 2, 1, "NewTask"},
	{ 3, 0, "WanJianZhongMission"},
	{ 4, 0, "TongTianHuanJingMission"}, --201312 close
	{ 5, 0, "CiXiu"}, -- uan linh close
	{ 6, 1, "EquipUnbind"},
	{ 7, 1, "MissionTask"},
	{ 8, 1, "QianBianHe"},
	{ 9, 0, "ZhenQiBattle"}, --201312 close
	{10, 1, "KuaFuBattle"},
	{11, 1, "3V3"},
	{12, 0, "TongMelee"},
	{13, 0, "CardVip"},
	{14, 0, "GemSystem", "H? th鑞g Ц Qu?"}, -- tat duc lo trang bi
	{15,0, "TaiYi", "秈 Ph莕 Thi猲 L﹎"},
	{16, 0, "StateChess", "Trng Ki誱 Thi猲 Nhai"},
	{17, 0, "Merit", "C玭g tr筺g v? l﹎ v? 甶觤 ki誱 hi謕"},
	{18, 1, "eyt_battle", "T? V?  O竛 Уi"},
	{19, 0, "kf_newbattle", "Ph竜 Уi Chi課 Li猲 Server"},
	{20, 0, "UnUse"},
	{21, 0, "UnUse"},
	{22, 0, "UnUse"},
	{23, 0, "UnUse"},
	{24, 0, "UnUse"},
	{25, 0, "UnUse"},
	{26, 0, "UnUse"},
	{27, 0, "UnUse"},
	{28, 0, "UnUse"},
	{29, 0, "UnUse"},
	{30, 0, "UnUse"},
	{31, 0, "UnUse"},
	{32, 0, "UnUse"},
}

function SystemSwitchInitialize()
	for i = 1, getn(t_switch_config) do
		local t = t_switch_config[i]
		if t[1] == i and t[2] == 1 then
			SetSubSystemSwitch(t[1], t[2])
			print(format("%s System Is Open", t[3]))
		end
	end
	
	return 1
end

function IsMeridianSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_MERIDIAN)
end

function IsNewTaskSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_NEW_TASK)
end

function IsWanJianZhongMissionSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_WANJIAZHONG_MISSION)
end

function IsTongTianHuanJingMissionSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TONGTIANHUANJING_MISSION)
end

function IsMissionTaskSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_MISSIONTASK);
end

function Is3v3SystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_3V3);
end

function IsTongMeleeSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TONGMELEE);
end

function IsVipCardSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_CARD_VIP);
end

function IsGemSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_GEM_SYSTEM, nNotifyType)
end

--KSystemSwitch::IsSystemOpen2 callback too
function _check_subsystem_open(nSubSystemId, nNotifyType)
	local bIsOpen = IsSubSystemOpen(nSubSystemId)
	if 1 ~= bIsOpen and nNotifyType then
		local szSystemName = t_switch_config[nSubSystemId][4] or ""
		local szMsg = format("[%s]%s",szSystemName, "T筸 th阨 ch璦 mo~ xin vui l遪g i")
		if nNotifyType == 1 then
			Msg2Player(szMsg)
		elseif nNotifyType == 2 then
			Talk(1, "", szMsg);
		end
	end
	return bIsOpen
end

function IsMeritSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_MERIT, nNotifyType);
end

function ISEytSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_EYT, nNotifyType);
end

function IsKfNewBattleOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_KF_NEWBATTLE, nNotifyType);
end

---------------------------------------------------------------
--以下是禁止随意修改的特殊开关
SPECIAL_SWITCH_KS_GM 			= 0 --KS内部测试版本
SPECIAL_SWITCH_EXP_SVR 			= 0 --体验服务器版本 1 la mo gm item, 0 la tat
SPECIAL_SWITCH_INTER_TEST_SVR	= 0 --内网测试服务器

--KS内部测试版本
function IsKsGMSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_KS_GM);
end
--体验服务器
function IsExpSvrSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_EXP_SVR);
end
--内网测试服务器
function IsInterTestSvrSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_INTER_TEST_SVR);
end
function IsSpecialSystemOpen(nroute)
	return nroute;
end