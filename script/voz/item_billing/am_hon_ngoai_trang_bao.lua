--纤羽外装包
--策划：刘天，媛媛
--脚本：墨仙
--创建日期：2008年8月20日

-- tb_prize = {
	-- [1] = {1,0,109,505,"Ti猰 v? trang (nam ti猽 chu萵)"},
	-- [2] = {1,0,109,506,"Ti猰 v? trang (nam kh玦 ng?)"},
	-- [3] = {3,0,108,485,"Ti猰 v? tr﹎ (n? g頸 c秏)",0,109,503,"Ti猰 v? thng (n? g頸 c秏)",0,110,225,"Ti猰 v? qu莕 (n? g頸 c秏)"},
	-- [4] = {3,0,108,486,"Ti猰 v? tr﹎ (ki襲 n?)",0,109,504,"Ti猰 v? thng (ki襲 n?)",0,110,226,"Ti猰 v? qu莕 (ki襲 n?)"}	
	
-- }

function OnUse(nItemIdx)
	local nTemp,nBody;
	nBody = GetBody();
	if Zgc_pub_goods_add_chk(3,50) == 0 then
		return
	end;
	local nExpireTime = tonumber(GetItemExpireTime(nItemIdx))
	if DelItem(2,1,31332,1) ~= 1 then
		Talk(1,"","X竎 nh薾 tr猲 ngi b筺 c?  h錸 ngo筰 trang bao! ");
		return
	end;
	
	for  i= 1,3  do
		local nRet,nIdx = AddItem(0,107 + i, 679 + nBody,1);
		if nRet == 1 then
			SetItemExpireTime(nIdx, nExpireTime)
		end
		Msg2Player("B筺 nh薾 頲 "..GetItemName(0,107 + i, 679 + nBody));
	end
end;

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"end_dialog","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end