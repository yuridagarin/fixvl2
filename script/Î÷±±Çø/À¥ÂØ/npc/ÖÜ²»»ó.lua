-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC�ܲ���Script
-- By StarryNight
-- 2007/08/16 AM 10:26

-- ������������Ρ���

-- ======================================================
--�峤2009-3-12����ʵ�ʶ���
--��û�����߻�NB
-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>Chu B�t Ho�c<color>: "
PLAYER_NAME = "<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!"
KUN_FACTION_ID = 8
TB_FACTION_TASKID_LIST = {1002,1003,1004,1005,1031,1032,1033,1017,1018,1019,1001}
KUN_FACTION_TASK_FINISH = 5

function main()
	local dia_sel = {
		"Ngu�n g�c C�n L�n/say1_1",
		"V� c�ng C�n L�n/say1_2",
		"�i�u ki�n nh�p m�n/say1_3",
		--"��Ҫ��������/say1_4",
		"Ta mu�n l�m nhi�m v� S� M�n/#ftask_repeat_main(8)",
		--"�չ�����/#practice_main(8)",
		"Ta d� ��nh th�nh th�n n�n mu�n xu�t s� /#faction_graduate(8)",
		"Ch�o h�i ch��ng m�n/end_dialog",
	}
	Say(NPC_NAME.."C�n L�n s�ng s�ng, ti�n kh� bao quanh, l� th�nh ��a tu t�m d��ng t�nh.",
		getn(dia_sel),dia_sel
	)
end;
--��������Դ
function say1_1()
	Talk(3,"main",
		NPC_NAME.."Ph�i ta � T�y V�c xa x�i �t khi v�o Trung Nguy�n. Do �� nh�ng ph�i kh�c kh�ng hi�u v� b�n ph�i. Cho ��n khi ta ph�i m�t k� t�i t�i Trung Nguy�n l�p ���c uy danh hi�n h�ch, ph�i ta m�i ���c c�c ��i m�n ph�i ch� �.",
		NPC_NAME.."Tr��c gi� ph�i ta lu�n �n c� chuy�n t�m tu h�nh, kh�ng tranh danh l�i th� t�c. Nh�ng m�t khi xu�t hi�n y�u ma th� ph�i h�t s�c di�t tr�.",
		NPC_NAME.."Trung Nguy�n g�n ��y y�u ma ho�nh h�nh, n�n �� t� trong ph�i �i kh�p n�i gi�ng ma ph�c y�u. Nh�ng c�c m�n ph�i kh�c l�i nghi ng� h�nh ��ng c�a ph�i ta, n�n b�n kh�i kh�ng c� ��ng minh trong v� l�m."
	)
end
--�������书
function say1_2()
	Talk(3,"main",
		NPC_NAME.."V� h�c b�n ph�i c� 2 nh�nh Thi�n S� v� Ki�m T�n. Thi�n S� chia l�m 2 h� phong l�i. Ki�m T�n d�ng kh� ng� ki�m, theo �u�i c�nh gi�i t�i cao nh�n ki�m h�p nh�t.",
		NPC_NAME.."Thi�n S� l�i quy�t uy l�c v� c�ng, d�ng �� tr� ma ph�c y�u, ��i th� mu�n ch�ng l�i ���c uy l�c c�a n� ph�i ti�u hao th�m n�i l�c. N�u b� thi�n l�i ��nh tr�ng d� l� cao th� c�ng ph�i h�n m�. Phong quy�t linh ho�t, c� th� che gi�u b�n th�n, l��t �i nh� gi�. V� h�c b�n m�n v�n bi�n h�a �a d�ng, l�i d�ng phong quy�t �� t�ng t�c b�n th�n, c� th� g�i cu�ng phong, bao v�y �� ��i th� kh�ng th� h�nh ��ng. Ki�m T�n c� th� luy�n h�a linh ki�m, d�ng kh� ng� ki�m, ki�m thu�t t� nhi�n, l�y nhanh ��nh ch�m, chi�m th� th��ng phong, Ki�m T�n tu luy�n ��n c�nh gi�i nh�n ki�m h�p nh�t th� ki�m chi�u h�a th�nh v� h�nh.",
		NPC_NAME.."V� c�ng <color=yellow>Thi�n S�<color> C�n L�n do <color=yellow>T�n B�t Tr�<color> truy�n th�, c� th� h�c ���c k� n�ng tr�n ph�i <color=yellow>V� C�c Phong L�i Quy�t<color>! V� c�ng <color=yellow>Ki�m T�n<color> C�n L�n do <color=yellow>V�n Hy H�a<color> truy�n th�, c� th� h�c ���c k� n�ng tr�n ph�i <color=yellow>V�n Ki�m H�a V� Tr�n<color>!"
	)
end
--��������
function say1_3()
	Talk(1,"",NPC_NAME.."V� c�ng C�n L�n v�n <color=yellow>ch� truy�n cho nam<color>, n�n b�n gi�o ch� cho <color=yellow>nam<color> gia nh�p, nam nhi ch�a gia nh�p ph�i kh�c v� kh�ng ph�i ph�n �� ��u c� th� v�o.")
end
--��Ҫ��������
function say1_4()
	--�ȼ��ж�
	if GetLevel() <10 then
		Talk(1,"",NPC_NAME.."C�p kh�ng ��, ��t c�p <color=yellow>10<color> r�i quay l�i.")
		return
	end
	--�Ա��ж�
	if GetSex() == 2 then
		Talk(1,"",NPC_NAME.."N� hi�p th�nh t�m t�i C�n L�n h�c ��o ph�p, th�t ��ng khen, nh�ng v� c�ng C�n L�n ta ch� truy�n cho nam, ta kh�ng th� cho n� hi�p gia nh�p ���c.")
		return
	end
	--�����ж�
	if GetPlayerFaction() == KUN_FACTION_ID then
		Talk(1,"",NPC_NAME.."Ng��i �� l� �� t� ph�i C�n L�n, mau �i luy�n c�ng.")
		return
	end
	--�����ж�
	if GetPlayerFaction() > 0 then
		Talk(1,"",NPC_NAME.."Thi�u hi�p �� c� m�n ph�i, ta kh�ng th� nh�n.")
		return
	end
	--���������ж�
	local faction_task_step = without_other_factask(KUN_FACTION_ID) 
	if faction_task_step == -1 then
		Talk(1,"",NPC_NAME.."�� nh�n nhi�m v� c�a ph�i kh�c, kh�ng th� gia nh�p b�n ph�i.")
		return
	elseif faction_task_step == KUN_FACTION_TASK_FINISH then
		Talk(4,"",
			NPC_NAME.."�� t� b�n m�n c�n thanh t�m t�nh kh�, tu th�n d��ng ��c, chuy�n t�m tu luy�n.",
			PLAYER_NAME.."�� t� ph�i nh� s� hu�n, ch�m ch� tu luy�n.",
			NPC_NAME.."H�y t�m <color=green>T�n B�t Tr�<color> h�c v� c�ng, k� ngh� <color=yellow>C�n L�n Thi�n S�<color> do �ng �y truy�n th�, sau �� l�m quen nh�ng quy t�c kh�c.",
			PLAYER_NAME.."�� t� tu�n m�nh."
		)
		TaskTip("�� gia nh�p C�n L�n Ph�i")
		SetPlayerFaction(8)
		SetPlayerRoute(22)
		SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],6)
	else
		if faction_task_step == 0 then
			SetTask(TB_FACTION_TASKID_LIST[KUN_FACTION_ID],1)
			TaskTip("�i t�m M� B�t Ti�n ��i tho�i")
			Msg2Player("�i t�m M� B�t Ti�n (197/203) ��i tho�i")
		end
		Talk(1,"",NPC_NAME.."C�n L�n s�ng s�ng, thanh t�nh, l� th�nh ��a tu th�n d��ng t�nh. Ai c� ch� ��u c� th� gia nh�p b�n ph�i, chi ti�t nh�p m�n do <color=yellow>M� B�t Ti�n<color>(197/203) x� l�, ch� c�n �ng �y ��ng � l�o phu s� cho ng��i gia nh�p.")
	end
end
--������
function without_other_factask(faction_diff)
	for i = 1,getn(TB_FACTION_TASKID_LIST) do
		if i ~= faction_diff and GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
			return -1
		end
	end
	return GetTask(TB_FACTION_TASKID_LIST[faction_diff])
end
