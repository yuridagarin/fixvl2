--�ű����ƣ�2007�괺�ڻ-��ɽ����-�׼���ű�
--�ű����ܣ���ɽ������Ĺ㲥
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-29
--�����޸ļ�¼��
--============================��������������===============================
--�Թ󴺹����ļ�
Include("\\script\\online\\zgc_public_fun.lua")
--================================���߼�===================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local time_minuet_dis = floor((66600 - Zgc_pub_today_sec_num_rtn())/60)
	if time_minuet_dis > 0 then
		Msg2SubWorld("H�i Hoa S�n"..time_minuet_dis.." ph�t n�a s� b�t ��u, c�c anh h�ng h�y nhanh ch�ng tham gia!")
	else
		Msg2SubWorld("H�i Hoa S�n �� b�t ��u")
	end
end
