
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʦ�ű�
-- Edited by joker
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")
Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
File_name = "\\script\\��ԭ����\\�ɶ�\\npc\\��ʦ.lua"
Tasktemp_task_return = 199
CONFTASKBOSSCREATE_RATE = 20

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	else
		if GetTask(956) == 0 then
			Zgc_conf_task_main_dialog()
		else							--�ǵ�һ�ζԻ�
			Zgc_conf_task_dialog_2()
		end
	end
	
end
---------------------------------------------��������������-----------------------------------------
Zgc_conf_task_goos_num = {						--�����ռ��ȼ�Ϊ9��
	{2000,1},{4000,2},{8000,4},{12000,7},{16000,10},{20000,15},{24000,16},{28000,17},{32000,18}
}
Zgc_conf_task_boss_jies = {
	"10 n�m tr��c giang h� xu�t hi�n m�t cao th� B� Phi Y�n x�ng l� Th�y Y�n Ti�n T�, ng��i n�y v� ngh� cao c��ng, th�n ph�p uy�n chuy�n. Sau l�n th�ch s�t chinh nam t��ng qu�n Li�u qu�c kh�ng th�nh b�ng nhi�n bi�t v� �m t�n, nh�ng g�n ��y nghe n�i �� xu�t hi�n l�i l� m�t ng��i ho�n to�n kh�c kh�ng ai c� th� nh�n ra, �i�u n�y c�ng h�i k� l�. \n Ng�y m�ng ��i th� th�t th�p c�a th�i h�u ��u v� kinh th�nh n�p Sinh Th�n C��ng, c�c ti�u s� nh�n c� h�i n�y d� h�n c�ng ��ng b�n. ",
	"10 n�m tr��c l� m�t �ao kh�ch tung ho�nh ngang d�c, sau l�i ��u Li�u l�m t��ng l�nh cho Li�u",
	"Ti�u nh�n ch� bi�t ng��i n�y l� m�nh t��ng c�a Li�u qu�c, ngo�i ra kh�ng bi�t g� n�a.",
	"Thu�c h� B� Phi y�n",
	"Thu�c h� B� Phi y�n",
	"Thu�c h� B� Phi y�n",
	"Thu�c h� B� Phi y�n",
	
}
Zgc_conf_task_coll_goods = {					--�ռ�ƷID���ռ�Ʒ���ƣ��ռ�Ʒ�����������ռ�Ʒѡ�б�־���ռ�Ʒѡ������
	{"�u�i th�",2,0.2},
	{"R�ng s�i",3,0.2},
	{"Th� Nhi Qu�",4,0.2},
	{"L�ng s�i",5,0.2},
	{"No�n tr�ng",6,0.2},
	{"Nanh heo r�ng",7,0.2},
	{"L�ng s�i th��ng ��ng",8,1},
	{"V�n L� th�ch",9,0.2},
	{"Thi�t Ban Ch�",10,0.2},
	{"T� hoa h�i",11,0.2},
	{"Thi�u t�u",12,0.2},
	{"T� ong",13,0.2},
	{"Nanh heo th��ng h�ng",14,1},
	{"G�m lam",15,0.2},
	{"H�u Nhi Qu�",16,0.2},
	{"Thanh Kim",17,0.2},
	{"C�nh d�i",18,0.2},
	{"H� v�",19,0.2},
	{"Thi�t Th��ng ��u",20,0.2},
	{"Bao �ao",21,0.2},
	{"Tuy�t Tinh",22,0.2},
	{"Th�i C�t",23,0.2},
	{"S�u Th�n K�",24,0.2},
	{"Gi�p M�c B�i",25,0.2},
	{"�m Y�n",26,0.2},
	{"�m Ph�ch",27,0.2},
	{"Tr�ng chim",28,0.2},
	{"B�o B�nh",29,0.2},
	{"��ng ki�m",30,0.2},
	{"M�c Th�",31,0.2},
	{"H�ng Tinh",32,0.2},
	{"�t M�c B�i",33,0.2},
	{"Quan ph�c",34,0.2},
	{"B�nh n��ng",35,0.2},
	{"Gia Ph�p b�ng",36,0.2},
	{"Lang H�n",37,0.2},
	{"H�ng h�a",38,0.2},
	{"D� Minh Ch�u",39,0.2},
	{"Th��ng g�y",40,0.3},
	{"Kim Thoa",41,0.3},
	{"Mi�ng ��ng",42,0.3},
	{"Th�o h�i",43,0.3},
	{"T�u B�i",44,0.3},
	{"Tuy�t Ph�ch",45,0.3},
	{"B�nh M�c B�i",46,0.3},
	{"Thi�t Xoa",47,0.3},
	{"�u�i H� v�ng",48,1},
	{"Th�n Ma ch�",49,0.3},
	{"Th� C�t",50,0.3},
	{"U H�n",51,0.3},
	{"Tr�m T�u",52,0.3},
	{"Di T�c Chung",53,0.3},
	{"G�m v�ng",54,0.3},
	{"B�nh tr�",55,0.3},
	{"C�ng V�n",56,0.3},
	{"H�p trang s�c",57,0.3},
	{"C�nh d�i",58,0.3},
	{"�inh M�c B�i",59,0.3},
	{"B�u r��u da d�",60,0.3},
	{"D�y x�ch",61,0.3},
	{"L�c Ph�ch",62,0.3},
	{"M�c C�u",63,0.3},
	{"M�u M�c B�i",64,0.3},
	{"B�u r��u da d�",65,0.3},
	{"K� M�c B�i",66,0.3},
	{"��i T�ng ��a ch�",67,0.3},
	{"Ch�m c�u ��ng nh�n",68,0.3},
	{"Ho�ng Kim Ban Ch�",69,0.3},
	{"Canh M�c B�i",70,0.3},
	{"Thi�t B�t Qu�i",71,0.3},
	{"�n Th�ch",72,0.3},
	{"�inh Ba",73,0.3},
	{"Bao tay Da h��u",74,0.3},
	{"M�c L�i V�n �ao",75,0.5},
	{"M�u ��n",76,0.5},
	{"T�n M�c B�i",77,0.5},
	{"H�ng V�n",78,0.5},
	{"Kim X�ng X�",79,0.5},
	{"Ki�m H�n",80,0.5},
	{"B�ch V�n b�i",81,0.5},
	{"Quy Hoa K�nh",82,0.5},
	{"Nh�m M�c B�i",83,0.5},
	{"H� Ph�ch",84,0.5},
	{"Qu� M�c B�i",85,0.5},
	{"Kim Cang",86,0.5},
	{"Ng�c Nh� �",87,0.5},
	{"B�nh Ng�c",88,0.5},
	{"T� Ng�u Cung",89,0.6},
	{"Nh�n H� Ph�t",90,0.6},
	{"L�c Tr�",91,0.7},
	{"Qu� H�n",92,1},
	{"V�ng B�ch Ng�c",93,0.6},
	{"T� Ph�t Ban Ch�",94,0.5},
	{"Tuy�t Hoa Gi�i C�",95,1},
	{"Ch� Nam Ng�",96,0.8},
	{"Th��ng H�n lu�n",97,1},
	{"Kh� S�n ch�",98,1},
	{"Huy�n Quang",99,1},
	{"��ng L�ng",100,1},
	{"M�t n� Thi�n V��ng",101,1},
	{"Nh�n �� Ph�",102,1},
	{"B�nh �n d�ch",103,1},
	{"H� ph�",104,1},
	{"V� Kinh T�ng Y�u",105,1},
	{"V�y K� L�n",106,1},
	{"Ho�ng �� N�i Kinh",107,1},
	{"Ng�c Kh�",154,0.3},
	{"L�ng c�o",155,0.3},
	{"Tr�ng B�ch �i�u",156,0.3},
	{"Cung",157,0.3},
	{"M�nh b�n �� Thi�n �m gi�o",158,0.3},
	{"Thi�n �m M�t T�n",159,0.3},
	{"Qu�i d� th�ch",160,0.3},
	{"Ng�c v� c�t",161,0.3},
	{"D�i c�c",162,0.3},
	{"H�t Ch�m",163,0.3},
	{"D� T�c Qu�i Li�n",164,0.5},
	{"D� T�c b� ngoa",165,0.5},
	{"da Th��ng Vi�n",166,0.5},
	{"Ng�n H� ��n",167,0.5},
	{"Ng�n th��ng h�ng",168,0.5},
	{"Xi H�a c�n",169,0.5},
	{"B�ch Ng� L�n",170,0.5},
	{"H�ng ng� l�n",171,0.5},
	{"D� �ao",172,1},
	{"V� s� �ao",173,1},
	{"V� s� y�u ��i",174,1},
	{"M�t n� V� s�",175,1},
	{"��c Phong th�ch",176,1},
	{"Gi�p x�c phi�n",177,1},
	{"H�a �nh Th�n �ao",178,1},
	{"Qu� ��u Tr��ng",179,1},
	{"Ng�c Ng� Nh�n C�u",180,1},
	{"Th�n b� ph�",181,1},
	{"Ki�m th�n b�",182,1},
	{"Linh Ti�u",183,1},
	{"Linh Qu�",184,1},
	{"Linh T�n",185,1},
	{"Linh C�m",186,1},
	{"Linh ��ch",187,1},
	{"N�c ong ��c",271,0.2},
	{"X�c gi�p tr�ng",272,0.2},
	{"Ch�n r�t",273,0.2},
	{"C�nh mu�i",274,0.2},
	{"D�ch nh�n ��c",275,0.2},
	{"M�m Th�c nh�n th�o",276,0.2},
	{"�u�i ��c t�ch",277,0.3},
	{"Ch�a kh�a ��ng",278,0.3},
	{"Ch�a kh�a s�t",279,0.3},
	{"Ch�a kh�a b�c",280,0.3},
	{"D�y tua",281,0.3},
	{"Xi H�a M�t T�n",282,0.5},
	{"H� Ph�p L�nh B�i",284,0.5},
	{"Huy�t Nha v�",285,1},
	{"Huy�t bao",286,0.5},
	{"Mao Ng�u b�",287,0.4},
	{"Tr��ng �ao",288,0.5},
	{"Kh�n tay",289,0.5},
	{"Tranh ch�",290,0.5},
	{"V� nhung",291,0.6},
	{"Da h�",292,0.6},
	{"To�i c�t",293,0.8},
	{"�m d��ng k�nh",294,1},
	{"��i Cang �ao",295,1},
	{"R�ng Tinh Tinh",296,1},
	{"Da voi",297,1},
	{"Thu�c n�",298,1},
	{"T�n ki�m",299,1},
	{"T� ��n",300,1},
	{"T�n th��ng",301,1},
	{"Ph� �n",302,1},
	{"G�ng tay",303,1},
	{"Ph�t Kinh",304,1},
	{"�� La tr��ng",305,1},
	{"H�p trang �i�m",306,1},
	{"Huy�t L�n",307,1},
	{"H� C�t",308,1},
	{"Ti�u ��c Nang",309,1},
	{"Hoa Ban H� �i�p",310,1},
	{"Minh H�a Ph�",311,1},
	{"��i Thi�t Ba",312,1},
	{"Xi H�a �n",313,1},
	{"B�ch L�n",314,1},
	{"L��ng kh�",315,1},
	{"To�i th�ch",316,1},
	{"Th� b� Tr��ng B�o",317,1},
	{"C�n",318,1},
	{"C�nh Ph�ng Ho�ng",319,1},
	{"Xi H�a Tr��ng �n",320,1},
	{"Xi H�a Th�nh �n",321,1},
	{"C�nh A Tu La",322,1},
	{"��u l�u Ma H� La Ca",323,5},
	{"�o�n Th�a �n th� th�",324,5},
	{"Nh�t D��ng Ch� T�n ch��ng 1",325,5},
	{"B�ch Ng�c gi�i ch�",326,5},
	{"D�y th�p",327,1},
	{"Tr�ng h�t",328,1},
	{"��u l�u Kh�n Na La",329,5},
	{"��i Tu Vi�n K�nh",330,1},
	{"Nh�t D��ng Ch� T�n ch��ng 2",331,5},
	{"T� c�t",1089,1},
	{"Di�n Sa",1400,1},
	{"R��u T�y Ph�ng",1401,1},
	{"Ph��ng t�a",1402,1},
	{"���ng tam th�i",1403,1},
	{"Da H�a H�",1404,1},
	{"Ng�n ch�m",1405,1},
	{"Kh�i m�",1406,1},
	{"Thanh Long V�n K�nh",1407,1},
	{"B�ch H� v�n k�nh",1408,1},
	{"L��ng kh�",1409,1},
	{"Ma ph� t�n",1410,1},
	{"Nh�t qu�",1411,1},
	{"Li�t n� ca",1412,1},
	{"Y�n th��ng",1413,1},
	{"R��u h� l�",1414,1},
	{"Ng� th�ch t�n",1415,1},
	{"Ly Tr�ng L�n Phi�n",1416,1},
	{"X�c x�c",1417,1},
	{"C�y n�n",1418,1},
	{"Huy�n V� v�n k�nh",1419,1},
	{"Chu T��c v�n k�nh",1420,1},
	{"L�nh b�i d�ng s�",1421,1},
	{"R� c�y ng�n n�m",1422,1},
	{"Nghi�n m�c",1423,1},
	{"B�ch c�t phi�n",1177,1},
	{"��u C� L�u",1178,1},
}
Zgc_conf_task_goods_need = {50,90,140,200,400}
-------------------------------------------------���ܺ�����----------------------------------------------
--***********************�������NPC�Ի�������***********************
function Zgc_conf_task_main_dialog()				
	Say("10 n�m tr��c giang h� xu�t hi�n m�t cao th� B� Phi Y�n x�ng l� Th�y Y�n Ti�n T�, ng��i n�y v� ngh� cao c��ng, th�n ph�p uy�n chuy�n. Sau l�n th�ch s�t chinh nam t��ng qu�n Li�u qu�c kh�ng th�nh b�ng nhi�n bi�t v� �m t�n, nh�ng g�n ��y nghe n�i �� xu�t hi�n l�i l� m�t ng��i ho�n to�n kh�c kh�ng ai c� th� nh�n ra, �i�u n�y c�ng h�i k� l�. Qu� bang v� V� L�m c� th� t�m ra ���c nguy�n nh�n th� n�o.",
		2,
		"Nh�ng ta ch�a t�ng nghe qua ng��i n�y, ph�i l�m th� n�o ��y?/Zgc_conf_task_dialog_1",
		"Ta c�ng kh�ng c� h�ng th� v�i con ng��i n�y, th�i b� �i!/Zgc_end_dialog"
	)
	if GetTask(956) == 0 then
		SetTask(956,1)
	end
end
--*************************
function Zgc_conf_task_dialog_1()
	Say("Theo ta ���c bi�t, l� m�ng ��i th� th�t th�p c�a th�i h�u c�c qu�n, ch�u ��u ph�i mang Sinh Th�n C��ng v� kinh th�nh, ���ng nhi�n l� B� Phi Y�n s� kh�ng b� l� c� h�i n�y. Ta mu�n l�m gi� Sinh Th�n C��ng �� d� h�n v� ��ng b�n c�a h�n. Ng��i mau thu x�p nh�!",
		1,	
		"Ta bi�t r�i/Zgc_end_dialog"
	)
end
--***************************�ǵ�һ�ζԻ�����************************
function Zgc_conf_task_dialog_2()
	Say("B� l� khinh doanh th� th�m khan, phi ti�n ��c ki�n d� h�n nham. Y�n vi v� nhi�u th�n b�t hi�n, hoa l�c ng�ng huy�t th� Phi Y�n. B�i th� n�y 10 n�m tr��c do B� Phi Y�n vi�t, n�u kh�ng nhanh ch�ng ti�u tr� e r�ng thi�n h� s� ��i lo�n!",
		7,
		"Ta mu�n t�m hi�u nhi�m v� n�y/Zgc_conf_task_content",
		"Ta mu�n t�m hi�u con ng��i B� Phi Y�n/Zgc_conf_task_boss_con",
		"Ta mu�n xem ti�n �� c�a bang h�i/Zgc_conf_task_step_inq",
		"Ta mu�n n�p v�t ph�m/Zgc_conf_taskgoods_turnin",
		--"�����˽��������ɵĶ���/Zgc_conf_task_fini_list",
		"Bang ph�i c�a ta mu�n nh�n nhi�m v� n�y (bang ch�, ph� bang ch�, tr��ng l�o ��u c� th� ti�p nh�n)/Zgc_conf_task_get",
		"Bang ph�i c�a ta mu�n nh�n ph�n th��ng nhi�m v� (bang ch� nh�n)/Zgc_conf_task_pay",
		"Ta c� vi�c r�i/Zgc_end_dialog"
	)
end
--***************************�������********************************
function Zgc_conf_task_content()
	Talk(2, "", 
		"Nhi�m v� n�y 2 ng�y 1 l�n, do bang ch�, ph� bang ch� ho�c tr��ng l�o ��n Th�nh �� g�p ti�u s� �� nh�n nhi�m v� bang h�i <color=red>(Nhi�m v� ph�n th�nh 9 c�p, c�p c�ng cao s� nh�n ���c c�ng nhi�u Sinh Th�n Cang, ���ng nhi�n v�t ph�m thu th�p c�ng ph�i c�ng nhi�u)<color>, sau �� bang ch�ng ��n g�p Ti�u s� � Th�nh �� �� nh�n v�t ph�m.",
		"<color=red>Bang ch�ng c�p 50 tr� l�n gi�i h�n giao 400 l�n cho m�i v�ng (d��i c�p 50 s� l�n s� gi�m d�n) <color>. Bang ch�, Ph� bang ch� ho�c Tr��ng l�o c� th� ��n nh�n Sinh Th�n Cang �� d� B� Phi Y�n v� ��ng b�n c�a h�n. N�i trong 2 ng�y t�t c� bang ph�i kh�ng n�p �� v�t ph�m thu th�p nhi�m v� l�p t�c ph�i d�ng l�i v� l�m l�i t� ��u."
	)
end
--***************************�������*********************************
function Zgc_conf_task_boss_con()
	Say("B� Phi Y�n con ng��i n�y ta c�ng ch� bi�t c� v�y, c�c ng��i t�m hi�u th�m.",
		8,
		"Ta mu�n t�m hi�u: B� Phi Y�n/#Zgc_conf_task_boss(1)",
		"Ta mu�n t�m hi�u: H� C�nh Th�ng/#Zgc_conf_task_boss(2)",
		"Ta mu�n t�m hi�u: Nhi�p ��i Ch�y/#Zgc_conf_task_boss(3)",
		"Ta mu�n t�m hi�u: C�n Lu�n N�/#Zgc_conf_task_boss(4)",
		"Ta mu�n t�m hi�u: Linh H�ng/#Zgc_conf_task_boss(5)",
		"Ta mu�n t�m hi�u: Li�u Ngh�/#Zgc_conf_task_boss(6)",
		"Ta mu�n t�m hi�u: H�ng Tuy�n/#Zgc_conf_task_boss(7)",
		"Ta bi�t r�i/Zgc_end_dialog"
	)	
end
function Zgc_conf_task_boss(boss_seq)
	Say("<color=green>Ti�u S�<color>:"..Zgc_conf_task_boss_jies[boss_seq],
		3,
		" Thao t�c kh�c/Zgc_conf_task_dialog_2",
		"T�m hi�u tin t�c BOSS kh�c/Zgc_conf_task_boss_con",
		"Ta bi�t r�i/Zgc_end_dialog"
	)
end
--****************************���а�**********************************
function Zgc_conf_task_fini_list()
	
end
--***************************���������Ȳ�ѯ*************************
function Zgc_conf_task_step_inq()
	if IsTongMember() == 0 then
		Say("Ng��i v�n ch�a gia nh�p bang h�i �?",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
		return
	end
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackStepInq")
end
--**************************���������Ȳ�ѯ�ص�**********************
function CallBackStepInq(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--���������ж�--
	if tong_level_max == nil or tong_level_max <= 0 then
		ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
		return
	end
	--����--
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	local dialog_date_now = ""					--�����������ʱ��
	local dialog_date_next =""					--��������ʼʱ��
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date_now = "24h t�i nay "
		dialog_date_next = "24h t�i mai "
	else
		dialog_date_now = "24h t�i mai "
		dialog_date_next = "24h t�i m�t "
	end
	if tong_state == 1 then
		Say("Qu� bang v�n ch�a nh�n chu�i nhi�m v� n�y, chu�i nhi�m v� n�y ��n <color=yellow>"..dialog_date_now.."<color> k�t th�c.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)		
	elseif tong_state == 2 then
		Say("Qu� bang �� nh�n nhi�m v�, t�nh h�nh thu th�p v� giao n�p v�t ph�m l�:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..", chu�i nhi�m v� n�y ��n"..dialog_date_now.."k�t th�c",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	elseif tong_state == 3 then
		Say("Nhi�m v� l�n n�y c�a qu� bang �� ho�n th�nh, bang ch� c� th� ��n nh�n ph�n th��ng.",
			2,
			"Ta mu�n nh�n ph�n th��ng/Zgc_conf_task_pay",
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("Nhi�m v� �� ho�n th�nh v� ph�n th��ng c�ng �� nh�n. Xin h�y l�m chu�i nhi�m v� ti�p theo, chu�i nhi�m v� ti�p theo ��n <color=yellow>"..dialog_date_now.."<color> b�t ��u.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	end
end
--*************************���������ܺ���***************************
function Zgc_conf_task_get()
	if IsTongMember() == 0 then 																--�ж��Ƿ����
		Say("B� Phi Y�n kh�ng ph�i l� ng��i b�nh th��ng. Ng��i mau gia nh�p bang h�i, b�o bang ch� ��n g�p ta ngh� c�ch ��i ph� v�i B� Phi Y�n!",
			1,
			"Gia nh�p bang h�i r�i sau h�y n�i/Zgc_end_dialog"
		)
	elseif IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() ==3 then				--�жϰ��ְ��
		ApplyRelayShareData(GetTongName(),0,0,File_name,"ConfTaskGetCallBack")
	else
		Say("Chuy�n n�y kh� quan tr�ng! H�y g�i bang ch�, ph� bang ch� ho�c tr��ng l�o ��n nh�n nhi�m v�.",
			1,
			"Ta s� quay l�i sau!/Zgc_end_dialog"
		)		
	end
end
--*****************************����������ݴ洢�ص�************************
function ConfTaskGetCallBack(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--���������ж�--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--����--
	local tong_ID_save = Zgc_conf_task_time_return()
	if tong_ID == tong_ID_save then
		Say("Qu� bang �� nh�n m�t ph�n chu�i nhi�m v�, xin ki�m tra l�i ti�n �� ho�n th�nh.",
			2,
			"Ta mu�n xem ti�n �� c�a bang h�i/Zgc_conf_task_step_inq",
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	elseif tong_ID ~= tong_ID_save and tong_state == 3 then
		Say("Qu� bang �� ho�n th�nh nhi�m v� nh�ng ch�a nh�n ph�n th��ng, xin h�y nh�n ph�n th��ng!",
			2,
			"Ta mu�n nh�n Sinh Th�n Cang/Zgc_conf_task_pay",
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	else
		if tong_state == 2 and tong_num < Zgc_conf_task_goos_num[tong_level][1] then
			if tong_level_max > 1 then
				tong_level_max = tong_level_max - 1
				SendTongMessage("Do ch�a ho�n th�nh nhi�m v� B� Phi Y�n l�n tr��c n�n ��ng c�p nhi�m v� s� b� gi�m 1 c�p")
			end
		end
		if tong_level_max == nil or tong_level_max <= 0 then
			tong_level_max = 1
		end
		local dialog = {}
		for i = 1, tong_level_max do
			dialog[i] = "th�"..i.." c�p, c�n "..Zgc_conf_task_goos_num[i][1].." thu th�p v�t ph�m, c� th� ��i "..Zgc_conf_task_goos_num[i][2].." ph�n th��ng/#Zgc_conf_task_accept("..i..","..tong_level_max..")"
		end
			dialog[tong_level_max + 1] = "Ta v�n ch�a hi�u/Zgc_end_dialog"
		Say("Xin ch�n ��ng c�p nhi�m v� mu�n ti�p nh�n!:",
			getn(dialog),dialog
		)		
	end
end
--******************************�������****************************
function Zgc_conf_task_accept(task_level,level_max)
	local tong_ID = Zgc_conf_task_time_return()
	local tong_level = task_level
	local tong_num = 0											--�½����񣬽����ռ�ƷΪ0
	local tong_state = 2
	local tong_level_max = level_max
	if tong_level_max > getn(Zgc_conf_task_goos_num) then
		tong_level_max = getn(Zgc_conf_task_goos_num)
	end	
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Msg2Player("Bang h�i c�a ng��i �� nh�n nhi�m v� c�p"..task_level.."!")
	SendTongMessage(GetName().."�� nh�n "..task_level.." (c�p) nhi�m v�, th�nh vi�n trong bang c� th� ��n ti�u s� �� giao v�t ph�m")
	WriteLogEx(strLogCaption, "nh�n nhi�m v� Bang h�i", "", "", "", GetTongName())
end
--*************************���������Ʒ�ռ�����***********************
function Zgc_conf_taskgoods_turnin()
	local cent_num_save = Zgc_conf_task_cent_date(0,956)
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	if GetLevel() < 77 then
		Say("Ng��i ch�a �� n�ng l�c, c� g�ng luy�n th�m n�a nh�!",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	return
	end
	if IsTongMember() == 0 then
		Say("B� Phi Y�n kh�ng ph�i l� ng��i b�nh th��ng. Ng��i mau gia nh�p bang h�i, b�o bang ch� ��n g�p ta ngh� c�ch ��i ph� v�i B� Phi Y�n!",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
		return
	elseif task_id_save == Zgc_conf_task_time_return() and (Zgc_conf_task_num_max() - cent_num_save)<=0 then
			local dialog = ""
			if Zgc_conf_task_dist_date() == 1 then
				dialog = "Ng�y mai"
			else
				dialog = "Ng�y m�t"
			end
			Say("�i�m c�ng hi�n c�a ng��i hi�n l�:"..Zgc_conf_task_num_max()..","..dialog.."Th� n�a �i!",
				1,
				"Ta bi�t r�i/Zgc_end_dialog"
			)
			return
	else
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGoodsin")
	end
end
function CallBackGoodsin(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--���������ж�--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--����--
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	if tong_state == 2 then																--�ð����Ѿ���ȡ���񣬵����ռ���Ʒ��������
		local cent_remain = 0
		if task_id_save ~= Zgc_conf_task_time_return() then								--���жϸ��˵��ռ�Ʒ�������
			cent_remain = Zgc_conf_task_num_max()
		else
			cent_remain = Zgc_conf_task_num_max() - goods_num_save
		end
		Say("Qu� bang �� nh�n nhi�m v�, �i�m t�ch l�y hi�n l�:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..". ��ng c�p hi�n t�i c� th� thu th�p v�t ph�m c�ng hi�n cho bang h�i."..Zgc_conf_task_num_max().."�i�m t�ch l�y, tr� �i�m t�ch l�y h�m nay:"..cent_remain..". \n <color=red>Ta c�ng kh�ng th� qu�n ���c h�nh trang c�a ng��i, v�t ph�m n�o d�ng ���c ng��i t� c�t v�o r��ng nh�!<color>",
				2,
				"Ta c�n giao v�t ph�m/Zgc_task_goods_inconf",
				"Quay l�i sau nh�/Zgc_end_dialog"
			)
	elseif tong_state == 3 then
		Say("Nhi�m v� n�y �� ho�n th�nh. Bang ch�, ph� bang ch�, tr��ng l�o ��u c� th� ��n nh�n ph�n th��ng.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("Qu� bang �� ho�n th�nh nhi�m v� v� nh�n ph�n th��ng, xin ��i v�ng nhi�m v� sau.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	else
		Say("Qu� bang v�n ch�a nh�n nhi�m v� l�n n�y.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)			
	end
end
--*****************************��Ʒ�ռ�ȷ��***************************
function Zgc_task_goods_inconf()
	Say("Trong h�nh trang c�a ng��i kh�ng c� v�t ph�m n�o quan trong �� ch�!",
		2,
		"Ta mu�n giao v�t ph�m/Zgc_task_goods_change",
		"�� ta s�p x�p l�i h�nh trang/Zgc_end_dialog"
	)
end
--*****************************�ռ�������***************************
function Zgc_task_goods_change()															--�ռ�Ʒ�ļ���Ϳ۳�
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 200 then
		Say("H�nh trang kh�ng �� � tr�ng ho�c �� n�ng, h�y s�p x�p l�i.",0)
		return
	end
	local cent_count = 0
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	local cent_remain = 0
	if task_id_save ~= Zgc_conf_task_time_return() then								--���жϸ��˵��ռ�Ʒ�������
		cent_remain = Zgc_conf_task_num_max()
	else
		cent_remain = Zgc_conf_task_num_max() - goods_num_save
	end
	for i = 1,getn(Zgc_conf_task_coll_goods) do
		if cent_remain > 0 then
			local goods_num = GetItemCount(2,1,Zgc_conf_task_coll_goods[i][2])						--��Ʒ����
			local goods_cent = floor(goods_num * Zgc_conf_task_coll_goods[i][3])					--��Ʒ�ɶһ�����
			if  goods_num > 0 and goods_cent > 0 then										
				if goods_cent >= cent_remain then													--��Ʒ�ռ��Ƿ񵽴�400����
					local needs_num = floor(goods_num *cent_remain/goods_cent)
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],needs_num)		--ɾ���ռ�Ʒ
					if remove_flag == 0 then														
						break																		--ɾ��ʧ���˳�
					else
						cent_count = cent_count + cent_remain
						local nRnd = random(1,100)
						if nRnd <= CONFTASKBOSSCREATE_RATE and IsTongMember() >= 1 and IsTongMember() <= 5 and GetLevel() >= 50 then
							local add_flag = AddItem(2,0,545,1)
							if add_flag ~= 0 then
								Msg2Player("B�n nh�n ���c 1 Sinh Th�n Cang.")
								SendTongMessage(GetName().."Nh�n ph�n th��ng nhi�m v� B� Phi Y�n: 1 c�i Sinh Th�n Cang")
								WriteLogEx(strLogCaption, " nh�n 1 Sinh Th�n Cang", "", GetTongName())
							end
						end												
					end
					local dialog_date = ""
					if Zgc_conf_task_dist_date() ==  1 then
						dialog_date = "Ng�y mai"
					else
						dialog_date = "Ng�y m�t"
					end
					Say("Chu�i nhi�m v� n�y ng��i �� giao �� v�t ph�m,"..dialog_date.."Th� n�a �i!",
						1,
						"Ta bi�t r�i/Zgc_end_dialog"
					)
					break
				else
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],goods_num)		--ɾ���ռ�Ʒ
					if remove_flag == 0 then
						break
					else
						cent_count = cent_count + goods_cent
						cent_remain = cent_remain - goods_cent										--�����ύ���ռ�Ʒ���ּ���
					end
				end
			end
		end
	end																								--ɾ������ռ�Ʒ����
	if cent_count == 0 then
		Say("Ngay c� v�t ph�m nhi�m v� m� ng��i c�ng kh�ng c�, th�t m�t th�i gian c�a ta!",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	else
		Msg2Player("V�t ph�m c�a ng��i �� c�ng hi�n cho bang h�i"..cent_count.."�i�m t�ch l�y!")
		SetTaskTemp(157,cent_count)																	--�����Ͻ�����Ϣ������ʱ����
		local goods_cent_total = 0
		if Zgc_conf_task_cent_date(1,956) == Zgc_conf_task_time_return() then						--�����Ѿ��ύ���Ĵ���
			goods_cent_total = Zgc_conf_task_cent_date(0,956) + cent_count
			goods_cent_total = (goods_cent_total * 10000) + Zgc_conf_task_time_return()
		else																						--�������ֵ���Ϣ����ѹ��
			SetTask(958,GetTask(957))
			SetTask(957,GetTask(956))
			goods_cent_total = (cent_count * 10000) + Zgc_conf_task_time_return()
		end
		SetTask(956,goods_cent_total)
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackConfDeal")
	end
end
--*************************����ύ�ռ�Ʒ�İ�ᴦ��********************
function CallBackConfDeal(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local player_goods_num = GetTaskTemp(157)
	local dialog_date = ""
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date = "24h t�i nay "
	else
		dialog_date = "24h t�i mai "
	end
	local need_num = ""
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) then
		need_num =" �� ho�n th�nh."
	else
		need_num = "C�n thi�u "..(Zgc_conf_task_goos_num[tong_level][1] - tong_num - player_goods_num).."�i�m t�ch l�y."	
	end
	local money_prize = task_money_prize(player_goods_num)
	if money_prize ~= 0 then				---��Ǯ����
		Earn(money_prize)
		WriteLogEx(strLogCaption, "nh�n", money_prize, "ti�n v�ng", "", GetTongName())
	end
	SendTongMessage(GetName().."Ho�n th�nh nhi�m v� B� Phi Y�n"..player_goods_num.."�i�m t�ch l�y!")
	SendTongMessage("Chu�i nhi�m v� n�y ��n:"..dialog_date.." k�t th�c, qu� bang hi�n �� ho�n th�nh "..need_num)
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) and tong_state == 2 then
		SendTongMessage("Qu� bang �� ho�n th�nh thu�n l�i nhi�m v� S� m� ho�c c�a B� Phi Y�n, bang ch� ��n g�p Ti�u s� � Th�nh �� nh�n th��ng!")
		if tong_level_max < getn(Zgc_conf_task_goos_num) then
			tong_level_max = tong_level_max + 1
			SendTongMessage("Qu� bang �� ho�n th�nh nh�m v� B� Phi Y�n, c� th� nh�n"..tong_level_max.."!!")
		end
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],3,tong_level_max)
	else
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	end
	SetTaskTemp(157,0)
	SaveNow()
end
--**************************�����������ת��************************
function CallBackDataRepair(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,GetTongName())
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if tong_level_max == nil or tong_level_max <= 0 then
		tong_ID = 0
		tong_level = 0
		tong_num = 0
		tong_state = 0
		tong_level_max = 6
	end
	if tong_level_max >= 3 then
		WriteLog("Ph�c h�i s� l�n nhi�m v� bang h�i th�nh c�ng, t�n nh�n v�t:["..GetName().."] T�n bang h�i: ["..GetTongName().."]")
	end
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Say("Ng��i t�m ta c� vi�c g� kh�ng?",
		7,
		"Ta mu�n t�m hi�u nhi�m v� n�y/Zgc_conf_task_content",
		"Ta mu�n t�m hi�u con ng��i B� Phi Y�n/Zgc_conf_task_boss_con",
		"Ta mu�n xem ti�n �� c�a bang h�i/Zgc_conf_task_step_inq",
		"Ta mu�n n�p v�t ph�m/Zgc_conf_taskgoods_turnin",
		--"�����˽��������ɵĶ���/Zgc_conf_task_fini_list",
		"Bang ph�i c�a ta mu�n nh�n nhi�m v� n�y (bang ch�, ph� bang ch�, tr��ng l�o ��u c� th� ti�p nh�n)/Zgc_conf_task_get",
		"Bang ph�i c�a ta mu�n nh�n ph�n th��ng nhi�m v� (bang ch� nh�n)/Zgc_conf_task_pay",
		"Ta c� vi�c r�i/Zgc_end_dialog"
	)
end
--*****************************��Ǯ����***************************
function task_money_prize(cent)
	local money_prize = {2000,4000,7500,12000}
	local player_level = GetLevel()
	local money_num = 0
	if player_level <= 30 then
		money_num = floor(sqrt(player_level) * money_prize[1] * cent/400)
	elseif player_level <= 50 then
		money_num = floor(sqrt(player_level) * money_prize[2] * cent/400)
	elseif player_level <= 70 then
		money_num = floor(sqrt(player_level) * money_prize[3] * cent/400)
	else
		money_num = floor(sqrt(player_level) * money_prize[4] * cent/400)
	end
	return money_num
end
--*************************��ά�����躯��****************************
function Zgc_conf_task_pay()
	--0Ϊ��δ��ȡ����1Ϊ��ȡ������2��ȡ��������δ��ɣ�3Ϊ��ȡ�������Ѿ���ɵ���û����ȡ������4Ϊ������Ѿ���ȡ������
	if IsTongMember() == 0 then
		Say("Ng��i mu�n gia nh�p m�n ph�i.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
		return
	elseif IsTongMember() ~= 1 then
		Say("Ng��i kh�ng c� quy�n nh�n ph�n th��ng c�a bang h�i!",
			1,
			"Ta bi�t r�i/Zgc_end_dialog")
	else
		SetTaskTemp(Tasktemp_task_return,Zgc_conf_task_time_return())
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackPrizeGet")
	end
end
--****************************��ά��������ú���*********************
function CallBackPrizeGet(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--���������ж�--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--����--
	if tong_state == 2 then																--�ð����Ѿ���ȡ���񣬵����ռ���Ʒ��������
		if tong_ID == Zgc_conf_task_time_return() then
			Say("Qu� bang �� nh�n nhi�m v� nh�ng ch�a ho�n th�nh kh�ng th� nh�n ph�n th��ng. Xin ki�m tra l�i ti�n �� ho�n th�nh",
				2,
				"Ta mu�n xem ti�n �� c�a bang h�i/Zgc_conf_task_step_inq",
				"Ta bi�t r�i/Zgc_end_dialog"
			)
		else
			Say("Qu� bang ch�a nh�n nhi�m v� sao l�i l�nh th��ng?",
				1,
				"Ta bi�t r�i/Zgc_end_dialog"
			)
		end
	elseif tong_state == 1 or tong_state == 0 or tong_state == nil then
		Say("Qu� bang v�n ch�a nh�n nhi�m v� l�n n�y.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)			
	elseif tong_state == 3 then
		local box_num = Zgc_conf_task_goos_num[tong_level][2]
		if GetFreeItemRoom() < (floor(box_num/10) + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < box_num then									--=========================�ڴ˼��븺�غͿո������ж�
			Say ("Huynh �� n�y, s�p x�p l�i h�nh l� r�i h�y quay l�i nh�!",
				1,
				"Ta bi�t r�i!/Zgc_dialog_end"
			)
		else
			if GetTaskTemp(Tasktemp_task_return) ~= Zgc_conf_task_time_return() then
				return
			else
				SetTaskTemp(Tasktemp_task_return,(GetTask(Tasktemp_task_return)-1))
				local add_flag = AddItem(2,0,545,box_num)				--test
				if add_flag ~= 0 then
					Msg2Player("Nhi�m v� l�n n�y b�n nh�n"..box_num..", Sinh Th�n Cang.")
					SendTongMessage(GetName().."Nh�n ph�n th��ng nhi�m v� B� Phi Y�n: Sinh Th�n Cang"..box_num.."c�i")
				WriteLogEx(strLogCaption, "nh�n", box_num, "Sinh Th�n Cang", "", GetTongName())
				else
				WriteLogEx(strLogCaption, "", "", "", "", GetTongName(), "��i ph�n th��ng: Sinh Th�n Cang th�t b�i! Tr� ph�n h�i:"..add_flag)
				end
				AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],4,tong_level_max)
			end
		end
	elseif tong_state == 4 then
		Say("Qu� bang �� ho�n th�nh nhi�m v� v� nh�n ph�n th��ng, xin ��i v�ng nhi�m v� sau.",
			1,
			"Ta bi�t r�i/Zgc_end_dialog"
		)
	end
end
--***************************�Ի�������Ϊ�գ�**************************
function Zgc_end_dialog()
	
end
--***************************�ص���Ϊ�գ�**************************
function cb()

end
--**************************�ִμ��㺯��*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 61200)/(172800))
	return time_return
end
--**************************���������ڷ�װ����*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************��һ��ʱ�����*****************************
function Zgc_conf_task_dist_date()
	local date_tomorrow = floor((GetTime() + 25200)/(172800))
	if Zgc_conf_task_time_return() == date_tomorrow then
		return 2
	else
		return 1
	end
end
--*************************����ȡ�ռ�Ʒ���޼��㺯��**********************
function Zgc_conf_task_num_max()
	local ruturn_num = 0
	if GetLevel() > 50 then
		ruturn_num = 400
	else
		local num_seq = floor(GetLevel()/10)
		ruturn_num = Zgc_conf_task_goods_need[num_seq]
	end
	return ruturn_num
end
