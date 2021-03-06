--脚本名称：资源宝箱使用脚本
--脚本功能：玩家使用资源宝箱，获得里面的资源
--策划人：侯盾
--代码开发人：村长
--代码开发时间：2007-08-03
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\lib\\globalfunctions.lua");

	Tb_box_prize_money = {			--金钱奖励概率、金额、说明
		{80,300000,"30 v祅g"},
		{19,500000,"50 v祅g"},
		{1,5000000,"500 lng"}
	}
	Tb_prize_cloth = {
		{				--军师外装
			{0,109,304},
			{0,109,305},
			{0,109,306},
			{0,109,307},
			24,
			"Qu﹏ S? b祇 (ngo筰 trang, 7 ng祔 s? d鬾g)"
		},
		{				--提辖套装
			{
				{0,108,300},
				{0,109,308},
				{0,110,300}
			},
			{
				{0,108,301},
				{0,109,309},
				{0,110,301}
			},
			{
				{0,108,302},
				{0,109,310},
				{0,110,302}
			},
			{
				{0,108,303},
				{0,109,311},
				{0,110,303}
			},
			16,
			"B? Danh B? (Ngo筰 trang, h筺 s? d鬾g 7 ng祔)"
		}
	}
	Tb_unappraisal_cloth_num = {3,5}
	Tb_unappraisal_cloth_info = {
		{0,103,17},
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72},
		{0,100,17},
		{0,100,18},
		{0,100,35},
		{0,100,36},
		{0,100,53},
		{0,100,54},
		{0,100,71},
		{0,100,72},
		{0,100,17},
		{0,100,18},
		{0,100,35},
		{0,100,36},
		{0,100,53},
		{0,100,54},
		{0,100,71},
		{0,100,72},
	}
	Tb_baoshi_info = {
		{80,2642,1,"T骾 B秓 Th筩h"},
		{98,2640,1,"Vt骾 ph鑙 phng V筺 B秓 C竎"},
		{100,2643,1,"V筺 B秓 C竎 V筺 B秓 "}
	}
	Suit_be_date_num = 7
	tb_box_award = {
		[1] = {"B祅 Long B輈h", 90, {2, 1, 1000,1,1},30*24*60*60},
		[2] = {"H遖 Th? B輈h", 250, {2, 1, 1001,1,1}, 30*24*60*60},				
		[3] = {"Bao M秐h Thi猲 Th筩h", 250, {2, 1, 1049,1,1}, 30*24*60*60},
		[4] = {"Bao Thi猲 Th筩h", 250, {2, 1, 1050,1,1}, 30*24*60*60},			
		[5] = {"Huy Chng Chi課 C玭g (Huy Ho祅g)", 100, {2, 1, 9977,1,1}, 30*24*60*60},		
		[6] = {"T骾 Thi猲 Th筩h Tinh Th筩h", 50, {2, 1, 3356,1,1}, 0},		
		[7] = {"Th莕 T礽 B秓 Rng", 10, {2,1,30344,1,1}, 0},		
	}
	
function OnUse(box_index)
	--物品纠正判断
	local goods_id = GetItemParticular(box_index)
	if goods_id ~= 1210 then
		return
	end
	Say("M? rng t礽 nguy猲 s? ng蓇 nhi猲 nh薾 頲 c竎 v藅 ph萴 gi? tr?. M? b﹜ gi? ch??",
	2,
	"Ta mu鑞 m? ngay/open_dtm",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--****************************确认开启宝箱*************************
function open_dtm()
	--携带检测
	if GetItemCount(2,1,1210) == 0 then
		Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 c? mang theo <color=yellow>B秓 rng t礽 nguy猲<color>!")
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(8,200) ~= 1 then
		return
	end
	--删除检测
	if DelItem(2,1,1210,1) ~= 1 then
		Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 c? mang theo <color=yellow>B秓 rng t礽 nguy猲<color>!")
		return
	end
	--奖励增加
		--加钱
	local rand_num = gf_GetRandItemByTable(tb_box_award,1000,2)
	local nRet, nItemIdx = gf_AddItemEx(tb_box_award[rand_num][3], tb_box_award[rand_num][1])
	if nRet ==1 then
		if tb_box_award[rand_num][4] > 0 then
			SetItemExpireTime(nItemIdx, tb_box_award[rand_num][4])
		end
	end
	Msg2Global("Ngi ch琲: "..GetName().." m? b秓 rng t礽 nguy猲 nh薾 頲 "..tb_box_award[rand_num][1])
	WriteLogEx("Cong Thanh Chien","m? rng t礽 nguy猲",1,tb_box_award[rand_num][1] )
end
