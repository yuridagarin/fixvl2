-- 武功技能施放回调时间表
--
-- 说明: 从技能开始施放到技能结束,以技能开始施放时刻为时间参考点,表中指定的技能在指定时刻,将回调此脚本中的时间响应函数on_skill(nSkillID, nTime)
--
-- 格式:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = skill_id_1, time_table = {time_1, time_2, time_3, ...}},
--	{skill_id = skill_id_2, time_table = {time_4, time_5, time_6, ...}},
--	...
-- }
-- 其中,skill_id_n : 技能ID. 即skills.txt中有的合法ID.若非法,则此ID技能的回调时间表忽略
--      time_n     : 指定回调时刻. 即距技能施放时刻的时间(单位:帧).此时间为技能原始速度下的时间,将根据技能施放的实际速度进行加成.若为负,忽略
--
-- 例如:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = 101, time_table = {10}},
--	{skill_id = 102, time_table = {11, 12}},
--	{skill_id = 103, time_table = {1, 2, 3}},
-- }

Skill_ID_Callback_Timetable =
{
}


-- 武功技能施放回调事件表(技能ID)
--
-- 说明: 从技能开始施放到技能结束,表中指定的技能在指定的技能相关事件发生时,将回调此脚本中相应的事件响应函数
--
-- 格式:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = skill_id_1, time_table = {event_1, event_2, event_3, ...}},
--	{skill_id = skill_id_2, time_table = {event_4, event_5, event_6, ...}},
--	...
-- }
-- 其中,skill_id_n : 技能ID. 即skills.txt中有的合法ID.若非法,则此ID技能的回调事件表忽略
--      event_n    : 技能施放相关事件.枚举如下:
--                   "burst"    : 技能开始发招
--                   "effect"   : 技能实际触发(非子弹技效果触发或子弹技子弹生成)
--                   "ankylose" : 技能开始收招
--                   "finish"   : 技能结束
--                   若为非以上列表中的事件,忽略
--                   特别地, "effect"(技能实际触发), 主要针对子技能或招式技能的触发.因为子技能或招式技能没有"burst", "ankylose", "finish"事件
-- 事件/响应函数 对应关系:
--                   "burst"    : do_skill_burst(nSkillID, nSkillType)
--                   "effect"   : do_skill_effect(nSkillID, nSkillType)
--                   "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                   "finish"   : do_skill_finish(nSkillID, nSkillType)
--
--
-- 例如:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = 201, events = {"burst"}},
--	{skill_id = 202, events = {"effect", "ankylose"},
--	{skill_id = 203, events = {"ankylose", "finish"}},
-- }

Skill_ID_Callback_Events =
{
	{skill_id = 870, events = {"finish"}},
	{skill_id = 865, events = {"finish"}},
	{skill_id = 867, events = {"finish"}},
}


-- 武功技能施放回调事件表(技能类型)
--
-- 说明: 从技能开始施放到技能结束,表中指定类型的技能在指定的技能相关事件发生时,将回调此脚本中相应的事件响应函数
--
-- 格式:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = skill_type_1, events = {event_1, event_2, event_3, ...}},
--	{skill_type = skill_type_2, events = {event_4, event_5, event_6, ...}},
--	...
-- }
-- 其中,skill_type_n : 技能类型. 对应于skills.txt中技能的"Type".若非法,则此类型技能的回调事件表忽略
--      event_n      : 技能施放相关事件.枚举如下:
--                     "burst"    : 技能开始发招
--                     "effect"   : 技能实际触发(非子弹技效果触发或子弹技子弹生成)
--                     "ankylose" : 技能开始收招
--                     "finish"   : 技能结束
--                     若为非以上列表中的事件,忽略
--                     特别地, "effect"(技能实际触发), 主要针对子技能或招式技能的触发.因为子技能或招式技能没有"burst", "ankylose", "finish"事件
-- 事件/响应函数 对应关系:
--                     "burst"    : do_skill_burst(nSkillID, nSkillType)
--                     "effect"   : do_skill_effect(nSkillID, nSkillType)
--                     "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                     "finish"   : do_skill_finish(nSkillID, nSkillType)
--
-- 例如:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = 1, events = {"burst", "effect"}},
--	{skill_type = 2, events = {"ankylose", "finish"}},
--	{skill_type = 3, events = {"burst", "effect", "ankylose", "finish"}},
-- }

Skill_Type_Callback_Events =
{
}


-- 武功技能施放回调事件例外表
--
-- 说明: 指定对应于"武功技能施放回调事件表(技能类型)"中的指定技能类型中应该排除的技能
--
-- 格式:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = skill_type_1, exceptions = {skill_id_1, skill_id_2, skill_id_3, ...}},
--	{skill_type = skill_type_2, exceptions = {skill_id_4, skill_id_5, skill_id_6, ...}},
--	...
-- }
-- 其中,skill_type_n : 技能类型. 对应于skills.txt中技能的"Type".若非法,则此类型技能的回调事件例外表忽略
--      skill_id_n   : 技能ID. 即skills.txt中有的合法ID, 此ID技能的类型应该和skill_type所指定的类型一致.若非法或此ID技能的类型不为skill_type所指定的类型,则忽略
--
-- 例如:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = 1, exceptions = {101, 102, 103}},
--	{skill_type = 2, exceptions = {104}},
--	{skill_type = 3, exceptions = {105, 106}},
-- }

Skill_Type_Callback_Exceptions =
{
}


--武功技能施放时间回调函数
function on_skill(nSkillID, nTime,nSkillLevel)
end


--武功技能施放发招回调函数
function do_skill_burst(nSkillID, nSkillType,nSkillLevel)
end


--武功技能施放效果出现回调函数
function do_skill_effect(nSkillID, nSkillType,nSkillLevel)
end


--武功技能施放收招回调函数
function do_skill_ankylose(nSkillID, nSkillType,nSkillLevel)
end
--公共变量定义（村长）
	same_heart_value_taskID = 2015
	random_tasktip_taskID = 1226
	TB_ma_skill_condition = {}
	TB_ma_skill_condition[865] = {
		{500,1,"return ask_mate(2)"},
		{500,1,"return goto_mate(1)"},
		{800,1,"return ask_mate(4)"},
		{800,1,"return goto_mate(3)"},
	}
	TB_ma_skill_condition[867] = {
		{800,0,"return attr_improve(1)",60},
		{800,0,"return attr_improve(2)",120},
		{800,0,"return attr_improve(3)",180},
		{800,0,"return attr_improve(4)",240},
		{800,0,"return attr_improve(5)",300},
	}
	--传过去必须修改为和平pk模式的地图
	TB_peace_map ={}
	TB_peace_map[101] = 1
	TB_peace_map[701] = 1
	TB_peace_map[806] = 1
	TB_peace_map[807] = 1
	TB_peace_map[808] = 1
	TB_peace_map[809] = 1
	TB_peace_map[885] = 1
	TB_peace_map[204] = 1
	TB_peace_map[312] = 1
	TB_peace_map[303] = 1
	TB_peace_map[209] = 1
	TB_peace_map[305] = 1
	TB_peace_map[219] = 1
	TB_peace_map[407] = 1
	TB_peace_map[350] = 1
	TB_peace_map[300] = 1
	TB_peace_map[200] = 1
	TB_peace_map[150] = 1
	TB_peace_map[100] = 1
	TB_peace_map[500] = 1
	--各个地图的传送点。
	TB_transport_map = {}
	TB_transport_map[100]={48672,91840}
	TB_transport_map[102]={49760,98560}
	TB_transport_map[103]={46656,101184}
	TB_transport_map[104]={46240,89664}
	TB_transport_map[150]={55168,98400}
	TB_transport_map[151]={52160,97600}
	TB_transport_map[152]={51680,101600}
	TB_transport_map[153]={56224,101728}
	TB_transport_map[154]={53120,96928}
	TB_transport_map[155]={53728,101312}
	TB_transport_map[200]={37920,90496}
	TB_transport_map[202]={41408,95872}
	TB_transport_map[204]={44704,91232}
	TB_transport_map[207]={42592,98080}
	TB_transport_map[300]={52384,113632}
	TB_transport_map[302]={55264,117952}
	TB_transport_map[303]={54112,110848}
	TB_transport_map[305]={56000,112768}
	TB_transport_map[310]={50400,97216}
	TB_transport_map[350]={44384,98176}
	TB_transport_map[351]={43520,91936}
	TB_transport_map[352]={49024,91552}
	TB_transport_map[353]={45888,95616}
	TB_transport_map[400]={47520,96896}
	TB_transport_map[401]={50144,99744}
	TB_transport_map[402]={45888,99488}
	TB_transport_map[403]={50528,92256}
	TB_transport_map[202]={50560,87264}
	TB_transport_map[418]={49664,102560}
	TB_transport_map[419]={54848,110176}
	TB_transport_map[217]={51392,103456}
	TB_transport_map[106]={50432,100736}
	TB_transport_map[326]={53568,100416}
	TB_transport_map[327]={42688,87872}
	TB_transport_map[151]={50368,99200}
	TB_transport_map[218]={60800,104096}
	TB_transport_map[306]={42624,90976}
	TB_transport_map[406]={41088,101312}
	TB_transport_map[405]={41120,90304}
	TB_transport_map[111]={51296,102560}
	TB_transport_map[213]={52448,102112}
	TB_transport_map[214]={52704,101888}
	TB_transport_map[216]={50816,102848}
	TB_transport_map[210]={51264,102400}
	TB_transport_map[211]={63936,101504}
	TB_transport_map[212]={51424,102400}
	TB_transport_map[315]={51008,101344}
	TB_transport_map[316]={50464,110272}
	TB_transport_map[317]={42688,100896}
	TB_transport_map[318]={42240,101184}
	TB_transport_map[324]={68480,92032}
	TB_transport_map[325]={51392,102272}
	TB_transport_map[604]={41856,101440}
	TB_transport_map[309]={35040,105280}
	TB_transport_map[401]={56032,95360}
	TB_transport_map[107]={41344,101216}
	TB_transport_map[311]={45280,102400}
	TB_transport_map[208]={50464,105760}
	TB_transport_map[408]={50304,88288}
	TB_transport_map[112]={49888,86624}
	TB_transport_map[113]={49504,106208}
	TB_transport_map[321]={52000,116000}
	TB_transport_map[302]={50816,101376}
	TB_transport_map[319]={51264,102784}
	TB_transport_map[320]={51328,102848}
	TB_transport_map[420]={44960,119456}
	TB_transport_map[421]={49888,110624}
	TB_transport_map[215]={55776,106304}
	TB_transport_map[322]={47040,107200}
	TB_transport_map[323]={45984,108224}
	TB_transport_map[414]={52064,113120}
	TB_transport_map[416]={50080,101056}
	TB_transport_map[417]={51392,115552}
	TB_transport_map[103]={53184,97152}
	TB_transport_map[104]={41152,100192}
	TB_transport_map[412]={59488,101728}
	TB_transport_map[413]={60608,108704}
	TB_transport_map[313]={45120,111488}
	TB_transport_map[314]={51040,98016}
	TB_transport_map[307]={47104,102144}
	TB_transport_map[601]={50816,102400}
	TB_transport_map[602]={46496,104224}
	TB_transport_map[600]={43200,102464}
	TB_transport_map[102]={46688,101216}
	TB_transport_map[328]={51936,127840}
	TB_transport_map[109]={50848,87776}
	TB_transport_map[110]={51104,86208}
	TB_transport_map[402]={49824,87168}
	TB_transport_map[403]={50528,94432}
	TB_transport_map[409]={49600,103904}
	TB_transport_map[410]={46144,99904}
	TB_transport_map[411]={43648,111392}
	TB_transport_map[114]={51008,111936}
	TB_transport_map[115]={53504,103168}
	TB_transport_map[116]={55328,98048}
	TB_transport_map[312]={58656,106112}
	TB_transport_map[209]={49504,101856}
	TB_transport_map[204]={51168,101824}
	TB_transport_map[303]={52640,101088}
	TB_transport_map[305]={51136,90208}
	TB_transport_map[407]={51680,101792}
	TB_transport_map[219]={48928,100384}
	TB_transport_map[329]={60352,120384}
	TB_transport_map[108]={44672,102464}
	TB_transport_map[205]={50400,91872}
	TB_transport_map[308]={44800,103360}
	TB_transport_map[404]={41952,87168}
	TB_transport_map[105]={50912,102080}
	TB_transport_map[201]={50880,89664}
	TB_transport_map[203]={50528,100800}
	TB_transport_map[301]={50944,101952}
	TB_transport_map[304]={50368,90368}
	TB_transport_map[504]={41664,101408}
	TB_transport_map[501]={49376,91456}
	TB_transport_map[507]={60096,110784}
	TB_transport_map[508]={57088,106496}
	TB_transport_map[503]={41120,91904}
	TB_transport_map[513]={55552,91968}
	TB_transport_map[514]={48640,99392}
	TB_transport_map[511]={65984,107392}
	TB_transport_map[512]={53792,99680}
	TB_transport_map[505]={42144,99648}
	TB_transport_map[510]={41184,94240}
	TB_transport_map[506]={48288,100416}
	TB_transport_map[500]={58912,97536}
	TB_transport_map[509]={48384,105024}
	
	Tb_accept_mapID = {
	100,102,103,104,105,106,107,108,109,110,
	111,112,113,114,115,116,150,151,200,201,
	202,203,204,205,207,208,209,210,211,212,
	213,214,215,216,217,218,219,300,301,302,
	303,304,305,306,307,308,309,310,311,312,
	313,314,315,316,317,318,319,320,321,322,
	323,324,325,350,326,328,329,400,401,402,
	403,404,405,406,407,408,409,410,411,412,
	413,414,415,416,417,418,419,420,421,500,
	501,503,504,505,506,507,508,509,510,511,
	512,513,514,600,601,602
	}
--武功技能施放结束回调函数
function do_skill_finish(nSkillID, nSkillType,nSkillLevel)
	if nSkillID == 865 or nSkillID == 867 then			--结婚技能相关
		if GetMateName() == "" then
			return
		end
		if GetItemCount(2,1,572) < TB_ma_skill_condition[nSkillID][nSkillLevel][2] then
			Msg2Player("B筺 kh玭g  'Uy猲 ng k誸'!")
			return
		end
		if GetMateOnlineStatus() ~= 1 then
			Msg2Player("уng i kh玭g l猲 m筺g!")
			return
		end
		--2008-01-12增加夫妻技能的PK模式判断
		if GetPKFlag() ~= 0 then
			Talk(1,"","Ch? ch?  luy謓 c蕄 m韎 c? th? s? d鬾g k? n╪g <color=yellow>tng t?<color>!")
			return
		end
		dostring(TB_ma_skill_condition[nSkillID][nSkillLevel][3])
	end
	if nSkillID == 870 then
		local nWeddingCandyNum = GetItemCount(2, 1, 507)
		if nWeddingCandyNum == nil then
			return
		end
		if nWeddingCandyNum <= 0 then
			Msg2Player("Kh玭g c? k裲 m鮪g")
		end
		local nScatterNum
		if nWeddingCandyNum >= 10 then
			nScatterNum = 10
		else
			nScatterNum = nWeddingCandyNum
		end
		local bDelWeddingCandy = DelItem(2, 1, 507, nScatterNum)
		if bDelWeddingCandy == nil or bDelWeddingCandy == 0 then
			return
		end
		nMapID, nX, nY = GetWorldPos()
		DropItem(2, 1, 507, nMapID, nX, nY, 0, 800, nScatterNum)
	end
end
--========================================结婚技能相关===============================================
--*********************************************传送相关*************************************
--****************************传送过去**************************
function goto_mate(SkillLevel)
	--当前地图是否可以传送判断
	if goto_map_chk() ~= 1 then
		Talk(1,"","Khu v鵦 hi謓 t筰 kh玭g s? d鬾g k? n╪g chuy觧 n!")
		return
	end
	--不同等级不同对话
	local ma_trans_dia = ""
	if SkillLevel == 1 then
		ma_trans_dia = "Khu v鵦 hi謓 t筰"
	else
		ma_trans_dia = "{c筺h}"
	end
	Say("S? d鬾g k? n╪g <color=yellow>Tng t?<color> ng c蕄 n祔, chuy觧 n ch? ph鑙 ng蓇 <color=yellow>"..ma_trans_dia.."<color>. B筺 mu鑞 chuy觧 kh玭g?",
	2,
	"X竎 nh薾 truy襫 t鑞g/#goto_mate_deal("..SkillLevel..")",
	"Kh玭g s? d鬾g!/end_dialog"	
	)
end
--**************************进入传送回调**************************
function goto_mate_deal(SkillLevel)
	--首先要得到配偶坐标，所以要进入配偶
	if GetMateOnlineStatus() ~= 1 then
		Msg2Player("уng i kh玭g l猲 m筺g!")
		return
	end
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","goto_mate_chk", tostring(SkillLevel))
end
--**************************进入传送回调**************************
function goto_mate_chk(SkillLevel)
	--判断配偶但前地图是否可以传送
	local map_ID_me = GetWorldPos()
	if TB_transport_map[map_ID_me] == nil then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "Khu v鵦 hi謓 t筰 c馻 ng i kh玭g truy襫 頲")
		return
	end
	--2008-01-12增加夫妻技能的PK模式判断
	if GetPKFlag() ~= 0 then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "Ph鑙 ng蓇 c馻 b筺 kh玭g ? ch?  luy謓 c玭g!")
		return
	end
	local trans_att = ""
	local map_ID,att_X,att_Y = GetWorldPos()
	if tonumber(SkillLevel) <= 1 then
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (floor(TB_transport_map[map_ID][1]/32) * 10000) + floor(TB_transport_map[map_ID][2]/32))..tostring(GetFightState())
	else
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (att_X * 10000) + att_Y)..tostring(GetFightState())
	end
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ma_goto_trans", trans_att)
end
--*************************开始传送过去***********************
function ma_goto_trans(map_att_info)
	if strlen(map_att_info) ~= 13 then
		return
	end
	--2008-01-12增加夫妻技能的PK模式判断
	if GetPKFlag() ~= 0 then
		Talk(1,"","<color=green>G頸 ?<color>: Kh玭g ? ch?  luy謓 c蕄 kh玭g th? d飊g <color=yellow>K? n╪g tng t?<color>!")
		return
	end
	--删除技能消耗品
	if DelItem(2,1,572,1) ~= 1 then
		Msg2Player("Kh玭g  s? lng Uy猲 ng k誸!")
		return
	end
	local skill_level = tonumber(strsub(map_att_info,1,1))
	local map_ID = tonumber(strsub(map_att_info,2,4))
	local att_X = tonumber(strsub(map_att_info,5,8))
	local att_Y = tonumber(strsub(map_att_info,9,12))
	local fight_state = tonumber(strsub(map_att_info,13,13))
	--PK模式切换
	if skill_level <= 2 then
		if TB_peace_map[map_ID] == 1 then
			SetFightState(0)
		else
			SetFightState(1)
		end
	else
		SetFightState(fight_state)
	end
	NewWorld(map_ID,att_X,att_Y)
end
--*************************传过来*****************************
function ask_mate(SkillLevel)
	local map_ID_me = GetWorldPos()
	if TB_transport_map[map_ID_me] == nil then
		Talk(1,"","Khu v鵦 hi謓 t筰 kh玭g s? d鬾g k? n╪g chuy觧 n!")
		return
	end
	--不同等级不同对话
	local ma_trans_dia = ""
	if SkillLevel == 2 then
		ma_trans_dia = "Khu v鵦 hi謓 t筰"
	else
		ma_trans_dia = " b猲 c筺h"
	end
	Say("S? d鬾g k? n╪g <color=yellow>tng t?<color> g鋓 ph鑙 ng蓇 n <color=yellow>"..ma_trans_dia.."<color>. B筺 mu鑞 chuy觧 kh玭g?",
	2,
	"X竎 nh g鋓!/#ask_mate_dtm("..SkillLevel..")",
	"Kh玭g s? d鬾g!/end_dialog"	
	)
end
--************************传送确认********************************
function ask_mate_dtm(SkillLevel)
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ask_mate_tip_callback", tostring(SkillLevel))
end
--*************************传送检测*********************************
function ask_mate_tip_callback(SkillLevel)
	--摆摊状态无法传送
	if IsStalling() == 1 then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "уng i ? tr筺g th竔 b祔 b竛!")
		return
	end
	--当前地图是否可以传送判断
	if goto_map_chk() ~= 1 then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "B秐  ph鑙 ng蓇 產ng ng kh玭g th? a 甶!")
		return
	end
	SetTask(random_tasktip_taskID,tonumber(SkillLevel))
	--不同等级不同对话
	local ma_trans_dia = ""
	if tonumber(SkillLevel) == 2 then
		ma_trans_dia = "Khu v鵦 hi謓 t筰 "
	else
		ma_trans_dia = "{c筺h}"
	end	
	local mate_sex = ""
	if GetSex() == 1 then
		mate_sex = "Ngi ch琲"
	else
		mate_sex = "Tha"
	end
	RandomTaskTipEx("уng i y猽 c莡 b筺 n "..mate_sex..ma_trans_dia.."!","ma_trans_dia")
end
function ask_mate_callback(SkillLevel)
	local map_ID_me = GetWorldPos()
	if TB_transport_map[map_ID_me] == nil then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "Khu v鵦 hi謓 t筰 c馻 b筺 kh玭g chuy觧 頲!")
		return
	end
	local trans_att = ""
	local map_ID,att_X,att_Y = GetWorldPos()
	if tonumber(SkillLevel) <= 2 then
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (floor(TB_transport_map[map_ID][1]/32) * 10000) + floor(TB_transport_map[map_ID][2]/32))..tostring(GetFightState())
	else
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (att_X * 10000) + att_Y)..tostring(GetFightState())
	end
	--PK模式为非练级模式无法传送
	if GetPKFlag() ~= 0 then
		Talk(1,"","<color=green>G頸 ?<color>: Kh玭g ? ch?  luy謓 c蕄 kh玭g th? d飊g <color=yellow>K? n╪g tng t?<color>!")
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "Ph鑙 ng蓇 kh玭g ? ch?  luy謓 c蕄, kh玭g th? s? d鬾g!")
		return
	end
	--删除技能消耗品
	if DelItem(2,1,572,1) ~= 1 then
		Msg2Player("Kh玭g  s? lng Uy猲 ng k誸!")
		return
	end
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ma_ask_trans", trans_att)
end
--***************************开始传过去*****************************
function ma_ask_trans(map_att_info)
	if strlen(map_att_info) ~= 13 then
		return
	end
	local skill_level = tonumber(strsub(map_att_info,1,1))
	local map_ID = tonumber(strsub(map_att_info,2,4))
	local att_X = tonumber(strsub(map_att_info,5,8))
	local att_Y = tonumber(strsub(map_att_info,9,12))
	local fight_state = tonumber(strsub(map_att_info,13,13))
	--PK模式切换
	if skill_level <= 2 then
		if TB_peace_map[map_ID] == 1 then
			SetFightState(0)
		else
			SetFightState(1)
		end
	else
		SetFightState(fight_state)
	end
	NewWorld(map_ID,att_X,att_Y)
end
--*********************当前地图是否可以传送过去判断****************
function goto_map_chk()
	local map_id = GetWorldPos()
	for i = 1,getn(Tb_accept_mapID) do
		if map_id == Tb_accept_mapID[i] then
			return 1
		end
	end
	return 0	
end
--********************传送出错提示*********************************
function trans_err(err_msg)
	Talk(1,"","."..err_msg)
end
--*********************************************辅助技能相关*************************************
function attr_improve(skill_level)
	--判断配偶是否在同一服务器
	local mate_index = GetMatePlayerIndex()
	if mate_index == 0 then
		return
	end
	--删除技能消耗品
	--if DelItem(2,1,572,TB_ma_skill_condition[867][skill_level][2]) ~= 1 then
	--	Msg2Player("鸳鸯结数量不足！")
	--	return
	--end
	--技能效果增加
	--先取出同心值
	local same_heart_value = GetTask(same_heart_value_taskID)
	local index_save = PlayerIndex
	PlayerIndex = mate_index
	local add_percent = (skill_level + floor(same_heart_value/1000))/100
	CastState("state_add_strength", floor(GetStrength()*add_percent), 5400, 1, 867)
	CastState("state_add_energy", floor(GetEnergy()*add_percent), 5400, 1, 8672)
	CastState("state_add_vitality", floor(GetVitality()*add_percent), 5400, 1, 8673)
	CastState("state_add_dexterity", floor(GetDexterity()*add_percent), 5400, 1, 8674)
	CastState("state_add_observe", floor(GetObserve()*add_percent), 5400, 1, 8675)
	PlayerIndex = index_save
end
--****************************空对话****************************
function end_dialog()

end
--========================================结束===============================================
