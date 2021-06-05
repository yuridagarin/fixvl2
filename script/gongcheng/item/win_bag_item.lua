
tb_exp = {
	[0] = 0,
	[1] = 5000,
	[2] = 50000,
	[3] = 200000,
	[4] = 500000,
	[5] = 1000000,
	[6] = 2000000,
	[70] = 3000000,
	[71] = 3500000,
	[72] = 4000000,
	[73] = 4500000,
	[74] = 5000000,
	[75] = 5500000,
	[76] = 6000000,
	[77] = 6500000,
	[78] = 7000000,
	[79] = 7500000,
	[80] = 8000000,
	[81] = 8500000,
	[82] = 9000000,
	[83] = 9500000,
	[84] = 10000000,
	[85] = 10500000,
	[86] = 11000000,
	[87] = 11500000,
	[88] = 12000000,
	[89] = 12500000,
	[90] = 13000000,
	[91] = 13500000,
	[92] = 14000000,
	[93] = 14500000,
	[94] = 15000000,
	[95] = 15500000,
	[96] = 16000000,
	[97] = 16500000,
	[98] = 17000000,
	[99] = 17500000,
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