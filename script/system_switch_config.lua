--ϵͳ��������

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
SYS_SWITCH_GEM_SYSTEM = 14 --��ʯϵͳ
SYS_SWITCH_TAIYI = 15 --̫һ��
SYS_SWITCH_STATE_CHESS = 16 --�̽�����
SYS_SWITCH_MERIT = 17 --���ֹ�ѫ�ͽ�������
SYS_SWITCH_EYT = 18 --��Թ̨����
SYS_SWITCH_KF_NEWBATTLE = 19 --�����̨ս

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
	{14, 0, "GemSystem", "H� th�ng �� Qu�"}, -- tat duc lo trang bi
	{15,0, "TaiYi", "�i Ph�n Thi�n L�m"},
	{16, 0, "StateChess", "Tr��ng Ki�m Thi�n Nhai"},
	{17, 0, "Merit", "C�ng tr�ng v� l�m v� �i�m ki�m hi�p"},
	{18, 1, "eyt_battle", "T� V� �n O�n ��i"},
	{19, 0, "kf_newbattle", "Ph�o ��i Chi�n Li�n Server"},
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
		local szMsg = format("[%s]%s",szSystemName, "T�m th�i ch�a mo~ xin vui l�ng ��i")
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
--�����ǽ�ֹ�����޸ĵ����⿪��
SPECIAL_SWITCH_KS_GM 			= 0 --KS�ڲ����԰汾
SPECIAL_SWITCH_EXP_SVR 			= 0 --����������汾 1 la mo gm item, 0 la tat
SPECIAL_SWITCH_INTER_TEST_SVR	= 0 --�������Է�����

--KS�ڲ����԰汾
function IsKsGMSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_KS_GM);
end
--���������
function IsExpSvrSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_EXP_SVR);
end
--�������Է�����
function IsInterTestSvrSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_INTER_TEST_SVR);
end
function IsSpecialSystemOpen(nroute)
	return nroute;
end