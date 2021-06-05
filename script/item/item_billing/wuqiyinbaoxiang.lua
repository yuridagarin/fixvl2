--create date:2007-07-02
--author:yanjun
--describe:
--����������ʹ�ú󣬿���ѡ����1�������δ�����76��������
Include("\\script\\lib\\globalfunctions.lua");
TYPE_ITEM = 1;
TYPE_EQUIP = 2;
--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--һҳ�����ʾ����
g_szPacketName = "R��ng v� kh� B�c ";	--��������
g_nNeedRoom = 2;
g_nNeedWeight = 150;	
g_tbItem = 
{		--	ID1,ID2,ID3,����,����/ֵ,����
	[1]  = {2,1,375,"V�n Nh�n ch�a gi�m ��nh",1,TYPE_ITEM},
	[2]  = {2,1,376,"H�a Tinh ch�a gi�m ��nh",1,TYPE_ITEM},
	[3]  = {2,1,377,"Li�t Di�m ch�a gi�m ��nh",1,TYPE_ITEM},
	[4]  = {2,1,378,"M�n Thi�n Hoa V� ch�a gi�m ��nh",1,TYPE_ITEM},
	[5]  = {2,1,379,"C� ��nh ch�a gi�m ��nh",1,TYPE_ITEM},
	[6]  = {2,1,380,"Hi Nh�n C�m ch�a gi�m ��nh",1,TYPE_ITEM},
	[7]  = {2,1,381,"Th�n H�nh ch�a gi�m ��nh",1,TYPE_ITEM},
	[8]  = {2,1,382,"A La H�n Tr��ng ch�a gi�m ��nh",1,TYPE_ITEM},
	[9]  = {2,1,383,"��i H�o L�i Th��ng ch�a gi�m ��nh",1,TYPE_ITEM},
	[10] = {2,1,384,"Th�n Cung ch�a gi�m ��nh",1,TYPE_ITEM},
	[11] = {2,1,385,"M�nh H� ch�a gi�m ��nh",1,TYPE_ITEM},
	[12] = {2,1,386,"L�ng Phong ch�a gi�m ��nh",1,TYPE_ITEM},
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
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1
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
	Say("Xin ch�n v�t ph�m b�n c�n: ",getn(selTab),selTab);
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
		Talk(1,"","H�nh trang v� s�c l�c kh�ng ��, �i�u ch�nh l�i h�nh trang r�i m�"..g_szPacketName.."!");
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
			Msg2Player("B�n nh�n ���c "..szItemName);
			WriteLog("["..g_szPacketName.."]:"..GetName().."Nh�n ���c v�t ph�m"..szItemName);
		else
			WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n ���c v�t ph�m"..szItemName.."AddItem b�o l�, tr� ph�n h�i: "..nRetCode);
		end;
	end;
end;