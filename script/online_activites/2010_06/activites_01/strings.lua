--=============================================
--create by zhoulimei 2010.5.11
--describe:Խ�ϰ�2010��6�»1 �ַ����ļ�
--=============================================

VET_201006_01_STR_LOG_TITLE = "Ho�t ��ng 06/2010";--���λ��־����
VET_201006_01_STR_NPC_NAME = "<color=green>".."Con trai th� r�n L�u: ".."<color>";
VET_201006_01_TB_LOG_ACTION = {
      [1] = "Ch� bi�n tr�i c�y th�nh ��c s�n",
      [2] = "Nh�n th��ng khi �� ��t s� l�n s� d�ng ��c S�n t�i �a",
      [3] = "X�a m�m tr�i c�y th�t b�i",
      [4] = "X�a c�m nang ch� bi�n th�t b�i",
      [5] = "T�ng ��c s�n tr�i c�y cho con th� r�n l�u, nh�n ph�n th��ng",
      [6] = "S� d�ng ��c s�n tr�i c�y nh�n ph�n th��ng",
      [7] = "S� d�ng %d l�n ��c s�n tr�i c�y nh�n ph�n th��ng",
      
};

VET_201006_01_TB_STRING = {
    [1] = "S� ki�n m�a h� n�m nay di�n t� ng�y <color=yellow>28-05-2010<color> ��n 24 gi� ng�y <color=yellow>04-07-2010<color>. Th�ng tin chi ti�t, ��ng ��o c� th� xem th�m t�i trang ch� <color=green>http://volam2.zing.vn<color>",
    [2] = "\nCh� bi�n tr�i c�y th�nh ��c s�n (c�n 6 M�m Tr�i C�y + 1 C�m Nang Ch� Bi�n)",
    [3] = "Nh�n th��ng khi �� ��t s� l�n s� d�ng ��c S�n t�i �a",
    [4] = "T�ng ��c s�n cho Con Trai Th� R�n L�u",
    [5] = "K�t th�c ��i tho�i",
    [6] = "B� mu�n �n b�nh tr�i c�y (c�n 10 c�i)",
    [7] = "B� mu�n �n kem tr�i c�y (c�n 10 c�i)",
    [8] = "B� mu�n �n m�t tr�i c�y (c�n 10 c�i)",
    [9] = "B� mu�n u�ng n��c tr�i c�y (c�n 10 ly)",
    [10] = "H�nh nh� ta qu�n mang theo ��c s�n",
    [11] = "��i hi�p mang kh�ng �� nguy�n li�u �.",
    [12] = "Kh�ng �� y�u c�u nh�n th��ng. S� l�n s� d�ng ��c s�n: <color=yellow>[%d/1500]<color>",
    [13] = "C�c h� �� nh�n th��ng r�i, trong th�i gian ho�t ��ng ch� nh�n ���c 1 l�n.",
    [14] = {"Ch�o s� huynh", "Ch�o s� t�"},
    [15] = {"Sao �� kh�ng nh�n th�y g� h�t v�y! Huynh ��ng l�a g�t �� m� � hu hu.", "Sao �� kh�ng nh�n th�y g� h�t v�y! T� ��ng l�a g�t �� m� � hu hu."},
    [16] = "�c �c � Xin l�i ��, ta qu�n mang theo.",
    [17] = "H�m nay ti�u �� �� no r�i, ng�y mai l�i ti�p t�c nh�! Hihi",
    [18] = "��ng �, ng�y mai ta ti�p t�c. ",
    [19] = {"S� huynh t�m ta c� vi�c g�?", "S� t� t�m ta c� vi�c g�?"},
    [20] = "Ph�i c�p 10 tr� l�n m�i t�ng ���c!",
    [21] = "V�t ph�m n�y �� qu�  h�n s� d�ng",
    [22] = "Ng��i �� s� d�ng ��c s�n 1500 l�n r�i, kh�ng th� s� d�ng th�m n�a!",
    [23] = "Ph�i c�p 10 tr� l�n m�i c� th� s� d�ng! ��i hi�p h�y c� l�n nh�!",
    [24] = "H�m nay �� s� d�ng 8 v� l�m m�t �n r�i (b�t k� lo�i n�o), kh�ng th� s� d�ng th�m",
    
};
--�ϳɸ����ز���� ���� 100  ���� 1�� ���� 0
VET_201006_01_TECHAN_HECHEN = {
    {1, 25, "B�nh tr�i c�y", {2,1,30194,1}, 0},
    {1, 25, "Kem tr�i c�y", {2,1,30195,1}, 0},
    {1, 25, "M�t tr�i c�y", {2,1,30196,1}, 0},
    {1, 25, "N��c tr�i c�y", {2,1,30197,1}, 0},
    
 };

--ÿ��ʹ���ز������� ����1000   ���� 1 �� ����  1
VET_201006_01_USETECHAN_AWARD_LIST = {
    {1, 200, "L� th�y", {2, 0, 351, 1}, 0},
    {1, 80, "Thi�n th�ch", {2, 2, 8, 1}, 0},
    {1, 60, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
    {1, 20, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 15*24*60*60},
    {1, 20, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 15*24*60*60},
    {1, 5, "T� H� M�t t�ch", {0, 107, 65, 1}, 0},
    {1, 5, "Thi�n H� M�t t�ch", {0, 107, 64, 1}, 0},
    {1, 5, "Chi�m Y Ph�", {0, 107, 66, 1}, 0},
    {1, 5, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 15*24*60*60},
    {1, 5, "C�y B�t Nh�", {2, 0, 398, 1}, 15*24*60*60},
    {3, 200, 40000, 1},
    {2, 100, 1, 1},
    {4, 100, 4, 1},
    {5, 100, 4, 1},
    {14, 40, 60, 1},
    {11, 40, 60, 1},
    {7, 15, 60, 1},
};


--ÿ��50��ʹ���ز������� ����10000  ����1 �� ���� 2
VET_201006_01_USETECHAN_AWARD_LIST_50 = {
    {1, 2000, "Th�i H� �a M�t Qu� ", {2, 1, 387, 1}, 15*24*60*60},
    {1, 2000, "T�ng ki�m anh h�ng thi�p", {2, 0, 31, 1}, 15*24*60*60},
    {1, 1000, "M�ng c�t", {2, 1, 30168, 1}, 0},
    {1, 1000, "B��i", {2, 1, 30169, 1}, 0},
    {1, 1000, "D�u", {2, 1, 30170, 1}, 0},
    {1, 1000, "Chu�i", {2, 1, 30171, 1}, 0},
    {1, 775, "��u h�n", {2, 1, 1157, 1}, 15*24*60*60},
    {1, 400, "R��ng B� K�p", {2, 1, 30093, 1}, 15*24*60*60},
    {1, 400, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
    {1, 200, "R��ng Tr�n Ph�i", {2, 1, 30113, 1}, 15*24*60*60},
    {1, 100, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 15*24*60*60},
    {1, 50, "R��ng Y�u Quy�t_Cao C�p", {2, 1, 30112, 1}, 15*24*60*60},
    {1, 25, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 15*24*60*60},
    {1, 25, "Phi Y�n Th�ch", {2, 1, 30130, 1}, 0},
    {1, 25, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}, 0},
};

--�ز�ʹ�����޽����� ����10000  ���� 1 �� ���� 1
VET_201006_01_USETECHAN_AWARD_LIST_UP  = {
    {1, 2225, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
    {1, 1000, "D�a", {2, 1, 30167, 4}, 0},
    {1, 100, "Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1}, 15*24*60*60},
    {1, 100, "T� Kim H�ng Bao (tr�ng)", {2, 1, 536, 1}, 15*24*60*60},
    {1, 25, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 15*24*60*60},
    {1, 25, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 15*24*60*60},
    {1, 25, "L�ng Ba Vi B�", {0, 112, 78, 1}, 0},
    {3, 5000, 1000000, 1},
    {3, 1000, 10000000, 1},
    {3, 500, 20000000, 1},
};

--���͸����������� ���� ����100  ����1�� ���� 1
VET_201006_01_GIVETOSON_AWARD  = {
    {3, 50, 300000, 1},
    {2, 25, 1, 1},
    {1, 25, "D�a", {2, 1, 30167, 2}, 0},
};

VET_201006_01_ITEM_LOGIN_GIVE = {"C�m Nang ��i S� Ki�n", {2, 1, 30045}};

VET_201006_01_SHUIGUOPAN = {"M�m tr�i c�y", {2,1,30192}};
VET_201006_01_ZHIZUOJINGNANG = {"C�m nang ch� bi�n", {2,1,30193}};
VET_201006_01_NPCINDEX = {"��ng t�1", "Con trai th� r�n L�u", 350, 1417, 2932};