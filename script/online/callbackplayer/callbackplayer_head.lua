--�ٻ�����һ
--by vivi
--2008/07/07

--�������
TASK_GET_OLD = 916;      --�Ƿ���ȡ������ҽ��� ������ȡ����
TASK_KILL_PLAYER = 917;  --ɱ��������ɵ���Ҵ���
TASK_KILLED_NUM = 918;   --������������ɱ���Ĵ���
TASK_EXP_DATE = 919;     --�ƺŸ���������� ÿ�����
TASK_EXP_NUM = 920;      --�ƺŸ�����Ĵ�����1��Сʱ����60��
TASK_KILL_DATE = 921;    --��¼����ս��ɱ������
TASK_AWARD_NUM = 922;    --��¼�ڼ�����ȡ����
TASK_AWARD_WEEK = 923;   --��¼��ȡ�������ܵ�����
TASK_MENPAI_AWARD = 924; --��¼��ȡ���ɽ����ܵ����� 
TASK_TIANDI_CHOUJIANG = 925; --�Ƿ�����

--������ID
CALLBACK_TIME_ID = 51;
CALLBACK_TRIGGER_ID = 2022;

--ɱ������
tShashou = {
	[0] = {{0,3,63,3,85,5,95,4,63},{0,8,96,3,86,5,98,4,64},{0,0,13,3,86,5,98,4,64},{0,1,52,3,85,5,96,4,63},{0,2,26,6,42,5,98,2,99},{0,10,74,3,86,5,98,4,64},{0,0,13,3,85,5,95,4,63},{0,5,39,3,85,5,95,4,63},{0,2,26,3,86,5,98,4,64},{0,9,85,3,85,5,97,4,63},{0,6,107,3,85,5,95,4,63},{0,4,118,3,85,5,96,4,63},{0,7,11,3,85,5,96,4,63},{0,11,11,3,86,5,98,4,64}},
	[1] = {{0,3,63,3,85,5,95,4,63},{0,8,96,3,86,5,98,4,64},{0,0,13,3,86,5,98,4,64}},
	[2] = {{0,3,63,3,85,5,95,4,63}},
	[3] = {{0,8,96,3,86,5,98,4,64}},
	[4] = {{0,0,13,3,86,5,98,4,64}},
	[5] = {{0,1,52,3,85,5,96,4,63}},
	[6] = {{0,1,52,3,85,5,96,4,63}},
	[7] = {{0,2,26,6,42,5,98,2,99},{0,10,74,3,86,5,98,4,64}},
	[8] = {{0,2,26,6,42,5,98,2,99}},
	[9] = {{0,10,74,3,86,5,98,4,64}},
	[10] = {{0,0,13,3,85,5,95,4,63},{0,5,39,3,85,5,95,4,63}},
	[11] = {{0,0,13,3,85,5,95,4,63}},
	[12] = {{0,5,39,3,85,5,95,4,63}},
	[13] = {{0,2,26,3,86,5,98,4,64},{0,9,85,3,85,5,97,4,63}},
	[14] = {{0,2,26,3,86,5,98,4,64}},
	[15] = {{0,9,85,3,85,5,97,4,63}},
	[16] = {{0,6,107,3,85,5,95,4,63},{0,4,118,3,85,5,96,4,63}},
	[17] = {{0,6,107,3,85,5,95,4,63}},
	[18] = {{0,4,118,3,85,5,96,4,63}},
	[19] = {{0,7,11,3,85,5,96,4,63},{0,11,11,3,86,5,98,4,64}},
	[20] = {{0,7,11,3,85,5,96,4,63}},
	[21] = {{0,11,11,3,86,5,98,4,64}}
};

--�׵�װ��
tYandi = {
	{"Vi�m �� kh�i",0,103,8000},
	{"Vi�m �� gi�p",0,100,8000},
	{"Vi�m �� trang",0,101,8000}
};

tXuanyuanZhan = 
{
	[0] = {{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n Chi�n",0,102,8805},{"Hi�n Vi�n Chi�n",0,102,8807},{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n Chi�n",0,102,8811},{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n Chi�n",0,102,8815},{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n Chi�n",0,102,8819},{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n Chi�n",0,102,8823},{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n Chi�n",0,102,8827}},
	[1] = {{"Hi�n Vi�n Chi�n",0,102,8801},{"Hi�n Vi�n Chi�n",0,102,8803},{"Hi�n Vi�n Chi�n",0,102,8805}},
	[2] = {{"Hi�n Vi�n Chi�n",0,102,8801}},
	[3] = {{"Hi�n Vi�n Chi�n",0,102,8803}},
	[4] = {{"Hi�n Vi�n Chi�n",0,102,8805}},
	[5] = {{"Hi�n Vi�n Chi�n",0,102,8807}},
	[6] = {{"Hi�n Vi�n Chi�n",0,102,8807}},
	[7] = {{"Hi�n Vi�n Chi�n",0,102,8809},{"Hi�n Vi�n Chi�n",0,102,8811}},
	[8] = {{"Hi�n Vi�n Chi�n",0,102,8809}},
	[9] = {{"Hi�n Vi�n Chi�n",0,102,8811}},
	[10] = {{"Hi�n Vi�n Chi�n",0,102,8813},{"Hi�n Vi�n Chi�n",0,102,8815}},
	[11] = {{"Hi�n Vi�n Chi�n",0,102,8813}},
	[12] = {{"Hi�n Vi�n Chi�n",0,102,8815}},
	[13] = {{"Hi�n Vi�n Chi�n",0,102,8817},{"Hi�n Vi�n Chi�n",0,102,8819}},
	[14] = {{"Hi�n Vi�n Chi�n",0,102,8817}},
	[15] = {{"Hi�n Vi�n Chi�n",0,102,8819}},
	[16] = {{"Hi�n Vi�n Chi�n",0,102,8821},{"Hi�n Vi�n Chi�n",0,102,8823}},
	[17] = {{"Hi�n Vi�n Chi�n",0,102,8821}},
	[18] = {{"Hi�n Vi�n Chi�n",0,102,8823}},
	[19] = {{"Hi�n Vi�n Chi�n",0,102,8825},{"Hi�n Vi�n Chi�n",0,102,8827}},
	[20] = {{"Hi�n Vi�n Chi�n",0,102,8825}},
	[21] = {{"Hi�n Vi�n Chi�n",0,102,8827}},
}
	
tXuanyuanDou = 
{
	[0] = {{"Hi�n Vi�n ��u",0,102,8802},{"Hi�n Vi�n ��u",0,102,8804},{"Hi�n Vi�n ��u",0,102,8806},{"Hi�n Vi�n ��u",0,102,8808},{"Hi�n Vi�n ��u",0,102,8810},{"Hi�n Vi�n ��u",0,102,8812},{"Hi�n Vi�n ��u",0,102,8814},{"Hi�n Vi�n ��u",0,102,8816},{"Hi�n Vi�n ��u",0,102,8818},{"Hi�n Vi�n ��u",0,102,8820},{"Hi�n Vi�n ��u",0,102,8822},{"Hi�n Vi�n ��u",0,102,8824},{"Hi�n Vi�n ��u",0,102,8826},{"Hi�n Vi�n ��u",0,102,8828}},
	[1] = {{"Hi�n Vi�n ��u",0,102,8802},{"Hi�n Vi�n ��u",0,102,8804},{"Hi�n Vi�n ��u",0,102,8806}},
	[2] = {{"Hi�n Vi�n ��u",0,102,8802}},
	[3] = {{"Hi�n Vi�n ��u",0,102,8804}},
	[4] = {{"Hi�n Vi�n ��u",0,102,8806}},
	[5] = {{"Hi�n Vi�n ��u",0,102,8808}},
	[6] = {{"Hi�n Vi�n ��u",0,102,8808}},
	[7] = {{"Hi�n Vi�n ��u",0,102,8810},{"Hi�n Vi�n ��u",0,102,8812}},
	[8] = {{"Hi�n Vi�n ��u",0,102,8810}},
	[9] = {{"Hi�n Vi�n ��u",0,102,8812}},
	[10] = {{"Hi�n Vi�n ��u",0,102,8814},{"Hi�n Vi�n ��u",0,102,8816}},
	[11] = {{"Hi�n Vi�n ��u",0,102,8814}},
	[12] = {{"Hi�n Vi�n ��u",0,102,8816}},
	[13] = {{"Hi�n Vi�n ��u",0,102,8818},{"Hi�n Vi�n ��u",0,102,8820}},
	[14] = {{"Hi�n Vi�n ��u",0,102,8818}},
	[15] = {{"Hi�n Vi�n ��u",0,102,8820}},
	[16] = {{"Hi�n Vi�n ��u",0,102,8822},{"Hi�n Vi�n ��u",0,102,8824}},
	[17] = {{"Hi�n Vi�n ��u",0,102,8822}},
	[18] = {{"Hi�n Vi�n ��u",0,102,8824}},
	[19] = {{"Hi�n Vi�n ��u",0,102,8826},{"Hi�n Vi�n ��u",0,102,8828}},
	[20] = {{"Hi�n Vi�n ��u",0,102,8826}},
	[21] = {{"Hi�n Vi�n ��u",0,102,8828}},
}

tHuangDiWeapon = 
{
	[0] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802},{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804},{"Hi�n Vi�n Gi�i T� Kim",0,1,8805},{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807},{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809},{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},{"Hi�n Vi�n Sinh T� B�t",0,9,8811},{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813},{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
	[1] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802},{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803},{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804}},
	[2] = {{"Hi�n Vi�n To�i V� �ao",0,3,8801},{"Hi�n Vi�n To�i V� C�n",0,5,8802}},
	[3] = {{"Hi�n Vi�n C�u Nh� Tr��ng",0,8,8803}},
	[4] = {{"Hi�n Vi�n H�o Nhi�n Th�",0,0,8804}},
	[5] = {{"Hi�n Vi�n Gi�i T� Kim",0,1,8805}},
	[6] = {{"Hi�n Vi�n Gi�i T� Kim",0,1,8805}},
	[7] = {{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806},{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807}},
	[8] = {{"Hi�n Vi�n T� Tinh Ki�m",0,2,8806}},
	[9] = {{"Hi�n Vi�n Ph�ng Ho�ng C�m",0,10,8807}},
	[10] = {{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808},{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809}},
	[11] = {{"Hi�n Vi�n Ng� Nh�c Th�",0,0,8808}},
	[12] = {{"Hi�n Vi�n Ph� Thi�n C�n",0,5,8809}},
	[13] = {{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810},{"Hi�n Vi�n Sinh T� B�t",0,9,8811}},
	[14] = {{"Hi�n Vi�n H�ng Qu�n Ki�m",0,2,8810}},
	[15] = {{"Hi�n Vi�n Sinh T� B�t",0,9,8811}},
	[16] = {{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812},{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813}},
	[17] = {{"Hi�n Vi�n Ph� Qu�n Th��ng",0,6,8812}},
	[18] = {{"Hi�n Vi�n Khai Thi�n Cung",0,4,8813}},
	[19] = {{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814},{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
	[20] = {{"Hi�n Vi�n �m D��ng Nh�n",0,7,8814}},
	[21] = {{"Hi�n Vi�n U Minh Tr�o",0,11,8815}},
}

tTiandi = {
	{{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,85},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,86},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,87},{"Thi�n ��a Huy�n Ho�ng Kh�i",0,103,88}},
	{{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,85},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,86},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,87},{"Thi�n ��a Huy�n Ho�ng Gi�p ",0,100,88}},
	{{"Thi�n ��a Huy�n Ho�ng Trang",0,101,85},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,86},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,87},{"Thi�n ��a Huy�n Ho�ng Trang",0,101,88}},
	{[0]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100},{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122},{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [1]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43},{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [2]={{"Thi�n ��a Huy�n Ho�ng Dao",0,3,67},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [3]={{"Thi�n ��a Huy�n Ho�ng Tr��ng",0,8,100}},
	 [4]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [5]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [6]={{"Thi�n ��a Huy�n Ho�ng Kh� ",0,1,56}},
	 [7]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [8]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [9]={{"Thi�n ��a Huy�n Ho�ng C�m",0,10,78}},
	 [10]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17},{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [11]={{"Thi�n ��a Huy�n Ho�ng Th�",0,0,17}},
	 [12]={{"Thi�n ��a Huy�n Ho�ng C�n",0,5,43}},
	 [13]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39},{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [14]={{"Thi�n ��a Huy�n Ho�ng Ki�m ",0,2,39}},
	 [15]={{"Thi�n ��a Huy�n Ho�ng B�t ",0,9,89}},
	 [16]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111},{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [17]={{"Thi�n ��a Huy�n Ho�ng Th��ng ",0,6,111}},
	 [18]={{"Thi�n ��a Huy�n Ho�ng Cung ",0,4,122}},
	 [19]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15},{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [20]={{"Thi�n ��a Huy�n Ho�ng Nh�n ",0,7,15}},
	 [21]={{"Thi�n ��a Huy�n Ho�ng Tr�o",0,11,15}}}
	};


--���������Ŵ�
tShifu	=	{
		{"Thi�u L�m",204,1599,3182,"<color=green>Huy�n T�<color>:"},
		{"V� �ang",312,1825,3323,"<color=green>T� H�c Ch�n Nh�n<color>:"},
		{"Nga My",303,1645,3159,"<color=green>Ch�n Nh� S� Th�i<color>:"},
		{"C�i Bang",209,1547,3183,"<color=green>Long T�i Thi�n<color>:"},
		{"���ng M�n",305,1598,2824,"<color=green>���ng S� H�ng<color>:"},
		{"D��ng M�n",219,1538,3151,"<color=green>Xa Th�i Qu�n<color>:"},
		{"Ng� ��c",407,1609,3193,"<color=green>B�ch Doanh Doanh<color>:"}
};

--�������ƣ��ܼ����㺯��
--��        �ܣ����ؽ��������ڼ�
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end

--��������ս��ǰ����
function callback_date_check()
	if Zgc_pub_week_day() == 0 then --������
		return 1;
	else
		return 0;
	end
end

--��Ҵ�������
function callback_player_date()
	local nYear,nMonth = GmTime(GetCreateTime()); --�������ȷ����
	if nYear == 2007 and nMonth <= 6 then
		return 1;
	elseif nYear == 2007 and nMonth <=12 then
		return 2;
	elseif nYear == 2008 and nMonth <= 4 then
		return 3;
	else
		return 0;
	end
end

--����ҳƺ�
function callback_add_title(nType)
	if nType ~= 1 and nType ~= 2 and nType ~= 3 then
		return
	end
	if IsTitleExist(3,nType+4) > 0 then
		return
	end	
	if AddTitle(3, nType+4) > 0 then
		SetCurTitle(3, nType+4)
	end
end

--����cj��װ��ɱ������ ������ʾǿ����
function callback_add_item(nQianghua)
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	AddItem(0,103,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,100,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,101,90+nBody,1,4,-1,-1,-1,-1,-1,-1,0,nQianghua);
	AddItem(0,102,36,1,4,-1,-1,-1,-1,-1,-1);
	AddItem(0,102,37,1,4,-1,-1,-1,-1,-1,-1);
	local nRand = random(1,getn(tShashou[nRoute]));
	AddItem(tShashou[nRoute][nRand][1],tShashou[nRoute][nRand][2],tShashou[nRoute][nRand][3],1,4,tShashou[nRoute][nRand][4],tShashou[nRoute][nRand][5],tShashou[nRoute][nRand][6],tShashou[nRoute][nRand][7],tShashou[nRoute][nRand][8],tShashou[nRoute][nRand][9],0,nQianghua);
end

--�Ե�ǰ��ҿɷ����������Ʒ���м�� 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
		Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
		return 0
	else 
		return 1
	end
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

function nothing()

end

function callback_talk()
--	local strtab = {
--		"Ta mu�n nh�n ph�n th��ng ng��i ch�i c�/get_old_award",
--		"Ta mu�n r�t th�m Vi�m Ho�ng Thi�n ��a/tiandi_choujiang",
--		"C�c lo�i ph�n th��ng t��ng �ng v�i ng��i ch�i c�/about_old_award",
--		"Ta t�m th�i kh�ng nh�n ph�n th��ng/nothing"}
--	Say("<color=green>D� T�u<color>: �� l�u kh�ng g�p, ta v�n nh� l�n ��u g�p ng��i, tuy v� l�m phong ba bi�n ��i li�n t�c nh�ng l�o ��y v�n nh� ng��i, ta �� chu�n b� v�i m�n �� gi�p, c� th� gi�p ng��i h�nh hi�p giang h�! Ta c�ng ���c g�i l� �n gi� trong giang h�, c� th� d�y cho ng��i v�i chi�u!",
--		getn(strtab),
--		strtab)
end

function get_old_award()
	if GetTask(TASK_GET_OLD) ~= 0 then
		Talk(1,"","<color=green>D� T�u<color>: M�i nh�n v�t ch� c� th� nh�n 1 l�n ph�n th��ng ng��i ch�i c�.");
		return
	end
	if GetLevel() < 11 then
		Talk(1,"","<color=green>D� T�u<color>: ��ng c�p th�p qu�, ��n c�p 11 h�y quay l�i.");
		return
	end
	local nDate = tonumber(date("%Y%m%d")); 
	local nType = callback_player_date();
	if nType == 1 then
		if Zgc_pub_goods_add_chk(6,500) ~= 1 then
			return
		end		
		SetTask(TASK_GET_OLD,nDate);
		callback_add_item(6);
		callback_add_title(1);
		back_to_shifu();
	elseif nType == 2 then
		if Zgc_pub_goods_add_chk(6,500) ~= 1 then
			return
		end		
		SetTask(TASK_GET_OLD,nDate);
		callback_add_item(4);
		callback_add_title(2);
		back_to_shifu();		
	elseif nType == 3 then
		SetTask(TASK_GET_OLD,nDate);
		callback_add_title(3);
		back_to_shifu();		
	else
		Talk(1,"","<color=green>D� T�u<color>: Xin l�i, �� � ��y ��u chu�n b� cho nh�ng ng��i trong giang h�, kh�ng c� �� ng��i d�ng ���c, nh�ng kh�ng sao, hi�n V� l�m tranh b� �ang ti�n h�nh, h�y ��n s� ph� m�n ph�i h�i th�, � �� c� chu�n b� v�i m�n, nghe n�i trong tranh b� c� ph�n th��ng t�n v�t trang b� cao c�p c�a s� m�n.");
	end
end

function back_to_shifu()
	local nRoute = GetPlayerFaction();
	if nRoute == 0 then
		Talk(1,"","<color=green>D� T�u<color>: Hi�n ��i h�i t� v� Thi�n h� �� nh�t �ang tri�u t�p, m� V� l�m tranh b� c�ng s�p b�t ��u, nghe n�i l� cu�i tu�n g�n nh�t, c�c s� ph� v� mong c�c �� �� c� th� x�ng h�ng trong V� l�m tranh b� n�n �� chu�n b� r�t nhi�u trang b� cao c�p, mau ��n gia nh�p m�n ph�i m� ng��i �ng � nh�t �i.");
	else
		Say("<color=green>D� T�u<color>: Hi�n ��i h�i t� v� Thi�n h� �� nh�t �ang tri�u t�p, m� V� l�m tranh b� c�ng s�p b�t ��u, nghe n�i l� cu�i tu�n g�n nh�t, c�c s� ph� v� mong c�c �� �� c� th� x�ng h�ng trong V� l�m tranh b� n�n �� chu�n b� r�t nhi�u trang b� cao c�p, nghe n�i �� c��ng h�a to�n b� l� trang b� 10, d�ng cho V� l�m tranh b�, mau ��n s� m�n xem th�, h�i r� t�nh h�nh!",
			1,
			"Bi�t r�i!/nothing")
	end
end

function about_old_award()
	Say("<color=green>D� T�u<color>: Ng��i mu�n xem ph�n th��ng n�o?",
		4,
		"Ta l� ng��i ch�i c� tr��c th�ng 7 n�m 2007/about_2005_award",
		"Ta l� ng��i ch�i c� tr��c th�ng 1 n�m 2008/about_2006_award",
		"Ta l� ng��i ch�i c� tr��c th�ng 5 n�m 2008/about_2007_award",
		"Ta mu�n �i l�nh th��ng/callback_talk")
end

function about_2005_award()
	Talk(1,"about_2005_award2","<color=green>D� T�u<color>: Ng��i �� � trong giang h� l�u v�y, ta �� chu�n b� cho ng��i 1 b� �� h�nh t�u giang h�, b� n�y do trang ch� T�ng Ki�m s�n trang t�ng ta, c�ng th�m m�n v� kh� ta s� d�ng khi m�i gia nh�p giang h�, b� n�y ph�n th�nh\nTrang Ch� M�o t�c �� ��nh 15%, t�t c� n�ng l�c + 4-7\nT�ng Qu�n Ngo�i Trang n�i ngo�i c�ng 8%, sinh l�c t�i �a + 5%, t�t c� n�ng l�c 4-7\nT�ng Qu�n Kh� n�i ngo�i ph�ng - 5%, n�i ngo�i c�ng + 10%, t�t c� n�ng l�c 4-7\nTi�u Th� Gi�i Ch� sinh l�c n�i l�c + 8%, t�t c� n�ng l�c 1-4\nTr��ng L�o Ch� Ho�n ch�nh x�c + 40-55, n� tr�nh + 30-35, t�t c� n�ng l�c 9-12")
end

function about_2005_award2() --��������鲻ͬ
	Talk(1,"about_old_award","<color=green>D� T�u<color>: B� trang b� n�y ta �� n�ng c�p ��n 6, ngo�i ra ta s� trao t�t c� nh�ng kinh nghi�m giang h� m� ta �� tr�i qua v� V� l�m b�o �i�n cho ng��i. (Danh hi�u ��c bi�t, D� T�u V� l�m b�o �i�n truy�n nh�n, sau khi m� m�i ph�t t�ng 0.5% kinh nghi�m, khi 0.5% kinh nghi�m l�n h�n 845235, nh�n nhi�u nh�t 845235, m�i ng�y t�c d�ng 1 gi�, sau 15 ng�y s� m�t danh hi�u)\nSau khi ng��i �� tham gia t�t c� ho�t ��ng V� l�m tranh b� th� c� th� r�t 1 l�n th�m � ��y, n�u r�t tr�ng s� c� th� nh�n ���c to�n b� trang b� Vi�m Ho�ng �� ho�c trang b� Thi�n ��a Huy�n Ho�ng, th�m ch� kh�ng r�t tr�ng c�ng c� th� nh�n 2 l�n v�t ph�m B�ng Lai, ch�c may m�n!")
end

function about_2006_award()
	Talk(1,"about_2006_award2","<color=green>D� T�u<color>: Ng��i �� � trong giang h� l�u v�y, ta �� chu�n b� cho ng��i 1 b� �� h�nh t�u giang h�, b� n�y do trang ch� T�ng Ki�m s�n trang t�ng ta, c�ng th�m m�n v� kh� ta s� d�ng khi m�i gia nh�p giang h�, b� n�y ph�n th�nh\nTrang Ch� M�o t�c �� ��nh 15%, t�t c� n�ng l�c + 4-7\nT�ng Qu�n Ngo�i Trang n�i ngo�i c�ng 8%, sinh l�c t�i �a + 5%, t�t c� n�ng l�c 4-7\nT�ng Qu�n Kh� n�i ngo�i ph�ng - 5%, n�i ngo�i c�ng + 10%, t�t c� n�ng l�c 4-7\nTi�u Th� Gi�i Ch� sinh l�c n�i l�c + 8%, t�t c� n�ng l�c 1-4\nTr��ng L�o Ch� Ho�n ch�nh x�c + 40-55, n� tr�nh + 30-35, t�t c� n�ng l�c 9-12")
end

function about_2006_award2() --��������鲻ͬ
	Talk(1,"about_old_award","<color=green>D� T�u<color>: B� v� kh� n�y ta �� n�ng c�p ��n 4, ngo�i ra ta s� trao t�t c� nh�ng kinh nghi�m giang h� m� ta �� tr�i qua v� V� l�m m�t t�n cho ng��i. (Danh hi�u ��c bi�t, D� T�u V� l�m m�t t�n truy�n nh�n, sau khi m� m�i ph�t t�ng 0.4% kinh nghi�m, khi 0.4% l�n h�n 676188, nh�n nhi�u nh�t 676188, m�i ng�y t�c d�ng 1 gi�, sau 15 ng�y s� m�t danh hi�u)\nSau khi ng��i �� tham gia t�t c� ho�t ��ng V� l�m tranh b� th� c� th� r�t 1 l�n th�m � ��y, n�u r�t tr�ng s� c� th� nh�n ���c to�n b� trang b� Vi�m Ho�ng �� ho�c trang b� Thi�n ��a Huy�n Ho�ng, th�m ch� kh�ng r�t tr�ng c�ng c� th� nh�n 2 l�n v�t ph�m B�ng Lai, ch�c may m�n!")
end

function about_2007_award() --��������鲻ͬ
	Talk(1,"about_old_award","<color=green>D� T�u<color>: Ng��i �� trong giang h� l�u nh� v�y, ta s� trao t�t c� nh�ng kinh nghi�m giang h� m� ta �� tr�i qua v� V� l�m m�t v�n cho ng��i. (Danh hi�u ��c bi�t, D� T�u V� l�m m�t v�n truy�n nh�n, sau khi m� m�i ph�t t�ng 0.3% kinh nghi�m, khi 0.3% l�n h�n 507141, nh�n nhi�u nh�t 507141, m�i ng�y t�c d�ng 1 gi�, sau 15 ng�y s� m�t danh hi�u)\nSau khi ng��i �� tham gia t�t c� ho�t ��ng V� l�m tranh b� th� c� th� r�t 1 l�n th�m � ��y, n�u r�t tr�ng s� c� th� nh�n ���c to�n b� trang b� Vi�m Ho�ng �� ho�c trang b� Thi�n ��a Huy�n Ho�ng, th�m ch� kh�ng r�t tr�ng c�ng c� th� nh�n 2 l�n v�t ph�m B�ng Lai, ch�c may m�n!")
end

function goto_shifu()
	local nFaction = GetPlayerFaction();
	if nFaction ~= 0 then
		NewWorld(tShifu[nFaction][2],tShifu[nFaction][3],tShifu[nFaction][4]);
	end
end

function restore_all()
	CureWound(2);
	RestoreAll();
end

function tiandi_choujiang()
	local nNum = GetTask(TASK_AWARD_NUM);
	if nNum < 4 then
		Talk(1,"","<color=green>D� T�u<color>: Ch� c� ng��i ch�i tham gia 4 l�n s� c�p,  M�n ph�i tranh b� b�t ��u t� 20 th�ng 7, m�i c� th� r�t th�m!");
	else
		if GetTask(TASK_TIANDI_CHOUJIANG) ~= 0 then
			Talk(1,"","<color=green>D� T�u<color>: Ng��i �� r�t th��ng r�i.");
			return
		end
		if Zgc_pub_goods_add_chk(6,600) ~= 1 then
			return
		end
		SetTask(TASK_TIANDI_CHOUJIANG,1);
		local nRoute = GetPlayerRoute();
		local nBody = GetBody();
		local nRand = random(1,10000);
		if nRand <= 1 then
			AddItem(tYandi[1][2],tYandi[1][3],tYandi[1][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tYandi[2][2],tYandi[2][3],tYandi[2][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tYandi[3][2],tYandi[3][3],tYandi[3][4]+nBody,1,1,-1,-1,-1,-1,-1,-1);
			local nRandOne = random(1,getn(tXuanyuanZhan[nRoute]));
			AddItem(tXuanyuanZhan[nRoute][nRandOne][2],tXuanyuanZhan[nRoute][nRandOne][3],tXuanyuanZhan[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tXuanyuanDou[nRoute][nRandOne][2],tXuanyuanDou[nRoute][nRandOne][3],tXuanyuanDou[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			AddItem(tHuangDiWeapon[nRoute][nRandOne][2],tHuangDiWeapon[nRoute][nRandOne][3],tHuangDiWeapon[nRoute][nRandOne][4],1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 b� trang b� Vi�m Ho�ng!");
			Msg2Global("Ng��i ch�i"..GetName().."Tham gia r�t th�m may m�n V� l�m tranh b� nh�n ���c 1 b� Vi�m Ho�ng!");
			AddGlobalCountNews("Ng��i ch�i"..GetName().."Tham gia r�t th�m may m�n V� l�m tranh b� nh�n ���c 1 b� Vi�m Ho�ng!",2);
			WriteLog("[V� l�m tranh b�]: Ng��i ch�i"..GetName().."Tham gia r�t th�m may m�n V� l�m tranh b� nh�n ���c 1 b� Vi�m Ho�ng!");
		elseif nRand <= 2 then
			AddItem(2,0,1055,1);
			AddItem(2,0,1056,1);
			AddItem(2,0,1057,1);
			AddItem(2,0,1058,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 b� Thi�n ��a Huy�n Ho�ng!");
			Msg2Global("Ng��i ch�i"..GetName().."Tham gia r�t th�m may m�n V� l�m tranh b� nh�n ���c 1 b� Thi�n ��a Huy�n Ho�ng!");
			AddGlobalCountNews("Ng��i ch�i"..GetName().."Tham gia r�t th�m may m�n V� l�m tranh b� nh�n ���c 1 b� Thi�n ��a Huy�n Ho�ng!",2);
			WriteLog("[V� l�m tranh b�]: Ng��i ch�i"..GetName().."Tham gia r�t th�m may m�n V� l�m tranh b� nh�n ���c 1 b� Thi�n ��a Huy�n Ho�ng!");			
		else
			AddItem(2,0,109,2,4); 
			Msg2Player("Ch�c m�ng b�n nh�n ���c 2 B�ng Lai Ti�n L�");
			Talk(1,"","<color=green>D� T�u<color>: Ng��i �� r�t 1 l�n th�m, xin xem nh�c nh� h� th�ng, xem ng��i r�t ���c g�!")
		end
	end
end

--=================== ��������ս ============================
--����3��ʦ��װ��
--nRoute��·��
--nBody������
--nGeneration��ָ��Ϊ�ڼ���
--nSpecFlag��רΪ�����׼����������ǡ�0Ϊ�����͹���1������2����
--���ú�����Ҫԭ������������ĵ�3��ʦ������Ϊ�װ������AddItem��4��������Ϊ4��
function fe_AddFactionEquipmentTHree(nRoute,nBody,nGeneration,nSpecFlag)
	if callback_date_check() ~= 1 then
		return
	end
	nSpecFlag = nSpecFlag or 0; 
	local nYears,nMonths,nDays = GmTime(GetTime()+28800);
	local nFlag,nIdx = 0,0;
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11};
	if nRoute == 8 or nRoute == 9 then	--�������⴦��
		nID3 = nRoute*1000+(nGeneration-1)*100+(nBody-2)*10+9;
	else
		nID3 = nRoute*1000+(nGeneration-1)*100+nBody*10+9;
	end;
	nFlag,nIdx = AddItem(0,103,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,100,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,101,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	nFlag,nIdx = AddItem(0,102,nID3,1,4,-1,-1,-1,-1,-1,-1);
	gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	if nRoute == 2 then	--�����������׼�
		if nSpecFlag == 0 or nSpecFlag == 1 then
			nFlag,nIdx = AddItem(0,5,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
		if nSpecFlag == 0 or nSpecFlag == 2 then
			nFlag,nIdx = AddItem(0,3,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
	else
		nID2 = tbWeaponID2[nRoute];
		if nID2 ~= nil then
			nFlag,nIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,0,10);
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
		end;
	end;
	if nGeneration >= 3 then	--�����׿�ʼ����2����ָ
		--��һ����ָ		
		if nRoute == 2 or nRoute == 3 or nRoute == 4 then
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody+2)*10+9;
		elseif nRoute == 8 or nRoute == 9 then	
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody)*10+9;
		else
			nID3 = nRoute*1000+(nGeneration-1)*100+(nBody+4)*10+9;
		end	
			nFlag,nIdx = AddItem(0,102,nID3,1,4,-1,-1,-1,-1,-1,-1);	
			gf_SetItemExpireTime(nIdx,nYears,nMonths,nDays,23,59,0);
	end
end;

--������Ʒ����������Ʒ�Ĵ���ʱ��
--�����������Ϊ2,������SetItemExpireTime
--���������������2,��Ϊֱ��������Ʒ�ĵ���ʱ��
function gf_SetItemExpireTime(nItem, ...)
	if nItem == nil or nItem == 0 then
		return 0;
	end
	local nArgSize = getn(arg);
	if nArgSize == 1 then
		SetItemExpireTime(nItem,arg[1]);
		return 0;
	end;
	
	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
	local nTimePassed = nThatTime - nCurTime;
	if nTimePassed < 0 then
		nTimePassed = 0;
	end;
	SetItemExpireTime(nItem,nTimePassed);
	return nTimePassed;
end;

--�������ƣ�NPC����ֵ�趨
--��        �ܣ�ֱ���趨NPC����λ�õ�ֵ
function gf_SetUnitCurState(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function wulin_zhengba()
	Say("V� l�m tranh b� ch�a b�t ��u!",0)
	do return end
	local strtab = {
		"Ta mu�n nh�n trang b� chuy�n d�ng V� l�m tranh b� (1 b� trang b� �� c��ng h�a 10, ch� d�ng trong ng�y V� l�m tranh b�)/get_wulin_zhuangbei", --�����Ϊǿ10
		"Ta mu�n xem th�nh t�ch b�n m�n, nh�n ph�n th��ng tranh b�/#get_wulin_award(1)",
		"Ta mu�n nh�n ph�n th��ng m�n ph�i tu�n n�y/#get_wulin_award(2)",
		"T�m hi�u chi ti�t V� l�m tranh b�/about_wulin_zhengba",
		"Kh�ng v�n �� g�/nothing"
		}
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end
	if nIdx ~= 0 then
		Say(tShifu[nIdx][5].."��i h�i v� l�m Thi�n h� �� nh�t s�p b�t ��u, c� h�i cho ng��i ch�i m�i thi ��u V� l�m tranh b� c�ng s�p b�t ��u, ch� nh�t m�i tu�n ��u ti�n h�nh V� l�m tranh b�, n�i dung chi ti�t ta s� gi�i th�ch! N�u b�n m�n ��t th�nh qu� nh�t ��nh trong V� l�m tranh b� s� c� l�i cho t�t c� �� t� trong m�n ph�i! <color=yellow>Xin ch� �, t� th� kh�ng th� t�ng th�m th�nh t�ch!<color>",
			getn(strtab),
			strtab)
	end
end

function get_wulin_zhuangbei()
	local nLv = GetLevel();
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end	
	if nFaction ~= nIdx then
		Talk(1,"",tShifu[nIdx][5].."Ng��i kh�ng ph�i �� t� b�n m�n");
		return
	end
	if nLv < 70 then	
		Talk(1,"",tShifu[nIdx][5].."Ta c�ng mu�n t�ng ng��i, nh�ng ��ng c�p c�a ng��i qu� th�p, kh�ng th� m�c ���c! ��n c�p 70 h�n ��n t�m ta!");
		return
	end
	if nRoute == 0 or nRoute == 1 or	nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute == 16 or nRoute == 19 then
		Talk(1,"",tShifu[nIdx][5].."Ng��i ch�a gia nh�p l�u ph�i, l�y trang b� n�y c�ng kh�ng d�ng ���c.");
		return
	end
	if callback_date_check() ~= 1 then
		Talk(1,"",tShifu[nIdx][5].."V� l�m tranh b� tr�n s� ���c t� ch�c v�o ch� nh�t m�i tu�n, xin nh�n v�o ch� nh�t.");
		return
	end
	if Zgc_pub_goods_add_chk(6,600) ~= 1 then
		return
	end
	fe_AddFactionEquipmentTHree(nRoute,nBody,3);
end


function get_wulin_award(nType)
	local nFaction = GetPlayerFaction();
	local nPos = GetWorldPos();
	local nLv = GetLevel();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end	
	if nFaction ~= nIdx then
		Talk(1,"",tShifu[nIdx][5].."Ng��i kh�ng ph�i �� t� b�n m�n");
		return
	end	
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate < 20080720 or nDate > 20080816 then
--		Talk(1,"",tShifu[nIdx][5].."��������ս��7��20�գ�7��27�գ�8��3�գ�8��10�վ��У��������ʱ����ȡ��");
--		return
--	end
	if nLv < 70 then
		Talk(1,"",tShifu[nIdx][5].."Tham gia V� l�m tranh b� tr�n y�u c�u c�p 70 tr� l�n");
		return
	end
	local nNpcIdx = GetTargetNpc();
	local nWeek = GetWeekSequence(7,0);
	local nNpcWeek = GetUnitCurStates(nNpcIdx,1);
	local nKillDate = GetTask(TASK_KILL_DATE);
	if nType == 1 then 
		if GetTask(TASK_AWARD_WEEK) == nWeek then
			Talk(1,"",tShifu[nIdx][5].."B�n �� nh�n ph�n th��ng tranh b� tr�n tu�n n�y. Tu�n n�y b�n �� th�ng m�n ph�i kh�c <color=yellow>"..GetTask(TASK_KILL_PLAYER).."<color> ng��i.");
			return
		end
		if Zgc_pub_goods_add_chk(1,20) ~= 1 then
			return
		end
		if nNpcWeek ~= nWeek then
			gf_SetUnitCurState(nNpcIdx,1,nWeek);
			gf_SetUnitCurState(nNpcIdx,4,0);
			gf_SetUnitCurState(nNpcIdx,5,0);
		end
		if nKillDate ~= nWeek then
			SetTask(TASK_KILL_DATE,nWeek);
			SetTask(TASK_KILL_PLAYER,0);
			SetTask(TASK_KILLED_NUM,0);
		end
		local nKillNum = GetTask(TASK_KILL_PLAYER);
		local nKilledNum = GetTask(TASK_KILLED_NUM);
		local nExp = floor(nLv^3*10);
		
		if nKilledNum+nKillNum >= 10 then
			SetTask(TASK_AWARD_WEEK,nWeek);
			gf_SetUnitCurState(nNpcIdx,4,(GetUnitCurStates(nNpcIdx,4)+nKillNum));
			if nKillNum >= nKilledNum then
				gf_SetUnitCurState(nNpcIdx,5,(GetUnitCurStates(nNpcIdx,5)+1));
				if nLv ~= 99 then
					ModifyExp(nExp);
					Msg2Player("B�n nh�n ���c "..nExp.."Kinh nghi�m");
					Talk(1,"",tShifu[nIdx][5].."H�m nay b�n �� th�ng m�n ph�i kh�c <color=yellow>"..nKillNum.."<color> ng��i, b�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c. �� t� b�n m�n qu� nhi�n tinh anh, �� ta ch� cho ng��i m�t �t v� c�ng!");
				else
					AddItem(2,1,3210,20);
					Talk(1,"",tShifu[nIdx][5].."H�m nay b�n �� th�ng m�n ph�i kh�c <color=yellow>"..nKillNum.."<color> ng��i, b�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c. V� c�ng c�a ng��i �� ti�n b� nhi�u, ta kh�ng c�n g� �� d�y ng��i n�a, ��y l� m�t s� k� n�ng t�m ��c c�a ta, t�ng cho ng��i ��!");
				end
			else
				if nLv ~= 99 then
					ModifyExp(nExp);
					Msg2Player("B�n nh�n ���c "..nExp.."Kinh nghi�m");
					Talk(1,"",tShifu[nIdx][5].."H�m nay b�n �� th�ng m�n ph�i kh�c <color=yellow>"..nKillNum.."<color> ng��i, b�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c. Ng��i m�c d� th�t th� h�i nhi�u, nh�ng kh�ng n�n n�n l�ng, ta s� d�y cho ng��i m�t s� v� c�ng!");
				else
					AddItem(2,1,3210,20);
					Msg2Player("B�n nh�n ���c 20 quy�n Thi�n Th�i Ch� Gi�i.");
					Talk(1,"",tShifu[nIdx][5].."H�m nay b�n �� th�ng m�n ph�i kh�c <color=yellow>"..nKillNum.."<color> ng��i, b�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c. V� c�ng c�a ng��i �� ti�n b� nhi�u, ta kh�ng c�n g� �� d�y ng��i n�a, ��y l� m�t s� k� n�ng t�m ��c c�a ta, t�ng cho ng��i ��!");
				end
			end
		else
			Talk(1,"",tShifu[nIdx][5].."B�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c. B�t lu�n th�ng thua c�ng n�n th� s�c m�t phen! C� th� xem sao, th� th�ch v�i l�n!");
		end
	elseif nType == 2 then
		if GetTask(TASK_MENPAI_AWARD) == nWeek then
			Talk(1,"",tShifu[nIdx][5].."B�n �� nh�n ph�n th��ng m�n ph�i tu�n n�y. B�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c.");
			return
		end
		if Zgc_pub_goods_add_chk(3,40) ~= 1 then
			return
		end	
		if GetTask(TASK_AWARD_WEEK) ~= nWeek then
			Talk(1,"",tShifu[nIdx][5].."B�n ph�i nh�n ph�n th��ng V� l�m tranh b� tr��c sau �� m�i nh�n ph�n th��ng m�n ph�i.");
			return
		end
		if GetUnitCurStates(nNpcIdx,4) >= 100 then
			local tItem = {	
			[1] = {2,0,448,"Ph� Hi�n X� L�i"},	--����
			[2] = {2,0,469,"Thi�n C� M�c"},--�䵱
			[3] = {2,0,457,"Kim Li�n Hoa"},--����
			[4] = {2,0,466,"T� Kim B�t"},--ؤ��
			[5] = {2,0,454,"B� ��c ph��ng"},--����	
			[6] = {2,0,477,"Tinh B� Ti�n ��i"},	--����
			[7] = {2,0,484,"R�t ��c"},--�嶾
			[8] = {2,0,491,"Mai Qu� L�"},--����
			[9] = {2,0,495,"Khu Ma H��ng"},--����
			[10] = {2,0,499,"Th�nh H�a L�nh"}--����
			};			
			SetTask(TASK_MENPAI_AWARD,nWeek);
			AddItem(2,0,141,2,4);
			AddItem(tItem[nFaction][1],tItem[nFaction][2],tItem[nFaction][3],20);
			Talk(1,"",tShifu[nIdx][5].."B�n m�n �� c� <color=yellow>"..GetUnitCurStates(nNpcIdx,5).."<color> �� t� d�nh th�ng l�i khi t� v� v�i �� t� m�n ph�i kh�c. Ch��ng  m�n r�t h�nh di�n, quy�t ��nh cho m�i �� t� 2 Ti�u Ki�p t�n v� 20 t�n v�t trang b� S� M�n 4, hy v�ng m�i ng��i ti�p t�c c� g�ng!");
		else
			Talk(1,"",tShifu[nIdx][5].."M�c d� ng��i �� c� g�ng, nh�ng v� h�c b�n m�n n�u ch� d�a v�o n�ng l�c c� nh�n th� kh�ng ��. Nh�ng �� t� h�i b�o chi�n t�ch c�a m�nh, s� ���c ch��ng m�n ban th��ng!");
		end
	end
end

function about_wulin_zhengba()
	local nPos = GetWorldPos();
	local nIdx = 0;
	for i=1,getn(tShifu) do
		if tShifu[i][2] == nPos then
			nIdx = i;
			break
		end
	end		
	Talk(2,"wulin_zhengba",tShifu[nIdx][5].."��i h�i t� v� s�p b�t ��u, m�i ng�y trong tu�n b�n c� th� m�c Th�n Gi�p Tr� ta ban cho �� t� th� v�i c�c h�o ki�t kh�c, ��ng �� h� xem th��ng b�n m�n, Th�n Gi�p Tr� n�y n�u b� h� c� th� t�m ta �� nh�n. Ngo�i ra D� T�u s� gi�p m�i ng��i tr� th��ng trong th�i gian di�n ra cu�c thi.\n    T�t c� th�nh t�ch � chi�n tr��ng, ��i h�i t� v� v� PK ngo�i th�nh s� ���c ��a v�o th�nh t�ch Tranh B� tr�n! ��i th� ph�i l� ng��i c�a m�n ph�i kh�c! (c�p 60 tr� l�n)\n    L�u �, khi ti�n h�nh t� th� kh�ng th� t�ng th�nh t�ch!","    �� �i�u ki�n, s� nh�n ���c kinh nghi�m t��ng �ng (c�p 80 l� 512 v�n, dao ��ng t�y theo ��ng c�p ng��i ch�i), ng��i ch�i c�p 99 c� th� nh�n ���c 20 quy�n Thi�n Th�i Ch� Gi�i.\n    �� �i�u ki�n nh�n ph�n th��ng m�n ph�i, c� th� nh�n 2 Ti�u Ki�p t�n, 20 t�n v�t S� M�n 4.")
end