--File name:	lantern.lua
--Describe:		���˵���npc�ű�
--Create Date:	2008-08-28
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."L�ng ��n may m�n"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szFileName = "lantern.lua"					--�ļ���

g_tbItem = 
{
	--		"����",		G1,	G2,	G3,		����
	[1] = {"L� th�y",		2,	0,	351,	30	},
	[2] = {"C�y B�t Nh�",	2,	0,	398,	5	},
	[3] = {"C�y B�t Nh� nh�",2,	0,	504,	10	},
	[4] = {"M�nh B�ng th�ch",	2,	1,	148,	2	},
	[5] = {"B�ng th�ch",		2,	1,	149,	5	},
	[6] = {"M�nh Thi�n th�ch",	2,	2,	7,		2	},
	[7] = {"Thi�n th�ch",		2,	2,	8,		5	},
}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end

	local PKState = GetPKFlag()	
	if PKState == 0  then
		Msg2Player("B�n ph�i � tr�ng th�i chi�n ��u m�i th�p ���c l�ng ��n may m�n!")
		return
	end
	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLog("["..g_szLogTitle.." Error]: [Account: "..GetAccount().."][Role Name:"..GetName().."] In file "..g_szFileName.." function GetTargetNpc() return value = 0")
		return
	end

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCKY_DATE_08_MOONCAKE_VIET) then
		SetTask(LUCKY_DATE_08_MOONCAKE_VIET, nDate)
		SetTask(LUCKY_TIMES_08_MOONCAKE_VIET, 0)
	end

	if GetTask(LUCKY_TIMES_08_MOONCAKE_VIET) >= 5 then
		Msg2Player("M�i ng�y m�i ng��i ch� ���c th�p s�ng nhi�u nh�t l� 5 l�ng ��n may m�n.")
		return
	end

	if GetItemCount(2,1,30029) < 1 then
		Msg2Player("Th�p s�ng l�ng ��n may m�n c�n 1 N�n v�ng, tr�n h�nh trang c�a b�n kh�ng c� n�n v�ng, kh�ng th� th�p l�ng ��n may m�n.")
		return
	end

	if DelItem(2,1,30029,1) == 1 then
		SetNpcLifeTime(nNpcIndex, 0)
		SetTask(LUCKY_TIMES_08_MOONCAKE_VIET, GetTask(LUCKY_TIMES_08_MOONCAKE_VIET)+1 )
	
		local nExp = 80000
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m")
		WriteLogEx(szLogTrungThuName,"nh�n",nExp,"�i�m kinh nghi�m")		
		
		give_award()
	else
		Msg2Player("Th�p s�ng l�ng ��n may m�n c�n 1 N�n v�ng, tr�n h�nh trang c�a b�n kh�ng c� n�n v�ng, kh�ng th� th�p l�ng ��n may m�n.")
		return
	end
end

function give_award()
	local nRandom = random(1,100);
	local nBase = 0;
	for i=1, getn(g_tbItem) do
		nBase = nBase + g_tbItem[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tbItem[i]);
			return
		end;
	end;
end

function add_item_ex(tItem)
	local nRetCode,nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],1);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c 1  "..tItem[1]);
		WriteLogEx(szLogTrungThuName,"L�ng ��n may m�n",1,tItem[1])		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

