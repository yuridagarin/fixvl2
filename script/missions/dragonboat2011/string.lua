--�ű����ܣ���������ս�ַ�������
--������ƣ����ܡ�С����
--���ܿ������������峤
--���ܲ��ԣ�С�ܡ�����
--����ʱ�䣺2011-8-23
--�޸ļ�¼��
sNpcNameEntrance="<color=green>Ti�p D�n S�<color>:"
sNpcNameNeeder="<color=green>Qu�n Nhu Quan<color>:"
sNpcNamePilot="<color=green>H��ng d�n vi�n<color>: "
tSTRING_NPC_SAY = {
	--����NPC�Ի�
	[1] = {
		[1] = {
			sNpcNameEntrance.."L�o phu �� thi�t k� m�t v� ��i t� v� tr�n bi�n, kh�ng bi�t c�c h� c� nh� � tham gia hay kh�ng?",
			{
				"B�o danh H�i Chi�n Long Ch�u (Ph� b�o danh 6 v�ng)/join_mission",
				"Nh�n ph�n th��ng H�i Chi�n Long Ch�u tr�n tr��c/get_award_infor",				
				"Gi�i thi�u H�i Chi�n Long Ch�u/mision_info",
				"Kh�ng c� g�!/nothing",
			},
		},
		[2] = {
			sNpcNameEntrance.."L�o phu r�t t�m huy�t tr�n H�i Chi�n Long Ch�u n�y, hy v�ng c�c v� ��i hi�p c� th� thi tri�n t�i ngh� si�u vi�t c�a m�nh",
			{
				"�i�u ki�n tham gia/mission_condition",
				"Th�i gian m�/mission_open_time",
				"Quy t�c H�i Chi�n Long Ch�u/mission_rule",
				"Ph�n th��ng H�i Chi�n Long Ch�u/mission_prize",
				"Tr� l�i/main",
				"R�i kh�i/nothing",
			},
		},
		
	},

}
--============������Ϣ
tSTRING_INTRODUCE = {
	[1] = "Thi�u hi�p c� th� c� nh�n b�o danh tham gia, ph� b�o danh l� 3 v�ng",
	[2] = "Th�i gian m�: 10:00 - 11:00, 16:00 - 17:00,  22:00 - 23:00",
	[3] = "\n\t<color=green>1.<color> Thi�u hi�p s� ���c chuy�n ng�u nhi�n ��n phe qu�n T�ng ho�c Li�u. Khi 2 b�n �� 8 ng��i, cu�c chi�n s� b�t ��u; \n\t<color=green>2.<color> M�i b�n ��u c� 100 �i�m chi�n ��u, �i�m s� s� ���c gi�m d�n theo di�n ti�n tr�n chi�n, b�n c� �i�m s� b� tr� v� 0 tr��c s� b� x� thua, phe ��i ph��ng chi�n th�ng; \n\t<color=green>3.<color> Th�i gian tr�n chi�n k�o d�i 40 ph�t, h�t gi� h� th�ng t� ��ng k�t th�c tr�n ��u, phe c� �i�m s� cao h�n s� gi�nh chi�n th�ng; \n\t<color=green>4.<color> N�u nh� �i�m s� 2 b�n b�ng nhau, b�n n�o c� Th�ng L�nh b� ti�u di�t s� b� x� thua. n�u th�ng l�nh 2 b�n kh�ng b� ��nh b�i tr�n chi�n x� h�a.\n",
	[4] = "\n\t<color=green>1.<color> B�n chi�n th�ng s� nh�n ���c 200 v�n �i�m kinh nghi�m, b�n thua cu�c 100 v�n kinh nghi�m; \n\t<color=green>2.<color> M�i ng�y m�i nh�n v�t nh�n ���c nhi�u nh�t 600 v�n kinh nghi�m.",
}
--====TALK�Ի�
tSTRING_NPC_TALK = {
	[1] = "Long Ch�u chi�n v�n trong th�i gian chu�n b�, thi�u hi�p h�y quay l�i v�o l�c 10:00-11:00, 16:00-17:00, ho�c 22:00-23:00.",
	[2] = "H�i Chi�n Long Ch�u v� c�ng nguy hi�m, thi�u hi�p ��t �� %d c�p h�y quay l�i tham gia!",
	[3] = "Thi�u hi�p v�n ch�a gia nh�p m�n ph�i!",
	[4] = "Thi�u hi�p c�n trang b� cho m�nh k� n�ng m�n ph�i c�p 55 h�y quay l�i tham gia!",
	[5] = "Thi�u hi�p v�n ch�a nh�n ph�n th��ng H�i Chi�n Long Ch�u l�n tr��c, h�y nh�n th��ng tr��c �i!",
	[6] = "Thi�u hi�p v�n � trong t� ��i, h�y r�i ��i tr��c khi b�o danh tham gia c� nh�n.",
	[7] = "Thi�u hi�p ch�a t�ng tham gia H�i Chi�n Long Ch�u sao, h�y nhanh ch�ng �i b�o danh �i!",
	[8] = "M�i ng�y ch� nh�n ���c nhi�u nh�t 600 v�n kinh nghi�m, thi�u hi�p kh�ng th� nh�n ti�p.",
	[9] = "Tr�n H�i Chi�n Long Ch�u �� gi�nh th�ng l�i, thi�u hi�p nh�n ���c ph�n th��ng %d kinh nghi�m! ",
	[10] = "Tr�n H�i Chi�n Long Ch�u tr��c �� th�t b�i, thi�u hi�p ch� c� th� nh�n ���c %d kinh nghi�m!",
	[11] = "T�t c� c�c b�n �� �� ��y, h�y quay l�i sau.",
	[12] = "Gi�i h�n nh�n �i�m kinh nghi�m ng�y h�m nay �� ��y",
	[13] = "Tr�n H�i Chi�n Long Ch�u tr��c �� h�a nhau, thi�u hi�p c� th� nh�n ���c ph�n th��ng %d kinh nghi�m!",
	[14] = "C�c h� mang kh�ng �� 3 v�ng, kh�ng th� tham gia H�i Chi�n Long Ch�u.",
}
--===ϵͳ��Ϣ
tSRING_SYS_MSG = {
	[1] = "%s �� gia nh�p H�i Chi�n Long Ch�u!",
	[2] = "Thi�u hi�p h�y t�m Qu�n Nhu Quan nh�n thuy�n r�ng, tr�n h�i chi�n s�p b�t ��u r�i.",
	[3] = "Thi�u hi�p �� l�nh h�i ���c 3 <K� n�ng Long Ch�u chuy�n d�ng>, xem trang danh s�ch k� n�ng v� thi�t l�p ph�m t�t.",
	[4] = "Giai �o�n %s: \n%s\n qu�n s�: \nT�ng %d vs Li�u %d\n �i�m chi�n ��u: \nT�ng %d vs Li�u %d",
}

--====����ٶԻ�
tSTRING_NEEDER_DLG = {
	[1] = "Gi�i thi�u c�ch ch�i Long Ch�u Chi�n/introduce",
	[2] = "Gi�i thi�u ��c �i�m Long Ch�u/drag_specialty",
	[3] = "Nh�n thuy�n r�ng/get_drag",
	[4] = "R�i kh�i chi�n tr��ng/exit_battle",
	[5] = "Ta ch� ��n xem th�/do_nothing",
}
--======��������
tSTRING_DRAG_KIND = {
	[1] = "Thuy�n Thanh Long (t�c �� trung, gi�p trung, s�t th��ng trung)/qing_long",
	[2] = "Thuy�n Huy�n V� (t�c �� th�p, gi�p cao, s�t th��ng th�p)/xuan_wu",
	[3] = "Thuy�n B�ch H� (T�c �� cao, gi�p th�p, s�t th��ng trung)/bai_hu",
	[4] = "THuy�n Chu T��c (t�c �� th�p, gi�p th�p, s�t th��ng cao)/zhu_que",
	[5] = "Tr� l�i/main",
}

--=======��ȡ����NPC�Ի�
tSTRING_DRAG_NPC = {
	[1] = "Thi�u hi�p �� nh�n Thuy�n R�ng r�i",
	[2] = "��i qu�n s�p h� th�y, thi�u hi�p h�y nhanh ch�ng chu�n b� h�nh trang, chi�n ��u cho qu�c gia n�o!",
	[3] = "Thi�u hi�p c� th� d�a tr�n s� th�ch c�a m�nh �� ch�n thuy�n r�ng!",
	[4] = "Thi�u hi�p mu�n bi�t th�m g� kh�ng?",
	[5] = "Thi�u hi�p x�c ��nh mu�n r�i kh�i chi�n tr��ng?",
	[6] = "R�i kh�i chi�n tr��ng/exit_ensure",
	[7] = "C� vi�c g� kh�ng?",
	[8] = "Hi�n t�i v�n ch�a khai chi�n, thi�u hi�p kh�ng th� v�o.",
	[9] = "Thi�u hi�p c�n c��i tr�n Thuy�n R�ng m�i c� th� v�o chi�n tr��ng.",
	[10] = "Thi�u hi�p c�n h� v� kh� m�i c� th� ti�n v�o chi�n tr��ng",
	[11] = "Kh�ng gian h�nh trang thi�u hi�p kh�ng ��",
	[12] = "Thi�u hi�p c�n t�m Qu�n Nhu Quan �� nh�n Thuy�n R�ng",
	[13] = "Thi�u hi�p c�n g� b� th� c��i tr�n ng��i tr��c khi ti�n v�o chi�n tr��ng",
}
--========ս������
tSTRING_BATTLE_RULE = {
	[1] = "Quy t�c chi�n ��u/fight_rule",
	[2] = "Quy t�c h�a thuy�n/firedrag_rule",
	[3] = "Quy t�c chi�n th�ng/sf_rule",
	[4] = "Tr� l�i/main",
}
--=====����
tSTRING_RULE_DETAIL = {
	[1] = "Nh�m ��nh b�i k� th�, c�n s� h� tr� nhi�t t�nh t� c�c v� qu�n s� tham gia, thi�u hi�p h�y t�m ��n Qu�n Nhu Quan ch�n v� ti�p nh�n c�c lo�i thuy�n r�ng ���c chu�n b� s�n �� c�ng ph� k� th�.",
	[2] = "Tr�n chi�n di�n ra ��n kho�n th�i gian gian nh�t ��nh, Ch� huy qu�n s� ph�i h�a thuy�n ra c�ng ph� k� th�, v� h�a thuy�n mang ��y h�a d��c, n�n c�n c�c v� hi�p s� h� t�ng ��n doanh tr�i c�a ��ch. Khi h�a thuy�n ���c chuy�n ��n doanh tr�i k� ��ch th�nh c�ng s� g�y s�t th��ng l�n khi�n k� th� nhanh ch�ng m�t �i�m.",
	[3] = "C�c v� hi�p s� c� th� ��nh b�i thuy�n r�ng c�a k� ��ch ho�c h� t�ng H�a Thuy�n ��n doanh tr�i ��ch l�m gi�m �i�m chi�n ��u c�a k� th�, khi �i�m chi�n ��u c�a k� th� gi�m v� 0 th� phe ta gi�nh ���c chi�n th�ng, n�u nh� phe ta gi�m v� 0 tr��c s� b� x� thua.",
}
--======�����ص�
tSTRING_DRAG_SPECAIL = {
	[1] = "<color=green>Thuy�n Thanh Long:<color>T�c �� trung b�nh, gi�p trung, c�ng k�ch trung, li�n k�ch nhanh, c� k� n�ng xung k�ch, kh�ng th� t� h�y khi b� ��nh b�i.",
	[2] = "<color=green>Thuy�n Huy�n V�:<color>T�c �� th�p, gi�p cao, c�ng k�ch th�p, c�ng k�ch kh�ng ch�, k� n�ng g�y h�n m�, c� th� h�i ph�c sinh l�c ��ng ��i.",
	[3] = "<color=green>Thuy�n B�ch H�:<color>T�c �� cao, gi�p th�p, c�ng k�ch trung, c�ng k�ch ���ng th�ng, k� n�ng ��y lui k� th�, t�ng t�c �� ��ng ��i.",
	[4] = "<color=green>Thuy�n Chu T��c:<color>T�c �� th�p, gi�p th�p, c�ng k�ch cao, c�ng k�ch t�p th�, c� th� kh�ng s�t th��ng ch� m�ng, c�n c� th� nh�p tr�ng th�i cu�ng b�o.",
}
--=======��ʱ���ű��ڵ��ַ���
tSTRING_MISSION = {
	[1] = "H�i Chi�n Long Ch�u 2 b�n kh�ng �� %d chi�n binh, kh�ng th� khai chi�n.",
	[2] = "H�i Chi�n Long Ch�u s� b�t ��u trong %d ph�t, H�a Thuy�n ch�nh l� �i�m m�u ch�t �� gi�nh chi�n th�ng, c�c v� anh h�ng h�y chu�n b� s�n s�ng.",
	[3] = "%s v� %s H�i Chi�n Long Ch�u trong %d ph�t b�t ph�n th�ng b�i.",
	[4] = "Th�y ��c Qu�n: cu�c chi�n ��u b�t ��u r�i, m�i ng��i h�y nhanh ch�ng v�o chi�n tr��ng n�o.",
	[5] = "%s �� gi�nh chi�n th�ng tr�n H�i Chi�n l�n n�y.",
	[6] = "S� ng��i 2 b�n hi�n t�i l�: %s[%d]: [%d]%s",
	[7] = "D��ng Th�t T�: H�, l�n sau b�n c� n��ng s� khi�n c�c ng��i th�t b�i th�m h�i.",
	[8] = "Ti�u T�n: ai da, ta s� run ng��i ��y n�y, l�o ��y s�n s�ng ch� c�c ng��i v�c x�c ��n ��y.",
	[9] = "H�i Chi�n Long Ch�u �� k�t th�c, %s �� gi�nh chi�n th�ng. Ch� v� anh h�ng ��u bi�u hi�n r�t xu�t s�c, c� th� ��n t�m <color=yellow>H�i Chi�n Ti�p D�n S�<color>�� nh�n ph�n th��ng.",
	[10] = "H�i Chi�n Long Ch�u �� k�t th�c, %s �� gi�nh chi�n th�ng. Ch� v� anh h�ng ��u bi�u hi�n r�t xu�t s�c, c� th� ��n t�m <color=yellow>H�i Chi�n Ti�p D�n S�<color>�� nh�n ph�n th��ng.",
	[11] = "H�i Chi�n Long Ch�u �� k�t th�c, qu�n ��ch v� ta b�t ph�n th�ng b�i. Ch� v� anh h�ng ��u bi�u hi�n r�t xu�t s�c, c� th� ��n t�m <color=yellow>H�i Chi�n Ti�p D�n S�<color>�� nh�n ph�n th��ng.",
	[12] = "K� th� tr��c m�t v�y m� d�m ng� g�t, ng��i ��u l�i ra cho ta!",
	[13] = "D��ng Th�t T�: Ti�u T�n, h�y mau ra ��y �ng chi�n.",
	[14] = "D��ng Th�t T�: ti�u t�, �� s� ta ch�a, b�n c� n��ng c� ph�i d� hi�p ��p.",
	[15] = "Ti�u T�n: hahaha, ti�u nha ��u ��nh v�i ta, c�n s�m v�i n�m, h�y v� luy�n th�m �i.",
	[16] = "Ti�u T�n: haha, h�m nay ��i th�ng, quay v� �n m�ng n�o!",
	[17] = "Li�u qu�n �� ph�i H�a Thuy�n ra tr�n",
	[18] = "Ti�u T�n: ti�u nha ��u, h�y xem s� l�i h�i c�a ta, ��t ch�y ch�ng!",
	[19] = "T�ng qu�n �� ph�i H�a Thuy�n xu�t tr�n",
	[20] = "D��ng Th�t T�: ti�u t� h�y xem ta ��t s�ch doanh tr�i c�a ng��i ��y.",
	[21] = "R��ng h� tr� �� xu�t hi�n",
	[22] = "H�a thuy�n phe T�ng �� th�nh c�ng ��t nh�p doanh trai Li�u, �i�m chi�n ��u c�a Li�u qu�n gi�m m�nh.",
	[23] = "H�a thuy�n phe Li�u �� th�nh c�ng ��t nh�p doanh trai T�ng, �i�m chi�n ��u c�a T�ng qu�n gi�m m�nh.",
	[24] = "H�a thuy�n phe T�ng �� b� ph� h�y, �i�m chi�n ��u c�a T�ng qu�n b� gi�m thi�u",
	[25] = "H�a thuy�n phe Li�u �� b� ph� h�y, �i�m chi�n ��u c�a Li�u qu�n b� gi�m thi�u",
	[26] = "D��ng Th�t T� �� b� ��nh b�i, �i�m chi�n ��u T�ng qu�n gi�m 15",
	[27] = "Ti�u T�n �� b� ��nh b�i, �i�m chi�n ��u Li�u qu�n gi�m 15",
}
--=========�쳣�ַ���
tSTRING_MISSION_LOG = {
	[1] = "[H�i Chi�n Long Ch�u]: b�t ��u l�i kh�ng x�c ��nh",
	[2] = "[H�i Chi�n Long Ch�u]: FreeDynamicMap l�i, nRetCode:",
	[3] = "[H�i Chi�n Long Ch�u]: LZZ_GetMSPlayerIndex h�m s� g�p s� c� s� ng��i trong tr�n doanh so v�i getn(tIndex) s� l��ng kh�ng gi�ng nhau. S� ng��i trong tr�n doanh l�:",
	[4] = "[H�i Chi�n Long Ch�u]: LZZ_OperateAllPlayer(), ti�p d�n c�a ng��i ch�i trong IDTab nh� h�n ho�c b�ng 0",
	[5] = "[H�i Chi�n Long Ch�u]: kh�i ��ng ��ng nh�p th�t b�i",
	[6] = "[H�i Chi�n Long Ch�u]: k� n�ng ID: %d x�a th�t b�i",
	[7] = "[H�i Chi�n Long Ch�u]: x�a thuy�n r�ng th�t b�i",
}
--============�캽Ա���
tSTRING_PILOT_NPC = {
	[1] = "Ta mu�n v�o chi�n tr��ng/begin_fight",
	[2] = "Ta ch� ti�n ���ng gh� ngang/do_nothing",
}

--==========Ư�������
tSTRING_FLOAT_BOX = {
	[1] = "Nh�n ���c hi�u �ng: t�ng s�t th��ng, duy tr� trong 30 gi�y, hi�u qu� kh�ng c�ng d�n.",
	[2] = "Nh�n ���c hi�u �ng: t�ng ph�ng ng�,  duy tr� 30 gi�y, hi�u qu� kh�ng c�ng d�n",
	[3] = "Nh�n ���c hi�u �ng: t�ng t�c �� di chuy�n, duy tr� 30 gi�y, hi�u qu� kh�ng c�ng d�n.",
	[4] = "Nh�n ���c hi�u �ng: tr�ng th�i �n th�n, duy tr� 30 gi�y, n�u chuy�n sang chi�n ��u tr�ng th�i �n th�n s� bi�n m�t, hi�u qu� kh�ng c�ng d�n.",
}