--=============================================
--create by zhangming 2010.5.12
--describe:Խ�ϰ�2010��6�»2 �ַ����ļ�
--=============================================

VET_201006_02_STR_LOG_TITLE = "N�ng c�p m�t t�ch m�n ph�i";--���λ��־����
VIET_MATTICH_TIMES = 1
VET_201006_02_TB_LOG_ACTION_LIST = {
    [1] = "��i m�t t�ch m�n ph�i",
};

VET_201006_02_TB_STRING_LIST = {
    [1] = "Khi c�n tr� l�o phu t�ng tung ho�nh kh�p v� l�m �� truy t�m nh�ng cu�n m�t t�ch c�c m�n ph�i b�y gi� gi� r�i m�c d� r�t mu�n t� m�nh �i t�m nh�ng l�c b�t t�ng t�m . Ng��i c� th� gi�p l�o phu ti�p t�c t�m m�t t�ch ���c kh�ng ? L�o phu c� th� ��i cho ng��i m�t v�i cu�n m�t t�ch qu� m� l�o phu �� c�",
    [2] = "Ta mu�n ��i m�t t�ch c�p 45 th�nh c�p 70",
    [3] = "T�i h� ch� gh� ngang!",
    [4] = "��i m�t t�ch m�n ph�i",
    [5] = "Ng��i c� ph�i mu�n ��i 5 m�t t�ch m�n ph�i b�t k� c�p 45 ho�c t�m ph�p c�p 45 ��i l�y 1 cu�n m�t t�ch c�p 70?",
    [6] = "Ch� c� th� b� v�o m�t t�ch ho�c t�m ph�p m�n ph�i c�p 45",
    [7] = "B� v�o v�t ph�m kh�ng ��ng",
    [8] = "Ng�n l��ng tr�n ng��i kh�ng ��",
};


VET_201006_02_TB_NPC_LIST = {
    [1] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 500, 1770, 3123},
--    [2] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 400, 1507, 2988},
--    [3] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 350, 1446, 2946},
--    [4] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 150, 1701, 3139},
--    [5] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 100, 1420, 2963},
--    [6] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 300, 1731, 3513},
--    [7] = {"Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 200, 1380, 2857},
};

VET_201006_02_TB_BOOK_LIST = {
    {"Kim Cang Ph�c Ma kinh", 0, 107, 1},
    {"Kim Cang Ph�c Ma T�m Ph�p", 0, 107, 2},
    {"Ti�m Long M�t t�ch", 0, 107, 3},
    {"Ti�m Long T�m Ph�p", 0, 107, 4},
    {"V� Tr�n M�t t�ch", 0, 107, 5},
    {"V� Tr�n T�m Ph�p", 0, 107, 6},
    {"Thi�n La M�t T�ch", 0, 107, 7},
    {"Thi�n La T�m Ph�p", 0, 107, 8},
    {"Nh� � M�t T�ch", 0, 107, 9},
    {"Nh� � T�m Ph�p", 0, 107, 10},
    {"B�ch H�i Ph�", 0, 107, 11},
    {"B�ch H�i T�m Ph�p", 0, 107, 12},
    {"H�n ��n M�t t�ch", 0, 107, 13},
    {"H�n ��n T�m Ph�p", 0, 107, 14},
    {"Qu� Thi�n M�t t�ch", 0, 107, 15},
    {"Qu� Thi�n T�m Ph�p", 0, 107, 16},
    {"Huy�n �nh M�t T�ch", 0, 107, 17},
    {"Huy�n �nh T�m Ph�p", 0, 107, 18},
    {"Qu�n T� M�t t�ch", 0, 107, 19},
    {"Qu�n T� T�m Ph�p", 0, 107, 20},
    {"Tr�n Qu�n M�t t�ch", 0, 107, 21},
    {"Tr�n Qu�n T�m Ph�p", 0, 107, 22},
    {"Xuy�n V�n M�t t�ch", 0, 107, 23},
    {"Xuy�n V�n T�m Ph�p", 0, 107, 24},
    {"U Minh Qu� L�c", 0, 107, 25},
    {"U Minh T�m Ph�p", 0, 107, 26},
    {"Linh C� M�t t�ch", 0, 107, 27},
    {"Linh C� T�m Ph�p", 0, 107, 28},
    {"Kinh Phong M�t T�ch", 0, 107, 180},
    {"Kinh Phong T�m Ph�p", 0, 107, 181},       
    {"T�y M�ng M�t T�ch", 0, 107, 188},
    {"T�y M�ng T�m Ph�p", 0, 107, 189},      
    {"Ph�n Hoa M�t T�ch", 0, 107, 190},
    {"Ph�n Hoa T�m Ph�p", 0, 107, 191},              
};

VET_201006_02_TB_CHANGE_BOOK_LIST = {
    {1, 7, "Kim Cang B�t Nh� Kinh", {0, 107, 166, 1}, 0},
    {1, 7, "Ti�m Long T�ch Di�t Kinh", {0, 107, 167, 1}, 0},
    {1, 7, "V� Tr�n B� �� Kinh", {0, 107, 168, 1}, 0},
    {1, 8, "Thi�n La Li�n Ch�u L�c", {0, 107, 169, 1}, 0},
    {1, 7, "Nh� � Kim ��nh M�t T�ch", {0, 107, 170, 1}, 0},
    {1, 7, "B�ch H�i Tuy�t �m Ph�", {0, 107, 171, 1}, 0},
    {1, 7, "H�n ��n Tr�n Nh�c M�t T�ch", {0, 107, 172, 1}, 0},
    {1, 7, "Qu� Thi�n Du Long M�t T�ch", {0, 107, 173, 1}, 0},
    {1, 7, "Huy�n �nh M� Tung M�t T�ch", {0, 107, 174, 1}, 0},
    {1, 7, "Qu�n T� Ti�t Phong M�t T�ch", {0, 107, 175, 1}, 0},
    {1, 7, "Tr�n Qu�n Phi Long Th��ng Ph�", {0, 107, 176, 1}, 0},
    {1, 8, "Xuy�n V�n L�c H�ng M�t T�ch", {0, 107, 177, 1}, 0},
    {1, 7, "U Minh Phong Ma L�c", {0, 107, 178, 1}, 0},
    {1, 7, "Linh C� Huy�n T� L�c", {0, 107, 179, 1}, 0},
    {1, 0, "C�u Thi�n Phong L�i Quy�t", {0, 107, 198, 1}, 0},    
    {1, 0, "H�ng Tr�n T�y M�ng Ph�", {0, 107, 202, 1}, 0},
    {1, 0, "Phong Hoa Thi�n Di�p Ph�", {0, 107, 203, 1}, 0},    
};

--- M�t  t�ch cao c�p-----
VET_70_GAOJIMIJI = {
	{1, 666, "Kim Cang B�t Nh� Ch�n Quy�n ", {0, 107, 204, 1}, 0},
	{1, 19, "Ti�m Long T�c Di�t Ch�n Quy�n", {0, 107, 205, 1}, 0},
	{1, 666, "V� Tr�n B� �� Ch�n Quy�n", {0, 107, 206, 1}, 0},
	{1, 888, "Thi�n La Li�n Ch�u Ch�n Quy�n", {0, 107, 207, 1}, 0},
	{1, 19, "Nh� � Kim ��nh Ch�n Quy�n", {0, 107, 208, 1}, 0},
	{1, 19, "B�ch H�i Tuy�t �m Ch�n Quy�n", {0, 107, 209, 1}, 0},
	{1, 999, "H�n ��n Tr�n Nh�c Ch�n Quy�n", {0, 107, 210, 1}, 0},
	{1, 999, "Qu� Thi�n Du Long Ch�n Quy�n", {0, 107, 211, 1}, 0},
	{1, 1202, "Huy�n �nh M� T�ng Ch�n Quy�n", {0, 107, 212, 1}, 0},
	{1, 1202, "Qu�n T� ��i Phong Ch�n Quy�n", {0, 107, 213, 1}, 0},
	{1, 888, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n", {0, 107, 214, 1}, 0},
	{1, 333, "Xuy�n V�n L�c H�ng Ch�n Quy�n", {0, 107, 215, 1}, 0},
	{1, 1212, "Huy�n Minh Phong Ma Ch�n Quy�n", {0, 107, 216, 1}, 0},
	{1, 888, "Linh C� Huy�n T� Ch�n Quy�n", {0, 107, 217, 1}, 0},
	{1, 0, "C�u Thi�n Phong L�i Ch�n Quy�n", {0, 107, 218, 1}, 0},
	{1, 0, "H�ng Tr�n T�y M�ng Ch�n Quy�n", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thi�n Di�p Ch�n Quy�n", {0, 107, 223, 1}, 0},		
}
--------

