--��ˮ��һ��to��ˮ������.lua
--GGH

Include("\\script\\task\\world\\task_var_id.lua");

function main(sel)
    if GetTask(TASK_YZ_THREE) >= 14 then
    	NewWorld(113,1547,3319);
	SetFightState(1);
	else
        Msg2Player("Ph�a tr��c nhi�u nguy hi�m! Chi b�ng quay l�i th� t�t h�n!");
    end;
end;
