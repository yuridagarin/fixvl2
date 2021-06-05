--File name:qingming_head.lua
--Describe:�����ڻ�ű�ͷ�ļ�
--Create Date:2006-3-15(315�����ߵĽ���)
--Author:yanjun

--ȫ�ֳ���
FALSE = 0;	--���Ŷ��������ĳ�����ʹ�����������һ���
TRUE = 1;
QINGMING_SWITCH = TRUE;	--����ء���Ϊ�أ���Ϊ��
--ȫ�ֱ�����

--���������
QINGMING_TASK = 1875;	--���������Ϊ�Ĳ�����ʹ��
						--1�ֽڼ�¼���Ŀǰߵ���˶��ٴ�
						--2�ֽڼ�¼������û�аݹ�
						--3�ֽڼ�¼����ǲ������ţ����춼ȥ�ݼ���
						--4�ֽ�
JIBAI_ITEM = 1876;	--���������Ϊ�Ĳ�����ʹ��
					--1�ֽڼ�¼��ҵ�����û��ʹ�ù���Ʒ��ͷ
					--2�ֽڼ�¼��ҵ�����û��ʹ�ù���Ʒ����
					--3�ֽڼ�¼��ҵ�����û��ʹ�ù���Ʒ�Ͼ�
					--4�ֽڼ�¼���ʹ�ü�����Ʒ����ߵĸ���

EnterPointTab = {	--��¼������ͼ�Ľ������ꡣ
			[1] = {818,1636,3181},	--Ȫ��
			[2] = {820,1636,3181},	--�꾩
			[3] = {819,1636,3181},	--�ɶ�
			};
LeavePointTab = {	--��¼����Ĺ����ʱ������
			[1] = {100,1453,2812},	--Ȫ�ݡ�����ڣ
			[2] = {200,1170,2834},	--�꾩������ڣ
			[3] = {300,1640,3531},	--�ɶ�����ԯ��ڣ
			};
		
--=============================================================================================
--==================================��غ���===================================================
--�жϽ����Ƿ񿪷�
function Is_QingMing_Opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if QINGMING_SWITCH == TRUE and nDate >= 20060331 and nDate <=20060409 then
		return TRUE;
	else
		return FALSE;
	end;
end;

--�Զ���д��־��������һ������Ϊ�¼������ڶ�������Ϊ�¼�����
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--�õ���ҵ��Ա��ַ�������\script\task\world\task_head.lua����copy�����ġ�
--Copyright��2005�@peres
function GetPlayerSex()	
	local mySex -- ������ʾ�����Ա���ַ�
	if (GetSex() == 1) then
		mySex = "Thi�u hi�p";
	elseif (GetSex() == 2) then
		mySex = "C� n��ng";
	end;
	return mySex;
end;

--����ĳ���������ĳһ�ֽڵ�ֵ
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--�õ�ĳ�������ĳһ�ֽڵ�ֵ
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;