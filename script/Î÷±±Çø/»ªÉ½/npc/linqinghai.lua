Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	Say("L�m Thanh H�i: xin ch�o, C� mu�n ��n Thi�t Ch��ng S�n Trang kh�ng?", 2, "���c, ��a ta ��n Thi�t Ch��ng S�n Trang/goto_tzsz", "T�i h� ch� xem qua th�i/do_nothing");
end

function goto_tzsz()
	if tGtTask:check_task_isfinish(103) == 1 and tGtTask:check_task_isfinish(110) ~= 1 then
		NewWorld(6024,1652,3093);
		SetFightState(1);
	else
		Talk(1,"","c�c h� kh�ng th� v�o khu v�c n�y.");
	end
end

function do_nothing()
end