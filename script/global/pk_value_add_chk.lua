-- ɱ�˺��Ƿ�����PKֵ
-- 2007-5-9 10:23

-- ����1����������������������

-- ������гǽ���Ӧ����
tMapIDMap =
{
	[105] = 100,			-- Ȫ�ݸ���
	[108] = 100,			-- Ȫ�ݸ���
	[301] = 300,			-- �ɶ�����
	[304] = 300,			-- �ɶ�����
	[308] = 300,			-- �ɶ�����
	[312] = 350,			-- �䵱
	[218] = 350,			-- �鱦ɽ
}

function IsAddPKValue()
	local szTongName = GetTongName()
	local nMapID = GetWorldPos()
	local nCityID = tMapIDMap[nMapID]
	if nCityID == nil then
		return 0
	end
	local szCityWarTong = GetCityWarInfo(nCityID, "base")
	if szCityWarTong == szTongName then
		return 1
	end
	return 0
end
