--����ָ��
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if ((Uworld1 == 1) and (HaveItem(0)>0)) then
		Say("�a t� ng��i! N�o ng� M�nh c�ng t� c�ng b� S� S�. Ta c�m th�y qu� c� ��n, mu�n c� ng��i chia s�. Ng��i mu�n bi�t c�ch giao t� kh�ng?",2,"Mu�n/yes","Kh�ng c�n ��u!/no")
	DelItem(0)
	SetTask(1,2)
	else
		Talk(1,"","H�m nay ta ph�i d� d� y�n c�a Tri Ch�u ��i nh�n! Ch�ng bi�t ph�i di�n �� g� ��y! Th�t phi�n ph�c!")
	end
end;


function yes()
	Talk(1,"no","Giao l�u g�m: t�m hi�u, tr� chuy�n ho�c ch�c n�ng kh�c. Nh�n Ctrl + chu�t ph�i l�n nh�n v�t �� xem tin t�c. C� th� tr� chuy�n v�i ng��i kh�c b�ng c�c c�ch: ch�n m�c tr� chuy�n trong c�a s� t�m hi�u; nh�p ��p v�o t�n nh�n v�t ���c nh�n th�y ho�c nh�p t�n ng��i ch�i v�o k�nh tr� chuy�n �� ti�n h�nh giao l�u tr�c ti�p!")
	AddGoldItem(0,10);
end

function no()
	Talk(1,"","Ta ��t mua Gi�ng Sa b�o � ti�m Kim ho�n �� 10 n�m, ��n nay v�n ch�a mang t�i! Phi�n b�ng h�u ��n h�i gi�p! Ta ��nh m�c n� �i d� d� y�n c�a Y�n Th� ��i nh�n!")
end