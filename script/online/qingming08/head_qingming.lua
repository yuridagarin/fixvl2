--File name:head_qingming.lua
--Describe:�����ڻ�ű�ͷ�ļ�
--Create Date:2008-3-18
--Author:ChenMoxian

--ȫ�ֳ���
FALSE = 0;	--���Ŷ��������ĳ�����ʹ�����������һ���
TRUE = 1;
QINGMING_SWITCH = TRUE;	--����ء���Ϊ�أ���Ϊ��
--=========�������ÿ������շ��������ͬһ���ű���ֻҪ���Ŀ��ؾͿ�����========
IS_SHOUFEI = FALSE;--true�շ���false�����
--===========================================================================
--ȫ�ֱ���
--�ɶ�300�꾩200Ȫ��100��ͼid
--���������
--TSK_QINGMING_2008_ISINITED			= 1851 --��¼ȥ����������Ƿ��Ѿ�ȫ����ʼ���������õ�
--TSK_QINGMING_2008_BAI_TOTAL			= 1851--��¼����ۼ�ߵͷ������
--TSK_QINGMING_2008_BAI_LASTTIME	= 1852--��¼����ϴ�ߵͷ������
--TSK_QINGMING_2008_ITEMISUSED		= 1853--��¼����Ʒ�����Ƿ��ù�
--TSK_QINGMING_2008_PROBABILITY		= 1854--��¼����Ʒʹ�ú���ߵĸ���

EnterPointTab = {	--��¼������ͼ�Ľ������ꡣ��Щ����߻�����û��,��ȥ���
			[1] = {820,1636,3181},	--Ȫ��
			[2] = {819,1636,3181},	--�꾩
			[3] = {818,1636,3181},	--�ɶ�
			};
LeavePointTab = {	--��¼����Ĺ����ʱ�����ꡣ��Щ����߻�����û��,��ȥ���
			[1] = {100,1453,2812},	--Ȫ�ݡ�����ڣ
			[2] = {200,1170,2834},	--�꾩������ڣ
			[3] = {300,1640,3531},	--�ɶ�����ԯ��ڣ
			};

--�жϽ����Ƿ񿪷�
function is_qingming_opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080403 then
		return -1;--�����δ��ʱ��
	elseif nDate > 20080412 then
		return 0;--�ѹ���
	elseif QINGMING_SWITCH == TRUE then
		return 1;--�ڿ���ʱ���ҿ���Ϊ��
	else
		return 2;--���عر�
	end;
end;

--�õ���ҵ��Ա��ַ�������\script\task\world\task_head.lua����copy�����ġ�
--Copyright��2005�@peres
function get_player_sex()	
	local mySex -- ������ʾ�����Ա���ַ�
	if (GetSex() == 1) then
		mySex = "Thi�u hi�p";
	elseif (GetSex() == 2) then
		mySex = "C� n��ng";
	end;
	return mySex;
end;

function nothing()--�պ���,�����Ի�
	
end;

function get_type()--������ڣ����1����2����3��ԯ��
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;
	local nType = 0;

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--����������ڵ�ͼid���ж�����ҶԻ������ĸ���ڣ����·��
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		nType = 1;
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		nType = 2;
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		nType = 3;
	else
		WriteLog("Thanh Minh 2008: B�n �� ng��i ch�i s� t�i v� b�n �� ng��i d�n ���ng kh�ng ph� h�p.");
		return FALSE;--����
	end;
	
	return nType;
end;
function get_transport_name()--������ڣ��·������
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;
	local szTransportName ="";

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--����������ڵ�ͼid���ж�����ҶԻ������ĸ���ڣ����·��
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		szTransportName = "Ho�ng ��i hi�p (d�n ���ng)";
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		szTransportName = "H�n ��i hi�p (d�n ���ng)";
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		szTransportName = "Hi�n Vi�n ��i hi�p (d�n ���ng)";
	else
		WriteLog("Thanh Minh 2008: B�n �� ng��i ch�i s� t�i v� b�n �� ng��i d�n ���ng kh�ng ph� h�p.");
		return FALSE;--����
	end;
	
	return szTransportName;
end;

function get_tomb_name()--������ڣ����
	local nLocalMapID = 0;
	local nLocalPosX = 0;
	local nLocalPosY = 0;

	local szTombName = "";

	nLocalMapID,nLocalPosX,nLocalPosY = GetWorldPos();
	--����������ڵ�ͼid���ж�����ҶԻ������ĸ���ڣ����·��
	if nLocalMapID == EnterPointTab[1][1] or nLocalMapID == LeavePointTab[1][1] then
		szTombName = "Ho�ng ��i hi�p";
	elseif nLocalMapID == EnterPointTab[2][1] or nLocalMapID == LeavePointTab[2][1] then
		szTombName = "H�n ��i hi�p";
	elseif nLocalMapID == EnterPointTab[3][1] or nLocalMapID == LeavePointTab[3][1] then
		szTombName = "Hi�n Vi�n ��i hi�p";
	else
		WriteLog("Thanh Minh 2008: B�n �� ng��i ch�i s� t�i v� b�n �� ng��i d�n ���ng kh�ng ph� h�p.");
		return FALSE;--����
	end;
	
	return szTombName;
end;