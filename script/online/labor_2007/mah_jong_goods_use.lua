--2007�괺�ڻ-�齫�ռ��-��Ʒʹ�ú���
--���뿪���ˣ��Թ�
--���뿪��ʱ�䣺2007-01-24
--�����޸ļ�¼��2008-04-11 by ī��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("Script\\Online\\\laborday08\\mah_jong_head.lua")
Include("Script\\Lib\\lingshi_head.lua")
--==========================����������������=============================
	--�����齫ID��624
	random_mah_jong_id = 664
	--�齫ID���б�
	start_seq = {
		{630,638},
		{639,647},
		{648,656},
		{657,663},
		}
	--�齫��
	mah_jong_bag = {{665,8,"T�i M�c Ch��c (ti�u)"},{666,14,"T�i M�c Ch��c (��i)"}} --ID������
	--�齫�������
	--mah_jong_prize_bag = {{667,200,"����һ����"},{668,200,"����������"},{669,200,"����������"},{670,200,"�����Ľ���"}}
	--�齫��������Ӧ����
	Tb_mah_jong_bag_prize = {
		--����----------------------ID---�ռ�-����-����-��ʦ����-76����-ũɣ��Ҫ-�׵ۿ���ѥ-ʦ����Ƭ-�������-�ܲ����-�����̻�-������
		-------------1---------------2------3-------4----5-----6------7----8---------9-----10---11-------12----13--14--------15--16------------17-18---19-20--------21-
		{"Con b�i �em c��c",667,25,700,200,300,5,10,	10,	50,	100,100,50,60,	3,50,	1095,2,0,25,"\n 100%: 10 m�n v� kh� c�p 76, danh v�ng 200-300 �i�m, 5 quy�n m�t t�ch, 2 h�p qu� c� c�i l�n \n 60%: 1-3 t�m b�n v� v� kh� m�n ph�i\n 50%: G�i Thi�n Th�ch, N�ng Tang ph�\n 25%: <color=red>R��ng s�t Nguy�t L��ng Th�<color>\n 10%: <color=red>Vi�m �� Gi�p<color>\n 10%: <color=red>Vi�m �� Kh�i<color>\n  5%: <color=red>Vi�m �� Trang<color>"},
		{"Con b�i 2 �em c��c",668,20,600,100,200,4,8,	8,	30,	30,	30,	0,30,	3,25,	1095,1,3,10,"\n 100%: 8 m�n v� kh� c�p 76, danh v�ng 100-200 �i�m, 4 quy�n m�t t�ch, 1 h�p qu� c� c�i l�n, 3 Ph�o hoa ��a tin\n 30%: 1-3 t�m b�n v� v� kh� m�n ph�i, N�ng Tang ph�\n 25%: G�i Thi�n Th�ch\n 10%: <color=red>R��ng s�t Nguy�t L��ng Th�<color>\n  3%: <color=red>Vi�m �� Gi�p<color>\n  3%: <color=red>Vi�m �� Kh�i<color>"},
		{"Con b�i 3 �em c��c",669,15,400,50,80,	2,4,	4,	20,	0,	6,	0,5,	2,10,	1094,8,2,0,"\n 100%: 4 m�n v� kh� c�p 76, danh v�ng 50-80 �i�m, 2 quy�n m�t t�ch, 8 h�p qu� c� c�i nh�, 2 Ph�o hoa ��a tin\n 10%: G�i Thi�n Th�ch, N�ng Tang ph�\n 5%: 1-2 t�m b�n v� v� kh� m�n ph�i \n   0.6%: <color=red>Vi�m �� Gi�p<color>"},
		{"Con b�i 4 �em c��c",670,11,300,20,30,	1,2,	2,	5,	0,	3,	0,1,	1,5,	1094,5,1,0,"\n 100%: 2 m�n v� kh� c�p 76, danh v�ng 20-30 �i�m, 1 quy�n m�t t�ch, 5 h�p qu� c� c�i nh�, 1 Ph�o hoa ��a tin\n  5%: G�i Thi�n Th�ch, N�ng Tang ph�\n  1%: b�n v� v� kh� m�n ph�i\n 0.3%: <color=red>Vi�m �� Gi�p<color>"},
	}
	--�����齫��ʼ��
	mah_jong = {
			"Nh�t ��ng","Nh� ��ng","Tam ��ng","T� ��ng","Ng� ��ng","L�c ��ng","Th�t ��ng","B�t ��ng","C�u ��ng",
			"M�t","Nh� �i�u","Ba","B�n","Ng� �i�u","L�c �i�u","Th�t �i�u","B�t �i�u","C�u �i�u",
			"Nh�t v�n","Nh� v�n","Tam v�n","T� v�n","Ng� v�n","L�c v�n","Th�t v�n","B�t v�n","C�u v�n",
			"��ng phong","Nam phong","T�y phong","B�c phong","H�ng trung","ph�t t�i","B�ch ban"}
	--�����齫ID
	spec_mahj_id_start = 1108
	spec_mahj_id_end = 1111
	mah_jong_prize_shoe = 1215
	--�����影��
	mahj_prize_5th = {1112,"<color=yellow>Danh s�ch ph�n th��ng<color>: \n 100%: <color=yellow>20<color> ti�n V�ng\n 50%: H�p qu� c� c�i nh�\n  5%: M�t t�ch\n  1.5%: Bao m�nh Thi�n Th�ch ho�c H�a Th� B�ch\n 0.5%: <color=red>B�o r��ng trang b� T�ng Ki�m ng�u nhi�n<color>"}
	--�齫��ؿ���ʹ�ñ�־
	mah_jong_use_flag = 1			--��һ�ں�һ���汾�ر�
--==============================���߼�����===============================
function OnUse(goods_index)
	if get_laborday08_award_state() ~= 1 then--�ж��Ƿ��ڻ�����ڼ�
		Talk(1,"end_dialog","V�t ph�m n�y ch� s� d�ng trong th�i gian di�n ra ho�t ��ng <color=yellow>1/5<color>!")
		return
	end
	if Zgc_pub_action_level_chk() == 0 then
		return
	end
	if mah_jong_use_flag ~= 1 then
		Talk(1,"end_dialog","V�t ph�m n�y ch� s� d�ng trong th�i gian di�n ra ho�t ��ng <color=yellow>1/5<color>!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--�����齫��ȡ����
	if goods_id >= start_seq[1][1] and goods_id <= start_seq[4][2] then
		Say("<color=green>Nh�c nh�<color>: B�n mu�n d�ng 1 M�t ch��c ��i th��ng?\n<color=yellow>Ph�n th��ng<color>:\n    B�nh ph��ng ��ng c�p*10 �i�m kinh nghi�m, t� l� 20% nh�n ���c 1 Linh th�ch c�p 1-7, ��t v�o T� Linh ��nh, t� l� gi�ng t�i b�o th�ch. N�u ng��i ch�i c�p 99 s� nh�n ���c 1 Linh th�ch c�p 1-7, ��t v�o T� Linh ��nh, t� l� gi�ng t�i b�o th�ch.",
		2,
		"Ta mu�n ��i ph�n th��ng/#single_mahj_pri("..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog"
		)
		return
	--�齫���һ�����
	elseif goods_id == mah_jong_bag[1][1] or goods_id == mah_jong_bag[2][1] then
		local bag_diff = (goods_id + 1) - mah_jong_bag[1][1]
		Say("<color=green>Nh�c nh�<color>: B�n x�c nh�n mu�n s� d�ng: <color=green>".. mah_jong_bag[bag_diff][3].."<color> ��i <color=green>".. mah_jong_bag[bag_diff][2].."<color> M�c ch��c �?",
		2,
		"��i/#mah_jong_bag_chg("..bag_diff..")",
		"�� ta suy ngh� l�i/end_dialog")
	--�齫��������ȡ����
	elseif goods_id >= Tb_mah_jong_bag_prize[1][2] and goods_id <= Tb_mah_jong_bag_prize[4][2] then  	
		local prize_diff = (goods_id + 1) - Tb_mah_jong_bag_prize[1][2]
		Say("<color=green>Nh�c nh�<color>: B�n x�c nh�n mu�n s� d�ng:<color=green>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>��i ph�n th��ng kh�ng? \n<color=yellow>Danh s�ch ph�n th��ng<color>:"..Tb_mah_jong_bag_prize[prize_diff][21],
			2,
			"Ta c�n ��i ph�n th��ng/#mah_jong_prize("..prize_diff..")",
			"�� ta suy ngh� l�i/end_dialog"
		)
	--�齫һ�ŵ�ʹ��
	elseif goods_id == random_mah_jong_id then
		--�齫һ��ɾ�����
		if DelItem(2,0,random_mah_jong_id,1) ~= 1 then
			Talk(1,"","<color=green>Nh�c nh�<color>: Xin x�c nh�n trong h�nh trang c� <color=yellow>1 qu�n b�i<color>!")
			return
		else
			--ͨ���齫���� �������Ϊ�����ʡ���λ��ǧ�ֱȡ����紫��50 ��ʾ5%���
			add_mahjong_prob(1000)
		end
	elseif goods_id >= spec_mahj_id_start and goods_id <= spec_mahj_id_end then
		local special_mahj_diff = goods_id - 1107
		mah_jong_chg(special_mahj_diff)
	--�����影��
	elseif goods_id == mahj_prize_5th[1] then
		Say("<color=green>Nh�c nh�<color>: B�n x�c nh�n mu�n s� d�ng <color=yellow>�� Hi�p Ng� Th��ng Bao<color>!\n"..mahj_prize_5th[2],
		2,
		"��i/mah_jong_przie_5",
		"�� ta suy ngh� l�i/end_dialog"
		)
	end
end
--**************************�����齫��ȡ����************************
function single_mahj_pri(goods_id)
	if GetTask(TASK_MJ_SINGLE_PRIZE) >= 1000 then--��ȡ��������
		Msg2Player("S� l�n ��i t�m M�t ch��c l�y ph�n th��ng t�i �a l� 1000 l�n! B�n �� nh�n h�n 1000 l�n!")
		return
	end
	if DelItem(2,0,goods_id,1) == 1 then
		SetTask(TASK_MJ_SINGLE_PRIZE,GetTask(TASK_MJ_SINGLE_PRIZE) + 1)
		if GetLevel() ~= 99 then
			local nexp = GetLevel()*GetLevel()*10
			ModifyExp(nexp)
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nexp.." �i�m kinh nghi�m!")
			local nLingShi = random(1,5)--20%���ʻ����ʯ
			if nLingShi == 1 then
				laborday08_baoshi_prob("S� d�ng 1 t�m M�t ch��c")
			end
		else
			laborday08_baoshi_prob("S� d�ng 1 t�m M�t ch��c")
		end
		Msg2Player("B�n c� th� nh�n ph�n th��ng m�t t�m M�t ch��c"..1000 - GetTask(TASK_MJ_SINGLE_PRIZE).."l�n n�a th�i nh�!")
	else
		WriteLog("Ho�t ��ng 1-5: Ng��i ch�i"..GetName().."X�a t�m M�t ch��c th�t b�i.")
	end
end
--***************************�齫�����齫********************************
function mah_jong_bag_chg(bag_diff)
	if GetItemCount(2,0,mah_jong_bag[bag_diff][1]) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c�: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
		return
	end
	if DelItem(2,0,mah_jong_bag[bag_diff][1],1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c�: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
		return
	else
		for j = 1,mah_jong_bag[bag_diff][2] do
			add_mahjong_prob(1000)
			--ͨ���齫���� �������Ϊ�����ʡ���λ��ǧ�ֱȡ����紫��50 ��ʾ5%���
		end
	end
end
--**************************�����齫��ȡ�Ի�*****************************
function mah_jong_chg(mah_jong_diff)
	local mah_jong_id = {{start_seq[1][1],9,1},{start_seq[2][1],9,10},{start_seq[3][1],9,19},{start_seq[4][1],7,28}}
	local mah_jong_chg_dia = {}
	for i = 1, mah_jong_id[mah_jong_diff][2] do
		mah_jong_chg_dia[i]="Ta c�n ��i ("..mah_jong[(mah_jong_id[mah_jong_diff][3]-1)+i]..")/#mah_jong_add("..(mah_jong_id[mah_jong_diff][1] - 1 + i)..","..mah_jong_diff..")"
	end
	mah_jong_chg_dia[mah_jong_id[mah_jong_diff][2] + 1] = "�� ta suy ngh� l�i/end_dialog"
	Say("B�n h�y ch�n qu�n b�i mu�n ��i l�y.",
		getn(mah_jong_chg_dia),
		mah_jong_chg_dia
	)	
end
--***************************�����齫��ȡ****************************
function mah_jong_add(goods_id,color_diff)
	local special_mahj_ID = (1107 + color_diff)
	if GetItemCount(2,1,special_mahj_ID) == 0 then
		Talk(1,"end_dialog","B�n h�y x�c nh�n trong h�nh trang c� <color=yellow>Qu�n b�i ��c bi�t<color>!")
		return
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then			--�����ж�
			return
		end
		if DelItem(2,1,special_mahj_ID,1) ~= 1 then	--ɾ�������齫�ɹ��ж�
			Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c� <color=yellow>1 qu�n b�i M�t ch��c<color>!")
			return
		else
			local add_flag = AddItem(2,0,goods_id,1)
			if add_flag == 1 then
				Msg2Player("Ch�c m�ng b�n ��i ���c 1 qu�n b�i ��c bi�t"..mah_jong[goods_id - start_seq[1][1] +1].."!")
			else
				WriteLog ("Ng��i ch�i:"..GetName().."D�ng con b�i ��c bi�t ��i"..mah_jong[goods_id - start_seq[1][1] +1].."Th�t b�i!")
			end
		end
	end
end
--*************************�齫��������ȡ����************************
function mah_jong_prize(prize_diff)
	--��Ʒ�ж�
	if GetItemCount(2,0,Tb_mah_jong_bag_prize[prize_diff][2]) == 0 then	
		Talk(1,"","<color=green>Nh�c nh�<color>: Xin x�c nh�n trong h�nh trang c�<color=yellow>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>!")
		return
	end
	--���غͿռ��ж�
	if Zgc_pub_goods_add_chk(Tb_mah_jong_bag_prize[prize_diff][3],Tb_mah_jong_bag_prize[prize_diff][4]) ~= 1 then
		return
	end
	--ɾ����Ʒ�ɹ��ж�
	if DelItem(2,0,Tb_mah_jong_bag_prize[prize_diff][2],1) ~= 1 then
		Talk(1,"","<color=green>Nh�c nh�<color>: Xin x�c nh�n trong h�nh trang c�<color=yellow>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>!")
		return	
	end
	--��������
	ModifyReputation(random(Tb_mah_jong_bag_prize[prize_diff][5],Tb_mah_jong_bag_prize[prize_diff][6]),0)
	--�����׵�װ
	local palyer_bady = GetBody()
	if random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][11] then
		local yandi_att_cap = {
			{0,103,8001},
			{0,103,8002},
			{0,103,8003},
			{0,103,8004},
		}
		local add_flag = AddItem(yandi_att_cap[palyer_bady][1],yandi_att_cap[palyer_bady][2],yandi_att_cap[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c Vi�m �� Kh�i!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c Vi�m �� Kh�i!")
			WriteLog("Ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c Vi�m �� Kh�i!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng th�m Vi�m �� Kh�i th�t b�i, k� hi�u:"..add_flag)
		end
	elseif random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][12] then
		local yandi_att_cloth = {
			{0,100,8001},
			{0,100,8002},
			{0,100,8003},
			{0,100,8004},		
		}
		local add_flag = AddItem(yandi_att_cloth[palyer_bady][1],yandi_att_cloth[palyer_bady][2],yandi_att_cloth[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c Vi�m �� Gi�p!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c Vi�m �� Gi�p!")
			WriteLog("Ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c Vi�m �� Gi�p!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng th�m Vi�m �� Gi�p th�t b�i, k� hi�u:"..add_flag)
		end
	elseif random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][13] and GetTask(mah_jong_prize_shoe) ~= 1 then
		local yandi_att_shoe = {
			{0,101,8001},
			{0,101,8002},
			{0,101,8003},
			{0,101,8004},
		}
		local add_flag = AddItem(yandi_att_shoe[palyer_bady][1],yandi_att_shoe[palyer_bady][2],yandi_att_shoe[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			SetTask(mah_jong_prize_shoe,1)
			Msg2Player("Ch�c m�ng b�n nh�n ���c Vi�m �� Trang!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c Vi�m �� Trang!")
			WriteLog("Ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c Vi�m �� Trang!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng th�m Vi�m �� Trang th�t b�i, k� hi�u:"..add_flag)
		end
	end
	--��ʦ����
	AddItem(2,0,397,Tb_mah_jong_bag_prize[prize_diff][7])
	--ũɣ��Ҫ
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][10] then
		local add_flag = AddItem(2,1,1056,1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c N�ng Tang ph�!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c N�ng Tang ph�!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng th�m N�ng Tang ph� th�t b�i, k� hi�u:"..add_flag)
		end	
	end
	--ʦ��������Ƭ
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][14] then
		local add_ran_num = random(1,Tb_mah_jong_bag_prize[prize_diff][15])
		local add_flag = AddItem(2,1,1086,add_ran_num)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..add_ran_num.." B�n v� ��c t�o th�n kh�!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c "..add_ran_num.." B�n v� ��c t�o th�n kh�!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng"..add_ran_num.." B�n v� ��c t�o th�n kh�  th�t b�i, k� hi�u:"..add_flag)
		end
	end
	--�������
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][16] then
		local add_flag = AddItem(2,1,1050,1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c G�i Thi�n Th�ch!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c g�i Thi�n Th�ch!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng G�i Thi�n Th�ch th�t b�i, k� hi�u:"..add_flag)
		end
	end
	--�ܲ����
	AddItem(2,1,Tb_mah_jong_bag_prize[prize_diff][17],Tb_mah_jong_bag_prize[prize_diff][18])
	--�����̻�
	if Tb_mah_jong_bag_prize[prize_diff][19] ~= 0 then
		AddItem(2,1,203,Tb_mah_jong_bag_prize[prize_diff][19])
	end
	--������
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][20] then
		local add_flag = AddItem(2,0,606,1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c R��ng s�t Nguy�t L��ng Th�!")
			Msg2SubWorld("Ch�c m�ng ng��i ch�i:"..GetName().."s� d�ng"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh�n ���c R��ng s�t Nguy�t L��ng Th�!")
		else
			WriteLog("Ho�t ��ng 1/5: Ng��i ch�i "..GetName().."T�ng th�m R��ng s�t Nguy�t L��ng Th� th�t b�i, k� hi�u:"..add_flag)
		end
	end
	--����76��δ��������
	mah_jong_bag_prize_weapon(Tb_mah_jong_bag_prize[prize_diff][8])
end
--**********************δ�������������**************************
function mah_jong_bag_prize_weapon(num)
	for i = 1,num do
		local weapon_id =random(375,(375+11))
		local add_flag = AddItem(2,1,weapon_id,1)
		if add_flag ~= 1 then
			WriteLog("Ho�t ��ng 1/5/2007: Ng��i ch�i:"..GetName().."t�ng v� kh� ["..weapon_id.."] th�t b�i, v� tr� th�t b�i:"..add_flag)
		end
	end
	Msg2Player("Ch�c m�ng b�n nh�n ���c "..num.."V� kh� ch�a k�ch ho�t")
	return
end
--************************�����影������******************************
function mah_jong_przie_5()
	--��ƷЯ�����
	if GetItemCount(2,1,1112) == 0 then
		Talk(1,"","<color=green>Nh�c nh�<color>: H�y x�c nh�n b�n c� mang theo <color=yellow>�� Hi�p ng� th��ng bao<color>!")
		return
	end
	--�������ؿռ���
	if Zgc_pub_goods_add_chk(5,100) ~= 1 then
		return
	end
	--��Ʒɾ�����
	if DelItem(2,1,1112,1) ~= 1 then
		Talk(1,"","<color=green>Nh�c nh�<color>: H�y x�c nh�n b�n c� mang theo <color=yellow>�� Hi�p ng� th��ng bao<color>!")
		return
	end
--��������
	--���ӽ��
	Earn(200000)
	--�����ܲ�С���
	if random(1,100) <= 50 then
		if AddItem(2,1,1094,1) == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c H�p qu� c� c�i nh�!")
		end
	end
	--���Ӵ�ʦ����
	if random(1,100) <= 5 then
		if AddItem(2,0,397,1) == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c ��i t��ng s� th� th�")
		end
	end
	--���Ӵ����������Ƭ������
	if random(1,100) == 1 then
		if AddItem(2,1,1049,1) == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c G�i m�nh Thi�n Th�ch!")
			Msg2SubWorld("Ng��i ch�i:"..GetName().."d��i ��y l� danh s�ch h� b�i, b�n mu�n bi�t ph��ng ph�p h� b�i n�o?")
		end	
	elseif random(1,1000) <= 5 then
		if AddItem(2,1,1001,1) == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���cH�a Th� B�ch!")
			Msg2SubWorld("Ng��i ch�i:"..GetName().."S� d�ng �� Hi�p ng� th��ng bao nh�n ���c 1 H�a Th� B�ch!")
		end		
	end
	--���Ӳؽ�װ��
	if random(1,1000) <= 1 then
		if AddItem(2,1,random(1059,1063),1) == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���cT�i trang b� T�ng Ki�m!")
			Msg2SubWorld("Ng��i ch�i:"..GetName().."S� d�ng �� Hi�p ng� th��ng bao nh�n ���c 1 t�i trang b� T�ng Ki�m!")
		end
	end
end
