--��ɽ�ܱ���
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\task_values.lua")

Item_Used = {2,1,30384,1,"L��ng S�n M�t B�o R��ng"};
Item_Depends = {2,1,30385,1,"Ch�a kh�a v�ng L��ng S�n"};

function OnUse(nItem)
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--û����ɽ�ܱ���
	if GetItemCount(Item_Used[1],Item_Used[2],Item_Used[3]) < Item_Used[4] then
		Talk(1,"",format("S� l��ng L��ng S�n M�t B�o R��ng kh�ng �� %s c�i",Item_Used[4]));
		return 0;
	end
	--û����ɽ��Կ��
	if GetItemCount(Item_Depends[1],Item_Depends[2],Item_Depends[3]) < Item_Depends[4] then
		Talk(1,"",format("S� l��ng ch�a kh�a v�ng L��ng S�n kh�ng �� %s c�i",Item_Depends[4]));
		return 0;
	end
	--�����ռ��ж�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
    return 0;
	end
	--print("gf_EventGiveRandAward")
	--print(LSB_LSMBX_AWARD_TB)
	if DelItem(Item_Depends[1],Item_Depends[2],Item_Depends[3],Item_Depends[4]) and DelItem(Item_Used[1],Item_Used[2],Item_Used[3],Item_Used[4]) == 1 then
		gf_Modify("Exp",300000);
		gf_AddItemEx2({2,1,30390,1}, "M�nh Thi�n Cang", "Boss L��ng S�n ", "M� L��ng S�n M�t B�o R��ng ", 0, 1)
		gf_EventGiveRandAward(LSB_LSMBX_AWARD_TB,100000,1,"Ho�t ��ng Boss L��ng S�n","M� L��ng S�n M�t B�o R��ng ");
	end
	--����
	if tGtTask:check_cur_task(91) == 1 and GetTask(VET_LSB_OPENBOX) < 1 then
		SetTask(VET_LSB_OPENBOX,1);
		Msg2Player(format("M� %d  L��ng S�n M�t B�o R��ng (ho�n th�nh)",GetTask(VET_LSB_OPENBOX)));
	end
	--print("gf_EventGiveRandAward end")
end