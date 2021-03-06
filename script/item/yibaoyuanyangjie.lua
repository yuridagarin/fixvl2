--脚本名称：一包鸳鸯节使用脚本
--脚本功能：使用此物品给玩家增加一定数量的鸳鸯节
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-08-09
--脚本修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

goods_num = 30
function OnUse(bag_index)
	--物品使用判断
	local goods_id = GetItemParticular(bag_index)
	if goods_id ~= 1158 then
		return
	end
	--使用确认提示
	Say("<color=green>G頸 ? <color>: S? d鬾g <color=yellow>1 t骾 Uy猲 Μng K誸<color> c? th? i l蕐 <color=yellow>"..goods_num.."<color><color=yellow>Uy猲 Μng K誸<color>, b筺 x竎 nh薾 s? d鬾g ch?? ",
	2,
	"S? d鬾g /goods_add",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--物品增加
function goods_add()
	--物品检测
	if GetItemCount(2,1,1158) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>1 T骾 Uy猲 Μng K誸 <color>!")
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--物品删除检测
	if DelItem(2,1,1158,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>1 T骾 Uy猲 Μng K誸 <color>!")
		return
	end
	--物品增加以及相关log
	local add_flag = AddItem(2,1,572,goods_num)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺  i 頲 r錳."..goods_num.." Uy猲 Μng K誸!")
	else
		WriteLog("фi Uy猲 Μng K誸: Ngi ch琲 ["..GetName().."] фi Uy猲 Μng K誸 th蕋 b筰, k? hi謚 th蕋 b筰: "..add_flag)
	end
end
