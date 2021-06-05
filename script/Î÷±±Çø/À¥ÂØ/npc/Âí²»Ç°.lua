-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC��ǰScript
-- By StarryNight
-- 2007/08/16 AM 10:24

-- ���������Ҫ��������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
NPC_NAME = "<color=green>M� B�t Ti�n<color>: "
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
function main()
	if tGtTask:check_cur_task(139) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end	
	--һ������µĶԻ�
	strTalk = {
		{"V� c�ng c�a ta trong ph�i kh�ng nh�t c�ng nh� nh�ng tr��ng m�n s� huynh l�i kh�ng ch�u nh��ng ch�c tr��ng m�n, th�t l� t�c."},
		{"N�u ta ���c l�m tr��ng m�n nh�t ��nh C�n L�n s� th�nh v� l�m �� nh�t ��i ph�i."},
		}
	local i = random(1,getn(strTalk));
	local n_task_step = GetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID])
	if n_task_step == 0 or GetPlayerFaction() == KUN_FACTION_ID then
		TalkEx("",strTalk[i]);
		return
	elseif n_task_step == 1 then
		Talk(6,"",
			NPC_NAME.."Ng��i kh�ng ph�i �� t� b�n m�n, t�m ta c� chuy�n g�?",
			PLAYER_NAME.."Ta mu�n gia nh�p <color=yellow>C�n L�n Ph�i<color>, Chu Ch��ng M�n b�o ta ��n t�m ng��i.",
			NPC_NAME.."Mu�n v�o <color=yellow>C�n L�n Ph�i<color> ph�i qua ���c kh�o nghi�m c�a ta ��.",
			PLAYER_NAME.."��o tr��ng c� c�n d�n, ta s� l�m theo.",
			NPC_NAME.."�, ng��i ��n th�t ��ng l�c, g�n ��y t�i h�u s�n <color=yellow>Thi�n Nguy�n Th�p<color> ��m <color=yellow>H� Y�u<color> l�i mu�n ph� phong �n c�a Thi�n Nguy�n Ph�p Tr�n, c�n d�ng <color=yellow>Thi�n S� Ph�<color> �� duy tr�, ng��i h�y t�m <color=green>Mai B�t Dung<color> (195/204) l�y m�t t�m.",
			PLAYER_NAME.."���c, ta s� �i chu�n b�."
		)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],2)
		TaskTip("T�m Mai B�t Dung l�y 1 Thi�n S� Ph�")
		Msg2Player("T�m Mai B�t Dung (195/204) l�y 1 Thi�n S� Ph�, r�i giao cho M� B�t Ti�n (197/203)")
		return
	elseif n_task_step == 2 and GetItemCount(2,0,779) == 1 then
		Talk(5,"",
			NPC_NAME.."���c l�m, nh�ng ng��i ph�i qua kh�o nghi�m 2 c�a ta.",
			PLAYER_NAME.."��",
			NPC_NAME.."<color=yellow>C�n L�n Ph�i<color> ta v�n chia 2 h� Luy�n Thu�c v� Thi�n S�, ti�c r�ng Luy�n Thu�c �� th�t truy�n, ch� c�n l�i Thi�n S�, ng��i mu�n gia nh�p <color=yellow>C�n L�n Ph�i<color> th� ph�i c� can ��m ��i m�t v�i y�u ma.",
			NPC_NAME.."Ng��i mang Thi�n S� Ph� n�y t�i h�u s�n <color=yellow>Thi�n Nguy�n Th�p<color> t�m <color=yellow>Thi�n Nguy�n Ph�p Tr�n<color> (197/194), d�n <color=yellow>Thi�n S� Ph�<color> Th�ch Tr�, ph�p tr�n s� ti�p t�c phong �n <color=yellow>H� Y�u<color>. N�u l�m m�t Thi�n S� Ph�, c� th� t�m <color=green>Mai B�t Dung<color> l�y th�m.",
			PLAYER_NAME.."Ta s� l�m theo l�i d�n c�a ��o tr��ng."
		)
			TaskTip("T�i h�u s�n Thi�n Nguy�n Th�p d�ng Thi�n S� Ph� k�ch ho�t Thi�n Nguy�n Ph�p Tr�n phong �n H� Y�u")
			Msg2Player("T�i h�u s�n Thi�n Nguy�n Th�p (197/194) d�ng Thi�n S� Ph� k�ch ho�t Thi�n Nguy�n Ph�p Tr�n phong �n H� Y�u")
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],3)
			return
	elseif n_task_step == 4 then
		Talk(2,"",
			NPC_NAME.."Thi�u hi�p ho�n th�nh nhi�m v� xu�t s�c, l�o phu r�t h�i l�ng, C�n L�n Ph�i ch�o m�ng thi�u hi�p gia nh�p, ta �� ��ng k� danh s�ch, c� th� �i t�m Ch��ng M�n (199/200).",
			PLAYER_NAME.."�a t� ��o tr��ng."
			)
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],5)
		TaskTip("T�m Chu B�t Ho�c")
		Msg2Player("T�m Chu B�t Ho�c (199/200)")
	else
		Talk(1,"",NPC_NAME.."Mu�n v�o ph�i ph�i v��t qua kh�o nghi�m c�a ta!")
		return
	end	
end
