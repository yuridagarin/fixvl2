--===================================================
--ʹ�������Ʒ����Ҿ�������
--����֮ǰ�ڸ�ʲô�������Ժ󶼻��ڸ�ʲô
--һ��ʹ�ã�8Сʱ��Ч
--��ѧ
--===================================================

function OnUse()
	if GetOfflineLiveTime() > 1728000 then
		Talk(1,"","Th�i B�ch Kim ��n tr�n ng��i b�n �� v��t qu� 60 vi�n, kh�ng th� ti�p t�c s� d�ng!");
	elseif DelItem(2,1,202,1) == 1 then
		AddOfflineLiveTime(8 * 3600)
		Msg2Player("B�n �� s� d�ng 1 vi�n Th�i B�ch Kim ��n, c� th� phi�u du v�o c�i th�n ti�n trong 4 gi�!")
	end
end
