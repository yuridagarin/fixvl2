--=============================================
--create by TrojanPizza 2010.3.26
--describe:Խ�ϰ�2010��4�»3 �ַ����ļ�
--=============================================

VET_201004_02_STR_LOG_TITLE = "Hoat dong thang 4 nam 2010";                             --���λ��־����

VET_201004_02_TB_LOG_ACTION_LIST = {
    [1] = "N�p tr�i c�y",
    [2] = "Tr�ng c�y b�t nh�",
    [3] = "Tr�ng c�y b�t nh� l�n",

};

VET_201004_02_TB_RAND_AWARD_LIST = {
    [1] = {1, 5, "Nh�n"  , {2, 1, 30164, 1}, 0, 0},
    [2] = {1, 5, "Ch�m Ch�m", {2, 1, 30165, 1}, 0, 0},
    [3] = {1, 5, "Cam",   {2, 1, 30166, 1}, 0, 0},
    [4] = {1, 5, "D�a",   {2, 1, 30167, 1}, 0, 0},
    [5] = {1, 5, "M�ng c�t",   {2, 1, 30168, 1}, 0, 0},
    [6] = {1, 5, "B��i",   {2, 1, 30169, 1}, 0, 0},
    [7] = {1, 5, "D�u",   {2, 1, 30170, 1}, 0, 0},
    [8] = {1, 5, "Chu�i",   {2, 1, 30171, 1}, 0, 0},
    [9] = {1, 5, "Xo�i",   {2, 1, 30172, 1}, 0, 0},
    [10]= {1, 5, "��o",   {2, 1, 30173, 1}, 0, 0},
    [11]= {1, 5, "M�n",   {2, 1, 30174, 1}, 0, 0},
    [12]= {1, 5, "V�i",   {2, 1, 30175, 1}, 0, 0},
    [13]= {1, 5, "T�o",   {2, 1, 30176, 1}, 0, 0},
    [14]= {1, 5, "B�",   {2, 1, 30177, 1}, 0, 0},
    [15]= {1, 5, "�u ��",   {2, 1, 30178, 1}, 0, 0},
    [16]= {1, 5, "M�ng C�u", {2, 1, 30179, 1}, 0, 0},
    [17]= {1, 5, "Kh�m",   {2, 1, 30180, 1}, 0, 0},
    [18]= {1, 5, "L�",   {2, 1, 30181, 1}, 0, 0},
    [19]= {1, 5, "B�n Bon",   {2, 1, 30182, 1}, 0, 0},
    [20]= {1, 5, "Kh�",   {2, 1, 30183, 1}, 0, 0},
};

VET_201004_02_TB_SMALLTREE_RAND_AWARD_LIST = {
    [1] = {1, 45, "Nh�n", {2, 1, 30164, 2}, 0, 0},
    [2] = {1, 45, "T�o", {2, 1, 30176, 2}, 0, 0},
    [3] = {1, 10, "M�n", {2, 1, 30174, 2}, 0, 0},
};

VET_201004_02_TB_BIGTREE_RAND_AWARD_LIST = {
    [1] = {1, 30, "Nh�n", {2, 1, 30164, 2}, 0, 0},
    [2] = {1, 30, "T�o", {2, 1, 30176, 2}, 0, 0},
    [3] = {1, 30, "M�n", {2, 1, 30174, 2}, 0, 0},
    [4] = {1, 4 , "Chu�i", {2, 1, 30171, 2}, 0, 0},
    [5] = {1, 4 , "��o", {2, 1, 30173, 2}, 0, 0},
    [6] = {1, 1 , "�u ��", {2, 1, 30178, 2}, 0, 0},
    [7] = {1, 1 , "B�n Bon", {2, 1, 30182, 2}, 0, 0},
};

VET_201004_02_TB_ITEM_LIST = {
    [1] = {"Nh�n"  , 2, 1, 30164},
    [2] = {"Ch�m Ch�m", 2, 1, 30165},
    [3] = {"Cam",   2, 1, 30166},
    [4] = {"D�a",   2, 1, 30167},
    [5] = {"M�ng c�t",   2, 1, 30168},
    [6] = {"B��i",   2, 1, 30169},
    [7] = {"D�u",   2, 1, 30170},
    [8] = {"Chu�i",   2, 1, 30171},
    [9] = {"Xo�i",   2, 1, 30172},
    [10]= {"��o",   2, 1, 30173},
    [11]= {"M�n",   2, 1, 30174},
    [12]= {"V�i",   2, 1, 30175},
    [13]= {"T�o",   2, 1, 30176},
    [14]= {"B�",   2, 1, 30177},
    [15]= {"�u ��",   2, 1, 30178},
    [16]= {"M�ng c�u", 2, 1, 30179},
    [17]= {"Kh�m",   2, 1, 30180},
    [18]= {"L�",   2, 1, 30181},
    [19]= {"B�n Bon",   2, 1, 30182},
    [20]= {"Kh�",   2, 1, 30183},
};

VET_201004_02_TB_STRINGS = {
    --npc��Ϣ
    [1] = {
        [1] = "L�o ph� h�",
        [2] = "���ng Minh Th�nh",
        [3] = "<color=green>���ng Minh Th�nh: <color>",
    },
    --�������˶Ի��ַ���
    [2] = {
        [1] = "Thu gom h�ng h�a gi� cao ��y, ai c� <color=yellow>M�n, B��i, ��o � Th�m, D�a, L� � T�o, B�n Bon, M�ng C�t<color> mang n�p cho ta kh�ng? Th� lao kh�ng nh� t� n�o ��u nh�!!",
        [2] = "Ta mu�n ��i 1 �t tr�i c�y.",
        [3] = "Ph�n th��ng n�p nhi�u tr�i c�y.",
        [4] = "Xem thuy�t minh ho�t ��ng",
        [5] = "N�i ��y c� v� ��ng vui gh�.",
        [6] = "Ho�t ��ng n�p tr�i c�y di�n ra h�ng ng�y, �ng v�i m�i lo�i tr�i, ng��i ch�i c� th� n�p 1 l�n trong 1 ng�y, m�i l�n n�p c�n 10 tr�i c�y c�ng lo�i. M�i ng�y c� th� n�p nhi�u lo�i tr�i c�y kh�c nhau, c�ng n�p nhi�u lo�i tr�i c�y kh�c nhau th� ph�n th��ng s� c�ng l�n",
        [7] = "\n<color=red>Ch� �: \nNh�n v�t c�p �� 73 tr� l�n v� �� v�o h� ph�i m�i c� th� tham gia n�p tr�i c�y\nNh�n v�t ph�i n�p �t nh�t 2 lo�i tr�i c�y kh�c nhau m�i c� th� nh�n ph�n th��ng �thu th�p nhi�u lo�i tr�i c�y�\nSau 0 gi� m�i ng�y c� th� n�p tr�i c�y cho ng�y ti�p theo.<color>",
        [8] = "Ta mu�n n�p 10 %s",
        [9] = "C�c h� mu�n n�p lo�i tr�i c�y n�o?",
        [10]= "�� ta suy ngh� l�i",
        [11]= "H�m nay ��i hi�p �� n�p �� 20 lo�i tr�i c�y r�i, ��i mai r�i n�p ti�p nh�, tr�i c�y qu� nhi�u ch� ta ��y ch�a kh�ng h�t!",
        [12]= "H�m nay ��i hi�p �� n�p <color=yellow>%s<color> r�i, h�y n�p lo�i kh�c �i.",
        [13]= "Ng��i ch�i ph�i c�p <color=red>73<color> tr� l�n m�i c� th� tham gia ho�t ��ng, c� l�n ch�ng trai tr�!",
        [14]= "Ho�t ��ng n�y ch� h��ng ��n nh�ng ng��i ch�i �� tham gia m�n ph�i th�i, t�i h� ph�i gia nh�p m�t m�n ph�i b�t k� r�i tham gia ho�t ��ng nh�!",
        [15]= "H�m nay ��i hi�p �� nh�n ph�n th��ng n�p tr�i c�y nhi�u l�n r�i, kh�ng th� nh�n th�m ���c n�a.",
        [16]= "Ch�c m�ng ��i hi�p �� nh�n ���c %d",
        [17]= "Tr�n h�nh trang kh�ng �� %s %d, hay l� �� qu�n � r��ng ch�a �� r�i?",
    },
}