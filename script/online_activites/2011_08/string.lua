--=============================================
--create by liubo
--describe:Խ�ϰ�2011��8�» �ַ����ļ�
--=============================================

VET_201108_CAKE_LOG_TITLE = "Hoat dong nuong Banh Trung Thu 2011"

VET_201108_TB_LOG_ACTION_LIST = {
	[1] = "Mua c�i",
     [2] = "K�ch ho�t l� n��ng",
	[3] = "Nh�n ���c 5 B�nh Th��ng H�ng",
}

VET_201108_STRING_LIST = {
	[1] = "K�ch ho�t l� n��ng b�nh",
	[2] = "Mua c�i  (gi� 30 v�ng)",
	[3] = "T� ��i tr�n 2 ng��i m�i c� th� k�ch ho�t l� n��ng",
	[4] = "Ch� c� ��i tr��ng m�i c� th� k�ch ho�t l� n��ng",
	[5] = "Kh�ng th�a �i�u ki�n k�ch ho�t l� n��ng",
	[6] = "Ch� ���c k�ch ho�t t�i Th�nh Th� (Bi�n Kinh, Th�nh ��, Tuy�n Ch�u, T��ng D��ng, ��i L�, Ph��ng T��ng)",
	[7] = "Nh�n v�t �� gia nh�p m�n ph�i, c�p 77 tr� l�n v� �� h�c ���c k� n�ng c�p 55 m�i c� th� k�ch ho�t l� n��ng.",
	[8] = "T� ��i c� th�nh vi�n mang kh�ng �� 5 B�nh Trung Thu",
	[9] = "T� ��i c� th�nh vi�n kh�ng mang theo C�i",
	[10] = "T� ��i c� th�nh vi�n �� tham gia �� gi�i h�n %d l�n n��ng b�nh trong ng�y",
	[11] = "��i tr��ng ch� c� th� k�ch ho�t 1 L� N��ng trong c�ng l�c",
	[12] = "C�c h� mang kh�ng �� 30 v�ng",
	[13] = "S� l��ng mua",
	[14] = "Gi�i thi�u ho�t ��ng n��ng b�nh",
	[15] = "C�c h� c� th� t� ��i c�ng th�n h�u ho�c ��ng ��o h�o ki�t t�p h�p l�i c�ng k�ch ho�t l� n��ng b�nh trung thu. Sau khi k�ch ho�t l� n��ng l� kho�n th�i gian �� cho m�i ng��i sum h�p quay qu�n v� nh�n th��ng �i�m kinh nghi�m. Sau 5 ph�t, c�n c� th� nh�n ���c 5 B�nh Th��ng H�ng t� L� N��ng. L�u �: ch� gi�i h�n tham gia m�i ng�y 4 l�n th�i ��y!",
	[16] = "C�c h� hi�n t�i kh�ng th� k�ch ho�t l� n��ng",
	[17] = "��i vi�n kh�ng � b�n c�nh",
}

VET_201108_TB_NPCS_LIST = {
	[1] = "B�nh c�a c�c h� v�n ch�a n��ng ch�n, ��ng qu� n�n n�ng!",
	[2] = "B�nh �� n��ng ch�nh r�i!",
	[3] = "H�y gi�nh 1 � tr�ng tr�n h�nh trang, x�c nh�n mu�n l�y b�nh ch�?",
	[4] = "X�c nh�n",
	[5] = "Quay l�i sau!",
	[6] = "C�c h� �� nh�n B�nh Trung Thu r�i",
	[7] = "��y kh�ng ph�i l� L� N��ng c�a c�c h�",
}

--����ID
VET_201108_TB_MAPID = {
    100,150,200,300,350,400,500,
}

--��Ʒ
VET_201108_ITEM_LIST = {
	[1] = {"B�nh Trung Thu",2,1,30326},
	[2] = {"B� c�i",2,1,30330},
	[3] = {"B�nh Th��ng H�ng",2,1,30329},
	[4] = {"��n hoa Trung Thu",2,1,30327},
}
--��¯
VET_201108_TB_NPCS = {
	[1] = {"L� n��ng nh�","L� n��ng nh�",43859},
	[2] = {"L� n��ng l�n","L� n��ng l�n",87719},
}

--describe:Խ�ϰ�8�·ݻ3 **�ַ���
VET_201108_NPCLAMP_LIST = {
	Title = "��m tr�ng r�m, treo ��n k�t hoa m�ng Trung Thu. H�y nhanh ch�n mang L�ng ��n ��n treo l�n �i, �� c�ng b�n b� chia s� m�t ��m h�i hanh ph�c v� �m �p n�y!", 
	Options = {
		[1] = {
			subTitle = "Gi�i thi�u ho�t ��ng",
			subOptions = {
				[1] = {
					Process = "Quy tr�nh ho�t ��ng",
					Content = "C�c h� c� th� th�ng qua V��t �i L��ng S�n, ho�n th�nh nhi�m v� Thu Th�p T�i Nguy�n, nhi�m v� V� L�m S� Gi�, ho�c tr�ng c�y, m� t�i h�t gi�ng, �� nh�n ���c L�ng ��n Trung Thu. Mang ��n ��n treo t�i c�c th�nh th� l�n t�i NPC C�t Treo ��n �� nh�n ���c ph�n th��ng h�p d�n. M�i c�ch 10 ph�t c� th� treo ��n 1 l�n!",
				},
				[2] = {
					Process = "Gi�i thi�u ph�n th��ng",
					Content = "Treo L�ng ��n c�ng c�n c� k� thu�t, c�ng m�t th�nh th� treo L�ng ��n c�ng nhi�u th� c�ng kh� kh�n, n�u treo ��n th�t b�i s� kh�ng nh�n ���c ph�n th��ng m� c�n ph�i treo l�i t� ��u! �i�u ���ng nhi�n l� s� l��ng L�ng ��n treo c�ng nhi�u ph�n th��ng nh�n ���c c�ng h�p d�n! C�c h� c� th� ch�n treo L�ng ��n t�i c�c th�nh th� kh�c nhau, l�n treo ��n th� nh�t kh�ng b� th�t b�i nh�ng ph�n th��ng c�ng kh�ng l�n. Ch� �, m�i ng�y ch� ���c treo ��n 7 l�n!",
				},
			},
			backMenu = "Tr� l�i",
		},
		[2] = {
			subTitle = "Ta ��n treo L�ng ��n",
			subOptions = {
				[1] = "C�c h� c�n mang theo 1 L�ng ��n Trung Thu!",
				[2] = "C�n ch� ��i 10 ph�t �� treo L�ng ��n ti�p theo!",
				[3] = "H�m nay c�c h� �� d�ng h�t s� l��t treo L�ng ��n r�i!",
				[4] = "Treo ��n th�t b�i, h�y b�t ��u l�i nh�!",
				[5] = "C�c h� treo ��n th�nh c�ng l�n th� %d! Nh�n ���c %d �i�m kinh nghi�m",
			}
		},
	},
	Exit = "Ta ch� ti�n ���ng gh� ngang",
	Other = "Ho�t ��ng �� qu� h�n th�i gian r�i",
}

VET_201108_TB_ODDS = {
	[1] = {100,500000},
	[2] = {85,600000},
	[3] = {65,700000},
	[4] = {50,1000000},
	[5] = {35,1500000},
	[6] = {15,2000000},
	[7] = {5,2500000},
}