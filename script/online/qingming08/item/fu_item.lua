--�ű����ƣ���Ʒ��ֽʹ�ýű�
--�ű����ܣ���Ʒ��ֽʹ�ýű��������������һ���ڶ��9�����������������
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-03-13
--�����޸ļ�¼��2008-3-20byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\qingming08\\head_qingming.lua")
--=================================Glb����������===========================
tomb_sweep_2008_task_reel_date_seq = 1852			--�������������
tomb_sweep_2008_task_reel_num = 1853					--����ɵ���������
tomb_sweep_2008_fu_use_date_seq	= 1856			--��Ʒ��ֽ��ʹ����������
tomb_sweep_2008_fu_use_num = 1857					--��Ʒ��ֽ�����ʹ������
if IS_SHOUFEI == TRUE then
	tomb_sweep_2008_fu_use_max_num = 8					--��ֽÿ������ʹ������������������������9�η�ֽ
else
	tomb_sweep_2008_fu_use_max_num = 9	
end

--=================================�������߼���============================
function OnUse(goods_index)
	--ʱ���ж�
	local date_chk = is_qingming_opened()
	if date_chk == 1 then
		--DelItemByIndex(goods_index,1)--���ﲻ��ɾ��
	else
		Talk(1,"","<color=green>Nh�c nh�<color>: V�t ph�m n�y ch� s� d�ng trong ho�t ��ng Thanh Minh <color=yellow>3-4-2008 ��n 12-4<color>.")
		return
	end
	--ʹ�������ж�
	local use_date_seq = GetTask(tomb_sweep_2008_fu_use_date_seq)
	local use_num = GetTask(tomb_sweep_2008_fu_use_num)
	local date_seq_now = zgc_pub_day_turn(1)
	local task_deal_seq = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local task_deal_num = GetTask(tomb_sweep_2008_task_reel_num)
	--ʹ�ô������ơ�������ʱ����쵼�µ��������
	if (use_date_seq >= date_seq_now and use_num >= tomb_sweep_2008_fu_use_max_num) or date_seq_now < ((use_date_seq + task_deal_seq)/2) then
		Talk(1,"","<color=green>Nh�c nh�<color>: V�t ph�m n�y m�i ng�y ch� c� th� s� d�ng <color=yellow>"..tomb_sweep_2008_fu_use_max_num.."<color> l�n!")
		return
	end
	--��Ʒɾ�����
	if DelItemByIndex(goods_index,1) ~= 1 then
		Talk(1,"","<color=green>Nh�c nh�<color>: Xin ki�m tra tr�n ng��i c� mang theo <color=yellow>gi�y c�ng t�<color>!")
		return
	end
	--���ݲ���
		--��ֽʹ����������д��
	if use_date_seq == nil or date_seq_now > use_date_seq then
		SetTask(tomb_sweep_2008_fu_use_date_seq,date_seq_now)
		SetTask(tomb_sweep_2008_fu_use_num,1)
	elseif date_seq_now == use_date_seq then
		SetTask(tomb_sweep_2008_fu_use_num,(use_num+1))
	end
		--�����������
	if task_deal_seq == date_seq_now then
		if task_deal_num == nil then
			SetTask(tomb_sweep_2008_task_reel_num,3)--�շ���ԭ�е�����+��ֽ1��
		else
			SetTask(tomb_sweep_2008_task_reel_num,(task_deal_num+1))
		end
	elseif task_deal_seq < date_seq_now then
		SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2008_task_reel_num,3)--�շ���ԭ�е�����+��ֽ1��
	end
	local use_num_dealed = GetTask(tomb_sweep_2008_fu_use_num)
	local dia_use_num_remain = ""
	if use_num_dealed == tomb_sweep_2008_fu_use_max_num then
		dia_use_num_remain = "�� kh�ng th� s� d�ng"
	else
		dia_use_num_remain = "C�n s� d�ng ���c <color=yellow>"..(tomb_sweep_2008_fu_use_max_num-use_num_dealed).."<color> l�n"
	end
	Talk(1,"","<color=green>Nh�c nh�<color>: B�n s� d�ng gi�y c�ng t� th�nh c�ng, nhi�m v� <color=yellow>h�m nay<color> ���c t�ng th�m <color=yellow>1<color> l�n, h�m nay b�n"..dia_use_num_remain.." gi�y c�ng t�!")
end

