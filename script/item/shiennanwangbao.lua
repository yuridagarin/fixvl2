Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--一页最大显示数量
g_szPacketName = "T骾  S? kh? qu猲";	--包的名字
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,名字
	[1]  = {0,2,2501,"Ki誱  s?","S?  Ki誱 (ch璦 nh藀 ph竔, Nga Mi, V? ng c? th? d飊g)"},
	[2]  = {0,5,2501,"C玭  s?","S?  C玭 (ch璦 nh藀 ph竔, Thi誹 l﹎ t鬰 gia, C竔 Bang ? y c? th? d飊g)"},
	[3]  = {0,0,2501," s? Th?","S?  Th? (ch璦 nh藀 ph竔, v? t╪g Thi誹 L﹎, C竔 Bang T躰h Y c? th? d飊g)"},
	[4]  = {0,1,2501,"Ch﹎  s?","S?  Ch﹎ (ch璦 nh藀 ph竔, Л阯g M玭 c? th? d飊g)"},
	[5]  = {0,3,2501,"o  s?","S?  o (t鬰 gia thi誹 l﹎ c? th? d飊g)"},
	[6]  = {0,8,2501,"Trng  s?","S?  Trng (Thi誹 L﹎ Thi襲 T╪g c? th? s? d鬾g)"},
	[7]  = {0,10,2501,"S?  C莔 ","S?  C莔 (Nga Mi T鬰 Gia (c? th? s? d鬾g)"},
	[8]  = {0,9,2501,"S?  B髏","S?  B髏 (V? ng T鬰 Gia c? th? s? d鬾g)"},
	[9]  = {0,6,2501,"S?  Thng","S?  Thng (Dng M玭 Thng K? c? th? s? d鬾g)"},
	[10]  = {0,4,2501,"S?  Cung ","S?  Cung (Dng M玭 Cung K? c? th? s? d鬾g)"},
	[11]  = {0,7,2501,"S?  Nh蒼","S?  Nh蒼 (Ng? чc T? Hi謕 c? th? s? d鬾g)"},
	[12]  = {0,11,2501,"S?  Tr秓 ","S?  Tr秓 (Ng? чc C? S? c? th? s? d鬾g)"},
}
--=========以下代码无须改动================================================================
function OnUse(nItemIdx)
	list_item(1,getn(g_tbItem),nItemIdx);
end;

function list_item(nPageNum,nRecordCount,nItemIdx)
	local tbItemTab = get_item_list(nItemIdx);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbItemTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n Trang trc/#list_item(%d,%d,%d)",nPageNum-1,nRecordCount,nItemIdx));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_item(%d,%d,%d)",nPageNum+1,nRecordCount,nItemIdx));	
	end;
	tinsert(selTab,"\n сng");
	Say("B筺 mu鑞 m? <color=yellow>"..g_szPacketName.."<color> kh玭g? H穣 l鵤 ch鋘 v? kh? b筺 c莕 theo m玭 ph竔",getn(selTab),selTab);
end

function get_item_list(nItemIdx)
	local tSelTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(tSelTab,format(g_tbItem[i][5].."/#add_item(%d,%d)",i,nItemIdx));
	end;
	return tSelTab;
end;

function add_item(nIdx,nItemIdx)
	local selTab = {
				format("уng ?/#add_item_confirm(%d,%d)",nIdx,nItemIdx),
				"ngh? l筰 xem/nothing",
				}
	Say("B筺 mu鑞 ch鋘 <color=yellow>"..g_tbItem[nIdx][4].."<color> v? kh? n祔 kh玭g?",getn(selTab),selTab);
end;

function add_item_confirm(nIdx,nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","H祅h trang v? s鴆 l鵦 kh玭g , 甶襲 ch豱h l筰 h祅h trang r錳 m?"..g_szPacketName.."!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		give_equip(nIdx);
		WriteLog("["..g_szPacketName.."]:"..GetName().."M? 1 t骾 ");
	end;
end;

function give_equip(nIdx)
	local nBody = GetBody();
	local nRetCode = 0;
	nRetCode = AddItem(0,103,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 S?  M穙");
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 S?  M筼 b? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 S?  Y");
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 頲 S?  Y Xu蕋 Th竎, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 S?  Trang ");
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 頲 S?  Trang Xu蕋 Th竎, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 "..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 頲"..g_tbItem[nIdx][4].."c? l鏸, nRetCode:"..nRetCode)
	end;
end;