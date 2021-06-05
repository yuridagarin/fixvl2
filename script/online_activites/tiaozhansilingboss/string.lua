--=============================================
--create by zhangming 2010.7.28
--describe:Խ�ϰ�2010����ս���� �ַ����ļ�
--=============================================

VET_201008_02_STR_LOG_TITLE = "Ho�t ��ng khi�u chi�n t� linh";--���λ��־����

VET_201008_02_TB_LOG_ACTION_LIST = {
    [1] = "N�p ��n h��ng m�c �� nh�n th��ng",
    [2] = "Nh�n ��n h��ng m�c",
    [3] = "Nh�n ph�n th��ng ti�c m�ng c�ng",
    [4] = "S� d�ng t� linh l�nh nh�n ���c ph�n th��ng",
    [5] = "��nh b�i boss nh�n ���c t� linh l�nh",
};

VET_201008_02_TB_ITEM_LIST = {
    [1] = {"��n H��ng M�c",2,1,30231},
    [2] = {"T� Linh L�nh",2,1,30232},
};


VET_201008_02_TB_NPC_LIST = {
    [1] = {"L� n��ng b�nh","T� Linh ��nh","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_silingding.lua"},
    [2] = {"R��ng ti�n","��n H��ng R��ng","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_tanmuxiang.lua"},
    [3] = {"M�m c�","Ti�c m�ng c�ng c�a %s","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_qinggongyan.lua"},
};

VET_201008_02_TB_BOSS_LIST = {
    [1] = {"Long T�","Long Th�n H�a Th�n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [2] = {"Ph�ng T�","Ph�ng Th�n H�a Th�n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [3] = {"H� T�","H� Th�n H�a Th�n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [4] = {"�ng T�","�ng Th�n H�a Th�n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
};



VET_201008_02_TB_STR_LIST = {
    [1] = "T� linh ��nh �� xu�t hi�n t�i %s, ch� v� ��i hi�p h�y chu�n b� khi�u chi�n BOSS t� linh",
    [2] = "N�p s� l��ng ��n h��ng m�c kh�ng �� 200 c�i, v� v�y kh�ng th� k�ch ho�t ���c BOSS t� linh. Xin h�y c� g�ng l�n sau",
    [3] = "Cu�i c�ng c�ng n�p �� 200 ��n h��ng m�c, BOSS t� linh �� b� k�ch ho�t. M�i ng��i h�y chu�n b� ngh�nh chi�n nh�.",
    [4] = "Ta mu�n n�p ��n h��ng m�c",
    [5] = "K�t th�c ��i tho�i",
    [6] = "�� n�p <color=red>%d/200<color> ��n h��ng m�c.",
    [7] = "M�i ng�y m�i ng��i ch� c� th� n�p 80 ��n h��ng m�c. c�c h� �� n�p �� 80 c�i r�i v� v�y kh�ng th� n�p th�m ���c n�a.",
    [8] = "�� n�p �� 200 ��n h��ng m�c, kh�ng c�n ph�i n�p th�m n�a. Xin h�y ��i boss xu�t hi�n!!!",
    [9] = "Tr�n h�nh trang c�a c�c h� �� c� 1 ��n h��ng m�c r�i, kh�ng th� mang th�m ��n h��ng m�c n�a.",
    [10] = "C�p 77 tr� l�n v� �� tham gia m�n ph�i m�i c� th� m� r��ng ��n m�c",
    [11] = "%s �� b�i %s, nh�n ���c t� linh l�nh.",
    [12] = "C�p 77 tr� l�n v� �� tham gia m�n ph�i m�i c� th� s� d�ng ti�c m�ng c�ng",
    [13] = "H�m nay c�c h� �� s� d�ng 9 l�n ti�c m�ng c�ng, v� v�y kh�ng th� ti�p t�c s� d�ng.",
    [14] = "C�n th�m %d gi�y m�i c� th� s� d�ng ti�p ti�c m�ng c�ng",
    [15] = "Trong t� linh l�nh �n ch�a huy�n c�, x�c nh�n mu�n s� d�ng t� linh l�nh??",
    [16] = "��ng v�y!",
    [17] = "H�nh trang kh�ng �� ��n h��ng m�c",
    [18] = "C�p 77 tr� l�n v� �� tham gia m�n ph�i m�i c� th� s� d�ng t� linh ��nh",
    [19] = "R��ng ��n m�c xu�t hi�n r�i.",
    [20] = "T� linh ��nh c� ch�a %d ��n h��ng m�c",
    [21] = "Th�n th� t� linh xu�t hi�n, xin h�y nhanh ch�ng b�t l�y.",
    [22] = "Ch�c m�ng ch� v� �� �� b�i th�n th� t� linh, xin h�y nhanh ch�ng chu�n b�",
};

VET_201008_02_TB_GIVE_QINGGONGYAN_AWARD = {
    {1, 1514, "C�m chi�n tr�ng", {1, 1, 14, 1}, 0},
    {1, 518, "Thi�n th�ch", {2, 2, 8, 1}, 0},
    {1, 500, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
    {1, 140, "B�ng th�ch", {2, 1, 149, 1}, 0},
    {1, 10, "T�y T�y linh ��n", {2, 0, 137, 1}, 15 * 24 * 3600},
    {1, 50, "R��ng B� K�p", {2, 1, 30093, 1}, 30 * 24 * 3600},
    {1, 50, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
    {1, 200, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 15 * 24 * 3600},
    {1, 6, "R��ng Tr�n Ph�i", {2, 1, 30113, 1}, 30 * 24 * 3600},
    {1, 12, "T� Quang B�i", {2, 0, 762, 1}, 15 * 24 * 3600},
    {1, 1400, "B�nh B�t v�ng", {1, 1, 15, 1}, 15 * 24 * 3600},
    {1, 1400, "M�c Lan Xu�n", {1, 1, 18, 1}, 0},
    {1, 1400, "T�y B�c V�ng", {1, 1, 19, 1}, 0},
    {1, 1400, "L�c Mai", {1, 1, 16, 1}, 0},
    {1, 1400, "Minh Nguy�t D�", {1, 1, 17, 1}, 0},
};

VET_201008_02_TB_GIVE_SILINGLING_AWARD = {
    {2, 73, 500000, 1},
    {1, 6, "T�y T�y ��n", {2, 0, 136, 1}, 15 * 24 * 3600},
    {1, 6, "R��ng B� K�p", {2, 1, 30093, 1}, 30 * 24 * 3600},
    {1, 1, "R��ng Y�u Quy�t_Cao C�p", {2, 1, 30112, 1}, 30 * 24 * 3600},
    {1, 6, "R��ng Tr�n Ph�i", {2, 1, 30113, 1}, 30 * 24 * 3600},
    {1, 6, "Nguy�t Hoa Chi Tinh", {2, 1, 3219, 1}, 0},
    {1, 1, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 15 * 24 * 3600},
    {3, 1, 10000000, 1},
};



--�Ͻ�̴��ľ����
VET_201008_02_TB_GIVE_TANXIANGMU_AWARD = {
    {2, 70, 50000, 1},
    {5, 30, 5, 1},
};

VET_201008_02_STR_CITY_NAME = {
    [1] = "Long Tuy�n Th�n",
    [2] = "V�n M�ng Tr�ch",
    [3] = "��ng Bi�n Kinh",
    [4] = "T�y Tuy�n Ch�u",
    [5] = "B�c Tuy�n Ch�u",
};



