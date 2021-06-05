--2007�괺�ڻ-�齫�ռ��-��Ʒʹ�ú���
--���뿪���ˣ��Թ�
--���뿪��ʱ�䣺2007-01-24
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--==========================����������������=============================
	--Ͳ��ʼIDΪ��590
	circle_start_id = 630
	--����ʼIDΪ��599
	bamboo_start_id = 639
	--����ʼIDΪ��608
	ten_kilo_start_id = 648
	--����ʼIDΪ��617
	char_start_id = 657
	--�����齫ID��624
	special_mah_jong_id = 664
	--�齫��
	mah_jong_bag = {{665,8,"T�i M�c Ch��c (ti�u)"},{666,14,"T�i M�c Ch��c (��i)"}} --ID������
	--�齫�������
	mah_jong_prize_bag = {{667,200,"Con b�i �em c��c"},{668,200,"Con b�i 2 �em c��c"},{669,200,"Con b�i 3 �em c��c"},{670,200,"Con b�i 4 �em c��c"}}
	--�����齫��ʼ��
	mah_jong = {
			"Nh�t ��ng","Nh� ��ng","Tam ��ng","T� ��ng","Ng� ��ng","L�c ��ng","Th�t ��ng","B�t ��ng","C�u ��ng",
			"M�t","Nh� �i�u","Ba","B�n","Ng� �i�u","L�c �i�u","Th�t �i�u","B�t �i�u","C�u �i�u",
			"Nh�t v�n","Nh� v�n","Tam v�n","T� v�n","Ng� v�n","L�c v�n","Th�t v�n","B�t v�n","C�u v�n",
			"��ng phong","Nam phong","T�y phong","B�c phong","H�ng trung","ph�t t�i","B�ch ban"}
	--�齫�ͷ�����
--==============================���߼�����===============================
function OnUse(goods_index)
	if Zgc_pub_action_level_chk() == 0 then
		return
	end
	if spring_2007_date_chk() ~= 1 then
		Talk(1,"end_dialog","V�t ph�m n�y ch� c� th� s� d�ng v�o ho�t ��ng n�m m�i!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--�����齫��ȡ����
	if goods_id >= circle_start_id and goods_id <= (circle_start_id + 33) then
		Say("Ng��i c� mu�n ��i ph�n th��ng kh�ng?",
		2,
		"Ta mu�n ��i ph�n th��ng/#single_mahj_pri("..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog"
		)
		return
	--�齫���һ�����
	elseif goods_id == mah_jong_bag[1][1] or goods_id == mah_jong_bag[2][1] then
		local bag_diff = (goods_id + 1) - mah_jong_bag[1][1]
		Say("B�n mu�n s� d�ng: <color=green>".. mah_jong_bag[bag_diff][3].."<color> ��i <color=green>".. mah_jong_bag[bag_diff][2].."<color> M�c ch��c �?",
		2,
		"��i/#mah_jong_bag_chg("..bag_diff..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id >= mah_jong_prize_bag[1][1] and goods_id <= mah_jong_prize_bag[4][1] then  	--�齫��������ȡ����
		local prize_diff = (goods_id + 1) - mah_jong_prize_bag[1][1]
		Say("B�n x�c nh�n d�ng: <color=green>"..mah_jong_prize_bag[prize_diff][3].."<color> ��i ph�n th��ng �?",
			2,
			"Ta c�n ��i ph�n th��ng/#mah_jong_prize("..goods_id..")",
			"�� ta suy ngh� l�i/end_dialog"
		)
	elseif goods_id == special_mah_jong_id then
		Say("B�n c�n ��i l� b�i n�o?",
			5,
			"Ta mu�n ��i th�nh (��ng)/#mah_jong_chg(1)",
			"Ta mu�n ��i th�nh (�i�u)/#mah_jong_chg(2)",
			"Ta mu�n ��i th�nh (V�n)/#mah_jong_chg(3)",
			"Ta mu�n ��i th�nh (Ch�)/#mah_jong_chg(4)",
			"�� ta suy ngh� l�i/end_dialog"
		)
	end
	
end
--**************************�����齫��ȡ����************************
function single_mahj_pri(goods_id)
	local chg_num_remain = spring_2007_mahj_num_chk(3)
	if chg_num_remain == -1 then
		return
	end
	local mah_jong_diff = goods_id - circle_start_id + 1
	if GetItemCount(2,0,goods_id) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n trong t�i h�nh lang c�a b�n c� <color=green>"..mah_jong[mah_jong_diff].."<color>T�m b�i n�y!")
		return
	end
	if DelItem(2,0,goods_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n trong t�i h�nh lang c�a b�n c� <color=green>"..mah_jong[mah_jong_diff].."<color>T�m b�i n�y!")
		return
	else
		local num = GetLevel()
		num = (num * num) * 12
		ModifyExp(num)
		SetTask(997,(GetTask(997)+1))
		Msg2Player("Xin ch�c m�ng"..mah_jong[mah_jong_diff].."��i "..num.." �i�m kinh nghi�m!")
		if chg_num_remain == 1 then
			Talk(1,"","<color=green>Nh�c nh�<color>: H�m nay ��y l� <color=red>l�n cu�i c�ng<color> b�n c� th� ��i ph�n th��ng")
			return
		else
			Talk(1,"","<color=green>Nh�c nh�<color>: B�n c� th� s� d�ng t�m b�i n�y �� ��i ph�n th��ng<color=green>"..(chg_num_remain-1).."<color> l�n!")
			return
		end
	end
end
--***************************�齫�����齫********************************
function mah_jong_bag_chg(bag_diff)
	if Zgc_pub_goods_add_chk(mah_jong_bag[bag_diff][2],mah_jong_bag[bag_diff][2]) ~= 1 then
		return
	else
		if GetItemCount(2,0,mah_jong_bag[bag_diff][1]) == 0 then
			Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c�: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
			return
		end
		if DelItem(2,0,mah_jong_bag[bag_diff][1],1) ~= 1 then
			Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c�: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
			return
		else
			local fail_num = 0
			for j = 1,mah_jong_bag[bag_diff][2] do
				local add_flag = AddItem(2,0,random(circle_start_id,(char_start_id+6)),1)
				if add_flag ~= 1 then
					fail_num = fail_num + 1
				end
			end
			if fail_num ~= 0 then
				WriteLog ("Ng��i ch�i:"..GetName().."��i con b�i th�t b�i"..fail_num.." con b�i n�y!")
			end
		end
	end
end
--**************************�����齫��ȡ�Ի�*****************************
function mah_jong_chg(mah_jong_diff)
	local mah_jong_id = {{circle_start_id,9,1},{bamboo_start_id,9,10},{ten_kilo_start_id,9,19},{char_start_id,7,28}}
	local mah_jong_chg_dia = {}
	for i = 1, mah_jong_id[mah_jong_diff][2] do
		mah_jong_chg_dia[i]="Ta c�n ��i ("..mah_jong[(mah_jong_id[mah_jong_diff][3]-1)+i]..")/#mah_jong_add("..(mah_jong_id[mah_jong_diff][1] - 1 + i)..")"
	end
	mah_jong_chg_dia[mah_jong_id[mah_jong_diff][2] + 1] = "�� ta suy ngh� l�i/end_dialog"
	Say("Xin ch�n con b�i c�n ��i.",
		getn(mah_jong_chg_dia),
		mah_jong_chg_dia
	)	
end
--***************************�����齫��ȡ****************************
function mah_jong_add(goods_id)
	if GetItemCount(2,0,special_mah_jong_id) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c� con b�i ��c bi�t!")
		return
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then			--�����ж�
			return
		end
		if DelItem(2,0,special_mah_jong_id,1) ~= 1 then	--ɾ�������齫�ɹ��ж�
			Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c� con b�i ��c bi�t!")
			return
		else
			local add_flag = AddItem(2,0,goods_id,1)
			if add_flag == 1 then
				Msg2Player("B�n d�ng con b�i ��c bi�t ��i m�t t�m"..mah_jong[goods_id - circle_start_id +1].."!")
			else
				WriteLog ("Ng��i ch�i:"..GetName().."D�ng con b�i ��c bi�t ��i"..mah_jong[goods_id - circle_start_id +1].."Th�t b�i!")
			end
		end
	end
end
--*************************�齫��������ȡ����************************
function mah_jong_prize(goods_id)
	local big_prize_diff = goods_id - mah_jong_prize_bag[1][1] + 1
	local bag_prize_inf = {
   --����ٷֱ�--��Ǯ----��������-����-----��������-����--����Ҫ��--�ռ�Ҫ��
		{3,	700000,300,	500,	4,	6,	500,	8},
		{2,	600000,100,	200,	4,	6,	500,	8},
		{1,	500000,50,	100,	1,	3,	300,	5},
		{1,1,1,1,1,1,50,5}
	}
	local weapon_nokaifeng_id = 375
	--��Ʒ�ж�
	if GetItemCount(2,0,goods_id) == 0 then	
		Talk(1,"","Xin x�c nh�n trong h�nh trang c�a b�n c�"..mah_jong_prize_bag[big_prize_diff][3].."!")
		return
	end
	--���غͿռ��ж�
	if Zgc_pub_goods_add_chk(bag_prize_inf[big_prize_diff][8],bag_prize_inf[big_prize_diff][7]) ~= 1 then
		return
	end
	--ɾ����Ʒ�ɹ��ж�
	if DelItem(2,0,goods_id,1) ~= 1 then
		Talk(1,"","Xin x�c nh�n trong h�nh trang c�a b�n c�"..mah_jong_prize_bag[big_prize_diff][3].."!")
		return	
	end
	--������ӣ�������Ḻ�ء�������Ʒ��
	if big_prize_diff <= 3 then
		--�Ӿ���
		local add_num = floor(Zgc_pub_player_uplevel_num_rtn(1) * bag_prize_inf[big_prize_diff][1] /100)
		ModifyExp(add_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..add_num.." �i�m kinh nghi�m!")
		--��Ǯ
		Earn(bag_prize_inf[big_prize_diff][2])
		--������
		add_num = random(bag_prize_inf[big_prize_diff][3],bag_prize_inf[big_prize_diff][4])
		ModifyReputation(add_num,0)
		--������װ��
		add_num = random(1,100)
		if big_prize_diff == 1 then
			--һ����
			if add_num <= 5 then				--��֮��
				 local add_flag = AddItem(10,2,44,1)
				 if add_flag == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c Th�i X�n Tinh!")
					Msg2SubWorld("Ng��i ch�i:"..GetName().."D�ng Con b�i 1�em c��c nh�n ���c Th�i X�n Tinh!")
				 else
					WriteLog("Ho�t ��ng thu th�p con b�i: Ng��i ch�i:"..GetName().."T�ng [Th�i X�n Tinh] th�t b�i, v� tr� th�t b�i:"..add_flag)
				 end
			elseif add_num <= 10 then		--�����ؼ�
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c ng� h�nh m�t t�ch!")
					Msg2SubWorld("Ng��i ch�i:"..GetName().."D�ng Con b�i 1 �em c��c nh�n ���c M�t t�ch ng� h�nh!")
				else
					WriteLog("Ho�t ��ng thu th�p con b�i: Ng��i ch�i:"..GetName().."T�ng [M�t t�ch ng� h�nh] th�t b�i, t�a �� th�t b�i:"..add_flag)
				end
			elseif add_num <= 15 then		--���ʦ���ؼ�
				mah_jong_bag_prize_book()
			end
		elseif big_prize_diff == 2 then	--������
			if add_num <= 5 then
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Ch�c m�ng b�n nh�n ���c ng� h�nh m�t t�ch!")
					Msg2SubWorld("Ng��i ch�i:"..GetName().."D�ng Con b�i 2 �em c��c ��i ���c M�t t�ch ng� h�nh!")
				else
					WriteLog("Ho�t ��ng thu th�p con b�i: Ng��i ch�i:"..GetName().."T�ng [M�t t�ch ng� h�nh] th�t b�i, t�a �� th�t b�i:"..add_flag)
				end
			elseif add_num <= 13 then
				mah_jong_bag_prize_book(big_prize_diff)
			end
		elseif big_prize_diff == 3 then	--3����
			if add_num <= 10 then
				mah_jong_bag_prize_book(big_prize_diff)
			end
		end
		--δ������������
		local weapon_num = random(bag_prize_inf[big_prize_diff][5],bag_prize_inf[big_prize_diff][6])
		mah_jong_bag_prize_weapon(weapon_num)
	else
		--�Ӿ���
		local add_num = floor(Zgc_pub_player_uplevel_num_rtn(1)/100)
		ModifyExp(add_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..add_num.." �i�m kinh nghi�m!")
		--��Ǯ
		Earn(200000)
		--�Ӳ���
		for i = 66,69 do
			add_num = random(5,10)
			AddItem(2,2,i,add_num)
		end
		--������
		add_num = random(20,50)
		ModifyReputation(add_num,0)
	end
	spring2007_spring_goods_add()
end
--**********************ʦ���ؼ�����**************************
function mah_jong_bag_prize_book(prize_diff)
	local book_name = {"Kim Cang Ph�c Ma kinh","Ti�m Long M�t t�ch","V� Tr�n M�t t�ch","Thi�n La M�t T�ch","Nh� � M�t T�ch","B�ch H�i Ph�","H�n ��n M�t t�ch",
						"Qu� Thi�n M�t t�ch","Huy�n �nh M�t t�ch","Qu�n T� M�t t�ch","Tr�n Qu�n M�t t�ch","Xuy�n V�n M�t t�ch","U Minh Qu� L�c","Linh C� M�t t�ch"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..book_name[book_seq].."!")
		Msg2SubWorld("Ng��i ch�i:"..GetName().."S� d�ng b�i c��c"..mah_jong_prize_bag[prize_diff][3].."Nh�n ���c "..book_name[book_seq].."!")
	else
		WriteLog("Ho�t ��ng thu th�p con b�i: Ng��i ch�i:"..GetName().."T�ng"..book_name[book_seq].." th�t b�i, k� hi�u:"..add_flag)
	end
	return
end
--**********************δ�������������**************************
function mah_jong_bag_prize_weapon(num)
	for i = 1,num do
		local weapon_id =random(375,(375+11))
		local add_flag = AddItem(2,1,weapon_id,1)
		if add_flag ~= 1 then
			WriteLog("Ho�t ��ng thu th�p con b�i: Ng��i ch�i:"..GetName().."t�ng v� kh� ["..weapon_id.."] th�t b�i, v� tr� th�t b�i:"..add_flag)
		end
	end
	Msg2Player("Ch�c m�ng b�n nh�n ���c "..num.."V� kh� ch�a k�ch ho�t")
	return
end
