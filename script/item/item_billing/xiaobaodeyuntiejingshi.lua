
Include("\\script\\online\\zgc_public_fun.lua")
goods_num = 8
dabaoyuntiejingshi_id = 3356
--**********************************��Ʒʹ��������************************************
function OnUse(goods_index)
	Say("B�n c� mu�n d�ng Thi�n Th�ch Tinh Th�ch bao ��i Thi�n Th�ch Tinh Th�ch"..goods_num.."?",
	2,
	"��i/use_determine",
	"�� suy ngh�/end_dialog")
end
function use_determine()
	if GetItemCount(2,1,dabaoyuntiejingshi_id) == 0 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c� <color=red> Thi�n Th�ch Tinh Th�ch bao<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	if DelItem(2,1,dabaoyuntiejingshi_id,1) ~= 1 then
		Talk(1,"end_dialog","X�c nh�n trong h�nh trang c� <color=red> Thi�n Th�ch Tinh Th�ch bao<color>!")
		return
	end
	local add_flag = AddItem(2,1,1009,goods_num,5)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n �� d�ng Thi�n Th�ch Tinh Th�ch bao �� ��i"..goods_num.." Thi�n Th�ch tinh th�ch!")
	else
		WriteLog(GetName()..":D�ng Thi�n Th�ch Tinh Th�ch bao ��i Thi�n Th�ch Tinh Th�ch th�t b�i, v� tr� th�t b�i :"..add_flag)
	end
end
