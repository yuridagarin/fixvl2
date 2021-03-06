--脚本名称：结婚卷轴使用函数
--脚本功能：结婚卷轴使用调用函数
--策划人：铁羊
--代码开发人：村长
--代码开发时间:2007-04-25
--代码修改记录：
--君子好色，娶之有道
--================================公共变量定义区================================
Frag_att_num_TaskID = 1220
Tb_ma_task_reel = {
	{565,"M藅  L璾 tinh",14},
	{566,"M藅  T? Kh?",21},
	{567,"M藅  Tng Th魕",42},
}
--================================卷轴使用主函数================================
function OnUse(goods_index)
	--判断是否结婚
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Ch? ?<color>: Ch璦 k誸 h玭 ch璦 th? s? d鬾g v藅 ph萴 n祔!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--取得卷轴种类
	local goods_diff = 0 				
	for i = 1,getn(Tb_ma_task_reel) do
		if goods_id == Tb_ma_task_reel[i][1] then
			goods_diff = i
		end
	end
	Say("<color=green>G頸 ?<color>: S? d鬾g"..Tb_ma_task_reel[goods_diff][2].." c? th? t╪g t鋋  L璾 tinh trong <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color> <color=yellow>"..Tb_ma_task_reel[goods_diff][3].."<color>. Sao h??",
	2,
	"фi/#use_dtm("..goods_diff..")",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--****************************卷轴使用**********************
function use_dtm(goods_diff)
	--卷轴携带检测
	if GetItemCount(2,1,Tb_ma_task_reel[goods_diff][1]) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_ma_task_reel[goods_diff][2].."<color>!")
		return
	end
	--纤云飞星谱携带检测
	if GetItemCount(2,1,583) == 0 then
		Talk(1,"","<color=green>G頸 ?<color>: Xin x竎 nh薾 b筺 c? mang<color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color>!")
		return
	end	
	--卷轴删除检测
	if DelItem(2,1,Tb_ma_task_reel[goods_diff][1],1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_ma_task_reel[goods_diff][2].."<color>!")
		return
	end
	--增加任务次数
	SetTask(Frag_att_num_TaskID,(GetTask(Frag_att_num_TaskID)+Tb_ma_task_reel[goods_diff][3]))
	Talk(1,"","<color=green>G頸 ?<color>: Xin ch骳 m鮪g! T鋋  L璾 tinh  t╪g<color=yellow>"..Tb_ma_task_reel[goods_diff][3].."<color>!")
end
