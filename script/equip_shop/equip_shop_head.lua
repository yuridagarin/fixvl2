--�ű����ƣ�
--�ű����ܣ�
--���ܲ߻����ܶ�
--���ܿ���������
--����ʱ�䣺2011-05-27
--�����޸ļ�¼

g_tEquipShop = {
 
};

function show_equip_shop(nIdx)
	do return end;
	if not g_tEquipShop[nIdx] then return end

	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", g_tEquipShop[nIdx][1], g_tEquipShop[nIdx][2]));
end
