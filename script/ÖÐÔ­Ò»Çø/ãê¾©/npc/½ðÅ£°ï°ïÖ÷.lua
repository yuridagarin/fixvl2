--����
--�ص㣺�꾩 �������Ź�������3
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 15  )  then
		Talk(1,"say1401_3","Huynh ��i t��ng m�o uy nghi�m, �t ph�i l� Bang ch�. D�m h�i huynh ��i v� lai l�ch c�a t�m <color=yellow>B�n �� S�n H� X� T�c<color>?")
	elseif ( UWorld1401  == 20 and GetItemCount(2,1,34) >= 5 )then
				if  DelItem(2,1,34,5) == 1 then
						    Talk(3,"","Ha ha��� ��n l�c ��i ca n�y ��n c�u c�c huynh �� ra kh�i ch�n lao t�!!!","��i ca ��ng n�n n�ng! H�y n�i cho t�i h� bi�t <color=yellow>B�n �� S�n H� X� T�c<color> l� v�t g�?","<color=yellow>B�n �� S�n H� X� T�c<color> trong truy�n thuy�t l� th�n v�t c� s�c m�nh th�n ph�c thi�n h�. K� l�m quan c� ���c s� ���c l�m ho�ng ��, ng��i luy�n v� c� ���c c� th� th�ng nh�t giang h�! Ch� Thi�n T� m�i c� ���c th�n v�t n�y! Ch�ng hi�u v� sao g�n ��y truy�n r�ng th�n v�t xu�t hi�n � <color=red>Nh�n M�n quan<color>. Mu�n bi�t r� h�y ��n �� xem th�!")
						    SetTask(1401,25)
						    GivePlayerExp(SkeyTianmenzhen,"xunwen")
						    Earn(1000)
						    ModifyReputation(15,0)
						    --AddNote("��֪��ɽ�����ͼ�������ã�������Ҫȥ�����Źء�����һ������")
						    TaskTip("Bi�t ���c t�c d�ng c�a B�n �� S�n H� X� T�c nh�ng c�n ��n Nh�n M�n quan �i�u tra th�m!")
				else
						 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
				end
	elseif ( UWorld1401  == 20 and GetItemCount(2,1,34) < 5 ) then
				Talk(1,"","<color=red>H�nh Hoa th�n<color> c� nhi�u <color=red>Quan s�<color> tham lam. H�y �o�t <color=red>5 b� quan ph�c<color> c�a ch�ng v�!")
	elseif ( UWorld1401  == 25 ) then
				Talk(1,"","H�y ��n <color=red>Nh�n M�n quan<color> �i�u tra r� ng�n ngu�n!")
	else
				Talk(1,"","B�n quan ph� canh ph�ng thi�n lao qu� nghi�m ng�t! Th�t l� ��ng gh�t!")
	end
end;

function  say1401_3()
		Say("Ta mu�n ��t nh�p v�o thi�n lao, gi� c�n <color=red>20 b� quan ph�c<color> c�a <color=red>Quan s�<color> � <color=red>H�nh Hoa th�n<color>. Ng��i ��ng h�i t�i sao, ch� c�n n�i c� gi�p hay kh�ng?",2,"��ng �/yes1401_3","Kh�ng gi�p/no1401_3")
end;

function  yes1401_3()
		Talk(2,"","Bang ch� �� nh�, nh�t ��nh ph�i gi�p!","T�t l�m! H�y ��n �� l�y quan ph�c v�!")
		SetTask(1401,20)
		--AddNote("ȥ��ܴ������ռ�5�׹ٷ������ܽ�һ����������Ϣ��")
		TaskTip("Gi�p T�o ��i L�c thu th�p 5 b� quan ph�c, c� th� d� th�m th�m ch�t tin t�c!")
end;

function  no1401_3()
	Talk(1,"","T�i h� kh�ng mu�n ��c t�i v�i quan ph�! Xin nh� ng��i kh�c!")
end;
