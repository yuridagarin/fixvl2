--�ű����ƣ�����ص�������ʾ�ű�
--�ű����ܣ��ڴ���ʱ������TRAP�����Ҹ����Ӧ��Ӧ��������ʾ��Ϣ
--���ܲ߻�����Ϊ
--���ܿ������峤
--����ʱ�䣺2008-11-07
--�޸ļ�¼��
Tb_5_element_coordinate = {
	{5,4," Kim "},
	{1,5,"Th�y"},
	{2,1,"M�c"},	
	{3,2,"H�a"},	
	{4,3,"Th�"},	
}
--�ؿ����ȴ��
MS_TIMMER_LOOP_ID = 5
--��ʼλ�ô��
Ms_element_gold_seq = 17
--��ͬ������˳��ͬ
trap_seq = 1
function main()
	--�ϴ���ʱ��ֱ�ӷ���
	local mission_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	if mission_loop_num >= 186 or mission_loop_num <= 6 or mission_loop_num == nil then
		return
	end
	--λ������
	local golden_element_seq = mod(5 + trap_seq - (GetMissionV(Ms_element_gold_seq)),5)
	if golden_element_seq == 0 then
		golden_element_seq = 5
	end
	--��ʾ
	Msg2Player("B�n �� v�o "..Tb_5_element_coordinate[golden_element_seq][3].." t�m tr�n, c� th� ch�ng "..Tb_5_element_coordinate[Tb_5_element_coordinate[golden_element_seq][1]][3].."Khi�n Ng� h�nh lu�n h�i-sinh v� "..Tb_5_element_coordinate[Tb_5_element_coordinate[golden_element_seq][2]][3].."Khi�n Ng� h�nh lu�n h�i-hi�u qu� kh�c!")
end
