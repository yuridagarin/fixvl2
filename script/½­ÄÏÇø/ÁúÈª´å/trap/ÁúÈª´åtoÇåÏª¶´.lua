--��Ȫ��to��Ϫ��.lua
--GGH

Include("\\script\\task\\world\\task_var_id.lua");

function main(sel)
    if GetTask(TASK_FIVE) >= 21 then
	NewWorld(111,1603,3205);
    	SetFightState(1);    	
    else
        Msg2Player("Ph�a tr��c nhi�u nguy hi�m! Chi b�ng quay l�i th� t�t h�n!.");
    end;
end;
