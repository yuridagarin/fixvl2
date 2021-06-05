Include ("\\Script\\lib\\globalfunctions.lua")

--�ύ�ؼ��һ�������
N_PUTINITEMPARAM = 177156
N_MAX_SUMMIT_ITEM_COUNT = 5
N_NEED_MONEY = 100000
STR_PLEASE_SUMMIT_BOOK = "H�y giao m�t t�ch"
STR_SUMMIT_DESC = "X�c ��nh d�ng 5 M�t T�ch S� M�n cao c�p c�ng 10 v�ng ��i k� n�ng b�n ��ng h�nh kh�ng?"
SZ_THIS_SCRIPT = "\\script\\pet\\pet_book_exchange.lua"
MAX_RATE = 10000

--t_item_list = {}
t_book_award=
{
    --{1,400,"��������1��",{2,150,1,1},0,0},
    {1,500,"Ch�n kh� h� th� C�p 2",{2,150,2,1},0,0},
    {1,333,"Ch�n kh� h� th� C�p 3",{2,150,3,1},0,0},
    {1,167,"Ch�n kh� h� th� C�p 4",{2,150,4,1},0,0},
    --{1,400,"��������1��",{2,150,5,1},0,0},
    {1,500,"�ch Th� Di�n D��ng C�p 2",{2,150,6,1},0,0},
    {1,333,"�ch Th� Di�n D��ng C�p 3",{2,150,7,1},0,0},
    {1,167,"�ch Th� Di�n D��ng C�p 4",{2,150,8,1},0,0},
    --{1,400,"ǿ�����1��",{2,150,9,1},0,0},
    {1,500,"C��ng Th�n B� Th� C�p 2",{2,150,10,1},0,0},
    {1,333,"C��ng Th�n B� Th� C�p 3",{2,150,11,1},0,0},
    {1,167,"C��ng Th�n B� Th� C�p 4",{2,150,12,1},0,0},
    --{1,120,"����ʴ��1��",{2,150,13,1},0,0},
    {1,150 ,"�m Phong Th�c C�t C�p 2",{2,150,14,1},0,0},
    {1,100 ,"�m Phong Th�c C�t C�p 3",{2,150,15,1},0,0},
    {1,50 ,"�m Phong Th�c C�t C�p 4",{2,150,16,1},0,0},
    --{1,20 ,"������˫1��",{2,150,17,1},0,0},
    {1,25 ,"Huy�n V� V� Song C�p 2",{2,150,18,1},0,0},
    {1,17 ,"Huy�n V� V� Song C�p 3",{2,150,19,1},0,0},
    {1,8  ,"Huy�n V� V� Song C�p 4",{2,150,20,1},0,0},
    --{1,200,"��������1��",{2,150,21,1},0,0},
    {1,250,"V� H�nh V� T��ng C�p 2",{2,150,22,1},0,0},
    {1,170,"V� H�nh V� T��ng C�p 3",{2,150,23,1},0,0},
    {1,80 ,"V� H�nh V� T��ng C�p 4",{2,150,24,1},0,0},
    --{1,400,"���鸽��1��",{2,150,25,1},0,0},
    {1,500,"Kim Linh Ph� Th� C�p 2",{2,150,26,1},0,0},
    {1,333,"Kim Linh Ph� Th� C�p 3",{2,150,27,1},0,0},
    {1,167,"Kim Linh Ph� Th� C�p 4",{2,150,28,1},0,0},
    --{1,320,"ľ�鸽��1��",{2,150,29,1},0,0},
    {1,400,"M�c Linh Ph� Th� C�p 2",{2,150,30,1},0,0},
    {1,270,"M�c Linh Ph� Th� C�p 3",{2,150,31,1},0,0},
    {1,130 ,"M�c Linh Ph� Th� C�p 4",{2,150,32,1},0,0},
    --{1,400,"ˮ�鸽��1��",{2,150,33,1},0,0},
    {1,500,"Thu� Linh Ph� Th� C�p 2",{2,150,34,1},0,0},
    {1,333,"Thu� Linh Ph� Th� C�p 3",{2,150,35,1},0,0},
    {1,167,"Thu� Linh Ph� Th� C�p 4",{2,150,36,1},0,0},
    --{1,160,"���鸽��1��",{2,150,37,1},0,0},
    {1,200,"Ho� Linh Ph� Th� C�p 2",{2,150,38,1},0,0},
    {1,133 ,"Ho� Linh Ph� Th� C�p 3",{2,150,39,1},0,0},
    {1,67 ,"Ho� Linh Ph� Th� C�p 4",{2,150,40,1},0,0},
    --{1,400,"���鸽��1��",{2,150,41,1},0,0},
    {1,500,"Th� Linh Ph� Th� C�p 2",{2,150,42,1},0,0},
    {1,333,"Th� Linh Ph� Th� C�p 3",{2,150,43,1},0,0},
    {1,167,"Th� Linh Ph� Th� C�p 4",{2,150,44,1},0,0},
    --{1,320,"�ƿ�նӰ1��",{2,150,45,1},0,0},
    {1,400,"Ph� Kh�ng Tr�m �nh C�p 2",{2,150,46,1},0,0},
    {1,270,"Ph� Kh�ng Tr�m �nh C�p 3",{2,150,47,1},0,0},
    {1,130 ,"Ph� Kh�ng Tr�m �nh C�p 4",{2,150,48,1},0,0},
    --{1,320,"�˺�����1��",{2,150,49,1},0,0},
    {1,400,"S�t th��ng gia n�ng c�p 2",{2,150,50,1},0,0},
    {1,270,"S�t th��ng gia n�ng c�p 3",{2,150,51,1},0,0},
    {1,130 ,"S�t th��ng gia n�ng c�p 4",{2,150,52,1},0,0},
    --{1,20 ,"����Ѹ��1��",{2,150,53,1},0,0},
    {1,25 ,"Khinh Linh T�n T�t  C�p 2",{2,150,54,1},0,0},
    {1,17 ,"Khinh Linh T�n T�t  C�p 3",{2,150,55,1},0,0},
    {1,8  ,"Khinh Linh T�n T�t  C�p 4",{2,150,56,1},0,0},
    --{1,120,"����֮��1��",{2,150,57,1},0,0},
    {1,150 ,"V� H�nh Chi C� C�p 2",{2,150,58,1},0,0},
    {1,100 ,"V� H�nh Chi C� C�p 3",{2,150,59,1},0,0},
    {1,50 ,"V� H�nh Chi C� C�p 4",{2,150,60,1},0,0},
}


function PetBookExchangeMain()
	local szTitle = "Ta �ang s� h�u m�t v�i quy�n s�ch k� n�ng b�n ��ng h�nh �ay, ch� c�n ng��i giao cho ta 5 <color=red>M�t t�ch s� m�n cao c�p<color> c�ng 10 v�ng ph� th� t�c, ta s� ��i cho ng��i m�t quy�n. Th� n�o, ��ng � ch�?"
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n ��i /OnExchange")
	tinsert(tbSay, "Th�i, ta kh�ng ��i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function OnExchange()
	--PutinItemBox("title", MaxPutinCount, "prompt", "call_back_script", callback_num)
	PutinItemBox(STR_PLEASE_SUMMIT_BOOK, N_MAX_SUMMIT_ITEM_COUNT, STR_SUMMIT_DESC, SZ_THIS_SCRIPT, N_PUTINITEMPARAM)
end

function OnPutinCheck(PutinItemParam, nWorldIdx, nG, nD, nP)
	--local nLevel = GetItemLevel(nWorldIdx)
	local nOk = 0
	if nG == 0 and nD == 107 and (nP >= 166 and nP <= 179) then
		nOk = 1
	end
	
--	if nOK == 1 then
--		t_item_list[getn(t_item_list) + 1] = nWorldIdx
--	else
--		t_item_list = {}
--	end
--	print(format("Put(%d)=%d", nWorldIdx, nOk))
	return nOk
end

function OnPutinComplete(nPutinItemParam)
	local nMoney = GetCash() or 0
	if nMoney < N_NEED_MONEY then
		Talk(1,"",format("S� v�ng hi�n c� c�a ng��i kh�ng �� %d v�ng!",floor(N_NEED_MONEY/10000)))
		return
	end
	local tbItems = GetPutinItem()
	if getn(tbItems) ~= N_MAX_SUMMIT_ITEM_COUNT then
		Talk(1,"",format("C�n n�p %d quy�n m�t t�ch s� m�n cao c�p!", N_MAX_SUMMIT_ITEM_COUNT))
		return
	end
	Pay(N_NEED_MONEY)
	for i = 1,getn(tbItems) do
		DelItemByIndex(tbItems[i][1], -1)
	end
	gf_EventGiveRandAward(t_book_award, MAX_RATE, 1, "S�ch k� n�ng b�n ��ng h�nh", "B�c ��u L�o Nh�n trao ��i")
--	local nRand = random(1,getn(t_book_award))
--	local nIndex = AddItem(unpack(t_book_award[nRand]))
--	WriteLog(format("[Account:%s Role:%s] exchange pet book(nRand=%d)(Index:%d) %s(%d, %d, %d, %d)"
--			, GetAccount(), GetName(), nRand, nIndex, GetItemName(nIndex), t_book_award[nRand][1], t_book_award[nRand][2], t_book_award[nRand][3], t_book_award[nRand][4]
--			, nBookId, nNeedMoney, nRet
--			))
end

function no()
end