--脚本名称：结婚聘礼包
--脚本功能：打开结婚聘礼包，获得结婚相关物品
--功能策划人：铁羊
--代码开发人：村长
--代码开发时间：2007-6-20
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Tb_prize_bag = {
	{"G蕀 lam",2,1,15,10},
	{"Чo Hoa Hng",1,1,12,36},
	{"B竛h B閠 v祅g",1,1,15,36},
	{"G蕀 v祅g",2,1,54,36},
	{"T? Ng? S綾",2,9,3,36},
	{"D? Minh Ch﹗",2,1,39,5},
}
function OnUse()
	local prize_list = ""
	for i = 1,getn(Tb_prize_bag) do
		prize_list = prize_list.."<color=yellow>"..Tb_prize_bag[i][5].."<color> <color=yellow>"..Tb_prize_bag[i][1].."<color>\n    "
	end
	prize_list = prize_list .."B筺 mu鑞 d飊g t骾 l? v藅 nh h玭?"
	Say("<color=green>G頸 ?<color>: M? t骾 l? v藅 nh h玭, nh薾 頲: \n    "..prize_list,
	1,
--	"T玦 mu鑞 m? ra/prize_bag_use",
	"в ta suy ngh? l筰/end_dialog"
	)
end
function prize_bag_use()
	--礼包携带检测
	if GetItemCount(2,1,585) == 0 then
		Talk(1,"","<color=green>G頸 ?<color>: Xin x竎 nh薾 b筺 c? mang <color=yellow>t骾 l? v藅 nh h玭<color>!")
		return
	end
	--负重空间检测
	if Zgc_pub_goods_add_chk(6,160) ~= 1 then
		return
	end
	--礼包删除检测
	if DelItem(2,1,585,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ?<color>: Xin x竎 nh薾 b筺 c? mang <color=yellow>t骾 l? v藅 nh h玭<color>!")
		return
	end
	--增加奖励
	for i = 1 ,getn(Tb_prize_bag) do
		AddItem(Tb_prize_bag[i][2],Tb_prize_bag[i][3],Tb_prize_bag[i][4],Tb_prize_bag[i][5])
	end
end
