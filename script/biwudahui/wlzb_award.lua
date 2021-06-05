Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\task_id_manage.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_tItem = {
	{"Huy Ch��ng V� L�m Tranh B�", {2,95,843}},
}

msg = "Ch�c m�ng $n d�ng [Huy Ch��ng V� L�m Tranh B�] ��i $i";
if _JX2WZ == 1 then
g_tExchange = {
	{{"Thi�n Cang L�nh",{2,95,204,1,4},msg},2000,{10,1},"holidayspecial-8"},
	{{"��a Huy�n Kim L�nh",{2,95,674,1,4},msg},500,{40,2},"holidayspecial-9",40},
	{{"M�nh Di�u D��ng",{2,95,741,1}},20,nil,"holidayspecial-10",999},
	{{"M�nh H�o Nguy�t",{2,95,740,1}},5,nil,"holidayspecial-11",999},
	{{"Long V�n Kh�c B�n [��u c�p 2]",{2,95,587,1}},50,nil,"holidayspecial-12",999},
	{{"Ph��ng V�n Kh�c B�n [Y ph�c c�p 2]",{2,95,590,1}},50,nil,"holidayspecial-12",999},
	{{"H� V�n Kh�c B�n [H� trang c�p 2]",{2,95,593,1}},50,nil,"holidayspecial-12",999},
	{{"Hoa V�n Kh�c B�n [Trang s�c c�p 2]",{2,95,596,1}},50,nil,"holidayspecial-12",999},
	{{"Ng� S�c Th�i Nhi�m",{2,201,13,1}},50,{400,3},"holidayspecial-13",999},
	{{"T�i Ch�n Quy�n S� M�n ",{2,95,617,1},msg},1500,nil,"holidayspecial-14"},
	{{"M�t T�ch Ti�u Dao",{0,112,224,1},msg},2500,nil,"holidayspecial-15"},
	{{"Di�u D��ng H�a V�n Phi Phong",{0,118,3,1,1,-1,-1,-1,-1,-1,-1},msg},25000,nil,"holidayspecial-16"},
	{{"Di�u D��ng Th�ng Ng� L�nh",{0,117,3,1,1,-1,-1,-1,-1,-1,-1},msg},25000,nil,"holidayspecial-17"},
	{{"H�o Nguy�t C�m �o�n Phi Phong",{0,118,2,1,1,-1,-1,-1,-1,-1,-1}},6000,nil,"holidayspecial-18"},
	{{"H�o Nguy�t �n Ngh�a L�nh",{0,117,2,1,1,-1,-1,-1,-1,-1,-1}},6000,nil,"holidayspecial-19"},
	{{"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1,4},msg},50,{400,4},"holidayspecial-21",999},
	{{"Kinh nghi�m",nil,3},1,{1000,5},"holidayspecial-22",9999},
}
elseif _JX2IB == 1 then
g_tExchange = {
	{{"Thi�n Cang L�nh",{2,95,204,1,4},msg},2000,{10,1},"holidayspecial-8"},
	{{"��a Huy�n Kim L�nh",{2,95,674,1,4},msg},500,{40,2},"holidayspecial-9",40},
	{{"M�nh Di�u D��ng",{2,95,741,1}},20,nil,"holidayspecial-10",999},
	{{"M�nh H�o Nguy�t",{2,95,740,1}},5,nil,"holidayspecial-11",999},
	{{"Long V�n Kh�c B�n [��u c�p 2]",{2,95,587,1}},50,nil,"holidayspecial-12",999},
	{{"Ph��ng V�n Kh�c B�n [Y ph�c c�p 2]",{2,95,590,1}},50,nil,"holidayspecial-12",999},
	{{"H� V�n Kh�c B�n [H� trang c�p 2]",{2,95,593,1}},50,nil,"holidayspecial-12",999},
	{{"Hoa V�n Kh�c B�n [Trang s�c c�p 2]",{2,95,596,1}},50,nil,"holidayspecial-12",999},
	{{"Ng� S�c Th�i Nhi�m",{2,201,13,1}},50,{400,3},"holidayspecial-13",999},
	{{"T�i Ch�n Quy�n S� M�n ",{2,95,617,1},msg},1500,nil,"holidayspecial-14"},
	{{"M�t T�ch Ti�u Dao",{0,112,224,1},msg},2500,nil,"holidayspecial-15"},
	{{"Di�u D��ng H�a V�n Phi Phong",{0,118,3,1,1,-1,-1,-1,-1,-1,-1},msg},25000,nil,"holidayspecial-16"},
	{{"Di�u D��ng Th�ng Ng� L�nh",{0,117,3,1,1,-1,-1,-1,-1,-1,-1},msg},25000,nil,"holidayspecial-17"},
	{{"H�o Nguy�t C�m �o�n Phi Phong",{0,118,2,1,1,-1,-1,-1,-1,-1,-1}},6000,nil,"holidayspecial-18"},
	{{"H�o Nguy�t �n Ngh�a L�nh",{0,117,2,1,1,-1,-1,-1,-1,-1,-1}},6000,nil,"holidayspecial-19"},
	{{"R��ng Huy Ho�ng Vinh D�",{2,95,667,1},msg},6000,nil,"holidayspecial-20"},
	{{"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1,4},msg},50,{400,4},"holidayspecial-21",999},
	{{"Kinh nghi�m",nil,3},1,{1000,5},"holidayspecial-22",9999},
}
else
g_tExchange = {
	{{"Thi�n Cang L�nh",{2,95,204,1,4},msg},2000,{10,1},"holidayspecial-8"},
	{{"��a Huy�n Kim L�nh",{2,95,674,1,4},msg},500,{40,2},"holidayspecial-9",40},
	{{"M�nh Di�u D��ng",{2,95,741,1}},20,nil,"holidayspecial-10",999},
	{{"M�nh H�o Nguy�t",{2,95,740,1}},5,nil,"holidayspecial-11",999},
	{{"Long V�n Kh�c B�n [��u c�p 2]",{2,95,587,1}},50,nil,"holidayspecial-12",999},
	{{"Ph��ng V�n Kh�c B�n [Y ph�c c�p 2]",{2,95,590,1}},50,nil,"holidayspecial-12",999},
	{{"H� V�n Kh�c B�n [H� trang c�p 2]",{2,95,593,1}},50,nil,"holidayspecial-12",999},
	{{"Hoa V�n Kh�c B�n [Trang s�c c�p 2]",{2,95,596,1}},50,nil,"holidayspecial-12",999},
	{{"Ng� S�c Th�i Nhi�m",{2,201,13,1}},50,{400,3},"holidayspecial-13",999},
	{{"T�i Ch�n Quy�n S� M�n ",{2,95,617,1},msg},1500,nil,"holidayspecial-14"},
	{{"M�t T�ch Ti�u Dao",{0,112,224,1},msg},2500,nil,"holidayspecial-15"},
	{{"Di�u D��ng H�a V�n Phi Phong",{0,118,3,1,1,-1,-1,-1,-1,-1,-1},msg},25000,nil,"holidayspecial-16"},
	{{"Di�u D��ng Th�ng Ng� L�nh",{0,117,3,1,1,-1,-1,-1,-1,-1,-1},msg},25000,nil,"holidayspecial-17"},
	{{"H�o Nguy�t C�m �o�n Phi Phong",{0,118,2,1,1,-1,-1,-1,-1,-1,-1}},6000,nil,"holidayspecial-18"},
	{{"H�o Nguy�t �n Ngh�a L�nh",{0,117,2,1,1,-1,-1,-1,-1,-1,-1}},6000,nil,"holidayspecial-19"},
	{{"R��ng Huy Ho�ng Vinh D�",{2,95,667,1},msg},6000,nil,"holidayspecial-20"},
	{{"Kinh nghi�m",nil,3},1,{1000,5},"holidayspecial-22",9999},
}
end

function exchange()
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 110613 or nDate >= 110627 then return end
	SetPlayerScript("\\script\\biwudahui\\wlzb_award.lua");
	local sel = {};
	for i = 1, getn(g_tExchange) do
		local tRule = g_tExchange[i];
		local info = format("D�ng %d huy ch��ng ��i [%s]x%d",tRule[2],tRule[1][1],1);
		if tRule[3] then
			info = info..format("(Gi�i h�n %d:%d)", getValue(tRule[3][2]), tRule[3][1]);
		end
		tinsert(sel, {info, format("#exchange2(%d)",i)});
	end
	tinsert(sel, {"tr� l�i", "nothing"});
	local s = {msg = "Mu�n ��i v�t g�?",sel=sel,commonSel = 1,nLinePerPage=9};
	temp_Talk(s)
end

function getValue(i)
	return tCamp_WLZB_Award:GetCampTask(i);
end
function setValue(i,v)
	return tCamp_WLZB_Award:SetCampTask(i,v);
end
function modifyValue(i,v)
	return tCamp_WLZB_Award:ModifyCampTask(i,v);
end

g_tTempwlzbaward = {}
function exchange2(id)
	local tRule = g_tExchange[id];
	if not tRule[5] then
		return exchange3(id, nil, 1)
	end
	if not tRule then return end
	local nMax = floor(GetItemCount(2,95,843) / tRule[2]);
	if nMax < 1 then
		return Talk(1, "", "V�t ph�m kh�ng ��");
	end
	if GetFreeItemRoom() < 1 then
		return Talk(1, "", "T�i kh�ng �� ch�, h�y s�p x�p r�i quay l�i");
	end
	nMax = min(nMax, GetFreeItemRoom() * tRule[5]);
	if tRule[3] then
		 nMax = min(nMax, tRule[3][1] - getValue(tRule[3][2]));
		 if nMax < 1 then
		 	return Talk(1, "exchange", "Ph�n th��ng n�y �� ��t gi�i h�n ��i");
		end
	end
	g_tTempwlzbaward[GetName()] = id;
	AskClientForNumber("exchange2_cb",1,min(999,nMax),"H�y nh�p s� l��ng v�o");
end

function exchange2_cb(nCount)
	if not nCount or nCount < 0 then return 0 end
	local id = g_tTempwlzbaward[GetName()];
	if not id then return 0 end
	exchange3(id, nil, nCount)
	g_tTempwlzbaward[GetName()] = nil;
end

function exchange3(id, bSure,nCount)
	local tRule = g_tExchange[id];
	if not tRule then return end
	
	local room = ceil(nCount / (tRule[5] or 1));
	if gf_JudgeRoomWeight(room,100,"") ~= 1 then return end
	
	local totalCount = tRule[2] * nCount;
	if not bSure then
		Say(format("��ng � d�ng %d huy ch��ng ��i [%s]x%d??",totalCount,tRule[1][1],nCount),
			2,
			format("��ng �/#exchange3(%d,1,%d)",id,nCount),
			"tr� l�i/exchange");
		return
	end
	
	if tRule[3] then
		if getValue(tRule[3][2]) + nCount > tRule[3][1] then
			return Talk(1, "exchange", "Ph�n th��ng n�y �� ��t gi�i h�n ��i");
		end
	end
	if GetItemCount(2,95,843) < totalCount then
		return Talk(1, "", "V�t ph�m kh�ng ��");
	end
	if DelItem(2,95,843,totalCount) == 1 then
		gf_SetLogCaption("2011wlzb ��i th��ng");
		if tRule[1][2] then
			gf_AddItemEx(tRule[1][2], tRule[1][1], nCount);
			local msg = tRule[1][3];
			if msg then
				msg = gsub(msg, "%$i", format("[%s] x%d", tRule[1][1], tRule[1][2][4]));
				msg = gsub(msg,"%$n",GetName());
				Msg2Global(msg)
			end
		else
			local lv = GetLevel();
			gf_Modify("Exp", lv * lv * 3 * nCount);
		end
		if tRule[3] then
			modifyValue(tRule[3][2],nCount);
		end
		AddStatValue(tRule[4], nCount);
		gf_SetLogCaption("");
	end
end

OnUse = exchange
