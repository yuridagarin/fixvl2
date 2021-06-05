--File name:	girl_npc.lua
--Describe:		��Ů�ڻ���npc�ű�
--Create Date:	2009-02-18
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

g_szLogTitle = "Event thang 3"			--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."Qu�nh Nhi Ti�u Th�".."<color>: "

g_tbItem = 
{
	--		����		ID1,ID2,	ID3,	���� ����
	[1] = {"Hoa h�ng ��",	0,	108,	117,	1,	14},
	[2] = {"Hoa h�ng ph�n",	0,	108,	118,	1,	14},
	[3] = {"Hoa h�ng v�ng",	0,	108,	119,	1,	14},
	[4] = {"Hoa h�ng ��",	0,	108,	120,	1,	14},
	[5] = {"Hoa h�ng ph�n",	0,	108,	121,	1,	14},
	[6] = {"Hoa h�ng v�ng",	0,	108,	122,	1,	14},
	[7] = {"T� �o",		2,	1,		30070,	1,	14},
}


function main()
	if is_women_0308_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho�t ��ng  qu�c t� ph� n� �� k�t th�c");
		return
	end
	local selTab = {
				"T�i h� ��n �� nh�n th��ng.!/want_award",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."Nh�m ch�o m�ng ng�y Qu�c T� Ph� N�, t�t c� c�c nh�n v�t n� ��t c�p �� 40 tr� l�n c� th� ��n g�p Qu�nh Nhi Ti�u Th� �� nh�n qu� t�ng..\nHo�t ��ng ch� di�n ra trong 3 ng�y: t� ng�y 06 ��n 24:00 ng�y 08-03-2009.",getn(selTab),selTab);
end

function want_award()
	if GetSex() ~= 2 then
		Say(g_szInfoHead.."Ch� c� nh�n v�t n� m�i nh�n ���c ph�n th��ng!",1,"K�t th�c ��i tho�i/no");
		return
	end
	if GetLevel() < 40 then
		Say(g_szInfoHead.."C� n��ng ch�a �� c�p �� �� nh�n qu� t�ng l�n n�y. H�y c� g�ng l�n nh�!",1,"V�ng! T�i h� s� quay l�i sau khi c� �� nguy�n li�u!!/no");
		return
	end
	if GetPlayerRoute() == 0 then
		Say(g_szInfoHead.."Ho�t ��ng n�y y�u c�u ng��i ch�i ph�i gia nh�p v�o m�n ph�i.",1,"K�t th�c ��i tho�i/no");
		return
	end
	if GetTask(GAIN_AWARD_09_WOMEN_0308_VIET) == 1 then
		Say(g_szInfoHead.."C� n��ng �� nh�n ph�n th��ng r�i, kh�ng th� nh�n th�m ���c n�a. H�n g�p l�i nh�!",1,"K�t th�c ��i tho�i/no");
		return
	end
	if gf_Judge_Room_Weight(2,20) == 0 then
		Say(g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!",1,"K�t th�c ��i tho�i/no");
		return
	end
	give_award();
end

function give_award()
	local nRandom = random(1,3)
	if GetBody() == 3 then
		add_item_ex(g_tbItem[nRandom])
	elseif GetBody() == 4 then
		add_item_ex(g_tbItem[nRandom+3])
	end
	add_item_ex(g_tbItem[7])
	SetTask(GAIN_AWARD_09_WOMEN_0308_VIET, 1)
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		if tItem[6] > 0 then
			SetItemExpireTime(nItemIdx, tItem[6]*24*3600)
		end
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(g_szLogTitle, "Qu�nh Nhi", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end


function no()

end

