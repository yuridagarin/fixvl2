--==================================================
--create by zhangming 2009.12.25
--describe: Խ�ϰ� ת������ �����ַ����ļ�
--related files:
--==================================================
--
VET_200912_STR_EVENTNAME = "Nhi�m v� chuy�n sinh"
VET_200912_STR_ACTIONS = {
    [1] = "X�a th�nh c�ng giao v�t ph�m nhi�m v�",
    [2] = "X�a th�t b�i giao v�t ph�m nhi�m v�",
    [3] = "L�c chuy�n sinh c� tr�ng th�i b�t th��ng",
    [4] = "Chuy�n sinh t�ng t� �n th�nh c�ng",
}

VET_201003_STR_NPC_NAME = {
    [1] = {"T�ng T��ng Qu�n","H� T� S�"},
    [2] = {"V� L�m Minh Ch�1","Long T� S�"},
    [3] = {"Phu nh�n T�y D��ng","Ph�ng T� S�"},
    [4] = {"Truy�n gi�o s�","�ng T� S�"},
}
--4��npc�ĶԻ�����
VET_200912_STR_TALK = {
    [1] = "Mu�n gia nh�p long t� h�i?",
    [2] = "Mu�n gia nh�p ph�ng t� h�i?",
    [3] = "Mu�n gia nh�p h� t� h�i?",
    [4] = "Mu�n gia nh�p �ng t� h�i?",
    [5] = "��ng � gia nh�p/#VET_201003_MaskSureAgain(%d)",
    [6] = "�� ta suy ngh� l�i/gf_DoNothing",
    [7] = "Mu�n gia nh�p %s, tr��c ti�n ph�i ho�n th�nh nhi�m v� chuy�n sinh",
    [8] = "��ng � gia nh�p/#VET_201003_JoinMenHui(%d)",
    [9] = "�� ta suy ngh� l�i/gf_DoNothing",
    [10] = "��i hi�p �� k�ch ho�t nhi�m v� chuy�n sinh %s r�i",
    [11] = "Ta mu�n t�m hi�u %s/#menhui_detailse(%d)",
  --[12] = "���Ѿ�������ת�������뵽�������Ŵ����ܺ��������",
    [13] = "M�i ng�y ��ng t�i n�i n�y ph�i s��ng ph�i n�ng, th�t l� m�t qu� �i",
    [14] = "K�ch ho�t nhi�m v� t� ��i/VET_201003_ShowTeamTask",
    [15] = "Ta mu�n k�ch ho�t thu�n m�/VET_201003_BAOMA",
    [16] = "Ta mu�n k�ch ho�t b�n ��ng h�nh/VET_201003_TONGBAN",
    [17] = "Ta mu�n k�ch ho�t ch� t�o v� kh� ph�t s�ng/VET_201003_FAGUANGWUQI",
    [18] = "Ta mu�n k�ch ho�t ch� t�o ngo�i trang c� thu�c t�nh/VET_201003_SHUXINGWAIZHUANG",
    [19] = "Ta mu�n k�ch ho�t ch� t�o n�ng c�p trang b� v� v� kh�/VET_201003_SHENGJIWUQI",
    [20] = "�� k�ch ho�t th�nh c�ng",
    [21] = "Ta mu�n h�y nhi�m v� chuy�n sinh/VET_201003_Show_GiveUpTask",
    [22] = "M�t khi b� nhi�m v� n�y l� c� ngh�a c�c h� ph� ph�m c�ng l�c �� b� ra",
    [23] = "��ng � h�y nhi�m v�/VET_201003_GiveUpTask",
    [24] = "�� ta ngh� l�i xem/gf_DoNothing",
    [25] = "��i hi�p �� nh�n th�nh c�ng nhi�m v� h�nh hi�p tr��ng ngh�a",
    [26] = "��i hi�p �� nh�n th�nh c�ng nhi�m v� c�u n�n",
    [27] = "�� h�y th�nh c�ng nhi�m v� chuy�n sinh",
}



VET_200912_STR_XIAXIANTISHI = {
    {"�� chuy�n sinh th�nh c�ng v� gia nh�p %s, sau khi tho�t ra ��ng nh�p l�i m�i c� hi�u l�c, <color=red> (Ch� �: sau khi r�i m�ng xong s� tr� v� c�p 10, gi�i h�n tr�n h�nh trang ch� ���c mang 1000000 ��ng.)<color>","Ta mu�n ��ng nh�p l�i/VET_201003_REBOOT_CLIENT","�� ta �i g�i ti�n ��/gf_DoNothing"},
}
VET_200912_STR_MENHUI_NAME = {
    "Long T� M�n",
    "Ph�ng T� M�n",
    "H� T� M�n",
    "�ng T� M�n",
}
VET_200912_STR_NPC_NAME = {
    "Long T� S�",
    "Ph�ng T� S�",
    "H� T� S�",
    "�ng T� S�",
}

VET_200912_TB_MENHUIYIN = {
    {"Long t� �n",{2,0,30002,1,4},},
    {"Ph�ng t� �n",{2,0,30005,1,4},},
    {"H� t� �n",{2,0,30003,1,4},},
    {"�ng t� �n",{2,0,30006,1,4},},
}

VET_200912_STR_SEX_ERROR = {
    "Xin l�i, ph�ng t� h�i ch� thu nh�n n� �� t�",
    "Xin l�i, long t� h�i ch� thu nh�n nam �� t�",
}

VET_200912_STR_ZS_ERROR = {
    [1] = "C�c h� �� nh�n nhi�m v� chuy�n sinh %s r�i, ch� ���c n�p nhi�m v� t�i %s, mu�n gia nh�p b�n m�n h�i th� h�y h�y nhi�m v� chuy�n sinh hi�n t�i",
    [2] = "V�n ch�a �� c�p 99, chuy�n sinh c�n c�p 99 m�. C� l�n ch�ng trai tr�",
    [3] = "V�n ch�a �� 2 t� kinh nghi�m, chuy�n sinh c�n kinh nghi�m ��t ��n 2 t�, c� l�n n�o!!!",
    [4] = "Chuy�n sinh c�n �� c�ng hi�n s� m�n l� 10000 �i�m. ��n ch� s� ph� c�ng hi�n cho m�n ph�i �i",
    [5] = "Chuy�n sinh c�n danh v�ng ��t ��n 10000 �i�m",
    [6] = "Chuy�n sinh c�n qu�n c�ng ��t ��n 80000 �i�m",
    [7] = "Gi�n c�ch hai l�n chuy�n sinh c�n 6 th�ng. L�n chuy�n sinh sau l� n�m %d th�ng %d ng�y %d",
    [8] = "Ng��i �� chuy�n sinh th�nh c�ng t�i %s. Ta gi�p kh�ng ���c g� th�m n�a r�i.",
    [9] = "��i hi�p v�n ch�a gia nh�p m�n ph�i, ch� c� nh�n v�t �� gia nh�p m�n ph�i m�i c� th� chuy�n sinh",
    [10] = "K� n�ng m�n ph�i c�a ��i hi�p v�n ch�a h�c ��, ch� c� h�c �� k� n�ng m�n ph�i m�i ���c chuy�n sinh (kh�ng bao g�m k� n�ng m�n ph�i)",
}

VET_200912_STR_ACCEPT_ZS_TASK = {
   "Ng��i �� k�ch ho�t th�nh c�ng nhi�m v� chuy�n sinh, xin m�i ��n %s �� ho�n th�nh nhi�m v� tr��ng ngh�a giang h�",
   "Ng��i �� ho�n th�nh nhi�m v� tr��ng ngh�a h�nh hi�p, xin m�i ��n %s �� ho�n th�nh nhi�m v� c�u n�n",
   "�� ho�n th�nh t�t c� nhi�m v� chuy�n sinh, xin m�i ��n %s �� ho�n th�nh chuy�n sinh",
}

VET_200912_STR_FOLLOW_UP_TASK_TALK = {
    {"Ch� c� hi�p s� h�nh h�nh hi�p tr��ng ngh�a m�i c� th� chuy�n sinh. Xin m�i ho�n th�nh nhi�m v� tr�ng �c v� thu th�p v�t ph�m nhi�m v�: <color=red>B�c L�c L�m L�nh, Tr�c �nh Th��ng, Tuy�t T�nh Th�ch, L�nh b�i t�ng qu�n ngo�i vi�n, L�nh b�i t�ng qu�n n�i vi�n, Vi�t N� Ki�m, Trang ch� kim �n, Tr��ng L�o Ch� Ho�n, Thi�p d� ti�c Long M�n m�i th� 1 c�i<color>","Ta mu�n nh�n nhi�m v� h�nh hi�p tr��ng ngh�a/get_poetical_justice_task",VET_200912_STR_TALK[21],"Hi�n t�i c� t� vi�c, l�t n�a quay l�i/gf_DoNothing"},
    {"�� thu th�p nh�ng v�t ph�m nh� sau: <color=red>B�c L�c L�m L�nh, Tr�c �nh Th��ng, Tuy�t T�nh Th�ch, L�nh b�i t�ng qu�n ngo�i vi�n, L�nh b�i t�ng qu�n n�i vi�n, Vi�t N� Ki�m, Trang ch� kim �n, Tr��ng L�o Ch� Ho�n, Thi�p d� ti�c Long M�n<color>",
    "Ta �� thu th�p �� v� c� th� ho�n th�nh nhi�m v�/poetical_justice_task",VET_200912_STR_TALK[21],"Hay l� ��i m�t t� n�a/nothing"},
    {"���ng nhi�n, �� l� m�t ��i hi�p c�n ph�i c� m�t tr�i tim l��ng thi�n. Xin m�i ho�n th�nh nhi�m v� c�u nan, thu th�p v�t ph�m: <color=red>%d %s<color>","Ta mu�n nh�n nhi�m v�/get_salvage_task",VET_200912_STR_TALK[21],"Hi�n t�i c� t� vi�c, l�t n�a quay l�i/gf_DoNothing"},
    {"Ta �� thu th�p v�t ph�m nh� sau: <color=red>%d %s<color>","�� thu th�p ��, c� th� ho�n th�nh nhi�m v� ���c r�i/salvage_task",VET_200912_STR_TALK[21],"Hay l� ��i m�t t� n�a/nothing"},
    {"R�t t�t, hi�n t�i ta c� th� gi�p ng��i chuy�n sinh, xin m�i h�y b� t�t c� trang b� v� ti�n tr�n ng��i xu�ng, n�u kh�ng trong l�c lu�n h�i r�t d� b� m�t ��<color=red>(Ch� � sau khi chuy�n sinh th� c�p s� tr� v� 10 ��ng th�i ch� ���c mang tr�n ng��i l�  1000000 ��ng)<color>","Ta mu�n chuy�n sinh ngay/Finish_ZS",VET_200912_STR_TALK[21],"Hay l� ��i m�t t� n�a/nothing"},
}

VET_200912_STR_TEAM_TASK_DETAILSE = {
    "T� 8 gi� ��n 14 gi� ng�y th� 2-6-7-ch� nh�t, nh�n v�t �� chuy�n sinh c� th� tham gia nhi�m v� t� ��i t��ng �ng, m�i ng�y m�i nh�n v�t ch� ���c k�ch ho�t m�t l�n,\n M�i ng�y m�i m�n h�i c� s� l��ng k�ch ho�t t��ng �ng v�i s� l��ng xu�t hi�n c�a boss ho�ng kim, m�i boss ho�ng kim s� xu�t hi�n t�ng b�n �� ri�ng,\n Long T�, Ph�ng T�, H� T�, �ng T� s� xu�t hi�n t�i Tuy�n Ch�u b�c, Th�nh �� t�y, Tuy�n Ch�u b�c, TH�nh �� t�y",
}

VET_200912_STR_MENHUI_DETAILSE = {
    {"Long T� m�n thi�n h��ng ch� t�o ngo�i trang c�ng k�ch nh�ng ch� thu nh�n nam �� t�",},
    {"Ph�ng t� m�n ch� t�o ngo�i trang thi�n h��ng h� tr� ph�ng ng� v� b�n m�n h�i kh�ng nh�n n� �� t�",},
    {"H� t� m�n ch� t�o ngo�i trang thi�n h��ng phong ng�",},
    {"�ng t� m�n ch� t�o ngo�i trang thi�n h��ng h� tr� t�n c�ng",},
}

VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME = {
    "B�c L�c L�m l�nh",
    "Tr�c �nh Th��ng",
    "Tuy�t T�nh Th�ch",
    "L�nh b�i t�ng qu�n ngo�i vi�n",
    "L�nh b�i t�ng qu�n n�i vi�n",
    "Vi�t N� ki�m",
    "Trang ch� kim �n",
    "Tr��ng L�o Ch� Ho�n",
    "Thi�p d� ti�c Long M�n",
}

VET_200912_STR_SALVAGE_ITEM_NAME = {
    "C�m n�m",
    "M�n th�u",
    "B�nh x�p",
    "B�nh bao th�t",
    "M�ng x�o",
    "T� Qu� ��u",
    "��u x�o",
    "C�i x�o t�i",
}

VET_200912_STR_SCARCITY_ITEM_ERROR = {
    "��i hi�p, l�a d�i l� m�t ��c t�nh kh�ng t�t. Ta c�n nh�ng nguy�n li�u m� ng��i v�n ch�a ki�m �� ��.",
}

VET_200912_STR_NPC_TYPE_ERROR = "Ng��i �� l� ng��i c�a %s, ta kh�ng th� gi�p g� h�n ���c n�a"

VET_200912_STR_HAVE_ACTIVE_ERROR = {"Xin l�i, h�m nay c�c h� �� k�ch ho�t r�i, kh�ng th� k�ch ho�t nhi�u l�n."}

VET_200912_STR_DAY_ERROR = {"Xin l�i, ch� c� m�i th� 2-6-7-CN m�i c� th� k�ch ho�t"}

VET_200912_STR_RENOVATE_BOSS_NUM = "H�m nay s� xu�t hi�n <color=red>%d<color> boss long t�, <color=red>%d<color> boss ph�ng t�,".."<color=red> %d<color> boss h� t�, <color=red>%d<color> boss �ng t�"

VET_201003_STR_ERROR = {
    "��i hi�p �� chuy�n sinh th�nh c�ng 1 l�n r�i",
}

VET_201003_STR_TEAM_TASK_TALK = {
    [1] = "Nh�ng nh�n v�t �� chuy�n sinh c� th� m�i tu�n th�<color=red>2-6-7-CN t� 8 gi� ��n 14 gi�<color> c� th� k�ch ho�t nhi�m v� t� ��i t�i ��y, m�i l�n k�ch ho�t c�n c� 5 ng��i tr� l�n, t� 16 gi� ��n 22 gi� 30 m�n ch� t�i b�n �� b�n ngo�i tri�u h�i boss m�n h�i, s� ng��i k�ch ho�t boss tr�n 10 ng��i s� k�ch ho�t ���c 2 boss m�n h�i",
    [2] = "Ta mu�n k�ch ho�t/VET_201003_ActiveTeamTask",
    [3] = "Tam th�i kh�ng k�ch ho�t/gf_DoNothing",
    [4] = "�� k�ch ho�t th�nh c�ng nhi�m v� t� ��i",
    [5] = "C�c h� �� k�ch ho�t nhi�m v� t� ��i r�i, kh�ng th� k�ch ho�t l�i",
    [6] = "B�y gi� kh�ng ph�i l� th�i gian k�ch ho�t, xin m�i h�y k�ch ho�t nhi�m v� trong th�i gian quy ��nh",
    [7] = "Ta mu�n t�m hi�u th�m/team_task_detailse",
}
VET_201003_STR_BAOMA_TALK = {
    "Ch� c� k�ch ho�t thu�n b�o m� m�i c� th� s� d�ng ch�c n�ng n�y",
    "X�c nh�n k�ch ho�t/VET_201003_ActiveBaoMa",
    "Tam th�i kh�ng k�ch ho�t/gf_DoNothing",
}
VET_201003_STR_TONGBAN_TALK = {
    "Ph�i k�ch ho�t t�nh n�ng b�n ��ng h�nh m�i c� th� s� d�ng t�nh n�ng n�y",
    "X�c nh�n k�ch ho�t/VET_201003_ActiveTONGBAN",
    "Tam th�i kh�ng k�ch ho�t/gf_DoNothing",
}
VET_201003_STR_FAGUANGWUQI_TALK = {
    "Ph�i k�ch ho�t t�nh n�ng ch� t�o v� kh� ph�t s�ng m�i c� th� s� d�ng t�nh n�ng n�y",
    "X�c nh�n k�ch ho�t/VET_201003_ActiveFAGUANGWUQI",
    "Tam th�i kh�ng k�ch ho�t/gf_DoNothing",
}
VET_201003_STR_SHUXINGWAIZHUANG_TALK = {
    "Ph�i k�ch ho�t ch� t�o ngo�i trang c� thu�c t�nh m�i c� th� th� s� d�ng t�nh n�ng n�y",
    "X�c nh�n k�ch ho�t/VET_201003_ActiveSHUXINGWAIZHUANG",
    "Tam th�i kh�ng k�ch ho�t/gf_DoNothing",
}
VET_201003_STR_SHENGJIWUQI_TALK = {
    "Ph�i k�ch ho�t n�ng c�p trang b� v� v� kh� m�i c� th� s� d�ng t�nh n�ng n�y",
    "X�c nh�n k�ch ho�t/VET_201003_ActiveSHENGJIWUQI",
    "Tam th�i kh�ng k�ch ho�t/gf_DoNothing",
}

VET_200912_STR_BOSS_BE_BIRTH_HINT = "%s xu�t hi�n t�i %s t�n s�t sinh linh v� t�i. ��i hi�p h�y �i ��n �� xem t�nh th� n�o."


