-- ��Խ����

function OnDeath()
	local nPreservedPlayerIndex	= PlayerIndex
	local nMemCount	= GetTeamSize()
	local nMapId, nX, nY = GetWorldPos()

	if nMemCount ==	0 then -- ���δ���
		if GetTask(1402) ==	85 then
			SetTask(1402, 90)
			Msg2Player("Th�nh c�ng ��nh b�i Ng� Vi�t l�o t�")
			TaskTip("Th�nh c�ng ��nh b�i Ng� Vi�t l�o t�")
		end
	else
		for	i=1,nMemCount do
			PlayerIndex	= GetTeamMember(i)
			local nTeamMapId, nTeamX, nTeamY = GetWorldPos()
			local nDist	= DistanceBetweenPoints(nMapId,	nX,	nY,	nTeamMapId,	nTeamX,	nTeamY)
			if GetTask(1402) == 85 and nDist >= 0 and nDist <=	50 then
				SetTask(1402, 90)
				Msg2Player("Th�nh c�ng ��nh b�i Ng� Vi�t l�o t�")
				TaskTip("Th�nh c�ng ��nh b�i Ng� Vi�t l�o t�")
			end
		end
		PlayerIndex	= nPreservedPlayerIndex 	-- ����֮ǰ�������ұ��
	end
end
