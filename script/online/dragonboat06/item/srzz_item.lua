function OnUse()
	if DelItem(2,1,388,1) == 1 then
		CastState("state_move_speed_percent_add",20,5*60*18,1,1001);	--5分钟提高移动速度20%
		Msg2Player("B筺  ╪ 1 b竛h 輙 nh﹏ th辴, trong v遪g 5 ph髏 t鑓  di chuy觧 t╪g 20%");
		Msg2_LeiTai("B竛h 輙 nh﹏ th辴");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d鬾g 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d鬾g 1	"..szItemName);
end;
