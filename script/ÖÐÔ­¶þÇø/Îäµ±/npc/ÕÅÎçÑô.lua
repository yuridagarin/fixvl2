
Include("\\script\\task\\faction\\faction_main_wd.lua"); -- ��������ͷ�ļ�

function main()

local nTaskValue = FN_GetTaskState(FN_WD);

	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue==2) then
		task_009();
		return
	elseif (nTaskValue==3) then
		Say("Kh� l�m! Gi� h�y ��n g�p Ch��ng m�n.",0);
		return
	else
		Say("Mu�n t�m hi�u g� v� V� �ang xin c� h�i.",0)
	end
	
end;

function start()
	Talk(1,"start2","L�o T� m� ��u ��o gia, h�u th� chia l�m 2 h� ph�i Thi�n S� v� Thu�n D��ng. Thi�n S� luy�n ph�, Thu�n D��ng luy�n ��n. V� �ang thu�c h� Thu�n D��ng")
end;

function start2()
--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  ��ɽ�������õı��� Task(107) ����6��Bit����¼������������ÿ��Bit�ֱ��ʾ ����/ؤ��/�䵱/����/����/�ӵ�������
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 4) == 0) then
		SetTask(107, SetBit(GetTask(107), 4, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  ʮ������������ɺ����������������
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("Ng��i c�n mu�n h�i g� kh�ng?",0)
end;

function zuzhi()
	Talk(1,"start2","V� �ang ph�i tr�n c� Ch��ng m�n, �� t� ��i th� nh�t v� �� t� ��i th� 2. Ch��ng m�n ph�i do �� t� xu�t gia ��m nhi�m.")
end;

function tiaojian()
	Talk(1,"start2","Mu�n gia nh�p V� �ang ph�i kh�ng l�m �i�u �c, ch�a gia nh�p m�n ph�i kh�c v� kh�ng ���c ph�n b�i b�n m�n.")
end;

function rule()
	Talk(1,"start2","Ph�m l� �� t� V� �ang kh�ng ���c l�m �i�u �c, kh�ng k�t giao t� ph�i. ��o gia �� t� ph�i tu�n th� thanh quy kh�ng ���c ph�m s�c gi�i.")
end;


function task()
	Talk(1,"start2","�� t� V� �ang sau khi nh�p m�n c� th� t�m Ch��ng m�n nh�n nhi�m v� m�n ph�i, m�i ng�y li�n t�c ho�n th�nh 20 nhi�m v� c� th� nh�n ���c 2 gi� nh�n ��i kinh nghi�m.")
end;


function skill()
	Talk(1,"start2","V� c�ng V� �ang chia l�m 2 h� ��o gia v� T�c gia. ��o gia �� t� theo ki�m do Du Ch�n Sinh ��o tr��ng truy�n th�. T�c gia �� t� d�ng b�t do ��i Ki�m Ch�u truy�n th�. N�i dung c� th� ng��i c� th� t�m 2 ��o tr��ng h�i r�.")
end;

function guanxi()
	Talk(1,"start2","�� t� b�n ph�i h�nh t�u giang h� h�y nh� C�i Bang, Nga My l� h�o bang c�a V� �ang. Thi�u L�m, ���ng M�n, Th�y Y�n, C�n L�n, Thi�n Ba Ph� c� m�i quan h� trung l�p v�i V� �ang. Ng� ��c, Minh gi�o lu�n ��i ngh�ch v�i V� �ang.")
end;

function no()
end;