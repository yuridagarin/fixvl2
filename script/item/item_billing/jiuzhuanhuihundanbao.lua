--IB物品：九转回魂丹包裹
--功能描述：……
--代码编写人：吴志威
--代码编写时间：2008年6月18日

Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 3
dabaoyuntie_id = 3380
--**********************************物品使用主函数************************************
function OnUse(goods_index)
	Say("B筺 c? mu鑞 d飊g C鰑 Chuy觧 H錳 H錸 Кn Bao фi C鰑 Chuy觧 H錳 H錸 Кn"..goods_num.."?",
	2,
	"фi/use_determine",
	"в suy ngh?/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntie_id) == 0 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c? <color=red>C鰑 Chuy觧 H錳 H錸 Кn Bao<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,30) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntie_id,1) ~= 1 then
		Talk(1,"end_dialog","X竎 nh薾 trong h祅h trang c? <color=red>C鰑 Chuy觧 H錳 H錸 Кn Bao<color>!")
		return
	end
	local add_flag = AddItem(1,0,32,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺 d飊g C鰑 Chuy觧 H錳 H錸 Кn Bao фi "..goods_num.." C鰑 Chuy觧 H錳 H錸 Кn!")
	else
		WriteLog(GetName()..":D飊g C鰑 Chuy觧 H錳 H錸 Кn Bao фi C鰑 Chuy觧 H錳 H錸 Кn th蕋 b筰, v? tr? th蕋 b筰:"..add_flag)
	end
end
