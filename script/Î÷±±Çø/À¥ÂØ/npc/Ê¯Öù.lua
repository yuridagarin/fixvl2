Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if GetItemCount(2, 0, 30065) > 0 and GetTask(3133) == 0 then
		--持有天师符，并且没有完成过任务
		Talk(1, "", "<color=yellow>Th筩h Tr?: <color> ngi  s? d鬾g Thi猲 S? Ph?, th筩h tr? n祔  頲 k辌h ho箃.");
		SetTask(3133, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 921, 1, 0, 18 *3);
		TaskTip("Х m? Th筩h Tr? v? phong 蕁 H? Y猽, v? t譵 M? B蕋 Ti襫");
		Msg2Player("Х m? Th筩h Tr? v? phong 蕁 H? Y猽, v? t譵 M? B蕋 Ti襫");
		return 0;
	end
	Talk(1,"","D竛 Thi猲 S? Ph? l猲 m韎 c? th? k輈h ho箃 Th筩h Tr?, m? Thi猲 Nguy猲 Ph竝 Tr薾, phong 蕁 Y猽 H?");
end
