
TAIXU_TEAM_INDEX = 108		-- ��¼��Ա����ʱ�Ƕ�����ĸ�λ��

function main()
	local nMapid = GetWorldPos()
	local nIndex = GetTaskTemp(TAIXU_TEAM_INDEX)
	-- 8����Ա�����ƫ�ƣ���֤trap�󲻻ᴫ�͵�ͬһ��
	local tOffset =
	{
		{-2, 0},
		{-1, 0},
		{0, 0},
		{1, 0},
		{-2, 1},
		{-1, 1},
		{0, 1},
		{1, 1},
	}

	if nIndex > 0 and nIndex <= 8 then
		NewWorld(nMapid, 1543 + tOffset[nIndex][1], 3297 + tOffset[nIndex][2])
	else
		NewWorld(nMapid, 1545, 3298)
	end
	
	SetLogoutRV(1)						-- ��;�жϺ�س�
	if nMapid == 2010 or nMapid == 1010 then
		SetFightState(0)
		SetDeathPunish(0)	
	else
		SetFightState(1)					-- ����Ϊ��ս��
	end
	SetCreateTeam(1)					-- �ر���ӹ���
	UseScrollEnable(0)					-- ��ֹʹ�ûسǷ�
    InteractiveEnable(0)				-- �������أ�0�رգ�1��
    StallEnable(0)		   				-- ��̯����
	ForbitTrade(1)						-- ��ֹ����
	OpenFriendliness(0)					-- �������ø�
end
