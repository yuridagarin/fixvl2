Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(134) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	local t_dia_sel = {
		"<color=green>S�i Phong Nhi<color>: M� ta ��t t�n cho t� t� l� Ho�ng Nhi, c�n ta l� Ph��ng Nhi, nh�ng ta kh�ng th�ch t�n n�y n�n ��i th�nh Phong Nhi.",
		"<color=green>S�i Phong Nhi<color>: Ta mu�n l�m c�n gi� t� do t� t�i, th�i nh� nh�, nh�n nh� n�i th� gian n�y."
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end
