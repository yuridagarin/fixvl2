Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	Say("Nh�c B�t Qu�n: ta ph�i gi�i c�u con g�i ta!", 3, "Ta ph�i tr� v� Hoa S�n/goto_huashan", "Ta c�n ��n th�n �i�n/goto_shendian","T�i h� ch� xem qua th�i/do_nothing");
end

function goto_huashan()
	NewWorld(502, 1580, 3219);
	SetFightState(0);
end

function goto_shendian()
	if tGtTask:check_task_isfinish(106) == 1 and tGtTask:check_task_isfinish(110) ~= 1 then
		NewWorld(6025, 1595, 3175);	
	else
		Talk(1,"","c�c h� kh�ng th� v�o khu v�c n�y.");
	end
end

function do_nothing()
end