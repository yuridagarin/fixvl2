DebugOutput = nothing
--��ǰʹ�õ�����vip������
--\settings\vip_card.txt
--VC_CURRENT_ID = 1;
--VC_CURRENT_ID = 2;
--VC_CURRENT_ID = 3;
--VC_CURRENT_ID = 4;
VC_CURRENT_ID = 5;


--���׶Ƚ��������ݽ�������Ű�λ��ǣ�
TASKID_VC_VALUE_FLAG = 3239;

--ÿ�������������
--��¼�Զ���ɴ���
TASKID_VC_AUTO_FINISH_TIMES = 3241;
--��¼�ճ�����������������������Ű�λ��ǣ�31λ��ʾ�Ƿ���ȡ������
TASKID_VC_DAILY_TASK_FLAG = 3240;
--�ճ���ɴ�����¼
TASKID_VC_DAILY_TASK_1 = 3242;
TASKID_VC_DAILY_TASK_2 = 3243;
TASKID_VC_DAILY_TASK_3 = 3253;

--��¼�������������������ֽڼ�¼��(VIP_CARD_ID����)
VC_DAILY_TASK = {
	[1] = 
	{
		[1] = {
			Options = "Ph� b�n" ,
			Content = {
				{"L��ng S�n B�c �i 8", 2, "Ho�n th�nh �i 8 c�a L��ng S�n B�c, s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"��a Huy�n Cung �i 7", 2, "Ho�nh th�nh 7 �i ��a Huy�n Cung, ho�nh th�nh xong nh�n ���c 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"V�n Ki�m Tr�ng �i 4", 3, "Ho�n th�nh �i 4 c�a V�n Ki�m Tr�ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 25, "Thi�n Ki�u L�nh"},
			Award = "vc_AwardCopy()",
		},	
		[2] = {
			Options = "Tr�ng c�y" ,
			Content = {
				{"Tr�ng C�y B�t Nh� Nh�", 3, "Tr�ng 3 l�n C�y B�t Nh� Nh�, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"Tr�ng C�y B�t Nh�", 3, "Tr�ng 3 l�n C�y B�t Nh�, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"M� T�i H�t Gi�ng", 3, "M� T�i H�t Gi�ng 3 l�n, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 10, "Thi�n Ki�u L�nh"},
			Award = "vc_AwardPlant()",
		},	
		[3] = {
			Options = "Thi�n M�n tr�n" ,
			Content = {
				{"Chi�n th�ng trong thi�n m�n tr�n v� nh�n ph�n th��ng", 1, "Trong chi�n tr��ng Thi�n M�n Tr�n gi�nh chi�n th�ng 1 l�n v� nh�n th��ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"Tham gia Thi�n M�n Tr�n v� nh�n th��ng", 2, "Tham gia 2 tr�n Thi�n M�n Tr�n v� nh�n th��ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 15, "Thi�n Ki�u L�nh"},
			Award = "vc_AwardTmz()",
		},	
		[4] = {
			Options = "Chi�n tr��ng" ,
			Content = {
				{"Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", 1, "Tham gia 1 tr�n chi�n tr��ng Nh�n M�n Quan v� nh�n th��ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", 1, "Tham gia v� ho�n th�nh 1 L��ng Th�o Chi�n, Th�n L�ng Chi�n, Ph�o ��i Chi�n b�t k� v� nh�n th��ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 4,
			AutoFinish = {2, 97, 236, 15, "Thi�n Ki�u L�nh"},
			Award = "vc_AwardBattle()",
		},	
		[5] = {
			Options = "T�nh n�ng" ,
			Content = {
				{"Ti�n h�nh c��ng h�a trang b�", 1, "Ti�n h�nh 1 l�n c��ng h�a trang b�, b�t k� th�nh c�ng hay kh�ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
				{"Ti�n h�nh d��ng th�nh trang b�", 1, "Ti�n h�nh 1 l�n d��ng th�nh trang b�, b�t k� th�ng c�p hay kh�ng, ho�n th�nh s� nh�n ���c ph�n th��ng 20 �i�m c�ng hi�n v� �i�m kinh nghi�m"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_3,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_3,
			Byte = 2,
			AutoFinish = {2, 97, 236, 10, "Thi�n Ki�u L�nh"},
			Award = "vc_AwardEquip()",
		},	
	},
	[2] = 
	{
		[1] = {
			Options = "Ph� b�n" ,
			Content = {
				{"L��ng S�n B�c �i 8", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "L��ng S�n B�c �i 8", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"��a Huy�n Cung �i 7", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "��a Huy�n Cung �i 7", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V�n Ki�m Tr�ng �i 4", 3, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V�n Ki�m Tr�ng �i 4", "Hu�n ch��ng anh h�ng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi�n tr��ng" ,
			Content = {
				{"Chi�n th�ng trong Thi�n M�n Tr�n", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Chi�n th�ng trong Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia Thi�n M�n Tr�n", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T�ng th�m" ,
			Content = {
				{"T�ng c�p trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "T�ng c�p trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"D��ng th�nh trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "D��ng th�nh trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh� Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh� Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"M� T�i H�t Gi�ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "M� T�i H�t Gi�ng", "Hu�n ch��ng anh h�ng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_3()",
		},	
	},
	[3] = 
	{
		[1] = {
			Options = "Ph� b�n" ,
			Content = {
				{"L��ng S�n B�c �i 8", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "L��ng S�n B�c �i 8", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"��a Huy�n Cung �i 7", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "��a Huy�n Cung �i 7", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V�n Ki�m Tr�ng �i 4", 3, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V�n Ki�m Tr�ng �i 4", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", "Hu�n ch��ng anh h�ng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi�n tr��ng" ,
			Content = {
				{"Chi�n th�ng trong Thi�n M�n Tr�n", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Chi�n th�ng trong Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia Thi�n M�n Tr�n", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T�ng th�m" ,
			Content = {
				{"T�ng c�p trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "T�ng c�p trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"D��ng th�nh trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "D��ng th�nh trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh� Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh� Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"M� T�i H�t Gi�ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "M� T�i H�t Gi�ng", "Hu�n ch��ng anh h�ng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_3()",
		},	
	},
	[4] = 
	{
		[1] = {
			Options = "Ph� b�n" ,
			Content = {
				{"L��ng S�n B�c �i 8", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "L��ng S�n B�c �i 8", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"��a Huy�n Cung �i 7", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "��a Huy�n Cung �i 7", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V�n Ki�m Tr�ng �i 4", 3, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V�n Ki�m Tr�ng �i 4", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", "Hu�n ch��ng anh h�ng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi�n tr��ng" ,
			Content = {
				{"Chi�n th�ng trong Thi�n M�n Tr�n", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Chi�n th�ng trong Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia Thi�n M�n Tr�n", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T�ng th�m" ,
			Content = {
				{"T�ng c�p trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "T�ng c�p trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"D��ng th�nh trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "D��ng th�nh trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh� Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh� Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"M� T�i H�t Gi�ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "M� T�i H�t Gi�ng", "Hu�n ch��ng anh h�ng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_3()",
		},	
	},
	[5] = 
	{
		[1] = {
			Options = "Ph� b�n" ,
			Content = {
				{"L��ng S�n B�c �i 8", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "L��ng S�n B�c �i 8", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"��a Huy�n Cung �i 7", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "��a Huy�n Cung �i 7", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V�n Ki�m Tr�ng �i 4", 3, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V�n Ki�m Tr�ng �i 4", "Hu�n ch��ng anh h�ng", 60, 6000000)},
				{"V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "V��t qua Ph�n Thi�n L�m-Th�i Nh�t Th�p_Th��ng", "Hu�n ch��ng anh h�ng", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi�n tr��ng" ,
			Content = {
				{"Chi�n th�ng trong Thi�n M�n Tr�n", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Chi�n th�ng trong Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia Thi�n M�n Tr�n", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia Thi�n M�n Tr�n", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng l�n Nh�n M�n Quan v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia chi�n tr��ng nh� b�t k� v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
				{"�n O�n ��i_Gi�nh th�ng l�i v� nh�n th��ng", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tham gia �n O�n ��i gi�nh th�ng l�i v� nh�n th��ng", "Hu�n ch��ng anh h�ng", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T�ng th�m" ,
			Content = {
				{"T�ng c�p trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "T�ng c�p trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"D��ng th�nh trang b�", 1, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "D��ng th�nh trang b�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh� Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh� Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"Tr�ng C�y B�t Nh�", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "Tr�ng C�y B�t Nh�", "Hu�n ch��ng anh h�ng", 50, 6000000)},
				{"M� T�i H�t Gi�ng", 2, format("Ho�n th�nh %s, ho�n th�nh xong ���c th��ng %s, �� c�ng hi�n %d �i�m, EXP %d", "M� T�i H�t Gi�ng", "Hu�n ch��ng anh h�ng", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi�n Ki�u L�nh"},
			Award = "vc_Award_2_3()",
		},	
	},
}

VC_VALUE_AWARD = {
	[1] = {
		[1]  = {300, 1, {2, 1, 30498, 10, 4},  "Hu�n ch��ng d�ng s�"},
		[2]  = {500, 1, {2, 1, 30535, 10, 4}, "Thi�t Tinh c�p 3"},
		[3]  = {700, 1, {2, 1, 30499, 10, 4},  "Hu�n ch��ng anh h�ng"},
		[4]  = {1000,3, "vc_Rand_3_4_JS_foot()", "Gi�y 3-4 sao ng�u nhi�n"},
		[5]  = {1300,1, {2, 1, 30614, 1, 1},  "L�i H� Tinh Ph�ch"},
		[6]  = {1600,3, "vc_Rand_3_4_JS_cape()", "�o cho�ng 3-4 sao ng�u nhi�n"},
		[7]  = {1900,1, {2, 1, 30614, 2, 1}, "L�i H� Tinh Ph�ch"},
		[8]  = {2200,3, "vc_Rand_3_4_JS_badge()", "Huy ch��ng 3-4 sao ng�u nhi�n"},
		[9]  = {2500,1, {2, 1, 30614, 3, 1}, "L�i H� Tinh Ph�ch"},
		[10] = {3000,2, 10000000, "Kinh nghi�m"},
	},
	[2] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu�n ch��ng anh h�ng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi�t Tinh c�p 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu�n ch��ng anh h�ng"},
		[4]  = {1000,3, "vc_Rand_3_4_JS_foot()", "Gi�y 3-4 sao ng�u nhi�n"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu�n ch��ng anh h�ng"},
		[6]  = {1600,3, "vc_Rand_3_4_JS_cape()", "�o cho�ng 3-4 sao ng�u nhi�n"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L�i H� Tinh Ph�ch"},
		[8]  = {2200,3, "vc_Rand_3_4_JS_badge()", "Huy ch��ng 3-4 sao ng�u nhi�n"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L�i H� Tinh Ph�ch"},
		[10] = {3000,2, 10000000, "Kinh nghi�m"},
	},
	[3] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu�n ch��ng anh h�ng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi�t Tinh c�p 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu�n ch��ng anh h�ng"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu�n ch��ng anh h�ng"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L�i H� Tinh Ph�ch"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L�i H� Tinh Ph�ch"},
		[10] = {3000,2, 10000000, "Kinh nghi�m"},
	},
	[4] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu�n ch��ng anh h�ng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi�t Tinh c�p 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu�n ch��ng anh h�ng"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu�n ch��ng anh h�ng"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L�i H� Tinh Ph�ch"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L�i H� Tinh Ph�ch"},
		[10] = {3000,2, 10000000, "Kinh nghi�m"},
	},
	[5] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu�n ch��ng anh h�ng"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi�t Tinh c�p 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu�n ch��ng anh h�ng"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu�n ch��ng anh h�ng"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L�i H� Tinh Ph�ch"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "�� qu� c�p 2-4 (Ng�u nhi�n)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L�i H� Tinh Ph�ch"},
		[10] = {3000,2, 10000000, "Kinh nghi�m"},
	},
}