--08春节打包大内青铜器脚本
--by vivi
--2008/01/14

tSuipian = {
		{"M秐h ng c蕄 2",2,1,3212,25,712},
		{"Ph鑙 ki謓 Thanh уng nh c蕄 1",2,1,3220,3,715},
		{"Ph鑙 ki謓 Thanh уng nh c蕄 2",2,1,3221,3,725},
		{"Ph鑙 ki謓 Thanh уng nh c蕄 3",2,1,3222,10,750},
		{"Ph鑙 ki謓 Thanh уng nh c蕄 4",2,1,3223,12,1000}
		};

function OnUse()
	Say("<color=green>сng g鉯 v? kh? Чi N閕 Thanh уng<color>: M鏸 khi s? d鬾g Чi N閕 Thanh уng x竎 su蕋 nh薾 頲 v藅 ph萴 nh? sau, t蕋 c? ng蓇 nhi猲 20 l莕, b筺 ch蕄 nh薾? \n 1 m秐h ng h鱱 d鬾g 100%\n 25 m秐h ng c蕄 2: 71.2% \n 12 Thanh уng nh ph鑙 ki謓 c蕄 4: 25%\n 10 ph鑙 ki謓 Thanh уng nh c蕄 3: 2.5% \n 3 Thanh уng nh ph鑙 ki謓 c蕄 2: 1% \n 3 Thanh уng nh ph鑙 ki謓 c蕄 1 : 0.3%",
		2,
		"Л頲/use_daneiqingtongqi",
		"Kh玭g c莕/nothing")
end

function use_daneiqingtongqi()
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,3209,1) == 1 then
		for j = 1,20 do
			local nRand = random(1,1000);
			local nIdx = 0;
			for i = 1,getn(tSuipian) do
				if nRand <= tSuipian[i][6] then
					nIdx = i;
					break
				end
			end
			AddItem(tSuipian[nIdx][2],tSuipian[nIdx][3],tSuipian[nIdx][4],tSuipian[nIdx][5]);
			AddItem(2,1,3217,1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tSuipian[nIdx][5].."c竔"..tSuipian[nIdx][1]);
		end
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end

function nothing()

end