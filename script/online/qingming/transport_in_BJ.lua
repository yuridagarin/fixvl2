--File name:transport_in_BJ.lua
--Describe:扫墓传送人（传进）
--Create Date:2006-3-16
--Author:yanjun
--修改记录：村长于2007年3月13日进行了2007年清明节活动的修改
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
EnterPointTab = {									--记录三个地图的进入坐标。
			[1] = {818,1636,3181},					--泉州
			[2] = {820,1636,3181},					--汴京
			[3] = {819,1636,3181},					--成都
			}
--================================以下是全局变量=======================================

--================================以上是全局变量========================================
function main()
	if tomb_sweep_2007_date_chk() == -1 then
		Talk(1,"","Thanh minh s緋 n, h穣 gi祅h ch髏 th阨 gian  c髇g t? ti猲.");
	elseif tomb_sweep_2007_date_chk() == 0 then
		Talk(1,"","Ti誸 thanh minh  qua,"..Zgc_pub_sex_name().."nh? n╩ sau n c髇g t? t? ti猲.");
	else
		local selTab = {
					"дn c髇g b竔 m? H祅 i hi謕./#gotocemetery(2)",
					"Nh薾 1 quy觧 ch? nam ho箃 ng Ti誸 Thanh Minh./#AddItem(2,0,685,1)",
					"Ho箃 ng Ti誸 Thanh Minh./knowdetail",
					"H穣 quay l筰 c髇g t? sau nh?!/nothing",
					}
		Say("<color> Trong ti誸 Thanh minh, "..Zgc_pub_sex_name().."c? mu鑞 n m? ph莕 c馻 <color=red>H祅 i hi謕<color> b竔 t? b祔 t? th祅h ? kh玭g?",getn(selTab),selTab);
	end;
end;

--传送玩家到不同的墓园
function gotocemetery(MapIndex)
	if GetLevel() < 11 then
		Say("Ngi v? luy謓 n <color=yellow>c蕄 11<color> m韎 n y t譵 ta.",0);
		return FALSE;
	end
	NewWorld(EnterPointTab[MapIndex][1],EnterPointTab[MapIndex][2],EnterPointTab[MapIndex][3]);
end;
function knowdetail()
	Talk(4,"","Ho箃 ng Ti誸 Thanh Minh di詎 ra v祇 <color=yellow>30/3 - 8/4<color>, ngi ch琲 <color=yellow>c蕄 11<color> u c? th? tham gia b籲g c竎h 甶 t秓 m? c竎 i hi謕.",
				"C髇g b竔 m? ph莕 c竎 v? nh? <color=yellow>Chu i hi謕, H祅 i hi謕, Hi猲 Vi猲 i hi謕<color>. Th阨 gian di詎 ra ho箃 ng ch? c莕 c髇g b竔 b蕋 k? m? ph莕 c馻 m閠 v? i hi謕 b籲g c竎h <color=yellow>v竔 l箉<color> l? 頲.",
				"Do"..Zgc_pub_sex_name().."th祅h t﹎ c髇g b竔 nh薾 頲 m藅  nhi謒 v? c馻 th? l╪g nh﹏, l祄 xong n <color=yellow>th? l╪g nh﹏<color> nh薾 thng.",
				"<color=green>H祅 gia nh﹏: M藅  Thanh Minh<color> ghi l筰 m鏸 ng祔 ch? l祄 頲 <color=yellow>1<color> l莕, nh璶g c? th? d飊g <color=yellow>gi蕐 c髇g t?<color> t╪g s? l莕 ho祅 th祅h nhi謒 v?, <color=yellow>gi蕐 c髇g t?<color> m鏸 ng祔 ch? d飊g 頲 <color=yellow>2<color> l莕!")
end
