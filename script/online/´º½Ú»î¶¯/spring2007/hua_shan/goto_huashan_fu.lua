--脚本名称：2007年春节华山神行符使用脚本
--脚本功能：使用本物品可以快速到达华山竞技场
--代码编写人：村长
--策划人：阿松
--代码编写时间：2007-01-29
--修改记录：
--=============================公共变量定义区=========================
goto_huashan_fu_id = 671
--==============================函数主逻辑区==========================
function OnUse()
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: Ch璦 gia nh藀 m玭 ph竔 kh玭g th? tham gia ho箃 ng Hoa S琻 C秐h K?!")
		return
	end
	Say("D飊g Hoa S琻 Th莕 ph? c? th? nhanh ch鉵g v祇 H閕 Hoa S琻, nh璶g h筺 ch? 10 ph髏 m韎 s? d鬾g m閠 l莕. Ngi c? mu鑞 s? d鬾g kh玭g?",
	2,
	"Ta mu鑞 n H閕 Hoa S琻/goto_huashan_fast",
	"в ta suy ngh? l筰/end_dialog")
end
--**********************************goto华山***************************
function goto_huashan_fast()
	if GetItemCount(2,0,goto_huashan_fu_id) == 0 then
		Talk(1,"","X竎 nh薾 trong h祅h trang c馻 b筺 c? <color=red>Hoa S琻 Th莕 ph?<color>!")
		return
	end
	if DelItem(2,0,goto_huashan_fu_id,1) ~= 1 then
		Talk(1,"","X竎 nh薾 trong h祅h trang c馻 b筺 c? <color=red>Hoa S琻 Th莕 ph?<color>!")
		return
	end
	local goto_huashan_att = {
		{1564,2912},
		{1552,2899},
		{1562,2935},
		{1581,2924},
		{1595,2901},
		{1579,2896},
		{1566,2902}	
	}
	local att_seq = random(1,getn(goto_huashan_att))
	NewWorld(969,goto_huashan_att[att_seq][1],goto_huashan_att[att_seq][2])
	SetFightState(1)
	SetDeathPunish(0)
	Msg2Player("B筺  i sang tr筺g th竔 PK!")
end
--*********************************空函数******************************
function end_dialog()
end
