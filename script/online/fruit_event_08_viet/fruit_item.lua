--File name:	fruit_item.lua
--Describe:		ˮ��������߽ű�
--Item ID:		2,1,30008	--	ˮ����
--				2,1,30009	--	����
--				2,1,30010	--	����֦
--				2,1,30011	--	ɽ��
--				2,1,30012	--	ţ�̹�
--				2,1,30013	--	����
--Create Date:	2008-06-23
--Author:		chenbenqian


DATE_FRUIT_ITEM_VIET_END		= 2008080100;		-- ˮ���������ʹ�ý�������

g_tFruitItemList = 
{
	--		"����",	G1,G2,G3,����,����
	[1] = {"T�i tr�i c�y",2,1,30008},				--�趨�������������Ϊ1
	[2] = {"Nho",	2,1,30009,8,	60},
	[3] = {"M�ng c�u",2,1,30010,80,	20},
	[4] = {"M�ng c�t",	2,1,30011,800,	14},
	[5] = {"V� s�a",2,1,30012,8000,	4},
	[6] = {"S�u ri�ng",	2,1,30013,80000,2},		--�趨�������������Ϊ6
}

g_tPrizeItemList =
{
	--		"����",		G1,	G2,		G3,	����
	[1] = {"Chi�m Y Ph�",	0,	107,	66,	10},
	[2] = {"Thi�n H� M�t t�ch",	0,	107,	64,	40},
	[3] = {"T� H� M�t t�ch",	0,	107,	65,	20},
	[4] = {"B� Kim M�t t�ch",	0,	107,	61,	500},
	[5] = {"B� Th�ch M�t t�ch",	0,	107,	62,	500},
	[6] = {"Ng� Qu� M�t t�ch",	0,	107,	63,	500},
	[7] = {"M�nh Thi�n th�ch",	2,	2,		7,	500},
	[8] = {"Thi�n th�ch",		2,	2,		8,	2000},
	[9] = {"M�nh B�ng th�ch",	2,	1,		148,	8000},
	[10] = {"B�ng th�ch",		2,	1,		149,	2500},
	[11] = {"C�y B�t Nh�",	2,	0,		398,	3000},
	[12] = {"C�y B�t Nh� nh�",2,	0,		504,	5000},
	[13] = {"L� th�y",		2,	0,		351,	10000},
}

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_FRUIT_ITEM_VIET_END then
		return
	end
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","V�t ph�m b�n �ang s� d�ng kh�ng ��ng y�u c�u!");
		return 0;
	end;
	if nType ~= 1 and nType ~= 6 then
		if GetTask(2441) >= 25000000 then
			Msg2Player("�i�m kinh nghi�m nh�n ���c do tham gia ho�t ��ng L� h�i tr�i c�y �� ��t gi�i h�n 25.000.000, b�n kh�ng th� ti�p t�c s� d�ng v�t ph�m.");
			Talk(1,"","�i�m kinh nghi�m nh�n ���c do tham gia ho�t ��ng L� h�i tr�i c�y �� ��t gi�i h�n 25.000.000, b�n kh�ng th� ti�p t�c s� d�ng v�t ph�m.");
			return
		end
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		use(nType);
	end;
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(g_tFruitItemList) do
		if genre == g_tFruitItemList[i][2] and detail == g_tFruitItemList[i][3] and particular == g_tFruitItemList[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nType)
	if nType == 1 then
		local nRandom = random(1,100);
		local nBase = 0;
		for i=2, getn(g_tFruitItemList) do
			nBase = nBase + g_tFruitItemList[i][6];
			if nRandom <= nBase then
				add_item_ex(g_tFruitItemList[i]);
				return
			end;
		end;
	else
		local szLogTitle = "L� h�i tr�i c�y : "..g_tFruitItemList[nType][1];
		local nExp = g_tFruitItemList[nType][5];
		local nExpTotal = GetTask(2441);
		if nExpTotal >= 25000000 then
			Msg2Player("�i�m kinh nghi�m nh�n ���c do tham gia ho�t ��ng L� h�i tr�i c�y �� ��t gi�i h�n 25.000.000, s� d�ng S�u ri�ng s� kh�ng nh�n ���c �i�m kinh nghi�m, nh�ng v�n c� c� h�i nh�n ���c ph�n th��ng kh�c.");
			--Talk(1,"","�i�m kinh nghi�m nh�n ���c do tham gia ho�t ��ng L� h�i tr�i c�y �� ��t gi�i h�n 25.000.000, s� d�ng S�u ri�ng s� kh�ng nh�n ���c �i�m kinh nghi�m, nh�ng v�n c� c� h�i nh�n ���c ph�n th��ng kh�c.");
			nExp = 0;
		elseif nExpTotal + g_tFruitItemList[nType][5] > 25000000 then
			nExp = 25000000 - nExpTotal;
		end

		if nExp ~= 0 then
			ModifyExp(nExp);
			SetTask( 2441, (nExpTotal+nExp) )
			Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m");
			WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nExp.."  �i�m kinh nghi�m");
		end

		if nType == 6 then
			local nRandom = random(1,100000);
			local nBase = 0;
			for i=1, getn(g_tPrizeItemList) do
				nBase = nBase + g_tPrizeItemList[i][5];
				if nRandom <= nBase then
					add_item_ex2(g_tPrizeItemList[i]);
					return
				end;
			end;
		end;
	end;
end;

function add_item_ex(tItem)
	local szLogTitle = "L� h�i tr�i c�y : ".."T�i tr�i c�y";		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1  "..tItem[1]);
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

function add_item_ex2(tItem)
	local szLogTitle = "L� h�i tr�i c�y : ".."V�t ph�m t� S�u ri�ng";		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
	local nRetCode = 0;
	nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1  "..tItem[1]);
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1]);
	else
		WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end
