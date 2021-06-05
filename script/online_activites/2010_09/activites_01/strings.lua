--=============================================
--create by zhangming 2010.8.20
--describe:Խ�ϰ�2010��9�»1 �ַ����ļ�
--=============================================

VET_201009_01_STR_LOG_TITLE = "Hoat dong thang 9 nam 2010";--���λ��־����

VET_201009_01_TB_LOG_ACTION_LIST = {
    [1] = "��ng nh�p t�ng c�m nang ��i s� ki�n",
    [2] = "S� d�ng b�nh trung thu nh�n ���c ph�n th��ng th��ng",
    [3] = "S� d�ng b�nh trung thu nh�n ���c ph�n th��ng ��c bi�t",
    [4] = "H�p th�nh b�nh trung thu",
    [5] = "Mua c�i",
    [6] = "Nh�n b�nh t� l� n��ng",
    [7] = "Nh�n th��ng max event",
};

VET_201009_01_TB_STRING_LIST = {
    [1] = "B�nh �� qu� h�n s� d�ng, kh�ng th� d�ng ���c n�a",
    [2] = "<color=yellow>Ho�t ��ng Trung Thu<color> b�t ��u t� <color=red>ng�y 17/9/2010 ��n ng�y 24/10/2010<color>. N�i dung chi ti�t vui l�ng t�m hi�u t�i trang ch� <color=green>http://volam2.zing.vn<color>",
    [3] = "\nTa mu�n l�m b�nh trung thu (c�n 5 B�t M� + 1 Nh�n B�nh)",
    [4] = "K�ch ho�t l� n��ng (c�n 40 B�t M� + 8 Nh�n B�nh)",
    [5] = "Hi�n t�i c�c h� m�i s� d�ng ���c <color=red><%d/3450><color>",
    [6] = "Mua 4 b� c�i (c�n 4 v�ng)",
    [7] = "K�t th�c ��i tho�i",
    [8] = "Nguy�n li�u mang theo kh�ng ��",
    [9] = "Gi�n c�ch 2 l�n k�ch ho�t l� n��ng c�n 240 gi�y, c�n <color=red>%d gi�y<color> sau m�i c� th� k�ch ho�t l�i.",
    [10] = "Ch� n�y kh�ng th�ch h�p �� n��ng b�nh",
    [11] = "Nh�n v�t c�p 77 tr� l�n, �� v�o m�n ph�i v� c� 1 k� n�ng c�p 55 m�i c� th� k�ch ho�t Hoa ��ng",
    [12] = "Ch� c� th� k�ch ho�t Hoa ��ng t�i c�c th�nh th� l�n (Bi�n Kinh, Th�nh ��, Tuy�n Ch�u, D��ng Ch�u, T��ng D��ng, ��i L�, Ph��ng T��ng).",
    [13] = "Ti�n v�ng ��i hi�p mang theo kh�ng ��.",
    [14] = "��i hi�p �� s� d�ng qu� nhi�u b�nh �� n��ng ch�n v� b�nh ch�a n��ng ch�n r�i, kh�ng th� ti�p t�c s� d�ng.",
    [15] = "��i hi�p �� s� d�ng qu� nhi�u b�nh trung thu kh�ng th� ti�p t�c s� d�ng.",
    [16] = "R�t ti�c, chi�c l� n��ng n�y kh�ng thu�c v� c�c h�, c�c h� c�n s� d�ng l� n��ng b�nh c�a m�nh.",
    [17] = "Giai �o�n n�y c� th� b� v�o 1 b� c�i, nh� v�y m�i c� th� n��ng ra b�nh ngon ���c.",
    [18] = "Ta b� 1 b� c�i v�o ��y.",
    [19] = "Ta c�n ph�i mua c�i tr��c ��",
    [20] = "C�i trong l� �ang v�n c�n, ��i sau <color=red>%d gi�y<color> h�y b� v�o th�m nh�.",
    [21] = "Nh�ng chi�c b�nh trung thu h�p d�n �� ���c n��ng xong, h�y nhanh ch�ng nh�n b�nh �i, l� n��ng s�p bi�n m�t r�i.",
    [22] = "L�p t�c nh�n b�nh",
    [23] = "T�m th�i kh�ng nh�n",
    [24] = "Ph�n th��ng n�y ch� ���c nh�n 1 l�n, ��i hi�p kh�ng th� nh�n ti�p.",
    [25] = "Ho�t ��ng �� k�t th�c, v� v�y c�m nang ��i s� ki�n c�ng h�t hi�u l�c.",
    [26] = "Ta mu�n nh�n ph�n th��ng s� d�ng t�i �a b�nh Trung Thu",
    [27] = "",
    [28] = "",
};

VET_201009_01_TB_ITEM_LIST = {
    [1] = {"B�nh trung thu �� n��ng ch�n", 2, 1,30237},
    [2] = {"B�nh trung thu ch�a ch�n", 2, 1, 30238},
    [3] = {"B�t m�", 2, 1, 30233},
    [4] = {"B�nh trung thu", 2, 1, 30236},
    [5] = {"Nh�n b�nh",2, 1, 30234},
    [6] = {"C�i",2, 1, 30235},
};

VET_201009_01_TB_MAPID = {
    100,150,200,300,350,400,500,
}

VET_201009_01_TB_KAOLU_TIME = {
    235,205,195,165,155,125,115,85,75,45,0
};


VET_201009_01_TB_ITEM_LOGINGIVE_LIST = {
    [1] = {"C�m Nang ��i S� Ki�n", 2, 1, 30045},
};

VET_201009_01_TB_NPC_LIST = {
    [1] = {"Th�nh H�a ��i", GetName().." L� n��ng","\\script\\online_activites\\2010_09\\activites_01\\npc\\npc_kaolu.lua"},
    --[1] = {"Th�nh H�a ��i","��¯","\\script\\online_activites\\2010_09\\activites_01\\npc\\npc_kaolu.lua"},
};

VET_201009_01_TB_MOONCAKE_AWARD = {
    {31, 255, "SetTask(GLB_TASK_ZIGUANGGE,GetTask(GLB_TASK_ZIGUANGGE)+10)", 1},
    {3, 300, 10000, 1},
    {1, 50, "Thi�n th�ch", {2, 2, 8, 1}, 0},
    {1, 30, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
    {1, 5, "Th� Th�n ph�", {2, 0, 556, 1}, 7 * 24 * 3600},
    {1, 15, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 7 * 24 * 3600},
    {1, 10, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 5, "C�y B�t Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 5, "Thi�n H� M�t T�ch", {0, 107, 64, 1}, 0},
    {1, 5, "T� H� M�t T�ch", {0, 107, 65, 1}, 0},
    {1, 5, "Chi�m Y Ph�", {0, 107, 66, 1}, 0},
    {1, 50, "Tu Ch�n Y�u Quy�t", {2,0,554, 1}, 7 * 24 * 3600},
    {1, 5, "��i Nh�n S�m Qu�", {2,0,553, 1}, 7 * 24 * 3600},
    {1, 10, "�� Nguy�t Th�n Sa", {2, 1, 3332, 1}, 0},
    {1, 15, "C�m Chi�n Tr�ng", {1, 1, 14, 1}, 0},
    {1, 10, "B�nh B�t v�ng", {1, 1, 15, 1}, 0},
    {1, 15, "C�i X�o T�i", {1, 1, 9, 1}, 0},
    {1, 10, "L�c Mai", {1, 1, 16, 1}, 0},
    {1, 15, "T�y M�ng T�u", {1, 1, 11, 1}, 0},
    {1, 10, "Minh Nguy�t D�", {1, 1, 17, 1}, 0},
    {1, 15, "M�c Lan Xu�n", {1, 1, 18, 1}, 0},
    {1, 10, "T�y B�c V�ng", {1, 1, 19, 1}, 0},
    {4, 100, 10, 1},
    {5, 50, 10, 1},
};

VET_201009_01_TB_MOONCAKE_AWARD_SP = {
    {1, 1040, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 600, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 300, "C� quan nh�n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 300, "V� Ng�n Th�y", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "T�y T�y ��n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 1000, "Th�i H� �a M�t Qu� ", {2, 1, 387, 1}, 7 * 24 * 3600},
    {1, 1009, "T�ng Ki�m anh h�ng thi�p", {2, 0, 31, 1}, 7 * 24 * 3600},
    {1, 1000, "R��ng B� K�p", {2, 1, 30093, 1}, 7 * 24 * 3600},
    {1, 500, "R��ng Tr�n Ph�i", {2, 1, 30113, 1}, 7 * 24 * 3600},
    {1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 300, "S� tay s�ng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {8, 1000, 60, 1},
    {15, 1000, 60, 1},
    {12, 1000, 60, 1},
};

VET_201009_01_LIMITED_AWARD =
{
	{1, 150, "Ch�m Ch�m", {2,1,30165, 50}, 0},
	{1, 150, "B�n bon", {2,1,30182, 50}, 0},
    {1, 100, "Chi�n Th�n Ho�n", {2,1,1005, 1}, 7 * 24 * 3600},
    {1, 10, "Phi Y�n Th�ch", {2,1,30130, 1}, 0},
    {1, 10, "T� Quang Th�n Th�ch", {2,1,30131, 1}, 0},
    {1, 5, "B�ch Kim H�ng Bao (tr�ng)", {2, 1, 30228, 1}, 7 * 24 * 3600},
    {1, 5, "Ho�ng Kim H�ng Bao (tr�ng)", {2,1,538, 1}, 7 * 24 * 3600},
    {1, 10, "T� Kim H�ng Bao (tr�ng)", {2,1,536, 1}, 7 * 24 * 3600},
    {1, 349, "Nh�n S�m V�n N�m", {2,1,30071, 1}, 0},
    {1, 1, "��nh H�n Thi�n Th�ch", {2,1,1067, 1}, 7 * 24 * 3600},
    {1, 10, "Thi�n Th�ch Tinh Th�ch", {2,1,1009, 1}, 0},
    {32, 200, 7000, 1},
}