--�����Ǹ�����ݶ���

VET_ACITIVUTY_ADDITIONAL_TABLE = {
	[93] = {
		--���ID������һ��
		nActivityID = 93,
		nActivityName = "Qu�c T� Thi�u Nhi",
		--ʹ�õ����������
		tTaskGroup = {3, 9},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ta m�n t�ng Qu� 1/6 cho c�c em nh� (ti�u hao 66 Qu� 1/6 + 66 V�ng)",
			"Ta mu�n t�ng K�o B�ng cho c�c em nh� (ti�u hao 66 K�o B�ng + 66 V�ng)",
			"Ta mu�n t�ng ph�n th��ng cao qu� cho c�c em nh� (ti�u hao 160 Qu� 1/6 + 160 K�o B�ng + 160 V�ng)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30547, 66 ,"Qu� 1/6"}, {66}},
			{{2, 1, 30548, 66 ,"K�o B�ng"}, {66}},
			{{2, 1, 30547, 160 ,"Qu� 1/6"}, {2, 1, 30548, 160 ,"K�o B�ng"}, {160}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {3, 3, 3},
		--ÿһ�����־
		tMsg2Player = {
			"T�ng Qu� 1/6 %d/%d",
			"T�ng K�o B�ng %d/%d",
			"T�ng ph�n th��ng cao qu� %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
			46000000,
			46000000,
			222222222,
		},
		tZhenQiAward = {
			46, 46, 222,
		},
		tXuAward = {
			0, 0, 22,
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{1, 2000, "Nh�n S�m V�n N�m", {2, 1, 30071, 6}, 0},
							{1, 1212, "C� Linh Ng�c", {2, 1, 30369, 6}, 0},
							{1, 1212, "C� Linh Th�ch", {2, 1, 30368, 6}, 0},
							{1, 1212, "M�nh Thi�n Cang", {2, 1, 30390, 6}, 0},
							{1, 1212, "M�nh Thi�n M�n", {2, 1, 30410, 6}, 0},
							{3, 3060, 1660000, 1},
							{3, 92, 16160000, 1},
						},
			[2] = {
							{1, 2000, "Nh�n S�m V�n N�m", {2, 1, 30071, 6}, 0},
							{1, 1212, "C� Linh Ng�c", {2, 1, 30369, 6}, 0},
							{1, 1212, "C� Linh Th�ch", {2, 1, 30368, 6}, 0},
							{1, 1212, "M�nh Thi�n Cang", {2, 1, 30390, 6}, 0},
							{1, 1212, "M�nh Thi�n M�n", {2, 1, 30410, 6}, 0},
							{3, 3060, 1660000, 1},
							{3, 92, 16160000, 1},
						},
			[3] = {
							{31, 39995, "give_30_fruits()", 0},
							{1, 20000, "Nh�n S�m V�n N�m", {2, 1, 30071, 10}, 0},
							{1, 10000, "C� Linh Ng�c", {2, 1, 30369, 10}, 0},
							{1, 10000, "C� Linh Th�ch", {2, 1, 30368, 10}, 0},
							{1, 10000, "M�nh Thi�n Cang", {2, 1, 30390, 10}, 0},
							{1, 10000, "M�nh Thi�n M�n", {2, 1, 30410, 10}, 0},
							{3, 5, 66660000, 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 3 + 2,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 9, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n ph�n th��ng VIP (ho�n th�nh %d tr� l�n ��i t�t c�)", 9),  --�Ի�����
			uFunc = "Ud_GiveVipAward_201306",  --�Զ���ִ�к���
			nMaxCount = 1, --�����ȡ����
			nFreeRoom = 22, --��Ҫ�ı����ռ����
		},
	},
	[95] = {
		--���ID������һ��
		nActivityID = 95,
		nActivityName = "Qu�c T� Thi�u Nhi",
		--ʹ�õ����������
		tTaskGroup = {5, 6},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ta mu�n ��i 'Sinh T� Th�p C�m' nh�n th��ng ( ti�u hao 6 Sinh T� Th�p C�m + 6 V�ng)",
			"Ta mu�n ��i 'Tr�i C�y D�m' nh�n th��ng ( ti�u hao 6 Tr�i C�y D�m + 6 V�ng)",
			"Ta mu�n ��i ph�n th��ng cao qu� �� nh�n th��ng (ti�u hao 16  'Sinh T� Th�p C�m' + 16 'Tr�i C�y D�m' + 16 V�ng)  ",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30552, 6 ,"Sinh T� Th�p C�m"}, {6}},
			{{2, 1, 30553, 6 ,"Tr�i C�y D�m"}, {6}},
			{{2, 1, 30552, 16 ,"Sinh T� Th�p C�m"}, {2, 1, 30553, 16 ,"Tr�i C�y D�m"}, {16}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {3, 3, 3},
		--ÿһ�����־
		tMsg2Player = {
			"��i Sinh T� Th�p C�m %d%d",
			"��i Tr�i C�y D�m %d%d",
			"��i ph�n th��ng cao qu� %d%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
			4000000,
			4000000,
			12000000,
		},
		tZhenQiAward = {
			40, 40, 120,
		},
		tXuAward = {
			0, 0, 0,
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{1, 2000, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 1212, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 0},
							{1, 1212, "��i Nh�n s�m", {2, 0, 553, 1}, 0},
							{1, 1212, "Th�n N�ng ��n", {2, 1, 343, 1}, 0},
							{1, 1212, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 0},
							{3, 3060, 160000, 1},
							{3, 92, 1600000, 1},
						},
			[2] = {
							{1, 2000, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 1212, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 0},
							{1, 1212, "��i Nh�n s�m", {2, 0, 553, 1}, 0},
							{1, 1212, "Th�n N�ng ��n", {2, 1, 343, 1}, 0},
							{1, 1212, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 0},
							{3, 3060, 160000, 1},
							{3, 92, 1600000, 1},
						},
			[3] = {
							{31, 39995, format("ahf_GetNFruits(%d)", 3), 0},
							{1, 20000, "Nh�n S�m V�n N�m", {2, 1, 30071, 10}, 0},
							{1, 10000, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 0},
							{1, 10000, "��i Nh�n s�m", {2, 0, 553, 2}, 0},
							{1, 10000, "Th�n N�ng ��n", {2, 1, 343, 2}, 0},
							{1, 10000, "Ti�u Ki�p t�n", {2, 0, 141, 2}, 0},
							{3, 5, 6660000, 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 9, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n ph�n th��ng VIP (ho�n th�nh %d tr� l�n ��i t�t c�)", 9),  --�Ի�����
			uFunc = "Ud_GiveVipAward_201307",  --�Զ���ִ�к���
			nMaxCount = 1, --�����ȡ����
			nFreeRoom = 22, --��Ҫ�ı����ռ����
		},
	},
	[97] = {
		--���ID������һ��
		nActivityID = 97,
		nActivityName = "Ho�t ��ng ph� th�ng 8",
		--ʹ�õ����������
		tTaskGroup = {7, 6},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ta mu�n ��i B� D�ng C� H�c T�p �� nh�n ph�n th��ng (ti�u hao 5 B� D�ng C� H�c T�p + 9 v�ng)",
			"Ta mu�n ��i C�p S�ch �� nh�n ph�n th��ng (ti�u hao 5 C�p S�ch + 9 v�ng)",
			"Ta mu�n ��i ph�n th��ng cao qu� �� nh�n ph�n th��ng (ti�u hao 9 D�ng C� H�c T�p + 9 C�p S�ch + 9 v�ng)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30565, 5 ,"B� D�ng C� H�c T�p"}, {9}},
			{{2, 1, 30566, 5 ,"C�p S�ch"}, {9}},
			{{2, 1, 30565, 9 ,"B� D�ng C� H�c T�p"}, {2, 1, 30566, 9 ,"C�p S�ch"}, {9}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--ÿһ�����־
		tMsg2Player = {
			"��i B� D�ng C� H�c T�p %d/%d",
			"��i C�p S�ch %d/%d",
			"��i ph�n th��ng cao qu� %d%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
			5000000,
			5000000,
			10000000,
		},
		tZhenQiAward = {
			50, 50, 100,
		},
		tXuAward = {
			0, 0, 2,
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 20, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 20, "AwardGenuineQi(100)", 1},
							{2, 27, 500000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n ph�n th��ng VIP (ho�n th�nh %d tr� l�n ��i t�t c�)", 18),  --�Ի�����
			uFunc = "Ud_GiveVipAward_201308",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 3, --��Ҫ�ı����ռ����
		},
	},
	[99] = {
		--���ID������һ��
		nActivityID = 99,
		nActivityName = "Ho�t ��ng ph� th�ng 8",
		--ʹ�õ����������
		tTaskGroup = {9, 6},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ta mu�n t�ng [B�nh Trung Thu Cam] �� nh�n ph�n th��ng ( ti�u hao 09 [B�nh Trung Thu Cam] + 09 v�ng)",
			"Ta mu�n t�ng [B�nh Trung Thu D�u] �� nh�n ph�n th��ng ( ti�u hao 09 [B�nh Trung Thu D�u] + 09 v�ng) ",
			"Ta mu�n t�ng [B�nh Trung Thu Socola] �� nh�n ph�n th��ng ( ti�u hao 06 [B�nh Trung Thu Socola] + 09 v�ng) ",
			"Ta mu�n t�ng ph�n th��ng cao qu� �� nh�n ph�n th��ng ( ti�u hao 09 [B�nh Trung Thu Cam] + 09 [B�nh Trung Thu D�u] + 06 [B�nh Trung Thu Socola] + 29 v�ng)"
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30569, 9 ,"B�nh Trung Cam"}, {9}},
			{{2, 1, 30570, 9 ,"B�nh Trung Thu � Mai"}, {9}},
			{{2, 1, 30571, 6 ,"B�nh Trung Thu Socola"}, {9}},
			{{2, 1, 30569, 9 ,"B�nh Trung Cam"}, {2, 1, 30570, 9 ,"B�nh Trung Thu � Mai"}, {2, 1, 30571, 6 ,"B�nh Trung Thu Socola"}, {29}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6, 6},
		--ÿһ�����־
		tMsg2Player = {
			"T�ng [B�nh Trung Thu Cam] %d/%d",
			"T�ng [B�nh Trung Thu D�u] %d/%d",
			"T�ng [B�nh Trung Thu Socola] %d/%d",
			"T�ng ph�n th��ng cao qu� %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
			6900000,
			6900000,
			6900000,
			19000000,
		},
		tZhenQiAward = {
			50, 50, 50, 100,
		},
		tXuAward = {
			0, 0, 0, 2,
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[4] = {
							{1, 20, "Nh�n S�m V�n N�m", {2, 1, 30071, 3}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 20, "AwardGenuineQi(100)", 1},
							{2, 27, 500000, 1},
							{32, 1, 100, 1},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 4 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 24, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n ph�n th��ng VIP (ho�n th�nh %d tr� l�n ��i t�t c�)", 24),  --�Ի�����
			uFunc = "Ud_GiveVipAward_201309",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 5, --��Ҫ�ı����ռ����
		},
	},
	[102] = {
		--���ID������һ��
		nActivityID = 102,
		nActivityName = "Evnet ph� th�ng 10",
		--ʹ�õ����������
		tTaskGroup = {3, 10},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ta mu�n t�ng [Tranh G�i] �� nh�n ph�n th��ng ( ti�u hao 09 [ Tranh G�i ] +09 v�ng)",
			"Ta mu�n t�ng [Tranh ��ng H�] �� nh�n ph�n th��ng ( ti�u hao 09 [ Tranh ��ng H� ] +09 v�ng)",
			"Ta mu�n t�ng [Tranh Th� Ph�p] �� nh�n ph�n th��ng ( ti�u hao 09 [ Tranh Th� Ph�p] +09 v�ng)",
			"Ta mu�n t�ng ph�n th��ng cao qu� ( ti�u hao 19 [ Tranh G�i] + 19 [Tranh ��ng H� ] +19 [ Tranh Th� Ph�p] +39 v�ng)"
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30580, 9 ,"Tranh G�i"}, {9}},
			{{2, 1, 30581, 9 ,"Tranh ��ng H�"}, {9}},
			{{2, 1, 30582, 9 ,"Tranh Th� Ph�p"}, {9}},
			{{2, 1, 30580, 19 ,"Tranh G�i"}, {2, 1, 30581, 19 ,"Tranh ��ng H�"}, {2, 1, 30582, 19 ,"Tranh Th� Ph�p"}, {39}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6, 6},
		--ÿһ�����־
		tMsg2Player = {
			"T�ng [Tranh G�i] %d/%d",
			"T�ng [Tranh ��ng H�] %d/%d",
			"T�ng [Tranh Th� Ph�p] %d/%d",
			"T�ng ph�n th��ng cao qu� %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
			6900000,
			6900000,
			6900000,
			39000000,
		},
		tZhenQiAward = {
			50, 50, 50, 100,
		},
		tXuAward = {
			0, 0, 0, 2,
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 10, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[4] = {
							{1, 20, "Nh�n S�m V�n N�m", {2, 1, 30071, 3}, 0},
							{1, 5, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 3}, 7 * 24 * 3600},
							{1, 5, "��i Nh�n s�m", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "Th�n N�ng ��n", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Ti�u Ki�p t�n", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(3)", ""},
							{31, 3, "ahf_GetPetBook(4)", ""},
							{31, 20, "AwardGenuineQi(150)", 1},
							{2, 20, 1000000, 1},
							{32, 2, 150, 1},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 4 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 24, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n ph�n th��ng VIP (ho�n th�nh %d tr� l�n ��i t�t c�)", 24),  --�Ի�����
			uFunc = "Ud_GiveVipAward_201310",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 7, --��Ҫ�ı����ռ����
		},
		tPointAward = {
			szTitle = "T�ch l�y nh�n th��ng phong ph�",
			uFunc = {
				"Ta mu�n xem �i�m t�ch l�y c�a b�n th�n/#Ud_Check_Point(%d)",
				"Ta mu�n s� d�ng �i�m t�ch l�y �� ��i th��ng/#Ud_Use_Exchange_Point(%d)",
			},
		},
	},
	[104] = {
		--���ID������һ��
		nActivityID = 104,
		nActivityName = "Event ph� th�ng 11",
		--ʹ�õ����������
		tTaskGroup = {5, 7},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ta mu�n t�ng Qu� 20/11 �� nh�n th��ng (ti�u hao 09 Qu� 20/11 + 09 V�ng)",
			"Ta mu�n t�ng Hoa �i�m 10 �� nh�n th��ng (ti�u hao 09 Hoa �i�m 10 + 09 V�ng)",
			"Ta mu�n t�ng B�ng Khen �� nh�n th��ng (ti�u hao 09 B�ng Khen + 09 V�ng )",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30606, 9, "Qu� 20/11"}, {9}},
			{{2, 1, 30607, 9, "Hoa �i�m 10"}, {9}},
			{{2, 1, 30608, 9, "B�ng Khen"}, {9}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {4, 4, 4},
		--ÿһ�����־
		tMsg2Player = {
			"T�ng ?Q�a 20/11? %d%d",
			"T�ng ?Hoa �i�m 10? %d%d",
			"T�ng ?B�ng Khen? %d%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
			7800000,
			7800000,
			7800000,
		},
		tZhenQiAward = {
			50, 50, 50,
		},
		tXuAward = {
			0, 0, 0,
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "C� Linh Ng�c", {2, 1, 30369, 2}, 0},
							{1, 6, "C� Linh Th�ch", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
			[2] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "C� Linh Ng�c", {2, 1, 30369, 2}, 0},
							{1, 6, "C� Linh Th�ch", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
			[3] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "C� Linh Ng�c", {2, 1, 30369, 2}, 0},
							{1, 6, "C� Linh Th�ch", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 12, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n ph�n th��ng VIP (ho�n th�nh %d tr� l�n ��i t�t c�)", 12),  --�Ի�����
			uFunc = "Ud_GiveVipAward_201311",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 7, --��Ҫ�ı����ռ����
		},
	},
	[106] = {
		--���ID������һ��
		nActivityID = 106,
		nActivityName = "Event ph� th�ng12",
		--ʹ�õ����������
		tTaskGroup = {7, 7},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Nh�n 1 b� ngo�i trang Noel ( Ti�u hao 3 H�p Qu� Noel)",
			"Nh�n 1 Tu�n L�c ( Ti�u hao 3 H�p Qu� Noel)",
			"Nh�n 1 Xe Tu�n L�c (��) ( Ti�u hao 4 H�p Qu� Noel)",
			"Nh�n 1 Xe Tu�n L�c (xanh) ( Ti�u hao 4 H�p Qu� Noel)",
			"Nh�n 1 Xe Tu�n L�c (v�ng) (Ti�u hao 4 H�p Qu� Noel)",
			"Nh�n 24122013 Kinh Nghi�m, 24 �i�m S� M�n, 24 �i�m Danh V�ng, 24 �i�m Ch�n Kh�, 24 �i�m Qu�n C�ng, 24 D�u (Ti�u hao 24 H�p Qu� Noel + 24 Ti�u Dao Ng�c)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30611, 3, "H�p qu� gi�ng sinh"}, {0}},
			{{2, 1, 30611, 3, "H�p qu� gi�ng sinh"}, {0}},
			{{2, 1, 30611, 4, "H�p qu� gi�ng sinh"}, {0}},
			{{2, 1, 30611, 4, "H�p qu� gi�ng sinh"}, {0}},
			{{2, 1, 30611, 4, "H�p qu� gi�ng sinh"}, {0}},
			{{2, 1, 30611, 24, "H�p qu� gi�ng sinh"}, {2, 1, 30603, 24, "Ti�u Dao Ng�c"}, {0}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {1, 1, 1, 1, 1, 1},
		--���󱳰��ռ�
		tFreeRoom = {3, 1, 1, 1, 1, 1},
		tFreeWeight = {100, 100, 100, 100, 100, 100},
		--ÿһ�����־
		tMsg2Player = {
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1, 1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_106_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_106_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_106_3()", 1},
						},
			[4] = {
							{31, 100, "Ud_GiveAward_106_4()", 1},
						},
			[5] = {
							{31, 100, "Ud_GiveAward_106_5()", 1},
						},
			[6] = {
							{31, 100, "Ud_GiveAward_106_6()", 1},
						},
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 0,
		tUdAward = {
		},
	},
	[108] = {
		--���ID������һ��
		nActivityID = 108,
		nActivityName = "Event ph� 1 th�ng 1 n�m 2014",
		--ʹ�õ����������
		tTaskGroup = {9, 7},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Nh�n 1 b� ngo�i trang Xu�n ( ti�u hao 3 B�nh Ch�ng + 3 B�nh T�t) ",
			"Nh�n 1 Ni�n Th� ( ti�u hao 3 B�nh Ch�ng + 3 B�nh T�t + 3 Ti�u Dao Ng�c)",
			"Nh�n 20142014Exp, 24 �i�m s� m�n, 24 �i�m danh v�ng, 24 �i�m ch�n kh�, 24 �i�m qu�n c�ng, 24 Xo�i, 4 T� Ngh�a L�nh, 4 Th�ng Thi�n L�nh B�i ( ti�u hao 19 B�nh Ch�ng + 19 B�nh T�t + 19 Ti�u Dao Ng�c) ",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30621, 3, "B�nh Ch�ng"}, {2, 1, 30622, 3, "B�nh T�t"}},
			{{2, 1, 30621, 3, "B�nh Ch�ng"}, {2, 1, 30622, 3, "B�nh T�t"}, {2, 1, 30603, 3, "Ti�u Dao Ng�c"}},
			{{2, 1, 30621, 19, "B�nh Ch�ng"}, {2, 1, 30622, 19, "B�nh T�t"}, {2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {1, 1, 1},
		--���󱳰��ռ�
		tFreeRoom = {1, 1, 3},
		tFreeWeight = {100, 100, 100},
		--ÿһ�����־
		tMsg2Player = {
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_108_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_108_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_108_3()", 1}
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 0,
		tUdAward = {
		},
	},
	[113] = {
		--���ID������һ��
		nActivityID = 113,
		nActivityName = "Ho�t ��ng ph� 1 th�ng 2 n�m 2014",
		--ʹ�õ����������
		tTaskGroup = {5, 8},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ph�n th��ng pha c� ph� (ti�u hao 500 b�t ca cao nguy�n ch�t + 500 s�a t��i v� tr�ng + 50 v�ng) ",
			"Ph�n th��ng t�ng b�nh (ti�u hao 25 Chocolare Chips Muffin + 250 v�ng)",
			"Ph�n th��ng t�ng b�nh (ti�u hao 25 Dark Chocolate + 66 XU)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30628, 500, "Ca cao nguy�n ch�t"}, {2, 1, 30629, 500, "S�a t��i v� tr�ng"},{50}},
			{{2, 1, 30630, 25, "Chocolare Chips Muffin"}, {250}},
			{{2, 1, 30631, 25, "Dark Chocolate"}, {2, 1, 30230, 66, "XU"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {5, 5, 5},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {10, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"Ph�n th��ng pha c� ph� %d/%d",
			"Ph�n th��ng t�ng b�nh %d/%d",
			"Ph�n th��ng t�ng b�nh %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_113_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_113_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_113_3()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 15, --Ҫ��һ������ٴ�
			szTitle = format("Nh�n th��ng c� ph�-b�nh(sau khi nh�n th��ng %d s� l�n pha c� ph� v� t�ng b�nh m�i lo�i)", 5),  --�Ի�����
			uFunc = "Ud_GiveLastAward_201402",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 4, --��Ҫ�ı����ռ����
		},
	},
	[116] = {
		--���ID������һ��
		nActivityID = 116,
		nActivityName = "event ph� th�ng 3 n�m 2014",
		--ʹ�õ����������
		tTaskGroup = {8, 8},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"g�i hoa nh�n th��ng (ti�u hao 350 gi�y b�ng ki�ng +350 b�a c�ng +66 v�ng )",
			"t�ng qu� nh�n th��ng ( ti�u hao 25 ph�n qu� 8/3+268 v�ng)",
			"t�ng qu� nh�n th��ng(ti�u hao 25 b�ng hoa 8/3+68 ng�c ti�u dao)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30632, 350, "gi�y b�ng ki�ng "}, {2, 1, 30633, 350, "b�a c�ng"},{66}},
			{{2, 1, 30634, 25, "qu� 8/3"}, {268}},
			{{2, 1, 30635, 25, "hoa 8/3"}, {2, 1, 30603, 68, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"g�i qu� nh�n th��ng %d/%d",
			"t�ng qu� nh�n th��ng (qu� 8/3) %d/%d",
			"t�ng qu� nh�n th��ng (hoa 8/3) %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_116_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_116_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_116_3()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = format("nh�n th��ng t�i n�ng ( sau khi nh�n ���c ph�n th��ng g�i hoa v� t�ng qu� m�i lo�i%d l�n)", 6),  --�Ի�����
			uFunc = "Ud_GiveLastAward_201403",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 6, --��Ҫ�ı����ռ����
		},
	},
	[120] = {
		--���ID������һ��
		nActivityID = 120,
		nActivityName = "event ph� th�ng 4 n�m 2014 ",
		--ʹ�õ����������
		tTaskGroup = {2, 15},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"giao nguy�n li�u nh�n th��ng ( ti�u hao 500 gi�y ng� s�c + 500 h� keo + 50 v�ng )",
			"giao chi�n k� nh�n th��ng (ti�u hao 25 b�ch k� +250 v�ng )",
			"Giao chi�n k� nh�n th��ng ( ti�u hao 25 h�c k� + 66 ti�u dao ng�c)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30637, 500, "gi�y ng� s�c "}, {2, 1, 30638, 500, "h� keo "},{50}},
			{{2, 1, 30639, 25, " b�ch k� "}, {250}},
			{{2, 1, 30640, 25, " h�c k� "}, {2, 1, 30603, 66, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"giao nguy�n li�u nh�n th��ng  %d/%d",
			"giao chi�n k� nh�n th��ng ( b�ch k� ) %d/%d",
			"giao chi�n k� nh�n th��ng ( h�c k� ) %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_120_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_120_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_120_3()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = format("chi�n binh xu�t s�c (sau khi n�p nguy�n li�u v� chi�n k� m�i lo�i %d nh�n th��ng)", 6),  --�Ի�����
			uFunc = "Ud_GiveLastAward_201404",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 8, --��Ҫ�ı����ռ����
		},
	},
	[124] = {
		--���ID������һ��
		nActivityID = 124,
		nActivityName = "Ho�t ��ng ph� event th�ng 5 n�m 2014",
		--ʹ�õ����������
		tTaskGroup = {6, 9},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Giao t�i nguy�n nh�n th��ng ( ti�u hao 499 d�u t��i +499 b�c h� +49 v�ng)(6 l�n/ng�y )",
			"Giao 25 sero d�u t��i +249 v�ng nh�n ���c (6 l�n/ng�y )",
			"Giao 25 sero b�c h� + 49Ti�u Dao Ng�c (6 l�n/ng�y )",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30645, 499, "D�u t��i "}, {2, 1, 30646, 499, "B�c h� "},{49}},
			{{2, 1, 30647, 25, "Sero d�u t��i "}, {249}},
			{{2, 1, 30648, 25, "Sero b�c h� "}, {2, 1, 30603, 49, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"Giao t�i nguy�n %d/%d",
			"Giao sero d�u t��i %d/%d",
			"Giao  sero b�c h� %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_124_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_124_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_124_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Giao t�i nguy�n v� n��c sero m�i lo�i 6 l�n )(t�ng c�ng 18 l�n )",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201405",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 7, --��Ҫ�ı����ռ����
		},
	},
	[127] = {
		--���ID������һ��
		nActivityID = 127,
		nActivityName = "Ho�t ��ng ph� th�ng 06/2014",
		--ʹ�õ����������
		tTaskGroup = {9, 9},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"N�p nguy�n li�u (Ti�u hao 499 Tr�i C�y + 499 M�t Ong + 49 V�ng) (M�i ng�y 6 l�n)",
			"N�p 25 K�o D�o Tr�i C�y + 249 V�ng (M�i ng�y 6 l�n)",
			"N�p 25 K�o D�o Chip Chip + 49 Ti�u Dao Ng�c (M�i ng�y 6 l�n)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30660, 499, "M�t Ong"}, {2, 1, 30661, 499, "Tr�i c�y"},{49}},
			{{2, 1, 30662, 25, "K�o D�o Tr�i C�y"}, {249}},
			{{2, 1, 30663, 25, "K�o D�o Chip Chip"}, {2, 1, 30603, 49, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"N�p nguy�n li�u %d/%d",
			"N�p K�o D�o Tr�i C�y %d/%d",
			"N�p K�o D�o Chip Chip %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_127_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_127_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_127_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Sau khi ho�n th�nh n�p nguy�n li�u v� k�o d�o s� nh�n ���c ph�n th��ng VIP) (T�ng c�ng 18 l�n)",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201406",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 7, --��Ҫ�ı����ռ����
		},
	},
	[130] = {
		--���ID������һ��
		nActivityID = 130,
		nActivityName = "Ho�t ��ng ph� 07/2014",
		--ʹ�õ����������
		tTaskGroup = {3, 13},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ti�u hao 299 Gi�y G�i Qu� + 299 H�p Qu� + 69 V�ng (M�i ng�y 6 l�n) ",
			"N�p 06 Qu� M�ng Phi�n B�n M�i + 119 V�ng nh�n ���c (M�i ng�y 6 l�n)",
			"N�p 06 Hoa M�ng Phi�n B�n M�i + 19 Ti�u Dao Ng�c nh�n ���c (M�i ng�y 6 l�n)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30695, 299, "H�p Qu�"}, {2, 1, 30696, 299, "Gi�y G�i Qu�"},{69}},
			{{2, 1, 30697, 6, "Qu� M�ng Phi�n B�n M�i"}, {119}},
			{{2, 1, 30698, 6, "Hoa M�ng Phi�n B�n M�i"}, {2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"N�p nguy�n li�u %d/%d",
			"N�p Qu� M�ng Phi�n B�n M�i %d/%d",
			"N�p Hoa M�ng Phi�n B�n M�i %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_130_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_130_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_130_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Ho�n th�nh n�p nguy�n li�u v� qu� s� nh�n ���c ph�n th��ng VIP, 3 d�ng ch�n t�ng c�ng ph�i ho�n th�nh 18 l�n)",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201407",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 5, --��Ҫ�ı����ռ����
		},
	},
	[132] = {
		--���ID������һ��
		nActivityID = 132,
		nActivityName = "Ho�t ��ng ph� 08/2014",
		--ʹ�õ����������
		tTaskGroup = {6, 10},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ti�u hao 299 Hoa Sen + 299 H�t Sen + 69 V�ng (M�i ng�y 6 l�n) ",
			"Giao n�p 06 B�nh M�t + 119 V�ng (M�i ng�y 6 l�n)",
			"Giao n�p 06 B�nh L� Sen + 19 Ti�u Dao Ng�c (M�i ng�y 6 l�n)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30705, 299, "Hoa sen"}, {2, 1, 30706, 299, "H�t Sen"},{69}},
			{{2, 1, 30707, 6, "B�nh M�t"}, {119}},
			{{2, 1, 30708, 6, "B�nh L� Sen"}, {2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"N�p nguy�n li�u %d/%d",
			"Giao n�p B�nh M�t %d/%d",
			"Giao n�p B�nh L� Sen %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_132_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_132_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_132_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Ho�n th�nh n�p nguy�n li�u v� qu� s� nh�n ���c ph�n th��ng VIP, 3 d�ng ch�n t�ng c�ng ph�i ho�n th�nh 18 l�n)",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201408",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 5, --��Ҫ�ı����ռ����
		},
	},
	[134] = {
		--���ID������һ��
		nActivityID = 134,
		nActivityName = "Ho�t ��ng ph� 09/2014",
		--ʹ�õ����������
		tTaskGroup = {9, 10},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ti�u hao 299 Gi�y Ki�ng M�u + 299 D�ng C� L�m ��n + 69 v�ng (M�i ng�y 6 l�n)",
			"N�p 06 L�ng ��n Trung Thu �� + 119 v�ng nh�n ���c (M�i ng�y 6 l�n)",
			"N�p 06 L�ng ��n Trung Thu T�m + 19 Ti�u Dao Ng�c (M�i ng�y 6 l�n)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30717, 299, "Gi�y Ki�ng M�u"}, {2, 1, 30718, 299, "D�ng C� L�m ��n"},{69}},
			{{2, 1, 30719, 6, "L�ng ��n Trung Thu ��"}, {119}},
			{{2, 1, 30720, 6, "L�ng ��n Trung Thu T�m"}, {2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"N�p nguy�n li�u %d/%d",
			"N�p L�ng ��n Trung Thu �� %d/%d",
			"N�p L�ng ��n Trung Thu T�m %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_134_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_134_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_134_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Ho�n th�nh n�p nguy�n li�u v� qu� s� nh�n ���c ph�n th��ng VIP, 3 d�ng ch�n t�ng c�ng ph�i ho�n th�nh 18 l�n)",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201409",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 5, --��Ҫ�ı����ռ����
		},
	},
	[136] = {
		--���ID������һ��
		nActivityID = 136,
		nActivityName = "Ho�t ��ng ph� th�ng 10/2014",
		--ʹ�õ����������
		tTaskGroup = {5, 11},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ti�u hao 299 D�ng C� G�i Hoa + 299 Hoa H�ng + 69 V�ng (M�i ng�y 6 l�n)",
			"N�p 06 ��a H�ng �� + 119 V�ng (M�i ng�y 6 l�n)",
			"N�p 06 ��a H�ng V�ng + 19 Ti�u Dao Ng�c (M�i ng�y 6 l�n)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30735, 299, "D�ng C� G�i Hoa"}, {2, 1, 30736, 299, "Hoa h�ng"},{69}},
			{{2, 1, 30737, 6, "Hoa h�ng ��"}, {119}},
			{{2, 1, 30738, 6, "Hoa h�ng v�ng"}, {2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"N�p nguy�n li�u %d/%d",
			"N�p ��a H�ng �� %d/%d",
			"N�p ��a H�ng V�ng %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_136_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_136_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_136_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Ho�n th�nh c� 3 h�ng m�c t�ng c�ng l� 18 l�n)",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201410",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 5, --��Ҫ�ı����ռ����
		},
	},
	[139] = {
		--���ID������һ��
		nActivityID = 139,
		nActivityName = "Ho�t ��ng ph� th�ng 10/2014",
		--ʹ�õ����������
		tTaskGroup = {8, 11},
		--����table��С���Ӧ--------------------
		--������tCostһһ��Ӧ
		tSayDialog = {
			"Ti�u hao 299 N�p Tranh + 299 Nghi�n M�c + 69 V�ng (6 l�n/ng�y)",
			"N�p 06 Tranh Th� Ph�p + 119 V�ng (6 l�n/ng�y)",
			"N�p 06 Tranh Th� Ph�p ��c Bi�t + 19 Ti�u Dao Ng�c (6 l�n/ng�y)",
		},
		--���ĵ��ߺͽ������J
		tCostTable = {
			{{2, 1, 30741, 299, "N�p Tranh"}, {2, 1, 30742, 299, "Nghi�n M�c"},{69}},
			{{2, 1, 30743, 6, "Tranh Th� Ph�p"}, {119}},
			{{2, 1, 30744, 6, "Tranh Th� Ph�p ��c Bi�t"}, {2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
		},
		--ÿһ�����ʹ�ô���/ÿ��
		tMaxUseCount = {6, 6, 6},
		--���󱳰��ռ�
		tFreeRoom = {0, 3, 3},
		tFreeWeight = {0, 10, 10},
		--ÿһ�����־
		tMsg2Player = {
			"N�p nguy�n li�u %d/%d",
			"N�p Tranh Th� Ph�p %d/%d",
			"N�p Tranh Th� Ph�p ��c Bi�t %d/%d",
		},
		-----------------------------------------
		--��ͨ���齱��
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--���ս���δ��ͨ�ʹ�ͨ�����Ľ���ֵ(��д���ʾ����Դ����һ��)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--�������5,6
		tTaskCondition = {},
		--ÿ�ζ����һ�ε��߱�(1)����ֻ�����һ��������߱�(0)
		tConditionItemAward = {1, 1, 1},
		--���δ������Ʒ����
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_139_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_139_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_139_2()", 1},
						},		
		},
		--�����������Ʒ����
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--�Զ��影��
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --ʹ�õڼ����������(��һ���ǿ�����)
			nTimesLimit = 18, --Ҫ��һ������ٴ�
			szTitle = "Ph�n th��ng VIP (Ho�n th�nh c� 3 h�ng m�c t�ng c�ng l� 18 l�n)",  --�Ի�����
			uFunc = "Ud_GiveLastAward_201411",  --�Զ���ִ�к���
			nMaxCount = 1, --ÿ�������ȡ����
			nFreeRoom = 3, --��Ҫ�ı����ռ����
		},
	},
}