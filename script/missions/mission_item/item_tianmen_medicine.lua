--天门红药 天门蓝药脚本
--只能在通天幻境和万剑冢关卡才能使用

t_allow_use_map={
	[6019] = 1,
	[6020] = 1,
	[6007] = 1,--梁山
	[427] = 1,--地玄宫
	[1010] = 1,--太虚幻境
	[2010] = 1,--太虚幻境
	[3010] = 1,--太虚幻境
	[4010] = 1,--太虚幻境
	[5010] = 1,--太虚幻境
}
function OnUse(nItemIdx)
	local nMapTemplate = GetMapTemplate(SubWorld)
	if 1 ~= t_allow_use_map[nMapTemplate] then
		Msg2Player("V藅 ph萴 n祔 ch? c? th? s? d鬾g trong V筺 Ki誱 Tr騨g, Th玭g Thi猲 Huy詎 C秐h, Lng S琻, мa Huy襫 Cung, Th竔 H?");
		return 0;
	end
	return 1;
end;