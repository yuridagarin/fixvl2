--�ű����ƣ���������ʹ�ýű�
--�ű����ܣ�ʹ�ô���Ʒ�����������1000������
--�ű��߻��ˣ�С����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007��6��11��
--�����޸ļ�¼��

	keepsake_num_TaskID = 1227

function OnUse()
	Say("<color=green>Ch� �<color>: s� d�ng v�t ph�m n�y c� th� t�ng <color=yellow>1000<color> <color=yellow>t�n v�t<color>, b�n c� th� <color=yellow>T�n v�t<color> � <color=green>Di t�c S� qu�c<color> b�n c�nh <color=green>D� T�u<color> �� ��i l�y <color=yellow>nguy�n li�u b�nh �t<color>. S� d�ng ch�?",
	2,
	"��ng � d�ng/use_dtm",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function use_dtm()
	--Я�����
	if GetItemCount(2,1,1142) == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n c� mang theo <color=yellow>S� qu�c M�t l�nh<color>!")
		return
	end
	--ɾ�����
	if DelItem(2,1,1142,1) ~= 1 then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n c� mang theo <color=yellow>S� qu�c M�t l�nh<color>!")
		return
	end
	--��������
	SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID)+1000))
	Msg2Player("Ch�c m�ng b�n �� ��i th�nh c�ng 1000 t�n v�t n��c S�, b�n c� th� ��n 'Di T�c S� Qu�c' xem v� s� d�ng!")
end
