--�ű����ƣ���Դ����ʹ�ýű�
--�ű����ܣ����ʹ����Դ���䣬����������Դ
--�߻��ˣ����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-03
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\lib\\globalfunctions.lua");

	Tb_box_prize_money = {			--��Ǯ�������ʡ���˵��
		{80,300000,"30 v�ng"},
		{19,500000,"50 v�ng"},
		{1,5000000,"500 l��ng"}
	}
	Tb_prize_cloth = {
		{				--��ʦ��װ
			{0,109,304},
			{0,109,305},
			{0,109,306},
			{0,109,307},
			24,
			"Qu�n S� b�o (ngo�i trang, 7 ng�y s� d�ng)"
		},
		{				--��Ͻ��װ
			{
				{0,108,300},
				{0,109,308},
				{0,110,300}
			},
			{
				{0,108,301},
				{0,109,309},
				{0,110,301}
			},
			{
				{0,108,302},
				{0,109,310},
				{0,110,302}
			},
			{
				{0,108,303},
				{0,109,311},
				{0,110,303}
			},
			16,
			"B� Danh B� (Ngo�i trang, h�n s� d�ng 7 ng�y)"
		}
	}
	Tb_unappraisal_cloth_num = {3,5}
	Tb_unappraisal_cloth_info = {
		{0,103,17},
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72},
		{0,100,17},
		{0,100,18},
		{0,100,35},
		{0,100,36},
		{0,100,53},
		{0,100,54},
		{0,100,71},
		{0,100,72},
		{0,100,17},
		{0,100,18},
		{0,100,35},
		{0,100,36},
		{0,100,53},
		{0,100,54},
		{0,100,71},
		{0,100,72},
	}
	Tb_baoshi_info = {
		{80,2642,1,"T�i B�o Th�ch"},
		{98,2640,1,"Vt�i ph�i ph��ng V�n B�o C�c"},
		{100,2643,1,"V�n B�o C�c V�n B�o ��"}
	}
	Suit_be_date_num = 7
	tb_box_award = {
		[1] = {"B�n Long B�ch", 90, {2, 1, 1000,1,1},30*24*60*60},
		[2] = {"H�a Th� B�ch", 250, {2, 1, 1001,1,1}, 30*24*60*60},				
		[3] = {"Bao M�nh Thi�n Th�ch", 250, {2, 1, 1049,1,1}, 30*24*60*60},
		[4] = {"Bao Thi�n Th�ch", 250, {2, 1, 1050,1,1}, 30*24*60*60},			
		[5] = {"Huy Ch��ng Chi�n C�ng (Huy Ho�ng)", 100, {2, 1, 9977,1,1}, 30*24*60*60},		
		[6] = {"T�i Thi�n Th�ch Tinh Th�ch", 50, {2, 1, 3356,1,1}, 0},		
		[7] = {"Th�n T�i B�o R��ng", 10, {2,1,30344,1,1}, 0},		
	}
	
function OnUse(box_index)
	--��Ʒ�����ж�
	local goods_id = GetItemParticular(box_index)
	if goods_id ~= 1210 then
		return
	end
	Say("M� r��ng t�i nguy�n s� ng�u nhi�n nh�n ���c c�c v�t ph�m gi� tr�. M� b�y gi� ch�?",
	2,
	"Ta mu�n m� ngay/open_dtm",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--****************************ȷ�Ͽ�������*************************
function open_dtm()
	--Я�����
	if GetItemCount(2,1,1210) == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n c� mang theo <color=yellow>B�o r��ng t�i nguy�n<color>!")
		return
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(8,200) ~= 1 then
		return
	end
	--ɾ�����
	if DelItem(2,1,1210,1) ~= 1 then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n c� mang theo <color=yellow>B�o r��ng t�i nguy�n<color>!")
		return
	end
	--��������
		--��Ǯ
	local rand_num = gf_GetRandItemByTable(tb_box_award,1000,2)
	local nRet, nItemIdx = gf_AddItemEx(tb_box_award[rand_num][3], tb_box_award[rand_num][1])
	if nRet ==1 then
		if tb_box_award[rand_num][4] > 0 then
			SetItemExpireTime(nItemIdx, tb_box_award[rand_num][4])
		end
	end
	Msg2Global("Ng��i ch�i: "..GetName().." m� b�o r��ng t�i nguy�n nh�n ���c "..tb_box_award[rand_num][1])
	WriteLogEx("Cong Thanh Chien","m� r��ng t�i nguy�n",1,tb_box_award[rand_num][1] )
end
