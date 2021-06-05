Include("\\script\\online\\zgc_public_fun.lua")

MAX_SEL_PER_PAGE = 5;

way_book ={
	{"D�ch C�n Kinh (Thi�u L�m t�c gia)",0,107,101},
	{"Nh� Lai Kinh (Thi�u L�m v� t�ng)",0,107,102},
	{"T�y T�y Kinh (Thi�u L�m thi�n t�ng)",0,107,103},
	{"H�p tinh m�t t�ch (���ng M�n)",0,107,104},
	{"V�n T��ng m�t t�ch (Nga My ph�t gia)",0,107,105},
	{"Thi�n �m Ch�n H�n ph� (Nga My t�c gia)",0,107,106},
	{"Gi�ng Long Ch��ng ph� (C�i Bang T�nh y)",0,107,107},
	{"�� C�u Tr�n ph� (C�i Bang � y)",0,107,108},
	{"Th�i C�c Ki�m Kinh (V� �ang ��o gia)",0,107,109},
	{"Th�i C�c T�m Kinh (V� �ang t�c gia)",0,107,110},
	{"To�n Long th��ng ph� (D��ng M�n th��ng k�)",0,107,111},
	{"B� V��ng ti�n ph� (D��ng M�n cung k�)",0,107,112},
	{"Thi V��ng m�t t�ch (Hi�p ��c)",0,107,113},
	{"T� C� m�t t�ch (Ng� ��c C� S�)",0,107,114}
}
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	show_page(1,getn(way_book));
end

function show_page(nPageNum,nRecordCount)
	local selTab = {};
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
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,way_book[i][1].."/#book_add_dtm("..i..")");
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"\n Trang tr��c/#show_page("..(nPageNum-1)..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,"\n Trang sau/#show_page("..(nPageNum+1)..","..nRecordCount..")");	
	end;
	tinsert(selTab,"\n ��ng");
	Say("Xin ch�n m�t t�ch s� m�n mu�n ��i!",getn(selTab),selTab);
end

--********************************��Ʒʹ�þ���************************************
function book_add_dtm(book_seq)
	Say("B�n �� ch�n"..way_book[book_seq][1]..",mu�n ��i kh�ng?",
	2,
	"��ng �/#book_add("..book_seq..")",
	"�� ta suy ngh� l�i/end_dialog")
end
--***********************************�ؼ�����**************************************
function book_add(book_seq)
	if GetItemCount(2,1,1010) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n h�nh trang c� <color=red>Lang Ho�n Ph�c ��a M�t H�p<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	if DelItem(2,1,1010,1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n h�nh trang c� <color=red>Lang Ho�n Ph�c ��a M�t H�p<color>!")
		return
	end
	local add_flag = AddItem(way_book[book_seq][2],way_book[book_seq][3],way_book[book_seq][4],1)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng B�n nh�n ���c 1 m�t t�ch s� m�n!")
	else
		WriteLog(GetName()..":��i m�t t�ch s� m�n:"..way_book[book_seq][1].." th�t b�i, k� hi�u:"..add_flag)
	end
end