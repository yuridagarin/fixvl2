Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")

function EnterMap()
	do
		return
	end
	if is_first_tong_jpz_open() == 0 then
		return
	end
	create_map_trigger();
	if check_time() == 1 and check_place() == 1 then
		SetDeathPunish(0);
		Msg2Player("T� 17: 00 ��n 19: 00 l� th�i gian ho�t ��ng bang h�i tinh anh v� v�y � b�n �� Long Tuy�n Th�n s� b� tr�ng ph�t �� s�t.");
	end;
end;

function LeaveMap()
	SetDeathPunish(1);
	if is_first_tong_jpz_open() == 0 then
		return
	end
	create_map_trigger();
end;
