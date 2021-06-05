--File name:	new_year_head.lua
--Describe:		���ڻhead�ļ�
--Create Date:	2008-12-24
--Author:		chenbenqian


SWITCH_09_NEWYEAR_VIET	= 1;

DATE_09_NEWYEAR_VIET_START	= 2009011600;			-- ���ڻ��ʼ����
DATE_09_NEWYEAR_VIET_END	= 2009021600;			-- ���ڻ��������

PLUM_EXP_LIMIT_09_NEWYEAR_VIET = 100000000			--���ڻ÷-�һ�ɻ�õ��ܹ�����ֵ����
SEED_EXP_LIMIT_09_NEWYEAR_VIET = 20000000			--���ڻ�Ҹ����ӿɻ�õ��ܹ�����ֵ����
PICK_TIME_09_NEWYEAR_VIET = 30						--ʰȡ�Ҹ�������Ҫ��ʱ��(��λ����)
JOIN_TONG_DAY_09_NEWYEAR_VIET = 7					--��С���ʱ��(��λ����)


--���ڻʹ�õ��������
GAIN_NEW_BAG_09_NEWYEAR_VIET = 2108					--��¼���쵱���Ƿ�ͨ��ɱ���û����������
PLUM_TOTALEXP_09_NEWYEAR_VIET = 2109				--��¼���ڻ÷-�һ��õ��ܹ��ľ���
SEED_TOTALEXP_09_NEWYEAR_VIET = 2110				--��¼���ڻ�Ҹ����ӻ�õ��ܹ��ľ���
GIVE_PLUM_DATE_09_NEWYEAR_VIET = 2111				--��¼�����Ƿ�������4֦÷��
AWARD_PLUM_09_NEWYEAR_VIET = 2112					--��¼�����Ƿ�����ȡ÷������
NEW_BAG_WEEK_09_NEWYEAR_VIET = 2113					--��¼�����ǽ���ĵڼ��ܣ��������������ȡ�Ϲ���������ĸ�����
NEW_BAG_NUM_09_NEWYEAR_VIET = 2114					--��¼������ȡ�Ϲ���������ĸ���
STAGE_NUM_09_NEWYEAR_VIET = 2115					--��¼������ȡ���Ϲ��ڼ��ص�������

--���ڻʹ�õ���ʱ�������
SEED_INDEX_09_NEWYEAR_VIET = 102					--��¼�����Ҹ����ӵ�npc����


--���ڻ�������ݿ��ʶ
RELAY_DB_09_NEWYEAR_VIET = "new_year_09_veit"
--===================================================================================================

--���ڻ���ŷ���1���رշ���0
function is_new_year_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_NEWYEAR_VIET_START and nDate < DATE_09_NEWYEAR_VIET_END then
		return SWITCH_09_NEWYEAR_VIET;
	else
		return 0;
	end
end

