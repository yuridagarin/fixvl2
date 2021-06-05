--File name:	feiyan.lua
--Describe:		������������npc�ļ�
--Create Date:	2008-08-26
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."Phi Y�n Ti�n T�"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>Phi Y�n Ti�n T�<color>: "

g_szThisFile = "\\script\\online\\viet_event\\mooncake_08\\npc\\feiyan.lua"


g_tbItem = 
{
	--		����		G1	G2	G3		���� ����
	[1] = {"Ti�u Nh� �",	2,	1,	30030,	20,	1},
	[2] = {"Chi�m Y Ph�",	0,	107,66,		1,	2},
	[3] = {"T� H� M�t t�ch",	0,	107,65,		1,	3},
	[4] = {"T� H� M�t t�ch",	0,	107,65,		1,	3},
	[5] = {"Thi�n H� M�t t�ch",	0,	107,64,		1,	4},
	[6] = {"Thi�n H� M�t t�ch",	0,	107,64,		1,	4},
	[7] = {"Thi�n H� M�t t�ch",	0,	107,64,		1,	4},
	[8] = {"Thi�n H� M�t t�ch",	0,	107,64,		1,	4},
}


function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	if GetLevel() < 20 then
		Say(g_szInfoHead.."Ta ch� t�ng th��ng cho ng��i ��ng c�p 20 tr� l�n. Ng��i r�n luy�n th�m nh�!",0)
		return
	end
	local nTime = tonumber(date("%H"))
	if nTime == 19 or nTime == 6 then
		Say("Quay l�i sau!",0)
	elseif nTime > 6 and nTime < 19 then
		exchange_confirm()
	else
		give_prize()
	end
end

function exchange_confirm()
	local selTab = {
				"Ta mu�n d�ng t�ng 4 b�nh trung thu th��ng./#give_mooncake(1)",
				"Ta mu�n d�ng t�ng 4 b�nh trung thu ��c bi�t./#give_mooncake(2)",
				"Ta s� quay l�i sau.!/no",
				}
	Say(g_szInfoHead.."Ho�t ��ng �T�ng B�nh Trung Thu� di�n ra h�ng ng�y t� 05-09-2008 ��n 24:00 ng�y 05-10-2008. H�ng ng�y t� 7:00 ��n 19:00, ng��i ch�i mang 4 b�nh trung thu b�nh th��ng ho�c 4 b�nh trung thu ��c bi�t ��n t�ng cho NPC Phi Y�n Ti�n T� �� nh�n l�y 1 �i�u ��c. T� 20:00 ��n 06:00 s�ng h�m sau, ng��i ch�i ��n NPC Phi Y�n T� T� �� nh�n ph�n th��ng t� �i�u ��c c�a m�nh.\nCh� �: Sau th�i gian quy ��nh m� ng��i ch�i kh�ng ��n nh�n th��ng th� ph�n th��ng s� b� h�y b�.",getn(selTab),selTab);
end

function give_mooncake(nType)
	local nDate = tonumber(date("%Y%m%d"))

	if GetTask(CAKE_DATE_08_MOONCAKE_VIET) >= nDate then
		Say(g_szInfoHead.."H�m nay ng��i �� t�ng b�nh Trung thu r�i, m�i ng��i ch� ���c t�ng 1 l�n trong ng�y. Ng�y mai h�y ti�p t�c nh�!", 0)
		return
	end
	local nExp = 0
	if nType == 1 then
		if GetItemCount(2,1,30025) < 4 then
			Say(g_szInfoHead.."Ch�a �� s� B�nh Trung Thu c�n thi�t th� ta kh�ng th� cho c�c h� �i�u ��c.!",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
			return
		end
		if DelItem(2,1,30025,4) == 1 then
			nExp = 150000
			ModifyExp(nExp)
			Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m")
			SetTask(CAKE_DATE_08_MOONCAKE_VIET, nDate)
			WriteLogEx(szLogTrungThuName,"nh�n",nExp,"�i�m kinh nghi�m")
		else
			Say(g_szInfoHead.."Ch�a �� s� B�nh Trung Thu c�n thi�t th� ta kh�ng th� cho c�c h� �i�u ��c.!",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
			return
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30026) < 4 then
			Say(g_szInfoHead.."Ch�a �� s� B�nh Trung Thu c�n thi�t th� ta kh�ng th� cho c�c h� �i�u ��c.!",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
			return
		end
		if DelItem(2,1,30026,4) == 1 then
			nExp = 400000
			ModifyExp(nExp)
			Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m")
			SetTask(CAKE_DATE_08_MOONCAKE_VIET, nDate)
			WriteLogEx(szLogTrungThuName,"nh�n",nExp,"�i�m kinh nghi�m")
			local selTab = {
						"Ta ��c ���c 20 Ti�u Nh� �./#make_wish(1)",
						"Ta ��c ���c 1 Chi�m Y Ph�./#make_wish(2)",
						"Ta ��c ���c 1 T� H� M�t T�ch./#make_wish(3)",
						"Ta ��c ���c 1 Thi�n H� M�t T�ch./#make_wish(4)",
						"Ta ��c ���c t�t c� nh�ng m�n tr�n./#make_wish(5)",
						}
			Say(g_szInfoHead.."�a t�, ta �� nh�n �� s� l��ng b�nh trung thu, ta s� cho ng��i m�t �i�u ��c, ng��i ��c �i�u g�?",getn(selTab),selTab);
		else
			Say(g_szInfoHead.."Ch�a �� s� B�nh Trung Thu c�n thi�t th� ta kh�ng th� cho c�c h� �i�u ��c.!",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
			return
		end
	end
end

function make_wish(nType)
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = tonumber(GetTime())
	nWishType = tonumber(nType)
	AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
end

function give_prize()
	local selTab = {
				"Ta ��n ��y �� nh�n ph�n th��ng c�a m�nh./obtain_prize",
				"Ta s� quay l�i sau.!/no",
				}
	Say(g_szInfoHead.."Ch� c� ng��i ch�i t�ng b�nh cho ta m�i ���c nh�n ph�n th��ng.",getn(selTab),selTab);
end

function obtain_prize()
	ApplyRelayShareData(RELAY_DB_08_MOONCAKE_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("B�n v�n ch�a nh�n ���c ph�n th��ng t� Phi Y�n Ti�n T�.",0)
		return
	end

	local szPlayerName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	szPlayerName = GetName()

	nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByKey(szKey, nKey1, nKey2, szPlayerName)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if nWishType == 0 or nWishType == nil then
		Say("B�n v�n ch�a nh�n ���c ph�n th��ng t� Phi Y�n Ti�n T�.",0)
		return
	else
		if nDateNow - nDateFlag > 82800  then
			Say("B�n v�n ch�a nh�n ���c ph�n th��ng t� Phi Y�n Ti�n T�.",0)
			return
		end
		if nPrizeType == 0 then
			Say("B�n v�n ch�a nh�n ���c ph�n th��ng t� Phi Y�n Ti�n T�.",0)
			return
		end
		if nPrizeFlag == 1 then
			Say("H�m nay ng��i �� nh�n ph�n th��ng r�i, ng�y mai h�y ��n nh�!",0)
			return
		end
		
		add_item_ex(g_tbItem[nPrizeType][1], g_tbItem[nPrizeType][2], g_tbItem[nPrizeType][3],g_tbItem[nPrizeType][4],g_tbItem[nPrizeType][5])
		nPrizeFlag = 1
		AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		
		Say(g_szInfoHead.."Ch�c m�ng ��i hi�p! "..g_tbItem[nPrizeType][1].."  �� thu�c v� ��i hi�p.",1,"�a t� Phi Y�n Ti�n T�!/no");
	end

end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx(szLogTrungThuName,"Phi Y�n t� t�",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

