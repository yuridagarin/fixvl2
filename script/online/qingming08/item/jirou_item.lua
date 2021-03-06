--File name:jirou_item.lua
--Describe:祭拜品道具脚本
--Create Date:2006-3-24
--Author:yanjun
--修改记录：村长2007-03-13增加2007年清明节活动相关代码
Include("\\script\\online\\zgc_public_fun.lua")					--村长的公共函数
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_goods_use_diff = 1859

function OnUse()
	local MapID,MapX,MapY = GetWorldPos()
	if MapID ~= 818 and MapID ~= 819 and MapID ~= 820 then	--确保在那三张地图上
		Talk(1,"","V藅 ph萴 n祔 ch? s? d鬾g khi c髇g t? ti猲.")
		return
	end
	local selTab = {
				"Л頲! Ta mu鑞 s? d鬾g./use",
				"Th玦  sau n祔 h穣 d飊g./end_dialog",
				}
	Say("B筺 mu鑞 d飊g th辴 g?  b竔 t?? V藅 ph萴 n祔 c? th? t╪g <color=yellow>10 l莕<color> t? l? ph莕 thng 甶觤 kinh nghi謒!",2,selTab)
end

function use()
	--时间限制
	local kotow_date_seq = GetTask(tomb_sweep_2008_date_seq)
	if kotow_date_seq >= zgc_pub_day_turn(1) then				
		Talk(1,"","H玬 nay ngi  c髇g 1 l莕, kh玭g th? d飊g <color=yellow>Th辴 g? h秓 h筺<color>, ng祔 mai <color=yellow>d飊g<color> trc khi c髇g, d飊g v藅 ph萴 n祔 c? th? t╪g 10 l莕 kinh nghi謒.")
		return
	end
	--次数限制
	local kotow_goods_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	if kotow_goods_diff == 3 or kotow_goods_diff == 5 or kotow_goods_diff == 9 or kotow_goods_diff == 11 then
		Talk(1,"","<color=yellow>Th辴 g? h秓 h筺<color> m鏸 ng祔 ch? c? th? d髇g 1 l莕!")
		return
	end
	--物品删除检测
	if DelItem(2,0,388,1) ~= 1 then
		Talk(1,"","X竎 nh薾 ngi c? mang theo <color=yellow>Th辴 g? h秓 h筺<color>!")
		return
	end
	--使用完成操作
	if kotow_goods_diff == 0 or kotow_goods_diff == nil then
		SetTask(tomb_sweep_2008_goods_use_diff,3)
	else
		SetTask(tomb_sweep_2008_goods_use_diff,(kotow_goods_diff + 3))
	end
	Talk(1,"","Ngi  d飊g <color=yellow>Th辴 g? h秓 h筺<color>, h玬 nay c髇g x竎 su蕋 nh薾 頲 kinh nghi謒 giang h? t╪g.")
end
