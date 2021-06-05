-- ���óƺź�ȡ����������ʱִ��

-- type = 0x1, equip;  type = 0x2, have;

function Equip(nGeren, nDetail, nType)
	--WriteLog("Equip::geren: "..nGeren..", detai: "..nDetail..", type: "..nType);
	local nStateID = nGeren * 10000 + nDetail * 100
	if check_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	if check_new_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		--WriteLog("year: "..nYear..", month: "..nMonth..", day: "..nDay..", hour: "..nHour..", minute: "..nMin..", second: "..nSec);
		if nYear ~= 1970 then
			Msg2Player("X�ng hi�u c�a b�n h�t h�n v�o"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.." gi� "..nMin.." Ph�t "..nSec.." gi�y")
		end
	end
end

function UnEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	RemoveState(nStateID)
	RemoveState(nStateID+1)	--����������
	RemoveState(nStateID+2)
	RemoveState(nStateID+3)
end

function _22_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 1, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 3, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
	end
end

function _22_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
	end
end

function _22_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
	end
end

function _22_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
	end
end

function _22_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

-- ����
function _23_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_vitality", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: G�n c�t + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_vitality", 3, -1, 1, nStateID);
		Msg2Player("���c hi�u qu�: G�n c�t + 3 �i�m");
	end;
end

function _23_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 3 �i�m");
	end;
end

function _23_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 3 �i�m");
	end;
end

function _23_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 3 �i�m");
	end;
end

function _23_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 3 �i�m");
	end;
end

function _23_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Th�n ph�p + 3 �i�m");
	end;
end

function _23_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 5 �i�m");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Linh ho�t + 3 �i�m");
	end;
end

-- �м�
function _24_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID);
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

function _24_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 10 �i�m");
	end;
end

-- �߼�
function _25_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

function _25_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 12 �i�m");
		CastState("state_medicine_time_increase", 4, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 4%");
	end;
end

-- ���
function _26_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end

function _26_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");		
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 14 �i�m");
		CastState("state_medicine_time_increase", 6, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 6%");
		CastState("state_add_book_attribute_value", 1, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 1%");
	end;
end
--ʦ�ŵ�4�ƺ�
function _27_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end

function _27_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 16 �i�m");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID + 1)
		Msg2Player("���c hi�u qu�: t�ng th�m hi�u qu� c�a th��ng d��c 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 2%");
	end;
end
--ʦ�ŵ�5�ƺ�
function _28_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end

function _28_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("���c hi�u qu�: Kh�ng T�t C� + 18 �i�m");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID + 2)
		Msg2Player("���c hi�u qu�: M�i 10 gi�y sinh l�c ph�c h�i 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 3)
		Msg2Player("���c hi�u qu�: h� tr� m�t t�ch t�ng 3%");
	end;
end
--�η�ʿ��
function _30_01_(nType, nStateID)

end;
--�ξ�����Уξ
function _30_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--�ξ���ʤ��ͳ
function _30_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--�ξ��������ȷ�
function _30_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--������˫�󽫾�
function _30_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--���λ�����Ԫ˧
function _30_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--�ɷ�ʿ��
function _30_07_(nType, nStateID)

end;
--�ɾ�����Уξ
function _30_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
	end;
end;
--�ɾ�������ͳ
function _30_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
	end;
end;
--�ɾ�ƽ�ϴ��ȷ�
function _30_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
	end;
end;
--����ͨ��󽫾�
function _30_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
	end;
end;
--��Ժ����
function _30_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
	end;
end;
--�������󶽻�
function _30_13_(nType, nStateID)
	if nType == 1 then	--�������⹥15%
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then	
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--�������󶽻�
function _30_14_(nType, nStateID)
	if nType == 1 then	--�������⹥15%
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+2)
	end;
end;
--�������󶽻�
function _30_15_(nType, nStateID)
	if nType == 1 then	--�����˺�100��
		CastState("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--�������󶽻�
function _30_16_(nType, nStateID)
	if nType == 1 then	--�����˺�100��
		CastState("state_damage_point", 100, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_damage_point", 100, -1, 1, nStateID)
	end;
end;
--���������
function _30_17_(nType, nStateID)
	if nType == 1 then	--�˺��������25%
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--���������
function _30_18_(nType, nStateID)
	if nType == 1 then	--�˺��������25%
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
	end;
end;
--������������
function _30_19_(nType, nStateID)
	if nType == 1 then	--��������60��
		CastState("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--������������
function _30_20_(nType, nStateID)
	if nType == 1 then	--��������60��
		CastState("state_add_allability", 60, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 60, -1, 1, nStateID)
	end;
end;
--������˫�ɽ�
function _30_21_(nType, nStateID)
	if nType == 1 then	--������������10000��
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--������˫�ɽ�
function _30_22_(nType, nStateID)
	if nType == 1 then	--������������10000��
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
	end;
end;
--����������ʿ
function _30_23_(nType, nStateID)
	if nType == 1 then	--��������40��
		CastState("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
	end;
end;
--����������ʿ
function _30_24_(nType, nStateID)
	if nType == 1 then	--��������40��
		CastState("state_add_allability", 40, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
	end;
end;

function _63_01_(nType, nStateID)
    if nType == 1 then	--��������8��
		CastState("state_add_allability", 8, -1, 1, nStateID)
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
	end;
end

function _64_01_(type, stateID)
	if 1 == type then
		CastState("state_add_energy", 20, -1, 1, stateID)
		Msg2Player("���c hi�u qu�: N�i c�ng + 20 �i�m");
	end
end

function _64_02_(type, stateID)
	if 1 == type then
		CastState("state_add_strength", 20, -1, 1, stateID)
		Msg2Player("���c hi�u qu�: S�c m�nh + 20 �i�m");	
	end
end

--function _64_03_(type, stateID)
--	if 1 == type then
--		CastState("state_add_dexterity", 20, -1, 1, stateID)
--		Msg2Player("���Ч����������20��");
--	end
--end
--
--function _64_04_(type, stateID)
--	if 1 == type then
--		CastState("state_add_vitality", 20, -1, 1, stateID)
--		Msg2Player("���Ч������������20��");
--	end
--end
--
--function _64_05_(type, stateID)
--	if 1 == type then
--		CastState("state_add_observe", 20, -1, 1, stateID)
--		Msg2Player("���Ч������������20��");
--	end
--end

function PT_AddAllWhenEquip(type, stateID, number1, number2)
	if 1 == type then
		CastState("state_burst_enhance_rate", number1, -1, 1, stateID+1);
		CastState("state_add_allability", number2, -1, 1, stateID+2);
		Msg2Player(format("%s%d%%%s%d%s","Hi�u qu� nh�n ���c: T�ng t�c �� thi tri�n", number1, ",T�ng Sinh l�c", number2, " �i�m"));
	end
end

function _65_01_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 10, 10);
end

function _65_02_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 12, 12);
end

function _65_03_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 14, 14);
end

--function _65_04_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_05_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_06_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_07_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_08_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_09_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_10_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_11_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_12_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_13_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_14_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_15_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_16_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_17_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_18_(type, stateID)
--	PT_AddAllWhenEquip(type, stateID, 10);
--end
--
--function _65_19_(type, stateID)
--	if 2 == type then
--		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_20_(type, stateID)
--	if 2 == type then
--		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_21_(type, stateID)
--	if 2 == type then
--		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_22_(type, stateID)
--	if 2 == type then
--		CastState("state_life_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_23_(type, stateID)
--	if 2 == type then
--		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_24_(type, stateID)
--	if 2 == type then
--		CastState("state_neili_max_percent_add", -15, -1, 1, stateID);
--		Msg2Player("���Ч��������ֵ�½�15%");		
--	end
--end
--
--function _65_25_(type, stateID)
--	if 2 == type then
--		CastState("state_slow", 10, -1, 1, stateID);
--		Msg2Player("���Ч�����ƶ��ٶ��½�10%");		
--	end
--end
--
--function _65_26_(type, stateID)
--	if 2 == type then
--		CastState("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("���Ч����ȫ��������8��");
--	end
--end
--
--function _65_27_(type, stateID)
--	if 2 == type then
--		CastState("state_add_allability", 8, -1, 1, stateID);
--		Msg2Player("���Ч����ȫ��������8��");
--	end
--end

--------------------------------------------------------------------------------------
-- ����ս�ƺ�

function CityWarEquip(nGeren, nDetail, nType)
	local szfunc = format("_%.2d_%.2d_(%d)", nGeren, nDetail, nType)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		if nYear ~= 1970 then
			Msg2Player("X�ng hi�u c�a b�n h�t h�n v�o"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.." gi� "..nMin.." Ph�t "..nSec.." gi�y")
		end
	end
end

function CityWarUnEquip(nGeren, nDetail, nType)
	SetCityWarDutyFlag(0, 0)
	VerifyEquip()
end

function _51_01_(nType)		-- �ɶ�����
	SetCityWarDutyFlag(300, 0)
end

function _51_02_(nType)		-- �ɶ�����
	SetCityWarDutyFlag(300, 0)
end

function _51_03_(nType)		-- �ɶ���ʦ
	SetCityWarDutyFlag(300, 1)
end

function _51_04_(nType)		-- �ɶ�����
	if nType == 1 then
		SetCityWarDutyFlag(300, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

function _51_05_(nType)		-- Ȫ�ݳ���
	SetCityWarDutyFlag(100, 0)
end

function _51_06_(nType)		-- Ȫ�ݿ���
	SetCityWarDutyFlag(100, 0)
end

function _51_07_(nType)		-- Ȫ�ݾ�ʦ
	SetCityWarDutyFlag(100, 1)
end

function _51_08_(nType)		-- Ȫ������
	if nType == 1 then
		SetCityWarDutyFlag(100, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

function _51_09_(nType)		-- ��������
	SetCityWarDutyFlag(350, 0)
end

function _51_10_(nType)		-- ��������
	SetCityWarDutyFlag(350, 0)
end

function _51_11_(nType)		-- ������ʦ
	SetCityWarDutyFlag(350, 1)
end

function _51_12_(nType)		-- ��������
	if nType == 1 then
		SetCityWarDutyFlag(350, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

--�����ؿ��ƺ�
--�ݺ����ģ�������Ԫ���õĳƺţ�
function _60_08_(nType, nStateID)
	if nType == 1 then	--����������5%
		CastState("state_inc_exp_gain", 5, -1, 1, nStateID)
	elseif nType == 2 then  --����������5%
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end;

-- ����ս�ƺŽ���

--==========�ж�ս���ƺŵ�============================================================
tTitleTab =
{
--�ƺ����ƣ���Ӧ�ƺű��ڵĴ��࣬���࣬�������
	{"T�ng_V� D�ng Hi�u �y",	30, 2, 2},
	{"Li�u_Ki�u D�ng �� �y",	30, 8,-2},
	{"T�ng_Th��ng Th�ng �� th�ng",	30, 3, 3},
	{"Li�u_Tuy�t tr�n �� th�ng",	30, 9,-3},
	{"T�ng_��nh B�c ��i Ti�n phong",	30, 4, 4},
	{"Li�u_B�nh Nam ��i Ti�n phong",	30,10,-4},	
	{"T�ng_V� Song ��i t��ng qu�n",	30, 5, 5},	
	{"Li�u_Th�ng Thi�n ��i t��ng qu�n",	30,11,-5},	
	{"T�ng_H� Qu�c ��i nguy�n so�i",	30, 6, 6},	
	{"Nam Vi�n ��i V��ng",		30,12,-6},	
} 

tNewTitleTab =
{
--�ƺ����ƣ���Ӧ�ƺű��ڵĴ��࣬���࣬����������Ƿ�֧������Ԫ˧����
	{"T�ng -Ph� Tr�n ��c h�",	30,	13,		300000,		1}, 
	{"Li�u-Ph� Tr�n ��c h� ",	30,	14,		-300000,	1},
	{"T�ng -Ph� Tr�n ��c h�",	30,	15,		300000,		1}, 
	{"Li�u-Ph� Tr�n ��c h� ",	30,	16,		-300000,	1},
	{"T�ng-Tr�n Qu�n H� k�",	30,	17,		450000,		0}, 
	{"Li�u-Tr�n Qu�n H� k�",	30,	18,		-450000,	0},	
	{"T�ng -Thi�t C� Long V�",	30,	19,		400000,		0}, 
	{"Li�u- Thi�t C� Long V�",	30,	20,		-400000,	0},
	{"T�ng- V� Song Phi T��ng",	30,	21,		500000,		0}, 
	{"Li�u-V� Song Phi T��ng",	30,	22,		-500000,	0},
	{"T�ng- Ng� ��ch M�nh S�",	30,	23,		250000,		1}, 
	{"Li�u- Ng� ��ch M�nh S�",	30,	24,		-250000,	1},
}
--��鵱ǰ�ǲ���ս���ƺŲ��ҷ��϶�����ƺŵ��ʸ�
function check_battle_rank(nGeren, nDetail)
	local nTitleIdx = 0;
	for i,v in tTitleTab do
		if tTitleTab[i][2] == nGeren and tTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--����ս���ƺ�
		return 1;
	end;
	local nCurRank = GetTask(704);
	local nNeedRank = tTitleTab[nTitleIdx][4];	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Msg2Player("B�n hi�n thu�c phe T�ng, kh�ng th� d�ng danh hi�u c�a phe Li�u");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Msg2Player("B�n hi�n thu�c phe Li�u kh�ng th� d�ng danh hi�u c�a phe T�ng");
			return 0
		end;
	end;

	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Msg2Player("Qu�n h�m c�a b�n qu� th�p kh�ng th� s� d�ng danh hi�u n�y.")
		return 0
	end
	return 1
end;
--�ڶ���ս���ƺż��
function check_new_battle_rank(nGeren, nDetail)
	local tCampNameZ =					--��Ӫ���֣����ģ�����ʾ�Ի���ʱ���õ�
	{
		[0] = "",
		[1] = "T�ng",
		[2] = "Li�u",
	}
	local nTitleIdx = 0;
	for i,v in tNewTitleTab do
		if tNewTitleTab[i][2] == nGeren and tNewTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--����ս���ƺ�
		return 1;
	end;
	local nCurCamp = 0;
	local nNeedJunGong = tNewTitleTab[nTitleIdx][4];
	local nNeedEverRank = tNewTitleTab[nTitleIdx][5];
	local nCurJunGong = GetTask(701);
	local bEverMarshal = 0;
	local nTitleCamp = 0;
	if nNeedJunGong > 0 then
		nTitleCamp = 1;
	else
		nTitleCamp = 2;
	end;
	if nCurJunGong >= 0 then
		nCurCamp = 1;
	else
		nCurCamp = 2;
	end;
	if GetTask(765) >= 15 then
		bEverMarshal = 1;	--������Ԫ˧
	end;
	if nCurCamp == 1 then	--��ǰΪ�η�
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong < nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." chi�n c�ng ho�c c� "..tCampNameZ[nTitleCamp].." Qu�n h�m Ph��ng V�nh c�u Nguy�n So�i m�i c� th� s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		else
			if nCurJunGong < nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." Qu�n c�ng m�i ���c s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		end;
	else
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong > nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." chi�n c�ng ho�c c� "..tCampNameZ[nTitleCamp].." Qu�n h�m Ph��ng V�nh c�u Nguy�n So�i m�i c� th� s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		else
			if nCurJunGong > nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("B�n ph�i ��t ���c "..tCampNameZ[nTitleCamp].."Ph��ng "..abs(nNeedJunGong).." Qu�n c�ng m�i ���c s� d�ng x�ng hi�u n�y");				
				return 0;
			end;
		end;		
	end;
	return 1;
end;
--===================================================================================

function ZhenzaiEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

function ZhenzaiUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

--�ٻ�����һ ���ֳƺ�
function CallbackEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 51, 2022)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2022))
	end
end

function CallbackUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2022))
end

--��ʮ����ƺ�
function YearsEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 52, 2023)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2023))
	end
end

function YearsUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2023))
end

--����ת��ƺ�����
function _61_05_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

--����ת��2�ƺ�����
function _61_06_(nType, nStateID)
--	print(nType, nStateID)
--	print(GetPlayerRebornParam(1))
	if nType == 2 then
		CastState("state_add_allability", 21, -1, 1, nStateID);
		CastState("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
		CastState("state_life_max_point_add", 5000, -1, 1, nStateID + 3);
	end
end

function _66_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID);
		CastState("imme_life_percent_add", 15, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 5, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 5, -1, 1, nStateID + 3);
	end
end

function _66_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID);
		CastState("imme_life_percent_add", 12, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 4, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 4, -1, 1, nStateID + 3);
	end
end

function _66_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID);
		CastState("imme_life_percent_add", 9, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 3, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _66_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID);
		CastState("imme_life_percent_add", 6, -1, 1, nStateID + 1);
		CastState("state_burst_enhance_rate2", 3, -1, 1, nStateID + 2);
		CastState("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _67_01_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_02_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_03_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
function _67_11_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_12_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_13_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
T_NEW_BATTLE_ATTR = {
    [2] = {"state_add_strength", "S�c m�nh",}, --�����׼�
    [3] = {"state_add_energy", "N�i c�ng ",}, --��������
    [4] = {"state_add_energy", "N�i c�ng ",}, --��������
    [6] = {"state_add_dexterity", "Th�n ph�p",}, --����
    [8] = {"state_add_energy", "N�i c�ng ",}, --���ҷ��
    [9] = {"state_add_dexterity", "Th�n ph�p",}, --�����׼�
    [11] = {"state_add_strength", "S�c m�nh",}, --ؤ�ﾻ��
    [12] = {"state_add_dexterity", "Th�n ph�p",}, --ؤ������
    [14] = {"state_add_energy", "N�i c�ng ",}, --�䵱����
    [15] = {"state_add_observe", "Linh ho�t",}, --�䵱�׼�
    [17] = {"state_add_strength", "S�c m�nh",}, --����ǹ��
    [18] = {"state_add_dexterity", "Th�n ph�p",}, --���Ź���
    [20] = {"state_add_dexterity", "Th�n ph�p",}, --�嶾а��
    [21] = {"state_add_observe", "Linh ho�t",}, --�嶾��ʦ
    [23] = {"state_add_energy", "N�i c�ng ",}, --����
    [29] = {"state_add_strength", "S�c m�nh",}, --��������
    [30] = {"state_add_observe", "Linh ho�t",}, --������Ů
}
T_NEW_BATTLE_TYPE = {100, 60, 40}


function newbattle_season_titile(nType, nStateID, nSubId)
	if nType == 2 then
		local tAttr = T_NEW_BATTLE_ATTR[GetPlayerRoute()]
		local nVal = T_NEW_BATTLE_TYPE[nSubId]
		if tAttr and nVal then
			CastState(tAttr[1], nVal, -1, 1, nStateID);
		end
	end
end

function _68_01_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_02_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_03_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_04_(nType, nStateID)
	if 1 == nType then
		CastState("state_add_allability", 20, -1, 1, nStateID);
	end
end
