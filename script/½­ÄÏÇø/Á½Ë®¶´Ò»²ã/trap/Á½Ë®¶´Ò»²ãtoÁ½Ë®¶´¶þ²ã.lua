--两水洞一层to两水洞二层.lua
--GGH

Include("\\script\\task\\world\\task_var_id.lua");

function main(sel)
    if GetTask(TASK_YZ_THREE) >= 14 then
    	NewWorld(113,1547,3319);
	SetFightState(1);
	else
        Msg2Player("Ph輆 trc nhi襲 nguy hi觤! Chi b籲g quay l筰 th? t鑤 h琻!");
    end;
end;
