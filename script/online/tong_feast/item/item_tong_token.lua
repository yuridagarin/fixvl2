Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	show_equip_shop(3036);
end


--Include("\\script\\online\\tong_feast\\tf_head.lua")
--
--function OnUse(nItem)
--	local tSay = {
--		format("�����䣨%d����/#ExchageTongToken(%d,%d)",15,15,1),
--		format("�����䣨%d����/#ExchageTongToken(%d,%d)",15,15,2),
--		format("Ь���䣨%d����/#ExchageTongToken(%d,%d)",15,15,3),
--		format("�߼������䣨%d����/#ExchageTongToken(%d,%d)",30,30,4),
--		format("�߼������䣨%d����/#ExchageTongToken(%d,%d)",30,30,5),
--		format("�߼�Ь���䣨%d����/#ExchageTongToken(%d,%d)",30,30,6),
--		format("�����䣬�����䣬Ь�����һ����%d����/#ExchageTongToken(%d,%d)",35,35,7),
--		format("�߼������䣬�߼������䣬�߼�Ь�����һ����%d����/#ExchageTongToken(%d,%d)",70,70,8),
--		format("�����������%d����/#ExchageTongToken(%d,%d)",100,100,9),		
--		"��ֻ�ǿ�������/nothing",
--	}
--	Say("�������ƶһ����£�", getn(tSay), tSay);
--end
--
--function ExchageTongToken(nNum, nKind)
--	local tFreeRoom = {1,1,1,1,1,1,3,3,1};
--	if GetFreeItemRoom() < tFreeRoom[nKind] then
--		Talk(1,"","�����ռ䲻��");
--		return 0;
--	end
--	if GetItemCount(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3]) < nNum then
--		Talk(1,"",format("�����ڰ�����Ƶ���������%d�޷���ɶԻ�", nNum));
--		return 0;
--	end
--	if DelItem(TF_ITEM_TONG_TOKEN[1], TF_ITEM_TONG_TOKEN[2], TF_ITEM_TONG_TOKEN[3], nNum) ~= 1 then
--		return 0;
--	end
--	if nKind == 1 then
--		gf_AddItemEx2({2,1,30593,1,4}, "������", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 2 then
--		gf_AddItemEx2({2,1,30594,1,4}, "������", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 3 then
--		gf_AddItemEx2({2,1,30595,1,4}, "Ь����", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 4 then
--		gf_AddItemEx2({2,1,30596,1,4}, "�߼�������", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 5 then
--		gf_AddItemEx2({2,1,30597,1,4}, "�߼�������", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 6 then
--		gf_AddItemEx2({2,1,30598,1,4}, "�߼�Ь����", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 7 then
--		gf_AddItemEx2({2,1,30593,1,4}, "������", "���ʢ��", "������ƶһ�", 0, 1);
--		gf_AddItemEx2({2,1,30594,1,4}, "������", "���ʢ��", "������ƶһ�", 0, 1);
--		gf_AddItemEx2({2,1,30595,1,4}, "Ь����", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 8 then
--		gf_AddItemEx2({2,1,30596,1,4}, "�߼�������", "���ʢ��", "������ƶһ�", 0, 1);
--		gf_AddItemEx2({2,1,30597,1,4}, "�߼�������", "���ʢ��", "������ƶһ�", 0, 1);
--		gf_AddItemEx2({2,1,30598,1,4}, "�߼�Ь����", "���ʢ��", "������ƶһ�", 0, 1);
--	elseif nKind == 9 then
--		gf_AddItemEx2({0,105,10120,1,4,-1,-1,-1,-1,-1,-1}, "������", "���ʢ��", "������ƶһ�", 0, 1);
--	end
--end
--
--function nothing()
--	
--end