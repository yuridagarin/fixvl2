--�ű����ܣ���ɽ�ؿ�����ַ����ļ���
--���ܿ�����VV
--������ֲ���峤
--��ֲʱ�䣺2011-2-18
--�޸ļ�¼��

N_JOIN_ENERGY_NEED = 20
N_JOIN_TIANJIAOLING_NEED = 99999999
N_CALL_BOSS_TIANJIAOLING_NEED = 99999999
T_TIANJIAOLING = {2, 97, 236, "Thi�n Ki�u L�nh"}

--npcģ��������ʾ����Ϣ
NpcName={
	[1] = {"Th�n H�nh Th�i B�o ��i T�ng","Th�n H�nh Th�i B�o ��i T�ng"},
	--��ɽBOSS-�Ƚ϶�-��һ��
	[2] = {"C�p Th�i V� T�ng Giang","C�p Th�i V� T�ng Giang"},
	[3] = {"Ti�u �n H�u L� Ph��ng","Ti�u �n H�u L� Ph��ng"},
	[4] = {"H�n Nh�n Qu� Qu�ch Th�nh","H�n Nh�n Qu� Qu�ch Th�nh"},
	[5] = {"Tri �a Tinh Ng� D�ng","Tri �a Tinh Ng� D�ng"},
	[6] = {"Mao ��u Tinh Kh�ng Minh","Mao ��u Tinh Kh�ng Minh"},
	[7] = {"��c H�a TInh Kh�ng L��ng","��c H�a TInh Kh�ng L��ng"},
	[8] = {"C�u V�n Long S� Ti�n","C�u V�n Long S� Ti�n"},
	[9] = {"X�u Qu�n M� Tuy�n T�n","X�u Qu�n M� Tuy�n T�n"},
	[10] = {"T�nh M�c Cang X�ch T� V�n","T�nh M�c Cang X�ch T� V�n"},
	[11] = {"Ti�u Tuy�n Phong S�i Ti�n","Ti�u Tuy�n Phong S�i Ti�n"},
	[12] = {"B�nh ��i Tr�ng B�ch V�nh","B�nh ��i Tr�ng B�ch V�nh"},
	[13] = {"Kim Nh�n B�u Thi �n","Kim Nh�n B�u Thi �n"},
	[14] = {"��i �ao Quan Th�ng","��i �ao Quan Th�ng"},
	[15] = {"Th�nh Th�y T��ng �an ��nh Qu�","Th�nh Th�y T��ng �an ��nh Qu�"},
	[16] = {"Th�n H�a T��ng Ng�y ��nh Qu�c","Th�n H�a T��ng Ng�y ��nh Qu�c"},
	[17] = {"Nh�p V�n Long C�ng T�n Th�ng","Nh�p V�n Long C�ng T�n Th�ng"},
	[18] = {"Th�n C� Qu�n S� Chu V�","Th�n C� Qu�n S� Chu V�"},
	[19] = {"B�nh �y Tr� T�n L�p","B�nh �y Tr� T�n L�p"},
	[20] = {"B�o T� ��u L�m Xung","B�o T� ��u L�m Xung"},
	[21] = {"Ma V�n Kim S� �u B�ng","Ma V�n Kim S� �u B�ng"},
	[22] = {"H�a Nh�n Toan Ngh� Tr�nh Phi","H�a Nh�n Toan Ngh� Tr�nh Phi"},
	[23] = {"Hoa H�a Th��ng L� Tr� Th�m","Hoa H�a Th��ng L� Tr� Th�m"},
	[24] = {"L��ng ��u X� Gi�i Tr�n","L��ng ��u X� Gi�i Tr�n"},
	[25] = {"Song V� Khi�t Gi�i B�o","Song V� Khi�t Gi�i B�o"},
	[26] = {"H�nh Gi� V� T�ng","H�nh Gi� V� T�ng"},
	[27] = {"Lo�n Th� Ma V��ng Phi�n �oan","Lo�n Th� Ma V��ng Phi�n �oan"},
	[28] = {"Tang M�n Th�n Bao H�c","Tang M�n Th�n Bao H�c"},
	[29] = {"T�y B�n Ti�n Phong Nh�t Ph�m","T�y B�n Ti�n Phong Nh�t Ph�m"},
	[30] = {"L�c Nh�n Gi�","L�c Nh�n Gi�"},
	[31] = {"L�c Nh�n Ngh�a","L�c Nh�n Ngh�a"},
	[32] = {"B�nh Quan S�c D��ng H�ng","B�nh Quan S�c D��ng H�ng"},
	[33] = {"Ti�u Gi� Lan M�c Xu�n","Ti�u Gi� Lan M�c Xu�n"},
	[34] = {"�� H� T��ng L� Trung","�� H� T��ng L� Trung"},
	[35] = {"Phanh M�nh Tam Lang Th�ch T�","Phanh M�nh Tam Lang Th�ch T�"},
	[36] = {"��c Gi�c Long Tr�u Nhu�n","��c Gi�c Long Tr�u Nhu�n"},
	[37] = {"Hoa H�ng H� Cung V��ng","Hoa H�ng H� Cung V��ng"},
	[38] = {"Nh�t Tr��ng Thanh H� Tam N��ng","Nh�t Tr��ng Thanh H� Tam N��ng"},
	[39] = {"N�y C��c H� V��ng Anh","N�y C��c H� V��ng Anh"},
	[40] = {"Th�n Y An ��o To�n","Th�n Y An ��o To�n"},
	[41] = {"Song Th��ng T��ng ��ng B�nh","Song Th��ng T��ng ��ng B�nh"},
	[42] = {"Khi�u Gi�n H� Tr�n ��t","Khi�u Gi�n H� Tr�n ��t"},
	[43] = {"B�ch Hoa X� D��ng Xu�n","B�ch Hoa X� D��ng Xu�n"},
	[44] = {"Thanh Di�n Th� D��ng Tr�","Thanh Di�n Th� D��ng Tr�"},
	[45] = {"B�t T� Na Tra H�ng Xung","B�t T� Na Tra H�ng Xung"},
	[46] = {"Phi Thi�n ��i Th�nh L� C�n","Phi Thi�n ��i Th�nh L� C�n"},
	[47] = {"T�ch L�ch H�a T�n Minh","T�ch L�ch H�a T�n Minh"},
	[48] = {"C�m B�o T� D��ng L�m","C�m B�o T� D��ng L�m"},
	[49] = {"Ti�u B� V��ng Chu Th�ng","Ti�u B� V��ng Chu Th�ng"},
	[50] = {"Song Ti�n H� Di�n Ch��c","Song Ti�n H� Di�n Ch��c"},
	[51] = {"B�ch Th�ng T��ng H�n Thao","B�ch Th�ng T��ng H�n Thao"},
	[52] = {"Thi�n M�c T��ng B�nh Nh�","Thi�n M�c T��ng B�nh Nh�"},
	[53] = {"H�c To�n Phong L� Qu�","H�c To�n Phong L� Qu�"},
	[54] = {"M�c Tr� Thi�n �� Thi�n","M�c Tr� Thi�n �� Thi�n"},
	[55] = {"Xu�t L�m Long Tr�u Uy�n","Xu�t L�m Long Tr�u Uy�n"},
	--���ر���
	[56] = {"R��ng ti�n","L��ng S�n b�o r��ng"},
	[57] = {"IBbaoxiang","R��ng H�o H�n"},
	[58] = {"R��ng ti�n","T� Ngh�a B�o R��ng"},
	--Fish Npc��Ϣ
	[59] = {"Bang ch�ng Thanh Long ���ng","Bang ch�ng Thanh Long ���ng"},
	[60] = {"Bang ch�ng B�ch H� ���ng","Bang ch�ng B�ch H� ���ng"},
	[61] = {"Bang ch�ng Chu T��c ���ng","Bang ch�ng Chu T��c ���ng"},
	[62] = {"Bang ch�ng Huy�n V� ���ng","Bang ch�ng Huy�n V� ���ng"},
	--��һ��NPC
	[63] = {"R��ng c� th� m�","R��ng v�ng"},
	[64] = {"R��ng c� th� m�","R��ng b�c"},
	[65] = {"R��ng c� th� m�","R��ng ��ng"},
	[66] = {"R��ng c� th� m�","R��ng thi�t"},
	[67] = {"Tr��ng Thanh v��n rau","Tr��ng Thanh v��n rau"},
	[68] = {"M�u D� Xoa T�n Nh� N��ng","M�u D� Xoa T�n Nh� N��ng"},
	--�ڶ���NPC
	[69] = {"Bang ch�ng Thanh Long ���ng","Bang ch�ng Thanh Long ���ng"},
	[70] = {"Bang ch�ng B�ch H� ���ng","Bang ch�ng B�ch H� ���ng"},
	[71] = {"Bang ch�ng Chu T��c ���ng","Bang ch�ng Chu T��c ���ng"},
	[72] = {"Bang ch�ng Huy�n V� ���ng","Bang ch�ng Huy�n V� ���ng"},
	[73] = {"H� V��ng","H� V��ng"},
	[74] = {"Ti�n N�","Ti�n N�"},
	[75] = {"Thi V��ng","Thi V��ng"},
	[76] = {"Th�ch Ma","Th�ch Ma"},
	[77] = {"L� Tu�n Ngh�a","L� Tu�n Ngh�a"},
	--������NPC
	[78] = {"Ti�u k�","G�"},
	[79] = {"Ti�u �p","V�t"},
	[80] = {"Ti�u nga","Ng�ng"},
	[81] = {"Ti�u d��ng","D�"},
	[82] = {"V� V� Ti�n Tr��ng Thanh", "V� V� Ti�n Tr��ng Thanh"},
	[83] = {"Ti�u L� Qu�ng Hoa VInh", "Ti�u L� Qu�ng Hoa VInh",},
	--���Ĺ�NPC
	[84] = {"Bang ch�ng Thanh Long ���ng","Bang ch�ng Thanh Long ���ng"},
	[85] = {"Bang ch�ng B�ch H� ���ng","Bang ch�ng B�ch H� ���ng"},
	[86] = {"Bang ch�ng Chu T��c ���ng","Bang ch�ng Chu T��c ���ng"},
	[87] = {"Bang ch�ng Huy�n V� ���ng","Bang ch�ng Huy�n V� ���ng"},
	[88] = {"Kim Ti�n B�o T� Thang Long","Kim Ti�n B�o T� Thang Long"},
	[89] = {"C�ng t�c qu�n l�i","C�ng t�c qu�n l�i"},
	[90] = {"C�ng t�c qu�n l�i","C�ng t�c di�m d��ng"},
	[91] = {"C�ng t�c qu�n l�i","C�ng t�c l�nh s��ng"},
	[92] = {"C�ng t�c qu�n l�i","C�ng t�c t�t phong"},
	[93] = {"Qu�n l�i","Qu�n l�i"},
	[94] = {"Di�m d��ng","Di�m d��ng"},
	[95] = {"L�nh s��ng","L�nh s��ng"},
	[96] = {"T�t phong","T�t phong"},
	--�����NPC���ޣ�
	--���ص�һ��NPC
	[97] = {"N�p na","N�p na"},
	--���صڶ���NPC
	[98] = {"D��ng Th�ng","D��ng Th�ng",},
	[99] = {"Ng� Nh�n ��ch","Ng� Nh�n ��ch",},
	[100] = {"V��ng Tr� Ti�u","V��ng Tr� Ti�u"},
	[101] = {"L� T� Vy","L� T� Vy"},
}
--�ؿ�����
LSStageName = {
	[1] = "Th�y B�ch ��nh",
	[2] = "Kho�i Ho�t L�m",
	[3] = "Kho�i M� ��o",
	[4] = "H�c Phong Tr�i",
	[5] = "H�c Phong Tr�i",
	[6] = "T� Ngh�a ���ng",
	[7] = "Gi�i ��u o�n t� t�",
	[8] = "Khi�u chi�n c�a hi�p s�",
}
--������Ϣ
LSTaskInfo = {
	[1] = {
		[1] = "Khi�u chi�n s� di�n",
		[2] = "M�i ng�y ho�n th�nh 1 l�n nhi�m v� khi�u chi�n L��ng S�n Qu�n H�ng H�i �i 1-4 (��nh b�i L��ng S�n H�o H�n tr�n H�c Phong Tr�i), c� th� nh�n ���c 1 <color=yellow>L��ng S�n s� di�n bao<color>, m� ra c� c� h�i nh�n ���c Th� Th�n Ph�, th�nh v�t s� m�n ho�c Tu Th�n Ho�n",
	},
	[2] = {
		[1] = "Khi�u chi�n trung d�ng",
		[2] = "M�i ng�y ho�n th�nh 1 l�n th�ng quan L��ng S�n Qu�n H�ng H�i c� th� nh�n ���c 1 <color=yellow>L��ng S�n trung d�ng bao<color>, m� ra c� c� h�i nh�n v�ng ho�c �i�m tu luy�n.",
	},
	[3] = {
		[1] = "Khi�u chi�n �o�t qu�n",
		[2] = "M�i ng�y ��nh b�i 1 l�n L��ng S�n H�o H�n ���c ch� ��nh (v� d�: T�ch L�ch H�a T�n Minh) c� th� nh�n ���c 1 <color=yellow>L��ng S�n �o�t qu�n bao<color>, m� ra c� c� h�i nh�n ���c �i�m kinh nghi�m ho�c �i�m tu luy�n.",
		[3] = "M�i ng�y ��nh b�i 1 l�n �<color=red>%s<color>�, c� th� nh�n ���c 1 <color=yellow>L��ng S�n �o�t qu�n bao<color>, m� ra c� c� h�i nh�n ���c �i�m kinh nghi�m ho�c �i�m tu luy�n",
	},
}
--��Ҹ�����Ϣ
LSMsgToPlayer = {
	[1] = "Kh�ng bi�t ���ng �i",
	[2] = "�ang gi�m ��nh thu�c t�nh v�t ph�m!",
	[3] = "Kh�ng gian h�nh trang kh�ng ��, kh�ng th� nh�n v�t ph�m",
	[4] = "Nh�t ���c ",
	[5] = "Kh�ng c�n v�t ph�m trong r��ng",
	[6] = "T�t c� ng��i ch�i �� b� cu�c",
	[7] = "Nh�ng ng��i ch�i kh�c �� v��t qu� th�i gian, xem nh� b� cu�c",
	[8] = "N�m ra %d �i�m",
	[9] = "Ph�ng",
	[10] = "C�n",
	[11] = "Nh�t ���c ",
	[12] = "Tham lam",
	[13] = "C�c h� mang theo %s kh�ng ��",
	[14] = "C�c h� �� ho�n th�nh �%s�, h�y t�m [%s] nh�n th��ng.",
	[15] = "C�c h� �� nh�n ���c %d �i�m tu luy�n",
	[16] = "Thu ���c %d �i�m kinh nghi�m",
	[17] = "B�n �� ��i th�nh c�ng %s",
	[18] = "H�nh trang kh�ng �� �, kh�ng th� nh�n %s.",
	[19] = "H�m nay c�c h� �� ��nh b�i L��ng S�n H�o H�n nh�n ���c ph�n th��ng %d %s (gi�i h�n m�i ng�y c� th� nh�n %d)."
}
--������Ϣ
LSMsgToTeam = {
	[1] = "Th�ng quan th�nh c�ng!!!",
	[2] = "�ang v�o �i ti�p theo",
	[3] = "%s kh�ng th� v�o Qu�n Anh H�i (hi�n �ang ngh� ng�i)",
	[4] = "%s kh�ng th� v�o Qu�n Anh H�i (kh�ng c�ng th�nh th�)",
	[5] = "%s kh�ng th� v�o Qu�n Anh H�i (ch�a gia nh�p m�n ph�i)",
	[6] = "V�o c�a �i L��ng S�n Qu�n Anh H�i ",
	[7] = "�ang ��i kh�i ��ng c�a �i, ti�n ��",
	[8] = "C�a �i �ang ti�n h�nh, ti�n ��",
	[9] = "C�a �i �ang ��i k�t th�c, ti�n ��",
	[10] = "�� xu�t hi�n, khi�u chi�n �ang b�t ��u!",
	[11] = "V��t �i th�t b�i, chu�n b� r�i kh�i c�a �i",
	[12] = "�� b� ��nh b�i.",
	--������ɺ����ʾ��Ϣ
	[13] = {
		[1] = "Ch�c m�ng c�c v� anh h�ng thu�n l�i v��t �i 1, theo ���ng m�n tr�n v��t qua c�u s� g�p ���c L� Tu�n Ngh�a, h�y ��n t�m hi�u n�i chuy�n v�i anh ta xem.",
		[2] = "Th� luy�n Kho�i Ho�t L�m �� k�t th�c, d�c theo con ���ng ph�a ��ng b�c s� g�p ���c Vinh H�a Tr��ng Thanh, ��i tr��ng c� th� t�m anh ta th�m th�nh t�nh h�nh nh� th� n�o.",
		[3] = "Th� luy�n Kho�i M� ��o �� k�t th�c, d�c theo con ���ng ph�a t�y b�c s� g�p ���c Kim Ti�n B�o T� Thang Long, ��i tr��ng c� th� ��n t�m anh ta th�m th�nh t�nh h�nh nh� th� n�o.",
		[4] = "Th� luy�n H�c Phong Tr�i �� k�t th�c, d�c theo con ���ng ph�a t�y ch�nh l� T� Ngh� ���ng, ta s� ��i c�c ng��i tr�n ��, chu�n b� xong h�y ��n t�m ta.",
		[5] = "Th� luy�n H�c Phong Tr�i �� k�t th�c, d�c theo con ���ng ph�a t�y ch�nh l� T� Ngh� ���ng, ta s� ��i c�c ng��i tr�n ��, chu�n b� xong h�y ��n t�m ta.",
		[6] = "C�a �i �n �Gi�i ��u o�n t� tה �� k�t th�c",
		[7] = "C�a �i �n �Khi�u chi�n hi�p sܔ �� k�t th�c",
	},
	--�ؿ�����ʱ��ӭ������Ϣ
	[14] = {
		[1] = {
				"Uy�n T� Th�nh h�i h� b�o, M�c Nhi Qu� t� giao long. L��ng S�n B�c h�i t� nh�n tinh anh trong v� l�m, ai n�y ��u v� ngh� cao c��ng, th�n mang tuy�t k�, c�c v� h�o h�n tham gia qu�n h�ng h�i �� chu�n b� s�n sang ch�a?",
				"M�u D� Xoa T�n Nh� N��ng: th�t l� xui x�o, v�n ��nh t�m nh�m ng��i qua ���ng �� h�t m�t qu�, ai ng�",
				"Tr��ng Thanh: tuy n�i Phong Nh�t Ph�m, V��ng Tr� Ti�u, L� T� Vy, D��ng Th�ng, Ng�n Nh�n ��ch ��u non tay xanh l�, ai ng� ch�ng l�i v� ngh� cao c��ng nh� th�.",
				"M�u D� Xoa T�n Nh� N��ng: h�, m�nh c�i g�, do l�n tr��c l�o n��ng ta khinh ��ch, ch� d�ng 7 ph�n c�ng l�c, n�n �� �� b�n nh�c �� chi�n th�ng th�i�. Ph�a tr��c nh� �ang c� ��ng t�nh, con m�i ��n r�i, ngay l�c ta �ang c�n t�m ng��i tr�t gi�n.",
				"Tr��ng Thanh: l�o n��ng hay c�n th�n, ��ng xem th��ng nh�ng ng��i n�y.",
		},
		[2] = {
			NpcName[77][2]..": v�n v�t thi�n ��a ��u c� linh t�nh, b�t k� chim bay tr�n tr�i ho�c �� c� c�y c�i ��u c� linh kh�.",
			NpcName[77][2]..": n�u nh� nh�ng v�n v�t chi linh n�y thu�c v� ch�ng ta, c� th� tr� th�nh v� kh� thi�n h� v� ��ch.",
		},
		[3] = {
			NpcName[82][2]..": ai c�ng n�i Hoa huynh ti�n thu�t h�n L� Qu�ng, h�m nay t�i h� th�t mu�n so t�i v�i Hoa huynh m�t phen.",
			NpcName[83][2]..": Phi Th�ch, ti�n thu�t ai ��u c� th� m�nh ri�ng, anh em hai ta ��u c�n ph�i v� c�i h� danh �� m� tranh ch�p.",
			NpcName[82][2]..": kh�ng ��u c�ng ���c, ch� e nh�ng v� huynh �� kh�c nghe ���c n�i Hoa huynh b�t t�i s� thua, �nh h��ng ��n uy danh c�a huynh th�i.",
			NpcName[83][2]..": huynh �� ch�p � mu�n so t�i, th� th� xin Tr��ng huynh ch� gi�o v�y!",
		},
		[4] = {
			"L��ng S�n bang ch�ng A: ��y l� c�i tr� qu� g� ��y? V�t n�y l� qu�.",
			"L��ng S�n bang ch�ng B: b�n ta c�ng c� 1 c�i, tr�n �� c� ghi, H�a�D��ng, h�a d��ng mang � g�?",
			"L��ng S�n bang ch�ng A: �� ngu, ��y g�i l� Di�m D��ng, v� nh� h�c th�m �i. H�nh nh� ��y l� 1 c�ng t�c.",
			"L��ng S�n bang ch�ng B: c�i g� to�n th�n gh� l� Kim Ti�n Bao T� Thang Long nghi�n c�u m�i ng�y ra c�i n�y ��y sao.",
			"L��ng S�n bang ch�ng A: su�t� nh� ti�ng l�i, tr�n ng��i �ng ta l� vi�t th��ng b� b�ng, kh�ng ph�i b� gh�.",
			"L��ng S�n bang ch�ng B: �a, ph�a tr�n c� c�i c�ng t�c. M� ra xem c� b�o b�i g�.",
			"L��ng S�n bang ch�ng A: ��ng, ��ng ��ng v�o�",
			"B�m, �A�� m�t ti�ng k�u th�m thi�t vang trong H�c Phong Tr�i�.",
			"Kim Ti�n Bao T� Thang Long: l� ng�c, ch�a c� s� cho ph�p c�a ta c� gan t�y ti�n m� c�ng t�c.",
		},
	},
	[15] = "�� ti�n v�o �%s�",
	[16] = "�� xu�t hi�n, khi�u chi�n �ang b�t ��u!",
	[17] = "C�c v� ��i hi�p hi�n �� s�n ���c %d con, %s v� %s c�ng �� b�t ���c %d con.",
	[18] = "C�c h� nh�n ���c �Kh� Ng�ng Th�n C�ng� chu�t ph�i ch�n thanh ph�m t�t, nh�n ch�n �Ng�ng Th�n C�ng� t�i d�y k� n�ng v�a hi�n ra, k� n�ng n�y l�p t�c c� th� s� d�ng.",
	[19] = "�� b� tr�ng th��ng.",
	[20] = "C� quan �� ���c k�ch ho�t",
	[21] = "C� quan �� kh�i ��ng l�i",
	[22] = "�L��ng S�n h�o h�n tuy l�i h�i, nh�ng ch� l� d�ng m�nh h�n ng��i, m�u k�t thi�u s�t. Ch�ng ta ch� c�n d�ng 1 chi�u �Minh tu s�n ��o, �m �� tr�n th��ng� l� c� th� chi�n th�ng�",
	[23] = "H�y s� d�ng %s khi�u chi�n L��ng S�n H�o H�n nhanh ch�ng nh�t l�y b�o r��ng",
	[24] = "�� b� ��nh b�i.",
	[25] = "Ch�c m�ng c�c v� ��i hi�p �� v��t qua t�t c� c�a �i",
	[26] = "C�c h� �� v�o c�a �i �n �%s�",
	[27] = {"B�a","K�o","B�"},
	--��ȭ�����Ϣ
	[28] = {"Bao","! Thi o�n t� t� ch�i ch� Na ta h�, v�n c�n non l�m, v� luy�n th�m 2 n�m n�a �i.","! C�c h� qu� l�n th�n c�, ti�u n� xin ph�c."},
	[29] = {"K�t th�c tr�n ��u.","Chi�n th�ng!","B�i tr�n!"},
	--���عؿ��ڶ���
	[30] = "%s �� b� tr�ng th��ng.",
	
	[31] = "Nh�n ���c tr�ng th�i [%s], %d gi�y%s"
}
--ʱ�������
LSTimeGuageString = {
	[1] = "Th�i gian s�n b�t",
	[2] = "C� quan l�p l�i",
	[3] = "Th�i gian h�i sinh",
	[4] = "Th�i gian v� ��ch",
	[5] = "Th�i gian o�n t� t�",
	[6] = "Th�i gian sinh t�n",
}
--���������Ի�չ��
LSLoginQuanli = {
	"C�n t� ��i",
	"�t nh�t %d",
	"C�p �� ��u #%d",
	"��ng th�i",
	"Do ��i tr��ng <color>��ng k�, m�i c� th� tham gia L��ng S�n Qu�n H�ng H�i. (Ch� �� l� �i�u ki�n ��i ng� ch�a ��t ���c)",
}
--talk�Ի�
LSSysTalk = {
	[1] = "H�y nh�t r��ng ph�n th��ng tr��c khi m� c�a �i ti�p theo",
	[2] = "C�c v� anh h�ng L��ng S�n �� xu�t chi�n r�i, h�y quay l�i sau",
	[3] = "Ng��i ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng",
	[4] = "C�c h� m�ng theo kh�ng �� %s",
	[5] = {
		"Gia nh�p giang h� tr��c sau gi c�ng ph�i tr� !",
		"L��i tr�i l�ng l�ng, th�a m� kh�ng l�t",
		"Qu�n t� �i t�i �o�t chi h�u ��o",
		"�a h�nh b�t ngh�a t�t t� b�i!",
		"��ng v� ti�u �c m� l�m, ��ng v� ti�u thi�n m� b�",
	},
	[6] = "Tr�ng th�i Boss: (M�u �� = �� ��ng ��, m�u xanh = ch�a ��ng ��)",
	[7] = ": vui l�ng ��i trong ch�c l�t...",
	[8] = "<color=green>th�ng b�o<color>: ��i ng� c�a c�c h� �� ph�t ��ng khi�u chi�n ��n %s v� %s <color=green>n�u trong v�ng 3 ph�t ti�u di�t ���c ���c v�t s�n b�t nhi�u h�n 2 ng��i h� b�t ���c, th� ��i ng� c�a c�c h� s� gi�nh ���c chi�n th�ng<color>. H� �� b�t ��u ti�n h�nh s�n b�t r�i. Cu�c s�n b�t ��u.",
	[9] = "Trong tr�n chi�n, t�t c� ng��i ch�i tham gia ��u nh�n ���c tr�ng th�i �Thi�n Th�n H� Ph�m�, tr�ng th�i duy tr� ��n khi tr�n chi�n k�t th�c. M�i c�ch 30 gi�y h�i sinh t�t c� ng��i ch�i trong khu v�c, h�i ph�c t�t c� tr�ng th�i, ��ng th�i v� ��ch trong 10 gi�y. Sau khi ti�u di�t t�t c� c�c boss ng��i ch�i c� th� ti�n v�o c�a �i ti�p theo (T� Ngh�a ���ng). \n hi�u qu�<color=yellow>�%s�<color>: \n<color=green>%s<color>",
	[10] = "C�c h� kh�ng mang theo [%s], kh�ng th� ti�p t�c khi�u chi�n c�c v� anh h�ng L��ng S�n n�a. [%s] c� th� th�ng qua <color=yellow>ng� c�c <color> mua ���c",
	[11] = "H�y nh�t r��ng ph�n th��ng tr��c khi r�i kh�i c�a �i",
	[12] = {"Ng��i ch�i %s �� thua!","Ng��i ch�i %s �� th�ng!","T�ng �i�m hi�n nay l� %d v�i %d. C�c v� �� th�ng ���c %d v�n"},
	--���عؿ��ڶ��ص���ؽ�����Ϣ
	[13] = {
		"Ch�c m�ng! Sau nh�ng kh�o nghi�m giang kh� ��i ng� c�a c�c h� cu�i c�ng �� gi�nh ���c chi�n th�ng �S� khi�u chi�n c�a h�o ki�t�.",
		"C�c h� c� th� ti�n v�o khi�u chi�n c�a �i ti�p theo.",
		"C�c h� c�ng ��i ng� �� b� ��nh b�i, v��t �i th�t b�i.",
	},
	--��ɽ�������
	[14] = {
		"C�c h� �� nh�n nhi�m v�",
		"C�c h� �� ho�n th�nh �<color=green>%s<color>�, h�y mau ��n nh�n th��ng!",	
	},
	[15] = {
		[1] = "C�c h� mang theo %s kh�ng �� %d!",
		[2] = "C�c h� mang theo kh�ng �� %d v�ng",
		[3] = "Kh�ng gian h�nh trang kh�ng �� 1 � tr�ng, kh�ng th� ��i!",
		[4] = "Ch�a gia nh�p l�u ph�i, kh�ng th� ��i!",
	},
}
--npc������Ϣ
LSNpcChat = {
	--boss��ʼս��ʱ�ĺ���
	[1] = {
		[NpcName[2 ][2]] = {"Mu�n so t�i v� ngh� v�i T�ng M�u, v�n mong c�c h� ch� gi�o ch� gi�o.","�ao ki�m kh�ng c� m�t, mong c�c h� c�n th�n."},
		[NpcName[5 ][2]] = {"C�c h� �� ki�ng quy�t mu�n t� v� v�i ta, t�i h� ��nh tr� t�i m�n v�y!"},
		[NpcName[8 ][2]] = {"N�i nhi�u v� �ch, h�y ph�n cao th�p tr�n v� kh� th�i!!","V� kh� kh�ng c� m�t, mong c�c h� c�n th�n!"},
		[NpcName[11][2]] = {"Hahaha c�c h� mu�n c�ng ta t� v�, th�t vinh h�nh, vinh h�nh qu�","Tuy n�i r�ng �� l�u kh�ng xu�t chi�u, nh�ng ta s� kh�ng l�u t�nh ��u!"},
		[NpcName[14][2]] = {"��nh nhau kh�ng ch� l� nh� th�, h�y �� ta h��ng d�n c�c ng��i v�i chi�u!"},
		[NpcName[17][2]] = {"�ao c�a ta, c�c h� v�n ch�a �� n�i, h�y quay v� nh� �i.","C�c ng��i khi�u chi�n v�i ta, hahaha ta c�ng mu�n ni�m th� m�i v� c�a th�t b�i l� nh� th� n�o.",},
		[NpcName[20][2]] = {"H�y xem ��y!","C�c ng��i h�y xem s� l�i h�i c�a ta!"},
		[NpcName[23][2]] = {"C�c ng��i ��n khi�u chi�n ta ��y sao? �� xem c�c ng��i c� bao nhi�u c�n l��ng!"},
		[NpcName[26][2]] = {"��u ra ��m ti�u mao t�c n�y, c� gan l�ng ng�n h�n x��c th� n�y!","H�y b�o l�n danh t�nh, l� khi b� ta ��nh ch�t th� tr�n bia m� c�ng c� c�i t�n!"},
		[NpcName[29][2]] = {"N�i nhi�u v� �ch, h�y so t�i quy�n c��c.","Ti�p chi�u, v� ��ch uy�n ��ng c��c!"},
		[NpcName[32][2]] = {"Mu�n khi�u chi�n ta, v�y th� ph�i tr� m�t c�i gi� r�t l�n!","L�o ��y kh�ng ph�t uy m� ch�ng ng��i t��ng ta l� con m�o b�nh sao!!"},
		[NpcName[35][2]] = {"��ng c� ��a, mu�n ��nh v�i ta th� ch� c� ch�n s�ng th�i!","C�c ng��i �n kh�ng n�i, h�y v�c nhau m� v� �i!"},
		[NpcName[38][2]] = {"Ti�p chi�u, h�y xem s� l�i h�i c�a l�o n��ng ��y!","Cho c�c ng��i bi�t th� n�o l� kh�ng n�n ch�c gi�n nh�ng ng��i ��p!"},
		[NpcName[41][2]] = {"Ng��i kh�ng mu�n s�ng n�a r�i h�, c� gan ��n khi�u chi�n v�i ta.",	"Ta ch� c�n m�t tay th�i c�ng �� �� h� g�c ng��i!"},
		[NpcName[44][2]] = {"Ta s� cho ng��i bi�t th� n�o l� L��ng S�n h�o h�n!","Ta kh�ng mu�n rat ay, c�c ng��i h�y �i �i."},
		[NpcName[47][2]] = {"Mu�n so t�i v�i ta, h�y �n g�y n�y tr��c! !","Ai d�m ��i chi�n 300 hi�p v�i ta?"},
		[NpcName[50][2]] = {"Ng��i th�t to gan, c� gan khi�u chi�n v�i L��ng S�n B�c ch�ng ta!","Xem chi�u, h�y xem s� l�i h�i c�a gia gia ��y!","H�y mau v� v�i m� �i, kh�ng th� ��ng kh�c l�c van xin!"},
		[NpcName[53][2]] = {"C�c ng��i l� ai, b�o danh l�n �i, ta kh�ng gi�t nh�ng t�n v� danh ti�u b�i!","C�c ng��i c� bi�t s� l�i h�i c�a s�i roi ph�o n�y?!"},
	},
	--bossս��ʱ�ĺ���
	[2] =
	{
		[NpcName[2 ][2]] = {"C�c h� v� ngh� cao c��ng, T�ng m�u may m�n ���c m� r�ng t�m m�t","B�i ph�c b�i ph�c, c�c h� sao kh�ng gia nh�p L��ng s�n v�i ch�ng t�i, c�ng nhau tr�ng b�o an l��ng, th� thi�n h�nh ��o!"},
		[NpcName[5 ][2]] = {"Ta th�t b�t t�i, c�c h� qu� nhi�n l�i h�i!"},
		[NpcName[8 ][2]] = {"H�o c�ng phu, b�i ph�c b�i ph�c!"},
		[NpcName[11][2]] = {"�� l�u kh�ng g�p nh�ng v� h�u b�i xu�t s�c nh� th� n�y, th�t l� h�u sinh kh� �y!!"},
		[NpcName[14][2]] = {"�i tr�n giang h� tr��c sau g� c�ng ph�i tr���"},
		[NpcName[17][2]] = {"V� ngh� kh�ng t�, ti�c l� ta ch� d�ng c� 7 th�nh c�ng l�c","Quan m� ta h�m nay �� b�i tr�n, th�t th� v�!!!"},
		[NpcName[20][2]] = {"C�c h� th�n th� b�t ph�m, C�ng T�n m�u b�i ph�c."},
		[NpcName[23][2]] = {"L�m m�u tung ho�nh giang h� m�y m��i n�m, g�p ���c c�c v� thi�u ni�n anh h�ng th�t l� m�t ��u may m�n!"},
		[NpcName[26][2]] = {"Kh�ng ng� l�i thua cho nh�ng t�n ti�u l�u la c�c ng��i th�t s� � qu�, s� � qu�."},
		[NpcName[29][2]] = {"C�c h� v� c�ng c�i th�, V�ng T�ng b�i ph�c."},
		[NpcName[32][2]] = {"Giang s�n kh�ng ��i, l�c th�y tr��ng l�u. H�y ��i ��y!"},
		[NpcName[35][2]] = {"C�c ng��i qu� nhi�n c� ch�t b�n l�nh, h�m nay t�m tha c�c ng��i! L�n sau ta s� kh�ng n��ng tay n�a!","Tuy ng��i �� th�ng ta, nh�ng c�c huynh �� c�a ta s� b�o th� n�y!"},
		[NpcName[38][2]] = {"C�c v� qu� th�n th� b�t ph�m, ti�u n��ng ta xin b�i ph�c."},
		[NpcName[41][2]] = {"H�m nay c� ���c m�t tr�n chi�n th�t s�ng kho�i, s�ng khoai!"},
		[NpcName[44][2]] = {"L�i h�i, c�c h� v� ngh� cao c��ng, c�i th� tuy�t lu�n, h�y l�m v� anh h�ng th� 109 c�a L��ng S�n n�y nh�!"},
		[NpcName[47][2]] = {"T�c th�t, b�i d��i tay nh�ng t�n tti�u t� th�i n�y, th�t kh�ng cam t�m!"},
		[NpcName[50][2]] = {"Tuy l�ng kh�ng cam, nh�ng v� c�ng c�a nh�ng v� hi�p s� qu� th�t t�i h� b�i ph�c.",	},
		[NpcName[53][2]] = {"S�ng kho�i, th�t s�n kho�i, �� l�u r�i kh�ng c� m�t tr�n ��nh s�n kho�i nh� th� n�y r�i!","H�m nay l�o t� u�ng nhi�u r�i, ch�n tay kh�ng linh ho�t, l�n sau s� d�y d� c�c ng��i."},
	}
}
--NPC-Say�Ի�����
NpcSayInfo = {
	[1] = {
		"<color=green>"..NpcName[1][2].."<color>: h�o ki�t h� c� ���c Thi�n Cang L�nh, ��u c� th� ��n t�m ta ��i th��ng.",
		". Tr� l�i",
		". Tho�t",
		". %s (c�n %d Thi�n Cang L�nh)",		--test:��Ʒ��
		"Kh�ng th� giao d�ch",
	},
	[2] = {
		"<color=green>"..NpcName[1][2].."<color>: c�c h� x�c ��nh d�ng %d Thi�n Cang L�nh ��i l�y %s kh�ng?",
		"��ng �",
		"H�y b�",
	},
	[3] = {
		"Ph�a T�y b�c c� 1 tr� ��nh, ��i tr��ng c� th� t�m b� ch� T�n Nh� N��ng h�i th�m t�nh h�nh c�a L��ng S�n Qu�n H�ng H�i.",
		"K�t th�c ��i tho�i",
	},
	[4] = {
		"C�a �i L��ng S�n qu�n h�ng h�i �� k�t th�c.",
	},
	--���ؽ���NPC�Ի�ѡ��
	[5] = {
		[1] = "Ti�n v�o c�a �i ti�p theo",
		[2] = "Ki�m tra t�nh tr�ng g�p Boss",
		[3] = "K�t th�c ��i tho�i",
		[4] = ":Nh�ng v� huynh �� L��ng S�n ch�ng t�i, ai n�y ��u th�n mang tuy�t k� v� ngh� cao c��ng. C�c v� hi�p s� n�n d�ng to�n l�c ra �ng ph�, ch� n�n khinh ��ch m� m�t �i sinh m�ng. ~",
	},
	--�ؿ���һ�ص���ضԻ�
	[6] = {
		[1] = {
			"Ph�a T�y b�c c� 1 tr� ��nh, ��i tr��ng c� th� t�m b� ch� T�n Nh� N��ng h�i th�m t�nh h�nh c�a L��ng S�n Qu�n H�ng H�i.",
			{
				"K�t th�c ��i tho�i/nothing",
			},
		},
		[2] = {
			": c�c v� �� c� gan khi�u chi�n L��ng S�n huynh �� ch�ng t�i, ch�c s� kh�ng ph�i l� h�ng ti�u b�i t�m th��ng, c�c v� huynh �� �� chu�n b� ch�a?",
			{
				"Ta ch�p nh�n khi�u chi�n/start",
				"K�t th�c ��i tho�i/nothing",
			},
		},
		[3] = {
			": ���ng nh� ph�a sau ta c� th� ��n tr�c ti�p T� Ngh�a ���ng, chi�n th�ng h�o h�n trong t� ngh�a ���ng c� th� nh�n ���c gi�i th��ng c�ng nhi�u. nh�ng c�c ng��i ��n H�c Phong Tr�i ph�i chi�n th�ng 4 L��ng S�n H�o H�n ch� ��i � ��.",
			{
				--"��Ҫ��С·��ȥ/#tStage_1:skip()",
				"Ta ch� gh� qua th�i/nothing",
			},
		},
		[4] = {
			"D�ng Thi�n Ki�u c�n <color=red>%d c�i %s (C� th� mua trong Ng� C�c)<color> ��ng � kh�ng?",
			{
				"��ng �/#tStage_1:skip(1)",
				"Ta ch� gh� qua th�i/nothing",
			},
		},
	},
	--�ؿ��ڶ��ص���ضԻ�
	[7] = {
		[1] = {
			": c�c v� ��n khi�u chi�n v�i ch� v� anh h�ng L��ng S�n ta sao? H� ��u mang tr�n ng��i v� ngh� cao c��ng, th�n mang tuy�t k�, h�y nh� ch� n�n khinh ��ch. N�u c�m th�y qu� s�c, ��i tr��ng c� th� t�m ta ch�n tr� th� th�ch h�p .",
			{
				"Ta ch�p nh�n khi�u chi�n/start",
				"K�t th�c ��i tho�i/nothing",
			}
		},
		[2] = {
			": c�c v� ��n khi�u chi�n v�i ch� v� anh h�ng L��ng S�n ta sao? H� ��u mang tr�n ng��i v� ngh� cao c��ng, th�n mang tuy�t k�, h�y nh� ch� n�n khinh ��ch. N�u c�m th�y qu� s�c, ��i tr��ng c� th� t�m ta ch�n tr� th� th�ch h�p .",
			{
				"Ta mu�n xin h� tr�/#tStage_2:getAid()",
				"K�t th�c ��i tho�i/nothing",
			}
		},
		[3] = {
			":Nh�ng tr� th� sau ��u c� s� tr��ng ri�ng, l�i d�ng ��c �i�m c�a h� s� d� d�ng v��t �i.",
			{
				"H� v��ng: hi�u qu� v�ng s�ng: trong ph�m vi v�ng s�ng n�i c�ng ng��i ch�i ���c t�ng cao/#tStage_2:createMyFish(1)",
				"Ti�n n�: hi�u qu� v�ng s�ng: trong ph�m vi v�ng s�ng ng��i ch�i h�i ph�c sinh m�nh/#tStage_2:createMyFish(2)",
				"Thi v��ng: hi�u qu� v�ng s�ng: trong ph�m vi v�ng s�ng qu�i ��i ��ch gi�m n�i ngo�i ph�ng/#tStage_2:createMyFish(3)",
				"Th�ch ma: hi�u qu� v�ng s�ng: trong ph�m vi v�ng s�ng qu�i ��i ��ch t�c s� gi�m/#tStage_2:createMyFish(4)",
				"Ta suy ngh� l�i/nothing",
			}
		},
	},
	--�ؿ������ص���ضԻ�
	[8] = {
		--��սǰ�ĶԻ�
		[1] = {
			[1] = {
				": Hoa Vinh th�t l� phi�n h�, ta ch� mu�n so t�i v�i h�n m�t phen, th� ��u ra nhi�u ��o l� th� n�y.",
				": m�i ng��i c�ng l� huynh �� L��ng S�n, Tr��ng huynh �� ch�p � mu�n so t�i ti�n thu�t v�i ta, th�t l�m kh� ta qu�.",
			},
			[2] = {
				"Thay b�ng ch�ng ta c�ng so t�i /#tStage_3:startfish()",
				"tr� l�i /nothing",
			},
		},
		--��ս�ɹ��ĶԻ�
		[2] = {
			[1] = {
				": kh�ng ng� thi�u hi�p tu�i tr� t�i cao",
				": thi�u hi�p v� ngh� cao c��ng, Hoa Vinh b�i ph�c.",
			},
		},
		--��սʧ�ܵĶԻ�
		[3] = {
			[1] = {
				": kh�ng t� kh�ng t�, c� v�i ���ng v� ngh� ��y! Nh�ng mu�n ��nh b�i ta h�y v� luy�n th�m v�i n�m �i.",
				": c�c h� v� ngh� kh�ng t�, ��ng ti�c v�n ch�a �� h�a h�u. Sau n�y c�n ch�m ch� luy�n t�p th�m.",
			},
			[2] = {
				"Ta mu�n khi�u chi�n v� h�o h�n L��ng S�n ti�p theo /#tStage_3:startboss()",
				"tr� l�i/nothing",
			},
		},
		--���ؽ���ʱ�ĶԻ�
		[4] = {
			[1] = {
				"<color=green>Th�ng b�o<color>: th�i gian s�n b�t �� k�t th�c. C�c v� ��i hi�p t�ng c�ng �� b�t ���c %d v�t s�n, %s v� %s t�ng c�ng b�t ���c %d v�t s�n. \n<color=red>��i tho�i v�i h�<color>, c� th� khi�u chi�n v� h�o h�n L��ng S�n ti�p theo.",
				"\n C�c h� �� nh�n ���c �<color=yellow>Kh� Tuy�n Th�n C�ng<color>�, <color=green> c� th� ch�n d�ng trong bi�u t��ng k� n�ng chu�t ph�i�<color>.",
			},
			[2] = {
				"Ta bi�t r�i/nothing",
			},
		},
	},
	--�ؿ����Ĺص���ضһ�
	[9] = {
		[1] = {
			": nh�ng c� quan b�n trong ��u l� th�nh qu� nghi�n c�u bao n�m nay c�a ta, nghe n�i ng��i mu�n khi�u chi�n nh�ng v� huynh �� tr�n L��ng S�n, ta ngh� r�ng nh�ng b�o b�i nghi�n c�u c�a ta c� th� s� gi�p �ch ���c c�c v�. Ph�a tr�n khu v��n ph�a b�c c� 1 <color=red>h� n��c<color>, b�n trong c� l�p v�i <color=red>c�ng t�c<color>, ��i tr��ng c� th� d�ng �� m� c� quan, gi�p ��i ng� v��t �i thu�n l�i h�n.",
			{
				"Ta ch�p nh�n khi�u chi�n /start",
				"tr� l�i/nothing"
			}
		},

	},
	--�ؿ�����ص���ضԻ�
	[10] = {
		[1] = {
			": v�o T� Ngh�a ���ng c�n ��nh b�i 4 v� L��ng S�n h�o h�n tr�n th� t�i �ay, c�c v� �� chu�n b� s�n s�ng ch�a.",
			{
				"Ta �� s�n s�ng /start",
				"Ta c�n chu�n b� l�i./nothing",
			}
		},

	},
	--�ؿ���������ضԻ�
	[11] = {
		[1] = {
			": th�t kh�ng d� d�ng t� n�o, kh�ng ng� c�c v� ��i hi�p c� th� ��n ���c T� Ngh�a ���ng, t�i ��y t�p h�p nh�ng tinh anh c�a L��ng S�n, c�c v� s� kinh ng�c tr��c phong th�i c�a L��ng S�n h�o h�n.",
			{
				"Ta mu�n ti�p nh�n khi�u chi�n ( ti�u hao 1 Thi�n Ki�u L�nh)/preStart",
				"Ki�m tra t�nh tr�ng g�p Boss/#tMission:showBossState()",
				"Kh�ng ch�i n�a, ta mu�n v� nh�/preClose",
				"K�t th�c ��i tho�i/nothing",
			},
		},
		[2] = {
			": th�t kh�ng d� ch�t n�o, kh�ng ng� c�c v� ��i hi�p l�i l�i hai nh� th�",
			{
				"Ta �� ��i th�ng /preClose",
				"K�t th�c ��i tho�i/nothing",
			},
		},
	},
	--���ص�һ����ضԻ�
	[12] = {
		[1] = {
			": ta l� cao th� o�n t� t� ��, mu�n khi�u chi�n h�, th� th� chu�n b� thua �i! \n   <color=yellow>N�u th�nh vi�n ��i ng� c� 3 - 4 ng��i, ch� c�n 1 ng��i chi�n th�ng th� chi�n th�ng chung cu�c \n   N�u ��i ng� c� 5- 8 th�nh vi�n th� c�n 2 ng��i chi�n th�ng s� gi�nh chi�n th�ng chung cu�c <color>",
			{
				"Ta mu�n th�ch ��u o�n t� t� /start",
				"tr� l�i/nothing",
			},
		},
		[2] = {
			": kh�ng ch�i n�a, kh�ng ch�i n�a ��",
			{
				"tr� l�i /nothing",
			},
		},
		[3] = {
			"Tr�n ��u 3 v�n. �i�m hi�n t�i l�",
		},
		[4] = {
			{
				"A? �o�n gi�ng nh� ta.",
				"Haha, ta th�ng r�i.",
				"T�c ch�t ���c, �� qu�~",
			},
			{
				"tr� l�i /start",
			},
		},
	},
	--���صڶ�����ضԻ�
	[13] = {
		[1] = {
			"C�c h� �� v�o c�a �i �n �Khi�u chi�n c�a hi�p sܔ L��ng S�n Qu�n H�ng H�i. Trong �i n�y, trong v�ng 3 ph�t, th�nh vi�n ��i ng� ��u s�ng s�t th� chi�n th�ng c�a �i, c� th� nh�n ���c ph�n th��ng l�n. Khi k�t th�c khi�u chi�n c�n s�ng tr�n 2 ng��i ��i ng� c� th� nh�n ���c 1 r��ng ph�n th��ng, n�u th�nh vi�n s�ng s�t d��i 2 ng��i, ��i ng� s� kh�ng nh�n ���c ph�n th��ng nh�ng to�n ��i c� th� ti�p t�c khi�n chi�n c�a �i ti�p theo.",
			{
				"Ta hi�u r�i!/nothing",
			},
		},
		[2] = {
			{
				--��
				[NpcName[98][2]]   = "<color=green>"..NpcName[98][2].."<color>: C�c ng��i mu�n khi�u chi�n L��ng S�n h�o h�n ch�ng ta ��y �, h�y v��t qua �i n�y r�i n�i chuy�n!",
				--��
				[NpcName[99][2]] = "<color=green>"..NpcName[99][2].."<color>: kh� �i v� bi�n, quay ��u l� b�. C�c v� h�y gi�c ng� �i, quay v� v�n c�n k�p.",
				--��
				[NpcName[100][2]] = "<color=green>"..NpcName[100][2].."<color>: c�c ng��i c�ng tham gia L��ng S�n qu�n h�ng h�i sao? ",
				--��
				[NpcName[101][2]] = "<color=green>"..NpcName[101][2].."<color>: c� ch�ng ta ��y, c�c ng��i ��ng h�ng g�p ���c nh�ng v� h�o h�n L��ng S�n.",
			},
			{
				"��nh th� ��nh, ta s� ng��i sao /start",
				"tr� l�i /nothing",
			},
		},
	},
	--��ɽ������ضԻ�
	[14] = {
		[1] = ": lo�i nhi�m v� n�y m�i ng�y ch� ���c nh�n 1 l�n.",
		[2] = ". Tr� l�i",
		[3] = ". Tho�t",
		[4] = "C�c h� �� nh�n nhi�m v� n�y r�i!",
		[5] = "#Ki�m tra nhi�m v�",
		[6] = "Nhi�m v� n�y �� ho�n th�nh!",
		[7] = "#Nh�n th��ng",
		[8] = "Ph�n th��ng n�y �� ���c nh�n!",
		[9] = "#Nh�n nhi�m v� ",
		[10] = {
			[1] = "H�y ch�n trang b� c�n ��i",
			[2] = ". Ta c�n ��i %s",
			[3] = {
				"Trang b� h� C�u Ch�u",
				"Trang b� h� Hi�n Vi�n",
			},
			[4] = "(c�n %d Thi�n Cang L�nh v� %d v�ng)",
			[5] = "X�c ��nh s� d�ng %d Thi�n Cang L�nh v� %d v�ng ��i?",
			[6] = ".  Ta x�c ��nh ��i%s",
			[7] = ".  Xem trang b� C�u Ch�u",
		}
	},
}
--״̬��Ϣ
LSBuffInfo = {
	[1] = {
		{
			"Duy tr� h�i m�u",
			{
				{"state_life_per_per8f",  1000, 15*18, 1, 9922 }
			},
			"Xu�n phong h�a v�"
		},
		{
			"Duy tr� h�i n�i l�c",
			{
				{"state_neili_per_per8f", 1000, 15*18, 1, 9923,}
			},
			"Thang kh� h�i t��ng"
		},
		{
			"N�ng cao n�i ngo�i ph�ng",
			{
				{"state_magic_parmor_per_add", 50, 15*18, 1, 9924, },
				{"state_physical_parmor_per_add", 50, 15*18, 1, 9925, },
			},
			"Linh h�n h� th� ",
		},
		{
			"N�ng cao n�i ngo�i c�ng",
			{
				{"state_m_attack_percent_add", 200, 15*18, 1, 9926, },
				{"state_p_attack_percent_add", 200, 15*18, 1, 9927, },
			},
			"N� ph�t xung qu�n",
		},
	},
	--����ص�buff
	[2] = {
		[1] = {"Thi�n th�n h� ph�m", 60, "Duy tr� %d ph�t"},
		[2] = {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo�i c�ng t�ng %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"N�i c�ng t�ng %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Gi�i h�n m�u t�ng %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"Mi�n d�ch tr�ng th�i b� h�i %d"},
		},
	},
}
--��־��Ϣ
SysLogInfo = {
	[1] = "Liangshan mission:	%s	add item fail, addflag:%d,itemname:	%s",
	

}
--��NpcName[1][2]������ʾ����NPC������
T = {}
T1 = {}
T2 = {}
T3 = {}
T3_1 = {}
T3_2 = {}
T3_3 = {}
T3_4 = {}
T3_5 = {}
T3_6 = {}

T.msg = "<color=green>"..NpcName[1][2].."<color>: T�i c� th� gi�p g� cho c�c ?";
T.msg = format("%s\n s� l�u ph�i trong t� ��i c�ng nhi�u gi�i th��ng c�ng t�t", T.msg)
T.msg = format("%s\nV��t �i th��ng: M�i th�nh vi�n c�n ti�u hao <color=yellow>%d �i�m tinh l�c<color>\nV��t �i Thi�n Ki�u: ��i tr��ng c�n ti�u hao <color=yellow>%d c�i %s<color>"
	, T.msg, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
T.sel =
{
	{". B�i c�nh L��ng S�n Qu�n H�ng H�i", T1, },
	{". �i�u ki�n tham gia", T2, },
	{". Gi�i thi�u v��t �i", T3, },
--	{". V��t �i th��ng", "entry_jingli", },
--	{". V��t �i Thi�n Ki�u", "entry_tianjiaoling", },
--	{". Ta mu�n ��i th��ng", "exchange", },
--	{". Ta ��n nh�n nhi�m v� h�ng ng�y", "DailyTasksMenu", },
	{". Tho�t", "nothing", },
	};
T1.msg = "<color=green>"..NpcName[1][2].."<color>: c�c v� anh h�ng h�o ki�t t� v� L��ng S�n gi�nh ���c chi�n th�ngc� th� nh�n ���c t�n v�t��Thi�n Cang L�nh, d�ng Thi�n Cang L�nh c� th� t�m ta ��i l�y k� binh d� b�o trong thi�n h�.";
T1.sel =
{
	{". Tr� l�i", T, },
	{". Tho�t", "nothing", }, };
T2.msg = "<color=green>"..NpcName[1][2].."<color>: �t nh�t c�n 3 ng��i ch�i ��ng v�p >=80 t� ��i, v� do ��i tr��ng d�n, m�i ���c tham gia L��ng S�n Qu�n H�ng H�i. Gamer kh�ng gia nh�p l�u ph�i s� kh�ng th� �i v�o.";
T2.msg = format("%s\nV��t �i th��ng: M�i th�nh vi�n c�n ti�u hao <color=yellow>%d �i�m tinh l�c<color>\nV��t �i Thi�n Ki�u: ��i tr��ng c�n ti�u hao <color=yellow>%d c�i %s<color>"
	, T2.msg, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
T2.sel =
{
	{". Tr� l�i", T, },
	{". Tho�t", "nothing", }, };
T3.msg = "<color=green>"..NpcName[1][2].."<color>: L��ng S�n qu�n h�ng h�i t�ng c�ng c� 5 �i, v� 8 nh�m h�o h�n L��ng S�n (ch�n ng�u nhi�n trong danh s�ch 18 nh�m). C�a �i 1~4 m�i �i khi�u chi�n 1 nh�m, �i th� 5 khi�u chi�n 4 nh�m h�o h�n c�n l�i.";
T3.sel =
{
	{". Th�y B�ch ��nh", T3_1, },
	{". kho�i Ho�t L�m", T3_2, },
	{". Phi M� ��o", T3_3, },
	{". H�c Phong Tr�i", T3_4, },
	{". T� Ngh�a ���ng", T3_5, },
	{". �i b� m�t", T3_6, },
	{". Tr� l�i", T, },
	{". Tho�t", "nothing", }, };
T3_1.msg = "<color=green>"..NpcName[1][2].."<color>: xung quanh Th�y B�ch ��nh ��t s�n nhi�u r��ng, ph� v� r��ng c� th� k�ch ho�t nhi�u hi�u qu� kh�c nhau, c� hi�u qu� tr�ng th�i t�ng h� tr� cho ��i ng�, bi�t n�m b�t v� s� d�ng t�t hi�u qu� mang l�i c� th� gi�p �ch cho ��i ng� v��t �i d� d�ng h�n.";
T3_1.sel =
{
	{". Tr� l�i", T3, },
	{". Tho�t", "nothing", }, };
T3_2.msg = "<color=green>"..NpcName[1][2].."<color>: L� Tu�n trong Kho�i Ho�t L�m s� h� tr� h�t m�nh cho ��i ng� trong v��t �i, ch� c�n ��i tho�i v�i anh ta l� c� th� m��n ���c s�c m�nh h� tr�.";
T3_2.sel =
{
	{". Tr� l�i", T3, },
	{". Tho�t", "nothing", }, };
T3_3.msg = "<color=green>"..NpcName[1][2].."<color>: Hoa Vinh v� Tr��ng Thanh x�y ra tranh ch�p cao th�p trong Kho�i M� ��o, c�c h� c�n ch�n m�t trong 2 �� thi t�i, trong th�i gian quy ��nh ti�u di�t ���c d� th� nhi�u h�n s� chi�n th�ng v� nh�n ���c �Kh� Nguy�n Th�n C�ng�";
T3_3.sel =
{
	{". Tr� l�i", T3, },
	{". Tho�t", "nothing", }, };
T3_4.msg = "<color=green>"..NpcName[1][2].."<color>: H�c Phong Tr�i c� d�ng s�n 4 lo�i c� quan, kh�i ��ng nh�ng c� quan kh�c nhau c� th� gi�i ph�ng k� n�ng kh�c nhau. M�t l�i th� d�ng �� ch�ng l�i k� th� khi v��t �i.";
T3_4.sel =
{
	{". Tr� l�i", T3, },
	{". Tho�t", "nothing", }, };
T3_5.msg = "<color=green>"..NpcName[1][2].."<color>: n�u th�nh c�ng �i qua H�c Phong Tr�i, m�t ng��i trong t� ��i c�c b�n n�p 1 Thi�n Ki�u L�nh cho ��i T�ng m�i ���c �i v�o T� Ngh�a ���ng khi�u chi�n c�c h�o h�n kh�c ( Thi�n Ki�u L�nh c� th� mua t�i Ng� C�c), sau khi khi�u chi�n, nh�n v�t t��ng �ng trong t� ngh�a ���ng s� ��i th�nh nh�n v�t chi�n ��u v� t� v� v�i t� ��i ng��i.";
T3_5.sel =
{
	{". Tr� l�i", T3, },
	{". Tho�t", "nothing", }, };
T3_6.msg = "<color=green>"..NpcName[1][2].."<color>: ��y l� m�t b� m�t."
T3_6.sel =
{
	{". Tr� l�i", T3, },
	{". Tho�t", "nothing", }, 
}