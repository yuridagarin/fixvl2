function OnUse()
	if DelItem(2,1,391,1) == 1 then
		CastState("state_add_strength",50,5*60*18,1,1002);--增加力量x点
		CastState("state_add_energy",50,5*60*18,1,1003);--增加内功x点
		CastState("state_add_vitality",50,5*60*18,1,1004);--增加根骨x点
		CastState("state_add_dexterity",50,5*60*18,1,1005);--增加身法x点
		CastState("state_add_observe",50,5*60*18,1,1006);--增加洞察x点
		Msg2Player("B筺  ╪ 1 b竛h 輙 th藀 c萴, trong v遪g 5 ph髏 t蕋 c? 甶觤 c? b秐 t╪g 50");
		Msg2_LeiTai("B竛h 輙 th藀 c萴");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S? d鬾g 1	"..szItemName);
	Msg2MSAll(23,GetName().."S? d鬾g 1	"..szItemName);
	Msg2MSAll(29,GetName().."S? d鬾g 1	"..szItemName);
	Msg2MSAll(30,GetName().."S? d鬾g 1	"..szItemName);
end;
