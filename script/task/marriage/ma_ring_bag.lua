--脚本名称：钻戒礼盒
--脚本功能：靠钻戒礼盒给钻戒
--策划人：铁羊
--代码开发人：村长
--代码开发时间：2007年6月20日
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Tb_ma_ring = {104,105}
function OnUse()
	Say("<color=green>G頸 ?<color>: S? d鬾g <color=yellow>h閜 nh蒼<color> c? th? c? nh蒼 kim cng tng 鴑g t輓h c竎h<color=yellow>nh蒼 kim cng<color> ph? h頿 t輓h c竎h. Sao h??",
	2,
	"фi/ma_ring_bag_use",
	"в ta suy ngh? l筰/end_dialog"
	)
end
function ma_ring_bag_use()
	--礼包携带检测
	if GetItemCount(2,1,586) == 0 then
		Talk(1,"","<color=green>G頸 ?<color>: Xin x竎 nh薾 b筺 c? mang <color=yellow>h閜 nh蒼 kim cng<color>!")
		return
	end
	--负重空间检测
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--礼包删除检测
	if DelItem(2,1,586,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ?<color>: Xin x竎 nh薾 b筺 c? mang <color=yellow>h閜 nh蒼 kim cng<color>!")
		return
	end
	--增加奖励
	AddItem(0,102,Tb_ma_ring[GetSex()],1)
end
