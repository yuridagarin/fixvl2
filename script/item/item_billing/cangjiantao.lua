--�ű����ƣ�IB�������ؽ�װ�������ű�
--�ű����ܣ�ʹ�òؽ�װ�����һ���Ӧ�Ĳؽ�װ��
--���ܲ߻��ˣ���ϣ
--�����д�ˣ��Թ�
--�����дʱ�䣺2007-01-10
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--=============================��������������=============================
	cangjian_bag_name = {"B�o r��ng T�ng Ki�m ��u qu�n","B�o r��ng T�ng Ki�m y gi�p","B�o r��ng T�ng Ki�m hoa kh�","B�o r��ng T�ng Ki�m trang s�c","B�o r��ng T�ng Ki�m v� kh�"}
	att_wt = {35,80,50,185,5}
	use_level_min = 70		--�Ƿ�����ʹ�õ���͵ȼ�
function OnUse(idx)
	local id = tonumber(idx)
	--��Ʒ��Ϣ�Ļ�ȡ������
	local bag_diff = GetItemParticular(id) - 1058
	--�����ж�
	local player_Route = GetPlayerRoute()
	if player_route_chk(player_Route) == 0 then
		Talk(1,"","B�n ch�a gia nh�p m�n ph�i, kh�ng th� d�ng v�t ph�m n�y!")
		return
	elseif GetLevel() < use_level_min then
		Say("��ng c�p b�n kh�ng th� d�ng"..cangjian_bag_name[bag_diff]..", hay l� mu�n nh�n"..cangjian_bag_name[bag_diff].."?",
			2,
			"Ta mu�n s� d�ng!/#use_cangjian_bag_det("..bag_diff..")",
			"�� ta suy ngh� l�i/end_dialog"
			)
	else
		Say("B�n ��ng � d�ng"..cangjian_bag_name[bag_diff].." �� nh�n trang b� �ng v�i m�n ph�i?",
			2,
			"Ta mu�n s� d�ng!/#use_cangjian_bag_det("..bag_diff..")",
			"�� ta suy ngh� l�i/end_dialog"
			)
	end
end
function use_cangjian_bag_det(bag_diff)
	--��Ҹ��غͿռ���
	if Zgc_pub_goods_add_chk(1,att_wt[bag_diff]) ~= 1 then
		return
	end
	--׼����Ϣ����
	local canjiantao={
		{},
		{--�ؽ�ñ������-----------------�ؽ��·�����------------�ؽ���/Ь����-----------�ؽ���������---------�ؽ�����-���ࣺñ�ӡ��·�����/Ь������-С��-��������-С��
		{"Kim Cang Dao Qu�n","Kim Cang Dao Th��ng","Kim Cang Dao Trang","Kim Cang Dao B�i","Kim Cang Dao �ao",103,100,101,102,3,271},
		{"Kim Cang Dao Qu�n","Kim Cang Dao Th��ng","Kim Cang Dao Trang","Kim Cang Dao B�i","Kim Cang Dao �ao",103,100,101,102,3,272}
		},
		{
		{"Nh� Lai Dao Qu�n","Nh� Lai Dao Th��ng","Nh� Lai Dao Trang","Nh� Lai Dao B�i","Nh� Lai Dao Tr��ng",103,100,101,102,8,371},
		{"Nh� Lai Dao Qu�n","Nh� Lai Dao Th��ng","Nh� Lai Dao Trang","Nh� Lai Dao B�i","Nh� Lai Dao Tr��ng",103,100,101,102,8,372}
		},
		{
		{"La H�n Dao Qu�n","La H�n Dao Th��ng","La H�n Dao Trang","La H�n Dao B�i","La H�n Dao Th�",103,100,101,102,0,471},
		{"La H�n Dao Qu�n","La H�n Dao Th��ng","La H�n Dao Trang","La H�n Dao B�i","La H�n Dao Th�",103,100,101,102,0,472}
		},
		{},
		{
		{"Hi�p Kh�ch Dao Qu�n","Hi�p Kh�ch Dao Th��ng","Hi�p Kh�ch Dao Trang","Hi�p Kh�ch Dao B�i","Hi�p Kh�ch Dao Ch�m",103,100,101,102,1,671},
		{"Hi�p Kh�ch Dao Qu�n","Hi�p Kh�ch Dao Th��ng","Hi�p Kh�ch Dao Trang","Hi�p Kh�ch Dao B�i","Hi�p Kh�ch Dao Ch�m",103,100,101,102,1,672},
		{"Hi�p Kh�ch Dao Qu�n","Hi�p Kh�ch Dao Th��ng","Hi�p Kh�ch Dao Trang","Hi�p Kh�ch Dao B�i","Hi�p Kh�ch Dao Ch�m",103,100,101,102,1,673},
		{"Hi�p Kh�ch Dao Qu�n","Hi�p Kh�ch Dao Th��ng","Hi�p Kh�ch Dao Trang","Hi�p Kh�ch Dao B�i","Hi�p Kh�ch Dao Ch�m",103,100,101,102,1,674}
		},
		{},
		{
		{},
		{},
		{"Quan �m Dao Qu�n","Quan �m Dao Th��ng","Quan �m Dao Trang","Quan �m Dao B�i","Quan �m Dao Ki�m",103,100,101,102,2,873},
		{"Quan �m Dao Qu�n","Quan �m Dao Th��ng","Quan �m Dao Trang","Quan �m Dao B�i","Quan �m Dao Ki�m",103,100,101,102,2,874},
		},
		{
		{},
		{},
		{"Ng�c N� Dao Qu�n","Ng�c N� Dao Th��ng","Ng�c N� Dao Trang","Ng�c N� Dao B�i","Ng�c N� Dao C�m",103,100,101,102,10,973},
		{"Ng�c N� Dao Qu�n","Ng�c N� Dao Th��ng","Ng�c N� Dao Trang","Ng�c N� Dao B�i","Ng�c N� Dao C�m",103,100,101,102,10,974}
		},
		{},
		{
		{"Gi�ng Long Dao Qu�n","Gi�ng Long Dao Th��ng","Gi�ng Long Dao Trang","Gi�ng Long Dao B�i","Gi�ng Long Dao Th�",103,100,101,102,0,1171},
		{"Gi�ng Long Dao Qu�n","Gi�ng Long Dao Th��ng","Gi�ng Long Dao Trang","Gi�ng Long Dao B�i","Gi�ng Long Dao Th�",103,100,101,102,0,1172},
		{"Gi�ng Long Dao Qu�n","Gi�ng Long Dao Th��ng","Gi�ng Long Dao Trang","Gi�ng Long Dao B�i","Gi�ng Long Dao Th�",103,100,101,102,0,1173},
		{"Gi�ng Long Dao Qu�n","Gi�ng Long Dao Th��ng","Gi�ng Long Dao Trang","Gi�ng Long Dao B�i","Gi�ng Long Dao Th�",103,100,101,102,0,1174}
		},
		{
		{"Phong Ma Dao Qu�n","Phong Ma Dao Th��ng","Phong Ma Dao Trang","Phong Ma Dao B�i","Phong Ma Dao C�n",103,100,101,102,5,1271},
		{"Phong Ma Dao Qu�n","Phong Ma Dao Th��ng","Phong Ma Dao Trang","Phong Ma Dao B�i","Phong Ma Dao C�n",103,100,101,102,5,1272},
		{"Phong Ma Dao Qu�n","Phong Ma Dao Th��ng","Phong Ma Dao Trang","Phong Ma Dao B�i","Phong Ma Dao C�n",103,100,101,102,5,1273},
		{"Phong Ma Dao Qu�n","Phong Ma Dao Th��ng","Phong Ma Dao Trang","Phong Ma Dao B�i","Phong Ma Dao C�n",103,100,101,102,5,1274}
		},
		{},
		{
		{"Ch�n V� Dao Qu�n","Ch�n V� Dao Th��ng","Ch�n V� Dao Trang","Ch�n V� Dao B�i","Ch�n V� Dao Ki�m",103,100,101,102,2,1471},
		{"Ch�n V� Dao Qu�n","Ch�n V� Dao Th��ng","Ch�n V� Dao Trang","Ch�n V� Dao B�i","Ch�n V� Dao Ki�m",103,100,101,102,2,1472},
		{"Ch�n V� Dao Qu�n","Ch�n V� Dao Th��ng","Ch�n V� Dao Trang","Ch�n V� Dao B�i","Ch�n V� Dao Ki�m",103,100,101,102,2,1473},
		{"Ch�n V� Dao Qu�n","Ch�n V� Dao Th��ng","Ch�n V� Dao Trang","Ch�n V� Dao B�i","Ch�n V� Dao Ki�m",103,100,101,102,2,1474}
		},
		{
		{"Nh�t D��ng Dao Qu�n","Nh�t D��ng Dao Th��ng","Nh�t D��ng Dao Trang","Nh�t D��ng Dao B�i","Nh�t D��ng Dao B�t",103,100,101,102,9,1571},
		{"Nh�t D��ng Dao Qu�n","Nh�t D��ng Dao Th��ng","Nh�t D��ng Dao Trang","Nh�t D��ng Dao B�i","Nh�t D��ng Dao B�t",103,100,101,102,9,1572},
		{"Nh�t D��ng Dao Qu�n","Nh�t D��ng Dao Th��ng","Nh�t D��ng Dao Trang","Nh�t D��ng Dao B�i","Nh�t D��ng Dao B�t",103,100,101,102,9,1573},
		{"Nh�t D��ng Dao Qu�n","Nh�t D��ng Dao Th��ng","Nh�t D��ng Dao Trang","Nh�t D��ng Dao B�i","Nh�t D��ng Dao B�t",103,100,101,102,9,1574}
		},
		{},
		{
		{"Xa K� T��ng Qu�n Qu�n","Xa K� T��ng Qu�n Th��ng","Xa K� T��ng Qu�n Trang","Xa K� T��ng Qu�n B�i","Xa K� T��ng Qu�n Th��ng",103,100,101,102,6,1771},
		{"Xa K� T��ng Qu�n Qu�n","Xa K� T��ng Qu�n Th��ng","Xa K� T��ng Qu�n Trang","Xa K� T��ng Qu�n B�i","Xa K� T��ng Qu�n Th��ng",103,100,101,102,6,1772},
		{"Xa K� T��ng Qu�n Qu�n","Xa K� T��ng Qu�n Th��ng","Xa K� T��ng Qu�n Trang","Xa K� T��ng Qu�n B�i","Xa K� T��ng Qu�n Th��ng",103,100,101,102,6,1773},
		{"Xa K� T��ng Qu�n Qu�n","Xa K� T��ng Qu�n Th��ng","Xa K� T��ng Qu�n Trang","Xa K� T��ng Qu�n B�i","Xa K� T��ng Qu�n Th��ng",103,100,101,102,6,1774}
		},
		{
		{"D��ng An Qu�n","D��ng An Th��ng","D��ng An Trang","D��ng An B�i","D��ng An Cung",103,100,101,102,4,1871},
		{"D��ng An Qu�n","D��ng An Th��ng","D��ng An Trang","D��ng An B�i","D��ng An Cung",103,100,101,102,4,1872},
		{"D��ng An Qu�n","D��ng An Th��ng","D��ng An Trang","D��ng An B�i","D��ng An Cung",103,100,101,102,4,1873},
		{"D��ng An Qu�n","D��ng An Th��ng","D��ng An Trang","D��ng An B�i","D��ng An Cung",103,100,101,102,4,1874}
		},
		{},
		{
		{"U Minh Thi�n Qu�n Qu�n","U Minh Thi�n Qu�n Th��ng","U Minh Thi�n Qu�n Trang","U Minh Thi�n Qu�n B�i","U Minh Thi�n Qu�n �ao",103,100,101,102,7,2071},
		{"U Minh Thi�n Qu�n Qu�n","U Minh Thi�n Qu�n Th��ng","U Minh Thi�n Qu�n Trang","U Minh Thi�n Qu�n B�i","U Minh Thi�n Qu�n �ao",103,100,101,102,7,2072},
		{"U Minh Thi�n Qu�n Qu�n","U Minh Thi�n Qu�n Th��ng","U Minh Thi�n Qu�n Trang","U Minh Thi�n Qu�n B�i","U Minh Thi�n Qu�n �ao",103,100,101,102,7,2073},
		{"U Minh Thi�n Qu�n Qu�n","U Minh Thi�n Qu�n Th��ng","U Minh Thi�n Qu�n Trang","U Minh Thi�n Qu�n B�i","U Minh Thi�n Qu�n �ao",103,100,101,102,7,2074}
		},
		{
		{"Mi�u T�m Qu�n","Mi�u T�m Th��ng","Mi�u T�m Trang","Mi�u T�m B�i","Mi�u T�m Tr�o",103,100,101,102,11,2171},
		{"Mi�u T�m Qu�n","Mi�u T�m Th��ng","Mi�u T�m Trang","Mi�u T�m B�i","Mi�u T�m Tr�o",103,100,101,102,11,2172},
		{"Mi�u T�m Qu�n","Mi�u T�m Th��ng","Mi�u T�m Trang","Mi�u T�m B�i","Mi�u T�m Tr�o",103,100,101,102,11,2173},
		{"Mi�u T�m Qu�n","Mi�u T�m Th��ng","Mi�u T�m Trang","Mi�u T�m B�i","Mi�u T�m Tr�o",103,100,101,102,11,2174}
		}
	}
	--�����Ϣ��ȡ�Լ�����
	local player_Route = GetPlayerRoute()
	local player_body = GetBody()
	--�����ڼ��
	if GetItemCount(2,1,(1058+bag_diff)) == 0 then
		Talk(1,"","Xin x�c nh�n tr�n ng��i c� mang <color=green>"..cangjian_bag_name[bag_diff].."<color>!")
		return
	end
	--��ʹ�óɹ����
	if DelItem(2,1,(1058+bag_diff),1) == 0  then
		Talk(1,"","Xin x�c nh�n tr�n ng��i c� mang <color=green>"..cangjian_bag_name[bag_diff].."<color>!")
		return		
	end
	local add_flag = AddItem(0,canjiantao[player_Route][player_body][bag_diff+5],canjiantao[player_Route][player_body][11],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n s� d�ng:"..cangjian_bag_name[bag_diff].."��i l�y: "..canjiantao[player_Route][player_body][bag_diff].."!")
	else
		WriteLog("��i T�ng Ki�m bao: Ng��i ch�i"..GetName().."s� d�ng:"..cangjian_bag_name[bag_diff].."��i trang b� th�t b�i, k� hi�u:"..add_flag)
	end
end
--*******************************������ɼ��********************************
function player_route_chk(player_Route)
	if player_Route == 0 or player_Route == 1 or player_Route == 5 or player_Route == 7 or player_Route == 10 
	or player_Route == 13 or player_Route == 16 or player_Route == 19 then
		return 0 
	else
		return 1
	end
end
