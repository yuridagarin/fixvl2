--脚本名称：一包鸳鸯节使用脚本
--脚本功能：使用此物品给玩家增加一定数量的鸳鸯节
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-08-09
--脚本修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

goods_num = 10
function OnUse(bag_index)
	--物品使用判断
	local goods_id = GetItemParticular(bag_index)
	if goods_id ~= 598 then
		return
	end
	--使用确认提示
	Say("<color=green>G頸 ? <color>: S? d鬾g <color=yellow>T骾 S? у ph? ch?<color>C? th? i l蕐 <color=yellow>"..goods_num.."<color> <color=yellow>S? у ph? ch?<color>, b筺 x竎 nh薾 s? d鬾g ch??",
	2,
	"фi/goods_add",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--物品增加
function goods_add()
	--物品检测
	if GetItemCount(2,1,598) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>T骾 S? у ph? ch?<color>!")
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--物品删除检测
	if DelItem(2,1,598,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>T骾 S? у ph? ch?<color>!")
		return
	end
	--物品增加以及相关log
	local add_flag = AddItem(2,1,588,goods_num)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺  i 頲 r錳."..goods_num.." S? у ph? ch?!")
	else
		WriteLog("фi S? у ph? ch?: Ngi ch琲 ["..GetName().."] фi S? у ph? ch? th蕋 b筰, k? hi謚 th蕋 b筰: "..add_flag)
	end
end
