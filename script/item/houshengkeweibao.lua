Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");

--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--一页最大显示数量
g_szPacketName = " t骾 H藆 Sinh Kh? 髖";	--包的名字
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,名字,选项描述
	[1]  = {0,2,2500,"Thanh чc Ki誱 ","Thanh чc Ki誱 (Ch璦 nh藀 L璾 Ph竔, Nga Mi Ph藅 Gia , V? ng Чo gia c? th? s? d鬾g)"},
	[2]  = {0,5,2500,"Thanh чc C玭 ","Thanh чc C玭 (Ch璦 nh藀 L璾 Ph竔, Thi誹 L﹎ T鬰 Gia, C竔 Bang ? Y c? th? s? d鬾g)"},
	[3]  = {0,0,2500,"Thanh чc Th? ","Thanh чc Th? (Ch璦 nh藀 L璾 Ph竔, Thi誹 L﹎ V? T╪g, C竔 Bang T辬h Y c? th? s? d鬾g)"},
	[4]  = {0,1,2500,"Thanh чc Kim","Thanh чc Ch﹎ (Ch璦 nh藀 L璾 Ph竔, Л阯g M玭 c? th? s? d鬾g)"},
	[5]  = {0,3,2500,"Thanh чc o","Thanh чc o (Thi誹 L﹎ T鬰 Gia c? th? s? d鬾g)"},
	[6]  = {0,8,2500,"Thanh чc Trng ","Thanh чc Trng (Thi誹 L﹎ Thi襫 T╪g c? th? s? d鬾g)"},
	[7]  = {0,10,2500,"Thanh чc C莔 ","Thanh чc C莔 (Nga Mi T鬰 Gia c? th? s? d鬾g)"},
	[8]  = {0,9,2500,"Thanh чc B髏 ","Thanh чc B髏 (V? ng T鬰 Gia c? th? s? d鬾g)"},
	[9]  = {0,6,2500,"Thanh чc Thng ","Thanh чc Thng (Dng M玭 Thng K? c? th? s? d鬾g)"},
	[10]  = {0,4,2500,"Thanh чc Cung","Thanh чc Cung (Dng M玭 Cung K? c? th? s? d鬾g)"},
	[11]  = {0,7,2500,"Thanh чc Nh蒼","Thanh чc Nh蒼 (Hi謕 чcc? th? s? d鬾g)"},
	[12]  = {0,11,2500,"Thanh чc Tr秓","Thanh чc Tr秓 (Ng? c c? s? c? th? s? d鬾g)"},
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
	nRetCode = AddItem(0,103,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 m閠 Thanh чc M筼");
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 Thanh чc M筼 c? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 Thanh чc Y");
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 Thanh чc Y c? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 Thanh чc Trang");
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 頲 Thanh чc Trang c? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1,0,6)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 "..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."L鏸]:"..GetName().."Nh薾 頲"..g_tbItem[nIdx][4].."c? l鏸, nRetCode:"..nRetCode)
	end;
end;