--create date:2007-08-13 20:03
--author:yanjun
--describe:署名的继承书，使用增加自己100点紫光阁积分
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "T? Quang L謓h";
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(TSK_POINT,GetTask(TSK_POINT)+100);
		Msg2Player("B筺  thu 頲 100 甶觤 T? Quang C竎");
		WriteLog("[Bang h閕 vt 秈]:"..GetName().."S? d鬾g 1	"..g_szItemName);
	end;
end;