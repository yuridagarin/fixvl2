--С������Ʒ�ű�
Include("\\script\\item\\jiebangfu.lua")

t_award = 
{
	n_gold = 400,
	n_room_need = 2,
	n_weight_need = 50,
	t_item = {
		{2,1,30470,1,"C�ng Kh�n Ph�"},
		{2,2,7,40,"M�nh Thi�n th�ch"},
		},
}

function OnUse(nItemIdx)
	return _OnUseReal(nItemIdx)
end