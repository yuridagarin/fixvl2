--bossÿ��20%��Ѫ�ص��Ľű�
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function DealPer20()
	--print("ˢ40������")
	local nIndex = GetGlbValue(GS_GLOBAL_VALUE3);
	if nIndex ~= 0 then
		for i = 1, GlodBoss_Drop_Num do
			local nNpcIdx = CreateNpc("B�o r��ng T�i nguy�n", "B�o r��ng", LSB_GOLD_BOSS_LOCATION[nIndex][1], LSB_GOLD_BOSS_LOCATION[nIndex][2], LSB_GOLD_BOSS_LOCATION[nIndex][3],6,1,1,400);
			SetNpcLifeTime(nNpcIdx,3 * 60);
			--SetTaskTemp(Sma_Boss_Index,nNpcIdx);
			SetNpcScript(nNpcIdx,Box_A_Script);
		end
	end
end