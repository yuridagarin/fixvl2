--�ļ����ƣ��������ؿ�missionͷ�ļ�
--�ļ����ܣ��������ؿ�mission��ͷ�ļ�����Ҫ��mission�����ϴ���
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-06
--�����޸ļ�¼��
--��ע���Ҳ������ã�˭�����ã�
--��������������
--mission timer
Include("\\script\\lib\\globalfunctions.lua")
Timmer_ID = 67				--��ʱ��ID
Frame_per_second = 18						--������ÿ��֡��=18
Timer_interval = 10 * Frame_per_second		--���õ�����
Timmer_loop_num = 194						--�ܼ�ѭ���Ĵ���

--��������������
Mission_step_taskID = 1
TB_mission_step_value = {10,15,20,25,30}

MS_ID = 39									--mission��id
--MS_ID�ܵ�ʹ�������1-9Ϊ����MSͨ��10�Ժ����MS���з��䣩
MS_STATE_ID = 1						--mission״̬�Ĵ洢id
MS_STATE_DIFF_ID = 2				--��ǰ�ǵڼ��ص�id
MS_PLAYER_NUM = 3					--��Ž�����ҵ�����
MS_DIFF = 4								--��ŵ�ǰ�ؿ�ģʽ��1Ϊ��ͨ��2Ϊ���ӣ�
MS_TIMMER_LOOP_ID = 5			--��ʱ�����������λ��

MS_BOSS_KILL_NUM = 11			--�����ɱ��boss������
MS_BOSS_INDEX_ID = 12			--boss�������λ��
MS_DRAGON_FOX_NUM = 13		--���ɱ��С��/Ѫħ���������λ��
MS_BLOOD_MONSTER_NUM = 14 --Ѫħ�˵�����
--20-25����boss����
MS_BOSS_INDEX_1 = 21
MS_BOSS_INDEX_2 = 22
MS_BOSS_INDEX_3 = 23
MS_BOSS_INDEX_4 = 24
MS_BOSS_INDEX_5 = 25
--mission״̬ID
MS_state_unuse = 0
MS_state_wait_start = 1
MS_state_running = 2
MS_state_wait_end = 3
--triggerʹ��ID
Trigger_ID = 1110
Trigger_save_ID = 904
Tb_stage_npc_name = {"�� T� C�n L�n","Th� m� nh�n","Th� M� T��ng Qu�n","D��c th�t th� v�","Ng� H�nh Tr�n S�","B�ch Thi�n Th�nh"}
--2008-06-12�����
Npc_name_city = "<color=green>M�t th�m ��i T�ng T�y V�c<color>: "
TaskID_miss_login_diff = 1426
--end
Stage_count = getn(Tb_stage_npc_name)
Stage_info = {}
for i = 1,Stage_count do
	--�ؿ���Ϣ
	Stage_info[i] = {}
	--�ؿ�������Ϣ
	Stage_info[i] .Timmer_function = {}
end
--ÿ��ʱ�������������
Tb_stage_time_bar_num = {2,4,2,2,2,3}
--С����������
Tb_devil_num_max = {0,20,20,40,25,20}
--����������ع�������
	--����ؿ���͵ȼ�
	Stage_player_level_min = 85
	--������������
	team_member_chk = {3,5}
	--����ؿ���PK���ֵ
	Mission_PK_max = 3
	--ÿ�ܽ���⿨�Ĵ�������
	Mission_week_seq_TaskID = 1422
	Mission_login_times_TaskID = 1423
	Mission_login_times_per_week = 10
	--��������
	Tb_route_name = {
		[0] = "Ch� tr�ng",
		[1] = "Thi�u L�m",
		[2] = "Thi�u L�m t�c gia",
		[3] = "Thi�u L�m thi�n t�ng",
		[4] = "Thi�u L�m v� t�ng",
		[5] = "���ng M�n",
		[6] = "���ng M�n",
		[7] = "Nga My",
		[8] = "Nga My ph�t gia",
		[9] = "Nga My t�c gia",
		[10] = "C�i Bang",
		[11] = "C�i Bang T�nh y",
		[12] = "C�i Bang � Y",
		[13] = "V� �ang",
		[14] = "V� �ang ��o gia",
		[15] = "V� �ang t�c gia",
		[16] = "D��ng M�n",
		[17] = "D��ng M�n th��ng K�",
		[18] = "D��ng M�n Cung K�",
		[19] = "Ng� ��c",
		[20] = "T� hi�p",
		[21] = "C� s�",
	}
--npc����
for i = 1,6 do
	Stage_info[i].npc_name = "<color=green>"..Tb_stage_npc_name[i].."<color>: "
end
--����ؿ���Ҫ��taskid
Stage_info.task_ID = {2031,68,"Nhi�m v� T�y b�c-Ho�ng Sa L�c M�c"}
--npc���Ի�
Stage_info[1].main_dialog = {Stage_info[1].npc_name.."Ng��i l� ai? ��t n�y c� d� th�, v� c�ng nguy hi�m, n�u kh�ng c� vi�c g� th� mau mau �i �i.",
							Stage_info[1].npc_name.."C� D��ng Th� b� d��c l�c c�a h�a luy�n kim ��n l�m tr�i d�y t�nh kh� hung �c, tr�n t�i n�i ��y, xem ra n� �ang h�ng ch�u m�i v� �au kh�."	
							}
Stage_info[1].no_task_dialog = Stage_info[1].npc_name.."Ng��i l� ai? <color=yellow>C� D��ng d� th�<color> �� xu�t hi�n, t�m th�i phong t�a ��ng n�y, n�i ��y r�t nguy hi�m, n�u kh�ng c� vi�c g� th� mau �i �i."					--������ʱ��ĶԻ�
Stage_info[1].finish_task_dialog = Stage_info[1].npc_name.."V� c�ng c�m k�ch b�ng h�u t��ng tr�, C� D��ng th� �� b� thu ph�c, trong M�t ��ng t�m th�i kh�ng kh�c th��ng. N�u C� D��ng th� l�i c� h�nh ��ng kh�c l�. Xin nh� b�ng h�u gi�p ��!"
Stage_info[1].stage_name = "C� D��ng M�t ��ng"											--stage����
Stage_info[1].ground_sel_dialog = {
	{Stage_info[1].npc_name.."N�u nay c� h�o ki�t thu ph�c C� D��ng d� th�, nh� ng��i ��n ��y th� m�t phen?",Stage_info[1].npc_name.."N�u nay c� <color=yellow>5<color> ��i nh�n m� th� thu ph�c C� D��ng d� th�, �� �� s�c ��i ph�. Xin ��i m�t l�t."},
	{Stage_info[1].npc_name.."R�t nhi�u cao th� t�m ���c B�ch Dao Thanh T�m ��n, nh�ng mu�n C� D��ng Th� ngoan ngoan ph�c d�ng e r�ng ph�i t�n c�ng s�c. Ng��i mu�n ��n �� kh�ng?",Stage_info[1].npc_name.."S� ng��i ��n C� D��ng ��ng �� ��y, khi kh�c h�y quay l�i!"},
}
Stage_info[1].log_in_dialog = {"Ta ph�i d�t ��i �i thu ph�c C� D��ng th�","Ta mu�n d�n ��i c�u C� D��ng Th�",}
Stage_info[1].map ={{1100,1200},{1300,1400,1500}}								--������5���ؿ���Ӧ��map_id 
--��������
Stage_info[1].stage_background =  {	Stage_info[1].npc_name.."<color=yellow>C� D��ng ��ng<color> nghe ��n c� <color=yellow>D� th�<color> tr�n th�. C� D��ng th� tuy c� s�c m�nh phi th��ng, nh�ng c�ng ch� � ��ng. T�n ph�n �� <color=yellow>Phi Th��ng ��o Nh�n<color>l�ng d� hi�m �c, � mu�n l�i d�ng th� n�y g�y h�a cho nh�n gian. C� D��ng th� ph�c d��i H�a luy�n Kim ��n �� tr� n�n hung �c, ta nh�n l�nh s� ph� t�m th�i phong �n trong M�t ��ng, nh�ng l�i b� th��ng n�n ch�a th� di�t tr� qu�i th�. Nh�ng nh�t ��nh ph�i di�t tr� n�...",
																Stage_info[1].npc_name.."<color=yellow>C� D��ng Th�<color> tr��c �� b� thu ph�c, l�c d�n v� C�n L�n �� thoi th�p. ���c <color=green>Mai s� th�c<color> ch�a tr�. <color=green>Mai s� th�c<color> ��a ph�n l�n h�a luy�n kim ��n v�o trong ng��i linh th�, gi� l�i C�n L�n �� h�p thu tinh hoa tr�i ��t. Kh�ng �� <color=yellow>C� D��ng Th�<color> r�i v�o T�a Y�u Th�p, y�u kh� trong th�p c� th� khi�n linh th� b�c ph�t t�nh kh� hung d�, <color=yellow>C� D��ng Th�<color> d��ng nh� �ang ph�i ch�u s� �au ��n t�t c�ng, ch�a s�t th��ng m�t ai �� l�n tr�n v�o trong ��ng n�y."
									}
Stage_info[1].stage_condition = {	Stage_info[1].npc_name.."C� D��ng d� th� uy l�c v� song, c�n <color=yellow>3 ��n 5 ng��i c�a c�c m�n ph�i kh�c<color> h�p l�c m�i c� th� thu ph�c. N�u �� bi�t r� g�c t�ch c�a C� D��ng d� th�, c� th� t�m hi�u c�ch thu ph�c n� qua <color=yellow>s� huynh Di�p T� Thu<color> c�a b�n ph�i, mang t�n v�t c�a s� huynh <color=yellow>C�n L�n Tr�n Y�u ph�<color> v� <color=yellow>��o M�c Ki�m<color> t�i, ta s� y�n t�m �� ng��i v�o ��ng thu ph�c d� qu�i.",
															Stage_info[1].npc_name.."C� D��ng Th� t�nh kh� ph�t t�c, n�u mu�n c�u n� c�n:\n  <color=green>1<color>. <color=yellow>��i tr��ng t� ��i 3-5 ng��i<color>, <color=red>t�t c� th�nh vi�n <color> c�n l�m <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>\n  <color=green>2<color>. Tr�n ng��i ��i tr��ng ph�i c� <color=yellow>B�ch Dao Thanh T�m ��n<color>.\n  <color=green>3<color>. Trong ��i kh�ng ���c c� ng��i <color=yellow>v� c�ng l�u ph�i gi�ng nhau<color>."}					--�ؿ��ı�������
Stage_info[1].task_goods = {
	{	
		{2,0,704,1,"C�n Lu�n tr�n y�u ph�"},
		{2,0,759,1,"C�n Lu�n ��o m�c ki�m"},
	},
	{	
		{2,0,1031,1,"B�ch Dao Thanh T�m ��n"},
	}
}	--������Ҫ��Ʒ
Stage_info[1].task_ID = {2032,17}													--����ʱ��Ӧ��ID
Stage_info[1].in_coordinate = {1584,3223}											--�����Ӧ����
Stage_info[1].out_coordinate = {512,2061,3414}										--�����ĵ�ͼ������
Stage_info[1].cannot_log_reason = {
	{	Stage_info[1].npc_name.."C� D��ng Th� uy l�c kinh ng��i, s�c m�t ng��i kh�ng th� ��i ph�, c�n ph�i d�n theo <color=yellow>3-5 ng��i luy�n theo h��ng kh�c nhau v� ���c ��i tr��ng d�n d�t<color> h�n ��n ��y!",
		Stage_info[1].npc_name.."C� D��ng d� th� uy l�c ��ng s�, ta ���c ��i s� b�n ph�i d�n d�, � ��y phong t�a ��ng huy�t, kh�ng cho ai ��n g�n, tr�nh l�m b� th��ng ng��i v� t�i. N�u ng��i kh�ng �i t�m s� huynh <color=yellow>Di�p T� Thu<color>, t�m hi�u c�ch thu ph�c d� qu�i, mang theo t�n v�t <color=yellow>��o M�c Ki�m<color> v� <color=yellow>Tr�n Y�u ph�<color> thu ph�c C� D��ng th� c�a s� huynh r�i t�i th� xem th� n�o!",
		Stage_info[1].npc_name.."C� D��ng Th� uy l�c v� song <color=yellow>n�u ��ng ��i ch�a bi�t th�c l�c c�a linh th�<color>, ngang nhi�n x�ng v�o, e r�ng nguy hi�m ��n t�nh m�ng, khuy�n ng��i mau mau r�i kh�i.",
		Stage_info[1].npc_name.."C�n ph�i c� <color=yellow>ng��i v� c�ng tinh th�ng c�c m�n ph�i kh�c nhau<color> hi�p l�c h�p t�c m�i c� th� quy ph�c C� D��ng th�, n�u kh�ng ng��i ph�i l�m th� n�o?"
	},
	{	Stage_info[1].npc_name.."C� D��ng Th� hi�n r�t hung bao, ph�i h�p s�c <color=yellow>3-5 ng��i<color>. (Nh�c nh�: ",
		Stage_info[1].npc_name.."C� D��ng Th� b� k�ch th�ch d��c l�c trong ng��i, Mai s� th�c c�n d�n c�n d�ng <color=yellow>B�ch Dao Thanh T�m ��n<color> t� t� h�a gi�i d��c l�c trong ng��i m�i ���c.",
		Stage_info[1].npc_name.."C�c ng��i ch�a bi�t r� lai l�ch c�a C� D��ng Th�, t�t nh�t kh�ng n�n v�o trong. (Nh�c nh�: <color=yellow>Th�nh vi�n trong ��i ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>)",
		Stage_info[1].npc_name.."C� D��ng Th� r�t hung b�o, <color=yellow>ph�i bi�t v� c�ng c�a c�c m�n ph�i kh�c nhau<color>, ��ng t�m h�p s�c m�i c� th� chi�n th�ng."
	},
	{	Npc_name_city.."Mu�n ��nh b�i <color=yellow>C� D��ng Th�<color> v�i s�c l�c c�c ng��i e r�ng kh�ng ��, mau k�u ��i tr��ng d�n theo <color=yellow>3-5 ng��i c�p 85 tr� l�n<color> m�i mong ch� ng� n�i t�nh hung b�o c�a <color=yellow>C� D��ng Th�<color>.",
		Npc_name_city.."<color=yellow>C� D��ng Th�<color> t�nh kh� b�t th��ng, nh�ng <color=green>Mai B�t Dung<color> �� luy�n ch� ra <color=yellow>B�ch Dao Thanh T�m ��n<color> c� th� gi�m t�nh hung bao c�a <color=yellow>C� D��ng Th�<color>, n�u c�c ng��i kh�ng c� <color=yellow>B�ch Dao Thanh T�m ��n<color> th� ��ng mi�n c��ng. T�i sao <color=yellow>C� D��ng Th�<color> l�i nh� v�y �? �i! Ph�i ��n <color=yellow>C� D��ng ��ng<color> �i�u tra th�i.",
		Npc_name_city.."H�nh nh� c�c ng��i ch�a �i h�t T�y v�c, ch�a t�m hi�u k� n�i ��. Ta e ���ng ��n C� D��ng ��ng c�c ng��i c�n kh�ng bi�t, l�m xong <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color> h�n ��n ��y.",
		Npc_name_city.."Trong ��i c� ng��i v� c�ng <color=yellow>l�u ph�i gi�ng nhau<color>, kh�ng th� ��i ph� v�i <color=yellow>C� D��ng Th�<color>.",
	},
}		--�޷�����ؿ���ԭ��Ի�
Stage_info[1].boss_chat = {			--boss����
	"�i th�i! N�u kh�ng ng��i s� g�p ph�i n�i kh� nh� ta�",
	"Nh�ng sinh linh d�i d�t, l�m sao c� th� v��t qua t� nhi�n!",
	"�i th�i! N�u kh�ng b� nu�t ch�ng b�y gi�!",
	"R�i kh�i ��y th�i m�i ng��i, sau n�y ��ng bao gi� ��t ch�n ��n ��y n�a!",
	"�i nhanh!... Ng��i v�n kh�ng n�n t�i ��y!",
}
Stage_info[1].stage_start_msg ="Ng��i ng�a �� v�o C� D��ng M�t ��ng, C� D��ng th� s� t�nh l�i trong sau 1 ph�t, m�i ng��i chu�n b� t� th� s�n s�ng ngh�nh chi�n."
Stage_info[1].stage_start_talk = "Do m�t s� tia s�ng c�a kho�ng th�ch ph�t ra, khi�n trong ��ng �nh l�n m�u �� nh� m�u. Xung quanh hoang t�n �� n�t, x�c ng��i ch�t ��ng, b�t lu�n <color=yellow>Ng��i ��o kho�ng th�n b�<color> hay <color=yellow>Li Long H�a H�<color> b�n ngo�i ��u th�y ���c v�t t�ch ��. B�n ng��i t�m b�o v�t mu�n x�ng v�o trong ��ng nh�ng h� kh�ng ng� r�ng <color=yellow>C� D��ng Th�<color> b� <color=yellow>h�a luy�n kim ��n<color> d�y v�, tr� n�n hung �c, <color=yellow>C� D��ng Th�<color> nh�p v�o nh�ng ai x�m ph�m. C�ng nhi�u sinh v�t trong ��ng c�ng thu h�t nhi�u <color=yellow>Huy�t Ma Nh�n<color>."
Stage_info[1].boss_crt_msg = " C� D��ng Th� tr�n th� M�t ��ng �� hi�n th�n! Ph�i ti�u di�t ���c n� trong 30 ph�t, n�u kh�ng h�nh ��ng l�n n�y s� th�t b�i. "
Stage_info[1].stage_end_msg = "H�nh ��ng thu ph�c C� D��ng Th� l�n n�y �� ho�n th�nh, sau �� s� ��a c�c v� ��n b�n ngo�i M�t ��ng. Xin ��ng n�ng. "
Stage_info[1].stage_start_time_bar = "C� D��ng Th� hi�n th�n (��m ng��c)"
Stage_info[1].boss_crt_time_bar = "Thu ph�c C� D��ng Th� (��m ng��c)"
Stage_info[1].stage_end_time_bar = "Khu v�c ���c d�n ��n, (��m ng��c)"
---------------------------------------------------�����ķָ���---------------------------------------
Stage_info[2].main_dialog = {Stage_info[2].npc_name.."To gan! ��ng l�i. ��y l� Ho�ng L�ng M�t ��o, ng��i l� kh�ng ���c ��n g�n, n�u kh�ng s� b� Tr�n M� Linh Th� tr�ng ph�t nghi�m!",
							Stage_info[2].npc_name.."To gan! B�n trong ��y r�y c�m b�y, n�u mu�n s�ng h�y mau ch�ng r�i kh�i!"	
							}
Stage_info[2].no_task_dialog = 	Stage_info[2].npc_name.."To gan! ��ng l�i. ��y l� Ho�ng L�ng M�t ��o, ng��i l� kh�ng ���c ��n g�n, n�u kh�ng s� nh�n ���c h�u qu� kh�n l��ng. "					--������ʱ��ĶԻ�
Stage_info[2].finish_task_dialog = Stage_info[2].npc_name.."Ai ��m ti�u di�t Tr�n M� Linh Th�! Nh�n l�c ta ch�a n�i gi�n, mau c�t �i, n�u kh�ng th�n h�n ng�n n�m ta ��y s� kh�ng bu�ng tha. "
Stage_info[2].stage_name = "Ho�ng L�ng M�t ��o"											--stage����
Stage_info[2].ground_sel_dialog = {
	{Stage_info[2].npc_name.."��ng l�i! Ph�a tr��c c� Tr�n M� Linh Th� canh gi�, c��ng quy�t v�o M�t ��o ch� c� ch�t!",Stage_info[2].npc_name.."��ng l�i! Ph�a tr��c c� Tr�n M� Linh Th� canh gi�, c�c ���ng �i v�o M�t ��o �� ��ng. "},
	{Stage_info[2].npc_name.."C� b�n l�nh th� c� m� xem Tr�n M� Linh Th� c� tha ng��i kh�ng!",Stage_info[2].npc_name.."C� quan chuy�n ��ng, phong t�a m�t ��o."},
}
Stage_info[2].log_in_dialog = {"Ta ph�i d�n ��ng ��i �i ti�u di�t Tr�n M� Th�. ","Ta ph�i d�n ��ng ��i �i ti�u di�t Tr�n M� Th�. ",}
Stage_info[2].map = {{1101,1201},{1301,1401,1501}}									--������5���ؿ���Ӧ��map_id
Stage_info[2].stage_background = {	Stage_info[2].npc_name.."N�i ��y v�n d� long m�ch, xung quanh b� tr� theo h�nh c�u cung, tr�n d��i 2 t�ng, c� Tr�n M� Linh Th� canh gi�, ngang nhi�n x�ng v�o �t gi�t kh�ng tha!",
																Stage_info[2].npc_name.."N�i ��y v�n d� long m�ch, xung quanh b� tr� theo h�nh c�u cung, tr�n d��i 2 t�ng, c� Tr�n M� Linh Th� canh gi�, ngang nhi�n x�ng v�o �t gi�t kh�ng tha!"
									}
Stage_info[2].stage_condition = {	Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m, ngang nhi�n x�ng v�o �t gi�t kh�ng tha! N�u c� ai d�n theo <color=yellow>3-5 ng��i<color> x�ng v�o ��y v� ph� 4 huy�t phong th�y, Tr�n M� Linh Th� s� tr�ng tr� h�. Nh�ng ch�ng kh�ng gi�t 1,2 ng��i x�ng v�o, ch�a ph� 4 huy�t phong th�y, <color=yellow>kh�ng gi�t nh�ng ng��i c� v� c�ng l�u ph�i gi�ng nhau<color>",
															Stage_info[2].npc_name.."Tr�n M� Linh Th� ch� t�n c�ng t� <color=yellow>3-5 ng��i c� v� c�ng l�u ph�i kh�c nhau<color>, c� quan m�t ��o �� m�, n�u c� b�n l�nh m� m�t ��o �� kh�a, linh th� s� kh�ng tha."}					--��������
Stage_info[2].task_goods = {
	{},
	{	
		{2,0,1032,1,"H�i Long s�ch"}
	}
}												--������Ҫ��Ʒ
Stage_info[2].task_ID = {2031,25}												--����ʱ��Ӧ��ID
Stage_info[2].in_coordinate = {1599,3224}										--�����Ӧ����
Stage_info[2].out_coordinate = {513,1591,3192}									--�����ĵ�ͼ������
Stage_info[2].cannot_log_reason = {	--�޷�����ؿ���ԭ��Ի�
	{	Stage_info[2].npc_name.."Tr�n M� Linh Th� kh�ng t�n c�ng 1,2 ng��i, c�n kh�ng mau r�i kh�i! Nh�ng n�u c� t� <color=yellow>3-5 ng��i x�ng v�o<color>, linh th� s� kh�ng tha.",
		Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! ",
		Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! <color=yellow>Nh�ng ai kh�ng bi�t ��y l� m� c�a ta m� v� t�nh x�ng v�o, ta s� tha t�i ch�t<color>, c�n kh�ng mau r�i kh�i!",
		Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! <color=yellow>(Nh�c nh�: Trong ��i c� ng��i c�ng m�n ph�i, kh�ng ���c v�o Ho�ng L�ng M�t ��o.<color>",
		},
	{	Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! Tr�n M� Linh Th� ch� t�n c�ng <color=yellow>3 -5 ng��i<color> ngang nhi�n x�ng v�o. (Nh�c nh�: ",
		Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! (Nh�c nh�: mu�n ph� c� quan b�n trong, c�n ph�i d�ng <color=yellow>H�i Long S�ch<color> c�a k� c��p m�)",
		Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! Nh�c nh�: <color=yellow>Th�nh vi�n trong ��i c�n ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>)",
		Stage_info[2].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m! (Nh�c nh�: Th�nh vi�n trong ��i <color=yellow>v� c�ng l�u ph�i kh�ng ���c gi�ng nhau<color>)",
		},
	{	Npc_name_city.."<color=yellow>Tr�n M� Th�<color> canh gi� m�t ��o, mu�n ��i ph� <color=yellow>Tr�n M� Th�<color> c�n ��i tr��ng m�i t� <color=yellow>3-5 ng��i c�p 85 tr� l�n<color>, n�u kh�ng ch� c� ch�t trong ��y.",
		Npc_name_city.."Qua �i�u tra <color=yellow>Ho�ng L�ng m�t ��o<color> li�n th�ng v�i Ho�ng L�ng t�ng 1,2, nh�ng c� quan �� b� ph�, mu�n m� ph�i c� <color=yellow>H�i Long S�ch<color>, c�c ng��i th� �i t�m nh�ng t�n c��p m� h�i th�.",
		Npc_name_city.."H�nh nh� c�c ng��i ch�a �i h�t T�y v�c, ch�a t�m hi�u k� n�i ��. <color=yellow>Tr�n M� Th�<color> trong <color=yellow>Ho�ng L�ng m�t ��o<color> kh�ng d� ��i ph�, c�c ng��i ho�n th�nh <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color> h�n ��n ��y.",
		Npc_name_city.."Trong ��i c� th�nh vi�n v� c�ng l�u ph�i gi�ng nhau, kh�ng th� ��i ph� <color=yellow>Tr�n M� Th�<color>.",
	},
}	
Stage_info[2].boss_chat = {
	"Ta ��y tr�n gi� n�i ��y, ai d�m l�m c�n! ",
	"B�n ng��i ngu mu�i kia, �� ta ti�n c�c ng��i xu�ng su�i v�ng! ",
	"Ph�m nh�ng ai kh�ng bi�t, ��ng b��c v�o!. ",
	"Ta cho d� c� ch�t c�ng tr�n gi� � ��y!",
	"H�n ph�ch c�c ng��i �ang run s� tr��c ta! ",
}
Stage_info[2].stage_start_msg ="Nh�m ng��i ng�a c�c b�n �� v�o Ho�ng L�ng M�t ��o, Tr�n M� Th� tr�n gi� M�t ��o s� t�nh l�i sau 1 ph�t n�a �� truy �u�i nh�ng ng��i v�o m�, m�i ng��i ph�i lu�n trong t� th� chi�n ��u!"
Stage_info[2].stage_start_talk = "<color=yellow>H�i Long S�ch<color> qu� nhi�n l� l�i h�i. Tuy m�t ��o th�ng v�i t�ng tr�n t�ng d��i, nh�ng <color=green>T�n Th�y Ho�ng<color> v�n kh�ng l� l�. <color=yellow>Tr�n M� Th�<color> l�n Ho�ng L�ng c�n nhi�u �i�u huy�n b�. Xem ra <color=yellow>Tr�n M� Th�<color> d� d�ng ��i ph� gi�ng nh� m�t ��o l�m m� ho�c nh�ng k� c��p m�. <color=yellow>Tr�n M� Th�<color> canh gi� l�ng m� tr�ng ��a, v�i t�nh c�ch c�a <color=green>T�n Th�y Ho�ng<color> sao kh�ng l�p ��t c� quan!? <color=yellow>Tr�n M� Th�<color> v� c� quan trong m� nh�t ��nh c� li�n quan v�i nhau."
Stage_info[2].boss_crt_msg = "Tr�n M� Th� �� xu�t hi�n! Trong v�ng 30 ph�t ph�i ti�u di�t ���c n�, n�u kh�ng h�nh ��ng v�o L�ng m� l�n n�y s� th�t b�i. "
Stage_info[2].stage_end_msg = "L�n thu ph�c Tr�n M� Th� n�y �� k�t th�c. Xin ��i gi�y l�t s� d�n c�c v� ra ngo�i M�t ��o. "
Stage_info[2].stage_start_time_bar = "Tr�n M� Th� xu�t hi�n (��m ng��c)"
Stage_info[2].boss_crt_time_bar = "��nh b�i Tr�n M� Th� (��m ng��c)"
Stage_info[2].stage_end_time_bar = "Khu v�c ���c d�n ��n, (��m ng��c)"
---------------------------------------------------Ʈ�ݵķָ���---------------------------------------
Stage_info[3].main_dialog = {Stage_info[3].npc_name.."N�i ta y�n ngh�, kh�ng ���c x�m ph�m, ngang nhi�n x�ng v�o �t gi�t kh�ng tha!",
							Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha!"	
							}
Stage_info[3].no_task_dialog = 	Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha!"
Stage_info[3].finish_task_dialog = Stage_info[3].npc_name.."Mau r�i kh�i ��y, s� ng��i ch�a t�n! N�u c�n quay l�i l� t� t�m ���ng ch�t, kh�ng g�p may nh� v�y n�a ��u! "
Stage_info[3].stage_name = "Ho�ng L�ng m� th�t"											--stage����
Stage_info[3].ground_sel_dialog = {
	{Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha!",Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha!"},
	{Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o Qu� T��ng Qu�n gi�t kh�ng tha!",Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t ph�i tr� gi�, c�a m�t th�t �� ��ng, kh�ng ai c� th� m� ra!"},
}
Stage_info[3].log_in_dialog = {"Ta ph�i d�n ��ng ��i �i ti�u di�t Qu� T��ng ��u","Ta ph�i d�n ��ng ��i �i ti�u di�t Qu� T��ng ��u",}
Stage_info[3].map = {{1102,1202},{1302,1402,1502}}									--������5���ؿ���Ӧ��map_id
Stage_info[3].stage_background = {Stage_info[3].npc_name.."N�i ��y v�n d� long m�ch, c�t gi� nhi�u ch�u b�u qu� hi�m, v�ng b�c nhi�u v� s� k�! C� Tr�n m� t��ng qu�n canh gi�, Qu� T��ng Qu�n nghi�m ng�t b�o v�, canh gi� kho b�u.",
									Stage_info[3].npc_name.."N�i ��y v�n d� long m�ch, c�t gi� nhi�u ch�u b�u qu� hi�m, v�ng b�c nhi�u v� s� k�! N�u ai �� ngang nhi�n x�m ph�m, Qu� T��ng Qu�n s� tr�ng tr� h�."
									}
Stage_info[3].stage_condition = { 					--��������
	Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! Nh�ng <color=yellow>Qu� T��ng Qu�n kh�ng gi�t 1,2 ng��i x�m ph�m, kh�ng gi�t nh�ng ai c� v� c�ng l�u ph�i gi�ng nhau<color>",
	Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! Qu� T��ng Qu�n kh�ng gi�t 1,2 ng��i x�m ph�m, c�n kh�ng mau r�i kh�i!"
}
Stage_info[3].task_goods = {
	{},
	{
		{2,0,1033,1,"To�i Th�ch Ch�n"}
	}
}												--������Ҫ��Ʒ
Stage_info[3].task_ID = {2031,27}												--����ʱ��Ӧ��ID
Stage_info[3].in_coordinate = {1590,3230}										--�����Ӧ����
Stage_info[3].out_coordinate = {514,1728,2869}									--�����ĵ�ͼ������
Stage_info[3].cannot_log_reason = {
	{
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! Qu� T��ng Qu�n kh�ng t�n c�ng 1,2 ng��i. <color=yellow>n�u d�m d�n theo t� 3-5 ng��i<color>, Qu� T��ng Qu�n s� kh�ng tha.",
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o ��y gi�t �t kh�ng tha! Kh�n h�n mau r�i kh�i ��y! ",
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! Nh�ng ai kh�ng bi�t, v� t�nh x�m ph�m <color=yellow>nhanh ch�ng r�i kh�i n�i ��y.<color>",
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o ��y gi�t �t kh�ng tha! Kh�n h�n mau r�i kh�i ��y! <color=yellow>(Nh�c nh�: Trong ��i c� ng��i c�ng chuy�n m�n kh�ng ���c v�o Ho�ng L�ng M�t ��o)<color>",
	},
	{
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! Qu� T��ng Qu�n ch� ��i ph� t� <color=yellow>3-5 ng��i<color> (Nh�c nh�: ",
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! Nh�c nh�: Tr�n ng��i ��i tr��ng ph�i c� <color=yellow>To�i th�ch ch�n<color>)",
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! (Nh�c nh�: <color=yellow>Th�nh vi�n trong ��i c�n ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>)",
		Stage_info[3].npc_name.."Ngang nhi�n x�ng v�o �t gi�t kh�ng tha! (Nh�c nh�: Th�nh vi�n trong ��i <color=yellow>v� c�ng l�u ph�i kh�ng ���c gi�ng nhau<color>)",
	},
	{	Npc_name_city.."<color=yellow>Qu� T��ng Qu�n<color> l�c c�n s�ng theo ph� T�n Th�y Ho�ng nam chinh b�c ph�t, nh�t th�ng thi�n h�, sau khi T�n Th�y Ho�ng ch�t c�ng ch�n theo, c�c ng��i ngang nhi�n x�ng v�o, n�u trong ��i kh�ng c� t� <color=yellow>3-5 ng��i c�p 85 tr� l�n<color> th� sao ��nh l�i qu� v��ng.",
		Npc_name_city.."Th�ch m�n c�a <color=yellow>Ho�ng L�ng m�t th�t<color> �� ��ng, <color=yellow>To�i th�ch ch�n<color> c� th� ph� h�y m�t l�i nh� �i v�o, c�c ng��i mu�n v�o b�n trong ph�i mang theo <color=yellow>To�i th�ch ch�n<color>.",
		Npc_name_city.."H�nh nh� c�c ng��i ch�a �i h�t T�y v�c, ch�a t�m hi�u k� n�i ��. Uy l�c c�a <color=yellow>Qu� T��ng Qu�n<color> e r�ng c�c ng��i ch�a th�y, mau ho�n th�nh <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color> h�n ��n ��y.",
		Npc_name_city.."Trong ��i c� th�nh vi�n <color=yellow>v� c�ng l�u ph�i gi�ng nhau<color>, nh� v�y s� m�t �i c� h�i ��i ph� v�i <color=yellow>Qu� T��ng Qu�n<color>.",
	}
}	--�޷�����ؿ���ԭ��Ի�
Stage_info[3].boss_chat = {
	"Kho b�u vua ta, ai d�m ��o tr�m?",
	"Ng��i tham lam v� tri ��u ph�i ti�u tan tr��c b�n t��ng l�nh! ",
	"d�m qu�y r�y n�i ta y�n ngh�, gi�t kh�ng th�! ",
	"�� ta ti�n c�c ng��i xu�ng �m t�o ��a ph�! ",
	"Ta s� tr�ng ph�t nh�ng k� d�m v�o m�! ",
}
Stage_info[3].stage_start_msg ="Nh�m ng��i ng�a c�c ng��i �� v�o Ho�ng L�ng M�t ��o, Qu� T��ng ��u s� t�nh l�i trong v�ng 1 ph�t n�a �� truy s�t nh�ng ai x�ng v�o m�, c�c ng��i ph�i lu�n trong tr�ng th�i chi�n ��u! "
Stage_info[3].stage_start_talk = "Sau khi d�ng <color=yellow>To�i th�ch ch�n<color>, tr��c khi v�o m�t th�t, kh�ng ngh� n�i ��y c� c�m b�y, T�n Th�y Ho�ng c�ng cho r�ng v�i s�c m�nh c�a <color=yellow>Qu� T��ng Qu�n<color> �� �� b�o v� l�ng m�. Tuy m�t th�t kh�ng ��t c� quan, nh�ng �� x�m ph�m v�o m� T�n Th�y Ho�ng, theo quy t�c c�a k� c��p m� ph�i � <color=yellow>g�c ��ng nam<color> ��t m�t c�y <color=yellow>��n c�y<color>. Nh�ng v�i uy l�c c�a <color=yellow>Qu� T��ng Qu�n<color> e r�ng l�nh �t d� nhi�u."
Stage_info[3].boss_crt_msg = "Qu� T��ng ��u �� xu�t hi�n! Trong v�ng 30 ph�t ph�i ti�u di�t ���c n�, n�u kh�ng h�nh ��ng l�n n�y s� th�t b�i."
Stage_info[3].stage_end_msg = "L�n thu ph�c Qu� T��ng ��u �� ho�n th�nh. Xin ��i gi�y l�t s� d�n c�c v� ra b�n ngo�i m�t ��o. "
Stage_info[3].stage_start_time_bar = "Qu� T��ng ��u xu�t hi�n (��m ng��c)"
Stage_info[3].boss_crt_time_bar = "��nh b�i Qu� T��ng ��u ��m ng��c"
Stage_info[3].stage_end_time_bar = "Khu v�c ���c d�n ��n, (��m ng��c)"
---------------------------------------------------�����ķָ���---------------------------------------
Stage_info[4].main_dialog = {	
	Stage_info[4].npc_name.."Ng��i l� ai? D��c V��ng ��ng l� l�nh ��a c�a D��c V��ng ch� nh�n ta, ng��i l� kh�ng ���c b��c v�o. Luy�n ��n ��ng l� c�m ��a, ai mu�n v�o ph�i b��c qua x�c cu� ta! ",
	Stage_info[4].npc_name.."Ng��i l� ai? D��c V��ng ch� nh�n ta g�i ta l� D��c Nh�n th�ng minh, canh gi� Luy�n ��n ��ng! Ch� nh�n ta s�p luy�n th�nh �ao th��ng b�t nh�p, sao ng��i c� th� ��nh l�i."	
							}
Stage_info[4].no_task_dialog = 	Stage_info[4].npc_name.."Ng��i l� ai? D��c V��ng ��ng l� l�nh ��a c�a D��c V��ng ch� nh�n ta, kh�ng ���c b��c v�o, mau quay v�, ch� nh�n ta s� kh�ng truy c�u. L�c ra kh�ng ���c ��ng v�o b�t c� th�o d��c n�o trong ��ng! "
Stage_info[4].finish_task_dialog = Stage_info[4].npc_name.."Ta nh�n ra ng��i r�i, ��n ��y l�m g�? Mau c�t �i, ��ng h�ng l�a ���c ta! "
Stage_info[4].stage_name = "Luy�n ��n ��ng"											--stage����
Stage_info[4].ground_sel_dialog = {
	{Stage_info[4].npc_name.."D��c V��ng ��ng l� l�nh ��a c�a D��c V��ng ch� nh�n ta, Luy�n ��n ��ng l� c�m ��a, mau c�t �i, n�u kh�ng h�u qu� kh�n l��ng. ",Stage_info[4].npc_name.."D��c V��ng ��ng l� l�nh ��a c�a D��c V��ng ch� nh�n ta, Luy�n ��n ��ng l� c�m ��a, ch� nh�n ta �� tr� v� r�i, kh�ng ���c b��c v�o Luy�n ��n ��ng. Ng��i l� ai? D�m gi� m�o l� ch� ta!",},
	{Stage_info[4].npc_name.."Luy�n ��n ��ng v�n l� c�m ��a, ta l� D��c Nh�n th�ng minh, th�ch m�n n�y ta ��y kh�ng l�n, ng��i c� gi�i th� h�y ��y cho ta xem!",Stage_info[4].npc_name.."Luy�n ��n ��ng v�n l� c�m ��a, ta nh�n ra ng��i, ��ng h�ng v�o trong."},
}
Stage_info[4].log_in_dialog = {"Ta mu�n d�n theo ��ng ��i v�o Luy�n ��n ��ng. ","Ta mu�n d�n theo ��ng ��i v�o Luy�n ��n ��ng. "}
Stage_info[4].map = {{1103,1203},{1303,1403,1503}}									--������5���ؿ���Ӧ��map_id
Stage_info[4].stage_background = {Stage_info[4].npc_name.."D��c V��ng ch� nh�n ta l� ng��i r�t th�ng minh, trong D��c V��ng ��ng c� mu�n v�n k� hoa d� th�o. Luy�n ��n ��ng l� c�m ��a, b�t c� ai c�ng kh�ng ���c, ��ng h�ng gi� m�o ch� nh�n qua m�t ta!. ",
									Stage_info[4].npc_name.."Trong D��c V��ng ��ng ch�t ��y d��c li�u, hoa c� l� tr�ng kh�p n�i, l� n�i th�n ti�n d�nh t�ng cho D��c V��ng. Kh�ng bi�t ng��i n�o d�m h�y m�t n�a s� hoa c� trong ��ng, may ch� nh�n l�n gi�u �i D��c Nh�n Th�o, �� sau n�y d�ng ��n. Ta ph�ng m�nh canh gi� n�i ��y, ch� c� ta m�i m� ���c c�nh c�a n�y."
									}
Stage_info[4].stage_condition ={ 						--��������
	Stage_info[4].npc_name.."D��c V��ng ch� nh�n ta l� ng��i anh minh nh�t, D��c V��ng ��ng v� Luy�n ��n ��ng l� c�m ��a c�a ng��i, ta ph�ng m�nh tr�n gi� � ��y, kh�ng d� d�ng g� b� qua m�t ��u! Cho n�n <color=yellow>Ng��i d�n 3-5 ng��i ��n l�m lo�n<color>, D��c V��ng ch� nh�n ta s� kh�ng tha! <color=yellow>Kh�ng bi�t th� kh�ng c� t�i<color>, mau �i tr��c khi ta ��i �!",
	Stage_info[4].npc_name.."\n1. ��i tr��ng d�n theo <color=yellow>3-5 ng��i<color>, <color=red>t�t c� th�nh vi�n<color> ��u ph�i <color=yellow>ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>).\n2. ��i tr��ng mang theo <color=yellow>T�ch D��ng Tinh Hoa<color>, <color=yellow>T�ch D��ng Tinh Hoa<color> th�t l� kh�ng khi�p...\n3. Trong ��i kh�ng ���c c� <color=yellow>ng��i v� c�ng l�u ph�i gi�ng nhau<color>."
}
Stage_info[4].task_goods = {						--������Ҫ��Ʒ
	{
		{2,0,760,1,"Dung m�o D��c V��ng"}
	},
	{
		{2,0,1034,1,"T�ch D��ng Tinh Hoa"}
	}
}
Stage_info[4].task_ID = {2031,47}												--����ʱ��Ӧ��ID
Stage_info[4].in_coordinate = {1599,3218}										--�����Ӧ����
Stage_info[4].out_coordinate = {510,1573,2863}									--�����ĵ�ͼ������
Stage_info[4].cannot_log_reason = {
	{
		Stage_info[4].npc_name.."D��c V��ng ��ng l� l�nh ��a c�a D��c V��ng ch� nh�n ta, Luy�n ��n ��ng l� c�m ��a, kh�ng ���c v�o! <color=yellow>N�u ng��i d�n 3-5 ng��i ��n l�m lo�n<color>, D��c V��ng ch� nh�n ta s� ��ch th�n ra tay.",
		Stage_info[4].npc_name.."D��c V��ng ��ng l� l�nh ��a c�a D��c V��ng ch� nh�n ta, Luy�n ��n ��ng ch� c� ch� nh�n ta m�i ���c v�o, <color=yellow>Ng��i kh�ng ph�i D��c V��ng<color>, d�m g�t ta? <color=yellow>(Nh�c nh�: c� th� gi� d�ng D��c V��ng �� qua)<color>",
		Stage_info[4].npc_name.."Luy�n ��n ��ng v�n l� c�m ��a, ch� nh�n kh�ng tr�ch <color=yellow>nh�ng ai v� t�nh x�m ph�m<color>, tha cho c�c ng��i kh�ng bi�t ��y l� n�i � c�a D��c V��ng, c�n kh�ng mau r�i kh�i!",
		Stage_info[4].npc_name.."Luy�n ��n ��ng l� c�m ��a, c�c ng��i d�m ��n qu�y nhi�u? <color=yellow>C� ng��i c�ng v� c�ng l�u ph�i<color>, c�c ng�oi kh�ng ��ng �� D��c V��ng ch� nh�n ta ra tay!",
	},
	{
		Stage_info[4].npc_name.."Ta ���c ch� nh�n cho canh gi� Luy�n ��n ��ng, kh�ng c� <color=yellow>3-5 ng��i<color> th� ��ng h�ng v�o trong. (Nh�c nh�: ",
		Stage_info[4].npc_name.."H�nh nh� c�c ng��i kh�ng bi�t uy l�c c�a D��c Nh�n. (Nh�c nh�: Tr�n ng��i ��i tr��ng c�n ph�i mang theo <color=yellow>T�ch D��ng Tinh Hoa<color>)",
		Stage_info[4].npc_name.."Luy�n ��n ��ng v�n l� c�m ��a, b�n c�c ng��i kh�ng bi�t sao. (Nh�c nh�: <color=yellow>Th�nh vi�n trong ��i c�n ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>)",
		Stage_info[4].npc_name.."Trong ��i c�c ng��i c� ng��i v� c�ng l�u ph�i gi�ng nhau, ��ng h�ng g�t ta. (Nh�c nh�: Th�nh vi�n trong ��i <color=yellow>v� c�ng l�u ph�i kh�ng ���c gi�ng nhau<color>)",
	},
	{	Npc_name_city.."Ta �i�u tra ���c <color=green>D��c V��ng<color> m�i ch� ra nhi�u <color=yellow>D��c Nh�n<color> d�ng �� b�o v� �ng ta, kh� c� th� ti�p c�n, n�u ��i tr��ng m�i ���c t� <color=yellow>3-5 ng��i c�p 85 tr� l�n<color> m�i c� hy v�ng ��nh th�ng.",
		Npc_name_city.."D��c Nh�n s� nh�t l� r� c�y c�a v�ng sa m�c, t� r� c�y l�y ra <color=yellow>T�ch D��ng Tinh Hoa<color>, ch� c�n <color=yellow>D��c Nh�n Th�o<color> ch�m ph�i l� ti�u tan, nh� v�y m�y <color=yellow>D��c Nh�n<color> sao tr�nh kh�i c�i ch�t, c�c ng��i c� kh�ng?",
		Npc_name_city.."H�nh nh� c�c ng��i ch�a �i h�t T�y v�c, ch�a t�m hi�u k� n�i ��. Kh�ng n�m r� t�nh h�nh trong ��ng, c�ng kh�ng bi�t nh��c �i�m c�a D��c Nh�n Th�o, ngang nhi�n x�ng v�o ch� c� t�m c�i ch�t, c�c ng��i ho�n th�nh <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color> h�n ��n ��y.",
		Npc_name_city.."Trong ��i c�c ng��i c� ng��i <color=yellow>v� c�ng l�u ph�i gi�ng nhau<color>, sao c� th� ��i ph� v�i b�n <color=yellow>D��c Nh�n<color>?",
	},
}		--�޷�����ؿ���ԭ��Ի�
Stage_info[4].boss_chat = {
	"To gan, d�m ��n l�m c�n � Luy�n ��n ��ng, ta s� cho c�c ng��i c� �i m� kh�ng c� v�!",
	"Kh� �au, th� h�n, sinh l�o b�nh t�, thi�n h� ch�ng sinh kh�ng ch�ng l�i ���c.",
	"��n ��y r�i, ta s� thay ��i x�c th�t y�u �u�i c�a c�c ng��i!",
	"��i ta bi�n c�c ng��i th�nh D��c Nh�n, s�ng d� ch�t d�.",
	"L�u r�i kh�ng th�y nhi�u ng��i s�ng nh� th� n�y, ta s� gi�i tho�t cho c�c ng��i!",
}
Stage_info[4].stage_start_msg ="Ng��i ng�a c�c ng��i �� v�o Luy�n ��n ��ng, m�t ph�t n�a D��c V��ng s� xu�t hi�n �� b�t c�c ng��i ch� th�nh d��c nh�n, "
Stage_info[4].stage_start_talk = "D��c Nh�n canh gi� qu� nhi�n hi�u qu�. Luy�n ��n ��ng c�ng l�c c�ng nguy hi�m, ch� l� th�m v�i c�i l� luy�n ��n. M�i c�a than v� th�o d��c tr�n l�n, ng�i v�o g�y kh� ch�u. Kh�ng bi�t <color=green>D��c V��ng<color> �� nghi�n c�u ra chi�u g� m�i, <color=yellow>D��c Nh�n Th�o �� l�i h�i, nay D��c Nh�n c�n l�i h�i h�n<color>, <color=green>D��c V��ng<color> c�ng ch�a v�a l�ng. Xem ra <color=green>D��c V��ng<color> c�n tr�ng th�m nhi�u D��c Nh�n Th�o."
Stage_info[4].boss_crt_msg = "D��c V��ng c�a Luy�n ��n ��ng �� xu�t hi�n! Ph�i ti�u di�t ���c h�n trong v�ng 30 ph�t!"
Stage_info[4].stage_end_msg = "Thu ph�c D��c V��ng �� ho�n th�nh. Xin ��i gi�y l�t s� d�n c�c v� ��n b�n ngo�i Luy�n ��n ��ng."
Stage_info[4].stage_start_time_bar = "D��c V��ng xu�t hi�n (��m ng��c)"
Stage_info[4].boss_crt_time_bar = "��nh b�i D��c V��ng ��m ng��c"
Stage_info[4].stage_end_time_bar = "Khu v�c ���c d�n ��n, (��m ng��c)"
---------------------------------------------------�����ķָ���---------------------------------------
Stage_info[5].main_dialog = {	
	Stage_info[5].npc_name.."Ng� h�nh tr�n v�n l� c� m�y trinh s�t, Ng� H�nh S� ��m nh�n nhi�m v� ��c bi�t, chuy�n truy s�t nh�ng k� t�o ph�n!",
	Stage_info[5].npc_name.."N�i ��y thu�c Nh�t Ph�m ���ng, ph�a tr��c �� b� tr� Ng� H�nh Tr�n, c�c ng��i c�n kh�ng nhanh ch�ng r�i kh�i!"	
}
Stage_info[5].no_task_dialog = 	Stage_info[5].npc_name.."Ng� H�nh Gi�, Nh�t Kim M�c Th�y H�a Th�; Ng� h�nh tr�n gi� l� tr�n Kim M�c Th�y H�a Th�. Vi�c kh�ng li�n quan m�nh, ��ng xem v�o."
Stage_info[5].finish_task_dialog = Stage_info[5].npc_name.."B�n �� v��t qua Ng� h�nh tr�n? Hay l�i ch�p nh�n luy�n th�c? Kh�ng th� ���c, trong th�i gian ng�n l�m sao luy�n nhi�u l�n? N�u gi�p V� V� �� ch�p nh�n luy�n th�c th� c� th�."
Stage_info[5].stage_name = "Ng� h�nh tr�n"												--stage����
Stage_info[5].ground_sel_dialog = {
	{Stage_info[5].npc_name.."Ng� h�nh tr�n do nh�ng ng��i ch�c V� V� tr� l�n cung c�p c�c lo�i luy�n th�c, m�i luy�n th�c ��u l�y tr�n ph�p m�nh nh�t �� ��i ph�, kh�ng �� � t�i ai! Ng��i ph�i c�n th�n.",Stage_info[5].npc_name.."Ng� h�nh tr�n �� b�t ��u, tr�n ��a �� khai h�a. ��ng tr�ch ta kh�ng nh�c nh� c�c ng��i!"},
	{Stage_info[5].npc_name.."Ng� H�nh Tr�n �� b�y b�, ch�u ch�t �i!",Stage_info[5].npc_name.."Ng� H�nh Tr�n �� b�y b�, nh�ng v�n c� ng��i c�n c�ng ��u h�n ng��i, ch�u ch�t �i!"},
}
Stage_info[5].log_in_dialog = {"Ta mu�n d�n ��i x�ng v�o Ng� h�nh tr�n","Ta mu�n d�n ��i x�ng v�o Ng� h�nh tr�n",}
Stage_info[5].map = {{1104,1204},{1304,1404,1504}}									--������5���ؿ���Ӧ��map_id
Stage_info[5].stage_background = {
	Stage_info[5].npc_name.."Ng� H�nh S� v�n l� ��c v� c�a b�n ���ng, chuy�n theo d�i nh�ng ai c� h�nh vi x�u, Ng� H�nh Tr�n chuy�n truy s�t nh�ng k� t�o ph�n. B�nh th��ng c�ng c� th� d�ng l�m n�i luy�n binh. N�u mu�n v�o tr�n ph�i mang theo Nh�t Ph�m ���ng L�nh m�i ���c.",
	Stage_info[5].npc_name.."Ng� H�nh S� v�n l� ��c v� c�a b�n ���ng, Ng� H�nh Tr�n chuy�n truy s�t ph�n ��. D� c� ch�y ��n ch�n tr�i g�c b� c�ng kh� tho�t kh�i s� truy s�t. C�c h� qu� nhi�n ch�n s�ng, d�m ngang nhi�n x�m ph�m."
}
Stage_info[5].stage_condition ={					--��������
	Stage_info[5].npc_name.."Ng� H�nh Tr�n v�n l� c� m�y trinh s�t, Ng� H�nh S� ��m nh�n tr�ch nhi�m ��c v�, ai c�ng v� ngh� cao c��ng. Mu�n th� v�o tr�n, ch�c v� �t nh�t ph�i b�ng V� V�, <color=yellow>c� Nh�t Ph�m ���ng l�nh<color>. C�n kh�ng <color=yellow>tri�u t�p s�c m�nh 3-5 ng��i<color> m�i c� th� v�o trong. N�u trong nh�m c� ng��i <color=yellow>kh�ng bi�t Ng� H�nh Tr�n, v� c�ng l�u ph�i gi�ng nhau th� xin m�i v�!<color>",
	Stage_info[5].npc_name.."N�i ��y thu�c Nh�t Ph�m ���ng, mu�n g�p Ng� H�nh S�, c�n ph�i: \n1. ��i tr��ng d�n theo <color=yellow>3-5 ng��i<color>, v� <color=red>t�t c� th�nh vi�n<color> ��u ph�i ho�n th�nh <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>).\n2. ��i tr��ng mang theo <color=yellow>Ng� H�nh K� Phi�n<color>, n�u kh�ng Ng� H�nh S� kh�ng ch�u ti�p ki�n.\n3. Trong ��i <color=yellow>kh�ng ���c c� ng��i v� c�ng l�u ph�i gi�ng nhau<color>."
}
Stage_info[5].task_goods = {						--������Ҫ��Ʒ
	{
		{2,0,755,1,"Nh�t Ph�m Th�c B�t L�nh"}
	},
	{
		{2,0,1035,1,"Ng� H�nh K� Phi�n"}
	}
}
Stage_info[5].task_ID = {2031,58}												--����ʱ��Ӧ��ID
Stage_info[5].in_coordinate = {1603,3228}										--�����Ӧ����
Stage_info[5].out_coordinate = {506,1318,2720}									--�����ĵ�ͼ������
Stage_info[5].cannot_log_reason = {			--�޷�����ؿ���ԭ��Ի�
	{	
		Stage_info[5].npc_name.."V�i s�c c�a ng��i Ng� H�nh Tr�n S� kh�ng cho th� luy�n ��u. <color=yellow>C�n d�n theo 3-5 ng��i<color> m�i c� th� ��i ph� v�i Ng� H�nh S�.",
		Stage_info[5].npc_name.."N�u mu�n v�o tr�n tu luy�n, c�p tr�n s� cho b�n <color=yellow>Nh�t Ph�m ���ng L�nh<color>, d�ng �� v�o trong tr�n.",
		Stage_info[5].npc_name.."C�c ng��i <color=yellow>ch�a th�u hi�u Ng� H�nh Tr�n<color>, kh�ng n�n t�y ti�n x�ng v�o, tr�nh mang h�a v�o th�n.",
		Stage_info[5].npc_name.."Ng��i mu�n th� Ng� h�nh tr�n <color=yellow>kh�ng ���c c� ng��i tr�ng v� c�ng l�u ph�i<color>, n�u kh�ng Ng� H�nh S� s� kh�ng cho v�o!",
	},
	{
		Stage_info[5].npc_name.."Kh�ng n�n xem th��ng Ng� H�nh Tr�n, n�u c�c h� �� c� Ng� H�nh K� Phi�n, th� h�y d�n theo <color=yellow>3-5 ng��i<color> (Nh�c nh�: ",
		Stage_info[5].npc_name.."N�u mu�n hy sinh c�ng kh�ng n�n ch�n l�c n�y! (Nh�c nh�: Tr�n ng��i ��i tr��ng ph�i c� <color=yellow>Ng� H�nh K� Phi�n<color>)",
		Stage_info[5].npc_name.."H�nh nh� ng��i ch�a nghe danh Ng� H�nh Tr�n, mau v� �i! (Nh�c nh�: <color=yellow>Th�nh vi�n trong ��i c�n ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>)",
		Stage_info[5].npc_name.."H�nh nh� c�c ng��i c� ng��i v� c�ng l�u ph�i gi�ng nhau. (Nh�c nh�: Th�nh vi�n trong ��i <color=yellow>v� c�ng l�u ph�i kh�ng ���c gi�ng nhau<color>)",
	},
	{	Npc_name_city.."<color=green>Ng� H�nh S�<color> l�i d�ng ��o l� sinh kh�c c�a Ng� H�nh Tr�n bi�n h�a, n�u kh�ng ch�p th�i c� h�nh ��ng ngay th� kh� c�ng ph�, v� v�y ��i tr��ng ph�i m�i �� <color=yellow>3-5 ng��i c�p 85 tr� l�n<color> h�p s�c m�i c� hy v�ng.",
		Npc_name_city.."<color=yellow>Ng� H�nh Tr�n<color> ���c Nh�t Ph�m ���ng d�ng l�m n�i hu�n luy�n s�t th�, kh�ng th� t�y ti�n v�o trong, c�n ph�i mang theo <color=yellow>Ng� H�nh K� Phi�n<color>.",
		Npc_name_city.."H�nh nh� c�c ng��i ch�a �i h�t T�y v�c, ch�a t�m hi�u k� n�i ��. E r�ng c�c ng��i ch�a bi�t c�ch ph� Ng� H�nh Tr�n, hy sinh v� �ch l�m chi, mau ho�n th�nh <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color> h�n ��n ��y.",
		Npc_name_city.."<color=yellow>Ng� H�nh Tr�n<color> n�i l�n s�c m�nh t�p th�, c�c ng��i c� ng��i v� c�ng <color=yellow>l�u ph�i gi�ng nhau<color>, kh�ng th� v�o trong.",
	},
}
Stage_info[5].boss_chat = {
	"C�c ng��i mu�n ch�u ch�t thay h�n?",
	"Cho ng��i bi�t th� n�o l� tr�n ph�p m�nh nh�t!",
	"H�u qu� xem th��ng Ng� H�nh Tr�n",
	"N�i s� h�i �ang bao tr�m l�n c�c ng��i!!",
	"Ch�u ch�t thay cho Th�c B�t Ho�ng, c�ng ch� l� lao v�o ch� ch�t m� th�i!",
}
Stage_info[5].stage_start_msg ="Ng��i ng�a c�c ng��i �� v�o Ng� h�nh tr�n, Ng� V� Tr�n S� s� xu�t hi�n m�t ph�t n�a, c�c ng��i ph�i chu�n b� tinh th�n �� ph� tr�n! "
Stage_info[5].stage_start_talk = "<color=yellow>Ng� H�nh Tr�n<color> d�a theo t��ng sinh t��ng kh�c c�a ng� h�nh. M�i m�t <color=green>Ng� H�nh S�<color> ��u c� th� m��n s� t��ng sinh t��ng kh�c �� ph�t huy m�t s�c m�nh th�n b�, n�u ph�i h�p th�m Ng� H�nh Tr�n th� s�c m�nh kinh ng��i. Mu�n ph� Ng� H�nh S�, Ng� H�nh Tr�n l� m�u ch�t. Ng� h�nh kh�ng ch� theo t��ng sinh t��ng kh�c, <color=green>Ng� H�nh S�<color> c�n ph�i h�p ph��ng v� b�n trong c�a Ng� H�nh Tr�n, n�u n�m ���c s� bi�n ��i th� may ra c� c� h�i s�ng s�t. Ghi nh�\n<color=red>Sinh<color>: <color=yellow>Kim sinh Th�y, Th�y sinh M�c, M�c sinh H�a, H�a sinh Th�, Th� sinh Kim<color>\n<color=red>Kh�c<color>: <color=yellow>Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim<color>"
Stage_info[5].boss_crt_msg = "Ng� h�nh tr�n s� �� xu�t hi�n v� b� tr�n Ng� H�nh! Trong v�ng 30 ph�t ph�i ti�u di�t h�n, n�u kh�ng s� th�t b�i! "
Stage_info[5].stage_end_msg = "V��t tr�n �� ho�n th�nh. Xin ��i gi�y l�t s� d�n c�c v� ��n b�n ngo�i Ng� h�nh tr�n"
Stage_info[5].stage_start_time_bar = "Ng� H�nh S� xu�t hi�n (��m ng��c)"
Stage_info[5].boss_crt_time_bar = "��nh b�i Ng� H�nh S� ��m ng��c"
Stage_info[5].stage_end_time_bar = "Khu v�c ���c d�n ��n, (��m ng��c)"
---~~~~~~~~~~~~~~~~~~~~~��˵ķָ���~~~~~~~~~~~~~~~~~~~~~~~
Stage_info[6].main_dialog = {
	Stage_info[6].npc_name.."Cu�i Sa m�c kh� ph�n bi�t ���c ng�y hay ��m, nguy hi�m t� b�, c� Hoan T��ng m� ho�c l�ng ng��i. Ng��i mu�n ��n Cu�i Sa m�c, c�n ta kh�ng mu�n. Nh�ng n�u c�c ng��i c� b�o v�t t�ng, ta s� ngh� l�i.",
	Stage_info[6].npc_name.."G�n ��y sa m�c n�i phong ba b�o t�p, kh�ng th� v�o trong. C�c h� mu�n ��n �� �? Nh�ng b�o c�t �� th�i m�t ph��ng h��ng, ta c�ng kh�ng th� ��n ��."	
	}
Stage_info[6].no_task_dialog = 	Stage_info[6].npc_name.."Sa m�c r�ng l�n, nguy hi�m tr�ng tr�ng, c� Hoan T��ng m� ho�c l�ng ng��i. C�c ng��i �i �i, ��ng ��n qu�y nhi�u."
Stage_info[6].finish_task_dialog = Stage_info[6].npc_name..": S� hoang v�ng c�a Cu�i Sa m�c ng��i c�ng hi�u, s� ��ng s� c�a �o �nh Sa M�c, ng��i c�ng l�nh gi�o qua, kh�ng c� b�o t�ng , l�i c� k� ��ch m�nh, ��n l�m g�? Ta kh�ng th� d�n ng��i �i ���c."
Stage_info[6].stage_name = "Cu�i Sa m�c"												--stage����
Stage_info[6].ground_sel_dialog = {
	{Stage_info[6].npc_name.."N�u ta d�n ng��i ��n Cu�i Sa m�c, ph�i t�ng ta b�o v�t c� gi� t��ng ���ng n�u kh�ng mi�n b�n. Ng��i c� b�o v�t kh�ng?",Stage_info[6].npc_name.."Ta c�ng mu�n d�n ng��i ��n Cu�i Sa m�c, nh�ng m�i ng� ���ng ��u �� b� gi� sa m�c l�p k�n. Chi b�ng �� b�o v�t � ch� ta, ��ng ��n �� n�a, kh�ng ph�i hay h�n sao?"},
	{Stage_info[6].npc_name.."B�o c�t �� th�i m�t ph��ng h��ng, khuy�n ng��i kh�ng n�n ��n ��.",Stage_info[6].npc_name.."B�o c�t c� quan h� g� v�i t�n c�ng sa m�c? Nh�t ��nh ph�i ��n �� sao? Ta ch�a mu�n ch�t ��u."},
}
Stage_info[6].log_in_dialog = {"Ta mu�n d�n ��i v�o Cu�i Sa m�c","Ta mu�n d�n ��i v�o Cu�i Sa m�c",}
Stage_info[6].map = {{1105,1205},{1305,1405,1505}}									--������5���ؿ���Ӧ��map_id
Stage_info[6].stage_background = {Stage_info[6].npc_name.."Ph�ng T��ng , sa m�c r�ng l�n v� h�n, kh�ng bi�t v�i l�p bao nhi�u di t�ch c� qu�c. Nhi�u ng��i v�n ��n t�m kho b�u m�c d� n�i ��y nguy hi�m b�n b�, c�n c� �o �nh sa m�c, nguy c� b� gi� m�c ch�n v�i.",
									Stage_info[6].npc_name.."Th� ra c�c h� c� la b�n, nh� ng��i ��n �� ng�n ch�n b�o c�t"
								}
Stage_info[6].stage_condition ={ 						--��������
	Stage_info[6].npc_name.."T��ng truy�n Cu�i Sa m�c c� r�t nhi�u b�o t�ng b� v�i l�p, nh�ng l�i c� �o �nh Sa M�c �n hi�n ��u ��, m� ho�c l�ng ng��i. C�n ta d�n �i , ph�i c�<color=yellow>b�o v�t gi� tr� t��ng ���ng<color> t�ng phe ta . ph�i c� <color=yellow>3 ��n 5 ng��i<color> l�m b�n ��ng h�nh, <color=yellow>kh�ng c� ng��i kh�ng bi�t �o �nh Sa M�c<color> v� <color=yellow>kh�ng c� ai gi�ng nhau v� v� c�ng l�u ph�i<color>, c�c ng��i �� �i�u ki�n th�ch h�p?",
	Stage_info[6].npc_name.."1. ��i tr��ng d�n theo <color=yellow>3-5 ng��i<color>, v� nh�m ng��i n�y ph�i t�ng �i qua t�n c�ng sa m�c. (<color=yellow>Ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>).\n2. ��i tr��ng mang theo <color=yellow>la b�n<color> n�u kh�ng kh� c� th� ph�n bi�t h��ng �i.\n3. Trong ��i <color=yellow>kh�ng ���c c� ng��i v� c�ng l�u ph�i gi�ng nhau<color>."
}
Stage_info[6].task_goods = {
	{
		{2,0,733,1,"Hoan T��ng Ph�p Kh�"},
		{2,0,732,1,"Th�p Phong Y�u"}
	},
	{
		{2,0,1036,1,"La b�n"},
	}
}	--������Ҫ��Ʒ
Stage_info[6].task_ID = {2031,64}												--����ʱ��Ӧ��ID
Stage_info[6].in_coordinate = {1578,3242}										--�����Ӧ����
Stage_info[6].out_coordinate = {506,1552,2667}									--�����ĵ�ͼ������
Stage_info[6].cannot_log_reason = {			--�޷�����ؿ���ԭ��Ի�
	{	
		Stage_info[6].npc_name.."T�n c�ng sa m�c r�t kh� ph�n bi�t ph��ng h��ng, d� g�y ra �o gi�c, c� �i kh�ng v�, c�c ng��i tri�u t�p t� <color=yellow>3-5 ng��i<color> h�n �� ��n ��.",
		Stage_info[6].npc_name.."Ng��i kh�ng c� g� <color=yellow>cho ta<color>, ta c�ng kh�ng mu�n ��n c�i n�i qu�i qu� ��, t�t h�n kh�ng n�n �i!",
		Stage_info[6].npc_name.."<color=yellow>H�nh nh� c�c ng��i ch�a bi�t �o gi�c sa m�c l� g�<color>, n�u ngang nhi�n ��n ��, ch� s� nguy hi�m ��n t�nh m�ng, t�t h�n kh�ng n�n ��!",
		Stage_info[6].npc_name.."Cu�i Sa m�c c�ch bi�t v�i th� gi�i b�n ngo�i, nguy hi�m ��y r�y, l�i b� �e d�a b�i �o �nh Sa M�c. <color=yellow>C�c ng��i ph�i tinh th�ng v� c�ng c�c l�u ph�i<color> h�p l�c c�ng nhau, c� ng��i v� c�ng l�u ph�i gi�ng nhau, l�m sao l�p th�nh h�ng ng�?",
	},
	{	
		Stage_info[6].npc_name.."B�o c�t �� l�m m�t h��ng, r�t kh� ��n t�n c�ng sa m�c, t�t nh�t <color=yellow>tri�u t�p 3-5 ng��i<color>. (Nh�c nh�: ",
		Stage_info[6].npc_name.."B�o c�t �� l�m m�t h��ng, n�u c� <color=yellow>la b�n<color> th� hay bi�t m�y.",
		Stage_info[6].npc_name.."H�nh nh� c�c ng��i kh�ng bi�t s� nguy hi�m c�a b�o c�t, mau quay v� �i! (Nh�c nh�: <color=yellow>Th�nh vi�n trong ��i c�n ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color>)",
		Stage_info[6].npc_name.."T�n c�ng sa m�c c�ch bi�t v�i th� gi�i b�n ngo�i, b�n b� hi�m nguy, ph�i c� <color=yellow>ng��i v� c�ng l�u ph�i kh�c nhau<color> ��ng t�m h�p s�c m�i c� hy v�ng.",
	},
	{	Npc_name_city.."T�n c�ng sa m�c ngo�i b�o c�t ra, <color=yellow>�o gi�c sa m�c<color> l� th� ��ng s� nh�t, n� bi�n ��i 5 lo�i h�nh d�ng. ��i tr��ng c�n tri�u t�p<color=yellow>3-5 ng��i c�p 85 tr� l�n<color> m�i c� hy v�ng.",
		Npc_name_city.."Con ���ng ��n t�n c�ng sa m�c �� b� b�o c�t c�n tr�, l�m m�t ph��ng h��ng, ph�i c� <color=yellow>la b�n<color> m�i c� th� mi�n c��ng v�o trong.",
		Npc_name_city.."H�nh nh� c�c ng��i ch�a �i h�t T�y v�c, ch�a t�m hi�u k� n�i ��. Ch�a bi�t c�ch ��i ph� v�i <color=yellow>�o gi�c sa m�c<color>, ho�n th�nh <color=yellow>nhi�m v� T�y b�c-Ho�ng Sa L�c M�c<color> h�n quay l�i.",
		Npc_name_city.."Trong s� c�c ng��i c� v� c�ng l�u ph�i gi�ng nhau, ph� h�y <color=yellow>�o gi�c sa m�c<color> s� r�t kh� kh�n.",
	},
}
Stage_info[6].boss_chat = {
	"chi�m �o�t t�t c� �",
	"chi�m �o�t c� th� gi�i �",
	"Hoan t��ng ta ��y l� n�i khi�p s� c�a c�c ng��i!",
	"kh�ng c� tr�i cao ��t d�y, h�n ��n ��u l� � ",
	"h�ng hoang � v� kh�i � v� di�t!",
}
Stage_info[6].stage_start_msg ="C�c ng��i ��n Cu�i Sa m�c, �o �nh Sa M�c s� xu�t hi�n trong m�t ph�t n�a, c�c ng��i ph�i lu�n trong tr�ng th�i chi�n ��u!"
Stage_info[6].stage_start_talk = "<color=yellow>La b�n<color> � t�n c�ng sa m�c m�t �i ��nh h��ng. C�y c� xung quanh kh� c�n, nh�ng b� x��ng kh� l�p l� �n hi�n tr�n c�t. B�o c�t v� �o gi�c sa m�c �� l�m lung lay � tr� c�a nh�ng ai mu�n <color=yellow>t�m kho b�u<color>, ph�a sau b�o c�t c� th� c� th� <color=yellow>ph� �o gi�c<color>?"
Stage_info[6].boss_crt_msg = "�o �nh �n n�p � Cu�i Sa m�c �� xu�t hi�n! Ph�i l�m cho �o �nh hi�n nguy�n h�nh trong v�ng 30 ph�t �� ti�u di�t nguy�n h�nh (con trai) ��."
Stage_info[6].stage_end_msg = "V��t tr�n �� ho�n th�nh. Xin ��i gi�y l�t s� d�n c�c v� ��n b�n ngo�i Ng� h�nh tr�n"
Stage_info[6].stage_start_time_bar = "Hoan T��ng xu�t hi�n (��m ng��c)"
Stage_info[6].boss_crt_time_bar = "��nh b�i Hoan T��ng ��m ng��c"
Stage_info[6].stage_end_time_bar = "Khu v�c ���c d�n ��n, (��m ng��c)"
--���йؿ������˶Ի�--
Stage_info.city_mis_dia_main = {
	Npc_name_city.."Ng��i T�y v�c c�ng �t lui t�i, � ��y c� nhi�u ch� r�t nguy hi�m, ta t�ng d� h�i ���c bi�t trong <color=yellow>C� D��ng ��ng<color> c� con <color=yellow>C� D��ng Th�<color> hung b�o b�n trong, c�c ng��i c�n mu�n ��n �� sao?",
	Npc_name_city.."<color=yellow>T�n L�ng<color> l� n�i ch�n c�t <color=green>T�n Th�y Ho�ng<color>, c� quan b�n trong �� ch�n v�i kh�ng �t nh�ng tay c��p m�, ta �� quan s�t th�y b�n trong m� c� <color=yellow>Tr�n M� Linh Th�<color> r�t kh� ��i ph�, c�c ng��i c�n mu�n v�o �?",
	Npc_name_city.."<color=yellow>Ho�ng L�ng m�t th�t<color> kh�ng c�n c� qu�n b�o v�, do c� <color=yellow>Qu� T��ng Qu�n<color> canh gi� b�n trong, <color=yellow>Qu� T��ng Qu�n<color> l�c c�n s�ng �� c�ng T�n Th�y Ho�ng nam chinh b�c ph�t, ra ��n hi�m �c, c�c ng��i c�n mu�n ��n �� �?",
	Npc_name_city.."<color=yellow>D��c V��ng<color> l� m�t nh�n v�t nguy hi�m, c� �m m�u �i�u khi�n <color=yellow>D��c Nh�n<color> nh� c��ng thi d�ng �� t�n c�ng ��i T�ng, may ��c k� ch�a th�nh, nh�ng Luy�n ��n ��ng xu�t hi�n r�t nhi�u <color=yellow>D��c Nh�n Th�o<color>, kh�ng bi�t D��c V��ng �ang gi� tr� g�, c�c ng��i n�n c�n th�n!",
	Npc_name_city.."<color=yellow>Ng� H�nh Tr�n<color> k� b� kh� �o�n, kh�ng ng� T�y h� l�i c� cao nh�n am hi�u ng� h�nh, c�n c� th� d�ng ch�ng hu�n luy�n ra Ng� H�nh S�, n�u mu�n v�o <color=yellow>Ng� H�nh Tr�n<color> c�c ng��i n�n c�n th�n.",
	Npc_name_city.."T�y v�c n�i ng��i ta khi�p s� ph�i k� ��n sa m�c hoang vu, � �� ��y r�y hi�m nguy, k� ��n l� b�o c�t � t�n c�ng sa m�c khi�n ai nghe ��n c�ng ph�i khi�p s�, n� ch�n v�i kh�ng �t k� t�m ki�m <color=yellow>kho b�u<color>, c�c ng��i c�n mu�n ��n �� �?",
}
Stage_info.stage_condition_main_dialog = {
	"��n <color=yellow>C� D��ng ��ng<color> c�c v� c�n h�i �� �i�u ki�n sau:",
	"V�o <color=yellow>Ho�ng L�ng m�t ��o<color> c�c v� c�n h�i �� �i�u ki�n sau:",
	"V�o <color=yellow>Ho�ng L�ng m�t th�t<color> c�c v� c�n h�i �� �i�u ki�n sau:",
	"V�o <color=yellow>Luy�n ��n ��ng<color>, c�c v� c�n h�i �� �i�u ki�n sau:",
	"Khi�u chi�n <color=yellow>Ng� H�nh Tr�n<color>, c�c v� c�n h�i �� �i�u ki�n sau:",
	"Mu�n ��nh tan <color=yellow>�o gi�c sa m�c<color>, c�c v� c�n h�i �� �i�u ki�n sau:",
}
Stage_info.stage_login_clew = {
	"M�t s� tia s�ng c�a kho�ng th�ch ph�t ra, khi�n <color=yellow>C� D��ng ��ng<color> �nh l�n m�u �� nh� m�u. Xung quanh hoang t�n �� n�t, x�c ng��i ch�t ��ng, b�t lu�n Ng��i ��o kho�ng th�n b� hay <color=yellow>Li Long H�a H�<color> b�n ngo�i ��u th�y ���c v�t t�ch ��. B�n ng��i t�m b�o v�t mu�n x�ng v�o trong ��ng nh�ng h� kh�ng ng� r�ng <color=yellow>C� D��ng Th�<color> b� h�a luy�n kim ��n d�y v�, tr� n�n hung �c, <color=yellow>C� D��ng Th�<color> nh�p v�o nh�ng ai x�m ph�m. C�ng nhi�u sinh v�t trong ��ng c�ng thu h�t nhi�u <color=yellow>Huy�t Ma Nh�n<color>. C�c ng��i ph�i c�n th�n!",
	"<color=yellow>H�i Long S�ch<color> qu� nhi�n l� l�i h�i, c� th� m� m�t ��o t�ng tr�n t�ng d��i, <color=yellow>Tr�n M� Th�<color> l�n Ho�ng L�ng c�n nhi�u �i�u huy�n b�. Xem ra <color=yellow>Tr�n M� Th�<color> canh gi� l�ng m� tr�ng ��a, v�i t�nh c�ch c�a <color=green>T�n Th�y Ho�ng<color> sao kh�ng l�p ��t c� quan!? Tr�n M� Th� v� c� quan trong m� nh�t ��nh c� li�n quan v�i nhau. T�y v�c ��ng l� n�i huy�n b�.",
	"<color=yellow>To�i th�ch ch�n<color> tr��c khi d�ng �� v�o m�t th�t, kh�ng ngh� n�i ��y c� c�m b�y, <color=green>T�n Th�y Ho�ng<color> c�ng cho r�ng v�i s�c m�nh c�a <color=yellow>Qu� T��ng Qu�n<color> �� �� b�o v� l�ng m�. Tuy m�t th�t kh�ng ��t c� quan, nh�ng �� x�m ph�m v�o m� T�n Th�y Ho�ng, theo quy t�c c�a k� c��p m� ph�i � g�c ��ng nam ��t m�t c�y ��n c�y. Nh�ng v�i uy l�c c�a <color=yellow>Qu� T��ng Qu�n<color> e r�ng l�nh �t d� nhi�u.",
	"<color=yellow>D��c Nh�n<color> canh gi� qu� nhi�n hi�u qu�. <color=yellow>Luy�n ��n ��ng<color> c�ng l�c c�ng nguy hi�m, ch� l� th�m v�i c�i l� luy�n ��n. M�i c�a than v� th�o d��c tr�n l�n, ng�i v�o g�y kh� ch�u. Kh�ng bi�t <color=green>D��c V��ng<color> �� nghi�n c�u ra chi�u g� m�i, D��c Nh�n Th�o �� l�i h�i, nay D��c Nh�n c�n l�i h�i h�n, D��c V��ng c�ng ch�a h�i l�ng. Xem ra <color=green>D��c V��ng<color> c�n tr�ng th�m nhi�u D��c Nh�n Th�o.",
	"<color=yellow>Ng� H�nh Tr�n<color> d�a theo t��ng sinh t��ng kh�c c�a ng� h�nh. M�i m�t <color=yellow>Ng� H�nh S�<color> ��u c� th� m��n s� t��ng sinh t��ng kh�c �� ph�t huy m�t s�c m�nh th�n b�, n�u ph�i h�p th�m Ng� H�nh Tr�n th� s�c m�nh kinh ng��i. Mu�n ph� Ng� H�nh S�, Ng� H�nh Tr�n l� m�u ch�t. Ng� h�nh kh�ng ch� theo t��ng sinh t��ng kh�c, Ng� H�nh S� c�n ph�i h�p ph��ng v� b�n trong c�a Ng� H�nh Tr�n, n�u n�m ���c s� bi�n ��i th� may ra c� c� h�i s�ng s�t. Ghi nh�\n<color=yellow>Ng� h�nh t��ng sinh: Kim sinh Th�y, Th�y sinh M�c, M�c sinh H�a, H�a sinh Th�, Th� sinh Kim.\nNg� h�nh t��ng kh�c: Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim<color>",
	"<color=yellow>La b�n<color> ch� ���ng � t�n c�ng sa m�c nh�ng ��n t�n c�ng sa m�c s� m�t �i ph��ng h��ng. C�y c� xung quanh kh� c�n, nh�ng b� x��ng kh� l�p l� �n hi�n tr�n c�t. B�o c�t v� �o gi�c sa m�c �� l�m lung lay � tr� c�a nh�ng k� <color=yellow>t�m kho b�u<color>.",
}
---------------------------------------------------���˸��˵ķָ���----------------
--��ʱ����
--��ͨ�ؿ�boss��Ϣ
Tb_normal_boss_info = {
	{
		{"C� D��ng Th�","C� D��ng Th�",1618,3207,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"Tr�n M� Th�","Tr�n M� Th�",1618,3207,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"T�y B�c Qu� T��ng ��u","Qu� T��ng Qu�n",1612,3210,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"D��c V��ng","D��c V��ng",1600,3168,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"Ng� H�nh S� Kim","Ng� H�nh Kim S�",1613,3205,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng� H�nh S� Th�y","Ng� H�nh Th�y S�",1602,3258,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng� H�nh S� M�c","Ng� H�nh M�c S�",1625,3231,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng� H�nh S� H�a","Ng� H�nh H�a S�",1577,3230,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng� H�nh S� Th�","Ng� H�nh Th� S�",1592,3203,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	},
	{
		{"Hoan T��ng (T��ng l�nh t��ng)","Th�ng l�nh t��ng binhHoanT��ng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
}
--���ӹؿ�boss��Ϣ
	Tb_Monster_info = {}
	Tb_Monster_info[1] = {
		{"C� D��ng Th� �i 1","C� D��ng Th� (h�a luy�n)",1599,3195,5},
		{"C� D��ng Th� �i 2","C� D��ng Th� (nh�p)",1599,3195,5},
		{"�i �m Nh�t S�","�m Nh�t S� ",1599,3195,350},
		{"�i Minh Nh�t S� ","Minh Nh�t S�",1599,3195,350},
		{"�i Huy�t Ma Nh�n","Huy�t Ma Nh�n",1599,3195,350},
		{"�i Li�t Nhan Li Long ","Li�t Nhan Li Long",1599,3195,350},
		{"�i X�ch Luy�n H�a H�","X�ch Luy�n H�a H�",1599,3195,350},
	}
	Tb_Monster_info[2] = {
		{"Tr�n M� Tr�","",1629,3224,},
		{"Tr�n M� Tr�","",1601,3193,},
		{"Tr�n M� Tr�","",1574,3222,},
		{"Tr�n M� Tr�","",1603,3253,},
		{"�i Tr�n M� Th�","Tr�n M� Th�",1618,3207,},
	}
	Tb_Monster_info[3] = {
		{"Mang n�n v� ng�n �u�c (trung)","Ng�n �u�c ��ng B�c",1638,3224,"","Kh�ng c� n�n v� ng�n �u�c","��ng B�c Tr�n m� T��ng qu�n","��ng B�c Tr�n m� T��ng qu�n",{10,60,100},"Qu� t�y t�ng","Qu� t�y t�ng",{{1627,1637},{3214,3234}}},
		{"Mang n�n v� ng�n �u�c (��i)","Ng�c �u�c ��ng Nam",1601,3265,"","Kh�ng c� n�n v� ng�n �u�c","��ng Nam Tr�n m� T��ng qu�n","��ng Nam Tr�n m� T��ng qu�n",{0,20,100},"Qu� Kh�i L�i","Qu� Kh�i L�i",{{1594,1604},{3251,3261}}},
		{"Mang n�n v� ng�n �u�c (trung)","Ng�n �u�c T�y Nam",1563,3223,"","Kh�ng c� n�n v� ng�n �u�c","T�y Nam Tr�n m� T��ng qu�n","T�y Nam Tr�n m� T��ng qu�n",{10,60,100},"Qu� n� b�c","Qu� n� b�c",{{1565,1575},{3212,3232}}},
		{"Mang n�n v� ng�n �u�c (ti�u)","Ng�c �u�c T�y B�c",1601,3182,"","Kh�ng c� n�n v� ng�n �u�c","T�y B�c Tr�n m� T��ng qu�n","T�y B�c Tr�n m� T��ng qu�n",{70,100,0},"Qu� Th� T�ng","Qu� Th� T�ng",{{1597,1607},{3183,3193}}},
		{"�i Qu� T��ng ��u","Qu� T��ng Qu�n",1600,3221,""},
	}
	Tb_Monster_info[4] = {
		{"�i D��c V��ng","D��c V��ng",1597,3192},
		{"D��c Nh�n Th�o","D��c Nh�n Th�o",1597,3192}, 
		{"�i D��c Nh�n V��ng","D��c Nh�n"},
	}
	--npc�����ű�
	TB_Npc_death_script = {}
	TB_Npc_death_script[1] = {
		{"C� D��ng Th� (h�a luy�n)","stage1_boss_death()"},
		{"�m Nh�t S� ","stage1_sun_moon_death()"},
		{"Minh Nh�t S�","stage1_sun_moon_death()"},
		{"Li�t Nhan Li Long","stage1_dragon_fox_death()"},
		{"X�ch Luy�n H�a H�","stage1_dragon_fox_death()"}
	}
	TB_Npc_death_script[2] = {
		{"Ph� ph�ng Tr�n m� tr�","stage2_pillar_death(1,"},
		{"Gi�ng c�ng Tr�n m� tr�","stage2_pillar_death(2,"},
		{"H� nh��c Tr�n m� tr�","stage2_pillar_death(3,"},
		{"Gi�m t�c Tr�n m� tr�","stage2_pillar_death(4,"},
		{"��n th�n Tr�n m� tr�","stage2_pillar_death(5,"},
		{"�o�n huy�t Tr�n m� tr�","stage2_pillar_death(6,"},
		{"H�i m�nh Tr�n m� tr�","stage2_pillar_death(7,"},
		{"H�i n�i Tr�n m� tr�","stage2_pillar_death(8,"},
		{"C��ng c�ng Tr�n m� tr�","stage2_pillar_death(9,"},
		{"Ng� th� Tr�n m� tr�","stage2_pillar_death(10,"},
		{"C��ng l�c Tr�n m� tr�","stage2_pillar_death(11,"},
		{"�� t�c Tr�n m� tr�","stage2_pillar_death(12,"},
		{"Tr�n M� Th�","stage2_boss_death("},
	}
	TB_Npc_death_script[3] = {
		{"Qu� T��ng Qu�n","stage3_boss_death()"},
		{"��ng B�c Tr�n m� T��ng qu�n","devil_Gen_death(1)"},
		{"��ng Nam Tr�n m� T��ng qu�n","devil_Gen_death(2)"},
		{"T�y Nam Tr�n m� T��ng qu�n","devil_Gen_death(3)"},
		{"T�y B�c Tr�n m� T��ng qu�n","devil_Gen_death(4)"},
		{"Qu� t�y t�ng","end_dialog()"},
		{"Qu� Kh�i L�i","end_dialog()"},
		{"Qu� n� b�c","end_dialog()"},
		{"Qu� Th� T�ng","end_dialog()"},	
		{"Ng�n �u�c ��ng B�c","player_kill_candler(1)"},
		{"Ng�c �u�c ��ng Nam","player_kill_candler(2)"},
		{"Ng�n �u�c T�y Nam","player_kill_candler(3)"},
		{"Ng�c �u�c T�y B�c","player_kill_candler(4)"},
	}
	TB_Npc_death_script[4] = {
		{"D��c V��ng","stage4_boss_death()"},
		{"D��c Nh�n","stage4_devil_death()"},
	}
TB_Npc_death_script[5] = {
	{"Kim s�","stage5_element_death(1)"},
	{"Th�y s�","stage5_element_death(2)"},
	{"M�c s�","stage5_element_death(3)"},
	{"H�a s�","stage5_element_death(4)"},
	{"Th� s�","stage5_element_death(5)"},
}
TB_Npc_death_script[6] = {
	{"Huy�t Ma Nh�nHoan T��ng ","stage6_shadow_death(1)"},
	{"Qu� T��ng ��uHoan T��ng ","stage6_shadow_death(2)"},
	{"Tr�n m� T��ng qu�nHoan T��ng ","stage6_shadow_death(3)"},
	{"Th�ng l�nh t��ng binhHoanT��ng ","stage6_shadow_death(4)"},
	{"Tr�n M� Th�Hoan T��ng ","stage6_shadow_death(5)"},
	{"Nguy�n h�nh �o �nh (t�nh m�ch)","stage6_boss_slience_death()"},
	{"Nguy�n h�nh �o �nh (th�n)","stage6_boss_death()"},
}
	--npc�Ի��ű�
	--���taskid��¼����
	Task_ID_stage_diff = 1252	--�ؿ����֣���ͨ/����
	Task_ID_stage_seq = 1253	--�ؿ����
	--������Ϣ���ڸ����ؿ���ʹ��
	Tb_Npc_dialog_info = {}
	Main_Npc_Script_way = "\\script\\missions\\northwest_mission\\stage\\stage_time.lua"
--��¼�������Ĵ���
function player_log_out_pub_deal()
	RemoveTrigger(GetTrigger(Trigger_save_ID))
	for i =1,4 do
		StopTimeGuage(i)
	end
	local mission_diff = GetTask(Task_ID_stage_diff)
	if mission_diff == 2 then
		ForbidChangePK(0)	--��ֹת��PK״̬
		SetPKFlag(0,0)		--PK״̬
		SetCreateTeam(0)
		local stage_seq = GetTask(Task_ID_stage_seq)
		--�ڶ��سƺŴ���
		if stage_seq == 2 then
			for i = 11,16 do
				RemoveTitle(60,i)
			end
			for i = 19801228,19801252 do
				RemoveState(i)
			end
		elseif stage_seq == 3 then
			for i = 1038,1040 do
				BigDelItem(2,0,i,BigGetItemCount(2,0,i))
			end
		elseif stage_seq == 4 then
			--���ĹسƺŴ����״̬����
			for i = 21,25 do
				RemoveTitle(60,i)
			end
			RemoveState(19801223)
		end
	end
	UseScrollEnable(1)		--��ֹʹ�ûسǷ�
	ForbitTrade(0)			--��ֹ����
	StallEnable(1)				--��ֹ��̯
	SetDeathPunish(1)		--�������ͷ�
	OpenFriendliness(1)	--���Ӻøж�
	gf_ForbidFactionSkill(0)	--���ɿ���ʹ��
	if IsPlayerDeath() == 1 then
		RevivePlayer(0)
	end
	RestoreAll()		--ȫ���ظ�
	SetDeathScript("")
	DelMSPlayer(MS_ID,0)
end
function Ms_on_log_in()
	player_log_out_pub_deal()
	--��Ҵ���
	local login_diff = GetTask(TaskID_miss_login_diff)
	if login_diff ~= 2 then
		local map_id = GetWorldPos()
		local stage_seq = tonumber(strsub(tostring(map_id),4,4)) + 1
		NewWorld(Stage_info[stage_seq].out_coordinate[1],Stage_info[stage_seq].out_coordinate[2],Stage_info[stage_seq].out_coordinate[3])
	else
		NewWorld(500,1764,3147)
		SetFightState(0)
	end
end
-------------------------------------------------�������ں���--------------------------------------------
Sever_diff = 2		--(1Ϊ�շ�����2Ϊ�����)
Tb_stage_tichket = {
	{2,0,1031,"B�ch Dao Thanh T�m ��n"},
	{2,0,1032,"H�i Long s�ch"},
	{2,0,1033,"To�i Th�ch Ch�n"},
	{2,0,1034,"T�ch D��ng Tinh Hoa"},
	{2,0,1035,"Ng� H�nh K� Phi�n"},
	{2,0,1036,"La b�n"},
	{2,0,1037,"Thi�p d� ti�c Long M�n"},
}
Tb_add_mertiral = {
	{2,1,3330,"Nh�t Thi�m Y�u Ho�ng"},
	{2,1,3331,"Tam Di�u Long Hi"},
	{2,1,3332,"�� Nguy�t Th�n Sa"},
	{2,1,3333,"Ph�n Quang Th�n Sa"},
	{2,1,3334,"Tr�m Tinh Th�n Sa"},
	{2,1,3204," Ng� Th�i Lung T�y"},
	{2,1,3205,"Th�t Huy�n T� V�n"},
}
Tb_stage_prize = {
--������-�ؿ�-�ӳ�
	{
		{--����ת����-J-����-��ʯ���ȼ������ޣ�������-��Ʊ�����ʡ����ţ�-���ϣ����ʡ����������ţ�
			{2000000,200000,20,{3,4,2},{{10},{5}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{2000000,200000,20,{3,4,2},{{10},{3}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{3000000,200000,20,{4,5,2},{{10},{6}},{{90,100},{1,2},{2,2}},{{25,75,100},{2,3,4},{3,3,3}},{{100,1,1}}},
			{3000000,200000,20,{4,5,2},{{},{}},{{100},{1},{2}},{{50,100},{1,2},{3,3}},{{100,1,1}}},
		},
		{
			{2000000,200000,20,{3,4,2},{{10},{5}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{3000000,200000,20,{4,5,2},{{10},{6}},{{90,100},{1,2},{2,2}},{{25,75,100},{2,3,4},{3,3,3}},{{100,1,1}}},
			{3000000,200000,20,{4,5,2},{{},{}},{{100},{1},{2}},{{50,100},{1,2},{3,3}},{{100,1,1}}},
		},
		{
			{4000000,200000,20,{5,6,2},{{100},{7}},{{50,100},{1,2},{6}},{{25,75,100},{6,7,8},{3,3,3}},{{100,1,1},{5,1,2}}},
			{4000000,200000,20,{5,6,2},{{},{}},{{100},{1},{6}},{{50,100},{3,4},{3,3}},{{100,1,1},{5,1,2}}},
		},
	},
	{
		{--����-J-����-��ʯ���ȼ������ޣ�������-��Ʊ�����ʡ����ţ�-���ϣ����ʡ����������ţ�
			{1000000,0,0,{3,4,1},{{10},{5}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{1000000,0,0,{3,4,1},{{10},{3}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{2000000,0,0,{4,5,1},{{10},{6}},{{20},{1},{2}},{{100},{1},{3}},{}},
			{2000000,0,0,{4,5,1},{{},{}},{{20},{1},{2}},{{30},{1},{3}},{}},
		},
		{
			{1000000,0,0,{3,4,1},{{10},{5}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{2000000,0,0,{4,5,1},{{10},{6}},{{20},{1},{2}},{{100},{1},{3}},{}},
			{2000000,0,0,{4,5,1},{{},{}},{{20},{1},{2}},{{30},{1},{3}},{}},
		},
		{
			{3000000,0,0,{5,6,1},{{100},{7}},{{20},{1},{6}},{{50,90,100},{2,3,4},{3,3,3}},{}},
			{3000000,0,0,{5,6,1},{{},{}},{{20},{1},{6}},{{65,100},{1,2},{3,3}},{}},
		},
	},
}
--��������
function Ms_stage_prize()
	--�ؿ���źϷ��ж�
	local stage_diff = GetMissionV(MS_STATE_DIFF_ID)
	if stage_diff <= 0 or stage_diff > getn(Tb_stage_prize[Sever_diff]) then
		return
	end
	--�Ƿ�ӳ�
	local is_team_captain = 2
	if GetTeamMember(0) == PlayerIndex then
		is_team_captain = 1
	end
	--�Ӿ���
	local exp_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1]
		--�շ���ת������
	if Sever_diff == 1 then
		exp_num = min((Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1]/2),GetGoldenExp())
		if exp_num ~= 0 then
			ModifyGoldenExp(-exp_num)
			ModifyExp(exp_num)
			Msg2Player("B�n �em "..exp_num.."�i�m s�c kh�e ��i �i�m kinh nghi�m.")
		else
			Msg2Player("�i�m s�c kh�e hi�n t�i c�a b�n l� 0, kh�ng th� chuy�n th�nh kinh nghi�m!")
		end
		--�����
	end
	ModifyExp(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1])
	Msg2Player("B�n nh�n ���c "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1].." �i�m kinh nghi�m!")
	--��Ǯ
	if Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][2] ~= 0 then
		Earn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][2])
	end
	--����
	local add_flag = 0
	if Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3] ~= 0 then
		 add_flag = AddItem(2,2,8,Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3]) 
		 if add_flag == 1 then
			Msg2Player("B�n nh�n ���c "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3].." Thi�n Th�ch!")
		else
			WriteLog("�i T�y B�c: Ph�n th��ng ban cho-ng��i ch�i["..GetName().."]t�ng th�m "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3].." thi�n th�ch th�t b�i, v� tr� th�t b�i: "..add_flag)
		end
	end
	--������ʯ
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4]) ~= 0 then
		for i = 1,Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][3] do
			local linshi_level = random(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][1],Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][2])
			lspf_AddLingShiInBottle(linshi_level,1)
			Msg2Player("B�n nh�n ���c 1 vi�n c�p "..linshi_level.." Linh th�ch, �� cho v�o T� Linh ��nh!")
		end
	end
	--������Ʊ
	local ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1][i] then
				local ticket_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [2][i]
				add_flag = AddItem(Tb_stage_tichket[ticket_seq][1],Tb_stage_tichket[ticket_seq][2],Tb_stage_tichket[ticket_seq][3],1)
				if add_flag == 1 then
					Msg2Player("B�n nh�n ���c 1 "..Tb_stage_tichket[ticket_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh�n ���c 1 "..Tb_stage_tichket[ticket_seq][4].."\")")
				else
					WriteLog("�i T�y B�c: Ph�n th��ng ban cho-ng��i ch�i["..GetName().."]t�ng 1"..Tb_stage_tichket[ticket_seq][4].." th�t b�i, k� hi�u:"..add_flag)
				end
				break
			end
		end		
	end
	--���Ӳ���
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1][i] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [2][i]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [3][i]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B�n nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("�i T�y B�c: Ph�n th��ng ban cho-ng��i ch�i["..GetName().."]t�ng th�m "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].." th�t b�i, k� hi�u:"..add_flag)
				end
				break
			end
		end
	end
	--2008-5-13���Ӳ���
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8][i][1] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8] [i][2]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8] [i][3]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B�n nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("�i T�y B�c: Ph�n th��ng ban cho-ng��i ch�i["..GetName().."]t�ng th�m "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].." th�t b�i, k� hi�u:"..add_flag)
				end
			end
		end
	end
	--����
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [1][i] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [2][i]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [3][i]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B�n nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("�i T�y B�c: Ph�n th��ng ban cho-ng��i ch�i["..GetName().."]t�ng th�m "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].." th�t b�i, k� hi�u:"..add_flag)
				end
				break
			end
		end
	end
	--2008-11-10��������������
	ran_num = random(1000)
	if (ran_num <= 10 and Sever_diff == 1) or  (ran_num <= 5 and Sever_diff == 2) then
		AddItem(2,1,3205,1)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Th�t Huy�n L�u V�n!")
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh�n ���c 1 Th�t Huy�n L�u V�n!\")")
	end
end
