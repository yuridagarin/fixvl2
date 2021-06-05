-- TuanNA5 edited

Include("\\script\\lib\\globalfunctions.lua")

tHorse = {
	{"��ng V�",{0,105,20,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"Si�u Quang",{0,105,19,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"B�n Ti�u",{0,105,16,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"Phi�u V�",{0,105,15,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"Ph� D�c",{0,105,39,1,1,3,403,0,0,0,0},1,10,1},
	{"V�n L� Y�n V�n Tr�o",{0,105,36,1,1,3,403,0,0,0,0},1,10,1},
	{"Tu�n L�c",{0,105,35,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
}

function OnUse(nItemIdx)
	local selTab = {				
				format("Ta mu�n nh�n ��ng V�/#use(%d,%d)",1,nItemIdx),
				format("Ta mu�n nh�n Si�u Quang/#use(%d,%d)",2,nItemIdx),
				format("Ta mu�n nh�n B�n Ti�u/#use(%d,%d)",3,nItemIdx),
				format("Ta mu�n nh�n Phi�u V�/#use(%d,%d)",4,nItemIdx),
				format("Ta mu�n nh�n Ph� D�c/#use(%d,%d)",5,nItemIdx),
				format("Ta mu�n nh�n V�n L� Y�n V�n Tr�o/#use(%d,%d)",6,nItemIdx),
--				format("Ta mu�n nh�n Tu�n L�c/#use(%d,%d)",7,nItemIdx),
				"Sau n�y m�i s� d�ng/nothing",
				}
	Say("S� d�ng M� B�i c� th� nh�n ���c 1 con chi�n m�. B�n mu�n s� d�ng kh�ng?",getn(selTab),selTab);
end;

function use(nIndex, nItemIdx)
	if gf_Judge_Room_Weight(tHorse[nIndex][3], tHorse[nIndex][4], "") == 0 then			
		return
	end	
	local nItemIndex = tonumber(nItemIdx)
	local nExpireTime = GetItemExpireTime(nItemIndex) or 30*24*3600	
	if DelItemByIndex(nItemIdx,-1) == 1 then	
		local nRetCode, nItem = gf_AddItemEx(tHorse[nIndex][2], tHorse[nIndex][1]);
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end						
			WriteLogEx("Ma Bai","nh�n",tHorse[nIndex][2][4],tHorse[nIndex][1]);
		else
			WriteLogEx("Ma Bai","AddItem th�t b�i",tHorse[nIndex][2][4],tHorse[nIndex][1]);
		end
	end
end;

function nothing()
end;