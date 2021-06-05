
Include("\\script\\task\\faction\\faction_main_sl.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_SL);

	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue==2) then
		Say("Tr��c b�n t� c� m�t con su�i nh�, th� ch� ra �� t�m H�a C�ng ��u sau �� quay l�i g�p ta.",0);
		return
	elseif (nTaskValue==3) then
		task_006();
		return
	elseif (nTaskValue==4) then
		Say("Ph�m l� �� t� Thi�u L�m tr��c khi nh�p t� ph�i c�ng m�t b�t ch�o l�p b�t �� t� l�ng th�nh k�nh, nh�ng b�n t� l�i kh�ng c�. C� l� ng��i ph�i xu�ng ch�n n�i t�m H��ng kh�ch, h� th�nh t�m l� ph�t may ra c�.",0);
		return
	elseif (nTaskValue==6) and (GetItemCount(2,0,5) >= 1)   then
		task_012();
		return		
	else
		Say("Th� ch� mu�n t�m hi�u v� v�n �� g�?",0);
		return
	end

end;

function start()
	Talk(1,"start1","N�m Th�i H�a th� 19 vua V�n �� th�i B�c Ng�y. T�ng nh�n B�t �� t� Thi�n Tr�c ��n Trung Nguy�n. V�n �� l� ng��i hi�u l�, B�t �� nh�n th�y Tung S�n nh� m�t ��a sen b�n l�p t� khai s�ng Thi�u L�m. 30 n�m sau T�ng nh�n B� �� l�i t� nam Thi�n Tr�c ��n Thi�u L�m khai Thi�n T�ng, d�y v� h�c Thi�u L�m c�ng t� �� ph�t huy.")
end;

function start1()
	Talk(1,"start2","��u ��i ���ng, T�n V��ng L� Th� D�n v� V��ng Th� Sung giao chi�n k�ch li�t � L�c D��ng, V� t�ng Thi�u L�m l�c �� c�ng c� tham gia xu�t chi�n, nh�t c� th�nh c�m. T�n tu�i v� h�c Thi�u L�m c�ng t� �� m� d��c nhi�u ng��i bi�t ��n.")
end;

function start2()
--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  ��ɽ�������õı��� Task(107) ����6��Bit����¼������������ÿ��Bit�ֱ��ʾ ����/ؤ��/�䵱/����/����/�ӵ�������
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 6) == 0) then
		SetTask(107, SetBit(GetTask(107), 6, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  ʮ������������ɺ����������������
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end
	
	Say("Th� ch� mu�n t�m hi�u v� v�n �� g�?",0)
end;

function zuzhi()
	Talk(1,"start2","Thi�u L�m do Ph��ng Tr��ng l�m t�ng qu�n, d��i c� Gi�i lu�t vi�n, ��t Ma ���ng, La H�n ���ng, B�t Nh� ���ng, T�ng Kinh C�c, Ch�nh ��o l�c ��u t�a. �� t� ph�n l�: T�c gia, V� t�ng, Thi�n t�ng!")
end;

function tiaojian()
	Talk(3,"start2","Gia nh�p Thi�u L�m c�n 3 �i�u ki�n: Nam, ch�a gia nh�p m�n ph�i n�o, kh�ng ph�i l� ph�n �� c�a Thi�u L�m.","V�y nh�ng ng��i l�m vi�c �c kh�ng ���c v�o Thi�u L�m �?","��i ph�t t� bi ph� �� ch�ng sinh sao l�i ph�n bi�t l�nh d� � ��y?")
end;

function rule()
	Talk(1,"start2","C� 5 gi�i: S�t sinh, v�ng ng�, t� d�m, tr�m c��p, ki�ng m�n. Ph�m h� l� �� t� Thi�u L�m c�n ph�i tu�n th� nghi�m ng�t c�c gi�i tr�n.")
end;


function task()
	Talk(1,"start2","�� t� Thi�u L�m sau khi nh�p m�n c� th� ��n g�p Ph��ng Tr��ng �� nh�n nhi�m v� s� m�n, M�i khi ho�n th�nh 20 nhi�m v� nh�n ���c ph�n th��ng*2 �i�m kinh nghi�m trong 2 gi�.")
end;


function skill()
	Talk(1,"start2","Thi�u L�m c� 3 v� Cao t�ng: ��t Ma ���ng Huy�n Kh� truy�n th� v� c�ng Thi�u L�m V� T�ng, B�t Nh��c ���ng Huy�n Bi truy�n th� v� c�ng Thi�u L�m t�c gia, T�ng Kinh C�c Huy�n H�i truy�n th� v� c�ng Thi�u L�m Thi�n T�ng. C�n g� kh�ng hi�u ng��i c� th� ��n g�p 3 v� ��i s�!")
end;

function guanxi()
	Talk(1,"start2","Nga My, C�i Bang ��u l� b�ng h�u c�a Thi�u L�m. V� �ang, ���ng M�n, Th�y Y�n, C�n L�n ��u c� m�i quan h� v�i b�n t� r�t t�t, Ng� ��c l� C�u nh�n. C�c �� t� h�nh t�u giang h� ph�i c�n th�n.")
end;

function no()
end;