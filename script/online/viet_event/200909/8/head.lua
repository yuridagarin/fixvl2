Include("\\script\\lib\\globalfunctions.lua");

GIVE_CAKE_ID = 2429

-- Ph�n th��ng 3 em b� seed 1000
tXiaoAwardList = {
	{"30 v�ng", 240, "Earn(%d)", 300000},
	{"30 �i�m danh v�ng", 100, "ModifyReputation(%d,0)",30},
	{"30 �i�m S� M�n", 100, "SetTask(336, GetTask(336) + %d)",30},
	{"T� H� m�t T�ch", 19, {0,107,65,1},0},
	{"Thi�n H� M�t T�ch", 20, {0,107,64,1},0},
	{"Chi�m Y Ph�",	10, {0,107,66,1},0},
	{"T� Linh T� � Ph�", 20, {0,107,161,1},0},
	{"T� Linh Thi�n � Ph�", 20, {0,107,160,1},0},
	{"T� Linh Chi�n � Ph�", 10, {0,107,159,1},0},
	{"��u H�n", 250, {2,1,1157,1},7*24*60*60},
	{"Qu�n c�ng ��i", 50, {2,1,9998,1},7*24*60*60},
	{"Thi�n Th�ch Tinh Th�ch", 60, {2,1,1009,1},0},
	{"Ti�u Ki�p T�n", 100, {2,0,141,1},7*24*60*60},
	{"Thi�n Th�ch Linh Th�ch", 1, {2,1,1068,1},7*24*60*60},
}

function npc_xiao_talk()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20090928 or nDate > 20091025 then
		Say(szNpcName.."Ho�t ��ng �� k�t th�c.",0)
		return
	end	
	local tSay ={
		"T�ng b� 10 B�nh ��u Xanh/give_moon_cake",
		"Ta ch� gh� qua!/nothing";
	}	
	Say(szNpcName.."Trung Thu ��n r�i, b� th�m �n b�nh qu�! C� ai t�ng b� <color=yellow>B�nh ��u Xanh<color> kh�ng?",getn(tSay),tSay);	
end

function give_moon_cake()
	local nDate = tonumber(date("%d"))
	local nTaskVal = GetTask(GIVE_CAKE_ID)
	if GetLevel() < 50 then
		Say(szNpcName.."��ng c�p ch�a �� 50. H�y r�n luy�n th�m nha!",0)
		return
	end
	if GetPlayerRoute() == 0 then
		Say(szNpcName.."Ch�a gia nh�p m�n ph�i b� kh�ng ch�u nh�n qu� ��u!",0)
		return
	end
	if GetByte(nTaskVal, XIAO_BYTE_ID) == nDate then
		Say(szNpcName.."H�m nay �� t�ng cho b� r�i, mai t�ng n�a nha!",0)
		return
	end
	if GetItemCount(2,1,30108) < 10 then
		Say(szNpcName.."G�t b� h�? Kh�ng �� 10 B�nh ��u Xanh!",0)
		return
	end	
	if gf_JudgeRoomWeight(1,10,szNpcName) == 0 then
		return
	end
	if DelItem(2,1,30108,10) == 1 then
		SetTask(GIVE_CAKE_ID, SetByte(nTaskVal,XIAO_BYTE_ID,nDate))
		ModifyExp(1500000)
		Msg2Player("B�n nh�n ���c 1500000 �i�m kinh nghi�m.")
		GiveAward()		
		Say(szNpcName.."C�m �n nhi�u nha!",0)
	else
		Say(szNpcName.."G�t b� h�? Kh�ng �� 10 B�nh ��u Xanh!",0)
		return
	end
end

function GiveAward()
	local nRand = gf_GetRandItemByTable(tXiaoAwardList,1000,1)
	if type(tXiaoAwardList[nRand][3]) == "table" then
		local nRetCode, nIndex = gf_AddItemEx(tXiaoAwardList[nRand][3], tXiaoAwardList[nRand][1]);
		if nRetCode == 1 then
			if tXiaoAwardList[nRand][4] ~= 0 then
				SetItemExpireTime(nIndex, tXiaoAwardList[nRand][4]);
			end
		end
	else
		dostring(format(tXiaoAwardList[nRand][3], tXiaoAwardList[nRand][4]));		
		Msg2Player("B�n nh�n ���c "..tXiaoAwardList[nRand][1]);
	end	
	WriteLogEx("Hoat dong thang 10","t�ng b�nh",1,tXiaoAwardList[nRand][1])
end

function nothing()
	Say(szNpcName.."Hu hu sao kh�ng ai t�ng b�nh cho b� v�y?",0)
end