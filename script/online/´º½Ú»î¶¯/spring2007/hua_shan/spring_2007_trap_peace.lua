--�ű����ƣ�2007�괺�ڻ-��ɽ����PKģʽ�޸Ľű�
--�ű����ܣ��޸�ΪPK�гͷ�״̬
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-27
--�޸ļ�¼��
--============================��������������===============================
--�Թ󴺹����ļ�
Include("\\script\\online\\zgc_public_fun.lua")
--================================���߼�===================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	if GetPlayerRoute() == 0 then 
		NewWorld(100,1420,2989)
		Msg2Player("Ch�a v�o m�n ph�i kh�ng th� tham gia H�i Hoa S�n!")
	end 
	SetDeathPunish(1)
	Msg2Player("B�n �� chuy�n sang tr�ng th�i PK v� t� vong")
end
