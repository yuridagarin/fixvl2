Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\lib\\globalfunctions.lua");

szNPCName = "<color=green>Ch� T�u L�u:<color> "
NV_BACHKIMVIEMDE100_FILE = "\\script\\vng\\weapon_upgrade\\change_thienchiviemde2bachkimviemde.lua";

function get_TCVD2BKVD()
	local nCheck = VNG_GetTaskPos(TSK_TC_BK_VD,2,2)
	local nCash = 2000
	
	if nCheck >= 1 then
		Talk(1, "", szNPCName.."��i hi�p �� nh�n nhi�m v� r�i.")
		return
	end
	if GetCash() < nCash*10000 then
		Talk(1, "", szNPCName.."��i hi�p kh�ng mang �� "..nCash.." v�ng �� nh�n nhi�m v�")
		return
	end
	if Pay(nCash*10000) == 1 then
		VNG_SetTaskPos(TSK_TC_BK_VD,1,2,2)
		Talk(1, "", szNPCName.."��i hi�p �� nh�n nhi�m v� ��i trang b� Thi�n Chi Vi�m �� th�nh trang b� B�ch Kim Vi�m ��.")
		gf_WriteLogEx("NHAN NV DOI TCVD 2 BKVD", "th�nh c�ng", 1, "nh�n nhi�m v�")
	end
end

function finish_TCVD2BKVD()
	--3-3BNL;4-4TL;5-9HG;6-8TMT;7-8TMT;8-1BNL;9-1TL;0-1HG
	local tCheck = {3,4,9,8,8,1,1,1}
	local nCheck3 = VNG_GetTaskPos(TSK_TC_BK_VD,3,3)
	local nCheck4 =  VNG_GetTaskPos(TSK_TC_BK_VD,4,4)
	local nCheck5 =  VNG_GetTaskPos(TSK_TC_BK_VD,5,5)
	local nCheck6 =  VNG_GetTaskPos(TSK_TC_BK_VD,6,6)	
	local nBachKim =  VNG_GetTaskPos(TSK_TC_BK_VD,2,2)
	if nBachKim < 1 then
		Talk(1, "", "��i hi�p ch�a nh�n nhi�m v�")
		return
	end	
	if nBachKim >= 2 then
		Talk(1, "", "��i hi�p �� nh�n th��ng r�i")
		return
	end		
	if GetItemCount(2,1,30230) < 200 then
		Talk(1, "", szNPCName.."��i hi�p kh�ng mang �� 200 xu v�t ph�m !!!!")
		return
	end
	if nBachKim < 2 then
		if nCheck3 < tCheck[1] or nCheck4 < tCheck[2] or nCheck5< tCheck[3] or nCheck6 < tCheck[4] then
			Talk(1, "", szNPCName.."��i hi�p ch�a ho�n th�nh h�t c�c nhi�m v� !!!! \nThu ho�ch c�y B�t Nh� L�n: "..nCheck3.."/3 c�y \nK�ch ho�t c�y T� Linh: "..nCheck4.."/4 c�y \nK�ch ho�t H�t gi�ng: "..nCheck5.."/9 c�y \nTham gia Thi�n M�n Tr�n: "..nCheck6.."/8 l�n")
			return
		end
		PutinItemBox("N�ng c�p trang b�" ,3 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NV_BACHKIMVIEMDE100_FILE, 1)			
--		if DelItem(2,1,30230,200) == 1 then
--			VNG_SetValuePos(TSK_TC_BK_VD,2,2,2)
--			gf_WriteLogEx("NHAN NV DOI TCVD 2 BKVD", "th�nh c�ng", 1, "ho�n th�nh nhi�m v�")
			--x�a trang b� v� add trang b� ��i
--		end
	end
end