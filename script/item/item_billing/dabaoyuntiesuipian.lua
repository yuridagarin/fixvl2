--IB��Ʒ�������������Ƭ
--��������������ʹ�ñ���Ʒѡ�񲢶һ���Ӧ��ʦ���ؼ�
--�����д�ˣ��Թ�
--�����дʱ�䣺2007��1��23��
--�߻��ˣ�����
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 100
dabaoyuntiesuipian_id = 1049
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	Say("B�n mu�n ��i m�nh t�i Thi�n Th�ch l�y m�nh Thi�n Th�ch?"..goods_num.."?",
	2,
	"��i/use_determine",
	"�� suy ngh�/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiesuipian_id) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n h�nh trang c� <color=red>m�nh t�i Thi�n Th�ch<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(5,500) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiesuipian_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n h�nh trang c� <color=red>m�nh t�i Thi�n Th�ch<color>!")
		return
	end
	local add_flag = AddItem(2,2,7,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n d�ng m�nh t�i Thi�n Th�ch ��i"..goods_num.." m�nh Thi�n Th�ch!")
	else
		WriteLog(GetName()..":D�ng m�nh t�i Thi�n Th�ch ��i Thi�n Th�ch th�t b�i, k� hi�u:"..add_flag)
	end
end
