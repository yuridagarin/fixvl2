Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");

--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--һҳ�����ʾ����
g_szPacketName = " t�i H�u Sinh Kh� �y";	--��������
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,����,ѡ������
	[1]  = {0,2,2500,"Thanh ��c Ki�m ","Thanh ��c Ki�m (Ch�a nh�p L�u Ph�i, Nga Mi Ph�t Gia , V� �ang ��o gia c� th� s� d�ng)"},
	[2]  = {0,5,2500,"Thanh ��c C�n ","Thanh ��c C�n (Ch�a nh�p L�u Ph�i, Thi�u L�m T�c Gia, C�i Bang � Y c� th� s� d�ng)"},
	[3]  = {0,0,2500,"Thanh ��c Th� ","Thanh ��c Th� (Ch�a nh�p L�u Ph�i, Thi�u L�m V� T�ng, C�i Bang T�nh Y c� th� s� d�ng)"},
	[4]  = {0,1,2500,"Thanh ��c Kim","Thanh ��c Ch�m (Ch�a nh�p L�u Ph�i, ���ng M�n c� th� s� d�ng)"},
	[5]  = {0,3,2500,"Thanh ��c �ao","Thanh ��c �ao (Thi�u L�m T�c Gia c� th� s� d�ng)"},
	[6]  = {0,8,2500,"Thanh ��c Tr��ng ","Thanh ��c Tr��ng (Thi�u L�m Thi�n T�ng c� th� s� d�ng)"},
	[7]  = {0,10,2500,"Thanh ��c C�m ","Thanh ��c C�m (Nga Mi T�c Gia c� th� s� d�ng)"},
	[8]  = {0,9,2500,"Thanh ��c B�t ","Thanh ��c B�t (V� �ang T�c Gia c� th� s� d�ng)"},
	[9]  = {0,6,2500,"Thanh ��c Th��ng ","Thanh ��c Th��ng (D��ng M�n Th��ng K� c� th� s� d�ng)"},
	[10]  = {0,4,2500,"Thanh ��c Cung","Thanh ��c Cung (D��ng M�n Cung K� c� th� s� d�ng)"},
	[11]  = {0,7,2500,"Thanh ��c Nh�n","Thanh ��c Nh�n (Hi�p ��cc� th� s� d�ng)"},
	[12]  = {0,11,2500,"Thanh ��c Tr�o","Thanh ��c Tr�o (Ng� ��c c� s� c� th� s� d�ng)"},
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
	nRetCode = AddItem(0,103,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c m�t Thanh ��c M�o");
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n Thanh ��c M�o c� l�i, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c Thanh ��c Y");
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n Thanh ��c Y c� l�i, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c Thanh ��c Trang");
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n ���c Thanh ��c Trang c� l�i, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1,0,6)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c "..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."L�i]:"..GetName().."Nh�n ���c"..g_tbItem[nIdx][4].."c� l�i, nRetCode:"..nRetCode)
	end;
end;