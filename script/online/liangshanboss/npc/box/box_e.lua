--����E�ű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function main()
	if LSB_Check_LR() == 0 then
			return 0;
	end
	--�����ж�
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex ~= GetTaskTemp(Gld_Boss_Index) then
		return 0;
	end
	--�����ռ��ж�
	if gf_Judge_Room_Weight(2,2) ~= 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
    return 0;
	end
	--������c
	LSB_Get_Award_Fix_C();
	LSB_Get_Award_C(1,1,nNpcIndex);
	SetNpcLifeTime(nNpcIndex,0);
end