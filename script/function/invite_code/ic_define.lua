Include("\\script\\lib\\globalfunctions.lua")
--����
DebugOutput = nothing

--�����ʱ��
IC_START_TIME = {2014,10,21,0,0,0};
IC_END_TIME = {2014,11,21,0,0,0};

--��������
IC_INVITE_CODE_SALT = "zpb0nBJXd6rhvK5PZQAbSYBHChNAVnhX"

--ʹ�õ����ݿ������
IC_MYSQL_TABLE_NAME = "invite_code_1410"

--������Ϊ����
IC_QUERY_TYPE_REG = 1; --ע��
IC_QUERY_TYPE_QRY	= 2; --��ѯ
IC_QUERY_TYPE_MDY = 3; --�޸�

--����������
IC_TASK_GROUP = {3, 14};

--�������ʱ��s
IC_CLICK_TIME = 15;

--�����߽�������
IC_FINISH_INVITE_TYPE1 = 1; --5ת90��
IC_FINISH_INVITE_TYPE2 = 2; --6ת90��
IC_FINISH_INVITE_TYPE3 = 3; --�����¿�
IC_FINISH_INVITE_TYPE4 = 4; --��������2000XU
IC_FINISH_INVITE_TYPE5 = 5; --��������4000XU

IC_FINISH_INVITE_TYPE6 = 6; --�������3������
IC_FINISH_INVITE_TYPE7 = 7; --�������4������
IC_FINISH_INVITE_TYPE8 = 8; --�������5������

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,20, "Huy�tTr�chTh�ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,20, "Nguy�tB�chTh�ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,20, "H� Ph�ch Th�ch C�p 4", {2,22,304,1},nil,nil,nil,nil},
        {1,20, "H�c Di�u Th�ch C�p 4", {2,22,404,1},nil,nil,nil,nil},
        {1,4, "Huy�tTr�chTh�ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,4, "Nguy�tB�chTh�ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,4, "H� Ph�ch Th�ch C�p 5", {2,22,305,1},nil,nil,nil,1},
        {1,4, "H�c Di�u Th�ch C�p 5", {2,22,405,1},nil,nil,nil,1},
        {1,1, "Huy�tTr�chTh�ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,1, "Nguy�tB�chTh�ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,1, "H� Ph�ch Th�ch C�p 6", {2,22,306,1},nil,nil,nil,1},
        {1,1, "H�c Di�u Th�ch C�p 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

--�����߽���
IC_YAOQING_AWARD = {
	[1] = {"item",		1, 	"Hu�n ch��ng anh h�ng", {2,1,30499,4}},
	[2] = {"item", 		6, 	"Thi�t tinh c�p 4", 	{2,1,30612,10,4}},
	[3] = {"item", 		12, "L�i H� Tinh Ph�ch", {2,1,30614,2}},
	[4] = {"item", 		24, "Thi�n Th�ch linh th�ch", {2,1,1068,1,4}, 7 * 24 * 3600},
	[5] = {"func", 		36, "Ng�u nhi�n �� qu� c�p 4~6", ck_GiveRandGem456},
	[6] = {"item", 		50, "Thi�n Cang L�nh", {2,95,204,1}},
	[7] = {"item", 		60, "C�n H� Ng�c Dao Ki�m", {0,105,10109,1,4,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
}

--����
IC_YAOYANG_JIEZI_1 = {
	{"Di�u D��ng-� L�n B�o Gi�i", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-T� Giao Ng�c B�i", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-V�n H� L�nh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-X�ch T��c Ho�n", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-B�ch Quy Li�n", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

IC_YAOYANG_JIEZI_2 = {
	{"Di�u D��ng To�i Ho�ng-� L�n B�o Gi�i", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-T� Giao Ng�c B�i", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-V�n H� L�nh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-X�ch T��c Ho�n", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng To�i Ho�ng-B�ch Quy Li�n", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}
