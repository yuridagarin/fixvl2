--=============================================
--create by zhangming 2010.7.15
--describe:Խ�ϰ�2010��8�»1 �ַ����ļ�
--=============================================

VET_201008_01_STR_LOG_TITLE = "Hoat dong thang 8 nam 2010";--���λ��־����
szTmp = "Nh�n ���c 10 �i�m T� Quang"

VET_201008_01_TB_LOG_ACTION_LIST = {
    [1] = "��ng nh�p t�ng c�m nang ��i s� ki�n",
    [2] = "Ph�n th��ng khi s� d�ng b�nh kem socola",
    [3] = "Ph�n th��ng ��c bi�t khi s� d�ng b�nh kem socola",
    [4] = "Ph�n th��ng khi s� d�ng �� 2250 b�nh kem socola",
    [5] = "S� d�ng b�ch kim h�ng bao tr�ng t�ng b�ch kim ��i h�ng bao",
};

VET_201008_01_TB_STRING_LIST = {
    [1] = "S� ki�n th�ng 8 di�n ra t� ng�y 13/08/2010 ��n 24 gi� ng�y 12/09/2010. Chi ti�t c�c ho�t ��ng, xin xem th�m t�i trang ch�: http://volam2.zing.vn",
    [2] = "\nTa mu�n l�m 1 c�i B�nh Kem S�c�la (c�n 5 Nguy�n li�u l�m b�nh + 1 B� quy�t l�m b�nh)",
    [3] = "Ta mu�n nh�n ph�n th��ng s� d�ng t�i �a B�nh Kem S�c�la ",
    [4] = "Nguy�n li�u mang theo kh�ng ��, h�y ki�m tra l�i h�nh trang.",
    [5] = "Hi�n t�i c�c h� m�i s� d�ng ���c <color=red><%d/2250><color>",
    [6] = "K�t th�c ��i tho�i",
    [7] = "B�nh kem socola �� h�t h�n s� d�ng.",
    [8] = "C�c h� �� �n �� 2250 b�nh kem socola r�i, �n th�m s� b� b�o � ��. C�c h� c� th� nh�n ph�n th��ng n�y t�i c�m nang ��i s� ki�n",
    [9] = "Ch� c� nh�n v�t c�p 10 tr� l�n m�i c� th� s� d�ng b�nh kem socola.",
    [10] = "Ho�t ��ng �� k�t th�c, v� v�y c�m nang ��i s� ki�n c�ng h�t hi�u l�c.",
    [11] = "M�i nh�n v�t ch� c� th� nh�n ���c 1 l�n ph�n th��ng s� d�ng b�nh kem ��n gi�i h�n t�i �a. Ng��i �� nh�n ph�n th��ng n�y r�i.",
    [12] = "C�c h� kh�ng �� ti�n �� s� d�ng b�ch kim h�ng bao.",
    [13] = "Ch� c� nh�n v�t c�p 10 tr� l�n m�i c� th� s� d�ng ���c b�nh kem socola.",
};

VET_201008_01_TB_ITEM_LIST = {
    [1] = {"Nguy�n Li�u L�m B�nh", 2, 1, 30225},
    [2] = {"B�nh Kem S�c�la", 2, 1, 30226},
    [3] = {"B� Quy�t L�m B�nh", 2, 1, 30227},
    [4] = {"B�ch Kim H�ng Bao (tr�ng)", 2, 1, 30228},
    [5] = {"B�ch Kim H�ng Bao", 2, 1, 30229},
    [6] = {"Xu", 2, 1, 30230},
};

VET_201008_01_TB_ITEM_LOGINGIVE_LIST = {
    [1] = {"C�m Nang ��i S� Ki�n", 2, 1, 30045},
};

VET_201008_01_QIAOKELIDANGAO_AWARD = {
    {1, 50, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
    {1, 50, "Thi�n th�ch", {2, 2, 8, 1}, 0},
    {4, 60, 10, 1},
    {5, 100, 10, 1},
    {1, 10, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 15 * 24 * 3600},
    {1, 10, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 15 * 24 * 3600},
    {1, 5, "C�y B�t Nh�", {2, 0, 398, 1}, 15 * 24 * 3600},
    {3, 300, 10000, 1},
    {31, 350, "SetTask(GLB_TASK_ZIGUANGGE,GetTask(GLB_TASK_ZIGUANGGE)+10); Msg2Player(szTmp)", 1},          --�Ϲ��
    {1, 10, "T� Quang Kim Thi�n Ti", {2,0,737,1}, 0},
    {1, 10, "T� Quang K� L�n V�", {2,0,736,1}, 0},
    {1, 10, "T� Quang Li�t Di�m C�m", {2,0,735,1}, 0},
    {1, 10, "Th��ng C� K� L�n Huy�t", {2,0,739,1}, 0},
    {1, 10, "M�nh Ti�t Ho�nh Th�", {2,0,738,1}, 0},
    {1, 10, "�� Nguy�t Th�n Sa", {2,1,3332,1}, 0},
    {1, 5, "R��ng b� k�p", {2,1,30093,1}, 15*24*3600},
};

VET_201008_01_QIAOKELIDANGAO_SPECIAL_AWARD = {
    {15, 350, 60, 1},
    {12, 350, 60, 1},
    {1, 100, "R��ng tr�n ph�i", {2,1,30113,1}, 15 * 24 * 3600},
    {1, 100, "��u h�n", {2, 1, 1157, 1}, 15 * 24 * 3600},
    {1, 40, "Th�i H� �a M�t Qu� ", {2, 1, 387, 1}, 15 * 24 * 3600},
    {1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 15 * 24 * 3600},
    {1, 4, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 15 * 24 * 3600},
    {1, 5, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 15 * 24 * 3600},
    {8, 50, 60, 1},
    
};

VET_201008_01_QIAOKELIDANGAO_LIMITED_AWARD = {	
    {1, 2415, "Kh�m",  {2,1,30180,50}, 0},
    {1, 2415, "L�",  {2,1,30181,50}, 0},
    {1, 2415, "B�n Bon",  {2,1,30182,50}, 0},
    {1, 2415, "Kh�",  {2,1,30183,50}, 0},
    {1, 10, "B�ch Kim H�ng Bao (tr�ng)", {2,1,30228,1}, 30 * 24 * 3600},
    {1, 100, "Phi Y�n Th�ch", {2, 1, 30130, 1}, 0},
    {1, 100, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
    {1, 100, "T� Quang Th�n Th�ch", {2,1,30131,1}, 0},
    {1, 10, "Long T� B�i", {2,1,30155,1}, 0},
    {1, 10, "Ph�ng T� B�i", {2,1,30156,1}, 0},
    {1, 10, "�ng T� B�i", {2,1,30158,1}, 0},
};


