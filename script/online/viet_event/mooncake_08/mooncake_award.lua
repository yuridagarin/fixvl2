--File name:	mooncake_award.lua
--Describe:		����ϵͳ�齱�ļ�(����������Ը)
--Create Date:	2008-08-29
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")

g_szThisFile = "\\script\\online\\viet_event\\mooncake_08\\mooncake_award.lua"

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
	
	SubWorld = SubWorldID2Idx(100)
	if SubWorld >= 0 then
		local ret = nil
		PlayerIndex = 1
		for i=1,100 do
			local lv = GetLevel()
			if lv ~= nil and lv > 0 then
				break
			end
			PlayerIndex = PlayerIndex + 1
		end
		ret = ApplyRelayShareData(RELAY_DB_08_MOONCAKE_VIET,0,0,g_szThisFile,"draw_prize_cb")
		print("mooncake award:",ret)
	end
end

function draw_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		return
	end

	local tbRandom = {}
	local szPlayerName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nRandom = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())

	Msg2Global("Ch�c m�ng nh�ng ng��i ch�i sau ��y �� ���c nh�n ���c ph�n th��ng ��c bi�t t� Phi Y�n Ti�n T�:")
	if nCount <= 8 then
		local i = 1
		local j = 1
		for j = 1, nCount do
			szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, j-1)
			if nDateNow - nDateFlag < 46800  then
				nPrizeType = i
				AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, szPlayerName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
				Msg2Global(i..". "..szPlayerName.." Nh�n ���c "..g_tbItem[i][5].." "..g_tbItem[i][1])
				i = i + 1
			end
		end
	else
		local i = 1
		local j = 1
		local p = 1
		local nNum = 0
		for p = 1, nCount do
			nNum = 0
			while 1 do
				nNum = nNum + 1
				if nNum >= nCount + 1 then
					break
				end
				nRandom = random(1,nCount)
				nTableSize = getn(tbRandom)
				if nTableSize == 0 then
					szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, nRandom-1)
					if nDateNow - nDateFlag < 46800  then
						tinsert(tbRandom,nRandom)
						nPrizeType = i
						AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, szPlayerName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
						Msg2Global(i..". "..szPlayerName.." Nh�n ���c "..g_tbItem[i][5].." "..g_tbItem[i][1])
						i = i + 1
						break
					end
				else
					for j = 1, nTableSize do
						if nRandom == tbRandom[j] then
							nRandom = -1
							break
						end
					end
					if nRandom ~= -1 then
						szPlayerName, nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByIndex(szKey, nKey1, nKey2, nRandom-1)
						if nDateNow - nDateFlag < 46800  then
							tinsert(tbRandom,nRandom)
							nPrizeType = i
							AddRelayShareData(RELAY_DB_08_MOONCAKE_VIET, 0, 0, "", "", 0, szPlayerName, "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
							Msg2Global(i..". "..szPlayerName.." Nh�n ���c "..g_tbItem[i][5].." "..g_tbItem[i][1])
							i = i + 1
							break
						end
					end
				end
			end
		end
	end

	Msg2Global("Nh�ng ng��i ch�i ch�a ���c ph�n th��ng h�y n� l�c h�n v�o ng�y mai!")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
end

