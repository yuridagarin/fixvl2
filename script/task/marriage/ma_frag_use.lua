--�ű����ƣ���Ƭʹ�ýű�
--�ű����ܣ���Ƭʹ�õ��ýű�
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-04-26
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--============================��������������=======================
goods_id_tasktempID = 167
Tb_frag = {}
Tb_frag[568] = "Gi�p M�c d��ng"
Tb_frag[569] = "�t M�c �m"
Tb_frag[570] = "B�nh h�a d��ng"
Tb_frag[571] = "�inh H�a �m"
--============================�ű��߼���==============================
function OnUse(goods_index)
	--�ж��Ƿ���
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Ch� �<color>: Ch�a k�t h�n ch�a th� s� d�ng v�t ph�m n�y!")
		return
	end
	--�Ի�
	local goods_ID = GetItemParticular(goods_index)
	SetTaskTemp(goods_id_tasktempID,goods_ID)
	Say("<color=green>G�i �<color>: <color=yellow>"..Tb_frag[goods_ID].."<color> c� th� dung h�a nguy�n t� kh�c trong <color=yellow>Khi�n V�n Phi Tinh Ph�<color> th�nh <color=yellow>V�t ph�m Phu th�<color>, c�ng c� th� t� chuy�n h�a th�nh <color=yellow>Uy�n ��ng K�t<color>. <color=yellow>Uy�n ��ng K�t<color> l� <color=yellow>v�t c�n thi�t<color> �� s� d�ng k� n�ng <color=yellow>H�n Nh�n<color>. B�n mu�n cho v�o <color=yellow>Khi�n V�n Phi Tinh Ph�<color> hay chuy�n h�a th�nh <color=yellow>Uy�n ��ng K�t<color>?",
	3,
	"Cho v�o Khi�n V�n Phi Tinh Ph�/#put_in_num("..goods_ID..")",
	"Chuy�n h�a th�nh Uy�n ��ng K�t/frag_change_dtm",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--**************************��������****************************
function put_in_num(goods_ID)
	local goods_num = GetItemCount(2,1,goods_ID)
	if goods_num == 0 then
		return
	end
	AskClientForNumber("put_in",1,goods_num,"Xin nh�p s� l��ng cho v�o")
end
--**************************Ԫ�ط���****************************
function put_in(goods_num)
	--�������0��ֱ�ӷ���
	if goods_num == 0 then
		return
	end
	local goods_ID = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	if GetItemCount(2,1,goods_ID) < goods_num then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n mang <color=yellow>��<color> <color=yellow>"..Tb_frag[goods_ID].."<color>!")
		return
	end
	if DelItem(2,1,goods_ID,goods_num) ~= 1 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n mang <color=yellow>��<color> <color=yellow>"..Tb_frag[goods_ID].."<color>!")
		return
	end
	SetTask((goods_ID+653),(GetTask(goods_ID+653)+goods_num))
	Talk(1,"","<color=green>G�i �<color>: <color=yellow>"..goods_num.."<color> <color=yellow>"..Tb_frag[goods_ID].." <color> �� th�nh c�ng cho v�o <color=yellow>Khi�n V�n Phi Tinh Ph�<color>, mu�n dung h�a <color=yellow>V�t ph�m Phu th�<color> ch�n chu�t ph�i ngay <color=yellow>Khi�n V�n Phi Tinh Ph�<color>.!")
end
--*************************����ԧ���Ի�***********************
function frag_change_dtm()
	local goods_name = Tb_frag[GetTaskTemp(goods_id_tasktempID)]
	Say("<color=green>G�i �<color>: <color=yellow>Uy�n ��ng K�t<color> t��ng tr�ng cho t�nh c�m v� ch�ng, <color=yellow>k� n�ng Phu th�<color> c�n ph�i c� <color=yellow>Uy�n ��ng K�t<color> m�i ho�t ��ng ���c. M�i m�t <color=yellow>"..goods_name.." <color> ��u c� th� chuy�n h�a th�nh 1 <color=yellow>Uy�n ��ng K�t<color>. B�n mu�n d�ng <color=yellow>"..goods_name.."<color>chuy�n h�a th�nh <color=yellow>Uy�n ��ng K�t<color>?",
	2,
	"Ta x�c nh�n/change_num_put_in",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--************************ԧ���ת����������********************
function change_num_put_in()
	local goos_id = GetTaskTemp(goods_id_tasktempID)
	AskClientForNumber("frag_change",1,GetItemCount(2,1,goos_id),"Xin nh�p s� l��ng chuy�n ��i")
end
--***********************����ԧ���ȷ��*************************
function frag_change(goods_num)
	local goods_id = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	--�ռ�͸����ж�
	if Zgc_pub_goods_add_chk(goods_num,goods_num) ~= 1 then
		return
	end
	--Я�����
	if GetItemCount(2,1,goods_id) < goods_num then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n mang �� "..Tb_frag[goods_ID].."!")
		return
	end
	--��Ʒɾ�����
	if DelItem(2,1,goods_id,goods_num) ~= 1 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n mang �� "..Tb_frag[goods_ID].."!")
		return
	end
	--����ԧ���
	if AddItem(2,1,572,goods_num) == 1 then
		Msg2Player("Ch�c m�ng b�n �� chuy�n ��i"..goods_num.." 'Uy�n ��ng K�t'!")
	end
end
