--�ű����ƣ�������ʹ�ú���
--�ű����ܣ�������ʹ�õ��ú���
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ��:2007-04-25
--�����޸ļ�¼��
--���Ӻ�ɫ��Ȣ֮�е�
--================================��������������================================
Frag_att_num_TaskID = 1220
Tb_ma_task_reel = {
	{565,"M�t �� L�u tinh",14},
	{566,"M�t �� T� Kh�",21},
	{567,"M�t �� T��ng Th�y",42},
}
--================================����ʹ��������================================
function OnUse(goods_index)
	--�ж��Ƿ���
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Ch� �<color>: Ch�a k�t h�n ch�a th� s� d�ng v�t ph�m n�y!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--ȡ�þ�������
	local goods_diff = 0 				
	for i = 1,getn(Tb_ma_task_reel) do
		if goods_id == Tb_ma_task_reel[i][1] then
			goods_diff = i
		end
	end
	Say("<color=green>G�i �<color>: S� d�ng"..Tb_ma_task_reel[goods_diff][2].." c� th� t�ng t�a �� L�u tinh trong <color=yellow>Khi�n V�n Phi Tinh Ph�<color> <color=yellow>"..Tb_ma_task_reel[goods_diff][3].."<color>. Sao h�?",
	2,
	"��i/#use_dtm("..goods_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--****************************����ʹ��**********************
function use_dtm(goods_diff)
	--����Я�����
	if GetItemCount(2,1,Tb_ma_task_reel[goods_diff][1]) == 0 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_ma_task_reel[goods_diff][2].."<color>!")
		return
	end
	--���Ʒ�����Я�����
	if GetItemCount(2,1,583) == 0 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n c� mang<color=yellow>Khi�n V�n Phi Tinh Ph�<color>!")
		return
	end	
	--����ɾ�����
	if DelItem(2,1,Tb_ma_task_reel[goods_diff][1],1) ~= 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>"..Tb_ma_task_reel[goods_diff][2].."<color>!")
		return
	end
	--�����������
	SetTask(Frag_att_num_TaskID,(GetTask(Frag_att_num_TaskID)+Tb_ma_task_reel[goods_diff][3]))
	Talk(1,"","<color=green>G�i �<color>: Xin ch�c m�ng! T�a �� L�u tinh �� t�ng<color=yellow>"..Tb_ma_task_reel[goods_diff][3].."<color>!")
end
