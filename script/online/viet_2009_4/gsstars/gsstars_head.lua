--=============================================
--create by baiyun 2009.4.12
--describe:Խ�ϰ�4�·ݽ����������ǻ
--=============================================


GSSTARS_SWITCH = 1													--����أ�1Ϊ����0Ϊ��
GSSTARS_ROLE_LEVEL_LIMIT = 60								--�μӴ˻�Ľ�ɫ�ȼ�����
GSSTARS_GET_SSTARS_INTERVAL = 5 * 60				--�������λ�������ǵļ��

GSSTARS_TASK_GET_SSTARS_TIME = 2139;				--��������ǵ�ʱ��(ÿ�λ�������Ƕ�Ҫ���´�ֵ�����������������εõ������ǵļ��)
GSSTARS_TASK_GET_SSTARS_DATE = 2140;				--��������ǵ�����
GSSTARS_TASK_GET_SSTARS_COUNT = 2141;				--��������ǵĴ�����ÿ�����

GSSTARS_LEVEL_TO_GSTAR_NUM = 30;						--�����ɽ�������Ҫ�������ǵ�����
GSSTARS_LEVEL_TO_GSTAR_MONEY = 20 * 100;		--�����ɽ�������Ҫ�����ӣ�ͭǮ��
GSSTARS_GET_SSTAR_MAX_TIME = 12;						--ÿ������������ǵĴ���

--��ҵȼ���1�λ�õ������������� 1������ü���
GSSTARS_PARAM = {
							{1, 0, 0},
							{2, 0, 0},
							{3, 0, 0},
							{4, 0, 0},
							{5, 0, 0},
							{6, 3, 12},
							{7, 4, 12},
							{8, 4, 12},
							{9, 5, 12}
							
};

--ȡ��һ���ڵĵڼ���
function GSStarsGetCurDay()--0��ʾ������
	nDay = date("%w")
	return tonumber(nDay)
end