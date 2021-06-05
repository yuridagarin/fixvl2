--by liubo
--ľ��ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

function OnUse(nItem)
	Talk(1, "", "T�nh n�ng t�m ��ng �� b�o tr�. B�n vui l�ng quay l�i sau !!")
	do return end

	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Th�i �i�m hi�n t�i ch�a cho ph�p ��i r��ng, c�c h� h�y s� d�ng sau nh�.")
			do	return	end
		end
	end
	
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[4])
        return 0
    end	
	local nNum = GetItemCount(2,1,30340)
	if nNum < 25 then
		Talk(1,"",tSTRING_TREASUER_BOX[1])
		return 0
	end
	local nNum1 = GetItemCount(2,1,30230)
	if nNum1 < 20 then
		Talk(1,"","S� l��ng Xu v�t ph�m trong h�nh trang thi�u hi�p kh�ng �� <color=green>20<color>")
		return 0
	end
	Say(tSTRING_TREASUER_BOX[6],2,"X�c ��nh n�ng c�p (t�n 25 M�c R��ng + 20 Xu v�t ph�m)/to_upgrade","Kh�ng c�n ��u/do_nothing")
end

function to_upgrade()
--	if Pay(500000) ==  0 then
--		Talk(1,"",tSTRING_TREASUER_BOX[2])
--		return 0
--	end
	if DelItem(2,1,30340,25) == 0 or DelItem(2,1,30230,20) == 0 then
		return 0
	end
	gf_AddItemEx2({2,1,30341,1},"T�ng R��ng (N�ng c�p M�c R��ng)","Than Tai Bao Ruong","N�ng c�p M�c R��ng",0,1)
	
--=========== Nhiem vu lam giau ============
	if CFG_NhiemVuLamGiau == 1 then
		if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 11) == 0 then
			gf_SetTaskBit(TSK_LAMGIAU, 11, 1, 0)
			TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Gh�p 1 t�ng r��ng.")
		end
	end
end

function do_nothing()
end