--�ű����ƣ���������ʹ�ýű�
--�ű����ܣ����������Ӷһ�Ϊ��������
--���ܲ߻���oo
--���ܿ������峤
--����ʱ�䣺2008-06-05
--�����޸ļ�¼
function OnUse()
	local baimi_zongzi_num = GetItemCount(2,1,1122)
	local del_flag = DelItem(2,1,1122,baimi_zongzi_num)
	if del_flag == 1 then
		local add_flag = AddItem(2,1,3359,baimi_zongzi_num)
		if add_flag == 1 then
			Msg2Player("B�n ��i "..baimi_zongzi_num.." 'B�nh �t g�o tr�ng' l�y 'B�nh �t g�o th�m'!")
		else
			WriteLog("[�oan Ng� 08] ng��i ch�i:  "..GetName().."T�ng"..baimi_zongzi_num.." B�nh �t g�o th�m th�t b�i, k� hi�u th�t b�i:  "..add_flag)
		end
	else
		WriteLog("[�oan Ng� 08] ng��i ch�i:  "..GetName().."H�y b�"..baimi_zongzi_num.." B�nh �t g�o tr�ng th�t b�i, k� hi�u th�t b�i:  "..del_flag)
	end
end
