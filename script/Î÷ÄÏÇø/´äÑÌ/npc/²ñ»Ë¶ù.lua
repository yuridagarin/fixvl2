-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC�ʷ��Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- ֱ���Լ������İɣ�

--�峤��2009-03-09 ����ʵ�ʵĶ���
--��ǰ���Ǽ����߻���һ����������������ʱ���Ľ����������һ���߻��㼸��������
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- ʦ����������ͷ�ļ�
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ��������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
TASKID_CUIYAN_JOIN_TASK = 1019
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018}
NPC_NAME = "<color=green>S�i Ho�ng Nhi<color>: "
function main()
	local t_dia_sel = {
		"Ngu�n g�c Th�y Y�n/say1_1",
		"V� c�ng Th�y Y�n/say1_2",
		"�i�u ki�n nh�p m�n/say1_3",
		--"��Ҫ�������/say1_4",
		"Ta mu�n l�m nhi�m v� S� M�n/#ftask_repeat_main(10)",
		--"�չ�����/#practice_main(10)",
		"Ta s�p th�nh th�n n�n ph�i xu�t s�/#faction_graduate(10)",
		"Ch�o h�i ch��ng m�n/end_dialog"
	}
		Say(NPC_NAME.."Th�y Y�n b�n m�a ��u l� m�a xu�n, hoa r�i l� t�, ng��i t�i t� t�.",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	
function say1_1()
	Talk(4,"main",
		NPC_NAME.." V�o n�m ���ng Minh Ho�ng, An L�c S�n ph�n lo�n, b� t�nh l�m than. H� v� t� b�o v� m� l�p n�n c�c nh�m trong d�n gian, trong �� Th�y Y�n M�n do �V� N��ng� t�o th�nh. Trong chi�n lo�n, c�c m�n ph�i ��u kh� kh�n, ph�i ta linh ho�t n�n c� kh�ng gian sinh t�n, t� �� thu h�t ng�y c�ng nhi�u v� l�m nh�n s� gia nh�p.",
		NPC_NAME.."Nh�ng ��n khi 2 k� t�i v� h�c L�u C�nh v� L�u Th��ng xu�t hi�n m�i l�m ph�i ta th�nh m�n ph�i v� l�m th�t s�. Huynh �� L�u th� chia v� c�ng b�n ph�i th�nh 2 h��ng: Linh N� gi�i v� �i�u khi�n Ti�u �i�u v� V� Ti�n gi�i m�a, ��i sau g�i h� l� �Th�y Y�n Nh� T�. Sau �� L�u C�nh m�t s�m, L�u Th��ng g�p t�nh bi�n, t�c gi�n �u�i h�t �� t� nam, ch� thu n�p n� �� t�.",
		NPC_NAME.." Cu�i ��i ���ng, chi�n tranh l�i n�i l�n, c�c m�n ph�i lo ch�ng ta th�a l�c h�n lo�n m� r�ng th� l�c n�n �� �u�i b�n m�n kh�i Trung Nguy�n. Ch��ng m�n S�i Ho�ng Nhi c� kh�c m�c v�i T�ng ��nh n�n c� th�i �� th� ��ch v�i c�c m�n ph�i Trung Nguy�n, do v�y kh�ng c� ��ng minh trong giang h�.",
		NPC_NAME.."B�n m�n n�i danh giang h� kh�ng ch� v� v� c�ng v��t tr�i, c�n v� c�c �� t� ��u l� m� n� tuy�t s�c, khi�n v� s� nam nh�n giang h� si m�. C�c B�ch Hoa S�, ai c�ng hoa nh��ng nguy�t th�n, chim sa c� l�n."
		)
end
function say1_2()
	Talk(3,"main",
		NPC_NAME.."V� c�ng b�n m�n g�m 2 ph�i, <color=yellow>V� Ti�n<color> v� <color=yellow>Linh N�<color>. <color=yellow>M�u ��n S� Chu T� V�n<color> truy�n v� c�ng <color=yellow>V� Ti�n<color>, v� c�ng <color=yellow>Linh N�<color> do <color=yellow>T��ng Vi S� H� Man Th�nh<color> truy�n th�.",
		"<color=yellow>V� Ti�n<color> ch� d�nh cho n� nh�n bi�t v� ��o. Th�i ���ng c� C�ng T�n ��i n��ng khi m�a ki�m kh� vang d�i t� ph��ng. V� ��o b�n m�n l� v� ��o h�a t�m � b�n th�n v�o �i�u m�a, ng��i xem lay ��ng theo t�m � ng��i m�a. K� ��ch nh�n v�o, s� m�t h�t � ch� chi�n ��u. H�o h�u nh�n v�o, � ch� chi�n ��u t�ng cao, c� th� h�c ���c k� n�ng tr�n ph�i <color=yellow>Loan Ph�ng C�u Thi�n<color>.",
		"<color=yellow>Linh N�<color> ch� d�nh cho n� nh�n c� t�m h�n t� do. Linh N� h�a h�p v�i v�n v�t n�n ���c nhi�u ��ng v�t nh� qu� m�n, h� nu�i �i�u l�m b�n, khi chi�n ��u c�ng kh�ng ch� Ti�u �i�u s�t th��ng ��ch. Ng��i v� �i�u ph�i h�p, uy l�c phi th��ng, �i�u h�nh ��ng theo l�nh khi�n k� th� b� cho�ng v� gi�n �o�n v� c�ng, kh�ng ���c xem th��ng, c� th� h�c ���c v� c�ng tr�n ph�i <color=yellow>C�u V� Hoa Ti�n Quy�t<color>"
		)
end
function say1_3()
	Talk(1,"main","<color=green>S�i Ho�ng Nhi<color>: Giai nh�n tuy�t s�c trong thi�n h� ch� c�n c� t�m l�ng l��ng thi�n, kh�ng ph�i ph�n �� b�n m�n, ��u ���c gia nh�p b�n m�n, nh�ng �� t� sau khi nh�p ph�i ph�i y�u th��ng nhau, kh�ng ���c qua l�i v�i nam nh�n.")
end 
function say1_4()
	local task_step = GetTask(TASKID_CUIYAN_JOIN_TASK)
	local s_dia_no_pass = ""
	if GetSex() == 1 then
		 s_dia_no_pass = "Thi�u hi�p ���ng xa ��n ��y, th�t v�t v�. Nh�ng Th�y Y�n M�n kh�ng nh�n <color=red>�� t� nam<color>."
	elseif GetLevel() < 10 then
		s_dia_no_pass = "Ng��i kh�ng �� c�p, ��t c�p <color=red>10<color> h�y ��n t�m ta."
	elseif GetPlayerRoute() ~= 0 then
		s_dia_no_pass =  "N� hi�p �� c� <color=red>m�n ph�i<color>, ta kh�ng th� nh�n."
	elseif GetPlayerFaction() == 8 then
		s_dia_no_pass =  "Ng��i �� l� ng��i c�a Th�y Y�n M�n, mau �i luy�n c�ng."
	else
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			if GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
				s_dia_no_pass = "N� hi�p �� nh�n nhi�m v� nh�p m�n c�a m�n ph�i kh�c, kh�ng th� gia nh�p b�n m�n."
				break
			end
		end
	end
	if task_step == 5 then
		Talk(2,"",
			NPC_NAME.."Kh�ng sai, hai v� <color=green>B�ch Hoa S�<color> r�t h�i l�ng v� ng��i, ng��i c� th� gia nh�p b�n m�n, nh�p m�n ph�i tu�n th� quy ��nh, kh�ng ���c qua l�i v�i nam nh�n.",
			NPC_NAME.."V� c�ng b�n m�n g�m <color=yellow>V� Ti�n<color> v� <color=yellow>Linh N�<color>, sau khi nh�p m�n ng��i c� th� t�m <color=yellow>Chu T� V�n<color> ho�c <color=yellow>H� Man Th�nh<color> �� h�c, <color=yellow>Chu T� V�n<color> tinh th�ng v� ��o, ng��i c� th� h�c ���c �i�u nh�y m� ho�c v� t�m ph�p say h�n c�a n�ng �y; <color=yellow>H� Man Th�nh<color> t� nh� y�u ��ng v�t, r�t th�ch nu�i �i�u, k� n�ng d�ng Ti�u kh�ng ch� <color=yellow>Ti�u �i�u<color> �� ��t ��n m�c xu�t qu� nh�p th�n."
		)
		SetPlayerFaction(10)
		SetPlayerRoute(28)
		TaskTip("Ng��i �� gia nh�p Th�y Y�n M�n")
		SetTask(TASKID_CUIYAN_JOIN_TASK,6)
	elseif s_dia_no_pass == "" then
		if task_step == 0 then
			Talk(2,"",NPC_NAME.."Giai nh�n tuy�t s�c trong thi�n h� c� th� gia nh�p b�n m�n, nh�ng ng��i ph�i b�i ki�n hai v� <color=green>B�ch Hoa S�<color> trong Th�y Y�n M�n, h� s� n�i ng��i bi�t n�n l�m th� n�o, h�y t�m <color=green>M�u ��n S� Chu T� V�n<color> (190/170) tr��c.","<color=green>Ng��i ch�i<color>: ���c, ta �i ngay!")
			TaskTip("T�m M�u ��n S� Chu T� V�n")
			Msg2Player("T�m M�u ��n S� Chu T� V�n (190/170)")
			SetTask(TASKID_CUIYAN_JOIN_TASK,1)
			return
		else
			Talk(1,"",NPC_NAME.."Mu�n v�o b�n m�n h�y t�m <color=yellow>Chu T� V�n<color> ho�c <color=yellow>H� Man Th�nh<color>!")
			return
		end
	else
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	end
end

function say1_5()
	
end

function say1_6()
	
end

