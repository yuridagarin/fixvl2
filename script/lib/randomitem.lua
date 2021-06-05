--========�ļ�����==================================--
--�ļ�����randomitem.lua
--���ߣ�yanjun & windle
--�������ڣ�2006-12-12
--����޸����ڣ�2006-12-12
--����������
--	��1����������һ����Ʒ
--
--==================================================--

-- tab �ṹ
--	{ ����, "����", {G1, G2, G3, ����} },

function GetRandomItem(nTab)
	local nRandom = random(1,100);
	local nBase = 0;
	if CheckItemTab(nTab) == 1 then
		for i=1,getn(nTab) do
			if nRandom <= nTab[i][1]+nBase then
				return i;
			else
				nBase = nBase + nTab[i][1];
			end;
		end;
	else
		print("error item table");
		return 0;
	end;
end;

function CheckItemTab(tTab)
	local nTotalProbability= 0;
	for i=1,getn(tTab) do
		nTotalProbability = nTotalProbability + tTab[i][1]
	end;
	if nTotalProbability == 100 then
		return 1;
	else
		return 0;
	end;
end;

-- ����֮�Ͳ�Ϊ100
function get_random_item(t)
	local nMax = 0;
	for i = 1, getn(t) do
		nMax = nMax + t[i][1];
	end
	if nMax <= 0 then
		return 0;
	end
	local r = random(nMax);
	for i = 1, getn(t) do
		if r <= t[i][1] then
			return i;
		end
		r = r - t[i][1];
	end
	return 0;
end
