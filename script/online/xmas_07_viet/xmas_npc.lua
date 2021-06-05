--
-- ������Ե�����2
-- xmas_npc.lua
-- 2007Խ��ʥ��� npc�ű�
-- 2007-12-12
-- by wuwei1
--

Include("\\script\\online\\xmas_07_viet\\xmas_head.lua");

function main()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	if xmas_v07_is_open() == 1 then
		Say(npc_name.."Gi�ng sinh vui v�! Ta c� r�t nhi�u qu� mu�n t�ng cho m�i ng��i! Trong th�i gian di�n ra ho�t ��ng, m�i ng�y c�c cao th� v� l�m c� th� nh�n l�y 1 l�n!", 
			4,
			"nh�n qu� Gi�ng sinh/xmas_give_gift",
			"Xem n�i dung ho�t ��ng./xmas_help",
			"T�m hi�u c�ch tr�ng c�y th�ng v� ph�n th��ng/xmas_plant",
			"T�m bi�t!/nothing");
	else
		Say(npc_name.."Sau Gi�ng Sinh c�ng vui v�!", 0);
	end
end

function xmas_help()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	Talk(3,"",
	npc_name.."M�i d�p Gi�ng Sinh v�, ch�ng ta c�ng nhau ch�c m�i ng��i tr�n th� gian c� nhi�u ni�m vui.",
	npc_name.."M�i ng�y c� th� ��n ��y nh�n 1 <color=yellow>Nh�nh Th�ng Gi�o H�i<color> v� 3 <color=yellow>v�t ph�m trang tr�<color>. B�n c� th� tr�ng <color=yellow>Nh�nh Th�ng Gi�o H�i<color> v� treo <color=yellow>v�t ph�m trang tr�<color> �� th�ng c�p c�y, nh�n ���c c�c ph�n th��ng!",
	npc_name.."M�i ng�y khi b�n l�m nhi�m v� Th��ng H�i v� nhi�m v� S� M�n c� th� nh�n ���c <color=yellow>nh�nh th�ng m� l�<color> v� <color=yellow>v�t ph�m trang tr�<color>, c�ch tr�ng gi�ng v�i tr�ng <color=yellow>c�y th�ng Gi�o H�i<color>."
	);
end

function xmas_give_gift()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	local ndate = tonumber(date("%Y%m%d"));
	local nlast_date = GetTask(TASKID_XMAS_JH_GIFT);
	if ndate > nlast_date then
		if gf_Judge_Room_Weight(5, 10) == 0 then
			Say( npc_name.."H�nh trang v� s�c l�c c�a b�n kh�ng ��, d�n d�p h�nh trang r�i h�y quay l�i!.", 0);
			return 0;
		end
		SetTask(TASKID_XMAS_JH_GIFT, ndate);
		gf_SetLogCaption("xmas");
		gf_AddItemEx( {2, 0, 573, 1, 1}, "Nh�nh th�ng gi�o h�i");
		gf_AddItemEx( {2, 0, 577, 3, 1}, "3 v�t ph�m trang tr� th�ng Gi�o H�i");
		gf_SetLogCaption("");
	else
		Say( npc_name.."H�m nay b�n �� nh�n v�t ph�m, m�i ng�y ch� c� th� nh�n 1 l�n. Ng�y mai h�y quay l�i tham gia ho�t ��ng!", 0);
	end
end

function xmas_plant()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	Talk(5,"",
	npc_name.."Trong th�i gian ho�t ��ng, t� <color=yellow>22-12-2007<color> ��n <color=yellow>06-01-2008<color>, t�i 3 th�nh Tuy�n Ch�u, Th�nh ��, Bi�n Kinh ng��i ch�i c� th� tr�ng c�y th�ng.\n C�ch th�c nh� sau: nh�p chu�t ph�i v�o c�nh th�ng gi�o h�i ho�c c�nh th�ng m� l�,l�m theo h��ng d�n �� tr�ng c�y.\n B�n c� th� trang tr� c�y th�ng b�ng c�ch treo v�t trang tr� l�n ��..",
	npc_name.."V�o <color=red>ph�t th� 5, 10, 15<color> ng��i ch�i c� th� treo v�t trang tr� l�n th�ng gi�o h�i, m�i l�n s� m�t 2 ph�t �� ho�n th�nh vi�c treo qu�, n�u kh�ng th� ph�i ��i l�n treo qu� k� ti�p, � <color=red>ph�t th� 5, 7,9,11,13,15<color> ng��i ch�i c� th� treo v�t trang tr� l�n th�ng m� l�, m�i l�n t�n 1 ph�t �� ho�n th�nh vi�c treo qu�, n�u kh�ng th� ph�i ��i l�n treo qu� k� ti�p..",
	npc_name.."Sau giai �o�n treo qu�, ng��i ch�i s� nh�n ���c ph�n th��ng.n\ph�n th��ng c�y th�ng gi�o h�i l� 1 m�n ngo�i trang ng�u nhi�n v� 1000, 2000 ��n 5000 �i�m kinh nghi�m, �i�u ki�n �� nh�n l� c�n treo 3 m�n v�t trang tr�.\n Ph�n th��ng c�y th�ng m� l� s� c�n c� v�o t�ng �i�m c�a v�t trang tr�..",
	npc_name.."�i�m s� trang tr� t��ng �ng: \n  Lo�i v�t trang tr�        �i�m\n    V�t trang tr� 1        1    \n    V�t trang tr� 2        2\n    V�t trang tr� 3        3\n    V�t trang tr� 4        4",
	npc_name.."Ph�n th��ng t��ng �ng:\n    T�ng �i�m        Ph�n th��ng\n    3-5            5 ��i Ho�n ��n    \n    6-9            5 B�ch V�n T�n\n    10-15        5 Ng�c Linh T�n\n    16-18        10 H�i Th�nh Ph� \n    19-21        1 Ti�u Ki�p T�n\n    22-24        1  Th�n N�ng ��n"
	);	
end

	