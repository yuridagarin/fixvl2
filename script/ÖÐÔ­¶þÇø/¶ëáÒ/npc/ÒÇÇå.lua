function main()
	Say("<color=green>Nghi Thanh<color>: Tu�n theo � ch� c�a tr��ng b�i, truy�n ��t t�n ch� c�a Nga My.",0)
end;

function start()
	Talk(1,"start2","Tuy�t k� Nga My l� �i�u m�a ki�m c� t� th�i ���ng nh�ng ���ng ki�m uy�n chuy�n kh�ng gi�ng ki�m ph�p c�a nam nh�n, giang h� g�i l� Ng�c N� ki�m ph�p ho�c Nga My ki�m. Sau �� c� �� t� ��n n�i Nga My khai s�n l�p ph�i n�n h�i �m v�i t�n g�i t� �� truy�n cho ��n nay.")
end;

function start2()
--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  ��ɽ�������õı��� Task(107) ����6��Bit����¼������������ÿ��Bit�ֱ��ʾ ����/ؤ��/�䵱/����/����/�ӵ�������
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 2) == 0) then
		SetTask(107, SetBit(GetTask(107), 2, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  ʮ������������ɺ����������������
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("Ng��i c�n mu�n h�i g� n�a?",0)
end;

function zuzhi()
	Talk(1,"start2","Tr�n d��i Nga My ph�i c� Ch��ng m�n, th� nghi�p s� th�i, Nga My �� t�. Ch��ng m�n b�t bu�c ph�i do �� t� xu�t gia ��m nhi�m.")
end;

function tiaojian()
	Talk(1,"start2","Mu�n gia nh�p Nga My ph�i l� n� gi�i, ch�a gia nh�p m�n ph�i kh�c.")
end;

function rule()
	Talk(1,"start2","Ph�m l� �� t� Nga My, h�nh thi�n t�ch ��c, kh�ng ���c k�t giao t� ph�i. �� t� xu�t gia ph�i tu�n th� gi�i lu�t Ph�t m�n.")
end;


function task()
	Talk(1,"start2","Sau khi �� t� nh�p m�n Nga My c� th� t�m Ch��ng m�n nh�n nhi�m v� s� m�n, m�i ng�y li�n t�c ho�n th�nh 20 nhi�m v� s� nh�n ���c 2 gi� nh�n ��i kinh nghi�m.")
end;


function skill()
	Talk(1,"start2","Nga My c� Xu�t gia v� T�c gia, �� t� xu�t gia h�c ki�m do Tu� T�m S� Th�i truy�n th�, t�c gia �� t� h�c c�m do Hu� �m S� Th�i truy�n th�.")
end;

function guanxi()
	Talk(1,"start2","�� t� b�n ph�i h�nh t�u giang h� n�n ch� �, V� �ang, Thi�u L�m l� h�o bang c�a Nga My. C�i Bang, ���ng M�n, Th�y Y�n, C�n L�n, Thi�n Ba Ph� c� m�i quan h� trung l�p v�i Nga My. Ng� ��c, Minh Gi�o ��i ngh�ch v�i Nga My.")
end;

function no()
end;