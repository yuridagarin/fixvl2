--filename:Ȫ�ݸ���.lua
--create date:2006-01-12
--author:yanjun
--describe:Ȫ�ݸ���ű�

--�޸ģ�1���峤20070123�޸ı��ű������ӻ�ɽ�����������

Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--==========================����������������=============================
	--Ͳ��ʼIDΪ��590
	circle_start_id = 613
	--����ʼIDΪ��599
	bamboo_start_id = 622
	--����ʼIDΪ��608
	ten_kilo_start_id = 631
	--����ʼIDΪ��617
	char_start_id = 647
	--�����齫��ʼ��
	mah_jong = {
		"Nh�t ��ng","Nh� ��ng","Tam ��ng","T� ��ng","Ng� ��ng","L�c ��ng","Th�t ��ng","B�t ��ng","C�u ��ng",
		"M�t","Nh� �i�u","Ba","B�n","Ng� �i�u","L�c �i�u","Th�t �i�u","B�t �i�u","C�u �i�u",
		"Nh�t v�n","Nh� v�n","Tam v�n","T� v�n","Ng� v�n","L�c v�n","Th�t v�n","B�t v�n","C�u v�n",
		"��ng phong","Nam phong","T�y phong","B�c phong","H�ng trung","ph�t t�i","B�ch ban"
	}
	mah_jong_prize_bag = {{650,"Con b�i �em c��c"},{651,"Con b�i 2 �em c��c"},{652,"Con b�i 3 �em c��c"},{653,"Con b�i 4 �em c��c"}} --�� 630
	--�齫�ͷ�����
	mah_jong_suc_way = {
		--��������-------------------����---------��麯��-------------------------------�����ȼ�--------����
		{"��i T� H�",		14,	"big_4_hap_chk()",			1,	"��i T� H� v� quy t�c b�i: <color=red>��ng, Nam, B�c<color> t�t c� <color=red>3<color> t�m, ngo�i ra <color=red>b�i Nh� �<color> 1 c�p, t�ng c�ng 14 t�m."},	--�ĸ����Ŷ���������+����һ��
		{"T� Kh�c T�",		14,	"four_hide_4_chk()",		2,	"Quy t�c c�a T� kh�c v� H�a b�i: 4 ph� 4 t�m l� 1 c�p, t�t c� l� 14 t�m."},			--�ĸ�����+����һ��
		{"C�u Li�n B�o ��ng",	14,	"from_1_to_9_chk()",		1,	"Quy t�c C�u li�n b�o ��ng: ��ng hoa ��ng s�c 3 t�m l� 1, nh� tam t� ng� l�c th�t b�t ��ng hoa s�c l� 1, t�ng c�ng 14 t�m"},	--ͬɫ1112345678999+����һ��ͬɫ
		{"Th�p Tham Y�u",		14,	"thrteen_1_or_9()",			1,	"Quy t�c Th�p tam y�u: M�i s�c hoa (��ng t�, �i�u t�, V�n t�) 1 v� 9. 7 ch� tr�n t�m b�i (��ng phong, Nam phong, T�y phong, B�c phong, H�ng trung, Ph�t t�i, B�ch b�n) t�ng c�ng 14 t�m."},		--���л�ɫ���۾�+���������з���
		{"Li�n Th�t ��i",		14,	"connect_7_double()",		2,	"Quy t�c Li�n Th�t ��i: D�a theo s� th� t� 7 c�p li�n ti�p c�a nh�ng t�m ��ng hoa s�c. T�ng c�ng c� 14 t�m."},	--ͬɫ���������߶�
		{"Thanh Th�t ��i",		14,	"sam_color_7_double()",		3,	"Quy t�c thanh long ��i: 7 c�p c�a nh�ng t�m ��ng hoa s�c, t�ng c�ng 14 t�m"},
		{"Th�t Tinh B�t Kh�o",	14,	"seven_star()",				3,	"Quy t�c Th�t tinh b�t kh�o: Chon t�t c� 14 t�m trong �� nh�t ��nh ph�i c� 7 t�m trong ��ng, T�y, Nam, B�c th�m 3 t�m hoa s�c v� ch�n nh�ng t�m trong tr�ng c�c s� 147, 258, 369�"},
		{"Th�i b�t ��o",		14,	"cannot_push()",			2, 	"Quy t�c Th�i B�t ��o D�a theo c�c h�nh v� tr�n t�m b�i kh�c nhau �� x�p th�nh 1 nh�m g�m: 123456789 b�nh, 245689 �i�u, b�ch �i�u. T�ng c�ng 14 t�m."},
		{"��i Tam Nguy�n",		14,	"big_3_yuan()",				3,	"Quy t�c ��i Tam Nguy�n (<color=red>quy t�c b�t ch�nh<color>): Ch�n 14 t�m trong c�c lo�i H�ng trung, Ph�t t�i, B�ch b�n, c�n l�i <color=red>t�y �<color>."},
		{"Thanh Y�u C�u",		14,	"all_1_or_9()",				3,	"Quy t�c Thanh Y�u C�u: (<color=red>Quy t�c b�t ch�nh<color>: ch�n 14 t�m trong t�t c� c�c lo�i."},
		{"Nh�t S�c T� ��ng Thu�n",	14,	"one_color_four_seq()",		2,	"Quy t�c Nh�t S�c T� ��ng Thu�n (<color=red>Quy t�c b�t ch�nh<color>): Ch�n 14 t�m theo c�c s� th� t� (nh�: 1 v�n, 2 v�n, 3 v�n), c�n l�i ch�n <color=red>c�ng s�c t�y �<color>"},
		{"Nh�t S�c T� Ti�t Cao",	14,	"one_color_four_cont()",	2,	"Quy t�c ��ng S�c T� Ti�t Cao (<color=red>quy t�c b�t ch�nh<color>): Ch�n 14 t�m theo c�c s� th� t� t�ng d�n (1 v�n, 2 v�n, 3 v�n, 4 v�n ) v� 2 t�m <color=red>��ng s�c t�y �<color>."},
		{"T� Nh�t S�c",		14,	"all_char()",				3,	"Quy t�c Ch� Nh�t S�c (<color=red>Quy t�c b�t ch�nh<color>): ch�n t�t c� 14 t�m <color=red>t�y �<color> trong c�c ch� (��ng phong, T�y phong, Nam phong, B�c phong, H�ng Trung, Ph�t t�i, B�ch b�n)"},
		{"Thanh Nh�t S�c",		14,	"all_sam_color()",			4,	"Quy t�c Thanh Nh�t S�c (<color=red>quy t�c b�t ch�nh<color>): Ch�n t�y � 14 t�m trong nh�ng t�m <color=red>��ng s�c<color>, (��ng t�, �i�u t�, V�n t�)."},
		{"To�n ��i",		14,	"all_big()",				4,	"Quy t�c To�n ��i (<color=red>quy t�c b�t ch�nh<color>: Ch�n 14 t�m t�y � trong c�c t�m <color=red>hoa s�c<color> ho�c trong t� h�p s� th� t� <color=red>7, 8, 9<color>"},
		{"To�n trung",		14,	"all_normal()",				4,	"Quy t�c to�n trung (<color=red>quy t�c b�t ch�nh<color>): Ch�n 14 t�m t�y � trong c�c t�m <color=red>hoa s�c<color> ho�c trong t� h�p s� th� t� <color=red>4, 5, 6<color>"},
		{"To�n ti�u",		14,	"all_small()",				4,	"Quy t�c to�n ti�u (<color=red>quy t�c b�t ch�nh<color>): Ch�n 14 t�m t�y � trong c�c t�m <color=red>hoa s�c<color> c�n l�i trong t� h�p s� th� t� <color=red>1, 2, 3<color>."},
		{"Thanh Long",		14,	"sam_color_dragon()",		3,	"Quy t�c Thanh Long (<color=red>quy t�c b�t ch�nh<color>): ch�n 14 t�m b�i c� s� th� t� ��ng nh�t s�c t� 1-9, c�n l�i ch�n <color=red>hoa s�c t�y �<color>."},
		{"Tam Kh�c T�",		14,	"three_hide_num_3()",		4,	"Quy t�c Tam Kh�c T� (<color=red>quy t�c b�t ch�nh<color>): C� th� ch�n 14 t�m trong nh�ng c�p t��ng ��ng c�n l�i l� <color=red>hoa s�c t�y �<color>."},
		{"Th� H�",		14, "just_14()",				5,	"Quy t�c T� H� (<color=red>quy t�c b�t ch�nh<color>): C� th� ch�n 14 t�m <color=red>t�y �<color>."},
	}
--==============================���߼�����===============================
function main(npc_index)
	SetTaskTemp(164,npc_index)				--д�븣�������
	--���ϵȼ��ж�
	if spring_2007_date_chk() == 1 then
		local selTab = {
					"Ta mu�n nh�n h�p qu� n�m m�i./get_present",
					"�i�u ki�n nh�n h�p qu� n�m m�i./know_detail",
					"Ta ph�i ��n Hoa S�n tham gia l� H�i Hoa S�n./goto_huashan",
					"Ta mu�n t�m hi�u ho�t ��ng Hoa S�n C�nh K�/huashan_fight_inf",
					"Ta mu�n giao nh�ng t�m m�c ch��c thu ���c/mah_jong_collect_dia",
					"Ta mu�n t�m hi�u ho�t ��ng thu th�p m�c ch��c/mah_jong_collect_inf",
					"�a t� Ph�c Th�n!/nothing"
					}
		Say("Nh�n d�p n�m m�i ta c� ch�t qu� t�ng m�i ng��i, ch�c m�i ng��i n�m m�i vui v�!",getn(selTab),selTab)
	else
		Say("Xu�n �� v�, m�i ng��i h�n hoan ch�o ��n, kh�p m�i n�i th�t l� nh�n nh�p!",0)
	end
end

function get_present()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060120 then 	--���ڻ��û��ʼ���������Ǵ�������-_-b
		Say("H�y an t�m, m�i ng��i ��u c� qu�!",0)
		return 0		
	end
	if nDate > 20060205 then	--���ڻ��������û���﷢��������Ҫ�ؼҿ�
		Say("T�t �� qua, h�p qu� n�m m�i �� b� ng��i ch�i l�y h�t r�i. Th�t �y n�y, n�m sau ta nh�t ��nh mang nhi�u qu� h�n!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Ng��i ch�a ��t ��n c�p 10, kh�ng th� nh�n h�p qu� n�m m�i!",0)
		return 0
	end
	if GetTask(TASK_GOT_PRESENT) ~= GetCurDate() then	--�µ�һ�죬����ȡ��������0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if GetTask(TASK_GOT_PRESENT) ~= 0 then	--��������Ѿ���ȡ����������
		Say("H�m nay ng��i �� nh�n qu�, ng�y mai quay l�i nh�!",0)
		return 0
	end
	local nHour = GetLocalTime()
	if GetGlbValue(GLB_PRESENT_NUM_QZ) == 0 then	--���﷢����
		local strSex = ""
		if GetSex() == 1 then
			strSex = "Thi�u hi�p"
		elseif GetSex() == 2 then
			strSex = "C� n��ng"
		else
			strSex = "Thi�u hi�p/N� hi�p"
		end
		Say("H�p qu� n�m m�i �� b� l�y h�t r�i,"..strSex.."��i l�n sau nh�!",0)
		return 0
	end
	if AddItem(2,1,213,1) == 1 then
		WriteLog("[Ho�t ��ng m�a xu�n Ph�c Th�n]:"..GetName().."Nh�n ���c 1 h�p qu� n�m m�i t� Ph�c Th�n � Tuy�n Ch�u")
		SetTask(TASK_GOT_PRESENT,GetCurDate())
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 h�p qu� n�m m�i!")
		local present_left = GetGlbValue(GLB_PRESENT_NUM_QZ) - 1
		if present_left < 0 then
			SetGlbValue(GLB_PRESENT_NUM_QZ,0)
		end
		SetGlbValue(GLB_PRESENT_NUM_QZ,present_left)
		if present_left == 0 then	--û������ʣ���ˣ��췢������Ĺ����
			AddGlobalNews("H�p qu� n�m m�i � Tuy�n Ch�u �� b� l�y h�t, ng��i ch�i n�o h�m nay ch�a nh�n ���c qu�, h�y ��i c� h�i l�n sau.")
			Msg2SubWorld("H�p qu� n�m m�i � Tuy�n Ch�u �� b� l�y h�t, ng��i ch�i n�o h�m nay ch�a nh�n ���c qu�, h�y ��i c� h�i l�n sau.")
			return 1
		end
		if mod(present_left,10) == 0 then	--ֻ����10��
			Msg2SubWorld("Tuy�n Ch�u v�n c�n"..present_left.." ph�n qu� n�m m�i ��i ng��i ch�i ��n nh�n")
		end
	end
end

function know_detail()
	Say("T� 20/01 ��n 05/02, ch� c�n ng��i ch�i t� c�p 10 tr� l�n, m�i ng�y theo gi� quy ��nh ��n ch� ta nh�n h�p qu� n�m m�i.",0)
end
--==========================��ɽ�������==========================
--***************************���͵���ɽ***************************
function goto_huashan()
	if GetPlayerGenre() == 0 then
		Talk(1,"","Ch�a gia nh�p m�n ph�i kh�ng th� tham gia ho�t ��ng Hoa S�n C�nh K�!")
		return
	else
		if Zgc_pub_today_sec_num_rtn() > 57600 then
			local time_distance =  GetTime() - GetTask(991)
			if time_distance < 600 then
				Talk(1,"","V�o Hoa S�n c�ch nhau 10 ph�t, ng��i c�n"..Zgc_pub_time_sec_change(time_distance,0).." m�i c� th� v�o")
				return
			end
		end
		NewWorld(969,1633,3263)
		SetTask(991,GetTime())
	end	
end
--*************************��ɽ�����***************************
function huashan_fight_inf()
	
end
function nothing()

end
--============================�齫�ռ���غ���==============================
--**************************�齫�ռ���Ի�****************************
function mah_jong_collect_dia()
	local mah_jong_seq_ran = spring_2007_mahj_suc_seq_rtn()			--��õ�ǰ�����������
	Msg2Player(mah_jong_seq_ran)		--test
	local mah_jong_collect_dia_main = ""
	local mah_jong_collect_dia = {}
	if mah_jong_seq_ran ~= 0 and mah_jong_seq_ran <=(getn(mah_jong_suc_way) -1) then
		mah_jong_collect_dia_main = "Th�i gian thu th�p m�c ch��c:"
		mah_jong_collect_dia[1] = mah_jong_suc_way[mah_jong_seq_ran][1].."/#mah_jong_collect_prize("..mah_jong_seq_ran..")" 
		mah_jong_collect_dia[2] = "Ta mu�n t�m hi�u"..mah_jong_suc_way[mah_jong_seq_ran][1].."quy t�c/#mah_jong_suc_inf("..mah_jong_seq_ran..")"
		mah_jong_collect_dia[3] = "Th� H�/#mah_jong_collect_prize(20)"
		mah_jong_collect_dia[4] = "T�m hi�u quy t�c t� h�/#mah_jong_suc_inf(20)"
		mah_jong_collect_dia[5] = "Ta ch� ��n xem th�/end_dialog"
	else
		mah_jong_collect_dia_main = "Th�i gian thu th�p m�c ch��c:"
		mah_jong_collect_dia[1] = "Th� H�/#mah_jong_collect_prize(20)"
		mah_jong_collect_dia[2] = "T�m hi�u quy t�c t� h�/#mah_jong_suc_inf(20)"
		mah_jong_collect_dia[3] = "Ta ch� ��n xem th�/end_dialog"		
	end
	Say(mah_jong_collect_dia_main,getn(mah_jong_collect_dia),mah_jong_collect_dia)
end
--**************************�齫�ռ������****************************
function mah_jong_collect_inf()
	
end
--***************************�Ͻ��齫��������***************************
function mah_jong_collect_prize(suc_way)
	--�������Ƽ��
	if suc_way == 20 then
		if spring_2007_mahj_num_chk(2) == 0 then			--ƨ���������
			return
		end
	else
		if spring_2007_mahj_num_chk(1) == 0 then			--����������
			return
		end
	end
	--�齫�������
	if dostring(mah_jong_suc_way[suc_way][3]) == 0 then		
		return
	end
	--�����ռ�͸��ؼ��
	if suc_way ~= 20 then
		if Zgc_pub_goods_add_chk(1,100) ~= 1 then			
			return
		end
	end
	--�齫ɾ�����
	if mah_jong_del_all(14) ~= 0 then						
		return
	end
	--��������
	if suc_way == 20 then
		local exp_num = GetLevel()
		exp_num = exp_num * exp_num * 250
		ModifyExp(exp_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_num.." �i�m kinh nghi�m!")
	else
		local add_flag = AddItem(2,0,mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][1],1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][2].."!")
			if mah_jong_suc_way[suc_way][4] == 1 or mah_jong_suc_way[suc_way][4] == 2 then
				Msg2SubWorld("Ng��i ch�i:"..GetName().."S� m�c ch��c l�n n�y thu th�p ���c"..mah_jong_suc_way[suc_way][1].."! ���c r�i"..mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][2].."!")
			end
		else
			WriteLog("Ho�t ��ng M�c Ch��c, Ng��i ch�i:"..GetName().."Nh�n ph�n th��ng th�t b�i, t�i:"..add_flag)
		end
	end
end
--****************************�齫��������******************************
function mah_jong_suc_inf(mahj_suc_diff)
	Talk(1,"end_dialog","<color=green>Ph�c Th�n<color>:"..mah_jong_suc_way[mahj_suc_diff][5])
end
--******************************����ϲ**********************************
function big_4_hap_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	if (GetItemCount(2,0,char_start_id) * GetItemCount(2,0,(char_start_id+1)) * GetItemCount(2,0,(char_start_id+2)) * GetItemCount(2,0,(char_start_id+3))) ~= 81 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	else
		local chk_flag = 0 
		for i = circle_start_id,(char_start_id - 1) do
			if GetItemCount(2,0,i) ~= 0 and GetItemCount(2,0,i) == 2 then
				chk_flag = 1
			end
		end
		for i =(char_start_id + 4),(char_start_id + 6) do
			if GetItemCount(2,0,i) ~= 0 and GetItemCount(2,0,i) == 2 then
				chk_flag = 1
			end
		end
	end
	if chk_flag == 0 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
	return 1
end
--******************************�İ���***********************************
function four_hide_4_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local four_chk = 0
	local double_chk = 0
	for i = circle_start_id,(char_start_id + 6) do
		if GetItemCount(2,0,i) == 3 then
			four_chk =four_chk + 1
		elseif GetItemCount(2,0,i) == 2 then 
			double_chk = double_chk + 1
		end
	end
	if four_chk == 4 and double_chk == 1 then
		return 1
	else
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
end
--******************************��������*********************************
function from_1_to_9_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color ~= 1 or mah_jong_color ~= 2 or mah_jong_color ~= 3 then
		local chk_flag = 1
		if GetItemCount(2,0,circle_start_id + ( (mah_jong_color-1) * 9)) < 3 and GetItemCount(2,0,circle_start_id + ( (mah_jong_color * 9) - 1)) < 3 then
			Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
			return 0
		end
		for i = (circle_start_id + 1 +( (mah_jong_color-1) * 9)) ,(circle_start_id + ( (mah_jong_color * 9) - 2)) do
			if GetItemCount(2,0,i) == 0 then
				Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
				return 0
			end
		end
	else
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n c� con b�i <color=red>c�ng m�u<color>!")
		return 0	
	end
	return 1
end
--******************************���߶�***********************************
function connect_7_double()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color ~= 1 or mah_jong_color ~= 2 or mah_jong_color ~= 3 then
		--3\4\5\6\7����ɶԡ�
		for i = (circle_start_id + 2 +( (mah_jong_color-1) * 9)) ,(circle_start_id + ( (mah_jong_color * 9) - 3)) do
			if GetItemCount(2,0,i) ~= 2 then
				Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
				return 0
			end
		end
		if (GetItemCount(2,0,(circle_start_id +((mah_jong_color-1) * 9))) == 2 and GetItemCount(2,0,(circle_start_id + 1 +((mah_jong_color-1) * 9))) == 2)
		or (GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 1))) == 2 and GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 2))) == 2)
		or (GetItemCount(2,0,(circle_start_id + 1 +((mah_jong_color-1) * 9))) == 2 and GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 1))) == 2)
		then
			return 1
		else
			Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
			return 0
		end
	else
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n c� con b�i <color=red>c�ng m�u<color>!")
		return 0	
	end
end
--******************************13��*************************************
function thrteen_1_or_9()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local maho_jong_13_1_or_9 = {circle_start_id,(bamboo_start_id - 1),bamboo_start_id,ten_kilo_start_id,(ten_kilo_start_id - 1),}
	local double_chk = 0
	for i = 1,getn(maho_jong_13_1_or_9) do
		if GetItemCount(2,0,maho_jong_13_1_or_9[i]) == 0 then
			if GetItemCount(2,0,i) == 0 then
				Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
				return 0
			elseif 	GetItemCount(2,0,maho_jong_13_1_or_9[i]) == 2 then
				double_chk = 1
			end
		end
	end
	for i = char_start_id , (char_start_id + 6) do
		if GetItemCount(2,0,i) == 0 then
			Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
			return 0
		elseif 	GetItemCount(2,0,i) == 2 then
			double_chk = 1
		end
	end
	if double_chk ~= 1 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0		
	else
		return 1
	end
end
--******************************����Ԫ***********************************
function big_3_yuan()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	for i = (char_start_id + 4),(char_start_id + 6) do
		if GetItemCount(2,0,i) < 3 then
			Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
			return 0
		end
	end
	return 1
end
--*******************************���ǲ���********************************
function seven_star()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	for i = char_start_id , (char_start_id + 6) do
		if GetItemCount(2,0,i) ~= 1 then
			Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
			return 0
		end
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local chk_diff_flag = 0
	for i = 1,3 do
		for j = maho_jong_id_start[i],(maho_jong_id_start[i] + 2) do
			if GetItemCount(2,0,j) == 1 and GetItemCount(2,0,(j + 3)) == 1 and GetItemCount(2,0,(j + 6)) == 1then
				chk_flag = (chk_flag + j)
				if j ~= 2 then
					chk_diff_flag = 1
				end
			end
		end
	end
	if chk_flag ~= 6 or chk_diff_flag ~= 1 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	else
		return 1
	end
end
--********************************�Ʋ���*********************************
function cannot_push()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local cannot_push_id = {circle_start_id,(circle_start_id+1),(circle_start_id+2),(circle_start_id+3),(circle_start_id+4),(circle_start_id+7),(circle_start_id+8),(bamboo_start_id+1),(bamboo_start_id+3),(bamboo_start_id+4),(bamboo_start_id+5),(bamboo_start_id+7),(bamboo_start_id+8),(char_start_id+6)}
	for i = 1, getn(cannot_push_id) do
		if GetItemCount(2,0,cannot_push_id[i]) ~= 1 then
			Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
			return 0
		end
	end
	return 1
end
--********************************���߶�*********************************
function sam_color_7_double()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local maho_jong_color_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local maho_jong_color = mah_jong_same_color_chk()
	if maho_jong_color == 0 or maho_jong_color == 4 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0		
	end
	local double_num = 0
	for i = maho_jong_color_id[maho_jong_color],(maho_jong_color_id[maho_jong_color] + 6) do
		if GetItemCount(2,0,i) == 2 then
			double_num = double_num + 1
		end
	end
	if double_num ~= 7 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	else
		return 1
	end
end
--********************************���۾�*********************************
function all_1_or_9()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end	
	local num_1_or_9 = 0
	local id_1_or_9 = {circle_start_id,(bamboo_start_id-1),bamboo_start_id,(ten_kilo_start_id-1),ten_kilo_start_id,(char_start_id-1)}
	for i = 1,getn(id_1_or_9) do
		num_1_or_9 = GetItemCount(2,0,i) + num_1_or_9
	end
	if num_1_or_9 ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0		
	else
		return 1
	end
end
--*****************************һɫ��ͬ˳********************************
function one_color_four_seq()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color == 0 or mah_jong_color == 4 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0	
	else
		for i = maho_jong_id_start[mah_jong_color],(maho_jong_id_start[mah_jong_color] + 8) do
			if GetItemCount(2,0,i) >= 4 and GetItemCount(2,0,(i+1)) >= 4 and GetItemCount(2,0,(i+2)) >= 4 then
				chk_flag = 1
				break
			end
		end
	end
	if chk_flag == 1 then
		return 1
	else
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0	
	end
end
--*****************************һɫ�Ľڸ�********************************
function one_color_four_cont()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color == 0 or mah_jong_color == 4 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0	
	else
		for i = maho_jong_id_start[mah_jong_color],(maho_jong_id_start[mah_jong_color] + 8) do
			if GetItemCount(2,0,i) >= 3 and GetItemCount(2,0,(i+1)) >= 3 and GetItemCount(2,0,(i+2)) >= 3 and GetItemCount(2,0,(i+3)) >= 3 then
				chk_flag = 1
				break
			end
		end
	end
	if chk_flag == 1 then
		return 1
	else
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0	
	end
end
--*******************************��һɫ**********************************
function all_char()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	if mah_jong_same_color_chk() ~= 4 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
	return 1
end
--*******************************��һɫ**********************************
function all_sam_color()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	if mah_jong_same_color_chk() == 0 or mah_jong_same_color_chk() == 4 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
	return 1
end
--*******************************ȫ��************************************
function all_big()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 4,6 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
	return 1
end
--*******************************ȫ��************************************
function all_normal()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 3,5 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
	return 1
end
--*******************************ȫС************************************
function all_small()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 0,2 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
	return 1
end
--*******************************����************************************
function sam_color_dragon()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	for i = 1, 3 do
		if GetItemCount(2,0,color_start_id[i]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 1)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 2]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 3)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 4]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 5)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 6]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 7)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 8]) ~= 0 then
			return 1
		end	
	end
	Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
	return 0
end
--******************************������***********************************
function three_hide_num_3()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	end
	local chk_flag = 0
	for i = 0,33 do 
		if GetItemCount(2,0,(circle_start_id+i)) >= 3 then
			chk_flag = chk_flag + 1
		end
	end
	if chk_flag >= 3 then
		return 1
	else
		Talk(1,"end_dialog","X�c nh�n trongh�nh trang c�a b�n c� con b�i ph� h�p!")
		return 0
	end
end
--********************************ƨ��***********************************
function just_14()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c�a b�n <color=red>ch� c�<color> <color=red>14<color> con b�i!")
		return 0
	else
		return 1
	end
end
--===============================��������================================
--****************************�齫��ɫ���*******************************
--��������������Ƿ��Ǵ�ɫ��0Ϊ�����Ǵ�ɫ��1ΪͲ��2Ϊ����3Ϊ��4Ϊ��
function mah_jong_same_color_chk()
	local mah_jong_seq = 0		--��⵽��һ���Ƶ�ID
	for i = circle_start_id,(char_start_id + 6) do
		if GetItemCount(2,0,i) ~= 0 and mah_jong_seq == 0 then
			mah_jong_seq = (floor((i - circle_start_id) / 9) + 1)
		elseif GetItemCount(2,0,i) ~= 0 and mah_jong_seq ~= 0 then
			if (floor((i-circle_start_id)/9) + 1) ~= mah_jong_seq then
				mah_jong_seq = 0
				break
			end
		end
	end
	return mah_jong_seq
end
--***************************�齫����ͳ�ƺ���****************************
function mah_jong_cout()
	local num_trn = 0
	for i = circle_start_id,(char_start_id + 6) do
		num_trn = GetItemCount(2,0,i) + num_trn
	end
	return num_trn
end
--************************�齫ȫ��ɾ������******************************
function mah_jong_del_all(del_num)
	for i = circle_start_id,(char_start_id + 6) do
		local mah_num = GetItemCount(2,0,i)
		if mah_num ~= 0 then
			if DelItem(2,0,i,mah_num) == 1 then
				del_num = del_num - mah_num
			end
		end
	end
	return del_num
end
