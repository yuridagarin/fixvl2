--=============================================
--create by xiongyizhi 2010.11.2
--describe:Խ�ϰ�2010��12�»1 �ַ����ļ�
--=============================================

VET_201012_04_STR_LOG_TITLE = "Hoat dong trong cay giang sinh thang 12 nam 2010";--���λ��־����

VET_201012_04_TB_LOG_ACTION_LIST = {
    [1] = "��i ph�n th��ng Qu� T� Linh",
    [2] = "Tr�ng c�y T� Linh",
    [3] = "Tr�ng c�y T� Linh nh�n ���c ph�n th��ng",
    [4] = "Tr�m c�y T� Linh nh�n ���c ph�n th��ng",
    [5] = "C�y T� Linh b� tr�m nh�n ���c ph�n th��ng",
    [6] = "Mua ��o c� C�y T� Linh"
};

VET_201012_04_NPC_TB = {
    [1] = {"Nguy�t L�o", "B�ch Th�o Ti�n"},
    [2] = {"C�y T� Linh 1", "C�y T� Linh"}; --TODO �滻����Ӧģ��
};

VET_201012_04_NPC_TALK_TITLE = "<color=yellow>B�ch Th�o Ti�n<color>: ".."C�c h� c�n g�?";

VET_201012_04_NPC_TALK_STRINGS = {
    [1] = "��i c�c lo�i Tr�i C�y T� Linh nh�n th��ng/ExChange_4_soul_award",
    [2] = "Mua c�c lo�i ��o c� tr�ng v� thu th�p c�y T� Linh/buy_item_for_plant_4_soul",
    [3] = "K�t th�c ��i tho�i/gf_DoNothing",
    [4] = "Giao n�p %s ��i ph�n th��ng",
    [5] = "K�t th�c ��i tho�i",
    [6] = "S� l��ng Qu� T� Linh kh�ng ��",
    [7] = "C�y n�y �� b� tr�m qua r�i, h�y �� l�i cho ch� nh�n th�i",
    [8] = "C�c h� c�n g�",
    [9] = "%s  c�n  %s",
    [10] = "Hi�n trong giai �o�n %s, c�ch giai �o�n k� ti�p c�n %d gi�y",
    [11] = "Nguy�n li�u ch�m s�c kh�ng ��",
    [12] = "C�y �� tr��ng th�nh, c�c h� mu�n thu th�p kh�ng?",
    [13] = "Thu th�p c�y",
    [14] = "��a �i�m tr�ng c�y: T�y Th�nh ��, T�y Bi�n Kinh, B�c Tuy�n Ch�u",
    [15] = "Nh�n v�t c�n ��t tr�n c�p 73",	--�� gia nh�p m�n ph�i, , danh v�ng = 3000, �i�m s� m�n = 4000
    [16] = "C�n %d gi�y n�a m�i c� th� thu th�p",
    [17] = " tr�ng ",
    [18] = "Ch� ���c thu ho�ch theo giai �o�n",
    [19] = "S� l��ng c�y b�n tr�n h�m nay �� ��t gi�i h�n, h�y tr�ng ti�p v�o ng�y mai",
    [20] = "S� l��ng tr�i c�y c�c h� giao n�p h�m nay �� ��t gi�i h�n, h�y quay l�i v�o ng�y mai",
    [21] = "H�y x�c ��nh l�i kh�ng gian h�nh trang",
    [22] = "Mua C�y T� Linh (15 xu)",
    [23] = "Mua B�nh Ti�n L� (t��i c�y T� Linh) (20 b�c)",
    [24] = "Mua B�nh Ph�n B�n (b�n ph�n c�y T� Linh) (20 b�c)",
    [25] = "Mua Thu�c Tr� S�u (20 b�c)",
    [26] = "C�c h� c�n mua bao nhi�u?",
    [27] = "Kh�ng �� ti�n",
    [28] = "C�y T� Linh",
    [29] = "Ho�t ��ng n�y ch� h��ng ��n nh�ng ng��i ch�i �� tham gia m�n ph�i th�i, t�i h� ph�i gia nh�p m�t m�n ph�i b�t k� r�i tham gia ho�t ��ng nh�!",
};

VET_201012_04_TB_ITEM = {
    [1] = {"Thanh Long Qu�", {2, 1, 30270}},
    [2] = {"H�a Ph�ng Hoa", {2, 1, 30271}},
    [3] = {"B�ch H� Di�p", {2, 1, 30272}},
    [4] = {"Huy�n V� C�n", {2, 1, 30273}},
};

VET_201012_04_TB_AWARD = {
    [1] = {{15, 0, 0, 0}, 1500000},  --��һ�����ʾ��Ҫ15����һ��ˮ����������������Ӧ����������Ϊ1500000
    [2] = {{0, 15, 0, 0}, 1500000},
    [3] = {{0, 0, 15, 0}, 1500000},
    [4] = {{0, 0, 0, 15}, 1500000},
    [5] = {{10, 10, 10, 10}, 6000000}, --��Ҫ4��ˮ����15��
};

--��Ӧÿ���ɳ��׶ε�������
--�Գɳ���1��Ϊ����
--{"�׶�����", "ģ����", {�����ӱ�}, �׶γ���ʱ��}
--
--{�����ӱ�},ÿ��Ԫ�ص�һλ��������ƷID{G, D, P}����һλ��������������������Ʒ�������ͬ����,Ϊ��������
--�������ĵĲ��ϺͶ�Ӧ����������ͬ��ӳ�����VET_201012_04_TREE_ITEM_TO_ACTION
VET_201012_04_TB_TREE_GROW = {
    [1] = {"C�y gi�ng", "C�y T� Linh 1",nil, 60},
    [2] = {"Ph�t tri�n (1)", "C�y T� Linh 1", {
                                  {{2, 1, 30274}, 1}, 
                                  {{2, 1, 30275}, 1},
                                 }, 60},
    [3] = {"Ph�t tri�n (2)", "C�y T� Linh 2_1", {
                                    {{2, 1, 30275}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [4] = {"Ph�t tri�n (3)", "C�y T� Linh 2_2", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [5] = {"Ph�t tri�n (4)", "C�y T� Linh 3_1", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [6] = {"Ph�t tri�n (5)", "C�y T� Linh 3_2", {
                                    {{2, 1, 30276}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [7] = {"Thu ho�ch", "C�y T� Linh 4", nil, 60},
};

--ֻ�ǰ����ĵĵ��ߺ���Ӧ�Ķ������ƶ�Ӧһ��,��ITEM����չ������ϱ�
VET_201012_04_TREE_ITEM_TO_ACTION = {
    [1] = {"B�nh ti�n l�", {2, 1, 30274}, "T��i n��c"},
    [2] = {"Binh ph�n b�n", {2, 1, 30275}, "B�n ph�n"},
    [3] = {"Thu�c tr� s�u", {2, 1, 30276}, "Tr� s�u"},
};

