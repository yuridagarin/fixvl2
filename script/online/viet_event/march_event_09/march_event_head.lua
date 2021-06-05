--File name:	march_event_head.lua
--Describe:		���»head�ļ�
--Create Date:	2009-02-17
--Author:		chenbenqian


SWITCH_09_WOMEN_0308_VIET = 1;					--��Ů�ڻ����

DATE_09_WOMEN_0308_VIET_START = 2009030600;		--��Ů�ڻ��ʼ����
DATE_09_WOMEN_0308_VIET_END = 2009030900;		--��Ů�ڻ��������


SWITCH_09_MARCH_VIET = 1;						--���»����

DATE_09_MARCH_VIET_START = 2009031300;			--���»��ʼ����
DATE_09_MARCH_VIET_END = 2009040600;			--���»��������

SUGAR_EXP_LIMIT_09_MARCH_VIET = 150000000		--���»���ǿɻ�õ��ܹ�����ֵ����
PEARL_EXP_LIMIT_09_MARCH_VIET = 50000000		--���»����ɻ�õ��ܹ�����ֵ����


--���»ʹ�õ��������
SUGAR_TOTALEXP_09_MARCH_VIET = 2119				--��¼���»���ǻ�õ��ܹ��ľ���
PEARL_TOTALEXP_09_MARCH_VIET = 2120				--��¼���»�����õ��ܹ��ľ���

--��Ů�ڻʹ�õ��������
GAIN_AWARD_09_WOMEN_0308_VIET = 2121			--��¼�Ƿ���ȡ�˸�Ů�ڻ����


--===================================================================================================

--���»���ŷ���1���رշ���0
function is_march_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_MARCH_VIET_START and nDate < DATE_09_MARCH_VIET_END then
		return SWITCH_09_MARCH_VIET;
	else
		return 0;
	end
end

--��Ů�ڻ���ŷ���1���رշ���0
function is_women_0308_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_WOMEN_0308_VIET_START and nDate < DATE_09_WOMEN_0308_VIET_END then
		return SWITCH_09_WOMEN_0308_VIET;
	else
		return 0;
	end
end

