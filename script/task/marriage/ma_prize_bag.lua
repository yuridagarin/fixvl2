--�ű����ƣ����Ƹ���
--�ű����ܣ��򿪽��Ƹ�������ý�������Ʒ
--���ܲ߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-6-20
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Tb_prize_bag = {
	{"G�m lam",2,1,15,10},
	{"��o Hoa H��ng",1,1,12,36},
	{"B�nh B�t v�ng",1,1,15,36},
	{"G�m v�ng",2,1,54,36},
	{"T� Ng� S�c",2,9,3,36},
	{"D� Minh Ch�u",2,1,39,5},
}
function OnUse()
	local prize_list = ""
	for i = 1,getn(Tb_prize_bag) do
		prize_list = prize_list.."<color=yellow>"..Tb_prize_bag[i][5].."<color> <color=yellow>"..Tb_prize_bag[i][1].."<color>\n    "
	end
	prize_list = prize_list .."B�n mu�n d�ng t�i l� v�t ��nh h�n?"
	Say("<color=green>G�i �<color>: M� t�i l� v�t ��nh h�n, nh�n ���c: \n    "..prize_list,
	1,
--	"T�i mu�n m� ra/prize_bag_use",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function prize_bag_use()
	--���Я�����
	if GetItemCount(2,1,585) == 0 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n c� mang <color=yellow>t�i l� v�t ��nh h�n<color>!")
		return
	end
	--���ؿռ���
	if Zgc_pub_goods_add_chk(6,160) ~= 1 then
		return
	end
	--���ɾ�����
	if DelItem(2,1,585,1) ~= 1 then
		Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n b�n c� mang <color=yellow>t�i l� v�t ��nh h�n<color>!")
		return
	end
	--���ӽ���
	for i = 1 ,getn(Tb_prize_bag) do
		AddItem(Tb_prize_bag[i][2],Tb_prize_bag[i][3],Tb_prize_bag[i][4],Tb_prize_bag[i][5])
	end
end
