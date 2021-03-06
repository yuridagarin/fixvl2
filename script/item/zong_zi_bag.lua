--脚本名称：粽子礼包脚本
--脚本功能：粽子礼包物品对应脚本，使用粽子礼包开出各种相关奖励
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-06-01
--代码修改记录
--==============================公共变量定义区========================
	zong_zi_bag_goods_ID = 1141
TB_zong_zi_bag_prize = {
	{"b竛h 輙 g筼 tr緉g",1122,1,"43%",4300},
	{"b竛h 輙 ng秈 hng",1123,1,"30%",7300},
	{"b竛h 輙 ch﹏ g?",1124,1,"20.5%",9350},
	{"b竛h 輙 B竎 B秓",1125,1,"5%",9850},
	{"b竛h 輙 vui v?",1126,1,"1%",9950},
	{"b竛h 輙 may m緉",1127,1,"0.45%",9995},
	{"b竛h 輙 th筩h anh",1128,1,"0.05%",10000},
}
function OnUse(goods_index)
	local prize_dialog = ""
	for i = 1, getn(TB_zong_zi_bag_prize) do
		prize_dialog = prize_dialog.."\n    <color=yellow>"..TB_zong_zi_bag_prize[i][1].."1<color>, x竎 xu蕋: "..TB_zong_zi_bag_prize[i][4]..""
	end
	Say("<color=green>G頸 ? <color>: B筺 x竎 nh薾 mu鑞 s? d鬾g <color=yellow>H閜 b竛h 輙<color> i l蕐 ph莕 thng? "..prize_dialog,
	2,
	"уng ?/prize_chg",
	"в ta suy ngh? l筰/end_dialog"
	)
end
function prize_chg()
	--携带检测
	if GetItemCount(2,1,zong_zi_bag_goods_ID) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>H閜 b竛h 輙 <color>!")
		return
	end
	if DelItem(2,1,zong_zi_bag_goods_ID,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>H閜 b竛h 輙 <color>!")
		return
	end
	local ran_num = random(1,10000)
	for i = 1,getn(TB_zong_zi_bag_prize) do
		if ran_num <= TB_zong_zi_bag_prize[i][5] then
			local add_flag = AddItem(2,1,TB_zong_zi_bag_prize[i][2],1)
			if add_flag == 1 then
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1"..TB_zong_zi_bag_prize[i][1])
				return
			else
				WriteLog("Ho箃 ng T誸 an Ng?: Ngi ch琲 "..GetName().."S? d鬾g H閜 b竛h 輙 t╪g"..TB_zong_zi_bag_prize[i][1].." th蕋 b筰, k? hi謚:"..add_flag.."")
			end
			if i > 4 then
				Msg2SubWorld("Ch骳 m鮪g:"..GetName().."S? d鬾g H閜 b竛h 輙 i l蕐 1 "..TB_zong_zi_bag_prize[i][1].."!")
				WriteLog("Ho箃 ng T誸 an Ng?: Ngi ch琲 "..GetName().."S? d鬾g H閜 b竛h 輙 i l蕐 1 "..TB_zong_zi_bag_prize[i][1].."!")
			end
		end
	end
end
function end_dialog()
end
