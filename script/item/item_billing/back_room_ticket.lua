--作者：严军
--创建日期：08年2月18日16:20
--师门关卡公共函数脚本文件
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szInforHeader = "<color=green>Truy襫 ph? m藅 th蕋<color>:";
g_szThisFile = "\\script\\item\\item_billing\\back_room_ticket.lua";
g_nFaction = 0;	--门派
g_nBackRoomEntryType = 2;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function OnUse(nItemIdx)
	if BR_CheckCityMapID() ~= 1 then
		Talk(1,"","Ch? c? th? d飊g v藅 n祔 trong th祅h.");
		return 0;
	end;
	backroom_main();
end;