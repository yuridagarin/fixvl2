--���ʵ�
Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

tAllDialog = {
	[0] = {
			"Trong t� ��i c� 3 ngh� ��t b�y, qu�t d�n v� b�o k�ch ��m b�o s� th�ng tho�ng tr�n ���ng v��t �i.",
			"���ng nhi�n kh�ng th� thi�u ph�n c�a Ph�t mu�i mu�i r�i.",
			"Mang ��y �� v�t ph�m ��n ��y, n�u kh�ng c�c h� ph�i t�m t�i h� l�n n�a.",
			"V��t �i th�t b�i c� th� khi�u chi�n l�i, kh�ng c�n tho�t ra ��ng nh�p l�i.",
			"T�i h� s� n�i b� m�t c�a t�ng Boss cho c�c h� bi�t, b�i v� t�i h� l� Ng� Nh�n ��o v�n s� th�ng.",
			"Xin ��ng gian l�n nh� th� s� l�m m�t t�nh h�p d�n khi v��t �i.",
		},	
	[1] = {
			"Nh�m Doanh Doanh v� H��ng V�n Thi�n s� d�c s�c t��ng tr� cho c�c h�, h�y y�n t�m.",
			"Tr��c khi Ti�u D��ng xu�t hi�n h�y gi�t ch�t Th�ng Thi�n T� V� �� gi�m b�t �p l�c .",
			"Khi Ti�u D��ng c�ng k�ch s� nh�c nh� t�n m�c ti�u, h�y tr�nh xa khu v�c c� ng��i ch�i ��.",
			"M�c ti�u Ti�u D��ng gi�t s� h�i ph�c 10% sinh l�c, h�y b�o v� t�nh m�ng NPC c�a c�c h� v� h�o h�u .",
		},
	[2] = {
			"H�a L�c Th�t S�t ph�t n� trong 1 gi�y c� th� n� tr�nh ���c.",
			"M�i l�n Ph� Qu�n ti�u hao 10% sinh l�c s� v� ��ch trong m�t kho�ng th�i gian ng�n.",
			"Tham Lang v� c�ng hung d� nh�ng di chuy�n r�t ch�m ch�p.",
			"S�t th��ng 3 boss, l��ng m�u khi gi�t Ph� Lang s� gi�m xu�ng.",
			"Ti�ng k�u g�y ra s�t th��ng t�ng theo th�i gian, h�y nhanh ch�ng ti�u di�t.",
		},
	[3] = {
			"Ng�c M�ng Chi Hoa ���c Ph�c M�ng tri�u g�i lu�n xu�t hi�n t�i v� tr� ��c bi�t, h�y s�p x�p ng��i ph� h�y tr��c.",
			"Ng�c M�ng Chi Hoa ���c Ph�c M�ng tri�u g�i c� s�c m�nh v� bi�n, h�y c�ng nhau ph�i h�p ti�u di�t .",
			"Ng�c M�ng Chi Hoa tri�u g�i k� ti�p s� xu�t hi�n tr��c m�t c�c h�. ",
		},
	[4] = {
			"H� v� T�t Y�n tri�u g�i xu�t hi�n t�i v� tr� c� ��nh, s�p x�p ng��i �i ph� h�y tr��c.",
			"H� v� T�t Y�n tri�u g�i b� gi�m t�c, sau khi ��n ��nh T� ��n s� bi�n l�n m�nh kh�c th��ng. ",
			"Tr�nh xa ph�m vi T�t Y�n ph�ng th�ch s�t th��ng �� gi�m thi�u th� th��ng.",
		},
	[5] = {
			"��nh b�i t�t c� Ma Ki�m tr��c l�c Thu Ti�n T� ch�t.",
			"S�c m�nh Ma Ki�m kh�c nhau, h�a l�c c�ng kh�c nhau.",
			"Trong kho�ng th�i gian ng�n H��ng V�n Thi�n c�n c� Ma Ki�m c�n l�i tr�n chi�n tr��ng t�ng s�c c�ng k�ch cho Ma Ki�m v� ng��i ch�i.",
		},
	[6] = {
			"Chia c�t hai v� Tr��ng L�o �� gi�m  s�t th��ng.",
			"H�c Tr��ng L�o ngo�i ph�ng th�p, B�ch Tr��ng L�o n�i ph�ng th�p.",
			"��ng gi�t C� Tr�ng ���c ph�ng th�ch ra, h�y tr�nh xa.",
			"Sau khi gi�t xong m�t Tr��ng L�o ng��i c�n l�i ph�i b� ��nh b�i trong 20 gi�y, n�u kh�ng ng��i �� s� s�ng l�i.",
		},
	[7] = {
			"T� Hoa Th�nh L�c Phi c� s�c m�nh l�n r�t h�u �ch n�u trong t� ��i c�.",
			"T� Hoa Th�nh L�c Phi ph�ng th�ch H�ng T��ng Vi s�t th��ng Thu Ti�n T�, Ph�n Hoa H�ng c� t�c d�ng ch�a tr�, ��ng b� qua H�ng T��ng Vi, nh�ng ph�i gi� k� Ph�n Hoa H�ng.",
			"N�u kh�ng c� Ph�n Hoa H�ng ch�a tr� cho Thu Ti�n T�, trong 100 gi�y c�c h� ph�i ��nh b�i T� Hoa Th�nh L�c Phi.",
		},
	[8] = {
			"C�c h� kh�ng ch� t�m c� 3 cao th� xu�t ch�ng h� tr� m� c�n th�t b�i�",
		},
}

g_NpcName = "<color=green>Ng� Nh�n ��o<color>#"

function main()
	local strtab = {
			"\n r�i �i/wrd_leave_1",
			"\n T�i h� mu�n quay v� chi�n tr��ng (c�n [Th�ng Thi�n L�nh]x1)/wrd_goto",
			"\nK�t th�c ��i tho�i/nothing",
		}
	local nCurStage = GetMissionV(MV_STAGE);
	local nRand = 0;
	local strMsg = "";
	if tAllDialog[nCurStage] then
		if nCurStage == 0 then
			nRand = random(1,getn(tAllDialog[nCurStage]));
			strMsg = tAllDialog[nCurStage][nRand];
		else
			if random(1,100) <= 50 then
				nRand = random(1,getn(tAllDialog[nCurStage]));
				strMsg = tAllDialog[nCurStage][nRand];
			else
				nRand = random(1,getn(tAllDialog[0]));
				strMsg = tAllDialog[0][nRand];
			end
		end
	else
		nRand = random(1,getn(tAllDialog[0]));
		strMsg = tAllDialog[0][nRand];
	end
	Say(g_NpcName..strMsg,
		getn(strtab),
		strtab)
end

function wrd_leave_1()
	local strtab = {
			"\n ��ng n�i nhi�u l�i, t�i h� ph�i �i/wrd_leave_2",
			"\n ng�i quan s�t ch� th�ng quan/nothing",
		};
	Say(g_NpcName.."Thi�u hi�p ��ng t� b�, ��ng ��o v� l�m kh�ng ng�i x��ng r�i m�u �� chi�n ��u v� ch�nh ngh�a, Thi�u hi�p nh�n t�m r�i kh�i sao?",
		getn(strtab),
		strtab)
end

function wrd_leave_2()
	SetCreateTeam(0);
	LeaveTeam();
	NewWorld(500, 1736, 3043);
end

function wrd_goto()
	local nCurStage = GetMissionV(MV_STAGE);
	if tStartPos[nCurStage] then
		if DelItem(2,1,30409,1) == 1 then
			_stat_when_ib_consume(1)
			RestoreAll();
			ttd_setPos(tStartPos[nCurStage][1],tStartPos[nCurStage][2]);
			MissionAward_UpdateSpecialAward(ttd_all_award_tb.t_ib_award.t_special, "", 1, 0);
			gf_WriteLogEx("tongtian mission", "death back to mission IB cost", "", "Th�ng Thi�n L�nh", "2,1,30409,1");
		else
			Talk(1,"",g_NpcName.."C�c h� kh�ng �� Th�ng Thi�n L�nh B�i!")
		end
	end
end