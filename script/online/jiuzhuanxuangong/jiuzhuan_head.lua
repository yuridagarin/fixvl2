--��ת����ϵͳ
--by vivi
--2008/10/10

--�������
TASK_XUANGONG_TELL = 1040;   --��ʾ��ת����ϵͳ
TASK_XUANGONG_NUM = 1041;    --������ת�����Ĵ���
TASK_XUANGONG_WEEK = 1042;   --ÿ�ܻ�һ��

--ȫ�ֱ���
XUANGONG_QIANNENG = 5;      --һ�λ�ȡ��Ǳ�ܵ�
XUAnGONG_TOTAL_NUM = 10;    --�����Ĵ������� 
XUANGONG_EXP = 2000000000;  --һ����Ҫ���ĵľ���ֵ

function main()
	local nLv = GetLevel();
	if nLv ~= 99 then
		Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: Ta c� th� d�y ng��i Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng, c�ng phu n�y m�i l�n tu th�nh, c� th� t�ng 5 �i�m ti�m n�ng. Nh�ng lo�i th�n c�ng n�y kh�ng d� h�c, tr��c ti�n ph�i ��t ��n c�p 99 c�nh gi�i thi�n vi�n m�n m�i c� th� tu th�nh, ngo�i ra c�n c�n quy�n Th�i D�ch H�n Nguy�n Ph�, ng��i mau luy�n ��n c�p 99 r�i h�n ��n t�m ta!");
		return
	else	
		SetTask(TASK_XUANGONG_TELL,1);
		Say("<color=green>Tr��ng l�o V� L�m<color>: Kh�ng ng� ng��i �� ��t ��n tr�nh �� n�y, ���c, ta s� truy�n d�y cho ng��i Ti�n Thi�nTh�i D�ch H�n Nguy�n C�ng c�a v� l�m, th�n c�ng n�y c�n c� <color=yellow>2 t� kinh nghi�m<color> v� <color=yellow>1 quy�n Th�i D�ch H�n Nguy�n Ph�<color> m�i c� th� luy�n, m�i l�n tu th�nh c� th� t�ng 5 �i�m ti�m n�ng. V�i t� ch�t c�a ng��i c� th� luy�n <color=yellow>10 l�n<color>, hi�n gi� ng��i �� luy�n ���c <color=yellow>"..GetTask(TASK_XUANGONG_NUM).."<color> l�n. M�i tu�n ch� c� th� luy�n <color=yellow>1 l�n<color>. (s� l�n luy�n th�n c�ng n�y s� �nh h��ng ��n x�p h�ng c�a nh�n v�t, luy�n 1 l�n t��ng ���ng 2 t� kinh nghi�m)",
				2,
				"\nTa mu�n luy�n Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng (m�t 2 t� kinh nghi�m)/xiulian_wugong",
				"\nT�m th�i ch�a mu�n luy�n/nothing")
	end
end

function nothing()

end

function xiulian_wugong()
	local nNum = GetTask(TASK_XUANGONG_NUM);
	local nWeek = GetWeekSequence(1,0);
	if nNum >= 10 then
		Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: T� ch�t hi�n gi� c�a ng��i ch� c� th� luy�n <color=yellow>10 l�n<color>, ng��i �� luy�n 10 l�n.");
		return
	end
	if GetTask(TASK_XUANGONG_WEEK) == nWeek then
		Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: M�i tu�n ch� c� th� luy�n 1 l�n, tu�n n�y ng��i �� luy�n r�i.");
		return
	end
	Say("<color=green>Tr��ng l�o V� L�m<color>: Mu�n luy�n th�n c�ng n�y <color=yeloow>c�n c� 2 t� kinh nghi�m v� 1 quy�n Th�i D�ch H�n Nguy�n Ph�<color>, ta c� Th�i D�ch H�n Nguy�n Ph� t�m ���c � T�y B�c <color=yellow>M� cung sa m�c<color>, nh�ng ch� c� th� gi�p ng��i 1 l�n, l�n sau ng��i t� t�m l�y. ��y l� l�n th� <color=yellow>"..(nNum+1).."<color> ng��i luy�n th�n c�ng n�y!",
		2,
		"\nTa mu�n b�t ��u luy�n/confirm_xiulian",
		"\nT�m th�i ch�a mu�n luy�n/nothing")
end

function confirm_xiulian()
	local nExp = GetExp();
	local nNum = GetTask(TASK_XUANGONG_NUM);
	local nWeek = GetWeekSequence(1,0);
	if nNum >= 10 then
		Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: T� ch�t hi�n gi� c�a ng��i ch� c� th� luy�n <color=yellow>10 l�n<color>, ng��i �� luy�n 10 l�n.");
		return
	end	
	if nExp < XUANGONG_EXP then
		Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: Luy�n Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng c�n <color=yellow>2 t� kinh nghi�m<color>, kinh nghi�m c�a ng��i kh�ng ��.");
		return
	end
	if GetTask(TASK_XUANGONG_WEEK) == nWeek then
		Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: M�i tu�n ch� c� th� luy�n 1 l�n, tu�n n�y ng��i �� luy�n r�i.");
		return
	end	
	if nNum >= 1 then  --��һ�β���
 		if GetItemCount(2,0,1083) < 1 then
			Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: Luy�n Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng c�n c� <color=yellow>quy�n Th�i D�ch H�n Nguy�n Ph�<color>, hi�n gi� ng��i kh�ng c�.");
			return
		end
	end
	if nNum >= 1 then		--��һ�β���
		if DelItem(2,0,1083,1) ~= 1 then
			return
		end
	end
	SetTask(TASK_XUANGONG_NUM,nNum+1);
	SetTask(TASK_XUANGONG_WEEK,nWeek);
	ModifyExp(-XUANGONG_EXP);
	AddProp(XUANGONG_QIANNENG);
	Talk(1,"","<color=green>Tr��ng l�o V� L�m<color>: Ch�c m�ng ng��i �� luy�n th�nh c�ng Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng, t�ng "..XUANGONG_QIANNENG.." �i�m ti�m n�ng.");	 
	Msg2Global("��i hi�p"..GetName().."���c s� ch� d�n c�a Tr��ng l�o V� L�m, �� luy�n ��n c�nh gi�i Ti�n Thi�n, nh�n ���c �i�m ti�m n�ng, luy�n th�nh c�ng Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng!");
	WriteLog("Ng��i ch�i"..GetName().."�� luy�n 1 l�n Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng.");
end

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