--�ļ����ƣ�2008�����ͷ�ļ�
--�ļ����ܣ�����ڵ���ع��������ͺ���
--���ܲ߻���00
--���ܿ������峤
--����ʱ�䣺2008-05-14
--�޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\lingshi_head.lua")

-----------------����������
--����������:1��Ϊ�շѷ���2��Ϊ��ѷ�
Sever_diff = 2
--��������ر�ʱ��
dragon_boat_08_start_time = 2008060423
dragon_boat_08_end_time = 2008061001
--����ʹ��������ص���Ϣ
TaskID_aixiang_use_date_seq = 1294
TaskID_aixiang_use_num = 1295
Aixiang_use_num_day = 5
TaskID_baiyu_use_num = 1296
Baiyu_use_num_max = 15
TaskID_yupin_use_num = 1297
Yupin_use_num_max = 5
--������������ʱ����
chg_mertiral_TaskTempID = 168
TaskID_suit_prize = 1400 --��װ������ȡ���
TaskID_exp_get_date_seq = 1298 --������ȡ��������
TaskID_exp_get_times = 1299 --������ȡ����
Tb_zongzi_use_num = {
	{"B�nh �t B�ch Ng�c",TaskID_baiyu_use_num,Baiyu_use_num_max},
	{"B�nh �t Ng� Ph�m",TaskID_yupin_use_num,Yupin_use_num_max},
}
--����������Ϣ���շѺ���Ѳ�ͬ��
Tb_zongzi_08_aixiang = {"50 v�n �i�m s�c kh�e chuy�n th�nh kinh nghi�m",	"Nh�n ���c 100000 �i�m kinh nghi�m",}
Tb_zongzi_aixong_exp_num = {500000,100000}
Tb_zongzi_08_yupin = {"��i 1 Vi�m Ho�ng Thi�t H�n ho�c 12 vi�n Linh th�ch c�p 7","��i 1 Vi�m Ho�ng Thi�t H�n ho�c 12 vi�n Linh th�ch c�p 7 ho�c B�ch t�c h�c b�ch m�"}
--������Ϣ
Tb_zongzi_08 = {
	--����-ID���һλ-�ϳɳɹ���-��װ����-�ϳɲ���-��������-��Ӧ��������-ʹ�ö�Ӧ����--�Ƿ�ֱ��ʹ��--ʹ����ȴʱ��
	{"B�nh �t g�o th�m",3359,100,	5,		{{3370,1,"��u ��"},	{3371,1,"G�o tr�ng"},			{3369,1,"L� g�i b�nh"},},"Trong v�ng 3 ph�t ngo�i c�ng t�ng 5%, s�t th��ng t�ng 30",						"zongzi_xiangmi",	1,	(3*60*18)},
	{"b�nh �t ng�i h��ng",1123,100,	10,	{{3359,1,"B�nh �t g�o th�m"},	{3372,1,"L� ng�i"},			{3369,1,"L� g�i b�nh"},},"Ph�n th��ng 10 v�n*b�nh ph��ng ��ng c�p/6400 �i�m kinh nghi�m",				"zongzi_aixiang",0,	0},
	{"B�nh �t h�t d�",3360,100,	20,	{{1123,1,"b�nh �t ng�i h��ng"},	{3374,1,"H�t d�"},			{3369,1,"L� g�i b�nh"},},"Ng�u nhi�n nh�n ���c 1 v� th�m hi�m T�y V�c (4-6 �i)",	"zongzi_lizi",			0,	0},
	{"B�nh �t ng� h��ng",3361,100,	30,	{{3360,1,"B�nh �t h�t d�"},	{3373,1,"J�m b�ng"},			{3369,1,"L� g�i b�nh"},},"Trong v�ng 10 ph�t, sinh l�c t�ng 30%",							"zongzi_wuxiang",	1,	(10*60*18)},
	{"B�nh �t Ph� Th�y",3362,50,		50,	{{3361,1,"B�nh �t ng� h��ng"},	{3365,1,"Ph� Th�y"},					{3369,1,"L� g�i b�nh"},},"Trong v�ng 3 ph�t, t�t c� n�ng l�c t�ng 20%",					"zongzi_feicui",		1,	(3*60*18)},
	{"B�nh �t Ph� Th�y",3362,100,	100,	{{3361,1,"B�nh �t ng� h��ng"},	{3365,3,"Ph� Th�y"},					{3369,1,"L� g�i b�nh"},},"Trong v�ng 3 ph�t, t�t c� n�ng l�c t�ng 20%",					"zongzi_feicui",		1,	(3*60*18)},
	{"B�nh �t B�ch Ng�c",3363,25,		100,	{{3362,1,"B�nh �t Ph� Th�y"},	{3366,1,"B�ch Ng�c"},					{3369,1,"L� g�i b�nh"},},"Ng�u nhi�n ��i 2 vi�n Linh th�ch c�p 7 ho�c 1 T�ng Ki�m Ho�ng Kim trang",	"zongzi_baiyu",		0,	0},
	{"B�nh �t B�ch Ng�c",3363,100,	500,	{{3362,1,"B�nh �t Ph� Th�y"},	{3366,5,"B�ch Ng�c"},					{3369,1,"L� g�i b�nh"},},"Ng�u nhi�n ��i 2 vi�n Linh th�ch c�p 7 ho�c 1 T�ng Ki�m Ho�ng Kim trang",	"zongzi_baiyu",		0,	0},
	{"B�nh �t Ng� Ph�m",3364,26,		500,	{{3363,1,"B�nh �t B�ch Ng�c"},	{3367,1,"M�nh b� ph��ng ng� ch�"},	{3369,1,"L� g�i b�nh"},},Tb_zongzi_08_yupin[Sever_diff],						"zongzi_yupin",		0,	0},
	{"B�nh �t Ng� Ph�m",3364,100,	1000,	{{3363,1,"B�nh �t B�ch Ng�c"},	{3367,9,"M�nh b� ph��ng ng� ch�"},	{3369,1,"L� g�i b�nh"},},Tb_zongzi_08_yupin[Sever_diff],					"zongzi_yupin",		0,	0},
}
--��Ʊ��Ϣ
Tb_nw_tickets = {
	{40,2,0,1034,"T�ch D��ng Tinh Hoa"},
	{80,2,0,1035,"Ng� H�nh K� Phi�n"},
	{100,2,0,1036,"La b�n"},
}
--�������ӽ�����Ϣ
Tb_baiyu_prize = {
	{5,
		{
			{0,103,95},
			{0,103,96},
			{0,103,97},
			{0,103,98},   
		},
	"T�ng Ki�m T� Kim m�o"
	},
	{10, 
		{
			{0,100,95},
			{0,100,96},
			{0,100,97},
			{0,100,98},
		},
	"Kim L� Th��ng"
	},
	{15,
		{
			{0,101,95},
			{0,101,96},
			{0,101,97},
			{0,101,98},   
		},
	"T�ng Ki�m � kim ph�c"
	},
	{16,{0,102,38},"T�ng Ki�m B�o Ch�u"},
	{17,{0,102,39},"T�ng Ki�m K� Th�ch"},
	{18,{0,102,40},"T�ng Ki�m Kim �n"},
}
--��Ʒ���ӽ�����Ϣ
Tb_yupin_prize = {
	{2,1,1146,"Vi�m Ho�ng Thi�t H�n"},
	{0,105,15,"Phi�n V� (v�nh vi�n)"},
	{0,105,19,"Si�u Quang (v�nh vi�n)"},
	{"12 vi�n Linh th�ch c�p 7"},
}
--��װ��Ϣ
Tb_suit_prize = {
	{
		{"Nam B�t B�t ��u_ti�u chu�n ",0,108,510},
		{"Nam B�t B�t ��u_kh�i ng�",0,108,511},
		{"N� B�t B�t ��u_g�i c�m",0,108,513},
		{"N� B�t B�t ��u_ki�u n�",0,108,512},
	},
	{
		{"Nam B�t B�t y_ti�u chu�n",0,109,510},
		{"Nam B�t B�t y_kh�i ng�",0,109,511},
		{"N� B�t B�t y_g�i c�m",0,109,513},
		{"N� B�t B�t y_ki�u n�",0,109,512},
	},
	{
		{"Nam B�t B�t kh�_ti�u chu�n ",0,110,510},
		{"Nam B�t B�t kh�_kh�i ng�",0,110,511},
		{"N� B�t B�t kh�_g�i c�m",0,110,513},
		{"N� B�t B�t kh�_ki�u n�",0,110,512},
	},
}
----------------����������
function dragon_boat_08_time_chk()
	local date_time = tonumber(date("%Y%m%d%H"))
	if date_time < dragon_boat_08_start_time then
		return 0
	elseif date_time >= dragon_boat_08_start_time and date_time <= dragon_boat_08_end_time then
		return 1
	else
		return 2
	end
end
--����ʹ��
function OnUse(goods_index)
	--��ȡ���Ӷ�Ӧ���
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i = 1,getn(Tb_zongzi_08) do
		if Tb_zongzi_08[i][2] == goods_id then
			goods_diff = i
			break
		end
	end
	--��ź����Լ��
	if goods_diff == 0 then
		return
	end
	--�Ƿ�ֱ��ʹ��
	if Tb_zongzi_08[goods_diff][8] == 1 then
		SetItemUseLapse(goods_index,Tb_zongzi_08[goods_diff][9])
		dostring(Tb_zongzi_08[goods_diff][7].."("..goods_diff..")")
		return
	end
	--ʹ��ȷ�϶Ի�չ��
	Say("<color=green>"..Tb_zongzi_08[goods_diff][1].."<color>: Hi�u qu� s� d�ng <color=yellow>"..Tb_zongzi_08[goods_diff][6].."<color>, b�n x�c nh�n mu�n s� d�ng ch�?",
	2,
	"��i/#"..Tb_zongzi_08[goods_diff][7].."("..goods_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--��������ʹ��
function zongzi_xiangmi(goods_diff)
	--Я��ɾ�����
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--Ч������
	CastState("state_p_attack_percent_add",5,180*18,1,19801279)
	CastState("state_m_attack_percent_add",5,180*18,1,19801280)
	CastState("state_damage_point",30,180*18,1,19801281)
	Msg2Player("Ch�c m�ng b�n s� d�ng ' "..Tb_zongzi_08[goods_diff][1]..", hi�u qu� nh�n ���c:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--��������
function zongzi_aixiang(goods_diff)
	--����Я�����
	if zongzi_use_dtm(1,goods_diff) ~= 1 then
		return 0
	end
	--ʹ���������ƴ���
	local date_seq_save = GetTask(TaskID_aixiang_use_date_seq)
	local use_num_save = GetTask(TaskID_aixiang_use_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--TaskID��ʼ��
	if date_seq_save == nil or date_seq_save < date_seq_now then
		SetTask(TaskID_aixiang_use_date_seq,date_seq_now)
		SetTask(TaskID_aixiang_use_num,0)
	else
		if (date_seq_save == date_seq_now and use_num_save >= Aixiang_use_num_day) or date_seq_save > date_seq_now then
			Talk(1,"","<color=green>Nh�c nh�<color>: H�m nay b�n �� s� d�ng <color=yellow>b�nh �t ng�i h��ng<color> t�i �a <color=red>"..Aixiang_use_num_day.."<color> l�n, ng�y mai m�i c� th� s� d�ng ti�p!")
			return
		end
	end
	--if GetLevel() == 99 then
	--	laborday08_baoshi_prob()
	--else
		--ʹ�����ӳɹ�
		if Sever_diff == 2 then
			--����ɾ�����
			if zongzi_use_dtm(2,goods_diff) ~= 1 then
				return 0
			end
			ModifyExp(Tb_zongzi_aixong_exp_num[Sever_diff])
			Msg2Player("Ch�c m�ng b�n �� d�ng 1 'B�nh �t ng�i h��ng', nh�n ���c "..Tb_zongzi_aixong_exp_num[Sever_diff].." �i�m kinh nghi�m!")
		else
			local golden_exp = GetGoldenExp()
			if  golden_exp <= 0 then
				Talk(1,"","<color=yellow>Nh�c nh�<color>: �i�m s�c kh�e hi�n gi� c�a b�n l� <color=red>0<color>, kh�ng th� d�ng <color=yellow>B�nh �t ng�i h��ng<color>!")
				return
			else	
				if golden_exp >= Tb_zongzi_aixong_exp_num[Sever_diff] then
					aixiang_exp_chg(goods_diff)
				else
					Say("<color=yellow>Nh�c nh�<color>: <color=yellow>B�nh �t ng�i h��ng<color> c� th� chuy�n <color=yellow>"..Tb_zongzi_aixong_exp_num[Sever_diff].."<color> �i�m s�c kh�e th�nh kinh nghi�m, �i�m s�c kh�e hi�n gi� c�a b�n l� <color=yellow>"..golden_exp.."<color>, b�n x�c nh�n mu�n s� d�ng ch�?",
						2,
						"��i/#aixiang_exp_chg("..goods_diff..")",
						"�� ta suy ngh� l�i/end_dialog"
					)
				end
			end
		end
--	end
end
--��������
function zongzi_lizi(goods_diff)
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--Я��ɾ�����
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	local ran_num = random(1,100)
	for i = 1,getn(Tb_nw_tickets) do
		if ran_num <= Tb_nw_tickets[i][1] then
			local add_flag = AddItem(Tb_nw_tickets[i][2],Tb_nw_tickets[i][3],Tb_nw_tickets[i][4],1)
			if add_flag == 1 then
				Msg2Player("Ch�c m�ng b�n �� d�ng 'B�nh �t h�t d�' ��i 1 v� v�o 'C�a �i T�y B�c' s�"..(i+3).." : "..Tb_nw_tickets[i][5].."!")
			else
				WriteLog("[T�t �oan Ng� 08] ng��i ch�i	"..GetName().."	T�ng"..Tb_nw_tickets[i][5].." th�t b�i, k� hi�u:"..add_flag)
			end
			break
		end
	end
end
--��������
function zongzi_wuxiang(goods_diff)
	--Я��ɾ�����
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--Ч������
	CastState("state_life_max_percent_add",30,600*18,1,9901,1)
	Msg2Player("Ch�c m�ng b�n s� d�ng ' "..Tb_zongzi_08[goods_diff][1]..", hi�u qu� nh�n ���c:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--�������
function zongzi_feicui(goods_diff)
	--Я��ɾ�����
	for i = 1,2 do
		if zongzi_use_dtm(i,goods_diff) ~= 1 then
			return
		end
	end
	--Ч������
	CastState("state_strength_add_percent",20,300*18,1,9902,1)
	CastState("state_vitality_add_percent",20,300*18,1,9903,1)
	CastState("state_energy_add_percent",20,300*18,1,9904,1)
	CastState("state_observe_add_percent",20,300*18,1,9905,1)
	CastState("state_dexterity_add_percent",20,300*18,1,9906,1)
	Msg2Player("Ch�c m�ng b�n s� d�ng ' "..Tb_zongzi_08[goods_diff][1]..", hi�u qu� nh�n ���c:  "..Tb_zongzi_08[goods_diff][6].."!")
end
--��������ת����
function aixiang_exp_chg(goods_diff)
	--����ɾ�����
	if zongzi_use_dtm(2,goods_diff) ~= 1 then
		return 0
	end
	local num_chg = min(GetGoldenExp(),Tb_zongzi_aixong_exp_num[Sever_diff])
	ModifyGoldenExp(-num_chg)
	ModifyExp(num_chg)
	local use_num_save = GetTask(TaskID_aixiang_use_num)
	SetTask(TaskID_aixiang_use_num,(use_num_save+1))
	Talk(1,"","<color=green>Nh�c nh�<color>: Ch�c m�ng  b�n �� d�ng 1 '<color=yellow>B�nh �t ng�i h��ng<color>', ��i <color=yellow>"..num_chg.."<color> �i�m s�c kh�e th�nh kinh nghi�m! ��y l� l�n th� <color=yellow>"..(use_num_save+1).."<color> d�ng <color=yellow>B�nh �t ng�i h��ng<color>, h�m nay b�n c�n c� th� s� d�ng <color=yellow>"..(Aixiang_use_num_day - (use_num_save+1)).."<color> l�n!")
end
--��ʯ����������ʯ
function laborday08_baoshi_prob()
	local player_name = GetName()
	local nRand = random(1,1000);
	if nRand <= 249 then
		lspf_AddLingShiInBottle(1,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch C�p 1, n� trong T� linh ��nh.")
	elseif nRand <= 479 then
		lspf_AddLingShiInBottle(2,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 2, �� nh�p v�o T� linh ��nh.");
	elseif nRand <= 709 then
		lspf_AddLingShiInBottle(3,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c1 Linh Th�ch c�p 3, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 939 then
		lspf_AddLingShiInBottle(4,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 4, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 989 then
		lspf_AddLingShiInBottle(5,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 5, �� nh�p v�o T� linh ��nh.");		
	elseif nRand <= 999 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 6, �� nh�p v�o T� linh ��nh.");
		Msg2Global("Ng��i ch�i"..player_name.."Nh�n ���c 1 vi�n Linh th�ch c�p 6 trong ho�t ��ng T�t �oan Ng�");
		WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..player_name.."Nh�n ���c 1 vi�n Linh th�ch c�p 6 trong ho�t ��ng T�t �oan Ng�.");		
	else
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 7, �� nh�p v�o T� linh ��nh.");		
		Msg2Global("Ng��i ch�i"..player_name.."Nh�n ���c 1 vi�n Linh th�ch c�p 7 trong ho�t ��ng T�t �oan Ng�");
		WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..player_name.."Nh�n ���c 1 vi�n Linh th�ch c�p 7 trong ho�t ��ng T�t �oan Ng�.");
	end
end

