--��ӵ�
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function main()

	if CheckTime(6) == 1 or CheckTime(0) == 1 then		--���������������������������
	    local szSay = {
	        "S� gi� ho�t ��ng: Ch�n T� �an ��i hi�p ���c tri�u ��nh �y th�c qu�n l� m�i vi�c li�n quan ��i h�i t� v� l�n n�y, h�y ��n Bi�n Kinh t�m anh ta, ho�t ��ng cu�i tu�n hi�n do ta ph� tr�ch!",
	        "Gi�p ��i T�ng t�m qu�n b�/supply_armament",
	        "Gi�p ��i T�ng chuy�n h�ng/deliver_goods",
	        "D�ng c�ng lao ��i b�o ��p/goto_liguan",
	        "Xem c�ng lao/query_offer",
	        "Gi�i thi�u chi ti�t ho�t ��ng cu�i tu�n/introduce_detail",
	        "K�t th�c ��i tho�i/end_say"
	    };
	    SelectSay(szSay);
	elseif CheckTime(5) == 1 then	--��ĩ��ʱ����л
	    local szSay = {
	        "S� gi� ho�t ��ng: Ch�n T� �an ��i hi�p ���c tri�u ��nh �y th�c qu�n l� m�i vi�c li�n quan ��i h�i t� v� l�n n�y, h�y ��n Bi�n Kinh t�m anh ta, ho�t ��ng cu�i tu�n hi�n do ta ph� tr�ch!",
	        "Gi�p ��i T�ng t�m qu�n b�/supply_armament",
	        "D�ng c�ng lao ��i b�o ��p/goto_liguan",
	        "Xem c�ng lao/query_offer",
	        "Gi�i thi�u chi ti�t ho�t ��ng cu�i tu�n/introduce_detail",
	        "K�t th�c ��i tho�i/end_say"
	    };
	    SelectSay(szSay);
	else
	    local szSay = {
	        "S� gi� ho�t ��ng: Ch�n T� �an ��i hi�p ���c tri�u ��nh �y th�c qu�n l� m�i vi�c li�n quan ��i h�i t� v� l�n n�y, h�y ��n Bi�n Kinh t�m anh ta, ho�t ��ng cu�i tu�n hi�n do ta ph� tr�ch!",
	        "Gi�i thi�u chi ti�t ho�t ��ng cu�i tu�n/introduce_detail",
	        "K�t th�c ��i tho�i/end_say"
	    };
	    SelectSay(szSay);
	end;
end;
