--08��һ���ԯ��ͽ�ű�
--by vivi
--2008/04/11

Include("\\script\\online\\laborday08\\mah_jong_head.lua");
Include("\\script\\lib\\lingshi_head.lua");	

--==========================����������������=============================
	start_seq = {
		{630,638}, --1Ͳ��9Ͳ����ϸ��id
		{639,647}, --��
		{648,656}, --��
		{657,663}  --��
		}

tMJaward = { --Ͳ�������򡢴���ϲ������
	{{5,1},{"Nh�t Thi�m Y�u Ho�ng",2,1,3330,5},{50,51},{"T�i b� ki�p s� m�n",0,0,0,"R��ng Thi�n ��a Huy�n Ho�ng Trang",2,0,1057}},
	{{5,2},{"Nh�t Thi�m Y�u Ho�ng",2,1,3330,10},{50,55,58},{"Ng� H�nh M�t t�ch",0,107,155,"R��ng Thi�n ��a Huy�n Ho�ng Trang",2,0,1057,"R��ng Thi�n ��a Huy�n Ho�ng Gi�p",2,0,1056}},
	{{6,1},{"Tam Di�u Long Hi",2,1,3331,5},{50,70,90,110},{"L�ng Ba Vi B�",0	,112,78,"R��ng Thi�n ��a Huy�n Ho�ng Trang",2,0,1057,"R��ng Thi�n ��a Huy�n Ho�ng Gi�p",2,0,1056,"R��ng Thi�n ��a Huy�n Ho�ng Qu�n",2,0,1055}},
	{{7,1},{"Tam Di�u Long Hi",2,1,3331,15},{150,200,250,300},{"R��ng Thi�n ��a Huy�n Ho�ng v� kh�",2,0,1058,"R��ng Thi�n ��a Huy�n Ho�ng Trang",2,0,1057,"R��ng Thi�n ��a Huy�n Ho�ng Gi�p",2,0,1056,"R��ng Thi�n ��a Huy�n Ho�ng Qu�n",2,0,1055}},
	{{7,2},{" Thanh ��ng ��nh c�p 1",2,1,3213,1}}
}

	tJueYaoBao = {
	{"T�i b� ki�p Thi�u L�m",2,0,607},
	{"T�i b� ki�p V� �ang",2,0,611},
	{"T�i b� ki�p Nga My",2,0,609},
	{"T�i b� ki�p C�i Bang",2,0,610},
	{"T�i b� ki�p ���ng M�n",2,0,608},
	{"T�i b� ki�p D��ng M�n",2,0,612},
	{"T�i b� ki�p Ng� ��c",2,0,613}
	}
	
tTiandi = {
	{{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,85},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,86},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,87},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,88}},
	{{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,85},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,86},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,87},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,88}},
	{{"Thi�n ��a Huy�n Ho�ng Trang",0,101,85},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,86},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,87},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,88}},
	{[0]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100},{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122},{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [1]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [2]={{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [3]={{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [4]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [5]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [6]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [7]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [8]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [9]={{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [10]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [11]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [12]={{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [13]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [14]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [15]={{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [16]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [17]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111}},
	 [18]={{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [19]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [20]={{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [21]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15}}}
	};	


	Npc_name = {"<color=green>Hi�n Vi�n L�<color>:","<color=green>Hi�n Vi�n Trung<color>:","<color=green>Hi�n Vi�n Nh�n<color>:"}
--==============================���߼�����===============================
function main(npc_index)
	local map_ID = GetWorldPos()				--��¼NPC����
	if get_laborday08_award_state() == 1 then
		local npc_dia = {
			"Hay l�m! Xem ta ra tay ��y!/mah_jong_suc_list",
			"��nh theo quy t�c n�o v�y? L�m sao t�nh th�ng?/mah_jong_suc_inf",
			"Kh�ng bi�t M�t ch��c l� c�i g�?/what_is_mah_jong",
			"Cu�c thi �� th�n tranh b� l� g�?/mah_jong_task_inf",
			"Ta mu�n nh�n H��ng d�n ho�t ��ng 1-5/#get_something(1)",
			"Ta mu�n nh�n 1 'r��ng M�t ch��c'/#get_something(2)",
			"Ta c�n ph�i h�nh hi�p c�u ng��i, kh�ng r�nh �� ��nh M�t ch��c!/end_dialog",
		}
		Say(Npc_name[floor(map_ID/100)].."Ta l� �� t� c�a Hi�n Vi�n m�n, g�n ��y b�n m�n c� t� ch�c 1 cu�c thi <color=yellow>�� Th�n tranh b�<color>, sao b�ng h�u kh�ng ��n �� th� xem. Ch� � th�i gian ho�t ��ng t� <color=yellow>28-4 ��n 23-5<color>, th�i gian nh�n th��ng l� <color=yellow>28-4 ��n 23 gi� 12-5<color>.",
			getn(npc_dia),
			npc_dia
		)
	elseif get_laborday08_award_state() == 0 then
		Talk(1,"",Npc_name[floor(map_ID/100)].."Cu�c thi �� th�n tranh b� s� di�n ra t� 28-4 ��n 5-5, 12-5 s� k�t th�c nh�n ph�n th��ng.");		 
	else
		Talk(1,"",Npc_name[floor(map_ID/100)].."Ch�c m�ng ph�t t�i! Cu�c thi �� th�n tranh b� �� k�t th�c.");
	end
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
		"<color=yellow>Quy t�c B�nh H�<color>:\nC�n <color=yellow>ng�u nhi�n 14<color> t�m b�i t�c c� th� b�c b�i!\nPh�n th��ng: <color=yellow>�i�m kinh nghi�m v� 3 vi�n Linh th�ch c�p 1-7, ng��i ch�i c�p 99 nh�n ng�u nhi�n 15 vi�n Linh th�ch c�p 1-7<color>!",
		"<color=yellow>Quy t�c Thanh Nh�t S�c (��ng)<color>:\nC�n Nh�t ��ng ��n C�u ��ng <color=yellow>m�i lo�i 1 t�m<color>,  ��ng kh�c <color=yellow>ng�u nhi�n<color> 5 t�m!\nPh�n th��ng: <color=yellow>Nh�n ���c 5 nguy�n li�u hi�u qu� �nh s�ng c�p 1 v� 1 vi�n Linh th�ch c�p 5, c� th� nh�n ���c t�i b� ki�p l�u ph�i hi�n t�i v� trang b� Thi�n ��a Huy�n Ho�ng<color>!", 
		"<color=yellow>Quy t�c Thanh Nh�t S�c (�i�u) <color>:\nC�n Nh�t �i�u ��n C�u �i�u <color=yellow>m�i lo�i 1 t�m<color>, <color=yellow>ng�u nhi�n<color> 5 t�m �i�u kh�c!\nPh�n th��ng: <color=yellow>Nh�n ���c 10 nguy�n li�u hi�u qu� �nh s�ng c�p 1 v� 2 vi�n Linh th�ch c�p 5, c� th� nh�n ���c Ng� h�nh m�t t�ch v� trang b� Thi�n ��a Huy�n Ho�ng<color>!", 
		"<color=yellow>Quy t�c Thanh Nh�t S�c V�n<color>:\nC�n Nh�t V�n ��n C�u V�n <color=yellow>m�i lo�i 1 t�m<color>, ngo�i ra c� <color=yellow>ng�u nhi�n<color> 5 t�m V�n!\nPh�n th��ng: <color=yellow>Nh�n ���c Nguy�n li�u hi�u qu� �nh s�ng c�p 3 v� 1 vi�n Linh th�ch c�p 6, c� th� nh�n ���c b� ki�p L�ng Ba Vi B� v� trang b� Thi�n ��a Huy�n Ho�ng<color>!", 
		"<color=yellow>Quy t�c ��i T� H�<color>:\nC�n ��ng Phong, Nam Phong, T�y Phong, B�c Phong <color=yellow>m�i lo�i 3 t�m<color>, ngo�i H�ng Trung, Ph�t T�i, B�ch Bi�n <color=yellow>ng�u nhi�n 1 c�p<color>!\n<color=yellow>Ph�n th��ng<color>: <color=red>Nh�n ���c 15 nguy�n li�u hi�u qu� �nh s�ng c�p 3 v� 1 Linh th�ch c�p 7, c� th� nh�n ���c trang b� Thi�n ��a Huy�n Ho�ng<color>!",
		"<color=yellow>Quy t�c Th�n b�i<color>:\nC�n <color=yellow>ng�u nhi�n<color> <color=yellow>777<color> t�m M�t ch��c!\n<color=yellow>Ph�n th��ng<color>: <color=red>2 Linh th�ch c�p 7 v� 1 Thanh ��ng ��nh c�p 1<color>!"
	}
	Talk(1,"mah_jong_suc_inf",Npc_name[floor(map_ID/100)].."\n"..tb_mah_jong_suc_rule[suc_way])
end
--**********************************�齫����******************************
function what_is_mah_jong()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_1",Npc_name[floor(map_ID/100)].."<color=yellow>M�t Ch��c<color> v�n c� t�n l� <color=yellow>M�t T��ng<color>, M�t l� <color=yellow>108<color> v� h�o h�n c�a Th�y H� truy�n. c� ng��i t�n <color=green>V�n B�nh �i�u<color> r�t s�ng b�i h�o h�n L��ng S�n B�c, �� ph�t minh ra c� <color=yellow>M�t Ch��c<color>, �em 108 Anh h�ng h�a th�n v�o tr� ch�i. M�t Ch��c c� t�ng c�ng <color=yellow>108<color> qu�n b�i, v� nh� <color=yellow>108<color> v� h�o h�n. Trong b�i c� <color=yellow>C�u �i�u<color> v� nh� <color=green>C�u �i�u Long S� Ti�n<color>, <color=yellow>Nh� �i�u<color> v� nh� <color=green>Song Ti�n H� Di�n Ch��c<color>, <color=yellow>Nh�t B�nh<color> v� nh� <color=green>H�c Ti�n Phong L� Qu�<color>.")
end
function what_is_mah_jong_1()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_2",Npc_name[floor(map_ID/100)].."T�ng c�ng chia l�m 3 lo�i <color=yellow>V�n, B�nh, �i�u<color>, l�y h�i �m c�a m�i ng��i. M�i lo�i c� 5 t�m t� 1 ��n 9 v�a ��ng <color=yellow>108<color> t�m. <color=yellow>108<color> v� h�o h�n t� 4 ph��ng t�m h��ng t� t� v� L��ng S�n cho n�n th�m <color=yellow>��ng, T�y, Nam, B�c, Trung<color> 5 h��ng m�i h��ng th�m 4 t�m t�ng c�ng <color=yellow>20<color> t�m. C�c v� h�o h�n xu�t th�n t� nhi�u t�ng l�p kh�c nhau n�n l�i th�m <color=yellow>Ph�t, B�ch<color> t��ng tr�ng cho gi�u ngh�o, c�ng th�m 8 t�m n�y t�t c� c� <color=yellow>136<color> t�m.")
end
function what_is_mah_jong_2()
	local map_ID = GetWorldPos()
	Talk(1,"main",Npc_name[floor(map_ID/100)].."Sau �� l�i c�ng th�m 4 lo�i Hoa b�i t�ng c�ng �� c� <color=yellow>144<color> qu�n b�i. ��nh M�t Ch��c d�ng b�n c� 4 h��ng ��ng T�y Nam B�c, c�ng l� ch� 4 m�a xu�n h� thu ��ng, m�i ng��i <color=yellow>13 qu�n b�i<color> b�i v� m�i qu� c� <color=yellow>13 tu�n <color>. 4 m�a h�p l�i l� <color=yellow>52<color> tu�n, t�ng c�ng <color=yellow>364 ng�y<color>, c�ng th�m <color=yellow>1 qu�n b�i<color> gi� d�, t�ng c�ng c� <color=yellow>365 ng�y<color>, v�a ��ng 1 n�m. ")
end
--**********************************�����******************************
function mah_jong_task_inf()
	local map_ID = GetWorldPos()
	Talk(1,"main",Npc_name[floor(map_ID/100)].."<color=yellow>Hi�n Vi�n m�n<color> ta v�n l� t� ch�c t�p h�p nhi�u con b�c s�ng b�i <color=green>Hi�n Vi�n ��i hi�p<color>, m�i n�m ��u t� ch�c cu�c thi �� Th�n �� t��ng nh� <color=green>Hi�n Vi�n ��i hi�p<color>. B�ng h�u c� th�i gian c� th� t�m 1 qu�n b�i t�t ��n ch� ta, ta s� c�n c� s� qu�n b�i thu th�p ���c �� t�ng <color=yellow>ph�n th��ng<color> t��ng �ng.")
end
--**********************************���ƶԻ�******************************
function mah_jong_suc_list()
	local map_ID = GetWorldPos()
	local nState = get_laborday08_state();
	if nState == 0 then				--�ʱ���ж�
		Talk(1,"mah_jong_task_inf",Npc_name[floor(map_ID/100)].."Cu�c thi �� Th�n tranh b� v�n ch�a ch�nh th�c b�t ��u. b�ng h�u c� th� xem thuy�t minh li�n quan ho�t ��ng")
		return
	elseif nState == 1 then			--�����б�
		Say(Npc_name[floor(map_ID/100)].."Kh�ng bi�t thi�u hi�p c� b�i n�o?",
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
		Npc_name[floor(map_ID/100)].."<color=yellow>B�nh H�<color> ch� c�n c� <color=yellow>14 t�m b�i<color> ng�u nhi�n l� c� th� ��i, ph�n th��ng l�: <color=yellow>�i�m kinh nghi�m v� 3 vi�n Linh th�ch c�p 1-7, ng��i ch�i c�p 99 nh�n ���c 15 Linh th�ch c�p 1-7<color>. B�n c� t�m b�i n�o kh�ng mu�n n�p t� m�nh c�t n� tr��c �i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh�t S�c (��ng)<color> C�n Nh�t ��ng ��n C�u ��ng <color=yellow>m�i lo�i 1 t�m<color>, lo�i kh�c <color=yellow>ng�u nhi�n<color> 5 t�m, t�ng c�ng <color=yellow>14<color> t�m ��ng!\n    Ph�n th��ng: <color=yellow>5 nguy�n li�u hi�u qu� �nh s�ng c�p 1 v� 1 Linh th�ch c�p 5, c� th� nh�n ���c t�i b� ki�p l�u ph�i hi�n t�i v� trang b� Thi�n ��a Huy�n Ho�ng<color>. B�n c� t�m b�i n�o kh�ng mu�n n�p t� m�nh c�t n� tr��c �i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh�t S�c (�i�u)<color> C�n Nh�t �i�u ��n C�u �i�u <color=yellow>m�i lo�i 1 t�m<color>, <color=yellow>ng�u nhi�n<color> 5 t�m �i�u kh�c!\nPh�n th��ng: <color=yellow>Nh�n ���c 10 nguy�n li�u hi�u qu� �nh s�ng c�p 1 v� 2 vi�n Linh th�ch c�p 5, c� th� nh�n ���c Ng� h�nh m�t t�ch v� trang b� Thi�n ��a Huy�n Ho�ng<color>! B�n c� t�m b�i n�o kh�ng mu�n n�p t� m�nh c�t n� tr��c �i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh�t S�c V�n<color> c�n Nh�t V�n ��n C�u V�n <color=yellow>m�i lo�i 1 t�m<color>, ngo�i ra c� <color=yellow>ng�u nhi�n<color> 5 t�m V�n!\nPh�n th��ng: <color=yellow>Nh�n ���c Nguy�n li�u hi�u qu� �nh s�ng c�p 3 v� 1 vi�n Linh th�ch c�p 6, c� th� nh�n ���c b� ki�p L�ng Ba Vi B� v� trang b� Thi�n ��a Huy�n Ho�ng<color>! B�n c� t�m b�i n�o kh�ng mu�n n�p t� m�nh c�t n� tr��c �i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>��i T� H�<color> c�n ��ng Phong, Nam Phong, T�y Phong, B�c Phong <color=yellow>m�i lo�i 3 t�m<color>, ngo�i H�ng Trung, Ph�t T�i, B�ch Bi�n <color=yellow>ng�u nhi�n 1 c�p<color>!\nPh�n th��ng: <color=red>Nh�n ���c 15 nguy�n li�u hi�u qu� �nh s�ng c�p 3 v� 1 Linh th�ch c�p 7, c� th� nh�n ���c trang b� Thi�n ��a Huy�n Ho�ng<color>! B�n c� t�m b�i n�o kh�ng mu�n n�p t� m�nh c�t n� tr��c �i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Th�n b�i<color> C�n <color=yellow>ng�u nhi�n<color> <color=yellow>777<color> t�m M�t ch��c!\nPh�n th��ng: <color=red>2 Linh th�ch c�p 7 v� 1 Thanh ��ng ��nh c�p 1<color>!",
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
--------------------------------------�һ����--------------------------------------
	local tTotalNum = {PIHU_TOTAl_NUM,TONG_TOTAL_NUM,TIAO_TOTAL_NUM,WAN_TOTAL_NUM,SIXI_TOTAL_NUM};
	local tMjTask	= {TASK_MJ_PIHU_RPIZE,TASK_MJ_TONG_RPIZE,TASK_MJ_TIAO_RPIZE,TASK_MJ_WAN_RPIZE,TASK_MJ_SIXI_RPIZE};
	if color_diff ~= 5 then
		if GetTask(tMjTask[color_diff+1]) >= tTotalNum[color_diff+1] then
			Talk(1,"",npc_name.."Quy t�c h� b�i n�y t�i �a c� th� ��i "..tTotalNum[color_diff+1].." l�n, b�n �� ��i xong.");
			return
		end
	end
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
	--�������
	if (color_diff ~= 5 and mah_jong_count < 14) or (color_diff == 5 and mah_jong_count < 777) then
		Talk(1,"",npc_name.."B�n h�y x�c nh�n trong t�i c� <color=yellow>�� s� l��ng M�t ch��c<color> ph� h�p quy t�c!")
		return
	end
--------------------------------------������--------------------------------------
	--��ʼ���
	if color_diff ~= 0 and color_diff ~= 5 then		--ƽ����������Ҫ������
		if color_diff ~= 4 then						--���ͬ�ֻ�ɫ1-9��һ��
			for i = start_seq[color_diff][1],start_seq[color_diff][2] do
				if GetItemCount(2,0,i) < 1 then
					Talk(1,"",npc_name.."H�y x�c nh�n trong t�i c� <color=yellow>1 t�m<color> b�i ��i x�ng 1 ��n 9!")
					return
				end
			end
		else
			for i = start_seq[4][1],(start_seq[4][1]+3) do	--����ķ������
				if GetItemCount(2,0,i) < 3 then
					Talk(1,"",npc_name.."H�y x�c nh�n trong t�i b�n c� ��ng Phong, Nam Phong, T�y Phong v� B�c Phong m�i lo�i <color=yellow>3 t�m<color>!")
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
				Talk(1,"",npc_name.."H�y x�c nh�n trong t�i b�n c� <color=yellow>1 c�p<color> H�ng Trung, Ph�t T�i ho�c B�ch Bi�n!")
				return
			end
		end
	end
-------------------------------------�����ռ���--------------------------------
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then
		return
	end
--------------------------------------ɾ�����--------------------------------------
	local del_chk = 0
	local del_remain_num = 14		--��Ҫɾ��14���齫
	if color_diff == 0 or color_diff == 5 then
		if color_diff == 5 then
			del_remain_num = 777
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
		Talk(1,"",npc_name.."H�y x�c nh�n trong t�i b�n c� M�t ch��c ph� h�p v�i y�u c�u!")
		return
	end
--------------------------------------- ��������-------------------------------------
	if color_diff == 0 then
		local nLv = GetLevel();
		local nExp = floor(nLv*nLv*140);
		SetTask(tMjTask[color_diff+1],GetTask(tMjTask[color_diff+1])+1);
		if nLv ~= 99 then	
			ModifyExp(nExp);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.." kinh nghi�m.");
			for i=1,3 do	
				laborday08_baoshi_prob("B�nh H�");
			end
		else
			for i=1,15 do
				laborday08_baoshi_prob("B�nh H�");
			end
		end
		Talk(1,"",npc_name.."B�n �� ��i h� b�i <color=red>"..GetTask(tMjTask[color_diff+1]).."<color> l�n, b�n c�n ���c ��i <color=red>"..(tTotalNum[color_diff+1]-GetTask(tMjTask[color_diff+1])).."<color> l�n.");		
	else
		lspf_AddLingShiInBottle(tMJaward[color_diff][1][1],tMJaward[color_diff][1][2]);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..tMJaward[color_diff][1][1].."Linh th�ch"..tMJaward[color_diff][1][2].." vi�n, n� �� ���c c�t v�o T� Linh ��nh.");
		AddItem(tMJaward[color_diff][2][2],tMJaward[color_diff][2][3],tMJaward[color_diff][2][4],tMJaward[color_diff][2][5]);
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..tMJaward[color_diff][2][1]..tMJaward[color_diff][2][5].."c�i");
		local tHuName = {"Thanh Nh�t S�c (��ng)","Thanh Nh�t S�c (�i�u)","Thanh Nh�t S�c (V�n)","��i T� H�","Th�n b�i"}
		if color_diff ~= 5 then
			SetTask(tMjTask[color_diff+1],GetTask(tMjTask[color_diff+1])+1);
			Talk(1,"",npc_name.."B�n �� ��i h� b�i <color=red>"..GetTask(tMjTask[color_diff+1]).."<color> l�n, b�n c�n ���c ��i <color=red>"..(tTotalNum[color_diff+1]-GetTask(tMjTask[color_diff+1])).."<color> l�n.");
			local nRand = random(1,1000);
			for i=1,getn(tMJaward[color_diff][3]) do
				if nRand <= tMJaward[color_diff][3][i] then
					if color_diff == 1 and i == 1 then
						local nFaction = GetPlayerFaction();
						if nFaction ~= 0 then
							AddItem(tJueYaoBao[nFaction][2],tJueYaoBao[nFaction][3],tJueYaoBao[nFaction][4],1);
							Msg2Player("Ch�c m�ng b�n nh�n ���c "..tJueYaoBao[nFaction][1]);
							Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tJueYaoBao[nFaction][1]);
							WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tJueYaoBao[nFaction][1]);
						else
							local nIdx = random(1,7);
							AddItem(tJueYaoBao[nIdx][2],tJueYaoBao[nIdx][3],tJueYaoBao[nIdx][4],1);
							Msg2Player("Ch�c m�ng b�n nh�n ���c "..tJueYaoBao[nIdx][1]);
							Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tJueYaoBao[nIdx][1]);
							WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tJueYaoBao[nIdx][1]);
						end
					else
						local nId = 4*(i-1)+1; --��λid
						AddItem(tMJaward[color_diff][4][nId+1],tMJaward[color_diff][4][nId+2],tMJaward[color_diff][4][nId+3],1);
						Msg2Player("Ch�c m�ng b�n nh�n ���c "..tMJaward[color_diff][4][nId]);
						Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tMJaward[color_diff][4][nId]);
						WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tMJaward[color_diff][4][nId]);
					end	
					break
				end
			end
		else
			Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tMJaward[color_diff][1][1].."Linh th�ch"..tMJaward[color_diff][1][2].." ");
			Msg2Global("Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tMJaward[color_diff][2][1]);
			WriteLog("Ho�t ��ng qu�c t� lao ��ng 08: Ng��i ch�i"..GetName().."Trong cu�c thi Th�n b�i"..tHuName[color_diff].."Nh�n ���c"..tMJaward[color_diff][1][1].."Linh th�ch"..tMJaward[color_diff][1][2].." vi�n v� "..tMJaward[color_diff][2][1]);
		end
	end				
end

function get_something(nType)
	local tSomething = {{2,1,1114},{2,0,1059}};
	local map_ID = GetWorldPos()				--��¼NPC����
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if BigGetItemCount(tSomething[nType][1],tSomething[nType][2],tSomething[nType][3]) >= 1 then
		Talk(1,"",Npc_name[floor(map_ID/100)].."Kh�ng ph�i �� c� r�i sao?");
		return
	end
	AddItem(tSomething[nType][1],tSomething[nType][2],tSomething[nType][3],1);
end