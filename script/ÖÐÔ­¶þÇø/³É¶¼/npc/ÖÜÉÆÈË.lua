--�ű����ƣ�������.lua
--�ű����ܣ������˶Ի��ű�����ǰ������������Ĺ��ܣ����ڼ��ϰ�ṥ��ս_�Ƽ�������Ĺ���
--�߻��ˣ����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007��3��30��
--�����޸ļ�¼��

Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\online\\abluemoon\\abluemoon_item2exp.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\lib\\writelog.lua");
temp_taskID_merterial_count = 166
temp_taskID_merterial_count_conf = 167
File_name = "\\script\\��ԭ����\\�ɶ�\\npc\\������.lua"

function main ()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==1) then

		task_003();
		return

	elseif (nTaskValue==2) then

		if (GetTask(EM_MANTALK_01)==1) and (GetTask(EM_MANTALK_02)==1) and (GetTask(EM_MANTALK_03)==1) and (GetTask(EM_MANTALK_04)==1) then
			task_008();
			return
		else
			Talk(1,"","Ta mu�n ph�t ti�n �� c�u t� nh�ng b�n gia nh�n th� b�n gi�p n�u ch�o. Phi�n c� n��ng ��n th�ng b�o cho N�n d�n bi�t, b�o h� ��n nh�n c�u t�.");
			return
		end
	elseif (nTaskValue==4) then

		task_011();
		return

	end


	UWorld1506 = GetTask(1506)
	if ( UWorld1506 == 0 and  GetLevel() > 1 )  then
		Say("G�n ��y Th�nh �� ph� sao l�i c� nhi�u n�n d�n, nh�n h� th�t ��ng th��ng! Ta quy�t ��nh ph�t ti�n c�u t�, kh�ng bi�t b�ng h�u c� th� gi�p ��?",2,"��ng �/yes1506","Ta c�n ch�t vi�c/no1506")
	elseif ( UWorld1506  == 5 )  then
		Talk(1,"","Nh� b�ng h�u chuy�n tin g�p, c�u ng��i nh� c�u h�a.")
	elseif ( UWorld1506  == 9 )  then
		Talk(1,"","Ta thay m�t n�n d�n �a t� b�ng h�u! ��y l� m�t ch�t l� m�n.")
		SetTask(1506,10)
		--AddItem(2,1,1,1)
		Earn(200)
		ModifyExp(150)
		ModifyReputation(3,0)
		--AddNote("�������˾ȼ�������������")
		TaskTip("Ho�n th�nh nhi�m v� gi�p Chu Thi�n Nh�n c�u t� n�n d�n")
	else
--		Talk(1,"","<color=green>������<color>�����Զ�С��Ϊ֮��������С����Ϊ��")
--		item_to_exp()  --����ʳ������
		confwar_task_goods_main()		-- ������Ҫ��
	end
end;

function yes1506()
	Talk(1,"","Ta mu�n ph�t ti�n �� c�u t� nh�ng b�n gia nh�n th� b�n gi�p n�u ch�o. Phi�n b�ng h�u ��n th�ng b�o cho N�n d�n � c�ng th�nh bi�t, b�o h� ��n nh�n c�u t�.")
	Talk(1,"","T�i h� ngh� n�n g�p ch�t s�c m�n.")
	SetTask(1506,5)
	--AddNote("�ӵ���������������������")
	TaskTip("Nh�n nhi�m v� gi�p Chu Thi�n Nh�n c�u t� n�n d�n")
end;
function no1506()
	Talk(1,"","N�u b�ng h�u �� th�y kh� th� c�ng kh�ng n�n l�m kh� ng��i kh�c! ")
--	item_to_exp()  --����ʳ������
end;
--============================�峤2007��3��30�ռ����ṥ��ս_�Ƽ����������=====================
tb_life_merterial = {}		--�����Ͻ��Ĳ����б�
tb_life_merterial[1] = {
	{"X� h��ng",	1,	2,	4,	1.0},
	{"Xuy�n s�n gi�p",	1,	2,	11,	0.9},
	{"�i�n th�t",	1,	2,	10,	0.8},
	{"X�c ve",	1,	2,	9,	0.8},
	{"Ho�ng li�n",	1,	2,	3,	0.5},
	{"C�t C�nh",	1,	2,	2,	0.5},
	{"T�ng H�ng Hoa",	1,	2,	1,	0.5},
	{"Ba ��u",	1,	2,	8,	0.5}
}
tb_life_merterial[2] = {
	{"Du long t�c",	1,	3,	16,	1.5},
	{"Thu�n h�a m�ch",	1,	3,	15,	1.3},
	{"Di�n Tinh m�ch",	1,	3,	14,	1.2},
	{"M�a",	1,	3,	13,	1.2},
	{"H� ti�u",	1,	3,	22,	0.8},
	{"Dung tr�ch c�c",	1,	3,	12,	0.8},
	{"M�ng",	1,	3,	21,	0.8},
	{"Nhi�u minh ��u",	1,	3,	11,	0.8},
	{"Th�ch khu�n",	1,	3,	20,	0.8},
	{"Khuynh ly ��u",	1,	3,	10,	0.8},
	{"M�c nh�",	1,	3,	19,	0.8},
	{"Quang Th�ng Ma",	1,	3,	9,	0.8}
}
tb_life_merterial[3] = {
	{"H�c � th�ch",	2,	2,	37,	1.3},
	{"Thi�n thanh th�ch",	2,	2,	36,	1.3},
	{"Huy�n thi�t",	2,	2,	6,	1.2},
	{"Th�i b�ch tinh kim",2,	2,	5,	1},
	{"H�n thi�t",	2,	2,	4,	1},
	{"� kim th�ch",	2,	8,	5,	1},
	{"B�ch Luy�n C��ng",	2,	2,	2,	1},
	{"Tinh Thi�t",	2,	2,	1,	1}
}
tb_life_merterial[4] = {
	{"Thi�t Tuy�n M�c",	2,	2,	11,	1.3},
	{"Thi�t Ch��ng M�c",	2,	2,	10,	1.3},
	{"Tr�ng M�c",	2,	2,	9,	1.2},
	{"Ng� ��ng",	2,	2,	45,	1},
	{"Thi�t M�c",	2,	2,	44,	1},
	{"Sam m�c",	2,	2,	43,	1},
	{"D��ng M�c",	2,	2,	42,	1},
	{"T�ng M�c",	2,	2,	41,	1}
}
tb_life_merterial[5] = {
	{"Da S� t�",2,	2,	47,	1.3},
	{"Loan �i�u v�",2,	10,	7,	1.3},
	{"Da g�u",	2,	2,	20,	1.2},
	{"Da h� tr�ng",2,	2,	46,	1},
	{"Da r�n",	2,	2,	18,	1},
	{"Da c�o",	2,	2,	17,	1},
	{"Da h�",	2,	2,	16,	1},
	{"Da s�i",	2,	2,	15,	1}
}
tb_life_merterial[6] = {
	{"L�nh tr�ng t�",	2,	9,	4,	1.3},
	{"Kim t�m t�",	2,	2,	55,	1.3},
	{"Linh Chu t�",	2,	2,	54,	1.2},
	{"H�ng t�",	2,	2,	53,	1},
	{"Lang chu t�",	2,	2,	52,	1},
	{"T� Ng� S�c",	2,	9,	3,	1},
	{"T�m t�",	2,	9,	2,	1},
	{"L�ng th�",	2,	9,	1,	1}
}
tb_cent_and_letter = {
	{15000,1},
	{28000,2},
	{40000,3}
}
--********************�Ի�������*******************************************************************
function confwar_task_goods_main()
	Say("",8,
	"Gi�i thi�u nhi�m v�/task_intro",
	"Quy�n g�p nguy�n li�u/goods_hand_in_main",
	"Xem t�nh h�nh quy�n g�p c�a bang h�i hi�n t�i/goods_hand_in_inf",
	"Th� ti�n c�/commend_letter_main",
	"��i khi�u chi�n l�nh/exchange_tiaozhanling",
	"��i 8 D�ng S� L�nh (c�n 1 Th� ti�n c�)/exchange_warriorling",
	"��i 6 C�ng th�nh Ti�n Phong L�nh (c�n 1 Th� ti�n c�)/exchange_citywarling",
	"Tr� l�i/end_dialog"
)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"",Zgc_pub_sex_name().." h�nh nh� kh�ng mang Th� ti�n c� tr�n ng��i?")
		return
	end
	
	if GetFreeItemRoom() < 8 then
		Talk(1,"",Zgc_pub_sex_name().." kh�ng �� 8 � tr�ng trong h�nh trang.")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B�n nh�n ���c 8 D�ng S� L�nh.")
		WriteLogEx("Cong Thanh Chien","nh�n",8,"D�ng S� L�nh","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"",Zgc_pub_sex_name().." h�nh nh� kh�ng mang Th� ti�n c� tr�n ng��i?")
		return
	end
	
	if GetFreeItemRoom() < 6 then
		Talk(1,"",Zgc_pub_sex_name().." kh�ng �� 6 � tr�ng trong h�nh trang.")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B�n nh�n ���c 6 C�ng th�nh Ti�n Phong L�nh.")
		WriteLogEx("Cong Thanh Chien","nh�n",6,"C�ng th�nh Ti�n Phong L�nh","",GetTongName())
	end
end

--$$$$$$$$$$$$$$$$$$$$��ս��$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


--********************�������****************************************************
function task_intro()
	Talk(2,"confwar_task_goods_main","Tri�u ��nh v� gi�c Li�u t�c chi�n nhi�u n�m, qu�c kh� �� h�t, kh� k�o d�i ���c. Anh h�ng n� hi�p v� n��c v� d�n, ta �� ngh� ng��i c� ti�n g�p ti�n, ng��i c� s�c g�p s�c, c�ng hi�n v� an nguy qu�c gia, ��i T�ng ta m�i thi�n h� th�i b�nh. V� th� b�y gi� ta kh�ng ch� quy�n g�p cho v�ng b� n�n, m� c�n quy�n g�p <color=yellow>qu�n l��ng<color> cho ��i T�ng. Hy v�ng tri�u ��nh s�m thu h�i ��t �ai b� m�t, ch�ng ta s� ���c an h��ng th�i b�nh.",
		"Do s� nguy�n li�u l�n n�n ta s� d�ng bang h�i c�a <color=yellow>c�c v�<color> l�m ��n v� ghi ch�p, sau n�y s� tuy�n truy�n �i�m t�t c�a c�c v� ��n m�i ng��i. <color=yellow>Gi� tr� qu�n l��ng <color>t�<color=yellow> 0.3 <color>��n<color=yellow> 1.5 <color>kh�ng ��u, nguy�n li�u c� c�p c�ng cao th� gi� tr� c�ng cao. M�i tu�n ta s� vi�t 1 l�n <color=yellow>cho<color> qu� bang (nhi�u nh�t <color=yellow>3<color> th� ti�n c�). Nh�n th� ti�n c�, ghi ch�p qu�n l��ng s� ���c tr� t��ng �ng, ph�n c�n l�i s� t�ch l�y ��n tu�n sau."
	)
end

--*********************����*********************************************************
function goods_hand_in_main()
	if istongmember_chk() == 0 then
		return
	end
	local tb_hand_in_mert_diff_dia = {
	"Ta mu�n quy�n g�p nguy�n li�u h�i thu�c/#goods_hand_in(1,1)",
	"Ta mu�n quy�n g�p nguy�n li�u canh t�c/#goods_hand_in(2,1)",
	"Ta mu�n quy�n g�p nguy�n li�u ��o kho�ng/#goods_hand_in(3,1)",
	"Ta mu�n quy�n g�p nguy�n li�u ��n c�y/#goods_hand_in(4,1)",
	"Ta mu�n quy�n g�p nguy�n li�u thu�c da/#goods_hand_in(5,1)",
	"Ta mu�n quy�n g�p nguy�n li�u k�o t�/#goods_hand_in(6,1)",
	"C� h�i/end_dialog"
	}
	Say("Ng��i mu�n quy�n g�p lo�i nguy�n li�u n�o?",
	getn(tb_hand_in_mert_diff_dia),tb_hand_in_mert_diff_dia)
end
--*******************���������ϸ�б�******************
function goods_hand_in(merterial_diff,page)
	local tb_hand_in_merterial_dia = {}
	local mertrial_num = 0
	for i = 1,8 do
		if tb_life_merterial[merterial_diff][i+((page-1)*8)] ~= nil then
			mertrial_num = mertrial_num + 1
			tb_hand_in_merterial_dia[i] = "Ta mu�n quy�n g�p to�n b�"..tb_life_merterial[merterial_diff][((page-1)*8+i)][1].."(m�i "..strsub(tostring(tb_life_merterial[merterial_diff][((page-1)*8+i)][5]),1,4).."�i�m t�ch l�y)/#mert_han_in("..merterial_diff..","..((page-1)*8+i)..")"
		else
			break
		end
	end
	if getn(tb_life_merterial[merterial_diff]) > 8 and page == 1 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "Trang k�/#goods_hand_in("..merterial_diff..",2)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "Tho�t/end_dialog"
	elseif page == 2 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "Trang tr��c/#goods_hand_in("..merterial_diff..",1)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "Tho�t/end_dialog"
	else
		tb_hand_in_merterial_dia[mertrial_num+1] = "Tho�t/end_dialog"
	end
	Say("Ng��i mu�n quy�n g�p nguy�n li�u n�o?",
		getn(tb_hand_in_merterial_dia),
		tb_hand_in_merterial_dia
		)
end
--****************************���Ͼ���************************
function mert_han_in(merterial_diff,merterial_seq)
	local cent_count = 0
	local merterial_num = GetItemCount(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4])
	local cent_count = merterial_num * tb_life_merterial[merterial_diff][merterial_seq][5]

	if merterial_num == 0  then
		Say("�"..Zgc_pub_sex_name().."Trong h�nh trang kh�ng c� <color=yellow>"..tb_life_merterial[merterial_diff][merterial_seq][1].."<color>, qu�n mang r�i ph�i kh�ng?",
		2,
		"Ta mu�n quy�n g�p nguy�n li�u kh�c/goods_hand_in_main",
		"Ta v�n ch�a chu�n b�/end_dialog"
		)
		return
	elseif cent_count < 1 then
		Talk(1,"","N�u "..Zgc_pub_sex_name().." c� � mu�n quy�n g�p, mang �t nguy�n li�u v�y c�ng keo qu� r�i, ta kh�ng r�nh �� gi�i quy�t nh�ng m�n �� n�y c�a ng��i.")
		return
	end
	cent_count = floor(cent_count)
	if DelItem(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4],merterial_num) ~= 1 then
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,cent_count)
	Zgc_pub_getconftask(3,1)
end
--************************����������ȡ�ûص�*********************
function ConfDataGetReturn_1(cent_save)
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	SetTaskTemp(temp_taskID_merterial_count_conf,(cent_save+cent_the_turn))
	Zgc_pub_setconftask(3,(cent_save+cent_the_turn),1)
end
--**************************�����ִ洢�ص�***********************
function ConfDataSetReturn_1()
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	local cent_conf_save = GetTaskTemp(temp_taskID_merterial_count_conf)
	Talk(1,"","V� qu� bang �� quy�n g�p qu�n l��ng "..cent_the_turn.."�i�m t�ch l�y!")
	SendTongMessage(GetName().."  quy�n g�p cho ��i T�ng "..cent_the_turn.."hi�n nay qu� bang �� t�ch l�y "..cent_conf_save.." �i�m qu�n l��ng.")
end
--************************************�鿴***********************************
function goods_hand_in_inf()
	Zgc_pub_getconftask(3,2)
end
function ConfDataGetReturn_2(cent_save)
	Talk(1,"","Qu� bang �� quy�n g�p <color=yellow>"..cent_save.."<color> �i�m qu�n l��ng, hy v�ng ti�p t�c!")
	return
end
--**********************************�Ƽ���***********************************
function commend_letter_main()
	Say("G�n ��y nghe n�i tri�u ��nh tri�u t�p c�c anh h�ng thi�n h� tr�n gi� <color=yellow>Th�nh ��<color>, nh�ng ph�i t� v� L�i ��i nh�n t� c�ch, c�c bang ph�i quy�n g�p qu�n l��ng t�ch c�c nh� v�y s� r�t ch�n r�n, hay l� ta s� vi�t 1 b�c <color=yellow>th� ti�n c�<color> g�i cho ��i s� c�ng th�nh <color=yellow>� Th�nh ��<color>, xem nh� l� gi�i thi�u cho qu� bang.\n Quy�n g�p <color=yellow>"..tb_cent_and_letter[1][1].."<color> qu�n l��ng c� <color=yellow>"..tb_cent_and_letter[1][2].."<color> th� ti�n c�\n Quy�n g�p <color=yellow>"..tb_cent_and_letter[2][1].."<color> qu�n l��ng c� <color=yellow>"..tb_cent_and_letter[2][2].."<color> th� ti�n c�\n Quy�n g�p <color=yellow>"..tb_cent_and_letter[3][1].."<color> qu�n l��ng c� <color=yellow>"..tb_cent_and_letter[3][2].."<color> th� ti�n c�",
		2,
		"H�y gi�p ta vi�t th� ti�n c�/commend_letter_prize",
		"C� h�i/end_dialog")
end
function commend_letter_prize()
	if IsTongMaster() ~= 1 then						--Ȩ�޼��
		Talk(1,"","M�i bang ch� <color=yellow>qu� bang<color> ��n nh�n <color=yellow>th� ti�n c�<color>.")
		return
	end
	Zgc_pub_getconftask(4,3)						--��ȡ�ϴ���ȡ����
end
function ConfDataGetReturn_3(week_seq_save)			--��������ûص�
	if week_seq_save >= zgc_pub_day_turn(7) then	--���ܿ�����ȡ�����
		Talk(1,"","G�n ��y ta r�t b�n, th� ti�n c� c�a <color=yellow>m�i bang ph�i<color> ta ch� vi�t <color=yellow>1 tu�n<color> m�t l�n. "..Zgc_pub_sex_name().."Tu�n sau ��n nh�!")
		return
	end
	Zgc_pub_getconftask(3,4)						--��ǰ���ֻ�ȡ
end
function ConfDataGetReturn_4(cent_save)				--��ǰ���ֻ�ȡ�ص�
	if cent_save < tb_cent_and_letter[1][1] then	--���ֲ���������ʾ
		Talk(1,"","Nguy�n li�u qu� bang quy�n g�p kh�ng �� <color=yellow>15000<color> �i�m, quy�n g�p �� r�i ��n nh�n <color=yellow>th� ti�n c�<color>!")
		return
	end
	local letter_able_get = 0
	for i = 1, 3 do
		if cent_save >= tb_cent_and_letter[i][1] then
			letter_able_get = i
		else
			break
		end
	end
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then		--�ռ�͸����ж�
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,letter_able_get)
	Say("T�ng nguy�n li�u hi�n nay qu� bang �� quy�n g�p <color=yellow>"..cent_save.."<color> ta gi�p ng��i vi�t <color=yellow>"..letter_able_get.."<color> th� ti�n c�.",
	2,
	"Ta mu�n nh�n th� ti�n c� c�a bang ta/#letter_get_dtm("..cent_save..","..letter_able_get..")",		--���ٻ���
	"�� ta suy ngh� l�i/end_dialog")
end
--********************��ȡ�ż�ȷ�϶Ի�********************
function letter_get_dtm(cent_save,letter_num)
	local cent_remain = (cent_save-(tb_cent_and_letter[letter_num][1]))
	SetTaskTemp(temp_taskID_merterial_count_conf,cent_remain)
	Say("<color=red>Ch� �<color>: M�t tu�n ch� c� th� nh�n <color=red>1 l�n <color>th� ti�n c�, ng��i mu�n nh�n b�y gi� kh�ng?",
	2,
	"Ta mu�n nh�n/#Zgc_pub_setconftask(3,"..cent_remain..",2)",		--���ٻ���
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function ConfDataSetReturn_2()					--���ּ��ٻص����ɹ���
	local letter_num = GetTaskTemp(temp_taskID_merterial_count)
	local conf_cent_remain = GetTaskTemp(temp_taskID_merterial_count_conf)
	if AddItem(2,1,1200,letter_num) == 1 then
		Talk(1,"","C�c h� �� nh�n th� ti�n c� tu�n n�y "..letter_num.." th�!")
		SendTongMessage(GetName().." Nh�n th� ti�n c� "..letter_num.." th�, hi�n nay qu� bang c�n d� "..conf_cent_remain.." �i�m qu�n l��ng!")
		WriteLogEx("Cong Thanh Chien","nh�n",letter_num,"Th� ti�n c�","",GetTongName())
	end
	Zgc_pub_setconftask(4,zgc_pub_day_turn(7),3)--����������
end
function ConfDataSetReturn_3()					--����������ص�
end
--*********************�����ʸ���***********************************************
function istongmember_chk()
	if IsTongMember() == 0 then
		Talk(1,"","Ng��i gia nh�p bang ph�i r�i h�y ��n ��y quy�n g�p.")
		return 0
	else
		return 1
	end
end


--�һ���ս��
function exchange_tiaozhanling()
	Say("<color=green>Ch�u Thi�n Nh�n<color>: Khi�u chi�n l�nh d�ng �� khi�u chi�n bang h�i th� th�nh. N�p cho ch� l�i ��i c� th� thu ���c t� c�ch tham chi�n. Bang h�i n�p nhi�u khi�u chi�n l�nh nh�t s� c� t� c�ch c�ng thanh. Th�ng qua �i�m qu�n l��ng v� b�c �� ��i l�y khi�u chi�n l�nh.",
		2,
		"��i khi�u chi�n l�nh (c�n 88 �i�m qu�n l��ng v� 88 b�c)/confirm_exchange_tiaozhanling",
		"Xem th�ng tin kh�c/end_dialog"
	);
end

function confirm_exchange_tiaozhanling()
	-- �Ƿ��ǰ���������������
	if IsTongMember() ~= 1 and IsTongMember() ~= 2 and IsTongMember() ~= 3 then
		Talk(1,"","<color=green>Chu Thi�n Nh�n<color>: Ch� c� bang ch�/ph� bang ch�/tr��ng l�o m�i c� th� ��i khi�u chi�n l�nh")
		return 0
	end
	
	-- ����������λ7������
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green>Chu Thi�n Nh�n<color>: C�c h� t�i v� kh�ng �� 7 ng�y, kh�ng th� ��i khi�u chi�n l�nh")
		return 0
	end
	
	-- 80������
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green>Chu Thi�n Nh�n<color>: C�p b�c c�c h� kh�ng �� 80, kh�ng th� ��i khi�u chi�n l�nh")
		return 0
	end
	
	--�ð�����������ս��
	
	--��ȡ�ð�����еĻ��֣�����
	---
	Zgc_pub_getconftask(3,5)
	
	--ApplyRelayShareData(GetTongName(),0,0,File_name,"call_back_tiaozhanling")
end

function ConfDataGetReturn_5(cent_save)
	local nCount = floor(cent_save / 88);
	Say("<color=green>Chu Thi�n Nh�n<color>: ��i hi�p mu�n d�ng 88 �i�m qu�n l��ng v� 88 b�c �� ��i khi�u chi�n l�nh?",
			2,
			"��ng, ta mu�n ��i./#confirm_tiaozhanling("..cent_save..")",
			"�� ta ngh� l�i/end_dialog"
	);
end

function confirm_tiaozhanling(nPoint)
	if Zgc_pub_goods_add_chk(2, 10) == 0 then
		return 0;
	end
	local nRemainPoint = nPoint - 88;
        if nRemainPoint < 0 then
            Say("<color=green>Chu Thi�n Nh�n<color>:  �i�m t�ch l�y bang h�i c�a ��i hi�p kh�ng ��!", 0);
            return 0;
        end
	if Pay(88 * 100) == 0 then
		Say("<color=green>Chu Thi�n Nh�n<color>: H�nh trang kh�ng �� ng�n l��ng!", 0);
		return 0;
	end
	Zgc_pub_setconftask(3, nRemainPoint, 5);
	local nCount = 0;
	local nRand = random(1, 1000);
	if nRand == 1 then
		nCount = 3;
	elseif nRand <= 10 then
		nCount = 2;
	else
		nCount = 1;
	end
	AddItem(2, 1, 30117, nCount);
	Talk(1, "exchange_tiaozhanling", "<color=green>Chu Thi�n Nh�n<color>: ��i hi�p d�ng �i�m t�ch l�y bang h�i ��i "..nCount.." khi�u chi�n l�nh.");
	WriteLog("[��i khi�u chi�n l�nh]: "..GetName().." l� bang h�i "..GetTongName().."��i "..nCount.." khi�u chi�n l�nh.");
end

function ConfDataSetReturn_5()
end
