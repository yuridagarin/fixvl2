--File name:	box_npc.lua
--Describe:		���ر���npc�ű�
--Create Date:	2009-02-18
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

g_szLogTitle = "Event th�ng 3"				--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."B�o r��ng Th�n b�".."<color>: "

g_tbItem = 
{
	--		����		ID1,ID2,	ID3,	����
	[1] = {"K� Th�ch",		2,	1,		30068,	1,	},
	[2] = {"Ch�a Kh�a V�ng",	2,	1,		30069,	1,	},
}


function main()
	if is_march_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho�t ��ng th�ng 3 �� k�t th�c r�i");
		return
	end
	local selTab = {
				"Ta mu�n m� B�o R��ng/open_box",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."�� m� ���c Th�n B� B�o R��ng, c�c h� ph�i mang theo Ch�a Kh�a V�ng tr�n h�nh trang, m�i l�n m� B�o R��ng s� t�n 1 Ch�a Kh�a V�ng.\n- Ch�a Kh�a V�ng c� b�n t�i Ng� C�c..\n- Ho�c s� d�ng K�o S�a c�ng c� th� thu th�p ���c Ch�a Kh�a V�ng..",getn(selTab),selTab);
end

function open_box()
	if check_item_count(g_tbItem[2]) == 0 then
		Say(g_szInfoHead.."C�c h� kh�ng mang theo Ch�a Kh�a V�ng tr�n h�nh trang, h�y ki�m tra l�i h�nh trang c�a m�nh xem!",1,"K�t th�c ��i tho�i/no");
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Say(g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!",1,"K�t th�c ��i tho�i/no");
		return
	end
	if del_item_ex(g_tbItem[2]) == 1 then
		add_item_ex(g_tbItem[1])
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(g_szLogTitle, "B�o r��ng Th�n b�", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

function del_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	
	nRetCode = DelItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, "Tr� v�t ph�m ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Tr� v�t ph�m th�t b�i, ".."DelItem return value = "..nRetCode)
		return 0
	end
end

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end


function no()

end

