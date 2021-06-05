Include("\\script\\lib\\globalfunctions.lua")
--����
DebugOutput = nothing

--�Ƿ�Ϊ�·�������
--Experience server Switch
CK_ES_SWITCH = 0;
EXT_CDKEY = 3	

--activity time
CK_START_TIME = {2014,10,21,0,0,0}; --����ʱ��
CK_START_ACT = {2014,11,22,0,0,0}; --�����ֹʱ��
CK_END_TIME = {2015,1,21,0,0,0}; --���ֹʱ��

--ʹ�õ����������
CK_TASK_GROUP = {4, 13};

--����ֱǰϵ������
CK_TASK_FORWARD = {
	[1] = {"Ti�u di�t �c Lang", 226},
	[2] = {"Ti�u di�t H� Ly", 227},
	[3] = {"Ti�u di�t Xi H�a X�ch Gi�o ��", 228},
	[4] = {"Ti�u di�t Th��ng Vi�n", 229},
	[5] = {"Ti�u di�t Mi�u L�nh Th� Ty", 230},
	[6] = {"Ti�u di�t Ba T� Y�u C�", 231},
	[7] = {"Ti�u di�t Oa Qu�c �ao Kh�ch", 232},
	[8] = {"Ti�u di�t T� B� Ti�n T�", 233},
}

--��ս����ɱ������
CK_TASK_BZ_KILL = {
	[1] = {"Quay V� Ch�n C�", 234},
	[2] = {"Quay V� Ch�n C�", 235},
	[3] = {"Quay V� Ch�n C�", 236},
	[4] = {"Quay V� Ch�n C�", 237},
	[5] = {"Quay V� Ch�n C�", 238},
}

--��ս������������
CK_TASK_BZ_RAID = {
	[1] = "Tham gia 1 l�n �i Th�i H�",
	[2] = "Tham gia 1 l�n �i L��ng S�n ",
	[3] = "Tham gia 1 l�n �i V�n Ki�m Tr�ng",
	[4] = "Tham gia 1 l�n �i ��a Huy�n Cung",
	[5] = "Tham gia 1 l�n �i Th�i Nh�t Th�p",
}

--��ս����PVP����
CK_TASK_BZ_PVP = {
	[1] = "Tham gia 3 l�n thi ��u 1v1",
	[2] = "Tham gia 3 l�n thi ��u 3v3",
	[3] = "Tham gia 1 l�n chi�n tr��ng Thi�n M�n Tr�n",
	[4] = "Tham gia 1 l�n Th�n l�ng chi�n",
	[5] = "Tham gia 1 l�n Th�o c�c chi�n",
	[6] = "Tham gia 1 l�n Ph�o ��i chi�n",
	[7] = "Tham gia 1 l�n Chi�n d�ch ch�nh Nh�n M�n",	
}

--��ֵ�ۼ�����
CK_TASK_ZILON_ATRR = {
	[1] = {"S� nh�p giang h�", {0, 90, 2000, 2000, 10000}, {5000000, 100}},
	[2] = {"Ti�u H�u S� Th�nh", {0, 99, 3000, 3000, 20000}, {8000000, 200}},
	[3] = {"S� xu�t mao l�", {1, 90, 6000, 6000, 40000}, {11000000, 300}},
	[4] = {"��i Lang ��o Sa", {2, 90, 8000, 8000, 80000}, {14000000, 400}},	
	[5] = {"Ti�u H�u Danh Kh�", {3, 90, 10000, 10000, 120000}, {17000000, 500}},
	[6] = {"Tr�ng Ch� L�ng V�n", {4, 90, 12000, 12000, 180000}, {20000000, 600}},
	[7] = {"Uy Phong B�t Di�n", {5, 90, 15000, 15000, 250000}, {23000000, 1200}},
	[8] = {"Kh� tr�ng h� s�n", {6, 90, 16000, 16000, 280000}, {32000000, 1600}},
}
CK_TASK_ZILON_ATRR_BEGIN = 1

--�콾����������
CK_TASK_IB_COST = {
	[1] = {"Phong Y T�c Th�c", 5,   {12500000, 150}},
	[2] = {"Uy Phong B�t Di�n", 25,  {25000000, 300}},
	[3] = {"Kinh t� gia ��nh", 50,  {37500000, 450}},	
	[4] = {"��i Ph� ��i Qu�", 100, {50000000, 600}},
	[5] = {"T�i ��i Kh� Th�", 200, {62500000, 800}},
	[6] = {"Gia T�i V�n Qu�n", 300, {75000000, 1000}},
	[7] = {"Gi�u c� thi�n h�", 400, {100000000, 1200}},
	[8] = {"Ph� Kh� ��ch Qu�c", 500, {125000000, 1500}},
}
CK_TASK_IB_COST_BEGIN = getn(CK_TASK_ZILON_ATRR)+1

--���׽���
CK_SCROE_AWARD_TABLE = {
	[1] = 90,	
	[2] = 1000,
	[3] = 1300,
	[4] = 1700,
	[5] = 2000,
	[6] = 2400,
	[7] = 2800,
	[8] = 3100,
	[9] = 3500,
	[10] = 3800,
	[11] = 5000,
	[12] = 6000,
	[13] = 7000,
	[14] = 8500,
	[15] = 11000,
	[16] = 14000,
	[17] = 15000,
	[18] = 16000,
	[19] = 17000,
}

CK_JS_GUAIYI = {
	{"�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1, 4}},
	{"�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1, 4}},
	{"�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1, 4}},
	{"�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1, 4}},
	{"�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1, 4}},
	{"�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1, 4}},
}
CK_JS_HUIZHANG = { 
	{"Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1, 4}},
	{"Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1, 4}},
	{"Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1, 4}},
	{"Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1, 4}},
	{"Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1, 4}},
	{"Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1, 4}},
}
CK_JS_SHOE = {
	{"Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1, 4}},
	{"Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1, 4}},
	{"Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1, 4}},
	{"Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1, 4}},
	{"Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1, 4}},
	{"Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1, 4}},
}

CK_YAOYANG_JIEZI_1 = {
	{"Di�u D��ng-� L�n B�o Gi�i", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-T� Giao Ng�c B�i", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-V�n H� L�nh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-X�ch T��c Ho�n", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-B�ch Quy Li�n", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_YAOYANG_JIEZI_2 = {
	{"Di�u D��ng-� L�n B�o Gi�i", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-T� Giao Ng�c B�i", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-V�n H� L�nh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-X�ch T��c Ho�n", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di�u D��ng-B�ch Quy Li�n", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_4_LEVEL_YUNLING = {
	{"H-Li�t Nham-Lv4", {0, 148, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ph� Kh�ng-Lv4", {0, 148, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�y Ki�m-Lv4", {0, 148, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�t Phong-Lv4", {0, 148, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�n V�-Lv4", {0, 148, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-�ng T�p-Lv4", {0, 148, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh T�m-Lv4", {0, 148, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Th�n L�c-Lv4", {0, 148, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ng�ng Th�n-Lv4", {0, 148, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� Gian-Lv4", {0, 148, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� C�c-Lv4", {0, 148, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Cu�ng Nh�n-Lv4", {0, 148, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-L�ng Nhu�-Lv4", {0, 148, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh Vi�n-Lv4", {0, 148, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i V�n-Lv4", {0, 148, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i T�m-Lv4", {0, 148, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Li�t Nham-Lv4", {0, 149, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ph� Kh�ng-Lv4", {0, 149, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�y Ki�m-Lv4", {0, 149, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�t Phong-Lv4", {0, 149, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�n V�-Lv4", {0, 149, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Qu�n Th�ch-Lv4", {0, 149, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-N� Ng�m-Lv4", {0, 149, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Xuy�n V�n-Lv4", {0, 149, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Th�n L�c-Lv4", {0, 149, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ng�ng Th�n-Lv4", {0, 149, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� Gian-Lv4", {0, 149, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� C�c-Lv4", {0, 149, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Cu�ng Nh�n-Lv4", {0, 149, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-L�ng Nhu�-Lv4", {0, 149, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Linh Vi�n-Lv4", {0, 149, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i V�n-Lv4", {0, 149, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i T�m-Lv4", {0, 149, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Li�t Nham-Lv4", {0, 150, 53, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph� Kh�ng-Lv4", {0, 150, 54, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�y Ki�m-Lv4", {0, 150, 55, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�t Phong-Lv4", {0, 150, 56, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�n V�-Lv4", {0, 150, 57, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� L��ng-Lv4", {0, 150, 58, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-M�c Minh-Lv4", {0, 150, 59, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Th�n L�c-Lv4", {0, 150, 60, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng�ng Th�n-Lv4", {0, 150, 61, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� Gian-Lv4", {0, 150, 62, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� C�c-Lv4", {0, 150, 63, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cu�ng Nh�n-Lv4", {0, 150, 64, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L�ng Nhu�-Lv4", {0, 150, 65, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Vi�n-Lv4", {0, 150, 66, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i V�n-Lv4", {0, 150, 67, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i T�m-Lv4", {0, 150, 68, 1, 4, -1, -1, -1, -1, -1, -1}},
}

CK_5_LEVEL_YUNLING = {
	{"H-Li�t Nham-Lv5", {0, 148, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ph� Kh�ng-Lv5", {0, 148, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�y Ki�m-Lv5", {0, 148, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�t Phong-Lv5", {0, 148, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-T�n V�-Lv5", {0, 148, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-�ng T�p-Lv5", {0, 148, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh T�m-Lv5", {0, 148, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Th�n L�c-Lv5", {0, 148, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Ng�ng Th�n-Lv5", {0, 148, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� Gian-Lv5", {0, 148, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-V� C�c-Lv5", {0, 148, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Cu�ng Nh�n-Lv5", {0, 148, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-L�ng Nhu�-Lv5", {0, 148, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-Linh Vi�n-Lv5", {0, 148, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i V�n-Lv5", {0, 148, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"H-H�i T�m-Lv5", {0, 148, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Li�t Nham-Lv5", {0, 149, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ph� Kh�ng-Lv5", {0, 149, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�y Ki�m-Lv5", {0, 149, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�t Phong-Lv5", {0, 149, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-T�n V�-Lv5", {0, 149, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Qu�n Th�ch-Lv5", {0, 149, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-N� Ng�m-Lv5", {0, 149, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Xuy�n V�n-Lv5", {0, 149, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Th�n L�c-Lv5", {0, 149, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Ng�ng Th�n-Lv5", {0, 149, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� Gian-Lv5", {0, 149, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-V� C�c-Lv5", {0, 149, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Cu�ng Nh�n-Lv5", {0, 149, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-L�ng Nhu�-Lv5", {0, 149, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-Linh Vi�n-Lv5", {0, 149, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i V�n-Lv5", {0, 149, 85, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"C-H�i T�m-Lv5", {0, 149, 86, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Li�t Nham-Lv5", {0, 150, 69, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ph� Kh�ng-Lv5", {0, 150, 70, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�y Ki�m-Lv5", {0, 150, 71, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�t Phong-Lv5", {0, 150, 72, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-T�n V�-Lv5", {0, 150, 73, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� L��ng-Lv5", {0, 150, 74, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-M�c Minh-Lv5", {0, 150, 75, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Th�n L�c-Lv5", {0, 150, 76, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Ng�ng Th�n-Lv5", {0, 150, 77, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� Gian-Lv5", {0, 150, 78, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-V� C�c-Lv5", {0, 150, 79, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Cu�ng Nh�n-Lv5", {0, 150, 80, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-L�ng Nhu�-Lv5", {0, 150, 81, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-Linh Vi�n-Lv5", {0, 150, 82, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i V�n-Lv5", {0, 150, 83, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"T-H�i T�m-Lv5", {0, 150, 84, 1, 4, -1, -1, -1, -1, -1, -1}},
}

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

ck_tb_translife_tittle = 
{
	[1] = 	{
				[2] = {"H�n Nguy�n T�ng", 24, 1},	
				[4] = {"��u T�ng", 24, 2},	
				[3] = {"Thi�n Tu T�ng", 24, 3},	
				[6] = {"H� V�", 24, 4},	
				[8] = {"V� Y S�", 24, 5},	
				[9] = {"Ph�n �m S�", 24, 6},	
				[11] = {"Tr� Gian �� T�", 24, 7},	
				[12] = {"Tr�ng �c �� T�", 24, 8},	
				[14] = {"Nh�p Quan ��o nh�n", 24, 9},	
				[15] = {"S�n D��ng ��o nh�n", 24, 10},	
				[17] = {"Hi�u �y", 24, 11},	
				[18] = {"�� �y", 24, 12},	
				[20] = {"Th�i M�nh T�n Nh�n", 24, 13},	
				[21] = {"Th�c T�m T�n Nh�n", 24, 14},
				[23] = {"Nh�p Quan ��o nh�n", 24, 9},	
				[29] = {"V� Y S�", 24, 5},	
				[30] = {"Ph�n �m S�", 24, 6},					
			},
			
	[2] = 	{
				[2] = {"��t Ma Kim Cang", 25, 1},	
				[4] = {"La H�n H� Ph�p", 25, 2},	
				[3] = {"Truy�n kinh ph�p s�", 25, 3},	
				[6] = {"B� ��c th�ch kh�ch", 25, 4},	
				[8] = {"T� Tr�c s�", 25, 5},	
				[9] = {"H�i Nguy�t s�", 25, 6},	
				[11] = {"T� H�i hi�p", 25, 7},	
				[12] = {"�� t� t�m t�i", 25, 8},	
				[14] = {"V� ng� ��o nh�n", 25, 9},	
				[15] = {"Nh�n V�n Hi�p ��o", 25, 10},	
				[17] = {"Ph�n v� t��ng qu�n", 25, 11},	
				[18] = {"Ph�n uy t��ng qu�n", 25, 12},	
				[20] = {"H�c V� Th��ng", 25, 13},	
				[21] = {"B�ch V� Th��ng", 25, 14},
				[23] = {"V� ng� ��o nh�n", 25, 9},		
				[29] = {"T� Tr�c s�", 25, 5},	
				[30] = {"H�i Nguy�t s�", 25, 6},							
			},
			
	[3] =	{		
				[2] = {"B�t B� Thi�n Long", 26, 1},	
				[4] = {"B�t B�o La H�n", 26, 2},	
				[3] = {"V� L��ng Ph�p T�n", 26, 3},	
				[6] = {"Thi�n C� S� Gi�", 26, 4},	
				[8] = {"B�ch Li�n Ti�n T�", 26, 5},	
				[9] = {"Ng�c V�n Ti�n T�", 26, 6},	
				[11] = {"Long ��u Th�n C�i", 26, 7},	
				[12] = {"Kh�t Thi�n Th�n C�i", 26, 8},	
				[14] = {"Ch��ng Kinh ��o nh�n", 26, 9},	
				[15] = {"Th�i �t T�n Nh�n", 26, 10},	
				[17] = {"Long T��ng t��ng qu�n", 26, 11},	
				[18] = {"H� D�c t��ng qu�n", 26, 12},	
				[20] = {"U Minh Qu� S�t", 26, 13},	
				[21] = {"V� ��ng La S�t", 26, 14},	
				[23] = {"Ch��ng Kinh ��o nh�n", 26, 9},	
				[29] = {"B�ch Li�n Ti�n T�", 26, 5},	
				[30] = {"Ng�c V�n Ti�n T�", 26, 6},									
			},
			
	[4] =	{
				[2] = {"Tr��ng l�o ��t Ma ���ng", 27, 1},	
				[4] = {"Tr��ng l�o La H�n ���ng", 27, 2},	
				[3] = {"Tr��ng l�o T�ng Kinh C�c", 27, 3},	
				[6] = {"Thi�n Th� S� Gi�", 27, 4},	
				[8] = {"Kim Quang Ti�n T�", 27, 5},	
				[9] = {"Thi�n �m Ti�n T�", 27, 6},	
				[11] = {"Ch�p Ph�p Th�n C�i", 27, 7},	
				[12] = {"Ch��ng B�ng Th�n C�i", 27, 8},	
				[14] = {"Th��ng Thanh ��o Nh�n", 27, 9},	
				[15] = {"T� H� T�n Nh�n", 27, 10},	
				[17] = {"Tr�n Qu�n T��ng Qu�n", 27, 11},	
				[18] = {"Chinh L� T��ng Qu�n", 27, 12},	
				[20] = {"Di�m La Qu� S�t", 27, 13},	
				[21] = {"C� ��c La S�t", 27, 14},	
				[23] = {"Th��ng Thanh ��o Nh�n", 27, 9},	
				[29] = {"Kim Quang Ti�n T�", 27, 5},	
				[30] = {"Thi�n �m Ti�n T�", 27, 6},									
			},
			
	[5] = {
				[2] = {"Th� t�a ��t Ma ���ng", 28, 1},	
				[4] = {"Th� t�a La H�n ���ng", 28, 2},	
				[3] = {"Th� t�a T�ng Kinh C�c", 28, 3},	
				[6] = {"Thi�n Th� Th�n V�", 28, 4},	
				[8] = {"Kim Quang th�nh n�", 28, 5},	
				[9] = {"Thi�n �m th�nh n�", 28, 6},	
				[11] = {"Ch�p Ph�p tr��ng l�o", 28, 7},	
				[12] = {"Ch��ng B�ng tr��ng l�o", 28, 8},	
				[14] = {"Th��ng Thanh ch�n nh�n", 28, 9},	
				[15] = {"T� Ti�u th��ng nh�n", 28, 10},	
				[17] = {"Tr�n Qu�n nguy�n so�i", 28, 11},	
				[18] = {"Chinh L� nguy�n so�i", 28, 12},	
				[20] = {"Di�m La t�n gi�", 28, 13},	
				[21] = {"C� ��c t�n gi�", 28, 14},	
				[23] = {"Th��ng Thanh ch�n nh�n", 28, 9},		
				[29] = {"Kim Quang th�nh n�", 28, 5},	
				[30] = {"Thi�n �m th�nh n�", 28, 6},								
			},
}