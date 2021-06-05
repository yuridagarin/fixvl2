Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\lib\\globalfunctions.lua");

--TSK_TC_BK_VD = 2707		--0987654321: 1-nh�n nv vd2tcvd; 2-nh�n nv tcvd2bkvd
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
szNPCName = "<color=green>Ch� T�u L�u:<color> "
NV_THIENCHIVIEMDE100_FILE = "\\script\\vng\\weapon_upgrade\\change_viemde2thienchiviemde.lua";

function get_VD2TCVD()
	
	local nCheck = VNG_GetTaskPos(TSK_TC_BK_VD,1,1)
	local nCash = 1000
	if nCheck >= 1 then
		Talk(1, "", szNPCName.."��i hi�p �� nh�n nhi�m v� r�i.")
		return
	end
	if GetCash() < nCash*10000 then
		Talk(1, "", szNPCName.."��i hi�p kh�ng mang �� "..nCash.." v�ng �� nh�n nhi�m v�")
		return
	end
	if Pay(nCash*10000) == 1 then
		VNG_SetTaskPos(TSK_TC_BK_VD,1,1,1)
		Talk(1, "", szNPCName.."��i hi�p �� nh�n nhi�m v� ��i trang b� Vi�m �� th�nh trang b� Thi�n Chi Vi�m ��.")
		gf_WriteLogEx("NHAN NV DOI VD 2 TCVD", "th�nh c�ng", 1, "nh�n nhi�m v�")
	end
end

function finish_VD2TCVD()
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
	local tCheck = {3,4,9,8,8,1,1,1}
	local nCheck7 = VNG_GetTaskPos(TSK_TC_BK_VD,7,7)
	local nCheck8 =  VNG_GetTaskPos(TSK_TC_BK_VD,8,8)
	local nCheck9 =  VNG_GetTaskPos(TSK_TC_BK_VD,9,9)
	local nCheck0 =  VNG_GetTaskPos(TSK_TC_BK_VD,10,10)
	local nThienChi =  VNG_GetTaskPos(TSK_TC_BK_VD,1,1)
	if nThienChi < 1 then
		Talk(1, "", "��i hi�p ch�a nh�n nhi�m v�")
		return
	end
	if nThienChi >= 2 then
		Talk(1, "", "��i hi�p �� nh�n th��ng r�i")
		return
	end	
	if GetItemCount(2,1,30230) < 100 then
		Talk(1, "", szNPCName.."��i hi�p kh�ng mang �� 100 xu v�t ph�m !!!!")
		return
	end
	if nThienChi < 2 then
		if nCheck7 < tCheck[5] or nCheck8 < tCheck[6] or nCheck9 < tCheck[7] or nCheck0 < tCheck[8] then
			Talk(1, "", szNPCName.."��i hi�p ch�a ho�n th�nh h�t c�c nhi�m v� !!!! \nThu ho�ch c�y B�t Nh� L�n: "..nCheck8.."/1 c�y \nK�ch ho�t c�y T� Linh: "..nCheck9.."/1 c�y \nK�ch ho�t H�t gi�ng: "..nCheck0.."/1 c�y \nTham gia Thi�n M�n Tr�n: "..nCheck7.."/8 l�n")
			return
		end
		PutinItemBox("N�ng c�p trang b�" ,3 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NV_THIENCHIVIEMDE100_FILE, 1)	
--		if DelItem(2,1,30230,100) == 1 then
--			VNG_SetValuePos(TSK_TC_BK_VD,2,1,1)
--			gf_WriteLogEx("NHAN NV DOI VD 2 TCVD", "th�nh c�ng", 1, "ho�n th�nh nhi�m v�")
--			--x�a trang b� v� add trang b� ��i
--		end
	end
end

function set_value_nv_nangcap(nPos)
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
	local tCheck = {nil, nil, 3,4,9,8,8,1,1,1}
	local nCheck = VNG_GetTaskPos(TSK_TC_BK_VD,nPos,nPos)
	local nThienChi =  VNG_GetTaskPos(TSK_TC_BK_VD,1,1)
	local nBachKim =  VNG_GetTaskPos(TSK_TC_BK_VD,2,2)
	if nPos == 7 or nPos == 8 or nPos == 9 or nPos == 10 then
		if nThienChi == 1 then
			if nCheck < tCheck[nPos] then
				VNG_SetTaskPos(TSK_TC_BK_VD,nCheck+1,nPos,nPos)
			end
		end
	end
	if nPos == 3 or nPos == 4 or nPos ==5 or nPos == 6 then
		if nBachKim == 1 then
			if nCheck < tCheck[nPos] then
				VNG_SetTaskPos(TSK_TC_BK_VD,nCheck+1,nPos,nPos)
			end
		end
	end	
end