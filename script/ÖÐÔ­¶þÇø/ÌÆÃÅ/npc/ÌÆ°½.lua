function main()
	Say("<color=green>���ng Ng�o<color>: ���ng M�n m�y tr�m n�m h�nh t�u giang h�, c�ng �� d�n d�n t�o l�p ���c danh ti�ng r�i.",0)
end;

function start()
	Talk(1,"start2","���ng M�n l� danh m�n � T� Xuy�n c� tr�m n�m nay. T� ��i ���ng Th�c Quy m�t tay d�ng n�n. ��n nay b�n ph�i c� 4 tuy�t k� �m kh�, h�a kh�, ��c d��c, c�m b�y.")
end;

function start2()
--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  ��ɽ�������õı��� Task(107) ����6��Bit����¼������������ÿ��Bit�ֱ��ʾ ����/ؤ��/�䵱/����/����/�ӵ�������
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 3) == 0) then
		SetTask(107, SetBit(GetTask(107), 3, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  ʮ������������ɺ����������������
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("<color=green>���ng Ng�o<color>: ���ng M�n m�y tr�m n�m h�nh t�u giang h�, c�ng �� d�n d�n t�o l�p ���c danh ti�ng r�i.",0)
end;

function zuzhi()
	Talk(1,"start2","���ng M�n do ���ng M�n L�o L�o ch��ng qu�n, m�i chuy�n do T�ng qu�n v� T� ph�ng t�ng qu�n ph� tr�ch, ���ng M�n L�o L�o do n� gi�i c� vai v� cao nh�t trong m�n ��m nhi�m, ng� ��i t�ng qu�n ph�i do �� t� tr�c h� ��m nhi�m.")
end;

function tiaojian()
	Talk(1,"start2","Gia nh�p ���ng M�n ph�i ��i h� ���ng, ch�a gia nh�p m�n ph�i kh�c.")
end;

function rule()
	Talk(1,"start2","Ph�m l� �� t� ���ng M�n, kh�ng ���c ti�t l� tuy�t k� b�n m�n, kh�ng ���c h�c l�n tuy�t k� b�n m�n, ai v� ph�m s� b� tr�ng tr� nghi�m kh�c.")
end;


function task()
	Talk(1,"start2","�� t� ���ng M�n sau khi nh�p m�n c� th� t�m L�o l�o nh�n nhi�m v� s� m�n, m�i ng�y ho�n th�nh li�n t�c 20 nhi�m v� c� th� nh�n ���c 2 gi� nh�n ��i �i�m kinh nghi�m.")
end;


function skill()
	Talk(1,"start2","V� c�ng ���ng M�n do T�ng qu�n ���ng Thi�n Ti�u ��ch th�n truy�n th�, h�y ��n �� t�m �ng ta.")
end;

function guanxi()
	Talk(1,"start2","Ng��i trong ���ng M�n ta h�nh t�u giang h� �n ��n o�n tr�, kh�ng c� nhi�u k� th� nh�ng h�o h�u c�ng ch�ng bao nhi�u.")
end;

function no()
end;