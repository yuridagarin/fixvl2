--����D�ű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function main()
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--�����ж�
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex ~= GetTaskTemp(Mid_Boss_Index) then
		return 0;
	end
	--�����ռ��ж�
	if gf_Judge_Room_Weight(2,2) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
    return 0;
	end
	--������B
	LSB_Get_Award_B();
	SetNpcLifeTime(nNpcIndex,0);
	SetTaskTemp(Mid_Boss_Index,0);
end