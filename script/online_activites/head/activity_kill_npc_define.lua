AKCD_TABLE = {
	[121] = {
		nAcitvityID = 121,
		tTaskGroup = {3, 12},
		szTaskName = "ph�c long � h�c b�ch song k� ",
		szStartName = "Ng� H�nh T�n Gi�",
		nDaySeq = 1, --����������ñ��
		nTaskStatus = 2, --����״̬
		tAward = {
			nAwardTag = 3, --�콱״̬0δ��ȡ1��ȡ2����ȡ����
			tDialog = {
				[1] = "ph� th�ng ( mi�n ph� )",
				[2] = "�u ��i ( ti�u hao 89 ti�u dao ng�c)",
				[3] = "Si�u c�p ( ti�u hao 555 ti�u dao ng�c)",
			},
			tCost = {
				[1] = {},
				[2] = {{2, 1, 30603, 89, "Ti�u Dao Ng�c"}},
				[3] = {{2, 1, 30603, 555, "Ti�u Dao Ng�c"}},
			},
			tFreeRoom = {1, 2, 6},
			tAwardFunc = {
				[1] = "fakct_Award201404_GetAward_1()",
				[2] = "fakct_Award201404_GetAward_2()",
				[3] = "fakct_Award201404_GetAward_3()",
			},
			tSpecial = {
				bIsOpen = 1,
				nRebornLimitUp = 6,
				sTitle = "H�c B�ch Song Long Ti�n Thu�t ( ti�u hao 203 b�ch k� + 203 h�c k� + 203 ti�u dao ng�c + 203 xu +203 v�ng)",
				tCost = {{2,1, 30639, 203, " b�ch k� "}, {2,1, 30640, 203, " h�c k� "}, {2, 1, 30603, 203, "Ti�u Dao Ng�c"}, {2, 1, 30230, 203, "XU"}, {2030000}},
				nFreeRoom = {1, 1},
				sAwardFunc = "fakct_Award201404_GetSpecialAward()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "V� Danh T�ng",
				szNpcPosName = "thi�u l�m (210,190)",
				szTargetNpcTitle = "t�i c�n m�t s� nguy�n li�u �� luy�n v� v� luy�n thu�c ",
				tTaskIndex = {4, 5}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{333, "Ng�c phong", "Th�y Y�n"},
						{333, "Mao Ng�u", "Mi�u L�nh"},
					},
					[2] = {
						{666, "C�m Ti�n T�", "V��ng M�u ��ng_2"},
					},
					[3] = {
						{444, "Ng��i c�y", "D��c V��ng ��ng"},
					},
				},
				DropItem = {
					[1] = {
						["Ng�c phong"] = {222, "T� ong", {2,1,13}, 30},
						["Mao Ng�u"] = {222, "Mao Ng�u b�", {2,1,287}, 30},
					},
					[2] = {
						["��ch ti�n T�"] = {222, "Linh ��ch", {2,1,187}, 30},
					},
					[3] = {
						["Ng��i c�y"] = {99, "R� c�y ng�n n�m", {2,1,1422}, 30},
					},
				},
				tAward = {
					bIsOpen = 1,
					nFreeRoom = {1, 1},
					sAwardFunc = "fakct_Award201404_TaskStep_1()",
				}
			},
			[2] = {
				szTargetNpcName = "H� M�n",
				szNpcPosName = "Th�y Y�n (199,172)",
				szTargetNpcTitle = "ti�u di�t ph�n qu�n, thu th�p t�i nguy�n ch� t�o ��c d��c, v� kh�  ",
				tTaskIndex = {6, 7}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{222, "Ph�n Qu�n tu�n la", "T�y Song B�n N�p Nam "},
						{222, "V� s� ph�n qu�n", "T�y Song B�n N�p Nam "},
					},
					[2] = {
						{222, "Ph�n Qu�n tu�n la", "T�y Song B�n N�p Nam "},
						{222, "V� s� ph�n qu�n", "T�y Song B�n N�p Nam "},
					},
					[3] = {
						{222, "Ph�n Qu�n tu�n la", "T�y Song B�n N�p Nam "},
						{222, "V� s� ph�n qu�n", "T�y Song B�n N�p Nam "},
					},
				},
				DropItem = {
					[1] = {
						["Ph�n Qu�n tu�n la"] = {66, "Thu�c n�", {2,1,298}, 30},
						["V� s� ph�n qu�n"] = {66, "T�n ki�m", {2,1,299}, 30},
					},
					[2] = {
						["Ph�n Qu�n tu�n la"] = {66, "Thu�c n�", {2,1,298}, 30},
						["V� s� ph�n qu�n"] = {66, "T�n ki�m", {2,1,299}, 30},
					},
					[3] = {
						["Ph�n Qu�n tu�n la"] = {66, "Thu�c n�", {2,1,298}, 30},
						["V� s� ph�n qu�n"] = {66, "T�n ki�m", {2,1,299}, 30},
					},
				},
				tAward = {
					bIsOpen = 1,
					nFreeRoom = {1, 1},
					sAwardFunc = "fakct_Award201404_TaskStep_2()",
				}
			},
		},
	},
	
	[125] = {
		nAcitvityID = 125,
		tTaskGroup = {7, 9},
		szTaskName = "Tr� gian di�t b�o",
		szStartName = "Th�n tr��ng",
		nDaySeq = 1, --����������ñ��
		nTaskStatus = 2, --����״̬
		tAward = {
			nAwardTag = 3, --�콱״̬0δ��ȡ1��ȡ2����ȡ����
			tDialog = {
				[1] = "Ph� th�ng ( ti�u hao 19 ti�u dao ng�c)",
				[2] = "�u ��i ( ti�u hao 99 ti�u dao ng�c)",
			},
			tCost = {
				[1] = {{2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
				[2] = {{2, 1, 30603, 99, "Ti�u Dao Ng�c"}},
			},
			tFreeRoom = {0, 0},
			tAwardFunc = {
				[1] = "fakct_Award201405_GetAward_1()",
				[2] = "fakct_Award201405_GetAward_2()",
			},
			tSpecial = {
				bIsOpen = 0,
				nRebornLimitUp = 0,
				sTitle = "",
				tCost = {},
				nFreeRoom = {},
				sAwardFunc = "nothing()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "Ph� Nghi",
				szNpcPosName = "T��ng D��ng 190/187",
				szTargetNpcTitle = "X�ch Li�t v� Li Long � C� D��ng ��ng t�n ph� th�n x�m, d�n l�ng �n ng� kh�ng y�n, h�y ��n C� d��ng ��ng t�ng 2 �� ti�u di�t ch�ng",
				tTaskIndex = {4, 5}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{299, "Li�t Nhan Li Long", "C� D��ng ��ng_2"},
						{299, "X�ch Luy�n H�a H�", "C� D��ng ��ng_2"},
					},
					[2] = {
						{299, "Li�t Nhan Li Long", "C� D��ng ��ng_2"},
						{299, "X�ch Luy�n H�a H�", "C� D��ng ��ng_2"},
					},
					[3] = {
						{399, "Li�t Nhan Li Long", "C� D��ng ��ng_2"},
						{399, "X�ch Luy�n H�a H�", "C� D��ng ��ng_2"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[2] = {
				szTargetNpcName = "N�n d�n_Gi�p",
				szNpcPosName = "Th�nh �� 228/227",
				szTargetNpcTitle = "L�u manh trong Thi�n T�m Th�p h� hi�p danh l�nh, ��i hi�p h�y �i ti�u di�t ch�ng",
				tTaskIndex = {6, 7}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{399, "Thi�n T�m V� T�ng", "Thi�n T�m th�p_2"},
						{399, "Ma Ni T�ng", "Thi�n T�m th�p_3"},
					},
					[2] = {
						{399, "Thi�n T�m V� T�ng", "Thi�n T�m th�p_2"},
						{399, "Ma Ni T�ng", "Thi�n T�m th�p_3"},
					},
					[3] = {
						{499, "Thi�n T�m V� T�ng", "Thi�n T�m th�p_2"},
						{499, "Ma Ni T�ng", "Thi�n T�m th�p_3"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
		},
	},
	
	[128] = {
		nAcitvityID = 128,
		tTaskGroup = {10, 9},
		szTaskName = "B�ch ��c B�t X�m",
		szStartName = "Th�n tr��ng",
		szSayWhat = "��i Li�u l�n m�nh, c�c chi�n s� tr�n th�o nguy�n �ang c�n s� gi�p s�c. ��i hi�p c� th� gi�p �� kh�ng?",
		nDaySeq = 1, --����������ñ��
		nTaskStatus = 2, --����״̬
		tAward = {
			nAwardTag = 3, --�콱״̬0δ��ȡ1��ȡ2����ȡ����
			tDialog = {
				[1] = "Ph� th�ng ( ti�u hao 19 ti�u dao ng�c)",
				[2] = "VIP (Ti�u hao 99 Ti�u Dao Ng�c + 109 V�ng)",
			},
			tCost = {
				[1] = {{2, 1, 30603, 19, "Ti�u Dao Ng�c"}},
				[2] = {{2, 1, 30603, 99, "Ti�u Dao Ng�c"},{1090000}},
			},
			tFreeRoom = {1, 5},
			tAwardFunc = {
				[1] = "fakct_Award201406_GetAward_1()",
				[2] = "fakct_Award201406_GetAward_2()",
			},
			tSpecial = {
				bIsOpen = 0,
				nRebornLimitUp = 0,
				sTitle = "",
				tCost = {},
				nFreeRoom = {},
				sAwardFunc = "nothing()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "T�ng qu�n tr��ng h� v�",
				szNpcPosName = "Nh�n M�n Quan 163/181",
				szTargetNpcTitle = "Qu�n Li�u h�nh ho�nh �m m�u ti�u di�t ��i T�ng, qu�n ��ch qu� ��ng ng��i c� th� x�ng pha tr�n m�c gi�p qu�n ta? H�y ��n ��i Th�o Nguy�n 2 ti�u di�t b�n ch�ng",
				tTaskIndex = {4, 5}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{399, "V� s� d� t�c", "��i Th�o Nguy�n 2"},
						{399, "Ti�n th� d� t�c", "��i Th�o Nguy�n 2"},
					},
					[2] = {
						{399, "V� s� d� t�c", "��i Th�o Nguy�n 2"},
						{399, "Ti�n th� d� t�c", "��i Th�o Nguy�n 2"},
					},
					[3] = {
						{399, "V� s� d� t�c", "��i Th�o Nguy�n 2"},
						{399, "Ti�n th� d� t�c", "��i Th�o Nguy�n 2"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[2] = {
				szTargetNpcName = "D��ng Nghi�p",
				szNpcPosName = "Nh�n M�n Quan 168/179",
				szTargetNpcTitle = "� Trong l�c ��i chi�n li�u binh, do s� xu�t ta �� b� tr�ng ��c c�a Nhi�u L�n, kh�ng bi�t ��i hi�p c� th� gi�p ta ��n Nga Mi Ph�i l�y thu�c gi�i kh�ng?",
				tTaskIndex = {}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {},
					[2] = {},
					[3] = {},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[3] = {
				szTargetNpcName = "D��ng Nguy�t s� th�i",
				szNpcPosName = "Nga Mi Ph�i 205/192",
				szTargetNpcTitle = "��c d��c Nhi�u L�n ch� c� Thi�n Hoa T�n m�i c� th� �i�u tr�, mu�n c� Thi�n Hoa T�n ph�i ti�u di�t Ho� K� L�n v� Tr�ng Qu�i V��ng.",
				tTaskIndex = {6, 7}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{399, "H�a K� L�n", "Thi�n S� ��ng-2"},
						{399, "Tr�ng Qu�i V��ng", "Thi�n S� ��ng-2"},
					},
					[2] = {
						{399, "H�a K� L�n", "Thi�n S� ��ng-2"},
						{399, "Tr�ng Qu�i V��ng", "Thi�n S� ��ng-2"},
					},
					[3] = {
						{399, "H�a K� L�n", "Thi�n S� ��ng-2"},
						{399, "Tr�ng Qu�i V��ng", "Thi�n S� ��ng-2"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
		},
	},
	
	[140] = {
		nAcitvityID = 140,
		tTaskGroup = {9, 11},
		szTaskName = "Tr� gian di�t b�o",
		szStartName = "Th�n tr��ng",
		nDaySeq = 1, --����������ñ��
		nTaskStatus = 2, --����״̬
		tAward = {
			nAwardTag = 3, --�콱״̬0δ��ȡ1��ȡ2����ȡ����
			tDialog = {
				[1] = "Ph� th�ng (Ti�u hao 1 B�n Long B�ch)",
				[2] = "�u ��i (Ti�u hao 3 B�n Long B�ch)",
			},
			tCost = {
				[1] = {{2, 1, 1000, 1, "B�n Long b�ch"}},
				[2] = {{2, 1, 1000, 3, "B�n Long b�ch"}},
			},
			tFreeRoom = {0, 2},
			tAwardFunc = {
				[1] = "fakct_Award201411_GetAward_1()",
				[2] = "fakct_Award201411_GetAward_2()",
			},
			tSpecial = {
				bIsOpen = 0,
				nRebornLimitUp = 0,
				sTitle = "",
				tCost = {},
				nFreeRoom = {},
				sAwardFunc = "nothing()",
			},
		},
		tTaskStep = {
			[1] = {
				szTargetNpcName = "Ph� Nghi",
				szNpcPosName = "T��ng D��ng 190/187",
				szTargetNpcTitle = "Y�u qu�i ho�nh h�nh, d�n ch�ng l�m than, ��i hi�p h�y ti�u di�t ch�ng �� tr� l�i s� b�nh y�n cho b� t�nh",
				tTaskIndex = {4, 5}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{299, "T� B� Ti�n T�", "V��ng M�u ��ng_1"},
						{299, "Ti�u Ti�n T�", "V��ng M�u ��ng_1"},
					},
					[2] = {
						{299, "T� B� Ti�n T�", "V��ng M�u ��ng_1"},
						{299, "Ti�u Ti�n T�", "V��ng M�u ��ng_1"},
					},
					[3] = {
						{399, "��ch ti�n T�", "V��ng M�u ��ng-3"},
						{399, "Ki�m ti�n T�", "V��ng M�u ��ng-3"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
			[2] = {
				szTargetNpcName = "N�n d�n_Gi�p",
				szNpcPosName = "Th�nh �� 228/227",
				szTargetNpcTitle = "L�u manh trong Thi�n T�m Th�p h� hi�p danh l�nh, ��i hi�p h�y �i ti�u di�t ch�ng",
				tTaskIndex = {6, 7}, --ʹ�õ��������������¼ɱ�ָ���
				KillNpc = {
					[1] = {
						{199, "Thi�n T�m V� T�ng", "Thi�n T�m th�p_2"},
						{199, "Ma Ni T�ng", "Thi�n T�m th�p_3"},
					},
					[2] = {
						{199, "Thi�n T�m V� T�ng", "Thi�n T�m th�p_2"},
						{199, "Ma Ni T�ng", "Thi�n T�m th�p_3"},
					},
					[3] = {
						{299, "Thi�n T�m V� T�ng", "Thi�n T�m th�p_2"},
						{299, "Ma Ni T�ng", "Thi�n T�m th�p_3"},
					},
				},
				DropItem = {},
				tAward = {
					bIsOpen = 0,
					nFreeRoom = {1, 1},
					sAwardFunc = "nothing()",
				}
			},
		},
	},
}