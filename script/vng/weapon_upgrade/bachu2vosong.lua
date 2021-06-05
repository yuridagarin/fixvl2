Include("\\script\\vng\\lib\\vnglib_award.lua");

szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbBaChu = {
	[0] = {
		[100] = {
			[30025] = 1,
			[30026] = 1,
			[30027] = 1,
			[30028] = 1,

		},
		[101] = {
			[30025] = 1,
			[30026] = 1,
			[30027] = 1,
			[30028] = 1,
		},
		[103] = {
			[30025] = 1,
			[30026] = 1,
			[30027] = 1,
			[30028] = 1,
		},
	},
}

tbThienHaVoSong = {
	[1] = {item={{gdp={0,100,30207,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30207,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30207,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
	[2] = {item={{gdp={0,100,30208,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30208,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30208,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
	[3] = {item={{gdp={0,100,30209,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30209,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30209,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
	[4] = {item={{gdp={0,100,30210,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Gi�p"},
					{gdp={0,101,30210,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Trang"},
					{gdp={0,103,30210,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="Thi�n H� V� Song Kh�i"},
				}},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbBaChu[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n trang b� V� L�m B� Ch�, m�y th� v� v� n�y ��ng �em ra ��y.")
		return 0
	end
	if tbBaChu[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n trang b� V� L�m B� Ch�, m�y th� v� v� n�y ��ng �em ra ��y.")
		return 0
	end
	if tbBaChu[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n trang b� V� L�m B� Ch�, m�y th� v� v� n�y ��ng �em ra ��y.")
		return 0
	end
	if GetEquipAttr(idx,2) < 13 then
		Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 13 tr� l�n.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(3,200) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	if getn(tbUpgradeList) < 3 then
		Talk(1,"",szNpcName .. "Ng��i ph�i n�p �� b� 3 m�n V� L�m B� Ch�.")
		return 0
	end
	
	local tbItemInfo = {}
	local nCheckItem = 0
	for i=1, getn(tbUpgradeList) do
		tbItemInfo[i] = {}
		tbItemInfo[i]["level"] = GetEquipAttr(tbUpgradeList[i][1],2) 
		if tbUpgradeList[i][3] == 100 then
			nCheckItem = nCheckItem + 1
		elseif tbUpgradeList[i][3] == 101 then
			nCheckItem = nCheckItem + 10
		elseif tbUpgradeList[i][3] == 103 then
			nCheckItem = nCheckItem + 100
		end
	end
	if nCheckItem ~= 111 then
		Talk(1,"",szNpcName .. "Ng��i ph�i n�p �� 3 m�n V� L�m B� Ch�, g�m n�n, �o, qu�n.")
		return 0
	end
	local nNguyenlieu = min(tbItemInfo[1]["level"], tbItemInfo[2]["level"], tbItemInfo[3]["level"])
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[13] = {item={{gdp={2,1,30344,44}, name="Th�n T�i B�o R��ng"}, {gdp={2,1,1006,44}, name="C�u Thi�n V� C�c ��n"}}},
		[14] = {item={{gdp={2,1,30344,29}, name="Th�n T�i B�o R��ng"}, {gdp={2,1,1006,29}, name="C�u Thi�n V� C�c ��n"}}},
		[15] = {item={{gdp={2,1,30344,14}, name="Th�n T�i B�o R��ng"}, {gdp={2,1,1006,14}, name="C�u Thi�n V� C�c ��n"}}},
	}
	if tbMaterial[nNguyenlieu] == nil then
		return 0
	end
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nNguyenlieu])
	if nCheck == 0 then
		return 0
	end
	
	local nBody = GetBody()
	LIB_Award.szLogTitle = "NANG CAP VO LAM BA CHU - THIEN HA VO SONG"
	LIB_Award.szLogAction = "th�nh c�ng"
	LIB_Award:PayMaterial(tbMaterial[nNguyenlieu])
	for i=1, getn(tbUpgradeList) do
		DelItemByIndex(tbUpgradeList[i][1],-1)
	end
	LIB_Award:Award(tbThienHaVoSong[nBody])
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, ng��i qu� l� Thi�n h� v� song.")
	return 1
end
