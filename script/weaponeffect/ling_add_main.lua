--�ű����ƣ����Ǻ����ܸ��Ź����ű�
--�ű����ܣ����Ǻ����ܹ��������ͺ�������
--�߻��ˣ���ǿ
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2008-1-12
--�����޸ļ�¼��
	--���������Ϣ
	Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������

	Sever_diff = 2		--1Ϊ�շ�����2Ϊ�����
	Break_sky_get_sec_seq_TaskID = 1417
	Consume_get_sec_seq_TaskID = 1421
	Aptitue_cent_TasktempID = 196
	Aptitue_seq_save_1_TasktempID = 197
	Aptitue_seq_save_10_TasktempID = 198
	Weapon_index_save_TasktempID = 199
	--IB�����Ϣ
	IB_cost_month_seq = 1418
	IB_cost_num = 1419
	Tb_aptitude_num = {{7},{250},{},{15000},{3},{15000},{0,79},{80,100},{},{10},{},{2000,200000},{101,150},}
	Tb_aptitude_info = {
		{"�� c��ng h�a v� kh� ��t "..Tb_aptitude_num[1][1],																"return weapon_level_chk()",		"Thi�t C�t, h�o quang xanh nh�t (Linh ph�ch c�p 1)",	1,1,"�� c��ng h�a v� kh� ��t <color=yellow>"..Tb_aptitude_num[1][1].."<color>","Thi�t C�t",30},
		{"��i h�i t� v� H�ng 2-10 l�u ph�i",																													"return bw_seq_chk(2)",				"B�ch chi�n, s��ng m� �� (Linh ph�ch c�p 2)",6,2,"��i h�i t� v� H�ng <color=yellow>2-10<color>","B�ch Chi�n",7},
		{"�! V� kh� Ho�ng Kim l�p l�nh!",																															"return golden_weapon_chk()",	"Ch��c Nh�t, s��ng m� v�ng (Linh ph�ch c�p 2)",	2,2," �� trang b� <color=yellow>trang b� Ho�ng Kim<color>","Ch��c Nh�t",30},
		{"�� c�ng hi�n ��t "..Tb_aptitude_num[4][1],													"return tech_offer_num_chk()",	"Tu�n D�t, s��ng m� lam (Linh ph�ch c�p 2)",	2,2,"�i�m c�ng hi�n s� m�n ��t ��n <color=yellow>"..Tb_aptitude_num[4][1].."<color>","Tu�n D�t",30},
		{"��ng c�p s� ��c ta �� ��t (v��t) c�p "..Tb_aptitude_num[5][1]..", �� ta d�y!",								"return teah_prentice_chk()",		"��o L�, s��ng m� l�c (Linh ph�ch c�p 2)",	2,2,"��ng c�p s� ��c ��t c�p <color=yellow>"..Tb_aptitude_num[5][1].."<color>","��o L�",30},
		{"Ta l� danh nh�n, danh v�ng ��t ��n (v��t) "..Tb_aptitude_num[6][1],																	"return repute_num_chk()",			"Danh T�c, s��ng m� n�u (Linh ph�ch c�p 2)",	2,2,"Danh v�ng ��t ��n <color=yellow>"..Tb_aptitude_num[6][1].."<color> �i�m","Danh T�c",30},
		{"Ta b�n l� b� b�t qu�i Linh Kh� �o�n th�p ("..Tb_aptitude_num[7][1].."-"..Tb_aptitude_num[7][2]..")",			"return equipment_lin_chk(7) ",	"L�c H�, s��ng m� t�m v� h�o quang lam (Linh ph�ch c�p 2)",	2,1,"�� trang b� b� b�t qu�i Linh Kh� �o�n th�p","L�c H�",30},
		{"Xem b� b�t qu�i Linh Kh� �o�n trung ("..Tb_aptitude_num[8][1].."-"..Tb_aptitude_num[8][2]..")! D�ng r�t t�t!","return equipment_lin_chk(8) ",	"L�ng Ti�u, s��ng m� t�m v� tia s�ng l�c (Linh ph�ch c�p 2)",	2,2,"�� trang b� b� b�t qu�i Linh Kh� �o�n trung (80-100)","L�ng Ti�u",30},
		{"��i T��ng Qu�n ���ng tri�u l� t�i h�!",																															"return general_chk()",					"�o�n Giao, �nh s�ng ph�t t�n �� (Linh ph�ch c�p 3)",	3,6,"Qu�n h�m chi�n tr��ng l�: <color=yellow>T��ng Qu�n<color> (g�m T��ng Qu�n v�nh vi�n)","�o�n Giao",30},
		{"Ta kinh nghi�m ��y m�nh, b�ng x�p h�ng th� gi�i h�ng "..Tb_aptitude_num[10][1].."!!",															"return player_rank_chk() ",			"C�i Th�, �nh s�ng ph�t t�n lam (Linh ph�ch c�p 3)",	3,4,"B�ng x�p h�ng th� gi�i h�ng <color=yellow>"..Tb_aptitude_num[10][1].."<color>","C�i Th�",30},
		{"To gan! Th�y b�n Nguy�n So�i c�n kh�ng qu� xu�ng?",																												"return marshal_chk()",					"Ph� Qu�n, �nh s�ng t� h�i t�m (Linh ph�ch c�p 4)",	4,8,"Qu�n h�m chi�n tr��ng l�: <color=yellow>Nguy�n So�i<color> (g�m Nguy�n So�i v�nh vi�n)","Ph� Qu�n",30},
		{"��i h�i t� v� h�ng 1 l�u ph�i",																													"return bw_seq_chk(1)",				"Tinh Di, �ng s�ng ph�t t�n t�m (Linh ph�ch c�p 3)",7,3,"��i h�i t� v� h�ng <color=yellow>1<color> l�u ph�i","Tinh Di",7},
		{"��o tr��ng c� th� ch�m nh� v�o b� b�t qu�i Linh Kh� �o�n cao ("..Tb_aptitude_num[13][1].." tr� l�n) c�a ta",							"return equipment_lin_chk(13)",	"Ph�n V�n, s��ng m� t�m v� tia s�ng v�ng (Linh ph�ch c�p 2)",2,3,"�� trang b� b� b�t qu�i Linh Kh� �o�n (100) tr� l�n","Ph�n V�n",30},
		{"",																																								"return consume_num_chk()",		"H�o M�n, �nh s�ng t� h�i v�ng (Linh ph�ch c�p 4)",	4,7,"","H�o m�n",30},
	}
	if Sever_diff == 1 then
		Tb_aptitude_info[getn(Tb_aptitude_info)][1] = "�i�m t�ch l�y ti�u d�ng c�a ta �� g�p r�t nhi�u!"
		Tb_aptitude_info[getn(Tb_aptitude_info)][6]  = "<color=yellow>2000<color> �i�m t�ch l�y ti�u d�ng"
	else
		Tb_aptitude_info[getn(Tb_aptitude_info)][1] = "�i�m t�ch l�y ti�u d�ng c�a ta �� g�p r�t nhi�u!"
		Tb_aptitude_info[getn(Tb_aptitude_info)][6]  = "<color=yellow>20 v�n<color> �i�m t�ch l�y ti�u d�ng"
	end
	Tb_ib_money = {"1 b�c l�","1 Xu"}
	--������Ϣ
	Break_sky_need_cent = 26
	--������Ϣ
	Tb_add_mertiral = {
	{2,1,3330,"Nh�t Thi�m Y�u Ho�ng"},
	{2,1,3331,"Tam Di�u Long Hi"},
	{2,1,3332,"�� Nguy�t Th�n Sa"},
	{2,1,3333,"Ph�n Quang Th�n Sa"},
	{2,1,3334,"Tr�m Tinh Th�n Sa"},
	{2,1,3204," Ng� Th�i Lung T�y"},
	{2,1,3205,"Th�t Huy�n T� V�n"},
}
	--��Ч������Ϣ
	Tb_aptitude_cost_info = {
		{	--�շ�
			{20,30,1},
			{50,35,1},
			{1000,30,2},
			{2000,50,6},
			{5000,20,7},
			{0,0,0},
			{0,0,0},
		},			
		{	--���
			{30,30,1},
			{75,35,1},
			{1500,30,2},
			{3000,50,6},
			{7500,30,7},
			{0,0,0},
			{0,0,0},
		},			
	}
	--�ƽ�������Ϣ
	Tb_golden_weapon_info = {
		{0,3,6001,"Ph� Y�n �ao"},
		{0,5,6002,"Ph� Y�n c�n"},
		{0,8,6003,"Ph� Y�n tr��ng"},
		{0,0,6004,"H�m Y�n th�"},
		{0,1,6005,"T�ng Y�n ch�m"},
		{0,2,6006,"Phi Y�n ki�m"},
		{0,10,6007,"V�n Y�n c�m"},
		{0,0,6008,"V�n Y�n th�"},
		{0,5,6009,"L�u Y�n c�n"},
		{0,2,6010,"Huy�n Y�n ki�m"},
		{0,9,6011,"V� Y�n b�t"},
		{0,6,6012,"H� Ti�m Th��ng"},
		{0,4,6013,"H�nh Y�n Cung"},
		{0,7,6014,"Tr�c Y�n nh�n"},
		{0,11,6015,"Y�u Y�n tr�o"},
		{0,3,8801,"Hi�n Vi�n To�i V� �ao"},
		{0,5,8802,"Hi�n Vi�n To�i V� C�n"},
		{0,8,8803,"Hi�n Vi�n C�u Nh� Tr��ng"},
		{0,0,8804,"Hi�n Vi�n H�o Nhi�n Th�"},
		{0,1,8805,"Hi�n Vi�n ch�m v� h�nh"},
		{0,2,8806,"Hi�n Vi�n T� Tinh Ki�m"},
		{0,10,8807,"Hi�n Vi�n Ph�ng Ho�ng C�m"},
		{0,0,8808,"Hi�n Vi�n Ng� Nh�c Th�"},
		{0,5,8809,"Hi�n Vi�n Ph� Thi�n C�n"},
		{0,2,8810,"Hi�n Vi�n H�ng Qu�n Ki�m"},
		{0,9,8811,"Hi�n Vi�n Sinh T� B�t"},
		{0,6,8812,"Hi�n Vi�n Ph� Qu�n Th��ng"},
		{0,4,8813,"Hi�n Vi�n Khai Thi�n Cung"},
		{0,7,8814,"Hi�n Vi�n �m D��ng Nh�n"},
		{0,11,8815,"Hi�n Vi�n U Minh Tr�o"},
		{0,3,2351,"T� Quang B� V��ng �ao"},
		{0,5,2352,"T� Quang B� V��ng C�n"},
		{0,8,2353,"T� Quang B� �� Tr��ng"},
		{0,0,2354,"T� Quang Ph�c Ma Th�"},
		{0,1,2355,"T� Quang L�u V�n Ch�m"},
		{0,2,2356,"T� Quang Huy�n Minh Ki�m"},
		{0,10,2357,"T� Quang Ti�u T��ng C�m"},
		{0,0,2358,"T� Quang Gi�ng Long Th�"},
		{0,5,2359,"T� Quang H�nh V�n C�n"},
		{0,2,2360,"T� Quang L��ng Nghi Ki�m"},
		{0,9,2361,"T� Quang �o�n V�n B�t"},
		{0,6,2362,"T� Quang Tr�n Qu�n Th��ng"},
		{0,4,2363,"T� Quang Xuy�n D��ng Cung"},
		{0,7,2364,"T� Quan O�n Linh Nh�n"},
		{0,11,2365,"T� Quang V�n ��c Tr�o"},
    {0,3,241,"��t Ma Th� T�a �� Th�ch �ao"},
    {0,3,242,"��t Ma Th� T�a �� Th�ch �ao"},
    {0,5,241,"��t Ma Th� T�a �� Th�ch C�n"},
    {0,5,242,"��t Ma Th� T�a �� Th�ch C�n"},
    {0,8,341,"T�ng Kinh Th� To� Huy�n Tr��ng"},
    {0,8,342,"T�ng Kinh Th� To� Huy�n Tr��ng"},
    {0,0,441,"La H�n Th� To� Ch�nh Gi�c Th�"},
    {0,0,442,"La H�n Th� To� Ch�nh Gi�c Th�"},
    {0,1,641,"Thi�n Th� Th�n V� Ti�m �n Ch�m"},
    {0,1,642,"Thi�n Th� Th�n V� Ti�m �n Ch�m"},
    {0,1,643,"Thi�n Th� Th�n V� Ti�m �n Ch�m"},
    {0,1,644,"Thi�n Th� Th�n V� Ti�m �n Ch�m"},
    {0,2,841,"Kim Quang Th�nh N� Ph�t L� Ki�m"},
    {0,2,842,"Kim Quang Th�nh N� Ph�t L� Ki�m"},
    {0,10,941,"Thi�n �m Th�nh N� Ph�t V�n C�m"},
    {0,10,942,"Thi�n �m Th�nh N� Ph�t V�n C�m"},
    {0,0,1141,"Ch�p Ph�p Ph� T�n Th�"},
    {0,0,1142,"Ch�p Ph�p Ph� T�n Th�"},
    {0,0,1143,"Ch�p Ph�p Ph� T�n Th�"},
    {0,0,1144,"Ch�p Ph�p Ph� T�n Th�"},
    {0,5,1241,"Ch��ng B�ng Long Ch�ng C�n"},
    {0,5,1242,"Ch��ng B�ng Long Ch�ng C�n"},
    {0,5,1243,"Ch��ng B�ng Long Ch�ng C�n"},
    {0,5,1244,"Ch��ng B�ng Long Ch�ng C�n"},
    {0,2,1441,"Th��ng Thanh Th�n Kh�ng Ki�m"},
    {0,2,1442,"Th��ng Thanh Th�n Kh�ng Ki�m"},
    {0,2,1443,"Th��ng Thanh Th�n Kh�ng Ki�m"},
    {0,2,1444,"Th��ng Thanh Th�n Kh�ng Ki�m"},
    {0,9,1541,"T� Ti�u Ng� Kh�ng B�t"},
    {0,9,1542,"T� Ti�u Ng� Kh�ng B�t"},
    {0,9,1543,"T� Ti�u Ng� Kh�ng B�t"},
    {0,9,1544,"T� Ti�u Ng� Kh�ng B�t"},
    {0,6,1741,"Tr�n Qu�n V� Song Th��ng"},
    {0,6,1742,"Tr�n Qu�n V� Song Th��ng"},
    {0,6,1743,"Tr�n Qu�n V� Song Th��ng"},
    {0,6,1744,"Tr�n Qu�n V� Song Th��ng"},
    {0,4,1841,"Chinh L� B� Gi� Cung"},
    {0,4,1842,"Chinh L� B� Gi� Cung"},
    {0,4,1843,"Chinh L� B� Gi� Cung"},
    {0,4,1844,"Chinh L� B� Gi� Cung"},
    {0,7,2041,"Di�m La T�n Gi� Ma H�n Nh�n"},
    {0,7,2042,"Di�m La T�n Gi� Ma H�n Nh�n"},
    {0,7,2043,"Di�m La T�n Gi� Ma H�n Nh�n"},
    {0,7,2044,"Di�m La T�n Gi� Ma H�n Nh�n"},
    {0,11,2141,"C� ��c T�n Gi� Ph� Thi�n Tr�o"},	
    {0,11,2142,"C� ��c T�n Gi� Ph� Thi�n Tr�o"},	
    {0,11,2143,"C� ��c T�n Gi� Ph� Thi�n Tr�o"},	
    {0,11,2144,"C� ��c T�n Gi� Ph� Thi�n Tr�o"},			
		{0,3,8851,"T� Quang To�i V� �ao"},
		{0,5,8852,"T� Quang To�i V� C�n"},
		{0,8,8853,"T� Quang C�u Nh� Tr��ng"},
		{0,0,8854,"T� Quang H�o Nhi�n Th�"},
		{0,1,8855,"T� Quang V� H�nh Ch�m"},
		{0,2,8856,"T� Quang T� Tinh Ki�m"},
		{0,10,8857,"T� Quang Ph�ng Ho�ng C�m"},	
		{0,0,8858,"T� Quang Ng� Nh�c Th�"},
		{0,5,8859,"T� Quang Ph� Thi�n C�n"},
		{0,2,8860,"T� Quang H�ng Qu�n Ki�m"},
		{0,9,8861,"T� Quang Sinh T� B�t"},
		{0,6,8862,"T� Quang Ph� Qu�n Th��ng"},
		{0,4,8863,"T� Quang Khai Thi�n Cung"},
		{0,7,8864,"T� Quang �m D��ng Nh�n"},
		{0,11,8865,"T� Quang U Minh Tr�o"}	
	}
	
	Npc_name = "<color=green>Long Quang Ch�n Nh�n<color>: "
--���������ܵĶ�Ӧ��Ϣ
	Tb_route_point_info = {}
	Tb_route_point_info[2]={3,2}
	Tb_route_point_info[3]={6,2}
	Tb_route_point_info[4]={6,4}
	Tb_route_point_info[14]={6,5}
	Tb_route_point_info[15]={5,4}
	Tb_route_point_info[8]={2,6}
	Tb_route_point_info[9]={6,4}
	Tb_route_point_info[12]={4,5}
	Tb_route_point_info[11]={3,2}
	Tb_route_point_info[17]={3,2}
	Tb_route_point_info[18]={4,3}
	Tb_route_point_info[20]={4,3}
	Tb_route_point_info[21]={5,6}
	Tb_route_point_info[6]={4,3}
	Tb_point_name = {"","G�n c�t","S�c m�nh","Th�n ph�p","Linh ho�t","N�i c�ng ",}
--�������ı�
	Tb_blity_cost_name =  {
			{	
				{"Xu"},
				{"Tinh luy�n B�ng Th�ch",2,1,533},
				{"V� Ng�n Th�y",2,1,503},
				{"N� Oa Tinh Th�ch",2,1,504},
			},
			{	
				{"B�n Long b�ch",2,1,1000},
				{"Th� Th�n ph�",2,0,556},
				{"V� Ng�n Th�y",2,1,503},
				{"H�a Th� B�ch",2,1,1001},
			},
	}
	Tb_ability_cost_num = {
		{
			{20,30,50},
			{100,150,150},
			{300,450,300},
			{450,650,500},
			{700,1000,600},
			{35,20,50},
			{150,150,100},
		},
		{
			{20,30,50},
			{100,150,150},
			{300,450,300},
			{450,650,500},
			{700,1000,600},
			{35,60,60},
			{150,150,100},
		}
	}
	--����ħ�����Ե�����
	Tb_ability_magic_goods_cost_num = {
	{	{},{},
		{9,18,27,36,45,0,0},
		{4,8,12,16,20,0,0},
		{4,8,12,16,20,0,0},
	}, 
	{	{},{},
		{9,18,27,36,45,0,0},
		{5,10,15,20,25,0,0},
		{4,8,12,16,20,0,0}, 
	}
	}
--������ֵ��Ϣ
Tb_lin_ability_info = {
	{"T�ng �i�m sinh l�c",500,500},
	{"T�ng �i�m to�n thu�c t�nh",3,3},
	{"T�ng �i�m thu�c t�nh l�u ph�i",6,6},
}
------------------------------------------�����жϺ�������-------------------------------------
--����ǿ��7
function weapon_level_chk()
	--����ǿ���ȼ��ж�
	local weapon_index = GetPlayerEquipIndex(2)
	local equip_level = GetEquipAttr(weapon_index,2)
	if equip_level >= Tb_aptitude_num[1][1] then
		return 1
	else
		return 0
	end
end
--�д����(��ǰû�п�����ʱ����)
function bw_seq_chk(chk_flag)
	local week_seq,bw_seq_diff,bw_seq = GetPlayerBwRank()
	if chk_flag == 1 and bw_seq == 1 then
		return 1
	elseif chk_flag == 2 and (bw_seq >=2 and bw_seq <= 10) then
		return 1
	else
		return 0
	end		
end
--�ƽ�����
function golden_weapon_chk()
	--����ID��ȡ
	local weapon_id_1st,weapon_id_2nd,weapon_3rd = GetPlayerEquipInfo(2)
	local golden_weapon_chk_flag = 0
	for i = 1, getn(Tb_golden_weapon_info) do
		if Tb_golden_weapon_info[i][1] == weapon_id_1st and Tb_golden_weapon_info[i][2] == weapon_id_2nd and Tb_golden_weapon_info[i][3] == weapon_3rd then
			golden_weapon_chk_flag = 1
		end
	end
	if golden_weapon_chk_flag == 0 then
		return 0
	else
		return 1
	end
end
--ʦ�Ź��׶�
function tech_offer_num_chk()
	local tech_num = GetTask(336)
	if tech_num >= Tb_aptitude_num[4][1] then
		return 1
	else
		return 0
	end
end
--ʦ�µȼ�
function teah_prentice_chk()
	local table_temp = GetMPBaseInfo()
	if table_temp["moral"] >= (Tb_aptitude_num[5][1] * 100)then
		return 1
	else
		return 0
	end
end
--����
function repute_num_chk()
	if GetReputation() >= Tb_aptitude_num[6][1] then
		return 1
	else
		return 0
	end
end
--������
function equipment_lin_chk(aptitue_seq)
	local weapon_index = GetPlayerEquipIndex(2)
	--�Ƿ��ǰ�����
	if IsSlaveItem(weapon_index) ~= 1 then
		return 0
	end
	--����ֵ(ƽ��ֵ)�Ƿ�ﵽҪ��
	local lin_num_cout = 0
	for i = 0,3 do
		lin_num_cout = lin_num_cout + GetItemMaxLingQi(GetPlayerEquipIndex(i))
	end
	local lin_num_average = lin_num_cout/4
	if lin_num_average >= Tb_aptitude_num[aptitue_seq][1] and lin_num_average <= Tb_aptitude_num[aptitue_seq][2] then
		return 1
	else
		return 0
	end
end
--�����ж�
function general_chk()
	if abs(GetTask(704)) == 5 or (GetTask(766) +GetTask(765)) >= 10 then
		return 1
	else
		return 0
	end
end
--Ԫ˧�ж�
function marshal_chk()
	if abs(GetTask(704)) == 6 or GetTask(765) >= 15 then
		return 1
	else
		return 0
	end
end
--�ȼ������ж�
function player_rank_chk()
	local player_rank_seq = GetPlayerWorldRank(PlayerIndex)
	if player_rank_seq == nil then
		return 0
	end
	if player_rank_seq >= 1 and player_rank_seq <= Tb_aptitude_num[10][1] then
		return 1
	else
		return 0
	end
end
--���ѻ��֣���������
function consume_num_chk()
	--local month_seq_saved = GetTask(IB_cost_month_seq)
	--local month_seq_now = tonumber(date("%Y%m"))
	--if month_seq_now > month_seq_saved then
	--	SetTask(month_seq_saved,month_seq_now)
	--	SetTask(IB_cost_num,0)
	--	return 0
	--elseif month_seq_now < month_seq_saved then
	--	return 0
	--else
		if GetTask(IB_cost_num) >= Tb_aptitude_num[12][Sever_diff] then
			return 1
		end
	--end
end
--�����������
function weapon_cha_chk()
	local weapon_index = GetPlayerEquipIndex(2)
	local weapon_index_saved = GetTaskTemp(Weapon_index_save_TasktempID)
	--����װ���ж�
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H�y trang b� v� kh� tr��c r�i ��n t�m ta!")
		return 0
	end
	--������Լ��
	if weapon_index_saved ~= weapon_index then
		Talk(1,"",Npc_name..Zgc_pub_sex_name().."��ng t�c ��i v� kh� nhanh l�m, nh�ng kh�ng qua ���c m�t l�o phu!")
		return 0
	end
	return 1
end
