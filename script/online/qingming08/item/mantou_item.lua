--File name:mantou_item.lua
--Describe:祭拜品道具脚本
--Create Date:2006-3-24
--Author:yanjun
--修改记录：村长2007-03-13增加2007年清明节活动相关代码
Include("\\script\\online\\zgc_public_fun.lua")					--村长的公共函数
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_goods_use_diff = 1859
function OnUse()
	local MapID,MapX,MapY = GetWorldPos()
	if MapID ~= 818 and MapID ~= 819 and MapID ~= 820 then		--确保在那三张地图上
		Talk(1,"","V藅 ph萴 n祔 ch? s? d鬾g khi c髇g t? ti猲.")
		return
	end
	local selTab = {
				"Л頲! Ta mu鑞 s? d鬾g./use",
				"Th玦  sau n祔 h穣 d飊g./end_dialog",
				};
	Say("Ngi x竎 nh薾 c? mu鑞 d飊g M祅 th莡 c髇g t? kh玭g? D飊g v藅 ph萴 n祔 c? th? t╪g <color=yellow>10 l莕<color> kinh nghi謒!",2,selTab)
end
--****************************祭品馒头的使用***************************
function use()
	--时间限制
	local kotow_date_seq = GetTask(tomb_sweep_2008_date_seq)
	if kotow_date_seq >= zgc_pub_day_turn(1) then				
		Talk(1,"","H玬 nay ngi  c髇g 1 l莕, kh玭g th? d飊g <color=yellow>M祅 th莡 c髇g t?<color>, ng祔 mai <color=yellow>d飊g<color> trc khi c髇g, d飊g v藅 ph萴 n祔 c? th? t╪g 10 l莕 甶觤 s鴆 kh醗 th祅h kinh nghi謒. ")
		return
	end
	--次数限制
	local kotow_goods_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	if kotow_goods_diff == 2 or kotow_goods_diff == 5 or kotow_goods_diff == 8 or kotow_goods_diff == 11 then
		Talk(1,"","<color=yellow>M祅 th莡 c髇g t?<color> m鏸 ng祔 ch? c? th? d飊g 1 l莕!")
		return
	end
	--物品删除检测
	if DelItem(2,0,387,1) ~= 1 then
		Talk(1,"","X竎 nh薾 ngi c? mang theo <color=yellow>M祅 th莡 c髇g t?<color>!")
		return
	end
	--使用完成操作
	if kotow_goods_diff == 0 or kotow_goods_diff == nil then
		SetTask(tomb_sweep_2008_goods_use_diff,2)
	else
		SetTask(tomb_sweep_2008_goods_use_diff,(kotow_goods_diff + 2))
	end
	Talk(1,"","Ngi  d飊g <color=yellow>M祅 th莡 c髇g t?<color>, h玬 nay c髇g x竎 su蕋 nh薾 頲 kinh nghi謒 giang h? t╪g.")
end
