--create date:2007-07-02
--author:yanjun
--describe:
--武器银宝箱使用后，可以选择获得1把任意的未开锋的76级武器。
Include("\\script\\lib\\globalfunctions.lua");
TYPE_ITEM = 1;
TYPE_EQUIP = 2;
--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--一页最大显示数量
g_szPacketName = "Rng v? kh? B筩 ";	--包的名字
g_nNeedRoom = 2;
g_nNeedWeight = 150;	
g_tbItem = 
{		--	ID1,ID2,ID3,名字,数量/值,类型
	[1]  = {2,1,375,"V筺 Nh蒼 ch璦 gi竚 nh",1,TYPE_ITEM},
	[2]  = {2,1,376,"H醓 Tinh ch璦 gi竚 nh",1,TYPE_ITEM},
	[3]  = {2,1,377,"Li謙 Di謒 ch璦 gi竚 nh",1,TYPE_ITEM},
	[4]  = {2,1,378,"M穘 Thi猲 Hoa V? ch璦 gi竚 nh",1,TYPE_ITEM},
	[5]  = {2,1,379,"C? лnh ch璦 gi竚 nh",1,TYPE_ITEM},
	[6]  = {2,1,380,"Hi Nh﹏ C莔 ch璦 gi竚 nh",1,TYPE_ITEM},
	[7]  = {2,1,381,"Th莕 H祅h ch璦 gi竚 nh",1,TYPE_ITEM},
	[8]  = {2,1,382,"A La H竛 Trng ch璦 gi竚 nh",1,TYPE_ITEM},
	[9]  = {2,1,383,"Чi H祇 L玦 Thng ch璦 gi竚 nh",1,TYPE_ITEM},
	[10] = {2,1,384,"Th莕 Cung ch璦 gi竚 nh",1,TYPE_ITEM},
	[11] = {2,1,385,"M穘h H? ch璦 gi竚 nh",1,TYPE_ITEM},
	[12] = {2,1,386,"L╪g Phong ch璦 gi竚 nh",1,TYPE_ITEM},
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
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1
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
	Say("Xin ch鋘 v藅 ph萴 b筺 c莕: ",getn(selTab),selTab);
end

function get_item_list(nItemIdx)
	local tSelTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(tSelTab,format(g_tbItem[i][4].."/#add_item(%d,%d)",i,nItemIdx));
	end;
	return tSelTab;
end;

function add_item(nIdx,nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","H祅h trang v? s鴆 l鵦 kh玭g , 甶襲 ch豱h l筰 h祅h trang r錳 m?"..g_szPacketName.."!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nType = g_tbItem[nIdx][6];
		local szItemName = g_tbItem[nIdx][4];
		if nType == TYPE_ITEM then
			nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],g_tbItem[nIdx][5],5);
		elseif nType == TYPE_EQUIP then
			nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],g_tbItem[nIdx][5],5,-1,-1,-1,-1,-1,-1);
		end;
		if nRetCode == 1 then
			Msg2Player("B筺 nh薾 頲 "..szItemName);
			WriteLog("["..g_szPacketName.."]:"..GetName().."Nh薾 頲 v藅 ph萴"..szItemName);
		else
			WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 頲 v藅 ph萴"..szItemName.."AddItem b竜 l?, tr? ph秐 h錳: "..nRetCode);
		end;
	end;
end;