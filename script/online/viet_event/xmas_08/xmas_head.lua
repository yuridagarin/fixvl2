--File name:	xmas_head.lua
--Describe:		ʥ���ڻhead�ļ�
--Create Date:	2008-11-17
--Author:		chenbenqian


SWITCH_08_XMAS_VIET	= 1;

DATE_08_XMAS_VIET_START	= 2008120500;			-- ʥ���ڻ��ʼ����
DATE_08_XMAS_VIET_END	= 2009010500;			-- ʥ���ڻ��������

EXP_LIMIT_08_XMAS_VIET = 100000000				--ʥ���ڻʹ�õ��߿ɻ�õ��ܹ�����ֵ����
PICK_TIME_08_XMAS_VIET = 60						--ʰȡʥ������Ҫ��ʱ��(��λ����)

--ʥ���ڻʹ�õ��������
TOTALEXP_08_XMAS_VIET = 2483					--��¼ʥ���ڻ��õ��ܹ��ľ���
TREE_DATE_08_XMAS_VIET = 2484					--��¼����ʰȡʥ����������
TREE_NUM_08_XMAS_VIET = 2485					--��¼����ʰȡʥ�����ĸ���(��ȡ�����Ĵ���)
GAIN_POUCH_08_XMAS_VIET = 2486					--��¼�Ƿ����˽��Ҵ��¼���Ʒ
GAIN_STAR_08_XMAS_VIET = 2487					--��¼�Ƿ�ʹ�ý��Ҵ��¼���ù�ʥ������
LUCK_BOX_DATE_08_XMAS_VIET = 2488				--��¼������ȡ������е�����
LUCK_BOX_NUM_08_XMAS_VIET = 2489				--��¼������ȡ������еĸ���
LUCK_BOX_TURN_08_XMAS_VIET = 2490				--��¼��ȡ�˵ڼ����������
GAIN_PILL_08_XMAS_VIET = 2491					--��¼�Ƿ�������Ѫ��
GAIN_NEW_BOX_08_XMAS_VIET = 2492				--��¼�Ƿ��������(���ֽ�Ʒ)
FIREWORKS_DATE_08_XMAS_VIET = 2493				--��¼����ʹ���̻������
FIREWORKS_NUM_08_XMAS_VIET = 2494				--��¼����ʹ���̻�ĸ���
GAIN_CLOTH_BOX_08_XMAS_VIET = 2495				--��¼�Ƿ�������װ���
FIREWORKS_TIME_08_XMAS_VIET = 2496				--��¼�ϴ�ʹ���̻��ʱ��
GAIN_LUCK_BOX_08_XMAS_VIET = 2497				--��¼�����Ƿ�ͨ��ɱ���û�����������

--ʥ���ڻʹ�õ���ʱ�������
TREE_INDEX_08_XMAS_VIET = 101					--��¼����ʥ������npc����

--ʥ���ڻʹ�õ�ȫ�ֱ���
BJ_LUCK_BOX_NUM_XMAS_VIET = 1002				--��¼�꾩ʥ����npc���ŵ�������е�����
CD_LUCK_BOX_NUM_XMAS_VIET = 1003				--��¼�ɶ�ʥ����npc���ŵ�������е�����
QZ_LUCK_BOX_NUM_XMAS_VIET = 1004				--��¼Ȫ��ʥ����npc���ŵ�������е�����
AWARD_MAP_IDX_XMAS_VIET = 1005					--��¼�ܹ������ر���еĵ�ͼ����
AWARD_TURN_XMAS_VIET = 1006						--��¼���ڵڼ��ַ����������ʱ�����ر����

--ʥ���ڻ���ŷ���1���رշ���0
function is_xmas_08_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_XMAS_VIET_START and nDate < DATE_08_XMAS_VIET_END then
		return SWITCH_08_XMAS_VIET;
	else
		return 0;
	end
end

