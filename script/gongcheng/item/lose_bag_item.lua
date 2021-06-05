
tb_exp = {
	[0] = 0,
	[1] = 2500,
	[2] = 25000,
	[3] = 100000,
	[4] = 250000,
	[5] = 500000,
	[6] = 1000000,
	[70] = 1500000,
	[71] = 1750000,
	[72] = 2000000,
	[73] = 2250000,
	[74] = 2500000,
	[75] = 2750000,
	[76] = 3000000,
	[77] = 3250000,
	[78] = 3500000,
	[79] = 3750000,
	[80] = 4000000,
	[81] = 4250000,
	[82] = 4500000,
	[83] = 4750000,
	[84] = 5000000,
	[85] = 5250000,
	[86] = 5500000,
	[87] = 5750000,
	[88] = 6000000,
	[89] = 6250000,
	[90] = 6500000,
	[91] = 6750000,
	[92] = 7000000,
	[93] = 7250000,
	[94] = 7500000,
	[95] = 7750000,
	[96] = 8000000,
	[97] = 8250000,
	[98] = 8500000,
	[99] = 8750000,
};
function OnUse(nItemIdx)
	local nWeek = GetWeekSequence(1,0);
	if GetTask(1043) < nWeek then
		SetTask(1043,nWeek);
		SetTask(1044,0);
	end
	if GetTask(1043) >= nWeek and GetTask(1044) >= 2 then
		Talk(1,"","M�i ng��i m�i tu�n ch� c� th� d�ng 2 l�n C�ng Th�nh Chi�n L� Bao, tu�n n�y b�n �� s� d�ng 2 l�n.");
		return
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(1044,GetTask(1044)+1);	
		local nLevel = GetLevel();
		if nLevel < 70 then
			nLevel = floor(nLevel / 10);
		end
		if nLevel ~= 0 then
			local nExp = tb_exp[nLevel];
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
			Talk(1,"","Trong tu�n n�y ��i hi�p ��y l� l�n th� "..GetTask(1044).." l�n d�ng C�ng Th�nh Chi�n L� Bao (g�m Th�ng B�i L� Bao), M�i ng��i m�i tu�n ch� c� th� d�ng 2 l�n C�ng Th�nh Chi�n L� Bao.");
		end
	end;
end;

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--�����ܵ�����
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--����ʱ��
	nCurTime = nCurTime - 4*24*3600;	--���뵽1970��1��1�գ������ģ���ĵ�һ����һ�賿��
	local nWeekSecond = 7*24*3600;	--һ�ܶ�����
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--����ƫ��ʱ��
	local nTotalTime = nCurTime - nOffset;	--��������ʱ��
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--�����ܵ�����
	return nWeekSeq;
end;