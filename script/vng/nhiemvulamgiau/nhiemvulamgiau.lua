
szNPCName = "<color=green>Ch� Th��ng H�i: <color>"
szLogTitle = "NHIEM VU LAM GIAU"
function NhiemVuLamGiau_Nhan()
	if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 then
		Talk(1,"",szNPCName .. "Ng��i �� nh�n nhi�m v� h�m nay r�i, mai m�i ���c nh�n ti�p.")
		return 0
	end
	if GetItemCount(2,1,30230) < 99 then
		Talk(1,"",szNPCName .. "Mu�n l�m gi�u ph�i c� v�n li�ng. Ng��i kh�ng c� 99 v�t ph�m xu, ta ngh� th� th�ch n�y kh�ng ph� h�p v�i ng��i.")
		return 0
	end
	
	if DelItem(2,1,30230,99) == 1 then
		Talk(1,"",szNPCName .. "Ch�c m�ng ng��i �� nh�n ���c nhi�m v�. Ng�y th�nh tri�u ph� ch�n ch�n kh�ng xa...")
		TaskTip("Ti�p nh�n nhi�m v� l�m gi�u.")
		gf_SetTaskBit(TSK_LAMGIAU, 12, 1, 0)
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Nh�n nhi�m v�")
	end
end


function NhiemVuLamGiau_Xem()
	local tbStatus = {
		[1] = "S� d�ng 05 n� oa b�o h�p",
		[2] = "Ho�n th�nh 01 l�n Th�i H� Huy�n C�nh",
		[3] = "Ho�n th�nh 01 l�n T�ng Ki�m S�n Trang",
		[4] = "Ho�n th�nh 03 nhi�m v� L��ng S�n B�c",
		[5] = "Ho�n th�nh 01 l�n nhi�m v� Th�y L�i",
		[6] = "Tr�ng th�nh c�ng 01 H�t Gi�ng",
		[7] = "Tr�ng th�nh c�ng 01 B�t Nh� Nh�",
		[8] = "Tr�ng th�nh c�ng 01 B�t Nh� L�n",
		[9] = "Tr�ng th�nh c�ng 01 C�y T� Linh",
		[10] = "Nh�n th��ng th�nh c�ng 01 l�n Nh�n M�n R�c L�a",
		[11] = "Gh�p th�nh c�ng 01 T�ng R��ng",
	}
	if gf_GetTaskBit(TSK_LAMGIAU, 12) == 0 then
		Talk(1,"",szNPCName .. "Ng��i ch�a nh�n nhi�m v� h�m nay, ta l�y g� �� cho ng��i xem ��y?")
		return 0
	end
	local tbResult = {szNPCName.."Ti�n �� ho�n th�nh nhi�m v� h�m nay:\n"}
	for i=1, 11 do
		local nIndex = floor(i/6) + 1
		if tbResult[nIndex] == nil then
			tbResult[nIndex] = "- "..tbStatus[i]..":"
		else
			tbResult[nIndex] = tbResult[nIndex].."- "..tbStatus[i]..":"
		end
		if gf_GetTaskBit(TSK_LAMGIAU, i) == 0 then
			tbResult[nIndex] = tbResult[nIndex].." <color=red>Ch�a ho�n th�nh<color>\n"
		else
			tbResult[nIndex] = tbResult[nIndex].." <color=yellow>�� ho�n th�nh<color>\n"
		end
	end
	Talk(2,"", tbResult[1], tbResult[2])
end


function NhiemVuLamGiau_Thuong()
	if gf_GetTaskBit(TSK_LAMGIAU, 13) == 1 then
		Talk(1,"",szNPCName .. "Ng��i �� nh�n ph�n th��ng h�m nay, gi� l�i mu�n nh�n th�m sao?")
		return 0
	end
	
	if GetTask(TSK_LAMGIAU) ~= 4095 then
		Talk(1,"",szNPCName .. "Ng��i ch�a ho�n th�nh c�c nhi�m v�, ta ch�a th� cho ng��i nh�n t�i l�c...")
		return 0
	end
	
	Earn(5550000)
	gf_WriteLogEx(szLogTitle, "th��ng", 1, "Ho�n th�nh nhi�m v�")
	TaskTip("Ho�n th�nh nhi�m v�, nh�n th��ng 555 v�ng.")
	gf_SetTaskBit(TSK_LAMGIAU, 13, 1, 0)
end