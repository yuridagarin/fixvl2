--File name:dragonboat_head.lua �����Ӣ��ԭ����dragon boat festival��
--Describe:����ڻ�ű�ͷ�ļ�
--Create Date:2006-4-18
--Author:yanjun
--==================ȫ�ֳ���======================================
MULTIPLE = 2;	--���ø�౶�ʱ�ı������ʱ����Get_Multiple_Status���壬�ǻʱ�䱶��Ϊ��
FALSE = 0;
TRUE = 1;

POSITION = 1710; --������¼����������ϵ�λ��
RANK = 1711;	--��¼��Ҿ���TRAP��ʱ������
ENTERORDER = 1712; --��¼��ҽ��볡�صĴ���
BONUSPOINT = 1713; --��¼��һ���
ATTENDCOUNT = 1714; --��¼�����ɱ����Ĵ���
STATUS = 1715;	--��¼����ǹ��ڻ��ǲ���ѡ�֡�0ʲô�����ǣ�1Ϊ���ڣ�2Ϊ����ѡ��
CURMAP = 1716;	--��¼������ڳ���ID
--================================================================
FINISHTIME = 1717	--��¼��ɱ������õ�ʱ�䣬��λΪ֡��
--======================��Խ�����������==========================
FLAG_COLOR = 1718;	--������¼֮ǰ����ʲô���ӣ�1��ʾ���죬2��ʾ���죬3��ʾ����
--��¼�����Ƿ񱻴�����һȦһ����49�����ӣ�����Ҫ������32λ�����������
FLAG_BEGIN = 1719;
FLAG_END = 1720;
ATTENDCOUNTPERDAY1 = 1721	--������¼��ҵ�����ɱ����Ĵ���
ATTENDCOUNTPERDAY2 = 1727	--��¼�μӱ���������
ATTENDCOUNTPERDAY3 = 1728	--��¼������û����ȡ������
GETXDZZCOUNT = 1722	--������¼�����ȡ�̵����ӵĴ���

AWARD_YT1 = 1704	--����	��¼��ȡ������
AWARD_YT2 = 1729	--��¼��ȡʱ��
AWARD_SLGZ1 = 1705	--��������	��¼��ȡ����
AWARD_SLGZ2 = 1611	--��¼��ȡʱ��
AWARD_JXZZ1 = 1706	--��������	��¼��ȡ����
AWARD_JXZZ2 = 1612	--��¼��ȡʱ��
AWARD_TXDMHG1 = 1707	--̫����ۻ���	��¼��ȡ����
AWARD_TXDMHG2 = 1613	--��¼��ȡʱ��
AWARD_HWJS1 = 1708	--���پ�ʯ��	��¼�ܹ���ȡ����
AWARD_HWJS2 = 1614	--��¼������ȡ����
AWARD_HWJS3 = 1615	--��¼��ȡʱ��
AWARD_ZZDLB1 = 1709	--���Ӵ����	��¼�ܹ���ȡ����
AWARD_ZZDLB2 = 1616	--��¼������ȡ����
AWARD_ZZDLB3 = 1617	--��¼��ȡʱ��
AWARD_HLB1 = 1723	--���ײ�	��¼�ܹ���ȡ����
AWARD_HLB2 = 1618	--��¼������ȡ����
AWARD_HLB3 = 1619	--��¼��ȡʱ��
AWARD_DJSWQZZSC1 = 1724	--��ʦ������������	��¼�ܹ���ȡ����
AWARD_DJSWQZZSC2 = 1620	--��¼������ȡ����
AWARD_DJSWQZZSC3 = 1621	--��¼��ȡʱ��
AWARD_QYZP = 1725	--��ԭ֮��	�Ƿ���ȡ����ԭ֮��
AWARD_REPUTATION = 1726	--��ȡ��������
BEST_TIME = 1622	--��¼��ҵ����ʱ��(֡��)
AWARD_ZZLB = 1624	--��¼�����ȡ�������������
AWARD_CSZZ1 = 1625	--��¼������ȡ�������ӵĴ���
AWARD_CSZZ2 = 1626	--��¼��ȡ�������ӵ�ʱ��
AWARD_DIARY1 = 1627	--��¼������ȡ�����ռǵĴ���
AWARD_DIARY2 = 1628	--��¼��ȡ�����ռǵ�����
--================================================================
NumTab = {"m�t","hai","ba","b�n","Ng� ","s�u","b�y","t�m","ch�n","Th�p"};
--================================================================
RoomName = {
		"M�n Giang  ",
		"C�u Long Giang",
		"T�n Giang  ",
		"Thinh Giang  ",
		"Giao Kh�  ",
		"M�ch La Giang",
		"M�c Lan Kh�",
		"Ch�u Giang  ",---------------------------------------		
		"Ho�ng H�  ",
		"H�ng Y Gi�n",
		"L�c H�  ",
		"Y H�  ",
		"M�ng H�  ",
		"T�m H�  ",
		"�an H�  ",
		"M�u ��n Giang",----------------------------------------	
		"Tr��ng Giang  ",
		"Ph� H�  ",
		"Nam H�  ",
		"Sa H�  ",
		"Thanh Th�y H�",
		"Giang An H�",
		"Kim Sa H�",
		"D��ng T� Giang",
		};
--=================================================================================================
BoatInfo = {
		{"Thuy�n R�ng ph� th�ng","Thuy�n R�ng ph� th�ng kh�ng c� m�u s�c v� t�nh n�ng ��c bi�t."},
		{"Thuy�n R�ng Th�y Ph�o","C� kh� n�ng b�n th�y ��n r�t m�nh v� t�n c�ng ��i th� t� xa."},
		{"Thuy�n R�ng Th�y L�i","C� kh� n�ng ch�n th�y l�i d��i n��c, ��i th� �i qua s� b� ch�n ��ng."},
		{"Thuy�n R�ng Th�y L�ng","C� kh� n�ng t�o ra m�t b�c t��ng s�ng ng�n c�n ��i ph��ng �i qua."},
		{"Thuy�n r�ng �o�n Binh","Tuy�n th� b�n c�nh t�m th�i kh�ng th� ti�n l�n"},
		{"Thuy�n R�ng Li�n X�","C� kh� n�ng b�n th�y ��n khi�n ��i th� b� cho�ng, �u �i�m l� m�t l�n c� th� b�n nhi�u ph�t."},
		{"Thuy�n r�ng Ti�m H�nh","Khi b� t��ng s�ng c�a ��i th� t�n c�ng kh�ng nh�ng kh�ng b� cho�ng m� c�n m��n s�c m�nh c�a t��ng s�ng l�n xu�ng n��c tr�nh ��i th� trong m�t kho�ng th�i gian."},
		};
--=================================================================================================
BoxPos = {
	{2007,3266},
	{1981,3259},
	{1969,3229},
	{1944,3279},
	{1935,3307},
	{1909,3303},
	{1893,3316},
	{1893,3353},
	{1882,3305},
	{1845,3252},
	{1836,3285},
	{1817,3309},
	{1791,3344},
	{1774,3323},
	{1752,3314},
	{1739,3272},
	{1712,3228},
	{1700,3286},
	{1678,3286},
	{1653,3309},
	{1645,3341},
	{1634,3301},
	{1611,3291},
	{1596,3350},
	{1604,3384},
	{1619,3406},
	{1647,3450},
	{1677,3469},
	{1693,3427},
	{1699,3391},
	{1701,3344},
	{1717,3357},
	{1730,3377},
	{1755,3404},
	{1765,3449},
	{1782,3467},
	{1808,3523},
	{1827,3600},
	{1857,3561},
	{1852,3491},
	{1888,3467},
	{1907,3478},
	{1935,3460},
	{1914,3414},
	{1929,3368},
	{1955,3396},
	{1987,3427},
	{2008,3383},
	{2056,3415},
	{2057,3375},
	{2042,3314},
		};
BOXCOUNT = 10;
--=================================================================================================
g_TotalRoomNum = 8;	--һ�������ж��ٸ���������
LeavePoint = {
		{100,1462,2803},	--Ȫ��
		{200,1167,2839},	--�꾩
		{300,1645,3534},	--�ɶ�
		}
--������ɫID   FlagColor
FC_RED = 1;	
FC_YELLOW = 2;
FC_BLUE = 3;
--�����������
MAGIC_RR = 11;	--ը����������ѡ��
MAGIC_RY = 12;	--ը���Լ���ǰ��ѡ��
MAGIC_RB = 13;	--ը�ε�һ��
MAGIC_YR = 21;	--���ʹһ��ѡ�������Լ����
MAGIC_YY = 22;	--������Լ�ת�Ƶ���һ��ѡ�ֵ����
MAGIC_YB = 23;	--ȫ����ң������Լ���
MAGIC_BR = 31;	--ǰ��������
MAGIC_BY = 32;	--�������
MAGIC_BB = 33;	--ȫ�����
--================================================================
--Modify:ȥ����ֹʱ�����ƣ��û��������ȥ��
function Get_DragonBoatDay_State()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20060530 then
		return 0;	--���ʼǰ
	elseif nDate > 20060710 then
		return 3;	--�콱��ֹ		��Ҫֹͣ��ʱ�򷵻�1
	elseif nDate > 20060630 then
		return 3;	--�������	��Ҫ������ʱ�򷵻�2
	else
		return 3;	--�������
	end;
end;

function nothing()

end;
--�Զ���д��־��������һ������Ϊ�¼������ڶ�������Ϊ�¼�����
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..Content);
end;

function Create_Box(nCount)
	local nRandomNum;
	local MapID = GetWorldPos();
	if nCount >= 1 or nCount <= getn(BoxPos) then
		for i=1,nCount do
			nRandomNum = random(1,getn(BoxPos));
			local npcBox = CreateNpc("R��ng ti�n","B�o r��ng",MapID,BoxPos[nRandomNum][1]+random(-3,3),BoxPos[nRandomNum][2]+random(-3,3))
			SetNpcScript(npcBox,"\\script\\online\\dragonboat06\\box.lua")			
		end;
	else
		Write_Log("Ho�t ��ng t�t �oan Ng� sai s�t","Khi m� r��ng, l�i s� r��ng, tr� b�o l�i l�:"..nCount);
	end;
end;

function Get_Multiple_Status()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070614 and nDate <= 070624 then
		return 1;
	else
		return 0;
	end;
end;