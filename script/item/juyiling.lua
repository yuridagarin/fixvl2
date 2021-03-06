--脚本名称：聚义令
--脚本功能：使用用后可增加“血恨”效果。<enter><color=yellow>(右键点击使用)
--功能策划：谢徐春
--功能开发：朱力
--开发时间：2009-12-07
--代码修改记录
----20100118	《剑侠贰外传_梁山群雄会_调整方案》 谢徐春
----增加聚义令物品效果，使用后，30s无敌，“天神下凡”攻击力由2.5倍调整到8倍。

Include("\\script\\lib\\globalfunctions.lua");

g_tItem = {
	tInfo	= {"T? Ngh躠 L謓h", 2, 95, 208},
	tAward	= {
		tInfo	= {"Thi猲 th莕 h? ph祄", 2, "Duy tr? %d ph髏"},
		tState	= {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo筰 c玭g t╪g %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"N閕 c玭g t╪g %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Gi韎 h筺 m竨 t╪g %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"Mi詎 d辌h tr筺g th竔 b? h筰 %d"},
			[5] = {9912, "state_dispear",				100,	"", 30, "V? ch trong %s gi﹜"},
			},
		},
	tString = {
		[1] = "V藅 ph萴 kh玭g th? s? d鬾g trong b秐  n祔!",
		[2] = "[%s]: s? d鬾g c? th? nh薾 頲 <color=yellow>摪%s敱<color>HI謚 qu?: \n          <color=green>%s<color>",
		[3] = "Ta mu鑞 nh薾 hi謚 qu稉?%s敱 ",
		[4] = "T筸 th阨 kh玭g c莕",
		[5] = "C?#c h?  nh薾 頲 <color=yellow> hi謚 qu? 摪%s敱<color>:",
	},
};

function OnUse()
	--地图检查
	if 6007 ~= GetMapTemplate(SubWorld) then
		Talk(1, "", "["..g_tItem.tInfo[1].."]:"..g_tItem.tString[1]);
		return 0;
	end
	--兑换菜单
	local strTitle	= format(g_tItem.tString[2],g_tItem.tInfo[1],g_tItem.tAward.tInfo[1],GetInfo())
	local strMenu	= {
		format("\n"..g_tItem.tString[3].."/Award",g_tItem.tAward.tInfo[1]),
			"\n"..g_tItem.tString[4].."/nothing",
	};
	Say(strTitle, getn(strMenu), strMenu);
end

function Award()
	--删除物品
	if 1 ~= DelItem(g_tItem.tInfo[2], g_tItem.tInfo[3], g_tItem.tInfo[4], 1) then
		return 0;
	end
	--添加兑换
	local tState	= g_tItem.tAward.tState;
	if 0 >= getn(tState) then
		return 0;
	end
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
	for i = 1, getn(tState) do
		local nTime = g_tItem.tAward.tInfo[2] * 60 * 18;
		if tState[i][5] then
			nTime = tState[i][5] * 18;
		end
		CastState(tState[i][2], tState[i][3], nTime, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, g_tItem.tAward.tInfo[1]);
	Talk(1, "", format(g_tItem.tString[5],g_tItem.tAward.tInfo[1]).."\n<color=green>"..GetInfo().."<color>");
end

function GetInfo()
	local strInfo	= "";
	local tState	= g_tItem.tAward.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..format(tState[i][4], tState[i][3]);
		if tState[i][6] then
			strInfo = strInfo..format(tState[i][6], tState[i][5]);
		end
		strInfo = strInfo..", ";
	end
	strInfo = strInfo..format(g_tItem.tAward.tInfo[3], g_tItem.tAward.tInfo[2])..".";
	return strInfo;
end

