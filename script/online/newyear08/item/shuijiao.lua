--08����ˮ�Ƚű�
--by vivi
--2008/01/15

function OnUse()
	local nLv = GetLevel();
	local nExp = floor(1000000*nLv^2/80^2);
	Say("<color=green>s�i c�o<color>: S� d�ng s�i c�o c� th� nh�n ���c <color=yellow>"..nExp.." <color> kinh nghi�m. D�ng ch�?",
		2,
		"���c/get_shuijiao_exp",
		"Kh�ng c�n/nothing")
end

function get_shuijiao_exp()
	local nLv = GetLevel();
	local nExp = floor(1000000*nLv^2/80^2);
	if DelItem(2,1,3218,1) == 1 then
		ModifyExp(nExp);
	end
end

function nothing()

end