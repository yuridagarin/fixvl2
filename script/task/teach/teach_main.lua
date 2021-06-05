
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ʵ�崦���ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ��������ͷ�ļ�
Include("\\script\\task\\teach\\teach_head.lua");

-- �����������ļ�
Include("\\script\\task\\teach\\teach_award.lua");

-- ��һ����Ұ�ŶԻ�
function task_000_00()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%y%m%d"))
--	if nNation ~= 89 then
--		Talk(1, "", "Giang h� �ang d�y s�ng, ta ph�i ngh� ng�i 1 t� �� !!!!!")
--		return 0
--	end
	
--	if nDate > 140406 then
--		Talk(1, "", "Giang h� �ang d�y s�ng, ta ph�i ngh� ng�i 1 t� �� !!!!!")
--		return 0
--	end
	
	local strMain = {
		"Hoan ngh�nh ��n v�i th� gi�i <color=yellow>V� L�m 2<color>! Ta chuy�n h��ng d�n <color=yellow>t�n th�<color>! C� mu�n t�m hi�u c� b�n v� <color=yellow>tr� ch�i<color> v� <color=yellow>gi�p �� l�m nhi�m v�<color> kh�ng?",
		"�a t� l�o ti�n b�i!/task_000_okay", 
		"Ta ��n th�m L�o ti�n b�i th�i m�!/task_000_01"
	}
	SetTask(1, 1);
	AddItem(2,0,505,1)
	SelectSay(strMain);

end;

-- ѡ����Ұ�Ž���
function task_000_okay()

	local strMain = {

		"Ng��i mu�n t�m hi�u v� v�n �� g�?",
		"Thao t�c c� b�n/Teach_Basic",
		"T�ng c�p nh�n v�t/Teach_Level",
		"Ph�n ph�i ti�m n�ng/Teach_Point",
		"Ph��ng ph�p ki�m ti�n/Teach_Earn",
		"Gia nh�p m�n ph�i/Teach_Faction",
		"Hi�n c� th� l�m /Teach_Something",
		"Ta �� hi�u r�i/task_000_00"

	}

	SelectSay(strMain);

end;


-- ��ʼ����ѧ����
function task_000_01()

	local strMain = {
		"<color=yellow>Ch� ti�m v� kh�, Ch� Ti�m Nam ph�c, Ch� Ti�m N� ph�c, Ch� Kim ho�n, Ch� D��c �i�m, Ch� T�p h�a<color> trong th�nh ��u l� nh�ng ng��i hi�u bi�t r�ng! H�y t�m h� h�c h�i!",
		"Ng��i th� ��n th�m h�, bi�t ��u s� nh�n ���c <color=yellow>V�t ph�m<color>. Nh� m� <color=yellow>B�n �� nh�<color> �i cho ti�n!"
	}

	TE_Talk("task_000_02",strMain);

end;

-- �������񣬸ı����������1
function task_000_02()
	SetTask(1, 1);
	TaskTip("��n g�p Ch� Ti�m v� kh�");
end;

-- ���������ϰ�ĶԻ�
function task_001_00()

	local strMain = {
		"Hoan ngh�nh b�ng h�u tham gia th� gi�i V� L�m. <color=yellow>V� kh�<color> c�a ta tuy ch� c�p 4 tr� xu�ng nh�ng c�ng l� �� nh�t c�a v�ng n�y. Mua �i! Ta s� h��ng d�n cho c�ch s� d�ng.",
		"Phi�n ti�n b�i ch� gi�o!/task_001_01",
		"Kh�ng c�n ��u!/task_001_02"
	}
	SelectSay(strMain);

end;

-- ���������ϰ彲��
function task_001_01()

	local strMain = {
		"H�nh t�u giang h�, c�n ph�i c� v� kh� �� ph�ng th�n. Nh�ng th� ��n gi�n nh� <color=yellow>H� th�<color>, <color=yellow>Ki�m<color>, <color=yellow>�m kh�<color>, <color=yellow>C�n<color> kh�ng c�n s� ph� h��ng d�n, nh�ng th� c�n l�i nh� �ao, c�m, b�t, tr��ng ph�i ���c h��ng d�n.",
		"V� kh� tr�n ng��i t��ng �ng v�i t�ng ��ng c�p, ng��i ch�i c� th� mua v� kh� th�ng th��ng � th� r�n, c�n nh�ng lo�i cao c�p ph�i t� t�o ho�c mua l�i t� ng��i ch�i kh�c.",
		"L�c tr��c ta c� giao ��u v�i cao th� ph�i t� ki�m ph�i Thanh Th�nh, may ���c m�t v� V� �ang ra tay c�u gi�p, tr�n tay �ng ta l� thanh b�o ki�m ���c kh�m ng�c, uy l�c kinh ng��i. Nghe n�i ��y l� lo�i k� th�ch h�c b�ch c� th� kh�m n�m l�n v� kh�.",
		"N�u ng��i g�p c� duy�n c� ���c b�o ki�m �� th� vi�c h�nh t�u giang h� xem ra r�t nh� nh�ng.",
		"Gi� ng��i c� th� �i g�p <color=yellow>Ch� Ti�m Nam ph�c<color>."
	}
	TE_Talk("task_001_02",strMain);

end;

-- ���꽲�⣬�ı����������2
function task_001_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� Ti�m v� kh�");
	if GetSex()==1 then
		TaskTip("��n g�p Ch� Ti�m Nam ph�c");
	else
		TaskTip("��n g�p ch� Ti�m N� ph�c");
	end;
end;

-- ���װ�����ϰ�ĶԻ�
function task_002_00_male()

	local strMain = {
		"Hoan ngh�nh b�ng h�u tham gia th� gi�i V� L�m. Ti�m ta chuy�n b�n trang ph�c nam c�p 4. Mua �i. Mua �i! Ta s� h��ng d�n v� c�ch s� d�ng <color=yellow>trang ph�c<color>.",
		"Phi�n ti�n b�i ch� gi�o!/task_002_01",
		"Kh�ng c�n ��u!/task_002_02"
	}
	SelectSay(strMain);
end;

-- ���װ��Ů�ϰ�ĶԻ�
function task_002_00_female()

	local strMain = {
		"Hoan ngh�nh b�ng h�u tham gia th� gi�i V� L�m. Ti�m ta chuy�n b�n trang ph�c n� c�p 4. Mua �i. Mua �i! Ta s� h��ng d�n v� c�ch s� d�ng <color=yellow>trang ph�c<color>.",
		"Phi�n ti�n b�i ch� gi�o!/task_002_01",
		"Kh�ng c�n ��u!/task_002_02"
	}
	SelectSay(strMain);
end;

-- ����װ���ϰ�Ľ���
function task_002_01()

	local strMaleMain = {
		"H�nh t�u giang h� vi�c trang b� cho m�nh m�t trang ph�c l� �i�u t�t y�u. trang ph�c � ��y c� kh�n ��u, th��ng y v� h� y, ch� � c�ch m�c <color=yellow>th��ng y<color> do li�n quan ��n ph�ng th�.",
		"Ch� ta ch� b�n c�c lo�i h� th� th�ng th��ng n�u mu�n c� trang ph�c t�t ph�i t�m th� gi�i ch� t�o. Th��ng trang ph�c t�t l�m ra kh�ng ��p l�m nh�ng l�i r�t hi�u qu� trong vi�c ph�ng th�. V� v�y nh�ng ng��i c� ti�n th��ng kho�c th�m <color=yellow>Ngo�i trang<color>.",
		"Ch� ta ch� b�n N�i trang. B�ng h�u c� th� ��n n�i kh�c t�m Ngo�i trang cho m�nh.",
		"��y c� m�n qu� nh�. Sau nh� chi�u c� b�n ti�m nh�! Gi� c� th� �i g�p <color=yellow>Ch� Kim ho�n<color>."
	}

	local strFemaleMain = {
		"H�nh t�u giang h� vi�c trang b� cho m�nh m�t trang ph�c l� �i�u t�t y�u. trang ph�c � ��y c� kh�n ��u, th��ng y v� h� y, ch� � c�ch m�c <color=yellow>th��ng y<color> do li�n quan ��n ph�ng th�.",
		"Ch� ta ch� b�n c�c lo�i h� th� th�ng th��ng n�u mu�n c� trang ph�c t�t ph�i t�m th� gi�i ch� t�o. Th��ng trang ph�c t�t l�m ra kh�ng ��p l�m nh�ng l�i r�t hi�u qu� trong vi�c ph�ng th�. V� v�y nh�ng ng��i c� ti�n th��ng kho�c th�m <color=yellow>Ngo�i trang<color>.",
		"Ch� ta ch� b�n gi�p N�i trang. B�ng h�u c� th� ��n n�i kh�c t�m Ngo�i trang cho m�nh.",
		"��y c� m�n qu� nh�. Sau n�y nh� chi�u c� b�n ti�m nh�! Gi� h�y �i g�p <color=yellow>Ch� Kim ho�n<color>!"
	}

	if GetSex()==1 then
		TE_Talk("task_002_02",strMaleMain);
	else
		TE_Talk("task_002_02",strFemaleMain);
	end;
	
end;

-- ���װ���ϰ�Ի������󣬸ı����������3
function task_002_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� ti�m trang ph�c");
	TaskTip("��n g�p Ch� Kim ho�n");
end;

-- ����Ʒ���ϰ�ĶԻ�
function task_003_00()

local strMain = {
	"Hoan ngh�nh b�ng h�u tham gia th� gi�i V� L�m. � ��y chuy�n b�n trang s�c c�p 2 v� s�n s�ng h��ng d�n v� c�ch s� d�ng <color=yellow>trang s�c<color>.",
	"Mong ti�n b�i ch� gi�o!/task_003_01",
	"Kh�ng c�n ��u!/task_003_02"
}
SelectSay(strMain);

end;

-- ����Ʒ����ϰ彲��
function task_003_01()

	local strMain = {
		"<color=yellow>Nam cao th�<color> th��ng mang Ng�c b�i, H� ph�, <color=yellow>N� k� hi�p<color> mang h��ng nang, H�ng li�n. C�n nh�n c� nam n� ��u �eo ���c.",
		"B�n ti�m bu�n b�n nh� kh�ng c�  b�o v�t qu�! H�y ra ngo�i r�ng th� v�n may xem!"
	}
	TE_Talk("task_003_02",strMain);
end;

-- ������Ʒ���ϰ彲�ⷢ�������ı����������4
function task_003_02()

	local strMain = {
		"C� <color=yellow>ch�t qu� m�n<color>! Sau n�y nh� chi�u c� b�n ti�m nh�! Gi� c� th� t�m <color=yellow>Ch� d��c �i�m <color>!"
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� Kim ho�n");
	TaskTip("��n g�p Ch� D��c �i�m");
	TE_Talk("",strMain);

end;

-- ��ҩ���ϰ�ĶԻ�
function task_004_00()

	local strMain = {
		"Hoan ngh�nh b�ng h�u tham gia th� gi�i V� L�m. � ��y chuy�n b�n d��c li�u c�p 2 v� s�n s�ng h��ng d�n v� c�ch s� d�ng <color=yellow>d��c li�u<color>.",
		"Phi�n ti�n b�i ch� gi�o!/task_004_01",
		"Kh�ng c�n ��u!/task_004_02"
	}
	SelectSay(strMain);

end;

-- ��ҩ���ϰ�Ľ���
function task_004_01()

	local strMain = {
		"H�nh t�u giang h� ��n d��c mang theo ph�ng th�n l� �i�u t�t y�u, g�n ��y v� l�m ��i lo�n m�t s� linh d��c qu� ph�i t� t�o ho�c nh� cao nh�n gi�p ��.",
		"N�u kh�ng c� ��n d��c ta ch� c� th� s� d�ng <color=yellow>d��c th�o<color>. Tuy c�ng hi�u kh�ng cao nh�ng gi�p �ch cho nh�ng ai m�i ��t ch�n v�o giang h�."
	}
	TE_Talk("task_004_02",strMain);

end;

-- ����ҩ���ϰ彲�����ֱ����������ı����������5
function task_004_02()

	local strMain = {
		"Ta c� 20 b�nh <color=yellow>Kim S�ng t�n<color> l�m qu�! Gi� c� th� g�p <color=yellow>Ch� T�p h�a<color>."
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� D��c �i�m");
	TaskTip("��n g�p Ch� T�p h�a");
	TE_Talk("",strMain);

end;

-- ���ӻ����ϰ�ĶԻ�
function task_005_00()

	local strMain = {
		"Hoan ngh�nh b�ng h�u tham gia th� gi�i V� L�m. � ��y chuy�n b�n �� c�c lo�i <color=yellow>v�t ph�m<color> v� c� h��ng d�n k�m theo, ng��i c�n g� n�o?",
		"Phi�n ti�n b�i ch� gi�o!/task_005_01",
		"Kh�ng c�n ��u!/task_005_02"
	}
	SelectSay(strMain);

end;

-- ���ӻ����ϰ�Ľ���
function task_005_01()

	local strMain = {
		"V�t ph�m tr�n giang h� mu�n h�nh v�n tr�ng, c�n hi�u r� �� v� sau s� d�ng! C�c lo�i {Ch�c C�m} v� {Da th�} c� th� ch� t�o H� gi�p. {C�c m�nh kim lo�i, B�o Th�ch} c� th� ch� t�oV� kh�.",
		"Ng� c�c d�ng ch� t�o l��ng th�c, chu sa v� linh huy�t d�ng luy�n linh ph�, ngo�i ra c�n m�t s� v�t ph�m th�n b�.",
		"Nghe n�i <color=yellow>Th��ng Nh�n th�n b�<color> �ang thu th�p k� tr�n d� b�o, ng��i th� ��n �� m�t chuy�n xem sao."
	}
	TE_Talk("task_005_02",strMain);

end;

-- �����ӻ����ϰ�Ľ�������ֱ����������ı����������6
function task_005_02()

	local strMain = {
		"B�n ti�m bu�n b�n nh�, ch� c� 2 t�m <color=red>Gi�m ��nh ph�<color> n�y t�ng b�n tr�! Sau n�y ��nh qu�i r�i <color=yellow>trang b�<color>, ch� c�n d�ng chu�t ph�i nh�n v�o Gi�m ��nh ph� ��a h�nh chu�t t�i trang b� l� c� th� bi�t ���c thu�c t�nh.",
		"Xem b�ng h�u c�ng m�t r�i! H�y v� g�p <color=yellow>D� T�u<color> xem c� th�nh gi�o ���c g� n�a kh�ng!"
	}
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� T�p h�a");
	TaskTip("Quay v� g�p D� T�u");
	TE_Talk("",strMain);

end;

-- ������Ұ�ŵĶԻ�
function task_006_00()

	local strMain = {
		"Thu ho�ch ���c g� r�i?",
		"C�c ch� ti�m t�ng r�t nhi�u ��, vui qu�!",
		"Haha! C�n nhi�u �i�u kinh ng�c n�a k�a! ��i ng��i ��t <color=yellow>c�p 4<color> l�i ��n t�m ta. �� �i�m kinh nghi�m nh� nh�n <color=yellow><F3><color> m� giao di�n thu�c t�nh <color=yellow>t�ng c�p<color> cho nh�n v�t. N�u b� th��ng v� ch� ta ch�a tr� mi�n ph�.",
	}
	TE_Talk("task_006_01",strMain);

end;

-- ��Ұ�ŶԻ�������ı����������7
function task_006_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("��n g�p D� T�u");
	TaskTip("Ra ngo�i th�nh luy�n c�ng, ��n c�p 4 quay l�i g�p D� T�u.");
end;

-- ���� 4 ��֮����Ұ�ŵĶԻ�
function task_007_00()

	local strMain = {
		"Ng��i ti�n b� nhanh v�y sao?",
		"Kh�ng! Qu�i b�n ngo�i m�nh l�m!",
		"<color=yellow>V� binh th�nh m�n<color> v� <color=yellow>V� s�<color> ngo�i th�nh r�t am hi�u c�ch chi�n ��u v� ph�n b� qu�i, h�y ��n �� th�nh gi�o �i."
	}
	TE_Talk("task_007_01",strMain);
end;

-- ��Ұ�ŶԻ�������ı����������8
function task_007_01()
	TE_SetTeachAdd();
	TaskTip("T�m v� binh th�nh m�n h�i khu v�c luy�n c�ng.");
end;

-- ����������ĶԻ�
function task_008_00()

	local strMain = {
		"C� th� ch� cho ti�u �i�t ��y ch� <color=yellow>luy�n c�ng<color> ���c kh�ng?",
		"Ng��i t�m ��ng ng��i r�i!",
		"Qu�i ���c ph�n b� b�n ngo�i th�nh ho�c g�n m�n ph�i, c�ng xa th�nh th� ��ng c�p qu�i c�ng m�nh, qu�i m�nh nh�t kho�ng <color=yellow>c�p 50<color>.",
		"Kh�ng n�n v�o c�c s�n ��ng v� n�i �� qu�i r�t m�nh.",
		"L�m sao �� bi�t qu�i n�i �� nguy hi�m?",
	}
	TE_Talk("task_008_00_01",strMain);

end;


function task_008_00_01()

	local strMain = {
		"�� nh�n bi�t qu�i ta nh�n <color=yellow>m�u s�c<color> t�n c�a ch�ng, <color=yellow>m�u tr�ng<color> ch� qu�i c�p th�p; <color=yellow>m�u ��<color> ch� qu�i c�p cao; <color=yellow>m�u xanh<color> ch� th� l�nh c�p nh�; <color=yellow>m�u v�ng kim<color> ch� th� l�nh c�p cao, c�n ph�i �� ph�ng!",
		"May qu�! L�c n�y ta ��nh gi�t m�y con qu�i ch� ��.",
		"Haha! T�n th� nh� ng��i ch� c� th� ��nh qu�i xung quanh th�nh th�i!",
		"��i ca c�n g� ch� gi�o kh�ng?",
		"Ta bi�t r� qu�i ph�n b� � ��u, n�u c�n th� ��n ��y <color=yellow>t�m hi�u<color> n�i luy�n c�ng th�ch h�p. C�n v� chi�n ��u th� t�m v� s� th�nh gi�o.",
		"Hi�u r�i! �a t� ��i ca! Ta �i t�m <color=yellow>V� s�<color> ��y!"
	}
	TE_Talk("task_008_01",strMain);

end;

-- �������Ի�������ı����������9
function task_008_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V� binh th�nh m�n");
	TaskTip("T�m v� s� h�c c�ch chi�n ��u");
end;

-- ����ʦ�Ի�
function task_009_00()

	local strMain = {
		"D� T�u b�o ta ��n t�m ti�n b�i h�c <color=yellow>c�ch chi�n ��u<color>.",
		"L�o phu ��y r�t th�ch h��ng d�n h�u b�i nh�ng tr��c ti�n ph�i hi�u <color=yellow>k� n�ng chi�n ��u<color>. Ng��i ph�n bi�t ���c c�ng k�ch tr�i v� c�ng k�ch ph�i kh�ng?",
		"Kh�ng hi�u l�m!",
		"B�n tr�i ch� ��nh V�t l�, b�n ph�i l� ��nh v� c�ng. C� th� s� d�ng <color=yellow>v� c�ng b�n ph�i<color> ��nh qu�i. V� c�ng m�n ph�i, m�t t�ch ho�c theo ta h�c ��u s� d�ng ���c.",
		"Kh�ng ng� b�n ph�i h�u hi�u ��n nh� v�y?",
		"Ng��i mu�n nhanh ch�ng h� ���c qu�i c�n ph�i bi�t <color=yellow>thu�c t�nh c�a ch�ng<color>.",
		"Ti�u b�i c� nghe v� binh n�i qua v� ��ng c�p qu�i, m�u s�c v� khu v�c ph�n b� c�a ch�ng.",
	}	
	TE_Talk("task_009_00_01",strMain);
end;

function task_009_00_01()

	local strMain = {
		"Trong th�c ti�n nh� v�y v�n ch�a ��, n�i v� <color=yellow>c�ch ��nh<color> �a s� qu�i ��u c� c�c d�ng nh� t�n c�ng b� ��ng, t�n c�ng ch� ��ng, t�n c�ng nh�n r�, bao v�y, ��t k�ch. Ch� c�n n�m r� l� c� th� ��i ph� ch�ng.",
		"Ti�n b�i h��ng d�n r� h�n ���c kh�ng?",
		"<color=yellow>T�n c�ng b� ��ng<color> ch� qu�i t� ��ng ��nh tr�; <color=yellow>T�n c�ng ch� ��ng<color> ch� qu�i t� ��ng t�n c�ng; <color=yellow>T�n c�ng nh�n r�<color> ch� qu�i nh�y b�n quan s�t ���c ��i ph��ng xu�t chi�u; <color=yellow>Bao v�y<color> ch� qu�i h� tr� cho ��ng ��i; <color=yellow>��t k�ch<color> ch� qu�i l��m v�t ph�m c�a ng��i ch�i, ph�i ��nh b�i ch�ng m�i l�y l�i ���c v�t ph�m.",
		"<color=yellow>Thu�c t�nh c�ng k�ch<color> c�a ch�ng th� sao?",	
	}
	TE_Talk("task_009_01",strMain);
end;

-- ����ʦ�Ի�����չ
function task_009_01()

	local strMain = {
		"<color=yellow>Thu�c t�nh c�ng k�ch<color> ch� t� ch�t qu�i c� th� thay ��i c�ng ph�ng, ch� y�u kim, m�c, th�y, h�a, th�, �m, v�. Qu�i c�p th�p kh�ng mang thu�c t�nh, qu�i t� c�p 20 m�i c� <color=yellow>thu�c t�nh ng� h�nh<color>, ch�ng thay ��i theo t�nh t��ng sinh t��ng kh�c ng� h�nh.",
			"V�y ta ph�i ch�n trang b� ng� h�nh, c�n <color=yellow>thu�c t�nh �m<color> th� sao?",
		"T� khi <color=yellow>m�nh S�n H� X� T�c<color> tan r�, m�t lo�i qu�i m�i mang thu�c t�nh �m xu�t hi�n, ch�ng kh�ng s� c�ng k�ch th��ng, v� kh� ng� h�nh hay v� c�ng ��n gi�n kh�ng th� �� th��ng ch�ng.",
		"Th�t b�i trong chi�n ��u tr�ng ph�t ra sao? C� t� vong kh�ng?",
	}
	TE_Talk("task_009_02",strMain);
end;

-- ����ʦ�Ի�����չ
function task_009_02()

	local strMain = {
		"Trong tr� ch�i kh�ng c� t� vong, n�u ��nh thua qu�i, ch� m�t 1% kinh nghi�m hi�n t�i, 5% ng�n l��ng v� m�t �t danh v�ng, kh�ng may c� th� b� <color=yellow>ngo�i th��ng<color> ho�c <color=yellow>n�i th��ng<color>. Chi�n ��u th�t b�i ng��i c� th� ch�n v� th�nh ho�c ��i cao th� Nga My ph�t gia ��n c�u, n�u c�u s�ng ch� t�n th�t ng�n l��ng v� danh v�ng m� kh�ng t�n th�t kinh nghi�m, n�i th��ng.",
		"Ti�n b�i c� th� ch� v�i chi�u cho ti�u b�i ���c kh�ng?",
		"Ta c� m�n v� <color=yellow>khinh c�ng<color> ��nh d�y ng��i, nh�ng l�i c� vi�c g�p r�i, th�i �� khi kh�c v�y.",
		"�a t� ti�n b�i! Ta ph�i quay v� g�p <color=yellow>D� T�u<color>."
	}
	TE_Talk("task_009_03",strMain);
end;

-- ����ʦ�Ի�������ı����������10
function task_009_03()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V� s�");
	LearnSkill(20)--ֱ��ѧ���Ṧ
	TaskTip("C�c h� �� l�nh h�i ���c khinh c�ng, c� th� quay v� g�p D� T�u")
end;

-- ��ȥ��Ұ�ŶԻ�
function task_010_00()

	local strMain = {
		"Ng��i �� bi�t c�ch chi�n ��u r�i �?",
		"Nghe v� s� v� v� binh ch� gi�o �� hi�u r� h�n m�t ch�t. �a t� ti�n b�i!",
		"��n c�p 6 nh� quay l�i t�m ta. Sao ng��i mang theo nhi�u �� v�y? ��n t�m <color=yellow>Th� kh�<color> xem sao!"
	}
	TE_Talk("task_010_01",strMain);
end;

-- ��Ұ�ŶԻ���ı����������11
function task_010_01()
	TE_SetTeachAdd();
	TaskTip("��n c�p 6 quay l�i t�m D� T�u.");
end;

-- �ȼ����� 6 ��ʱ������Ұ�ŵĶԻ�
function task_011_00()

	local strMain = {
		"Th� n�o r�i?",
		"Ch�ng c� g� th� v�, tuy h�c h�i ���c r�t nhi�u t� m�y ch� ti�m nh�ng h� ��u b�n. N�u c� ng��i <color=yellow>n�i chuy�n<color> th� hay bi�t m�y!",
		"Kh�ng vui l� ph�i r�i! Ng��i ph�i th��ng xuy�n n�i chuy�n v�i h�.",
		"Th� n�y v�y! H�y t�m <color=yellow>Ch� t�u l�u<color> v� <color=yellow>Ti�u s�<color>, kh�ng ch�ng h� s� ch� d�y ���c g� th�m!",
		"Hay qu�! V�y ti�u b�i �i t�m <color=yellow>Ch� t�u l�u<color> ��y!"
	}
	TE_Talk("task_011_01",strMain);
end;

-- ��Ұ�ŶԻ���ı����������12
function task_011_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch� t�u l�u");
	TaskTip("T�m ch� t�u l�u h�c c�ch giao l�u.");
end;

-- ���¥�ϰ�ĶԻ�
function task_012_00()
	local strMain = {
		"Ti�n b�i c� th� ch� cho c�ch <color=yellow>giao l�u<color> ���c kh�ng?",
		"��n gi�n th�i! Trong tr� ch�i mu�n ��i tho�i v�i ai ch� c�n nh�n ph�m <color=yellow><Ctrl><color> k�t h�p v�i chu�t ph�i l�n ��i ph��ng ch�n d�ng th�ch h�p l� ���c.",
		"<color=yellow>T�m hi�u<color>: Xem th�ng tin ��i ph��ng; <color=yellow>T�n g�u<color>: Chat m�t v�i ��i ph��ng; <color=yellow>Theo sau<color>: �i theo m�t ng��i n�o ��; <color=yellow>Giao d�ch<color>: M�i ng��i ch�i kh�c giao d�ch; <color=yellow>T� ��i<color>: M�i ng��i ch�i c�ng t� ��i.",
		"Ng��i ch�i kh�ng n�m trong ph�m vi th� giao l�u b�ng c�ch n�o?",
	}
	TE_Talk("task_012_00_01",strMain);
end;


function task_012_00_01()
	local strMain = {
		"Khi mu�n t�n g�u, nh�n <color=yellow><Enter><color> ho�c ch�n <color=yellow>T�n s� t�n g�u <color>, nh�p t�n ng��i ch�i v� n�i dung mu�n g�i �i, nh�n <Enter> l� ���c.",
		"T�n s� t�n g�u l� sao?",
		"C� nhi�u t�n s� �� t�n g�u. <color=yellow>T�n s� ph� c�n<color> ng��i ch�i xung quanh nh�n th�y. <color=yellow>T�n s� c�ng c�ng<color> ng��i ch�i to�n server nh�n th�y. <color=yellow>T�n s� h� th�ng<color> hi�n th� th�ng b�o c�a h� th�ng.",
		"<color=yellow>T�n s� ��i ng�<color> ch� trong ��i m�i th�y; <color=yellow>T�n s� M�n ph�i<color> ch� thu�c m�n ph�i m�i th�y; <color=yellow>B�n s� bang ph�i<color> ch� ng��i trong bang m�i th�y.",
		"Sao c� l�c ch�n t�n s� r�i v�n kh�ng t�n g�u ���c?",
	}
	TE_Talk("task_012_01",strMain);
end;

-- ���¥�ϰ�ĶԻ���չ
function task_012_01()

	local strMain = {
		"�� ��m b�o cho ch�t l��ng t�n g�u, m�i t�n s� ��u c� h�n ch� ri�ng. T�n s� m�n ph�i c�n ng��i ch�i ph�i gia nh�p m�n ph�i, c�ch nhau 1 ph�t. T�n s� c�ng c�ng ��i h�i ng��i ch�i tr�n c�p 30, c�ch nhau 3 ph�t. T�n s� b� h�n ch� s� hi�n m�u �� r�t d� nh�n th�y.",
		"Ta hi�u r�i!",
		"Mu�n k�t giao h�o h�u n�n t�m <color=yellow>Ti�u s�<color>, ng��i n�y c� nhi�u b�ng h�u, nh�t ��nh s� gi�p ���c ng��i!",
		"�a t� ti�n b�i! Ta �i t�m <color=yellow>Ti�u s�<color> ��y!"
	}
	TE_Talk("task_012_02",strMain);
end;

-- ���¥�ϰ�Ի���ı����������13
function task_012_02()
	TE_SetTeachAdd();
	TaskTip("T�m ti�u s� h�c c�ch k�t giao b�n h�u.");
end;

-- ����ʦ�ĶԻ�
function task_013_00()

	local strMain = {
		"Xin ti�n b�i ch� d�n cho nh�ng kinh nghi�m <color=yellow>K�t giao b�n h�u<color>!",
		"Qu� khen! ��n gi�n th�i mu�n k�t b�ng h�u v�i ai nh�n <color=yellow><ctrl><color> k�t h�p chu�t ph�i nh�p l�n ng��i ��i ph��ng ch�n <color=yellow>h�o h�u<color>, h� th�ng t� ��ng xin ph�p ng��i ch�i ��. N�u ��ng � t�n ng��i �� l�p t�c hi�n trong danh s�ch h�o h�u. V� sau ch� c�n nh�n <color=yellow><F6><color> l� bi�t ���c h� c� online hay kh�ng.",
		"Ta nghe c� ng��i n�i v� �� th�n thi�n, ti�n b�i c� th� n�i r� ���c kh�ng?",
	}
	TE_Talk("task_013_00_01",strMain);
end;

function task_013_00_01()
	local strMain = {
		"Ng��i ch�i sau khi tr� th�nh h�o h�u s� c� th�m <color=yellow>�i�m th�n thi�n<color>. Ng��i ch�i b�nh th��ng t� ��i ��nh qu�i, t�n g�u c�ng ���c t�nh �i�m th�n thi�n, m�t s� v�t ph�m ��c bi�t nh� hoa h�ng c�ng gi�p t�ng �i�m th�n thi�n. N�u tr�n 1000 �i�m th�n thi�n c� th� <color=yellow>K�t Ngh�a Kim Lan<color>, tr�n 1500 �i�m, hai ng��i kh�c gi�i c� th� ��n C� ��o t�m Nguy�t L�o k�t th�nh <color=yellow>phu th�<color>.",
		"H�o h�u, kim lan ho�c phu th� b�nh th��ng c�ng t� ��i luy�n c�ng s� ���c t�nh th�m kinh nghi�m.",
		"Th�o n�o g�n ��y c� nhi�u ng��i xin ���c t� ��i.",
		"R�nh r�i n�n �i g�p <color=yellow>V� N��ng<color>! B�y gi� c� th� quay v� g�p D� T�u.",
		"�a t�! Ta �i t�m <color=yellow>D� T�u<color> ��y!"
	}
	TE_Talk("task_013_01",strMain);
end;

-- ����ʦ�Ի�������ı����������14
function task_013_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ti�u s�");
	TaskTip("Quay v� g�p D� T�u");
end;

-- ������Ұ�ŵĶԻ�
function task_014_00()

	local strMain = {
		"Hi�u c�ch giao l�u r�i ph�i kh�ng?",
		"Hi�u r�i! Hay qu�!",
		"Gi� h�y �i m�i m�t ng��i b�n theo ng��i v� ��y, s� c� <color=yellow>L� v�t<color> cho ng��i! N�u kh�ng t�m ���c c� th� t� l�p t� ��i r�i m�i b�n h�u v�, nh�ng  <color=yellow>l� v�t<color> s� kh�ng t�t l�m!"
	}
	TE_Talk("task_014_01",strMain);
end;

-- ��Ұ�ŶԻ���ı����������15
function task_014_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("trao ��i nhi�m v� v�i ng��i kh�c");
	TaskTip("T�m m�t ng��i b�n ho�c t� t� ��i t�m D� T�u");
end;



-- ����ٴδ���������Ұ�ŶԻ�
-- ���������1 Ϊ�Ѿ����  2 Ϊ��û�����  3 Ϊѡ��֪����ô���  4 Ϊѡ��û�����
function task_015_check(nState)
	local strMain = {
		"C� m�n qu� nh� t�ng c�c ng��i, hy v�ng hai ng��i s� l� h�o h�u t�t c�a nhau.",
		"Mu�n g�t ta �? <color=yellow>h�o h�u<color> c�a ng��i ��u?",
		"Nh�n <color=yellow>t� ��i<color>, m�i ng��i kh�c gia nh�p t� ��i sau �� ��n t�m ta.",
		"Nhi�u ng��i ��n t�m ta r�i, ng��i c�n kh�ng nhanh ch�n!",
		"Hy v�ng ng��i t�m ���c ng��i b�n th�ch h�p.",
		"N�u kh�ng t�m ���c h�o h�u th� c� t� ��i v�i ai �� r�i ��n g�p ta!"
	
	
	}
	
	if (nState==1) then
		Talk(1,"task_015_01",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	elseif (nState==5) then
		Talk(1,"task_015_01",strMain[5]);
	elseif (nState==6) then
		Talk(1,"",strMain[6]);
	end
	
	return
	
end;

-- ������������֮��ı����������16
function task_015_01()

local strMain = {
	"��n c�p 8 nh� quay l�i nh�!"
}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Nhi�m v� k�t giao h�o h�u");
	TaskTip("Nhi�m v� ho�n th�nh ��n c�p 8 quay l�i t�m D� T�u!");
	TE_Talk("",strMain);
end;

-- ���� 8 ��֮���Ұ�ŵĶԻ�
function task_016_00()

	local strMain = {
		"Nhanh th�t! Ch� c�n 2 c�p n�a l� b�n tr� c� th� gia nh�p m�n ph�i r�i!",
		"C�ng nh� ti�n b�i h��ng d�n t�n t�nh.",
		"��ng kh�ch s�o, nhi�m v� c�a ta l� h��ng d�n T�n th� m�! Ng��i mau ��n c�c m�n ph�i t�m hi�u n�t <color=yellow>��c s�c<color> � ��.",
		"Nh�ng ti�u b�i c�n ch�a bi�t ph�i b�t ��u t� ��u!",
		"Trong m�i th�nh th� ��u c� <color=yellow>S� gi� m�n ph�i<color>, h�y ��n �� th�nh gi�o! L�n tr��c <color=yellow>B�ch Hi�u Sinh<color> c� h�i ta <color=yellow>6 c�u h�i<color>, chuy�n n�y tr� v� gi�p ta gi�i ��p ���c kh�ng?"
	}

	TE_Talk("task_016_01",strMain);
end;

-- ��Ұ�ŶԻ�������ı����������17
function task_016_01()
	TE_SetTeachAdd();
	TaskTip("T�m hi�u ��c s�c m�n ph�i v� tr� l�i 6 c�u h�i c�a D� T�u")
end;

-- �ٴλ�����Ұ�ŵĶԻ�
function task_017_00()
	Say("Ng��i hi�u h�t ��c s�c c�a c�c m�n ph�i ch�a?",2,"Hi�u r�i!/Teach_Qustion_001","Ch�a hi�u l�m!/task_exit");
	return
end;

-- ��ȫ��ȷ�Ļش������
function task_017_01()

	local strMain = {
		"Kh� l�m! Mang ��p �n n�y ��n g�p <color=yellow>B�ch Hi�u Sinh<color> �i!"
	}
	TE_Talk("task_017_02",strMain);
end;

-- �ı����������18
function task_017_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Hi�u v� c�c m�n ph�i");
	TaskTip("�em ��p �n n�i cho B�ch Hi�u Sinh");
end;

-- ��������ĶԻ�
function task_018_00()

	local strMain = {
		"Theo B�ch ti�n sinh ��p �n nh� v�y ��ng kh�ng?",
		"��ng r�i! Ng��i bi�t g� v� s�, hi�p, �n tam ��i <color=yellow>l�u ph�i<color>?",
		"Nh� ti�n sinh ch� gi�o!",
		"<color=green>B�ch Hi�u Sinh<color>: Giang h� c� th�p ��i ph�i ph�n bi�t l� Thi�u L�m, V� �ang, Nga My, C�i Bang, ���ng M�n, Minh Gi�o, C�n L�n, Ng� ��c, Th�y Y�n v� Thi�n Ba D��ng ph�, nh�ng hi�n c� 9 m�n ph�i thu nh�n �� t� l� Thi�u L�m, V� �ang, Nga My, C�i Bang, ���ng M�n, Ng� ��c, Thi�n Ba D��ng Ph�, C�n L�n, Th�y Y�n.",
		"<color=green>B�ch Hi�u Sinh<color>: Thi�u L�m c� 3 h��ng g�m Thi�n T�ng, V� T�ng v� T�c gia; V� �ang c� T�c gia v� ��o gia; Nga My c� T�c gia v� Ph�t gia; C�i Bang c� T�nh Y v� � Y; ���ng M�n c� m�t h��ng; Thi�n Ba D��ng Ph� c� Th��ng k� v� Cung k�; Ng� ��c c� C� S� v� Hi�p ��c; C�n L�n c� Thi�n S�; Th�y Y�n c� V� N� v� Linh N�. Nh�ng b�t c� c�c m�n ph�i cung c�p m�y h��ng tu luy�n, m�i ng��i ch� ���c ch�n m�t h��ng tu h�nh.",
		"<color=green>B�ch Hi�u Sinh<color>: 17 h��ng ch� ch�n ���c 1 th� ti�c nh�!",
		"<color=green>B�ch Hi�u Sinh<color>: V� v�y m�i c� l�u ph�i. 17 h��ng hay 20 h��ng chung quy c�ng l� s� , hi�p, �n tam ��i l�u ph�i. N�u c�c h� hi�u �i�u n�y th� s� kh�ng nghi ho�c r�i.",
		"Ti�n sinh n�i r� h�n ���c kh�ng?",
	}
	TE_Talk("task_018_00_01",strMain);
end;

function task_018_00_01()
	local strMain = {
		"S�, hi�p, �n th�c t� ch� h��ng tu luy�n c�a nh�n v�t, ng��i ch�i theo <color=yellow>s�<color> c� th�n th� c��ng tr�ng v� s�c m�nh h�n ng��i.",
		"Theo <color=yellow>Hi�p<color> s�c m�nh v� nhanh nhen c�n b�ng; theo <color=yellow>�n<color> kh�ng quan tr�ng b�n ngo�i, ch� y�u r�n luy�n tinh th�n.",
		"Ti�n sinh n�i xem ta n�n �i theo h��ng n�o?",
		"Ng��i ch�a gia nh�p m�n ph�i, sao ch�n ���c h��ng �i, n�n th�n tr�ng khi ��a ra quy�t ��nh.",
		"Ti�n sinh h��ng d�n th�m ���c kh�ng?",	
	}
	TE_Talk("task_018_01",strMain);
end;

-- ��������ĶԻ���չ
function task_018_01()

	local strMain = {
		"Th�t ra theo h��ng n�o c�ng c� �u �i�m ri�ng c�a n�, c�n ph�i ch�n l�a s� ph� sau khi gia nh�p m�n ph�i.",
		"Nhi�u m�n ph�i v� nhi�u h��ng tu luy�n, ta ph�i l�m sao?",
		"Tu h�nh t�y m�i ng��i th�i!",
		"�a t� ti�n sinh!",
		"H�y quay v� g�p <color=yellow>D� T�u<color> �i!"
	}
	TE_Talk("task_018_02",strMain);
end;

-- ��������Ի�������ı����������19
function task_018_02()
	TE_SetTeachAdd();
    Earn(100);
	ModifyReputation(4,0);
	GivePlayerExp(SKeyXinShou,"baixiaosheng")
	TaskTip("V� g�p D� T�u");
end;

-- �ٴλ�����Ұ�ŵĶԻ�
function task_019_00()

	local strMain = {
		"Sao �i l�u v�y? B�ch Hi�u Sinh n�i g�?",
		"B�ch ti�n sinh n�i v�i v�n b�i v� s� , hi�p, �n tam ��i l�u ph�i.",
		"B�ch Hi�u Sinh qu� th�t m�u tr� h�n ng��i, v� sau c�n g� ng��i c� ��n �� th�nh gi�o. ��t <color=yellow>c�p 9<color> ��n t�m ta! Gi� h�y �i th�nh gi�o <color=yellow>Ch� th��ng h�i<color>!"
	}
	TE_Talk("task_019_01",strMain);
end;

-- ��Ұ�ŶԻ�������ı����������20
function task_019_01()
	TE_SetTeachAdd();
	TaskTip("Ho�n th�nh nhi�m v� t�m hi�u m�n ph�i ��t c�p 9 t�m D� T�u");
end;

-- ��ҵ��� 9 ��֮���Ұ�ŶԻ�
function task_020_00()

	local strMain = {
		"30 n�m r�i�mau th�t!",
		"Ti�n b�i n�i 30 n�m tr��c l� sao?",
		"Kh�ng c� g�! Xin gi�p ta mang b�c th� cho <color=yellow>Tri�u Di�n Ni�n � Bi�n Kinh<color>, v� ta s� n�i sau!",
	}

	TE_Talk("task_020_01",strMain);

end;

-- ��Ұ�ŶԻ�������ı����������21
function task_020_01()
	TE_SetTeachAdd();
	TaskTip("D� T�u nh� b�n mang b�c th� cho Tri�u Di�n Ni�n � Bi�n Kinh");
	AddItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"yeshou3")
	RestoreStamina()
	--CreateTrigger(4,199,80);
end;


function task_021_00()

	local strMain = {
		"V� "..GetPlayerSex().." ��n ��nh c� v�i ta ch�ng?",
		"D� T�u nh� ta mang b�c th� cho ti�n b�i!",
		"Ra l� v�y! L�i b� phi�n ph�c n�a r�i!",
		"(Tri�u Di�n Ni�n m� th� ra xem)",
		"Ta ��i qu�, ng��i c� th� t�m cho ta 1 c�i <color=yellow>b�nh ng�<color> ���c kh�ng?",
		"M�a ki�m th� ���c, b�nh ng� th�.....",
		"B�nh ng� ��n gi�n th� c�ng kh�ng l�m ���c, sao h�nh t�u giang h�!",
		"Nh� k�! Ng��i m� <color=yellow>giao di�n k� n�ng<color> ch�n <color=yellow>tuy�t k� gia truy�n<color> sau �� nh�n <color=yellow>B�nh ng�<color> r�i <color=yellow>��ng �<color> l� ���c.",
		"�� v�n b�i th� xem!",
	}

	TE_Talk("task_021_01",strMain);

end;

-- ��������Ի�������ı����������22
function task_021_01()
	TE_SetTeachAdd();
	DelItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"zhaoyannian")
	TaskTip("Tri�u Di�n Ni�n nh� b�n l�m 1 c�i b�nh ng�");
end;



function task_022_00()

	local strMain = {
		"Ng��i qu� l� ng��i t�t b�ng, �� l�o phu k� ng��i nghe c�u chuy�n 30 n�m v� tr��c.",
		"L�m phi�n ti�n b�i!",
		"30 n�m tr��c th�i t� Tri�u Khu�ng D�n �o�t ���c <color=yellow>b�n �� S�n H� X� T�c<color> t� tay S�i Vinh, b� m�t li�n l�c c�c m�n ph�i c�ng t�m b�n �� kho b�u b�n trong ��ng th�i ph�t ��ng binh bi�n Tr�n ki�u, m�u �� so�i v�. Kh�ng ai bi�t �� ch�nh l� t�m b�n �� c�a Thi�n, ��a, Nh�n <color=yellow>Tam Gi�i ch�n ph�<color>, long m�ch c�a Trung Nguy�n, b�u v�t m� S�i Vinh �em t�nh m�ng ra gi�nh l�y. Vi�c l�m c�a th�i t� d�n ��n tr�i ��t c�m ph�n, trong ng�y ��i l� t� tr�i, S�n H� X� T�c ��t nhi�n h�a th�nh tro b�i, bay �i kh�p n�i.",
		"Th�i t� bi�t m�nh �� l�m ngh�ch � tr�i, ��o l�n c�n kh�n tam gi�i, y�u ma hi�n th�, Trung Nguy�n s�p l�m v�o ��i ki�p. �� s�a sai l�m, m�t b�n ch�n ch�nh l�i c�c c�c di�n, m�t kh�c b� c�o thi�n h�, hy v�ng t�m ���c ng��i ki�m l�i nh�ng m�nh b�n �� S�n H� X� T�c."
	};

	if GetItemCount(1,1,1)>=1 then
	    DelItem(1,1,1,1);
		TE_Talk("task_022_01",strMain);
		return
	else
		Say("Ch�a l�m xong b�nh ng� �? H�y m� k� n�ng s�ng ra xem �i!",0);
	end;
	
end;

-- ��������Ի�������ı����������23
function task_022_01()

	local strMsg = {
		"C�u chuy�n t��ng ch�ng ch�m v�o qu�n l�ng, ��t nhi�n c� tin th�i t� b�o b�nh qua ��i, ng��i k� v� kh�ng ph�i th�i t� Tri�u ��c Ph��ng m� l� em vua Tri�u Quang Ngh�a, tin ��n lan truy�n ��n d�n gi�n....100 ng�n binh l�nh c�a n��c Li�u �� k� c�n Nh�n M�n Quan, m�t s� h�o ki�t lai l�ch kh�ng r� chi�m c� L��ng S�n B�c, Th�nh �� ph� v� Tuy�n Ch�u ph� xung quanh xu�t hi�n nhi�u qu� qu�i.",
		"K� t� �� tin t�c v� t�m b�n �� S�n H� X� T�c lan truy�n kh�p Trung Nguy�n.",
		"T��ng lai kh�ng xa, Trung Nguy�n s� ph�i ��i m�t v�i m�t c�c di�n tranh gi�nh, t�n s�t l�n nhau �� c� ���c t�m b�n �� qu� gi� �y."
	};
	local strMain = {
		"Ta kh�ng th� khoanh tay ��ng nh�n, ph�i t�m c�ch c�u Trung Nguy�n th�i!",
		"S� ph�n do tr�i, ng��i ��ng qu� lo l�ng! ��t c�p 10 quay l�i t�m ta.",
		"Nh�t ��nh v�n b�i s� quay l�i!"
	};

	TE_SetTeachAdd();
	TaskTip("Luy�n ��n c�p 10 t�m Tri�u Di�n Ni�n");
	GivePlayerExp(SKeyXinShou,"zhaoyannian_wotou")
	TE_Talk("",strMsg);
	TE_Talk("", strMain);
end;

function task_023_00()

	local strMain = {
		"Kh� l�m! Kh�ng l�m ta th�t v�ng.",
		"Ta c� 3 b�c th� nh� mang cho <color=yellow>D� T�u<color>. L�m phi�n b�ng h�u qu�!",
		"S� kh�ng l�m ti�n b�i th�t v�ng!"
	}
	TE_Talk("task_023_01",strMain);
end;

-- ��������Ի�������ı����������24
-- �������������
function task_023_01()
	TE_SetTeachAdd();
	AddItem(2,0,49,3);
	TaskTip("Tri�u Di�n Ni�n nh� mang 3 b�c th� cho D� T�u");
end;


function task_024_00()

	local strMain = {
		"V� r�i �? Ng��i bi�t Tri�u Di�n Ni�n l� ai kh�ng?",
		"V�n b�i kh�ng bi�t!",
		"Tri�u Di�n Ni�n v�n ng��i ho�ng t�c, do ch�n c�nh tranh quy�n ch�n ho�ng cung m� quy�t ��nh b� h�t danh l�i, phi�u b�t giang h�.",
		"Th� ra l� v�y!",
		"Ng��i �� c� ch�t th�nh t�u, c� th� ��n c�c m�n ph�i h�c h�i th�m. C� g�ng nh�!",
		"�a t� ti�n b�i!"
	}
	TE_Talk("task_024_01",strMain);
end;


function task_024_01()

	local strMain = {
		"Ng��i gi�p ta chuy�n 3 b�c th� c�a Tri�u Di�n Ni�n ���c kh�ng?",
		"���c th�i! Nh�ng mang ��n cho ai v�y?",
		"Tri�u Di�n Ni�n lo c�c ��a ph��ng x�y ra <color=yellow>bi�n c�<color>, cho n�n mu�n li�n l�c c�c v� sau. <color=yellow>Kh�u Chu�n<color> ng��i ch�nh tr�c hi�n �ang l�m quan � <color=yellow>Bi�n Kinh<color>; <color=yellow>Ph�m Tr�ng Y�m<color> v�n quan hi�n � <color=yellow>Nam Th�nh ��<color>; <color=yellow>V��ng Nghi�p V�<color> th��ng gia s�nh s� hi�n � <color=yellow>Tuy�n Ch�u<color>.",
		"Ch� c�n mang th� ��n cho b�n h� l� ���c! ��y ta c� ch�t qu� t�ng ng��i, �i ���ng c�n th�n nh�!",
		"Xin �a t�! V�n b�i �i ��y."
	}
	TE_Talk("task_024_02",strMain);
end


-- ��Ұ�ŶԻ�������ı����������25
function task_024_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chuy�n giang h�");
	TaskTip("Ho�n th�nh nhi�m v� T�n th� c� th� phi�u b�t giang h�!");
	SetTask(130,1); --��ҵΰ
	SetTask(131,1); --��׼
	SetTask(132,1); --������
end;


-- ��������������
function task_giveout()
--	TE_SetTeachState(23);
	Say("Th�y ng��i b�n l�nh h�n ng��i, l�o ��y kh�ng c�n d�y nhi�u, v� sau �i�u g� kh�ng hi�u c� th� ��n t�m ta.", 0);
end;

-- ʲôҲ�����Ŀպ���
function task_exit()

end;






-- ��������
function Teach_Basic()

	local strMain = {
		"D�ng chu�t ch� v�o b�t k� n�i n�o trong b�n �� �� di chuy�n nh�n v�t. N�u kh�ng x�c ��nh ���c v� tr�, m� <color=yellow>B�n �� nh�<color>, d�u ch�m <color=yellow>v�ng<color> b�n trong ch� cho v� tr� c�a ng��i ch�i.",
		"Ra ngo�i th�nh n�u kh�ng may ch� chu�t l�n qu�i, nh�n v�t s� t� ��ng ��nh qu�i li�n t�c, c�n ch� �!",
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ����ȼ�����
function Teach_Level()

	local strMain = {
		"Nh�n v�t d�ng <color=yellow>�i�m kinh nghi�m<color> �� t�ng c�p. Nh�n <color=yellow><F3><color> m� Giao di�n trang b� nh�n v�t s� th�y <color=yellow>n�t t�ng c�p<color>. Khi �i�m kinh nghi�m l�n h�n kinh nghi�m �� t�ng c�p, c� th� <color=yellow>t�ng c�p nh�n v�t<color>. Sau khi t�ng c�p nh�n v�t s� c� <color=yellow>�i�m ti�m n�ng<color>. ��ng c�p c�ng cao �i�m ti�m n�ng c�ng nhi�u.",
		"C� nhi�u c�ch �� nh�n <color=yellow>�i�m kinh nghi�m<color>, nh� ��nh qu�i, l�m nhi�m v�, b� quan tu luy�n th�m ch� truy�n c�ng...Kinh nghi�m hi�n t�i �nh h��ng ��ng c�p v� k� n�ng nh�n v�t, n�n c�n ch� � t� l� ph�n b� c�n b�ng!"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ����Ǳ�ܵ����
function Teach_Point()

	local strMain = {
		"Nh�n v�t c� 5 ti�m n�ng: <color=yellow>S�c m�nh<color>, <color=yellow>N�i c�ng<color>, <color=yellow>G�n c�t<color>, <color=yellow>Th�n ph�p<color>, <color=yellow>Linh ho�t<color>.",
		"<color=yellow>S�c m�nh<color> quy�t ��nh ��nh ngo�i c�ng v� s�c l�c; <color=yellow>N�i c�ng<color> quy�t ��nh n�i l�c, ��nh n�i c�ng v� ph�ng th� n�i.",
		"<color=yellow>G�n c�t<color> quy�t ��nh sinh l�c v� ph�ng th� ngo�i; <color=yellow>Th�n ph�p<color> quy�t ��nh n� tr�nh, ch�nh x�c v� t�c �� ��nh; <color=yellow>nh�n r�<color> quy�t ��nh t�n c�ng ch� m�ng v� t� ��ng n� tr�nh, �nh h��ng ch�nh x�c v� t�c �� ��nh.",
		" LiT�n th� n�n t�ng nhi�u v�o <color=yellow>S�c m�nh<color> v� <color=yellow>G�n c�t<color>."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ����׬Ǯ
function Teach_Earn()

	local strMain = {
		"Ng��i c� th� ra ngo�i th�nh ��nh qu�i mang v�t ph�m v� b�n cho c�c ch� ti�m ho�c l�m m�t v�i nhi�m v� ��n gi�n. <color=yellow>B�ch Hi�u Sinh<color> trong th�nh c� c�u h�i cho T�n th�, ��p ��ng s� ���c ph�n th��ng. B�n c�nh �� tri�u ��nh c�n ph�i Kh�m Sai ��i th�n ti�p t� T�n th�, nh� n�m b�t c� h�i nh�!",
		"��n <color=yellow>c�p 10<color> c� th� mua b�n, v�n ti�u, t�m ki�m kho b�u, ��nh l�i ��i..."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ���ܰ�������
function Teach_Faction()

	local strMain = {
		"Hi�n c�c m�n ph�i �ang thu nh�n �� t�, ta th�y ng��i t� ch�t c�ng kh�ng t�, ch� c�n c� g�ng luy�n ��n c�p 10 ��i tho�i v�i <color=yellow>S� gi� m�n ph�i<color> l� c� th� gia nh�p.",
		"M�i m�n ph�i c� h��ng tu luy�n kh�c nhau, c�n t�m hi�u k� ��c s�c c�a h�."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ���ܵ�ǰ����������
function Teach_Something()

	local strMain = {
		"Ng��i m�i ra giang h� c�n <color=yellow>Giao l�u<color> nhi�u v�i ng��i trong th�nh!",
		"Ng��i c� th� ra ngo�i ��nh qu�i, nh�ng kh�ng n�n �i qu� xa v� n�i �� qu�i r�t m�nh, n�u l� b� th��ng v� t�m ta tr� li�u mi�n ph�. T�t nh�t �i c�ng ��ng ��i.",
		"N�u c� g�ng ho�n th�nh nhi�m v� h��ng d�n T�n th� s� c� l�i cho ng��i, c�n ch� � nh�ng c�u th�ng b�o b�n d��i ho�c nh�n <color=yellow><F11><color> �� xem h��ng d�n."
	}
	TE_Talk("task_000_okay",strMain);
end;





-- �����ʴ��������
function Teach_Qustion_001()
	Say("Gi� ta s� h�i ng��i m�t v�i v�n ��, c�u h�i 1: Hi�n c� m�y ��i ph�i thu nh�n �� t�?",4,"Th�p ��i m�n ph�i/Teach_Qustion_Error","B�t ��i m�n ph�i/Teach_Qustion_Error","C�u ��i m�n ph�i/Teach_Qustion_002","Tam ��i m�n ph�i/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("Tr� l�i t�t l�m! C�u h�i ti�p theo: Ki�m ph�p V� �ang xu�t th�n nh�p qu� do �� t� ��o gia hay �� t� t�c gia luy�n?",3,"��o gia �� t�/Teach_Qustion_003","T�c gia �� t�/Teach_Qustion_Error","C� hai ��u ��ng/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("Kh� l�m! C�u h�i 3: ���ng M�n ���c xem l� gia t�c m�n ph�i, v�y ng��i ph� tr�ch m�n ph�i l� ai?",4,"M�n ch�/Teach_Qustion_Error","L�o l�o/Teach_Qustion_004","Ch��ng m�n/Teach_Qustion_Error","T�ng qu�n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("C�u h�i ti�p theo: �� t� t�c gia Nga My s� d�ng binh kh� n�o?",4,"Th�ch/Teach_Qustion_Error","Ki�m/Teach_Qustion_Error","C�m/Teach_Qustion_005","B�t/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("��ng r�i! C�u h�i 5: V� c�ng Thi�u L�m tinh th�m kh� �o�n, 72 tuy�t k� danh ch�n thi�n h�. V�y Thi�u L�m c� m�y h��ng tu luy�n?",4,"M�t/Teach_Qustion_Error","Hai/Teach_Qustion_Error","Ba/Teach_Qustion_006","B�n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("C�u h�i cu�i c�ng: Nghe n�i �� t� C�i Bang c� � Y, T�nh Y, v�y �� t� T�nh Y tu luy�n v� c�ng n�o?",4,"C�n ph�p/Teach_Qustion_Error","Ch��ng ph�p/task_017_01","Thu�n d��ng/Teach_Qustion_Error","B�y/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("Nh�ng ta nghe ng��i ta n�i kh�ng ph�i nh� v�y, ng��i th� v� xem l�i!",1,"���c! �� ta xem l�i!/task_exit");
end
