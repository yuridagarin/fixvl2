-- Created by TuanNa5

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\shimenguanka\\trigger.lua")
Include("\\settings\\static_script\\meridian\\meridian_zhenqi_transmission.lua")
Include("\\script\\online_activites\\201305\\refine_dan.lua")

tbMasterSkill = {
		[23] = 1032,
		[29] = 1196,
		[30] = 1230,
	}
	
function OnUse()
	local nDate = tonumber(date("%Y%m%d"))
	local tSay = {}
	tinsert(tSay,"Luy�n B�c ��u T� kh� thu�t - Truy�n Ch�n Kh�/OnTalkZhenqiTransmission")
	tinsert(tSay,"Luy�n 10 Huy�n Ho�ng B�o ��n/get_clear_pk_item")
	tinsert(tSay,"Luy�n B�c ��u Truy�n C�ng Thu�t/transfer_neili")
	tinsert(tSay,"Luy�n B�c ��u D��ng Sinh Thu�t/pratice_neili")
	tinsert(tSay,"T�y h�t n�i, ngo�i th��ng/clear_pain")
	if tbMasterSkill[GetPlayerRoute()]  then
		tinsert(tSay, "Ta mu�n tu luy�n k� n�ng tr�n ph�i ��n c�p 10 (ti�u hao 79 xu v�t ph�m)/HoTro_LuyenTranPhai_Train")
	end
	tinsert(tSay,"��ng/gf_DoNothing")

--	if nDate >= 20130517 and nDate <= 20130614 then
--		tinsert(tSay, 1, "Luy�n Th�n T�n ��n/Vet_201305_Refine_Dan")				  
--	end	
	Say("Th�i B�ch Kim Tinh khi x�a �� d�ng v�t n�y �� luy�n ti�n ��n, ng��i mu�n luy�n ti�n d��c g�?",getn(tSay),tSay)
end

function transfer_neili()
	local nDate = tonumber(date("%Y%m%d"))
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� th�c hi�n truy�n c�ng thu�t.")
		return 0
	end
	local strSay = "<color=green>B�c ��u Truy�n C�ng Thu�t<color> l� v� c�ng tu�n theo s� bi�n h�a c�a �m d��ng, d�ng n�i l�c c�a ng��i kh�c h�a c�ng linh kh� c�a thi�n ��a t�o th�nh ngu�n n�ng l��ng cho c� th�.<color=red>Ch� �: ch� c� ��i tr��ng m�i c� th� k�ch ho�t truy�n c�ng v� nh�n kinh nghi�m t� c�c th�nh vi�n.<color>"
	local tSay = {
--						"K�ch ho�t Di Hoa Ti�p Ng�c/#activate_transfer_neili(3)",	
						"K�ch ho�t B�c ��u Truy�n C�ng Thu�t/#activate_transfer_neili(1)",	
						"K�ch ho�t B�c ��u Truy�n C�ng Thu�t ��c Bi�t/#activate_transfer_neili(2)",	
						"Ng�ng luy�n c�ng/StopTransfer",
						"Ta s� luy�n sau/gf_DoNothing",
					  }
	if nDate < 20130429 then
		tinsert(tSay, 1, "K�ch ho�t Di Hoa Ti�p Ng�c/#activate_transfer_neili(3)")				  
	end
	if GetTrigger(2509) ~= 0 then
		tremove(tSay,1)
		tremove(tSay,2)
		tremove(tSay,3)
	else
		tremove(tSay,4)
	end
	Say(strSay,getn(tSay),tSay)
end

function pratice_neili()
	local strSay = "<color=green>B�c ��u D��ng Sinh Thu�t<color> l� v� c�ng tu�n theo s� bi�n h�a c�a �m d��ng, d�ng n�i l�c b�n th�n k�t h�p v�i linh kh� c�a thi�n ��a t�o th�nh ngu�n n�ng l��ng cho c� th�. Sau khi k�ch ho�t, c� m�i 15 gi�y ng��i luy�n m�t <color=yellow>4 ph�t �y th�c c�c lo�i<color>, nh�n ���c <color=yellow>40000, 50000, 70000, 80000 �i�m kinh nghi�m <color><color=red>t�y lo�i h�nh k�ch ho�t<color>. M�i ng�y ch� c� th� luy�n t�i �a <color=yellow> 8 t�ng<color>. M�i t�ng ch� c� th� luy�n trong v�ng <color=yellow> 30 ph�t<color> (c� th� kh�ng li�n t�c).<color=red>Ch� �: c�c t�ng B�c ��u D��ng Sinh Thu�t ch� c� th� k�ch ho�t khi �� s� th�nh vi�n y�u c�u. C�c th�nh vi�n ph�i ��ng g�n ��i tr��ng m�i c� th� k�ch ho�t.<color>"
	local tSay = 	{
							"K�ch ho�t B�c ��u D��ng Sinh Thu�t/#pratice_neili_choose(1)",
							"K�ch ho�t B�c ��u D��ng Sinh Thu�t ��c Bi�t/#pratice_neili_choose(2)",
							"Ng�ng luy�n c�ng/StopTransfer",
							"Ta s� luy�n sau/gf_DoNothing"	
						}
	if GetTrigger(2509) ~= 0 then
		tremove(tSay,1)	
		tremove(tSay,2)	
	else
		tremove(tSay,3)
	end
	Say(strSay,getn(tSay),tSay)
end

function pratice_neili_choose(nSkillType)
	Say("Ch�n t�ng mu�n luy�n:",5,"T�ng 1 D��ng Sinh Thu�t/#active_pratice(1, "..nSkillType..")","T�ng 2 D��ng Sinh Thu�t/#active_pratice(2, "..nSkillType..")","T�ng 3 D��ng Sinh Thu�t/#active_pratice(3, "..nSkillType..")","T�ng 4 D��ng Sinh Thu�t/#active_pratice(4, "..nSkillType..")","Ta s� luy�n sau/gf_DoNothing")
end

function active_pratice(nType, nSkillType)
	Say("Ch�n lo�i h�nh mu�n luy�n:",5,
		format("S� d�ng B�ch C�u Ho�n + ��i B�ch C�u Ho�n/#confirm_active_pratice(%d,%d,1)",nType, nSkillType),
		format("S� d�ng B�ch C�u Ho�n + B�ch C�u Ti�n ��n/#confirm_active_pratice(%d,%d,2)",nType, nSkillType),
		format("S� d�ng ��i B�ch C�u Ho�n + B�ch C�u Ti�n ��n/#confirm_active_pratice(%d,%d,3)",nType, nSkillType),
		format("S� d�ng B�ch C�u Ho�n + ��i B�ch C�u Ho�n + B�ch C�u Ti�n ��n/#confirm_active_pratice(%d,%d,4)",nType, nSkillType),
		"Ta s� luy�n sau/gf_DoNothing")
end


function get_clear_pk_item()
	if GetCash() < 10000 then
		Talk(1,"","B�n kh�ng c� �� 1 v�ng.")
		return
	end
	if Pay(10000) == 1 then
		gf_AddItemEx2({2,0,142,10},"Huy�n Ho�ng B�o ��n","Nguyet Luong Tho","nh�n",0,1)
	end
end

function clear_pain()
	if GetCash() < 50000 then
		Talk(1,"","B�n kh�ng c� �� 5 v�ng trong ng��i.")
		return
	end
	
	if Pay(50000) == 1 then
		CureWound(1)
		CureWound(2)
		Msg2Player("T�t c� n�i, ngo�i th��ng �� ���c ch�a l�nh.")
	end
end


function HoTro_LuyenTranPhai_Check()
	local nRoute = GetPlayerRoute()
	if tbMasterSkill[nRoute] == nil then
		return 0
	end
	if GetSkillLevel(tbMasterSkill[nRoute]) < 5 then
		return -1
	end
	if GetSkillLevel(tbMasterSkill[nRoute]) >= 10 then
		return -2
	end
	return 1
end


function HoTro_LuyenTranPhai_Train()
	local nCheck = HoTro_LuyenTranPhai_Check()
	if nCheck == 0 then
		Talk(1,"","H� ph�i c�c h� kh�ng nh�n ���c h� tr� n�y.")
		return 0
	end
	if nCheck == -1 then
		Talk(1,"","��ng c�p k� n�ng tr�n ph�i hi�n t�i ch�a th� nh�n ���c h� tr� n�y.")
		return 0
	end
	if nCheck == -2 then
		Talk(1,"","��ng c�p k� n�ng tr�n ph�i hi�n t�i kh�ng c�n h� tr� th�m n�a.")
		return 0
	end
	if nCheck ==1 then
		if GetItemCount(2,1,30230) < 79 then
			Talk(1,"","C�c h� kh�ng �� 79 xu v�t ph�m, h�y chu�n b� th�m.")
			return 0
		end
		if DelItem(2,1,30230,79) == 1 then
			local nSkillID = tbMasterSkill[GetPlayerRoute()]
			local nSkillLevel = GetSkillLevel(nSkillID)
			for i=1, (10 - nSkillLevel) do
				LevelUpSkill(nSkillID)
			end
			gf_WriteLog("HO TRO LUYEN TRAN PHAI", "th�nh c�ng", 1, "H� ph�i "..GetPlayerRoute())
			Talk(1,"","V� c�ng tr�n ph�i �� t�ng ��n c�p 10, c�c h� c� th� t� tin h�nh t�u giang h�.")
		end
	end
end
