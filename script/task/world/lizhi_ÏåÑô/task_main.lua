--������̽Ӫ��������ű�
--created by lizhi
--2005-8-18 16:43

--������NPC�ĶԻ��������Ĵ�������ǣ���ɶԻ�������ж�ضԻ�������
--���������Ա������������ܼ�����ȥ�����������û����������ʾ
--�Ժ����ʵ����NPC�Ի�ʱ����ѡ�������б��Ϳ��Խ�������������


Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

-----------------------------------����̽Ӫ-------------------------------------

function task_01_00()
    local szTalk = {
        "Chuy�n n�i ra d�i d�ng, v�a r�i t�i Bi�n Kinh v�n b�i �o�t ���c b�c th� c�a Thi�n �m gi�o Li�u qu�c, ti�n b�i xem qua!",
    	"[C�ng T�n Th� ��c b�c th�]",
    	"�a t� <sex>, ta s� �� ph�ng! V� c�ng t�m th��ng kh�ng th� �� th��ng ���c l�o phu! Ha! Ha! Ha!",
    	"Ti�n b�i v� c�ng c�i th�, c� d�p t�i h� c�ng mu�n th�nh gi�o v�i chi�u.",
    	"Ha! Ha! <sex> r�t c� ch� kh� nh�ng hi�n ta �ang c� vi�c h�n <sex> v�o d�p kh�c.",
    	"Chuy�n g�? T�i h� gi�p ���c kh�ng?",
    	"Nguy hi�m l�m, ta kh�ng d�m phi�n <sex>! Ta c� b�c th� mu�n g�i cho T� H�c Ch�n Nh�n � V� �ang, c� th� gi�p ta ���c kh�ng?",
        "���c th�i!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_XYTY, 2);
    DelItem(2,0,50,1);
    Msg2Player("��n V� �ang s�n t�m T� H�c Ch�n Nh�n");
    TaskTip("��n V� �ang s�n t�m T� H�c Ch�n Nh�n");
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan1")		--�鱦ɽ1
end;

function task_02_00()
    local szTalk = {
        "Xu�ng n�i l�u nh� v�y m� kh�ng c� tin t�c g� sao?",
    	"Tham ki�n ti�n b�i!",
    	"Mi�n l�! Mi�n l�! Kh�ng bi�t t�m b�n ��o c� chuy�n g�?",
    	"C�ng T�n Th� ti�n b�i nhi�u ng�y kh�ng nh�n ���c tin t�c n�n ph�i t�i h� ��n h�i th�m.",
    	"M�y h�m nay trong ph�i g�p m�t s� chuy�n b�n ��o ch�a li�n l�c k�p. Hi�n b�n ��o mu�n nh� ng��i ��n Thi�u L�m t�m nh� ��ng.",
    	"�� v�n b�i ��n �� m�t chuy�n!",
        "T�t qu�! �i ���ng c�n th�n!"
    };
    TalkEx("task_02_01", szTalk);
end;

function task_02_01()
    SetTask(TASK_XYTY, 3);
    Msg2Player("T�m th� ki�m nh� ��ng");
    TaskTip("T�m th� ki�m nh� ��ng");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan2")		--�鱦ɽ2
end;

function task_03_00()
    local szTalk = {
    	"L� l� la..",
    	"Cho h�i ��y c� ph�i {th� ki�m nh� ��ng} kh�ng?",
    	"��ng r�i! T�i h� L�c Th�i Thanh, huynh �� hay g�i Ki�m ��ng, k� b�n l� s� �� L�c Tr� B�nh hay c�n g�i Th� ��ng. Ch�ng Ta ph�ng m�nh s� ph� l�n Thi�u L�m, gi�a ���ng g�p Li�p h� Linh B�o s�n, hai b�n x�y ra tranh ch�p ch�ng ��nh s� �� b� th��ng, ta kh�ng d�m v� g�p s� ph� v� �� ph�m gi�i nh�ng l�i s� th��ng t�ch c�a s� ��...",
    	"Th�i �� ta gi�p hai ng��i v� n�i v�i s� ph�.",
        "�a t� <sex>."
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_XYTY, 4);
    Msg2Player("V� b�m b�o T� H�c Ch�n Nh�n");
    TaskTip("V� b�m b�o T� H�c Ch�n Nh�n");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan3")		--�鱦ɽ3
end;

function task_04_00()
    local szTalk = {
        "T�m ���c hai �� t� c�a ta kh�ng?",
    	"�� t� c�a qu� ph�i gi�a ���ng kh�ng may g�p b�n x�u �� th��ng, hi�n �i ��ng b�t ti�n v�n b�i v� th�ng b�o tr��c cho ti�n b�i!",
    	"B�n ch�ng kh�ng nghe l�i b�n ��o, l�i d�ng v� v�i ng��i kh�c, l�n n�y v� nh�t ��nh ph�i d�y d� cho th�t t�t.",
    	"Ti�n b�i khoan n�ng v�i, tr��c ti�n tr� th��ng t�ch cho L�c �� ��, ��i h� v� h�i ��u �u�i c�u chuy�n x� ph�t c�ng ch�a mu�n.",
    	"Th�i ���c! �� ch�ng t�nh d��ng th�m v�i ng�y, � ��y c� m�y vi�n D�n S�n ��n chuy�n tr� n�i th��ng nh�ng ta c�n th�m H� C�t t�u l�m m�i thu�c, ng��i gi�p ta t�m ���c kh�ng?",
    	"Vi�c n�y �� v�n b�i lo!",
        "Phi�n b�ng h�u ��n Linh B�o s�n l�y gi�p ta 10 b� H� c�t v� ��y!"
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    SetTask(TASK_XYTY, 5);
    CreateTrigger(0, 518, KILL_XY_LAOHU); --ɱ�ϻ�
    Msg2Player("Gi�t h� d� � Linh B�o s�n l�y 10 c�i h� c�t");
    TaskTip("Gi�t h� d� � Linh B�o s�n l�y 10 c�i h� c�t");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan4")		--�鱦ɽ4
end;

function task_05_00()
	local szTalk = {
		"Phi�n b�ng h�u ��n Linh B�o s�n l�y gi�p ta 10 b� H� c�t v� ��y!"
	};
	TalkEx("task_06_02", szTalk);
end;

function task_06_00()
    local szTalk = {
        "T�m ���c h� c�t ch�a?",
	    "T�m ���c r�i!",
        "Phi�n b�ng h�u �em H� C�t M�n s�n ��n cho hai �� t� ta."
    };
    local szNot = {
        "H� c�t v�n ch�a t�m �� �?",
	    "V�n b�i �i ngay!"
	};
    if GetItemCount(2,0,55) >= 10 then
        TalkEx("task_06_01", szTalk);
    else
        TalkEx("task_06_02", szNot);
    end;
end;

function task_06_01()
    SetTask(TASK_XYTY, 7);
    RemoveTrigger(GetTrigger(KILL_XY_LAOHU));
    DelItem(2,0,55,10);
    AddItem(2,0,204,1);   --����XX������ʱ�ñ���
    Msg2Player("�em H� C�t M�n s�n ��n cho th� ki�m nh� ��ng");
    TaskTip("�em H� C�t M�n s�n ��n cho th� ki�m nh� ��ng");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan5")		--�鱦ɽ5
end;

function task_06_02()
    if GetTrigger(KILL_XY_LAOHU) == 0 then
        CreateTrigger(0, 518, KILL_XY_LAOHU); --ɱ�ϻ�
    end;
end;

function task_07_00()
    local szTalk = {
        "Ta mong tin qu�! Ch��ng m�n n�i sao?",
    	"T� H�c Ch�n Nh�n b�o hai ng��i tr� th��ng tr��c, ��y l� linh d��c.",
    	"�a t� c�u m�ng!",
    	"[Ki�m ��ng ��a thu�c cho th� ��ng]",
    	"Th�c ra kh�ng ph�i b�n ta v� c� ra tay m� v� t�nh nghe ���c b�n Li�p h� n�i v� c��p s�n trang, h� ��nh gi�t b�n ta di�t kh�u.",
    	"Xem ra hai ng��i c�ng c� � t�t �� ta v� b�m b�o v�i ��i nh�n.",
        "�a t� <sex>��"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    DelItem(2,0,204,1); --����xx��
    SetTask(TASK_XYTY, 8);
    Msg2Player("�em chuy�n b�m b�o l�i v�i T� H�c Ch�n Nh�n");
    TaskTip("�em chuy�n b�m b�o l�i v�i T� H�c Ch�n Nh�n");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan6")		--�鱦ɽ6
end;

function task_08_00()
    local szTalk = {
        "Ng��i c� d�n hai �� t� c�a ta v� kh�ng?",
    	"T�i h� th�y h� ch�a kh�i n�n v� ��y b�o tin tr��c nghe n�i h� b� h�m oan do can ng�n ��m Li�p h� c��p s�n trang.",
    	"H�m! V� ngh� h�c ch�a t�i ��u m� mu�n h�nh hi�p tr��ng ngh�a.",
    	"Ti�n b�i n�i ��ng.",
    	"Kh�ng d�m! Kh�ng d�m! M� ��ng r�i nghe ng��i n�i s�n trang kh�ng l� M� Tuy�t s�n trang, ng��i mau v� b�m b�o v�i C�ng T�n Th�, h�nh nh� h�n c� qua l�i trang ch� n�i ��.",
    	"V�n b�i �i ngay!",
        "Ng��i gi�p V� �ang r�t nhi�u, � ��y c� ch�t qu� xem nh� b�o ��p."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_XYTY, 9);
    Msg2Player("Th�ng b�o cho C�ng T�n Th�");
    TaskTip("Th�ng b�o cho C�ng T�n Th�");
    GivePlayerAward("Level_21", "hard", "legs", "Level_23");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan7")		--�鱦ɽ7
end;

function task_09_00()
    local szTalk = {
        "Chuy�n l�n r�i!",
    	"<sex> ��ng n�n h�t ho�ng, n�i cho ta nghe chuy�n g� n�o?",
    	"Trong l�c ��n V� �ang v� t�nh nghe tin b�n ng��i Linh B�o s�n c� � �� c��p {M� Tuy�t s�n trang} n�n ��n ��y th�ng b�o.",
    	"Ra l� v�y! M�y h�m nay ta c� nghe ��n chuy�n h�ng c�a M� Tuy�t s�n trang nh� Ti�u c�c chuy�n �i b� m�t t�ch, ch�c c� li�n quan ��n chuy�n. <sex> gi�p ta ��n Linh B�o s�n h�i nh�ng {Th� s�n} tr�n �� th� xem!",
        "Ti�n b�i y�n t�m, t�i h� �i ��y!"
    };
    TalkEx("task_09_01", szTalk);
end;

function task_09_01()
    CreateTrigger(0,519,KILL_XY_LIEHU);
    SetTask(TASK_XYTY, 10);
    Msg2Player("T�m Li�p h� Linh B�o s�n d� la tin t�c");
    TaskTip("T�m Li�p h� Linh B�o s�n d� la tin t�c");
    GivePlayerAward("Level_22", "easy");
	GivePlayerExp(SkeyBJKouzhun,"gongsunshu")		--Ѱ�ҹ�����
end;

function task_10_00()
    local szTalk = {
        "<sex> gi�p ta ��n Linh B�o d� la tin t�c b�n ng��i Li�p h� ���c kh�ng?"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    if GetTrigger(KILL_XY_LIEHU) == 0 then
        CreateTrigger(0,519,KILL_XY_LIEHU);
    end;
end;

function task_11_00()
    local szTalk = {
        "Chuy�n �i l�n n�y <sex> thu th�p ���c g�?",
	    "Ta ph�t hi�n tr�n ng��i Li�p h� c� c� c�a ti�u c�c, c� th� ti�u s� �� b� h�m h�i. Vi�c n�y x� l� ra sao, xin ti�n b�i ch� gi�o.",
	    "Chuy�n gi�t ng��i �� cho quan ph� gi�i quy�t. Tr��c m�t <sex> gi�p ta ��n Linh B�o s�n t�m h�ng h�a b� th�t l�c.",
        "���c th�i!"
    };
    local szNot = {
        "Chuy�n �i l�n n�y <sex> thu th�p ���c g�?",
	    "Ta ph�t hi�n tr�n ng��i Li�p h� c� c� c�a ti�u c�c, do g�p g�p n�n ch�a k�p mang v�.",
	    "S� vi�c h� tr�ng <sex> ph�i mang c� cho ta xem m�i ���c."
	};
    if GetItemCount(2,0,56) >= 1 then
        TalkEx("task_11_01", szTalk);
    else
        TalkEx("task_10_01", szNot);
    end;
end;

function task_11_01()
    DelItem(2,0,56,1);
    SetTask(TASK_XYTY, 12);
    Msg2Player("��n Linh B�o s�n ��nh Li�p h� mang 20 ki�n h�ng v�");
    TaskTip("��n Linh B�o s�n ��nh Li�p h� mang 20 ki�n h�ng v�");
    GivePlayerAward("Level_22", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshanduobiao1")		--�鱦ɽ����1
end;

function task_12_00()
    local szTalk = {
        "M� Tuy�t s�n trang m�t nhi�u h�ng h�a, phi�n <sex> t�m v�.",
        "V�n b�i �i ngay!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_13_00()
    local szTalk = {
        "Xem <sex> vui m�ng v�y ch�c l�y ���c h�ng h�a v� r�i!",
    	"Ti�n b�i ��ng c��i, ��y l� tang v�t ch� ti�n b�i gi�i quy�t.",
    	"�� ta xem! Sao c� b�c th� M� Tuy�t s�n trang g�i cho T�y H�?",
    	"[C�ng T�n Th� xem k� n�i dung trong th�]",
    	"Trong th� ghi chuy�n h�ng n�y M� Tuy�t s�n trang c��p ���c t� V� �ang ph�i. Chuy�n n�y c� v� kh� nghi, ng��i mau t�m T� H�c Ch�n Nh�n x�c minh th� xem!",
        "V�n b�i ��n V� �ang ��y!"
    };
    local szNot = {
        "M� Tuy�t s�n trang m�t nhi�u h�ng h�a, phi�n <sex> t�m v�.",
        "V�n b�i �i ngay!"
    };
    if GetItemCount(2,0,57) >= 20 then
        TalkEx("task_13_01", szTalk);
    else
        TalkEx("task_10_01", szNot);
    end;
end;

function task_13_01()
    RemoveTrigger(GetTrigger(KILL_XY_LIEHU));
    SetTask(TASK_XYTY, 14);
    Msg2Player("�em h�ng h�a ��n V� �ang cho T� H�c Ch�n Nh�n ki�m ch�ng");
    TaskTip("�em h�ng h�a ��n V� �ang cho T� H�c Ch�n Nh�n ki�m ch�ng");
    GivePlayerAward("Level_22", "hard");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshanduobiao2")		--�鱦ɽ����2
end;

function task_14_00()
    local szTalk = {
        "Ng�n gi� n�o ��a ng��i ��n ��y?",
    	"C�ng T�n Th� ti�n b�i nh�n ���c tin V� �ang b� m�t m�t s� v�t ph�m qu� n�n ph�i t�i h� ��n h�i th�!",
    	"Trong ph�i ch� c� m�y ng��i ch�c v� cao m�i bi�t. C�ng T�n Th� l�y tin t�c t� ��u?",
    	"Kh�ng gi�u g� t�i Linh B�o s�n v�n b�i ph�t hi�n chuy�n h�ng M� Tuy�t s�n trang, bi�t ���c b�n trong c� v�t ph�m qu� ph�i n�n �em ��n tr�.",
    	"Mau ��a b�n ��o xem!"
	};
	TalkEx("task_14_00_0", szTalk);
end;

function task_14_00_0()
    local szTalk = {
    	"[T� H�c Ch�n Nh�n ki�m tra h�ng h�a]",
    	"Ng��i bi�t ��y l� b�o v�t g� kh�ng?",
    	"V�n b�i kh�ng bi�t.",
    	"��y ch�nh l� Huy�n thi�t B�t Qu�i k�nh b�o v�t ch�n ph�i c�a V� �ang do b�n trong �n ch�a m�nh S�n H� X� T�c v� v�y m�i b� l�y tr�m."
	};
	TalkEx("task_14_00_1", szTalk);
end;

function task_14_00_1()
    local szTalk = {
    	"V�n b�i t�ng nghe D� T�u l�o nh�n n�i m�nh S�n H� X� T�c c� uy l�c v� bi�n nh�ng sao M� Tuy�t s�n trang l�i d� d�ng ��a cho ng��i kh�c?",
    	"Ta ��y c�ng kh�ng r�. Nh�ng b�n ��o c� m�t k� kh�ng ch�ng h�u d�ng.",
    	"Xin ��o tr��ng ch� gi�o!",
    	"Ng��i th� gi� d�ng ng��i ti�u c�c c�n s�ng ��n M� Tuy�t s�n trang d� la. Nh�ng ph�i h�t s�c c�n th�n!",
        "Mu�n v�o trong ch�c ph�i c� �m hi�u. �� v�n b�i t�m m�t s� ng��i h�i xem!"
    };
    TalkEx("task_14_01", szTalk);
end;

function task_14_01()
    DelItem(2,0,57,20);
    CreateTrigger(0,520,KILL_XY_MXSZ);
    SetTask(TASK_XYTY, 15);
    Msg2Player("Bu�c th��ng kh�ch, ki�m kh�ch M� Tuy�t s�n trang n�i ra �m hi�u");
    TaskTip("Bu�c th��ng kh�ch, ki�m kh�ch M� Tuy�t s�n trang n�i ra �m hi�u");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang1")		--ĺѩɽׯ1
end;

function task_15_00()
    local szTalk = {
        "M� Tuy�t s�n trang ph�ng th� nghi�m ng�t, kh� m� l�t v�o b�n trong.",
        "Mu�n v�o trong ch�c ph�i c� �m hi�u. �� v�n b�i t�m m�t s� ng��i h�i xem!"
    };
    TalkEx("task_15_01", szTalk);
end;
    
function task_15_01()
    if GetTrigger(KILL_XY_MXSZ) == 0 then
        CreateTrigger(0, 520, KILL_XY_MXSZ);
    end;
end;

function task_16_00()
    local szTalk = {
        "Ng��i l� ai?",
    	"Ta...ch�nh l� ng��i c�a Ch�n Uy ti�u c�c. Ti�u xa b� c��p ch� m�t m�nh ta tho�t ch�t, mau cho ta v�o b�m b�o v�i trang ch�.",
    	"Ng��i ti�u c�c �? Sao ta kh�ng bi�t v�y? C� �m hi�u kh�ng?",
    	"{M�} ai tr�m tr�m, {Tuy�t} d� h�n h�n, {S�n} l�c tr�ng tr�ng, {Trang} x� th�m th�m, ��ng kh�ng?",
    	"��ng l� ng��i nh�! H�y �i b�m b�o v�i C�u ��u Kim Ph�ng! Nh� �em theo l�nh b�i n�i c� vi�c c�u ki�n.",
        "[T�m l�nh b�i ti�n h�nh b��c ti�p theo]"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_XYTY, 17);
    CreateTrigger(0,520,KILL_XY_MXSZ);
    Msg2Player("��nh Th��ng kh�ch, Ki�m kh�ch l�y 1 L�nh b�i!");
    TaskTip("��nh Th��ng kh�ch, Ki�m kh�ch l�y 1 L�nh b�i!");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang2")		--ĺѩɽׯ2
end;

function task_17_00()
    local szTalk = {
        "T�m C�u ��u Kim Ph�ng. Nh� mang theo L�nh b�i!"
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    if GetTrigger(KILL_XY_MXSZ) == 0 then
        CreateTrigger(0,520,KILL_XY_MXSZ);
    end;
end;

function task_18_00()
    local szTalk = {
        "Ng��i l� ai? Kh�ng th�y ta �ang th��ng th�c r��u sao?",
    	"T�i h� l� ng��i c�a Ch�n Uy ti�u c�c, ti�u xa b� c��p � Linh B�o s�n, t�i h� may m�n tho�t kh�i, xin ��i t� s�p x�p.",
    	"Ai m� to gan d�m ��ng ��n M� Tuy�t S�n Trang?",
    	"L� ��m ng��i Li�p h� � Linh B�o s�n.",
    	"Chuy�n n�y �� ta lo li�u, xem ra vi�c l�y c�p b�u v�t V� �ang �� b� b�i l�! Ng��i h�y v�o Th�t Tinh ��ng b�o tin cho Ng�n H� tr��c!",
        "Thu�c h� tu�n l�nh."
    };
    local szNot = {
        "Ng��i l� ai? Kh�ng th�y ta �ang th��ng th�c r��u sao? ��ng qu�y r�y!",
        "[Xem ra ph�i �eo l�nh b�i m�i ���c]",
        "Thu�c h� l�p t�c c�o lui."
    };
    if GetItemCount(2,0,58) >= 1 then
        TalkEx("task_18_01", szTalk);
    else
        TalkEx("task_17_01", szNot);
    end;
end;

function task_18_01()
    DelItem(2,0,58,1);
    RemoveTrigger(GetTrigger(KILL_XY_MXSZ));
    SetTask(TASK_XYTY, 19);
    Msg2Player("V� b�m b�o T� H�c Ch�n Nh�n");
    TaskTip("V� b�m b�o T� H�c Ch�n Nh�n");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang3")		--ĺѩɽׯ3
end;

function task_19_00()
    local szTalk = {
        "Ng��i �i�u tra ���c g� r�i?",
        "B�m ��o tr��ng ��ch th�c l� M� Tuy�t s�n trang l�y c�p Huy�n thi�t B�t Qu�i k�nh, hi�n hung th� �ang �n n�p � {Th�t Tinh ��ng}.",
        "C� chuy�n n�y n�a sao? Th�t Tinh ��ng l� n�i nguy hi�m, k� ��ch d�m ��t nh�p v�o trong xem ra b�n ��o ph�i tri�u t�p �� t� ��n �� r�i.",
        "T�i h� t�nh nguy�n v�o trong b�t k� ��ch.",
        "Ng��i th�t gan d� nh�ng kh�ng n�n xem th��ng k� ��ch ph�i h�t s�c c�n th�n."
    };
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    SetTask(TASK_XYTY, 20);
    Msg2Player("��nh b�i Ng�n H�");
    TaskTip("��nh b�i Ng�n H�");
    GivePlayerAward("Level_31", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang4")		--ĺѩɽׯ4
end;

function task_21_00()
    local szTalk = {
        "Ng��i ��nh b�i t�n ��o t�c ch�a?",
        "T�n gi�c �� th� ch�t c�ng kh�ng ch�u khu�t ph�c, v�n b�i ch� t�m ���c m�t t�m Danh b�i!",
        "Danh b�i? ��a ta xem!",
        "[T� H�c Ch�n Nh�n c�m xem r�t l�u�]",
        "Ng��i th� mang cho C�ng T�n Th� xem, � ��y c� ch�t qu� m�n xem nh� b�n ��o t� �n ng��i."
    };
    TalkEx("task_21_01", szTalk);
end;

function task_21_01()
    SetTask(TASK_XYTY, 22);
    GivePlayerAward("Level_31", "hell", "chest", "Level_28");
	GivePlayerExp(SkeyBJKouzhun,"qixingdong")		--ĺѩɽׯ1
end;

-------------------------------------��������--------------------------------------

function task_22_00()
    local szTalk = {
        "Chuy�n �i V� �ang l�n n�y <sex> c� thu ho�ch g� kh�ng?",
    	"B�u v�t �� ��ch th�c c�a V� �ang nghe n�i b�n trong ch�a m�nh S�n H� X� T�c. T�i h� c�n ph�t hi�n m�n �� tr�n ng��i k� tr�m.",
    	"[��a Danh b�i cho C�ng T�n Th� xem]",
    	"��y l� qu�n hi�u T�y H�, kh�ng l� t�n tr�m �� l� l�nh T�y H�. Xem ra m�i quan h� gi�a M� Tuy�t s�n trang v� T�y H� th�t kh�ng ��n gi�n. <sex> ��n s�n trang m�t chuy�n �i�u tra xem sao.",
        "�� t�i h� �i h�i {C�u ��u Kim Ph�ng}."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    SetTask(TASK_XYTY, 23);
    DelItem(2,0,59,1);
end;

function task_23_00()
    local szTalk = {
        "Ng��i v� r�i �? Ng�n H� ��u?",
    	"T�i h� c� khuy�n m� c� n��ng �y kh�ng ch�u v�, ��y l� qu�n hi�u c� ta �� l�i.",
    	"H�m! D�m g�t ta �? ��y l� Qu�n hi�u, v�t b�t ly th�n c�a qu�n nh�n T�y H�, ng��i ch�nh l� ng��i c�a V� �ang! Ch�ng l� Ng�n H� �� ch�t d��i tay ng��i? Ta ph�i b�o th�!",
        "[B�i l� r�i, xem ra tr�n chi�n kh�ng th� tr�nh kh�i]"
    };
    TalkEx("task_23_01", szTalk);
    SetTask(TASK_XY_TEMP, GetTargetNpc());
end;

function task_23_01()
    ChangeNpcToFight(GetTask(TASK_XY_TEMP));

--    SetTask(TASK_XYTY, 24);
--    --log������
--    CreateTrigger(3, 204, LEAVE_GAME_XY);
--    SetLogType(GetTrigger(LEAVE_GAME_XY), 1); --����Ϊ�ų�����
--    
--    --rect ������
--    CreateTrigger(2,1301,LEAVE_RECT_XY);
--    
--    SetDeathScript("\\script\\task\\world\\lizhi_����\\task_Death.lua");
    Msg2Player("��nh b�i C�u ��u Kim Ph�ng");
    TaskTip("��nh b�i C�u ��u Kim Ph�ng");
end;

function task_25_00()
    local szTalk = {
        "Ng��i l� ng��i M� Tuy�t s�n trang �? Sao kh�ng th�y C�u ��u Kim Ph�ng?",
    	"��i t� d�n ta ��n ��y ��a m�t h�m.",
    	"[Th�c B�t K� nh�n m�t h�m]",
    	"Qu�n ��i �� chu�n b� s�n s�ng � {Ki�m M�n Quan} ch� hi�u l�nh {t�p k�ch th�nh T��ng D��ng}, ng��i mau v� b�m b�o v�i trang ch� chu�n b� ph�i h�p t�c chi�n.",
    	"[Kh�ng xong r�i qu�n ��i T�y H� �� ti�n v�o Ki�m M�n Quan, c�n ph�i ti�u di�t ��i qu�n ti�n phong tr��c]"
    };
    TalkEx("task_25_01", szTalk);
end;

function task_25_01()
    DelItem(2,0,60,1);
    CreateTrigger(0,521,KILL_XY_DB);
    CreateTrigger(0,522,KILL_XY_QB);
    Msg2Player("��nh b�i ��i qu�n ti�n phong c�a T�y H�");
    TaskTip("��nh b�i ��i qu�n ti�n phong c�a T�y H�");
    SetTask(TASK_XYTY, 26);
    SetTask(TASK_XY_TEMP, 0);
    SetTask(TASK_XY_TEMP1, 0);
    GivePlayerAward("Level_26", "normal");
	GivePlayerExp(SkeyBJKouzhun,"jianmenweiji")		--����Σ��
end;

function task_26_00()
    local szTalk = {
        "Qu�n ��i �� chu�n b� s�n s�ng � {Ki�m M�n Quan} ch� hi�u l�nh {t�p k�ch th�nh T��ng D��ng}, ng��i mau v� b�m b�o v�i trang ch� chu�n b� ph�i h�p t�c chi�n."
    };
    TalkEx("task_26_01", szTalk);
end;

function task_26_01()
    if GetTrigger(KILL_XY_DB) == 0 and GetTask(TASK_XY_TEMP) == 0 then
        CreateTrigger(0,521,KILL_XY_DB);
    end;
    if GetTrigger(KILL_XY_QB) == 0 and GetTask(TASK_XY_TEMP1) == 0 then
        CreateTrigger(0,522,KILL_XY_QB);
    end;
end;

function task_28_00()
    local szTalk = {
        "Chuy�n kh�ng hay r�i!",
    	"Kh�ng n�n h�t ho�ng, t� t� n�i.",
    	"V�n b�i ph�t hi�n qu�n ��i T�y H� �� ti�n v�o Ki�m M�n Quan, �ang chu�n b� t�p k�ch th�nh T��ng D��ng.",
    	"T��ng D��ng th�nh l� y�u �i�m n�u b� c�ng ph� th� h�u qu� kh�ng th� l��ng ���c.",
    	"Ti�n b�i kh�ng n�n lo l�ng t�i h� �� ��nh b�i ��i qu�n ti�n phong T�y H�, thi�t ngh� ch�ng kh�ng d�m manh ��ng.",
    	"Kh� l�m! Vi�c ��nh gi�c tr��c gi� ��u qua b� tr�n n�u ch�ng ta c� ���c b�n �� b�y binh b� tr�n c�a ��ch th� ph�n th�ng s� cao h�n. <sex> ��ng � ��n Ki�m M�n Quan t�m B� Tr�n �� c�a ng��i T�y H� kh�ng?",
        "Ti�n b�i y�n t�m t�i h� nh�t ��nh t�m ���c."
    };
    TalkEx("task_28_01", szTalk);
end;

function task_28_01()
    SetTask(TASK_XYTY, 29);
    CreateTrigger(0,523,KILL_XY_JMG);
    Msg2Player("T�m B� Tr�n �� T�y H�");
    TaskTip("T�m B� Tr�n �� T�y H�");
    GivePlayerAward("Level_26", "hard");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying1")		--����Σ��1
end;

function task_29_00()
    local szTalk = {
        "Vi�c ��nh gi�c tr��c gi� ��u qua b� tr�n n�u ch�ng ta c� ���c b�n �� b�y binh b� tr�n c�a ��ch th� ph�n th�ng s� cao h�n. <sex> ��ng � ��n Ki�m M�n Quan t�m B� Tr�n �� c�a ng��i T�y H� kh�ng?"
    };
    TalkEx("task_29_01", szTalk);
end;

function task_29_01()
    if GetTrigger(KILL_XY_JMG) == 0 then
        CreateTrigger(0,523,KILL_XY_JMG);
    end;
end;

function task_30_00()
    local szTalk = {
        "<sex> t�m ���c r�i �?",
    	"Ti�n b�i xem qua!",
    	"[C�ng T�n Th� nghi�n c�u k� B� Tr�n ��]",
    	"Qu�n ��i T�y H� ch� y�u l� b� binh, d�ng thu�t h�a trang �� d� tr� tr�n nh�ng t�c �� di chuy�n h�i ch�m, b�n trong B� Tr�n �� v� ra 3 ��i doanh l�n trong Ki�m M�n Quan, m�i ��i doanh ��u c� t��ng l�nh th�ng so�i. N�u c� th� t�p k�ch gi�t ch�t t��ng l�nh qu�n ��i, T�y H� l�p t�c ��i lo�n.",
        "Qu� l� cao ki�n! �� t�i h� �i gi�t 3 t�n t��ng l�nh T�y H�."
    };
    local szNot = {
        "<sex> t�m ���c r�i �?",
    	"Qu�n ��i T�y H� canh g�c nghi�m ng�t, kh�ng d� th�m nh�p ��i v�n b�i t�m l�i."
    };
    if GetItemCount(2,0,61) >= 1 then
        TalkEx("task_30_01", szTalk);
    else
        TalkEx("task_29_01", szNot);
    end;
end;

function task_30_01()
    DelItem(2,0,61,1);
    RemoveTrigger(GetTrigger(KILL_XY_JMG));
    --CreateTrigger(0,524,KILL_XY_JL);
    SetTask(TASK_XYTY, 31);
    SetTask(TASK_XY_TEMP, 0);
    Msg2Player("��nh b�i 3 t�n t��ng l�nh T�y H�");
    TaskTip("��nh b�i 3 t�n t��ng l�nh T�y H�");
    GivePlayerAward("Level_28", "easy");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying2")		--����Σ��2
end;

function task_32_00()
    local szTalk = {
        "Ta th�y <sex> �i h�i l�u c� ch�t lo l�ng nh�ng <sex> b�nh an tr� v� l� t�t r�i.",
    	"T�i h� t�m ���c m�y b�c th� tr�n ng��i t��ng l�nh ti�n b�i xem qua.",
    	"��a ta xem!",
    	"[C�ng T�n Th� ��c th�]"
	};
	TalkEx("task_32_00_01", szTalk);
end;

function task_32_00_01()
	local szTalk = {
	    "Kh�ng xong r�i ng��i T�y H� �� huy ��ng c� Nh�t Ph�m ���ng.",
    	"Ph�i t� ch�c quy t� nhi�u cao th� v� l�m kh�ng? Nh�ng � Ki�m M�n Quan t�i h� ch� ph�t hi�n m�y t�n l�nh qu�n, kh�ng th�y cao th� n�o h�t.",
    	"Trong th� ghi b�n Nh�t Ph�m ���ng t�p k�t � Ki�m C�c th�c ��o, c�ng vi�c h� chuy�n �m s�t t��ng l�nh, tr�m c�p v�n th�.",
    	"�� v�n b�i ��n {Ki�m C�c th�c ��o} m�t chuy�n.",
        "<sex> nh� �� � xem c� t�n v�t c�a b�n ch�ng kh�ng."
	};
    TalkEx("task_32_01", szTalk);
end;

function task_32_01()
    DelItem(2,0,62,3);
    SetTask(TASK_XYTY, 33);
    CreateTrigger(0,525,KILL_XY_SD);
    Msg2Player("T�m 10 Nh�t Ph�m b�i");
    TaskTip("T�m 10 Nh�t Ph�m b�i");
    GivePlayerAward("Level_28", "hell", "trinket", "Level_30");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying3")		--����Σ��3
end;

function task_33_00()
    local szTalk = {
        "Trong th� ghi b�n Nh�t Ph�m ���ng t�p k�t � Ki�m C�c th�c ��o, c�ng vi�c h� chuy�n �m s�t t��ng l�nh, tr�m c�p v�n th�.<sex> ��nh b�i b�n ch�ng l�y ���c t�n v�t s� c� l�c h�u d�ng."
    };
    TalkEx("task_33_01", szTalk);
end;

function task_33_01()
    if GetTrigger(KILL_XY_SD) == 0 then
        CreateTrigger(0,525,KILL_XY_SD);
    end;
end;

function task_34_00()
    local szTalk = {
        "<sex> v� r�i �? C� thu ���c g� kh�ng?",
    	"Kh�ng l�m ti�n b�i th�t v�n! ��y l� Danh b�i th�nh vi�n c�a ch�ng.",
    	"Kh� l�m! Ng��i ti�p t�c �i Ki�m M�n Quan t�m Th�c B�t K� xem h�n c� ph�n �ng g� kh�ng?",
        "Tu�n l�nh."
    };
    local szNot = {
        "<sex> c� �em t�n v�t c�a b�n ch�ng kh�ng?",
        "T�m th�i ch�a ��."
    };
    if GetItemCount(2,0,63) >= 10 then
        TalkEx("task_34_01", szTalk);
    else
        TalkEx("task_33_01", szNot);
    end;
end;

function task_34_01()
    RemoveTrigger(GetTrigger(KILL_XY_SD))
    DelItem(2,0,63,10);
    SetTask(TASK_XYTY, 35);
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"xixiajianrui1")		--���ļ���1
end;

function task_35_00()
    local szTalk = {
        "Ng��i ��n l�m g� n�a, ch�ng ph�i b�o ta t�m M酅",
    	"Th�i �i! Ki�m M�n Quan b� ng��i ta t�p k�ch, ��ng t��ng ta kh�ng bi�t!",
    	"A! T�n v� danh ti�u t�t c�ng d�m d�y ��i ta h�?",
    	"L�i c�a ��i nh�n ng��i qu�n r�i sao? Xem ��y l� g�!",
    	"L�...��i nh�n �� sao, ti�u nh�n kh�ng bi�t xin th� t�i!",
    	"Th�i �i! Ki�m M�n Quan b� ng��i ngo�i t�p k�ch, ng��i t�nh sao? Hay �� ta ra tay?",
    	"��i nh�n tha m�ng! Ti�u nh�n s� cho ng��i �i�u tra v� n�y, gi� ��i nh�n v� {Ki�m C�c th�c ��o} n�i gi�p v�i {Gia Lu�t B� Nham} gia h�n th�m v�i ng�y."
	};
	TalkEx("task_35_00_00", szTalk);
end;

function task_35_00_00()
    local szTalk = {
    	"[Kh�ng bi�t Gia Lu�t B� Nham c� lai l�ch nh� th� nao �� ta th� h�n]",
    	"V� l�! T�n c�a ��i nh�n ng��i ���c ph�p g�i sao?",
    	"Ti�u nh�n bi�t l�i! Mong ti�n b�i n�i gi�p v�i c�u tr��c {Gia Lu�t Kim Cang} ��i nh�n.",
    	"[Th� ra l� m�t trong Th�p ��i kim cang c�a Nh�t ph�m ���ng �ang l�m ��c qu�n � Ki�m C�c th�c ��o]",
        "T�m th�i tha cho ng��i, ��ng �� x�y ra chuy�n n�y n�a nh�!"
    };
    TalkEx("task_35_01", szTalk);
end;

function task_35_01()
    SetTask(TASK_XYTY, 36);
    Msg2Player("��nh b�i Gia Lu�t B� Nham");
    TaskTip("��nh b�i Gia Lu�t B� Nham");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"xixiajianrui2")		--���ļ���2
end;

function task_37_00()
    local szTalk = {
        "Ta th�y kh� s�c <sex> kh�ng ���c t�t, c� ph�i b� ng��i Nh�t Ph�m ���ng �� th��ng?",
    	"T�i h� kh�ng sao, nay ��n b�o tin m�ng cho ti�n b�i �� h� ���c Gia Lu�t B� Nham c�a Nh�t Ph�m ���ng, t�m th�i ch�ng kh�ng d�m h�nh ��ng.",
    	"L� ta ph�i ch�c m�ng <sex> m�i ��ng v� �� l�p ���c c�ng l�n.",
    	"��ng r�i! Tr�n ng��i Gia Lu�t B� Nham c� chi�c b�nh s�, v�n b�i kh�ng bi�t v�t g� mu�n nh� ti�n b�i xem.",
    	"[C�ng T�n Th� xem qua chi�c b�nh s�]",
        "B�n trong b�nh ch�a m�t s� d��c li�u, nh�t th�i ta kh�ng bi�t ch�ng l� g�, ng��i th� ��n ���ng M�n h�i ��c Si xem."
    };
    TalkEx("task_37_01", szTalk);
end;

function task_37_01()
    SetTask(TASK_XYTY, 38);
    Msg2Player("��n ���ng M�n t�m ��c Si");
    TaskTip("��n ���ng M�n t�m ��c Si");
    GivePlayerAward("Level_30", "hell");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao1")		--���ض�ҩ1
end;

function task_38_00()
    local szTalk = {
        "Ng��i l� ai?",
    	"��y c� ph�i l� ��c Si ti�n b�i? � ��y c� chi�c b�nh s� ch�a d��c li�u mu�n nh� ti�n b�i xem gi�p.",
    	"��c d��c g� n�a ��y? ��a ta xem!",
    	"[��c Si xem ng�i xong li�n l�y n�t chai ��y l�i]",
    	"��y l� Bi T� Thanh Phong, lo�i ��c v� s�c v� v� c�a Nh�t Ph�m ���ng, ai tr�ng ph�i trong 12 canh gi� kh�ng th� c� ��ng. Ta c� c�ch gi�i! H�y v�o Tr�c Ty ��ng t�m N� Ki�m kh�ch l�y 10 M� H�n h��ng, t�m th�m, 10 Ho�ng li�n, 5 ph�n Nhi�u minh ��u."
    };
    TalkEx("task_38_00_00", szTalk);
end;

function task_38_00_00()
    local szTalk = {
    	"[��c Si m� b�nh ra h�t m�nh m�t c�i]",
    	"��c Si ti�n b�i!",
    	"�.",
        "[Xem ra h�n ta b� �i�n r�i, mau gi�p t�m thu�c gi�i th�i]"
    };
    TalkEx("task_38_01", szTalk);
end;

function task_38_01()
    SetTask(TASK_XYTY, 39);
    DelItem(2,0,64,1);
    CreateTrigger(0,526,KILL_XY_NJX);
    Msg2Player("T�m cho ��c Si 10 M� h�n h��ng, 10 Ho�ng li�n, 5 Nhi�u minh ��u �� ch� thu�c gi�i");
    TaskTip("T�m cho ��c Si 10 M� h�n h��ng, 10 Ho�ng li�n, 5 Nhi�u minh ��u �� ch� thu�c gi�i");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao2")		--���ض�ҩ2
end;

function task_39_00()
    local szTalk = {
        "�.",
        "[Xem ra h�n ta b� �i�n r�i, mau gi�p t�m thu�c gi�i th�i]"
    };
    TalkEx("task_39_01", szTalk);
end;

function task_39_01()
    if GetTrigger(KILL_XY_NJX) == 0 then
        CreateTrigger(0,526,KILL_XY_NJX);
    end;
end;

function task_40_00()
    local szTalk = {
        "�.",
    	"��c Si ti�n b�i, thu�c gi�i ��y!",
    	"[��c Si d�ng s� thu�c b�n mang ��n]",
        "Kh�Kh�! Bi T� Thanh Phong qu� nhi�n l�i h�i tay ch�n ta ph�i qua 12 canh gi� m�i c� th� c� ��ng. L�n n�y l�o phu s� � ��nh gi� th�p lo�i ��c d��c n�y hy v�ng s� t�m ra ph��ng thu�c gi�i ��c. Ng��i th� ��n Nh�t Ph�m ���ng xem ng��i b� ��c c� mang thu�c gi�i kh�ng?"
    };
    local szNot = {
        "�.",
    	"��c Si ti�n b�i, thu�c gi�i ��y!",
    	"[��c Si d�ng s� thu�c b�n mang ��n]",
    	"�.",
    	"Xem ra l��ng thu�c gi�i kh�ng ��."
    };
    if GetItemCount(2,0,65) >= 10 and GetItemCount(1,2,3) >= 10 and GetItemCount(1,3,11) >= 5 then
        TalkEx("task_40_01", szTalk);
    else
        TalkEx("task_39_01", szNot);
    end;
end;

function task_40_01()
    SetTask(TASK_XYTY, 41);
    DelItem(2,0,65,10);
    DelItem(1,2,3,10);
    DelItem(1,3,11,5);
    RemoveTrigger(GetTrigger(KILL_XY_NJX));
    CreateTrigger(0,525,KILL_XY_SD);
    Msg2Player("L�y ���c 5 ph�n thu�c gi�i t� Th�ch kh�ch Nh�t Ph�m ���ng");
    TaskTip("L�y ���c 5 ph�n thu�c gi�i t� Th�ch kh�ch Nh�t Ph�m ���ng");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao3")		--���ض�ҩ3
end;

function task_41_00()
    local szTalk = {
        "Ng��i b� ��c nh�t ��nh mang theo thu�c gi�i, ng��i th� ��n Nh�t Ph�m ���ng m�t chuy�n xem!"
    };
    TalkEx("task_41_01", szTalk);
end;

function task_41_01()
    if GetTrigger(KILL_XY_SD) == 0 then
        CreateTrigger(0,525,KILL_XY_SD);
    end;
end;

function task_42_00()
    local szTalk = {
        "<sex> t�m ���c thu�c gi�i ch�a?",
    	"��c Si ti�n b�i n�i lo�i ��c {Bi T� Thanh Phong} v� s�c v� v�, ng��i n�o tr�ng ph�i 12 canh gi� sau m�i c� ��ng ���c. Ngay c� ti�n b�i c�ng kh�ng c� thu�c gi�i, t�i h� ch� c� th� ��n Nh�t Ph�m ���ng ��nh Th�ch kh�ch mang thu�c gi�i v�.",
    	"Lo�i ��c l�i h�i nh� v�y, n�u ng��i T�y H� d�ng ch�ng l�m v� kh� th� th�t nguy hi�m, xem ra ng��i ph�i mau ch�ng t�m ra thu�c gi�i.",
        "N�u d�ng ��c l�m v� kh� th� c�n ph�i t�ch tr� nhi�u! �� t�i h� ��n {Ki�m C�c th�c ��o} ph� kho t�ch tr� c�a ch�ng."
    };
    local szNot = {
        "<sex> t�m ���c thu�c gi�i ch�a?",
        "{Bi T� Thanh Phong} l� lo�i ��c b� truy�n c�a Nh�t Ph�m ���ng, ngay c� ��c Si ti�n b�i c�ng kh�ng th� gi�i, t�i h� ch� c� th� ��n Nh�t Ph�m ���ng ��nh Th�ch kh�ch mang thu�c gi�i v�."
    };
    if GetItemCount(2,0,66) >= 5 then
        TalkEx("task_42_01", szTalk);
    else
        TalkEx("task_41_01", szNot);
    end;
end;

function task_42_01()
    RemoveTrigger(GetTrigger(KILL_XY_SD));
    CreateTrigger(0,527,KILL_XY_DYX);
    SetTask(TASK_XYTY, 43);
    DelItem(2,0,66,5);
    Msg2Player("Ph� h�y 5 r��ng ��c d��c � Ki�m C�c th�c ��o");
    TaskTip("Ph� h�y 5 r��ng ��c d��c � Ki�m C�c th�c ��o");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao4")		--���ض�ҩ4
end;

function task_43_00()
    local szTalk = {
        "<sex> ��n Ki�m C�c th�c ��o t�m n�i c�t gi�u ��c d��c ph� h�y ch�ng!"
    };
    TalkEx("task_43_01", szTalk);
end;

function task_43_01()
    if GetTrigger(KILL_XY_DYX) == 0 then
        CreateTrigger(0,527,KILL_XY_DYX);
    end;
end;

function task_44_00()
    local szTalk = {
        "<sex> �� h�a gi�i ���c cu�c t�n c�ng c�a T�y H�, Tr��ng Ca M�n ch�ng ta kh�ng bi�t c�m k�ch ra sao.",
        "Ti�n sinh ��ng v�i vui m�ng, chuy�n n�y kh�ng ��n gi�n ��y l� v�t t�m ���c trong th��ng kh� T�y H�.",
        "[Mang c�ng v�n Li�u Qu�c giao cho C�ng T�n Th�]",
        "��ng nh� <sex> d� �o�n cu�c t�n c�ng l�n n�y do n��c Li�u khi�u kh�ch, h� d�ng th� �o�n khuy�n ph�c T�y H� bao quanh Ki�m C�c v�i � �� c�ng ��nh th�nh T��ng D��ng. <sex> gi�p ta ��n Ph�c Ng�u s�n d� la ���c kh�ng?",
        "V�n b�i �i ngay!"
    };
    TalkEx("task_44_01", szTalk);
end;

function task_44_01()
    SetTask(TASK_XYTY, 45);
    DelItem(2,0,67,1);
    Msg2Player("��n Ph�c Ng�u s�n d� la tin t�c");
    TaskTip("��n Ph�c Ng�u s�n d� la tin t�c");
    GivePlayerAward("Level_30", "easy", "legs", "Level_33");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan1")		--��ţɽս��1
end;

function task_45_00()
    local szTalk = {
        "Xin tha m�ng!",
    	"Ng��i l� ai? Sao th�y ta l�i la to�ng l�n?",
    	"Kh�ng ph�i ng��i ��nh truy gi�t ta �?",
    	"Ng��i v� ta kh�ng th� kh�ng o�n, gi�t ng��i l�m g�?",
    	"<sex>! Ti�u nh�n v�n l� n�ng d�n do thu ho�ch ko t�t n�n c�ng m�t s� huynh �� l�n Ph�c Ng�u s�n l�m gi�c c�. C�ng vi�c ch� gi�p qu�t d�n n�o ng� c� ��m qu�n s� n��c Li�u �p ��n, c�c anh em kh�c �� ch�t trong tr�n lo�n chi�n �� ri�ng ti�u nh�n may m�n tho�t ch�t."
	};
	TalkEx("task_45_00_00", szTalk);
end;

function task_45_00_00()
    local szTalk = {
    	"Qu� nhi�n Li�u binh �� ��n. Ng��ic� th� n�i s� v� t�nh h�nh � Ph�c Ng�u s�n ���c kh�ng?",
    	"Ch� c�n <sex> gi�p ti�u nh�n gi�t m�y t�n Li�u binh tr� th� cho c�c huynh �� ta s� kh�ng gi�u di�m b�t c� chuy�n g�.",
        "���c! �� ta gi�p m�t tay!"
    };
    TalkEx("task_45_01", szTalk);
end;

function task_45_01()
    SetTask(TASK_XYTY, 46);
    CreateTrigger(0,528,KILL_XY_LDB);
    CreateTrigger(0,529,KILL_XY_LQB);
    CreateTrigger(0,530,KILL_XY_LNB);
    SetTask(TASK_XY_TEMP, 0);
    SetTask(TASK_XY_TEMP1, 0);
    SetTask(TASK_XY_TEMP2, 0);
    Msg2Player("Gi�t 15 Li�u �ao binh, 15 Li�u th��ng qu�n, 15 Li�u Ti�n binh");
    TaskTip("Gi�t 15 Li�u �ao binh, 15 Li�u th��ng qu�n, 15 Li�u Ti�n binh");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan2")		--��ţɽս��2
end;

function task_46_00()
    local szTalk = {
        "<sex> gi�p ti�u nh�n gi�t m�y t�n Li�u binh tr� th� cho c�c huynh �� ta s� kh�ng gi�u di�m b�t c� chuy�n g�."
    };
    TalkEx("task_46_01", szTalk);
end;

function task_46_01()
    if GetTrigger(KILL_XY_LDB) == 0 and GetTask(TASK_XY_TEMP) == 0 then
        CreateTrigger(0,528,KILL_XY_LDB);
    end;
    if GetTrigger(KILL_XY_LQB) == 0 and GetTask(TASK_XY_TEMP1) == 0 then
        CreateTrigger(0,529,KILL_XY_LQB);
    end;
    if GetTrigger(KILL_XY_LNB) == 0 and GetTask(TASK_XY_TEMP2) == 0 then
        CreateTrigger(0,530,KILL_XY_LNB);
    end;
end;

function task_49_00()
    local szTalk = {
    	"<sex> gi�t ���c t�n n�o ch�a?",
    	"Ta �� gi�p ng��i gi�t m�y t�n Li�u binh.",
    	"�a t� <sex> �� gi�p ��! Xin h�i <sex> �� g�p qua ��m cao th� T� t�ng ch�a?",
    	"T� t�ng n�o?",
    	"Xem c�ch �n m�c c�a h� gi�ng T� t�ng c�a Ho�ng gi�o, c� l� t� b�n T�y H� qua. V�a n�y h� ni�m ch� l�n ng��i m�y huynh ��. <sex> ra tay c�u h� ���c kh�ng?",
        "T�ng nh�n T�y H� ��n qu�y r�i n�a �? � ��y c�ch {V� �ang} kh�ng xa �� ta t�m {T� H�c Ch�n Nh�n} xem c� k� s�ch g� kh�ng?"
    };
    TalkEx("task_49_01", szTalk);
end;

function task_49_01()
    SetTask(TASK_XYTY, 50);
    Msg2Player("T�m T� H�c Ch�n Nh�n ngh� c�ch");
    TaskTip("T�m T� H�c Ch�n Nh�n ngh� c�ch");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan3")		--��ţɽս��3
end;

function task_50_00()
    local szTalk = {
        "Sao ng��i u s�u v�y?",
    	"Kh�ng gi�u ch�n nh�n Li�u binh �ang t�p k�t � Ph�c Ng�u s�n � �� c�ng ��nh Ki�m M�n Quan �o�t l�y T��ng D��ng, b�n �� c� nhi�u T� t�ng tr� gi�p, h� d�ng b�a ch� h�i ng��i, t�i h� ��n xem ng��i c� c�ch ph� gi�i kh�ng?",
        "Thi�n Nh�n Chu m�u tr�ng t��ng �ng v�i T�c ph�p, Thi�n Nh�n Chu m�u �en t��ng �ng v�i Chu ph�p, Thi�n Nh�n Chu m�u v�ng t��ng �ng v�i T�ng ph�p, Thi�n Nh�n Chu m�u �� t��ng �ng v�i Ho�i ph�p, T�ng nh�n T�y H� d�ng Chu ph�p t�t nhi�n h� s� mang theo Thi�n Nh�n Chu, ng��i t�m m�t �t v� nh� thu th�p th�m H�c Khuy�n Linh huy�t, ta s� c� c�ch."
    };
    TalkEx("task_50_01", szTalk);
end;

function task_50_01()
    SetTask(TASK_XYTY, 51);
    CreateTrigger(0,531,KILL_XY_XS);
    Msg2Player("T�m 10 Thi�n Nh�n Chu, 5 H�c Khuy�n Linh huy�t");
    TaskTip("T�m 10 Thi�n Nh�n Chu, 5 H�c Khuy�n Linh huy�t");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan4")		--��ţɽս��4
end;

function task_51_00()
    local szTalk = {
        "Thi�n Nh�n Chu m�u tr�ng t��ng �ng v�i T�c ph�p, Thi�n Nh�n Chu m�u �en t��ng �ng v�i Chu ph�p, Thi�n Nh�n Chu m�u v�ng t��ng �ng v�i T�ng ph�p, Thi�n Nh�n Chu m�u �� t��ng �ng v�i Ho�i ph�p, T�ng nh�n T�y H� d�ng Chu ph�p t�t nhi�n h� s� mang theo Thi�n Nh�n Chu, ng��i t�m m�t �t v� nh� thu th�p th�m H�c Khuy�n Linh huy�t, ta s� c� c�ch."
    }
    TalkEx("task_51_01", szTalk);
end;

function task_51_01()
    if GetTrigger(KILL_XY_XS) == 0 then
        CreateTrigger(0,531,KILL_XY_XS);
    end;
end;

function task_52_00()
    local szTalk = {
        "T�m ���c kh�ng?",
    	"Ti�n b�i xem qua!",
    	"Ng��i ��i ta m�t l�t.",
    	"[T� H�c Ch�n Nh�n c�m v�t ph�m trong tay ni�m ch�]",
    	"��y l� Thi�n Linh Ph� T� Chu, ng��i �em cho h�n u�ng l� c� th� gi�i tr� t� ma.",
        "�a t� ch�n nh�n �� t�i h� mang v� cho h�n."
    };
    local szNot = {
        "T�m ���c kh�ng?",
    	"V�n b�i c�n ch�t th�i gian!"
    };
    if GetItemCount(2,0,68) >= 10 and GetItemCount(2,2,33) >= 5 then
        TalkEx("task_52_01", szTalk);
    else
        TalkEx("task_51_01",szNot);
    end;
end;

function task_52_01()
    RemoveTrigger(GetTrigger(KILL_XY_XS));
    DelItem(2,0,68,10);
    DelItem(2,2,33,5);
    AddItem(2,0,211,1);   --������а��
    SetTask(TASK_XYTY, 53);
    Msg2Player("�em Thi�n Linh Ph� T� Ch�u cho L�c Ph�ch S�n t�c");
    TaskTip("�em Thi�n Linh Ph� T� Ch�u cho L�c Ph�ch S�n t�c");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan5")		--��ţɽս��5
end;

function task_53_00()
    local szTalk = {
        "<sex> v� r�i �? Huynh �� c�a ta xem nh� ���c c�u r�i.",
    	"Ti�n ��n ��y mau ��a cho huynh �� ng��i.",
    	"[L�c Ph�ch S�n t�c u�ng thu�c]",
    	"��i �n ��i ��c c�a <sex> kh�ng bi�t l�y g� ��n ��p, l�c n�y ti�u nh�n nghe ��m T� t�ng c� nh�c b�y b� tr�n ph�p trong Ki�m M�n Quan, ��i nh�n nh� th�n tr�ng! ��y c� t�m b�n �� Ph�c Ng�u s�n v� t�nh h�nh binh l�c qu�n Li�u t�ng ��i nh�n xem nh� ��n �n c�u m�ng.",
        "�a t� ng��i! H�n ng�y g�p l�i!"
    };
    TalkEx("task_53_01", szTalk);
end;

function task_53_01()
    SetTask(TASK_XYTY, 54);
    DelItem(2,0,211,1);   --������а��
    AddItem(2,0,69,1);
    Msg2Player("Mang b�n �� cho C�ng T�n Th�");
    TaskTip("Mang b�n �� cho C�ng T�n Th�");
    GivePlayerAward("Level_32", "hard", "trinket", "Level_35");
	GivePlayerExp(SkeyBJKouzhun,"bingfenlianglu")		--������·
end;

function task_54_00()
    local szTalk = {
        "<sex> d� la ���c g� kh�ng?",
    	"Binh l�c qu�n Li�u ��u ph�n b� tr�n t�m b�n ��, ti�n b�i xem qua! Ngo�i ra c�n m�t s� T� t�ng d�ng tr�n ph�p � �� c�ng ��nh Ki�m M�n Quan.",
    	"[C�ng T�n Th� xem qua b�n ��]",
    	"Xem ra n��c Li�u v� T�y H� �� chu�n b� s�n nh�ng tr��c gi� t� kh�ng th� th�ng ch�nh, theo � ta n�u �� m�i quan h� h� v�ng ch�c th� kh� m� c�ng ph�.",
    	"Ta ph�i l�m sao ��y?",
    	"Ch� c�n c�ch chia binh hai ���ng c�ng ti�n ��nh. Chuy�n n�y c�n ph�i b�n b�c k�! Ng��i mau t�m T�ng binh T��ng D��ng th��ng thuy�t ti�n ��nh doanh tr�i Li�u qu�n tr��c. C�n v� tr�n ph�p ph�i nh� T� H�c Ch�n Nh�n ch� c�ch ph� gi�i. <sex> xin h�y l�p t�c l�n ���ng!",
        "T�i h� �i ngay!"
    };
    TalkEx("task_54_01", szTalk);
end;

function task_54_01()
    DelItem(2,0,69,1);
    SetTask(TASK_XY_ONE, 1);    --���������֧һ�������ҿ���
    SetTask(TASK_XY_TWO, 1);    --���������֧�����������Ϻ�����
    SetTask(TASK_XYTY, 55);
end;

-------------------------------���������֧����--------------------

function two_01_00()
    local szTalk = {
        "Ng��i ph� gi�i b�a ch� ch�a?",
        "May nh� ti�n b�i ch� gi�o, b�a ch� �� h�a gi�i nh�ng T� t�ng T�y H� l�i d�ng tr�n ph�p c�ng ��nh Ki�m M�n Quan, xin ti�n b�i ngh� c�ch.",
        "H�m! B�n ch�ng d�m d�ng ph�p thu�t �� s�t sinh linh, ng��i mau gi�p ta t�m 10 Huy�n H�c linh huy�t, 10 B�ch Huy�t sa ta s� c� c�ch ph� gi�i."
    };
    TalkEx("two_01_01", szTalk);
end;

function two_01_01()
    SetTask(TASK_XY_TWO, 2);
    Msg2Player("T�m 10 Huy�n H�c Linh huy�t, 10 B�ch Huy�t sa cho T� H�c Ch�n Nh�n");
    TaskTip("T�m 10 Huy�n H�c Linh huy�t, 10 B�ch Huy�t sa cho T� H�c Ch�n Nh�n");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushandoufa1")		--��ţɽ����1
end;

function two_02_00()
    local szTalk = {
        "T�m ���c r�i �?",
        "�� chu�n b� ��!",
        "[T� H�c Ch�n Nh�n l�y m�t chi�c b�nh b�ng ��ng b� thu�c v�o trong ni�m ch�]",
        "Ta �� chu�n b� Ph� Ch� th�y ch� c�n ng��i d�ng ch�ng t��i v�o ng��i ch� tr� tr�n ph�p l� ���c.",
        "C� c�ch h�a gi�i r�i!",
        "Tr�n ph�p b� tr� xong s� c� V� t�ng h� gi�, ng��i ph�i h�t s�c c�n th�n!"
    };
    local szNot = {
        "T�m ���c r�i �?",
        "V�n b�i v�n ch�a t�m ��!"
    };
    if GetItemCount(2,2,35) >= 10 and GetItemCount(2,2,32) >= 10 then
        TalkEx("two_02_01", szTalk);
    else
        TalkEx("", szNot);
    end;
end;

function two_02_01()
    SetTask(TASK_XY_TWO, 3);
    AddItem(2,0,210,3);
    DelItem(2,2,35,10);
    DelItem(2,2,32,10);
    --CreateTrigger(0,532,KILL_XY_ZS);
    Msg2Player("Mang Ph� Ch� th�y ti�u di�t 3 Ph�p S� T�y H�");
    TaskTip("Mang Ph� Ch� th�y ti�u di�t 3 Ph�p S� T�y H�");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushandoufa2")		--��ţɽ����2
end;

function two_03_00()
	if GetTask(TASK_XY_TWO_ONE) < 0 or GetTask(TASK_XY_TWO_ONE) > 3 then
		SetTask(TASK_XY_TWO_ONE, 0)
	end
	
    local szTalk = {
        "Xem kh� s�c <sex> kh�ng ���c t�t, c� ph�i b� Ph�p S� T�y H� �� th��ng?",
        "T�i h� kh�ng sao nh�ng ph�i c�n th�m Ph� Ch� th�y m�i c� th� h�a gi�i tr�n ph�p.",
        "� ��y c�n m�y b�nh, ng��i c�m l�y �i!"
    };
    local szNormal = {
        "<sex> ch� c�n ��nh ng��i ch� tr� tr�n ph�p d�ng Ph� Ch� th�y t��i l�n ng��i h� l� ���c."
    };
    if GetItemCount(2,0,210) < 3 then
        TalkEx("two_03_01", szTalk);
    else
        TalkEx("", szNormal);
    end;
end;

function two_03_01()
    AddItem(2,0,210,3);
end;
-------------------------------------------��������------------------------------------

function task_56_00()
    local szTalk = {
        "<sex> �� ��y lui ���c binh l�nh n��c Li�u v� T�y H� ��ng l� ph�c c�a mu�n d�n.",
        "Ti�n sinh qu� l�i, tr� gian di�t b�o l� b�n ph�n c�a t�i h�.",
        "Kh� l�m! <sex> qu� c� kh� ph�ch hi�p kh�ch, m� ��y r�t mu�n k�t giao m�t ng��i nh� v�y. <sex> c�n ph�t hi�n g� th�m � Ph�c Ng�u s�n kh�ng?",
        "T�i h� ph�t hi�n m�t h�m b�o cho ti�n tuy�n {Nh�t Ph�m ���ng} v� {Thi�n �m gi�o}, b�n h� v� chuy�n {m�nh S�n H� X� T�c} ��n Ph�c Ng�u s�n.",
        "N�u �� v�y <sex> ��ng � ��n Ph�c Ng�u s�n d� la th�m m�t l�n kh�ng? Kh�ng ch�ng bi�t ���c tung t�ch c�a b�n �� S�n H� X� T�c."
    };
    TalkEx("task_56_01", szTalk);
end;

function task_56_01()
    DelItem(2,0,71,1);
    DelItem(2,0,72,1);
    SetTask(TASK_XYTY, 57);
    Msg2Player("��n Ph�c Ng�u s�n t�m L�c Ph�ch S�n t�c h�i th�m");
    TaskTip("��n Ph�c Ng�u s�n t�m L�c Ph�ch S�n t�c h�i th�m");
    GivePlayerAward("Level_32", "hell", "trinket", "Level_40");
    GivePlayerAward("Level_36", "hell", "legs", "Level_41");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe11")		--������ɽ��11
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe12")		--������ɽ��12
end;

function task_57_00()
    local szTalk = {
        "�n nh�n t�m ta c� chuy�n g�?",
        "Ng��i c� nghe qua m�nh b�n �� S�n H� X� T�c ch�a?",
        "(Suy ngh�), nh� ra r�i �� l� m�n b�o b�i c�a tr�i ch� ta. T� l�c c� n� �ng ta t� th�i �� n�ng n�y v�i c�c huynh ��, th��ng la m�ng ��nh ��p. H�n n�a b�n �� xu�t hi�n Li�u binh v� T�ng nh�n T�y H� c�ng k�o ��n, xem ra ��y kh�ng ph�i v�t c�t t��ng.",
        "Tr�i ch� c�a ng��i hi�n gi� � ��u?",
        "Nghe n�i tr�i ch� �ang tr�n trong Long H� ��ng, ��i nh�n th� ��n �� t�m xem!"
    };
    TalkEx("task_57_01", szTalk);
end;

function task_57_01()
    SetTask(TASK_XYTY, 58);
    GivePlayerAward("Level_40", "easy");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe2")		--������ɽ��2
end;

function task_59_00()
    local szTalk = {
        "<sex> t�m ra tung t�ch m�nh S�n H� X� T�c ch�a?",
        "M�nh S�n H� X� T�c ban ��u do ��u l�nh S�n t�c n�m gi�. T�i h� t�m ���c tr�n ng��i h�n b�c m�t h�m c�a {L��ng S�n}!",
        "[C�ng T�n Th� xem qua b�c m�t h�m]",
        --"�����飺����ˣ��������Ͽ����ƺ�����ɽ��{�ν�}������Ѱ��ɽ�����ͼ��Ƭ�����������ν��������ա�����Ϊ�ȣ��Ǹ��ǳ���ֱ���ˡ���ˮ����ɽ�˰�����ཫ�£����Ҳ��Ϊ�����Ϊ��ҲҪ̰ͼ��ɽ�����ͼ�أ��ҿ�<sex>�������˴�̽��̽��Ϣ������кν�չ��������֪ͨ�Ϸ�"
        "Ta t�m th�i gi� l�i b�c th�. <sex> c� g�ng th�m."
    };
    TalkEx("task_59_01", szTalk);
end;

function task_59_01()
    --SetTask(TASK_XYTY, 60);
    SetTask(TASK_XYTY, 61); --��ʱ����������壬û�к�������
    DelItem(2,0,73,1);
    GivePlayerAward("Level_40", "hell", "chest", "Level_45");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe3")		--������ɽ��3
end;

function task_61_00()
    local szTalk = {
        "<sex> c� g�ng th�m."
    };
    TalkEx("", szTalk);
end;
