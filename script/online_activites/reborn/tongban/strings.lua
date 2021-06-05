--=============================================
--create by zhoulimei 2009-12-28
--describe:Խ�ϰ�ת��ͬ��ϵͳ�ַ����ļ�
--Ϊ�����������ļ��еı������������ļ�����VET_201003_TONGBAN��ͷ
--=============================================


VET_201003_TONGBAN_STR_LOGTITLE = "Ban Dong Hanh";

VET_201003_TONGBAN_STR_MODE_NAME =  --ͬ��NPCģ����
{
    [1] = {"Th� tr�ng", "Th� x�m", "Th� �en"},
    [2] = {"Ti�u D� tr�", "Ong v�ng","��c Gi�p Tr�ng","D�i","H� Ly","B� c�p n��c"},
    [3] = {"S�i �i�n","Qu� �en","C� s�u1","C�c1","D�i h�t m�u","B� c�p","Ng�n H�","Th��ng Vi�n","Th� Qu�i1","G�u x�m","Ong ��c","Kim Gi�p"},
    [4] = {"S�i �i�n","Qu� �en","C� s�u1","C�c1","D�i h�t m�u","B� c�p","Ng�n H�","Th��ng Vi�n","Th� Qu�i1","G�u x�m","Ong ��c","Kim Gi�p", "H�ng B�o S� Gi�3","T�y B�c Tr�ng H�n","Nh�t Ph�m ���ng M�t S�","Xi H�a Tr��ng L�o","Oa Kh�u1","Ti�n N�1","N� Ti�u Ti�n","Tr� M�u H� V�"},
};

tPetInfo = {
	[1] 	= {"Th�",{"��c","C�i"}},
	[2] 	= {"Th�",{"��c","C�i"}},
	[3] 	= {"Th�",{"��c","C�i"}},
	[4] 	= {"Ng��i",{"Nam","N�"}},
	[5] 	= {"Ng��i",{"Nam","N�"}},
	[6] 	= {"Ng��i",{"Nam","N�"}},
	[7] 	= {"Linh Th�",{"D��ng","�m"}},
	[8] 	= {"Linh Th�",{"D��ng","�m"}},
	[9] 	= {"Linh Th�",{"D��ng","�m"}},
	[10] 	= {"Linh Th�",{"D��ng","�m"}},	
}

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

-- �i�m n�ng c�p, �i�m luy�n, v�ng, th�i d�ch, �i�m linh l�c c�n, �i�m linh l�c t�i �a, s� l�n luy�n linh l�c 1 ng�y
tRequireElement =
{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
}

tGP_Daily = {4,4,3,2,2}

VET_201003_TONGBAN_STR_LOG_ACTION =            
{
    [1] = "nh�n ���c ph�n th��ng b�n ��ng h�nh th��ng ng�y - ph�n th��ng qu�n c�ng:",
    [2] = "D�ng t�n NPC b�n ��ng h�nh l�i",
    [3] = "L�i ��ng c�p b�n ��ng h�nh",
    [4] = "Kh�ng t�t c� +5",
    [5] = "Kh�ng t�t c� +10",
    [6] = "Kh�ng t�t c� +20",
    [7] = "Ho�n th�nh nhi�m v� b�n ��ng h�nh th��ng ng�y, giao n�p",
    [8] = "S� d�ng t�i th�c ph�m",
}

VET_201003_TONGBAN_STR_SHOW_MASSAGE = 
{
    [1] = "Nh�p t�n c�a b�n ��ng h�nh:",
    [2] = "Th�i gian t�n t�i c�a b�n ��ng h�nh l� 24 gi� (bao g�m th�i gian r�i m�ng), sau 24 gi� s� t� ��ng bi�n m�t. N�u nh� kh�ng mu�n nh�n th�y n� c� th� tri�u h�i b�n ��ng h�nh m�i.",
    [3] = "��i hi�p �� nh�n nhi�m v�, h�y ho�n th�nh nhi�m v� hi�n t�i r�i m�i nh�n nhi�m v� m�i",
    [4] = "B�n ��ng h�nh c�a c�c h� c� c�p %d.",
    [5] = "�i�m s�c kh�e c�a b�n ��ng h�nh �� ��t ��n <color=yellow>300<color> �i�m, kh�ng th� ti�p t�c cho �n!",
    [6] = "S� d�ng t�i th�c �n th�nh c�ng, �i�m s�c kh�e c�a b�n ��ng h�nh hi�n t�i l� %d.",
    [7] = "Nh�n ���c tr�ng th�i kh�ng t�t c� t�ng %d.",
    [8] = "M�i ng�y ��i hi�p c� th� nh�n ���c <color=yellow>4<color> l�n nhi�m v� b�n ��ng h�nh, ch� c�n trong v�ng 1 ng�y ho�n th�nh <color=yellow>4<color> l�n nhi�m v� th� c� th� nh�n ���c ph�n th��ng th�t phong ph�. Hi�n t�i c� th� nh�n ���c <color=yellow>%d<color> l�n nhi�m v�. Gi�n c�ch 2 l�n nh�n nhi�m v� l� <color=yellow>30<color> ph�t.",
    [9] = "Mau �i t�m <color=yellow>%d<color> <color=yellow>%s<color>! Trong 1 ng�y ho�n th�nh <color=yellow>4<color> l�n nhi�m v� s� ���c ph�n th��ng th�t phong ph�. Tr��c m�t �� ho�n th�nh <color=yellow>%d<color> l�n nhi�m v�!",
    [10] = "�� nh�n ���c tr�ng th�i h� tr�!",
    [11] = "�i�m s�c kh�e hi�n t�i c�a b�n ��ng h�nh l�: <color=yellow>%d<color>. �i�m n�ng c�p l�: <color=yellow>%d<color>.",
    [12] = "B�n ��ng h�nh c�n c� s�c kh�e th�t t�t �� tr��ng th�nh, �i�m s�c kh�e cao nh�t l� <color=yellow>300<color>, b�n ��ng h�nh d�a v�o �i�m s�c kh�e �� l�n c�p. \n<color=yellow>C�ch n�ng c�p: <color> �i�m s�c kh�e c�a b�n ��ng h�nh s� t� ��ng gi�m, m�i l�n gi�m <color=yellow>10<color> �i�m s�c kh�e v� t�ng <color=yellow>1<color> �i�m n�ng c�p. B�n ��ng h�nh d�a v�o �i�m n�ng c�p �� l�n c�p. C�p 1  l�n c�p 2 c�n <color=yellow>600<color> �i�m n�ng c�p v� <color=yellow>1<color> long huy�t ho�n.",
    [13] = "H�y mau t�m <color=yellow>%d<color> <color=yellow>%s<color> !",
    [14] = "C�p 2 l�n c�p 3 c�n <color=yellow>3600<color> �i�m n�ng c�p v� <color=yellow>1<color> long huy�t ho�n, <color=yellow>1<color> ph�ng huy�t ho�ng, <color=yellow>1<color> k� l�n ho�n, <color=yellow>1<color> chi�n th�n ho�n. M�i l�n n�ng c�p xong h� th�ng s� t� ��ng ��t �i�m n�ng c�p th�nh <color=yellow>0<color>. \n<color=yellow>C�ch n�ng c�p: <color> c� th� s� d�ng <color=yellow>t�i th�c ph�m <color> �� t�ng �i�m s�c kh�e. B�n ��ng h�nh c� c�p c�ng cao s� nh�n ���c tr�ng th�i h� tr� c�ng cao ��!",
    [15] = "Trang k�",
    [16] = "Trang tr��c",
    [17] = "tr� l�i",
    [18] = "Giao n�p nhi�m v� b�n ��ng h�nh th��ng ng�y th�nh c�ng!",
    [19] = "N�ng c�p th�nh c�ng, b�n ��ng h�nh c� c�p l� <color=yellow>2<color>!",
    [20] = "N�ng c�p th�nh c�ng, b�n ��ng h�nh c� c�p l� <color=yellow>3<color>!",
    [21] = "Hi�n t�i ��ng c�p c�a b�n ��ng h�nh <color=yellow>%d<color>, �i�m s�c kh�e <color=yellow>%d<color>, �i�m n�ng c�p <color=yellow>%d<color>.",
    [22] = "Nh�n ���c %d �i�m qu�n c�ng",
    [23] = "H�m nay ��i hi�p �� ho�n th�nh <color=yellow>%d<color> nhi�m v�, c�n c� th� ho�n th�nh <color=yellow>%d<color> nhi�m v�.",
}

VET_201003_TONGBAN_STR_YIN_DIALOG =             --�Ż�ӡʹ�öԻ�
{
    "Tri�u h�i b�n ��ng h�nh" .. "/vet_201003_tongban_call_partner",
    "Nhi�m v� b�n ��ng h�nh th��ng ng�y" .. "/vet_201003_tongban_daily_task",
    "N�ng c�p b�n ��ng h�nh" .. "/vet_201003_tongban_upgrade_partner",
    "Nh�n tr�ng th�i h� tr�" .. "/vet_201003_tongban_get_assist",
    "R�i kh�i" .. "/vet_201003_tongban_end_dialog",
}



VET_201003_TONGBAN_STR_DAILY_TASK =             --ͬ���ճ�������ܽ���
{
    {"Nh�n nhi�m v� c�p 1" .. "/vet_201003_tongban_get_task", "N�i nhi�m v� c�p 1" .. "/vet_201003_tongban_hand_task","Hi�n th� nhi�m v�" .. "/vet_201003_tongban_show_task", "H��ng d�n nhi�m v� th��ng ng�y" .. "/vet_201003_tongban_task_explain", "Tr� l�i trang tr��c" .. "/vet_201003_tongban_menghuiyin_in", "R�i kh�i" .. "/vet_201003_tongban_end_dialog",},
    {"Nh�n nhi�m v� c�p 2" .. "/vet_201003_tongban_get_task", "N�p nhi�m v� c�p 2" .. "/vet_201003_tongban_hand_task","Hi�n th� nhi�m v�" .. "/vet_201003_tongban_show_task", "H��ng d�n nhi�m v� th��ng ng�y" .. "/vet_201003_tongban_task_explain", "Tr� l�i trang tr��c" .. "/vet_201003_tongban_menghuiyin_in", "R�i kh�i" .. "/vet_201003_tongban_end_dialog",},
    {"Nh�n nhi�m v� c�p 3" .. "/vet_201003_tongban_get_task", "N�p nhi�m v� c�p 3" .. "/vet_201003_tongban_hand_task","Hi�n th� nhi�m v�" .. "/vet_201003_tongban_show_task", "H��ng d�n nhi�m v� th��ng ng�y" .. "/vet_201003_tongban_task_explain", "Tr� l�i trang tr��c" .. "/vet_201003_tongban_menghuiyin_in", "R�i kh�i" .. "/vet_201003_tongban_end_dialog",},
}

VET_201003_TONGBAN_STR_UPGRADE_PARTNER = 
{
    [1] = "N�ng c�p b�n ��ng h�nh l�n c�p 2" .. "/#vet_201003_tongban_upgrade_partner_to(2)",
    [2] = "N�ng c�p b�n ��ng h�nh l�n c�p 3" .. "/#vet_201003_tongban_upgrade_partner_to(3)",
    [3] = "Xem �i�m n�ng c�p v� �i�m s�c kh�e b�n ��ng h�nh" .. "/vet_201003_tongban_view_point",
    [4] = "�i�u ki�n n�ng c�p" .. "/vet_201003_tongban_upgrade_condition",
    [5] = "Tr� l�i trang tr��c" .. "/vet_201003_tongban_menghuiyin_in",
    [6] = "R�i kh�i" .. "/vet_201003_tongban_end_dialog",
}

VET_201003_TONGBAN_STR_DAILY_TASK_ERROR =        --ͬ���ճ����������ʾ
{
    [1] = "V�n ch�a nh�n nhi�m v�!",
    [2] = "V�n ch�a ho�n th�nh nhi�m v�, h�y �i thu th�p v�t ph�m nh�!",
    [3] = "V�n c�n thi�u <color=yellow>%d<color> �i�m n�ng c�p m�i c� th� l�n c�p <color=yellow>%d<color>!",
    [4] = "B�n ��ng h�nh �� l�n c�p <color=yellow>2<color>!",
    [5] = "B�n ��ng h�nh �� l�n c�p <color=yellow>3<color>!",
    [6] = "Tr��c ti�n ph�i n�ng c�p l�n b�n ��ng h�nh c�p <color=yellow>2<color> ��!",
    [7] = "H�m nay �� nh�n <color=yellow>4<color> l�n nhi�m v�, ng�y mai l�i t�i nh�!",
    [8] = "Gi�n c�ch nh�n nhi�m v� th��ng ng�y l� <color=yellow>30<color> ph�t, c�n ph�i ��i th�m <color=yellow>%d<color> ph�t!",
    [9] = "V�n ch�a ho�n th�nh nhi�m v� m�!",
    [10] = "N�p nhi�m v� th�nh c�ng,",
    [11] = "C�c h� kh�ng ph�i l� th�nh vi�n c�a long t� h�i, kh�ng th� s� d�ng long t� �n!",
    [12] = "C�c h� kh�ng ph�i l� th�nh vi�n c�a ph�ng t� h�i, kh�ng th� s� d�ng ph�ng t� �n!",
    [13] = "C�c h� kh�ng ph�i l� th�nh vi�n c�a h� t� h�i, kh�ng th� s� d�ng h� t� �n!",
    [14] = "C�c h� kh�ng ph�i l� th�nh vi�n c�a �ng t� h�i, kh�ng th� s� d�ng �ng t� �n!",
    [15] = "C�c h� v�n ch�a chuy�n sinh!",
    [16] = "Xin l�i, tr�n h�nh trang c�c h� kh�ng c� long huy�t ho�n, nhanh ch�ng thu th�p v�t ph�m nh�!",
    [17] = "Tr�n h�nh trang kh�ng �� long huy�t ho�n, ph�ng huy�t ho�n, k� l�n ho�n, chi�n th�n ho�n. Thu th�p r�i h�ng l�m l�i nh�!",
    [18] = "��i hi�p v�n ch�a k�ch ho�t t�nh n�ng b�n ��ng h�nh!",
    [19] = "��i hi�p v�n ch�a c� b�n ��ng h�nh, h�y nhanh ch�ng k�ch ho�t nh�!",
}


                         
VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK =        --Խ��ͬ��ϵͳ  �ճ�����
{
    {"B�ch C�u Ho�n",30, {2, 1, 270, 1}},
    {"L�c Th�n ho�n",30, {2, 1, 1064, 1}},
    {"Tam Thanh ho�n",30, {2, 1, 1097, 1}},
    {"Qu�n C�ng Ch��ng",10, {2, 1, 9999, 1}},
}

VET_201003_TONGBAN_TB_PARTNER_UPGRADE =           --Խ��ͬ��ϵͳ  ͬ��������Ʒ
{
    {"Long Huy�t ho�n", {2, 1, 1002, 1}},
    {"Ph�ng Huy�t ho�n", {2, 1, 1004, 1}},
    {"K� L�n ho�n", {2, 1, 1003, 1}},
    {"Chi�n Th�n ho�n", {2, 1, 1005, 1}},
}

PET_CHANGE_MALE_DLG =
{
	"Ch�o c�u ch�! H�m nay m�nh l�m g� ��y?",
	"Ch�o c�u ch�! Nghe n�i � Bi�n Kinh c� ��nh nhau k�a! ",
	"Ch�o c�u ch�! M�y ng��i kia nh�n m�nh th�y gh�t qu�!",
	"Ch�o c�u ch�! M�nh b�t PK l�n ch� ?",
	"Ch�o c�u ch�! M�nh ra T�y Th�nh �� ch�i �i!",
	"Ch�o c�u ch�! M�nh �i tr�ng B�t Nh� �i!",
	"Ch�o c�u ch�! Ch� kia d� th��ng qu� k�a!",
	"Ch�o c�u ch�! M�nh ra B�c Tuy�n Ch�u ch�i �i!",
	"Ch�o c�u ch�! Ch�i Game nh� gi� g�n s�c kh�e nha!",
	"Ch�o c�u ch�! M�nh �i thu th�p T�ng Li�u t�i nguy�n �i!",
}

PET_CHANGE_FEMALE_DLG =
{
	"Ch�o c� ch�! H�m nay m�nh l�m g� ��y?",
	"Ch�o c� ch�! Nghe n�i � Bi�n Kinh c� ��nh nhau k�a! ",
	"Ch�o c� ch�! M�y ng��i kia nh�n m�nh th�y gh�t qu�!",
	"Ch�o c� ch�! M�nh b�t PK l�n ch� ?",
	"Ch�o c� ch�! M�nh ra T�y Th�nh �� ch�i �i!",
	"Ch�o c� ch�! M�nh �i tr�ng B�t Nh� �i!",
	"Ch�o c� ch�! Anh kia ��p trai qu� k�a!",
	"Ch�o c� ch�! M�nh ra B�c Tuy�n Ch�u ch�i �i!",
	"Ch�o c� ch�! Ch�i Game nh� gi� g�n s�c kh�e nha!",
	"Ch�o c� ch�! M�nh �i thu th�p T�ng Li�u t�i nguy�n �i!",
}

PET_RANDOM_CHAT_DLG =
{
	"C�i n�y th� c�n t�y! M� ch�c c�ng s�p r�i.",
	"C�n ch�a �� tu�i �� h�i c�u n�y ��u, ��ng li�u!",
	"N�i chung l� ��ng r�i! ��ng ngh� g� n�a.",
	"��p m� sao h�i kh� qu� dz�y ?",
	"Th�t v�y sao? Ngh� k� c�ng ��ng ��.",
	"C�ng ���c! nh�ng ��n m�a �i n�m sau ch�c m�i ���c.",
	"T�m tr�ng kh�ng vui, l�t b� tr� l�i!",
	"H�i th� th� sao b� tr� l�i!",
	"Chu�n kh�ng c�n ch�nh!",
	"B� c�n th�ch n�a n�i chi l� ai!",
}

PET_BUFF_TYPE =
{
	[4] = {"Kh�ng t�t c� +3", 1, {"state_add_allability", 3}},
}