--脚本名称：
--脚本功能：
--功能策划：盾盾
--功能开发：朱力
--开发时间：2011-05-27
--代码修改记录

g_tEquipShop = {
 
};

function show_equip_shop(nIdx)
	do return end;
	if not g_tEquipShop[nIdx] then return end

	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", g_tEquipShop[nIdx][1], g_tEquipShop[nIdx][2]));
end
