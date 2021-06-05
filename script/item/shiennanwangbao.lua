Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--һҳ�����ʾ����
g_szPacketName = "T�i �n S� kh� qu�n";	--��������
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,����
	[1]  = {0,2,2501,"Ki�m �n s�","S� �n Ki�m (ch�a nh�p ph�i, Nga Mi, V� �ang c� th� d�ng)"},
	[2]  = {0,5,2501,"C�n �n s�","S� �n C�n (ch�a nh�p ph�i, Thi�u l�m t�c gia, C�i Bang � y c� th� d�ng)"},
	[3]  = {0,0,2501,"�n s� Th�","S� �n Th� (ch�a nh�p ph�i, v� t�ng Thi�u L�m, C�i Bang T�nh Y c� th� d�ng)"},
	[4]  = {0,1,2501,"Ch�m �n s�","S� �n Ch�m (ch�a nh�p ph�i, ���ng M�n c� th� d�ng)"},
	[5]  = {0,3,2501,"�ao �n s�","S� �n �ao (t�c gia thi�u l�m c� th� d�ng)"},
	[6]  = {0,8,2501,"Tr��ng �n s�","S� �n Tr��ng (Thi�u L�m Thi�u T�ng c� th� s� d�ng)"},
	[7]  = {0,10,2501,"S� �n C�m ","S� �n C�m (Nga Mi T�c Gia (c� th� s� d�ng)"},
	[8]  = {0,9,2501,"S� �n B�t","S� �n B�t (V� �ang T�c Gia c� th� s� d�ng)"},
	[9]  = {0,6,2501,"S� �n Th��ng","S� �n Th��ng (D��ng M�n Th��ng K� c� th� s� d�ng)"},
	[10]  = {0,4,2501,"S� �n Cung ","S� �n Cung (D��ng M�n Cung K� c� th� s� d�ng)"},
	[11]  = {0,7,2501,"S� �n Nh�n","S� �n Nh�n (Ng� ��c T� Hi�p c� th� s� d�ng)"},
	[12]  = {0,11,2501,"S� �n Tr�o ","S� �n Tr�o (Ng� ��c C� S� c� th� s� d�ng)"},
}
--=========���´�������Ķ�================================================================
function OnUse(nItemIdx)
	list_item(1,getn(g_tbItem),nItemIdx);
end;

function list_item(nPageNum,nRecordCount,nItemIdx)
	local tbItemTab = get_item_list(nItemIdx);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
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
		tinsert(selTab,format("\n Trang tr��c/#list_item(%d,%d,%d)",nPageNum-1,nRecordCount,nItemIdx));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_item(%d,%d,%d)",nPageNum+1,nRecordCount,nItemIdx));	
	end;
	tinsert(selTab,"\n ��ng");
	Say("B�n mu�n m� <color=yellow>"..g_szPacketName.."<color> kh�ng? H�y l�a ch�n v� kh� b�n c�n theo m�n ph�i",getn(selTab),selTab);
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
				format("��ng �/#add_item_confirm(%d,%d)",nIdx,nItemIdx),
				"ngh� l�i xem/nothing",
				}
	Say("B�n mu�n ch�n <color=yellow>"..g_tbItem[nIdx][4].."<color> v� kh� n�y kh�ng?",getn(selTab),selTab);
end;

function add_item_confirm(nIdx,nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","H�nh trang v� s�c l�c kh�ng ��, �i�u ch�nh l�i h�nh trang r�i m�"..g_szPacketName.."!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		give_equip(nIdx);
		WriteLog("["..g_szPacketName.."]:"..GetName().."M� 1 t�i ");
	end;
end;

function give_equip(nIdx)
	local nBody = GetBody();
	local nRetCode = 0;
	nRetCode = AddItem(0,103,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 S� �n M�o");
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n S� �n M�o b� l�i, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 S� �n Y");
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n ���c S� �n Y Xu�t Th�c, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2504+nBody-1,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1 S� �n Trang ");
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n ���c S� �n Trang Xu�t Th�c, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c "..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n ���c"..g_tbItem[nIdx][4].."c� l�i, nRetCode:"..nRetCode)
	end;
end;