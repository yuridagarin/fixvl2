--ĥ��ʯ

function OnUse()
	Say("S� d�ng Ma �ao Th�ch ng�u nhi�n �i�u ch�nh s�c c�ng k�ch trong ph�m vi nh�t ��nh.",2,"B�t ��u/StartKnife","Kh�ng c�n ��u/do_nothing")
end

function StartKnife()
	if GetFightState() ~= 0 then
		Talk(1,"","Hi�n t�i kh�ng th� s� d�ng ��o c� n�y");
		return 0;
	end
	KnifeStone();
	return 1;
end

function do_nothing()
--do nothing
end

--ͳ�Ƶ��ߵ�ʹ�����
function Knife_Stone_Statistics(nG, nD, nP, nNum)
	--print("Knife_Stone_Statistics",nG, nD, nP,nNum);
	if nNum and nNum > 0 then
		local tTable = {
			[1] = {2, 1, 30428},
			[2] = {2, 1, 30429},
			[3] = {2, 1, 30430},
		}
		for i = 1, getn(tTable) do
			if nG == tTable[i][1] and nD == tTable[i][2] and nP == tTable[i][3] then
				AddRuntimeStat(6, i, 0, tonumber(nNum));
			end
		end
	end
end
