--IB��Ʒ�������������ʯ
--��������������ʹ�ñ���Ʒѡ�񲢶һ���Ӧ��ʦ���ؼ�
--�����д�ˣ��Թ�
--�����дʱ�䣺2007��1��23��
--�߻��ˣ�����
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 100
dabaoyuntiejingshi_id = 1051
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	Say("B�n mu�n ��i Thi�n Th�ch tinh th�ch ��ng g�i l�y Thi�n Th�ch tinh th�ch?"..goods_num.."?",
	2,
	"��i/use_determine",
	"�� suy ngh�/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiejingshi_id) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n h�nh trang c� <color=red>Thi�n Th�ch tinh th�ch ��ng g�i<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiejingshi_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n h�nh trang c� <color=red>Thi�n Th�ch tinh th�ch ��ng g�i<color>!")
		return
	end
	local add_flag = AddItem(2,1,1009,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n d�ng Thi�n Th�ch tinh th�ch ��ng g�i ��i"..goods_num.." Thi�n Th�ch tinh th�ch!")
	else
		WriteLog(GetName()..":D�ng Thi�n Th�ch tinh th�ch ��ng g�i ��i Thi�n Th�ch tinh th�ch th�t b�i, k� hi�u:"..add_flag)
	end
end
