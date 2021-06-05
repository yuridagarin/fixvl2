--filename:Ȫ�ݸ���.lua
--create date:2006-01-12
--author:yanjun
--describe:�꾩����ű�

--�޸ģ�1���峤20070123�޸ı��ű������ӻ�ɽ�����������

Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--==========================����������������=============================
	start_seq = {
		{630,638},
		{639,647},
		{648,656},
		{657,663}
		}
	--�����齫��ʼ��
	mah_jong = {
		"Nh�t ��ng","Nh� ��ng","Tam ��ng","T� ��ng","Ng� ��ng","L�c ��ng","Th�t ��ng","B�t ��ng","C�u ��ng",
		"M�t","Nh� �i�u","Ba","B�n","Ng� �i�u","L�c �i�u","Th�t �i�u","B�t �i�u","C�u �i�u",
		"Nh�t v�n","Nh� v�n","Tam v�n","T� v�n","Ng� v�n","L�c v�n","Th�t v�n","B�t v�n","C�u v�n",
		"��ng phong","Nam phong","T�y phong","B�c phong","H�ng trung","ph�t t�i","B�ch ban"
	}
	mah_jong_prize_bag = {{670,"Con b�i 4 �em c��c"},{669,"Con b�i 3 �em c��c"},{668,"Con b�i 2 �em c��c"},{667,"Con b�i �em c��c"},{667,"Con b�i �em c��c"}}
	Npc_name = {"<color=green>Hi�n Vi�n Trung<color>:","<color=green>Hi�n Vi�n Nh�n<color>:","<color=green>Hi�n Vi�n L�<color>:"}
--==============================���߼�����===============================
function main(npc_index)
	local map_ID = GetWorldPos()				--��¼NPC����
	--���ϵȼ��ж�
	local npc_dia = {
		"Hay l�m! Xem ta ra tay ��y!/mah_jong_suc_list",
		"��nh theo quy t�c n�o v�y? L�m sao t�nh th�ng?/mah_jong_suc_inf",
		"Kh�ng bi�t M�t ch��c l� c�i g�?/what_is_mah_jong",
		"Cu�c thi �� th�n tranh b� l� g�?/mah_jong_task_inf",
		"Ta mu�n nh�n H��ng d�n ho�t ��ng 1-5/#AddItem(2,1,1114,1)",
		"Ta c�n ph�i h�nh hi�p c�u ng��i, kh�ng r�nh �� ��nh M�t ch��c!/end_dialog",
	}
	Say(Npc_name[floor(map_ID/100)].."Ta l� �� t� c�a Hi�n Vi�n m�n, g�n ��y b�n m�n c� t� ch�c 1 cu�c thi <color=yellow>�� Th�n tranh b�<color>, sao b�ng h�u kh�ng ��n �� th� xem!",
		getn(npc_dia),
		npc_dia
	)
end
--*********************************���ƹ���˵��**************************
function mah_jong_suc_inf()
	local map_ID = GetWorldPos()
	Say(Npc_name[floor(map_ID/100)].."D��i ��y l� quy t�c th�ng, b�n mu�n ch�i theo c�ch n�o?",
	7,
	"Ta mu�n bi�t quy t�c h�a v� ph�n th��ng/#mah_jong_rule_dia(1)",
	"Ta mu�n bi�t quy t�c v� ph�n th��ng c�a Thanh Nh�t S�c ��ng/#mah_jong_rule_dia(2)",
	"Ta mu�n bi�t quy t�c v� ph�n th��ng c�a Thanh Nh�t S�c �i�u/#mah_jong_rule_dia(3)",
	"Ta mu�n bi�t quy t�c v� ph�n th��ng c�a Thanh Nh�t S�c V�n/#mah_jong_rule_dia(4)",
	"Ta mu�n bi�t quy t�c v� ph�n th��ng c�a ��i T� H�/#mah_jong_rule_dia(5)",
	"Ta mu�n bi�t quy t�c v� ph�n th��ng c�a B�i Th�n/#mah_jong_rule_dia(6)",
	"Tho�t/end_dialog"
	)
end
function mah_jong_rule_dia(suc_way)
	local map_ID = GetWorldPos()
	local tb_mah_jong_suc_rule = {
		"<color=yellow>Quy t�c B�nh H�<color>: \n C�n <color=yellow>14 <color>c�n b�i b�t k� !\n<color=yellow>Ph�n th��ng<color>: <color=yellow>14 �� Hi�p Ng� Th��ng Bao<color> (m� ra nh�n ���c: Ng�n l��ng, c� th� nh�n ���c: H�p qu� c� c�i nh�, M�t t�ch, G�i m�nh Thi�n Th�ch, H�a Th� B�ch, <color=red>R��ng trang b� T�ng Ki�m<color>)!",
		"<color=yellow>Thanh Nh�t S�c ��ng<color>: \n C�n c� Nh�t ��ng ��n C�u ��ng <color=yellow>m�i lo�i 1 con<color>, ngo�i ra <color=yellow>4 con ��ng b�t k�<color>!\n<color=yellow>Ph�n th��ng<color>: <color=yellow>�� Hi�p T� Th��ng Bao<color>(M� ra nh�n ���c: v� kh� ��c bi�t, danh v�ng, m�t t�ch, h�p qu� c� c�i nh�, Ph�o hoa ��a tin. C� th� nh�n ���c: B�n v� binh kh� m�n ph�i, G�i Thi�n Th�ch, N�ng Tang ph�, <color=red>Vi�m �� Gi�p<color>)!", 
		"<color=yellow>Thanh Nh�t S�c �i�u<color>: \n  C�n Nh�t �i�u ��n C�u �i�u <color=yellow>m�i lo�i 1 con<color>, ngo�i ra <color=yellow>5 con �i�u b�t k�<color>!\n<color=yellow>Ph�n th��ng<color>: <color=yellow>�� Hi�p Tam Th��ng Bao<color>(M� ra nh�n ���c: v� kh� ��c bi�t, danh v�ng, m�t t�ch, h�p qu� c� c�i nh�, Ph�o hoa ��a tin. C� th� nh�n ���c: B�n v� binh kh� m�n ph�i, G�i Thi�n Th�ch, N�ng Tang ph�, <color=red>Vi�m �� Gi�p<color>)!", 
		"<color=yellow>Thanh Nh�t S�c V�n<color>: \n  C�n Nh�t V�n ��n C�u V�n <color=yellow>m�i lo�i 1 con<color>, ngo�i ra <color=yellow>5 con V�n b�t k�<color>!\n<color=yellow>Ph�n th��ng<color>: <color=yellow>�� Hi�p Nh� Th��ng Bao<color>(M� ra nh�n ���c: v� kh� ��c bi�t, danh v�ng, m�t t�ch, h�p qu� c� c�i l�n, Ph�o hoa ��a tin. C� th� nh�n ���c: B�n v� binh kh� m�n ph�i, G�i Thi�n Th�ch, N�ng Tang ph�,  R��ng s�t Nguy�t L��ng Th�, <color=red>Vi�m �� Gi�p<color>, <color=red>Vi�m �� Kh�i<color>)!", 
		"<color=yellow>Quy t�c ��i T� H�<color>: \n   C�n c� ��ng Phong, Nam Phong, T�y Phong, B�c Phong <color=yellow>m�i lo�i 3 con<color>, ngo�i ra c�n c� <color=yellow>H�ng Trung, Ph�t T�i, B�ch B�n <color>1 ��i ng�u nhi�n!\n<color=yellow>Ph�n th��ng<color>: <color=red>�� Hi�p Nh�t Th��ng Bao<color>(M� ra ���c: V� kh� ��c bi�t, danh v�ng, M�t t�ch, H�p qu� c� c�i l�n, c� th� nh�n ���c: B�n v� binh kh� m�n ph�i, G�i Thi�n Th�ch, N�ng Tang ph�,  B�o r��ng Nguy�t L��ng Th�, <color=red>3 m�n trang b� Vi�m ��<color>)!",
		"<color=yellow>B�i Th�n<color>: \n   C�n <color=yellow>336 <color> con <color=yellow>M�t Ch��c b�t k�<color>!\n<color=yellow>Ph�n th��ng<color>: <color=red>�� Hi�p Nh�t Th��ng Bao<color>(M� ra ���c: V� kh� ��c bi�t, danh v�ng, M�t t�ch, H�p qu� c� c�i l�n. C� th� nh�n ���c: B�n v� binh kh� m�n ph�i, G�i Thi�n Th�ch, N�ng Tang ph�, B�o r��ng Nguy�t L��ng Th�, <color=red>3 m�n trang b� Vi�m ��<color>)!"
	}
	Talk(1,"",Npc_name[floor(map_ID/100)].."\n"..tb_mah_jong_suc_rule[suc_way])
end
--**********************************�齫����******************************
function what_is_mah_jong()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_1",Npc_name[floor(map_ID/100)].."<color=yellow>M�t Ch��c<color> v�n c� t�n l� <color=yellow>M�t T��ng<color>, M�t l� <color=yellow>108<color> v� h�o h�n c�a Th�y H� truy�n. c� ng��i t�n <color=green>V�n B�nh �i�u<color> r�t s�ng b�i h�o h�n L��ng S�n B�c, �� ph�t minh ra c� <color=yellow>M�t Ch��c<color>, �em 108 Anh h�ng h�a th�n v�o tr� ch�i. M�t Ch��c c� t�ng c�ng <color=yellow>108<color> qu�n b�i, v� nh� <color=yellow>108<color> v� h�o h�n. Trong b�i c� <color=yellow>C�u �i�u<color> v� nh� <color=green>C�u �i�u Long S� Ti�n<color>, <color=yellow>Nh� �i�u<color> v� nh� <color=green>Song Ti�n H� Di�n Ch��c<color>, <color=yellow>Nh�t B�nh<color> v� nh� <color=green>H�c Ti�n Phong L� Qu�<color>.")
end
function what_is_mah_jong_1()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_2",Npc_name[floor(map_ID/100)].."T�ng c�ng chia l�m <color=yellow>V�n, B�nh. �i�u<color> 3 lo�i, l� h�i �m t�n h� c�a m�i ng��i. M�i lo�i t� 1 ��n 9 m�i lo�i c� 4 t�m b�i,  v�a ��ng <color=yellow>108<color> con b�i. <color=yellow>108<color> v� h�o h�n h�i t� L��ng S�n t� 8 ph��ng 4 h��ng, cho n�n c�ng th�m <color=yellow>��ng T�y Nam B�c Trung<color> 5 h��ng th�m 4 qu�n b�i t�ng c�ng <color=yellow>20 qu�n b�i<color>. C�c v� h�o h�n xu�t th�n t� t�ng l�p kh�c nhau cho n�n c�ng th�m <color=yellow>Trung, Ph�t, B�ch<color> v� nh� t�ng l�p c�a h�, c�ng th�m 8 qu�n b�i n�y t�ng c�ng �� c� <color=yellow>136<color> qu�n b�i.")
end
function what_is_mah_jong_2()
	local map_ID = GetWorldPos()
	Talk(1,"",Npc_name[floor(map_ID/100)].."Sau �� l�i c�ng th�m 4 lo�i Hoa b�i t�ng c�ng �� c� <color=yellow>144<color> qu�n b�i. ��nh M�t Ch��c d�ng b�n c� 4 h��ng ��ng T�y Nam B�c, c�ng l� ch� 4 m�a xu�n h� thu ��ng, m�i ng��i <color=yellow>13 qu�n b�i<color> b�i v� m�i qu� c� <color=yellow>13 tu�n <color>. 4 m�a h�p l�i l� <color=yellow>52<color> tu�n, t�ng c�ng <color=yellow>364 ng�y<color>, c�ng th�m <color=yellow>1 qu�n b�i<color> gi� d�, t�ng c�ng c� <color=yellow>365 ng�y<color>, v�a ��ng 1 n�m. ")
end
--**********************************�����******************************
function mah_jong_task_inf()
	local map_ID = GetWorldPos()
	Talk(1,"",Npc_name[floor(map_ID/100)].."<color=yellow>Hi�n Vi�n m�n<color> ta v�n l� t� ch�c t�p h�p nhi�u con b�c s�ng b�i <color=green>Hi�n Vi�n ��i hi�p<color>, m�i n�m ��u t� ch�c cu�c thi �� Th�n �� t��ng nh� <color=green>Hi�n Vi�n ��i hi�p<color>. B�ng h�u c� th�i gian c� th� t�m 1 qu�n b�i t�t ��n ch� ta, ta s� c�n c� s� qu�n b�i thu th�p ���c �� t�ng <color=yellow>ph�n th��ng<color> t��ng �ng.")
end
--**********************************���ƶԻ�******************************
function mah_jong_suc_list()
	local date_chk = labor_day_2007_date_chk()
	local map_ID = GetWorldPos()
	if date_chk == -1 then				--�ʱ���ж�
		Talk(1,"mah_jong_task_inf",Npc_name[floor(map_ID/100)].."Cu�c thi �� Th�n tranh b� v�n ch�a ch�nh th�c b�t ��u. b�ng h�u c� th� xem thuy�t minh li�n quan ho�t ��ng")
		return
	elseif date_chk == 0 then			--�����б�
		Say(Npc_name[floor(map_ID/100)].."Kh�ng bi�t <color=yellow>"..Zgc_pub_sex_name().."<color>C� b�i n�o hay?",
			7,
			"Ta mu�n ch�n B�nh H�/#mah_jong_suc_dtm(1)",
			"Ta mu�n ch�n Thanh Nh�t S�c ��ng/#mah_jong_suc_dtm(2)",
			"Ta mu�n ch�n Thanh Nh�t S�c �i�u/#mah_jong_suc_dtm(3)",
			"Ta mu�n ch�n Thanh Nh�t S�c V�n/#mah_jong_suc_dtm(4)",
			"Ta mu�n ch�n ��i T� H�/#mah_jong_suc_dtm(5)",
			"Ta mu�n ch�n B�i Th�n/#mah_jong_suc_dtm(6)",
			"Ta v�n ch�a chu�n b�/end_dialog"
		)
	else
		Say(Npc_name[floor(map_ID/100)].."<color=yellow>Cu�c thi �� Th�n tranh b� <color><color=red>�� k�t th�c<color> nh�ng ph�n th��ng v�n c� th� ��i b�nh th��ng, b�ng h�u mu�n ��i th��ng <color=red>h�y nhanh l�n<color> k�o h�t c� h�i.",
			7,
			"Ta mu�n ch�n B�nh H�/#mah_jong_suc_dtm(1)",
			"Ta mu�n ch�n Thanh Nh�t S�c ��ng/#mah_jong_suc_dtm(2)",
			"Ta mu�n ch�n Thanh Nh�t S�c �i�u/#mah_jong_suc_dtm(3)",
			"Ta mu�n ch�n Thanh Nh�t S�c V�n/#mah_jong_suc_dtm(4)",
			"Ta mu�n ch�n ��i T� H�/#mah_jong_suc_dtm(5)",
			"Ta mu�n ch�n B�i Th�n/#mah_jong_suc_dtm(6)",
			"Ta v�n ch�a chu�n b�/end_dialog"
		)
	end
end
--********************************����ȷ��********************************
function mah_jong_suc_dtm(suc_seq)
	local map_ID = GetWorldPos()
	local mah_jong_suc_dia = {
		Npc_name[floor(map_ID/100)].."<color=yellow>B�nh H�<color> ch� c�n <color=yellow>14<color> con b�i b�t k� ��u c� th� ��i, ph�n th��ng l�: <color=yellow>14 �� Hi�p Ng� Th��ng Bao<color>. Con b�i n�o ng��i kh�ng mu�n n�p c� th� gi� l�i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh�t S�c (Th�ng)<color> c�n Nh�t ��ng ��n C�u ��ng <color=yellow>m�i lo�i 1 con<color>, ngo�i ra<color=yellow>5 con ��ng T� b�t k�<color> t�ng c�ng <color=yellow>14 con ��ng T�<color>!\n   Ph�n th��ng l�: <color=yellow>�� Hi�p T� Th��ng Bao<color>. Con b�i n�o ng��i kh�ng mu�n n�p c� th� gi� l�i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh�t S�c <color>c�n 1 ��n 9<color=yellow> m�i lo�i 1 con<color>, mgo�i ra <color=yellow>5 con b�t k�<color> t�ng c�ng, <color=yellow>14 con<color>!\n   Ph�n th��ng: <color=yellow>�� Hi�p Tam Th��ng Bao<color>. Con b�i n�o ng��i kh�ng mu�n n�p c� th� gi� l�i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh�t S�c V�n <color>c�n Nh�t V�n ��n C�u V�n <color=yellow>m�i lo�i 1 con<color>, ngo�i ra<color=yellow>b�t k� 5 con<color> t�ng c�ng <color=yellow>14 con v�n<color>!\n   Ph�n th��ng: <color=yellow>�� Hi�p Nh� Th��ng Bao<color>. Con b�i n�o ng��i kh�ng mu�n n�p c� th� gi� l�i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>��i T� H�<color> c�n c� ��ng Phong, Nam Phong, T�y Phong, B�c Phong <color=yellow>m�i lo�i 3 con<color>, ngo�i ra c�n c� <color=yellow>H�ng Trung, Ph�t T�i, B�ch B�n<color> m�i lo�i 1 c�p, t�ng c�ng <color=yellow>14 t�m b�i ch�<color>!\n Ph�n th��ng: <color=red>�� Hi�p Nh�t Th��ng Bao<color>.Con b�i n�o ng��i kh�ng mu�n n�p c� th� gi� l�i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>B�i Th�n<color> c�n <color=yellow>336<color> con b�i th� c� th� ��i!\n Ph�n th��ng l�: <color=red>�� Hi�p Nh�t Th��ng Bao<color>",
	}
	Say(mah_jong_suc_dia[suc_seq],
	2,
	"Ta mu�n ��i ph�n th��ng/#mah_jong_num_chk("..(suc_seq-1)..")",		--�����������
	"�� ta chu�n b� th�m/end_dialog"
	)
end
--********************************�齫���*****************************
function mah_jong_num_chk(color_diff)
--����׼��
	local map_ID = GetWorldPos()
	local npc_name = Npc_name[floor(map_ID/100)]
--------------------------------------�������--------------------------------------
	local mah_jong_id_start = 0
	local mah_jong_id_end = 0
	if color_diff == 0 or color_diff == 5 then			--�����齫�����Ŀ�ʼ����ID�ͽ�������ID
		mah_jong_id_start = start_seq[1][1]
		mah_jong_id_end = start_seq[4][2]
	else
		mah_jong_id_start = start_seq[color_diff][1]
		mah_jong_id_end = start_seq[color_diff][2]
	end
	local mah_jong_count = 0		--�����ܵ��齫��
	for i = mah_jong_id_start,mah_jong_id_end do
		mah_jong_count = mah_jong_count + GetItemCount(2,0,i)
	end
	if (color_diff ~= 5 and mah_jong_count < 14) or (color_diff == 5 and mah_jong_count < 336) then
		Talk(1,"",npc_name.."B�n h�y x�c nh�n trong t�i c� <color=yellow>�� s� l��ng M�t ch��c<color> ph� h�p quy t�c!")
		return
	end
--------------------------------------������--------------------------------------
	--��ʼ���
	if color_diff ~= 0 and color_diff ~= 5 then		--ƽ����������Ҫ������
		if color_diff ~= 4 then						--���ͬ�ֻ�ɫ1-9��һ��
			for i = start_seq[color_diff][1],start_seq[color_diff][2] do
				if GetItemCount(2,0,i) < 1 then
					Talk(1,"",npc_name.."B�n h�y x�c nh�n trong t�i c� <color=yellow>con b�i<color> �� kh�ng!")
					return
				end
			end
		else
			for i = start_seq[4][1],(start_seq[4][1]+3) do	--����ķ������
				if GetItemCount(2,0,i) < 3 then
					Talk(1,"",npc_name.."B�n x�c nh�n trong t�i c� ��ng Phong, Nam Phong, T�y Phong, B�c Phong m�i lo�i <color=yellow>3 con b�i<color>!")
					return
				end
			end
			local double_chk = 0 							--���Ӽ���־
			for i = (start_seq[4][1]+4),start_seq[4][2] do
				if GetItemCount(2,0,i) >= 2 then
					double_chk = 1
					break
				end
			end
			if double_chk == 0 then
				Talk(1,"",npc_name.."Xin x�c nh�n trong h�nh trang c� <color=yellow>1 c�p<color> H�ng Trung ho�c Ph�t T�i ho�c B�ch B�n!")
				return
			end
		end
	end
-------------------------------------�����ռ���--------------------------------
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
--------------------------------------ɾ�����--------------------------------------
	local del_chk = 0
	local del_remain_num = 14		--��Ҫɾ��14���齫
	if color_diff == 0 or color_diff == 5 then
		if color_diff == 5 then
			del_remain_num = 336
		end
		for i = mah_jong_id_start,mah_jong_id_end do
			local mah_jong_num = GetItemCount(2,0,i)
			if mah_jong_num ~= 0 then
				local del_num = min(mah_jong_num,del_remain_num)
				if DelItem(2,0,i,del_num) == 1 then
					del_remain_num = del_remain_num - del_num
				end
			end
			if del_remain_num <= 0 then
				break
			end
		end
	elseif color_diff >= 1 and color_diff <= 3 then
		del_remain_num = 5						--��һ������������Ҫɾ��5��
		for i = start_seq[color_diff][1],start_seq[color_diff][2] do		--�߼��Ƚϸ���
			local mah_jong_num = GetItemCount(2,0,i)
			local del_num = min(mah_jong_num,(del_remain_num + 1))
			if DelItem(2,0,i,del_num) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - (del_num - 1)
		end
	elseif color_diff == 4 then
		del_remain_num = 5
		for i = start_seq[4][1],(start_seq[4][1]+3) do	--ɾ���ķ������
			if DelItem(2,0,i,3) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - 1
		end
		for i = (start_seq[4][1]+4),start_seq[4][2] do	--ɾ������
			if GetItemCount(2,0,i) >= 2 then
				if DelItem(2,0,i,2) == 1 then
					del_remain_num = del_remain_num - 1
					break
				end
			end
		end
	end
	if del_remain_num > 0 then			--ɾ��ʧ��
		Talk(1,"",npc_name.."Xin x�c nh�n M�t ch��c trong t�i ph� h�p quy t�c y�u c�u!")
		return
	end
--------------------------------------- ��������-------------------------------------
	if color_diff == 0 then
		local add_flag = AddItem(2,1,1112,14)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 14 �� Hi�p Ng� Th��ng Bao!")
		end
	else
		local add_flag = AddItem(2,0,mah_jong_prize_bag[color_diff][1],1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..mah_jong_prize_bag[color_diff][2].."!")
			if color_diff == 4 or color_diff == 5 then
				Msg2SubWorld("Ng��i ch�i:"..GetName().."N�p qu�n b�i ��i �ng! Nh�n ���c"..mah_jong_prize_bag[color_diff][2].."!")
			end
			WriteLog("Ng��i ch�i:"..GetName().."Nh�n ���c:"..mah_jong_prize_bag[color_diff][2])
		else
			WriteLog("Ho�t ��ng M�c Ch��c, Ng��i ch�i:"..GetName().."Nh�n ���c"..mah_jong_prize_bag[color_diff][2].."T�ng th�m th�t b�i, k� hi�u"..add_flag)
		end	
	end
end
