--=============================================
--create by baiyun 2009.4.13
--describe:Խ�ϰ�4�·��ռ�У����
--=============================================
Include("\\script\\online\\viet_2009_4\\planttrees\\planttrees_head.lua")
--�������
JQ_TASK_GET_BOX_NUM = 2142;									--����ͨ��ʦ��������У����Ĵ���
JQ_TASK_GET_BOX_DATE = 2143;								--ͨ��ʦ��������У���������
JQ_TASK_GOLDEN_FLAG_EXP_MAX = 2144;					--ÿ��ʹ�ûƽ����õľ�������ֵ
JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE = 2145;	--��ûƽ��콱��������

JQ_MAX_GET_BOX_NUM = 10;										--��ɫÿ������õ�У��������

JQ_CJ_GET_BOX_PERCENT = 30; 								--ͨ���ؽ��ڴ�ֿ��Ի��У����ĸ���Ϊ30%

JQ_LEVEL_B_TO_R_FLAG_MONEY = 10 * 100;			--�������쵽���������Ǯ��ͭǮ��
JQ_LEVEL_B_TO_R_FLAG_BFLAG_NUM = 3;					--�������쵽���������������
JQ_GOLDEN_FLAG_EXP_MAX = 200000000;					--ÿ��ʹ�ûƽ����õľ�������ֵ
JQ_GOLDEN_FLAG_EACH_EXP = 125000;						--�ƽ���ÿ�λ�õľ�����

JQ_ITEM_LIMIT_TIME = 7 * 24 * 60 * 60;			--�еĽ�����Ʒ��ʹ������

--ʦ�������н�ɫ���У���������
--��ɫ�ȼ���ÿ�λ��У���������
JQ_SHIMEN_PARAM = {
					{1, 0},
					{2, 0},
					{3, 0},
					{4, 0},
					{5, 30},
					{6, 40},
					{7, 50},
					{8, 60},
					{9, 80},
		};

--�׽��콱����Ʒ
--��Ʒ�������ָ��� / 100000000 , �����ͣ������ͣ���ϸ���ͣ�ʹ������, ��������
JQ_WG_FLAG_ITEM_PARAM = {
					{"Kim Cang Ph�c Ma T�m Ph�p", 59524, 0, 107, 2, 0, 1},
					{"Ti�m Long T�m Ph�p", 59524, 0, 107, 4, 0, 1},
					{"V� Tr�n T�m Ph�p", 59524, 0, 107, 6, 0, 1},
					{"Thi�n La T�m Ph�p", 59524, 0, 107, 8, 0, 1},
					{"Nh� � T�m Ph�p", 59524, 0, 107, 10, 0, 1},
					{"B�ch H�i T�m Ph�p", 59524, 0, 107, 12, 0, 1},
					{"H�n ��n T�m Ph�p", 59524, 0, 107, 14, 0, 1},
					{"Qu� Thi�n T�m Ph�p", 59524, 0, 107, 16, 0, 1},
					{"Huy�n �nh T�m Ph�p", 59524, 0, 107, 18, 0, 1},
					{"Qu�n T� T�m Ph�p", 59524, 0, 107, 20, 0, 1},
					{"Tr�n Qu�n T�m Ph�p", 59524, 0, 107, 22, 0, 1},
					{"Xuy�n V�n T�m Ph�p", 59524, 0, 107, 24, 0, 1},
					{"U Minh T�m Ph�p", 59524, 0, 107, 26, 0, 1},
					{"Linh C� T�m Ph�p", 59524, 0, 107, 28, 0, 1},
					{"M�nh Thi�n th�ch", 32000000, 2, 2, 7, 0, 1},
					{"Th� Th�n ph�", 14500000, 2, 0, 556, JQ_ITEM_LIMIT_TIME, 1},
					{"Ti�u Ki�p t�n", 20070867, 2, 0, 141, JQ_ITEM_LIMIT_TIME, 1},
					{"T�ng Ki�m anh h�ng thi�p", 24000000, 2, 0, 31, JQ_ITEM_LIMIT_TIME, 1},
					{"B�t B�o T�y T�y Ti�n ��n", 4167, 2, 0, 138, JQ_ITEM_LIMIT_TIME, 1},
					{"T�y T�y linh ��n", 8333, 2, 0, 137, JQ_ITEM_LIMIT_TIME, 1},
					{"Thi�n H� M�t t�ch", 833333, 0, 107, 64, 0, 1},
					{"T� H� M�t t�ch", 833333, 0, 107, 65, 0, 1},
					{"Chi�m Y Ph�", 416667, 0, 107, 66, 0, 1},
					{"L�c L�m Lang Y�n", 700000, 2, 1, 1014, JQ_ITEM_LIMIT_TIME, 1},
					{"Th�y Ho�ng B� Chi�u", 700000, 2, 1, 1047, JQ_ITEM_LIMIT_TIME, 1},
					{"Uy�n ��ng Kim Ti B�c", 150000, 2, 1, 1048, JQ_ITEM_LIMIT_TIME, 1},
					{"Ph�o hoa ��a tin", 3900000, 2, 1, 203, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m ��u qu�n", 100000, 2, 1, 1059, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m y gi�p", 150000, 2, 1, 1060, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m hoa kh�", 150000, 2, 1, 1061, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m trang s�c", 100000, 2, 1, 1062, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m v� kh�", 100000, 2, 1, 1063, JQ_ITEM_LIMIT_TIME, 1},
					{"Nh�t ��i ��i Hi�p", 200000, 2, 1, 1041, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th��ng l�nh_Li�u (Ti�n Phong)", 99966, 2, 1, 9985, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th��ng l�nh_T�ng (Ti�n Phong)", 100000, 2, 1, 9986, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong l�nh-cao c�p", 50000, 2, 1, 1018, JQ_ITEM_LIMIT_TIME, 1}
}

--�ƽ��콱����Ʒ
--��Ʒ�������ָ��� / 100000000 , �����ͣ������ͣ���ϸ���ͣ�ʹ������
JQ_YG_FLAG_ITEM_PARAM = {
					{"L� th�y", 10000000, 2, 0, 351, 0, 1},
					{"M�nh Thi�n th�ch", 2025000, 2, 2, 7, 0, 1},
					{"Thi�n th�ch", 3000000, 2, 2, 8, 0, 1},
					{"M�nh B�ng th�ch", 2000000, 2, 1, 148, 0, 1},
					{"B�ng th�ch", 3000000, 2, 1, 149, 0, 1},
					{"B�ng Lai Ti�n Th�y", 1500000, 2, 1, 1012, 0, 1},
					{"B�ng Lai L� Th�y", 2000000, 2, 1, 1052, 0, 1},
					{"Danh v�ng", 5000000, 0, 0, 0, 0, 3},
					{"Danh v�ng", 1000000, 0, 0, 0, 0, 5},
					{"Danh v�ng", 1000000, 0, 0, 0, 0, 10},
					{"Danh v�ng", 500000, 0, 0, 0, 0, 50},
					{"Luy�n", 31000000, 0, 0, 0, 0, 20},
					{"�i�m t�ng ki�m", 34500000, 0, 0, 0, 0, 100},
					{"T�ng Ki�m anh h�ng thi�p", 500000, 2, 0, 31, JQ_ITEM_LIMIT_TIME, 1},
					{"Th� Th�n ph�", 1553800, 2, 0, 556, JQ_ITEM_LIMIT_TIME, 1},
					{"Ti�u Ki�p t�n", 1000000, 2, 0, 141, JQ_ITEM_LIMIT_TIME, 1},
					{"B�t B�o T�y T�y Ti�n ��n", 375, 2, 0, 138, JQ_ITEM_LIMIT_TIME, 1},
					{"T�y T�y linh ��n", 750, 2, 0, 137, JQ_ITEM_LIMIT_TIME,1},
					{"Thi�n H� M�t t�ch", 75000, 0, 107, 64, 0, 1},
					{"T� H� M�t t�ch", 75000, 0, 107, 65, 0, 1},
					{"Chi�m Y Ph�", 37500, 0, 107, 66, 0, 1},
					{"L�c L�m Lang Y�n", 12500, 2, 1, 1014, JQ_ITEM_LIMIT_TIME, 1},
					{"Th�y Ho�ng B� Chi�u", 12500, 2, 1, 1047, JQ_ITEM_LIMIT_TIME, 1},
					{"Uy�n ��ng Kim Ti B�c", 20000, 2, 1, 1048, JQ_ITEM_LIMIT_TIME, 1},
					{"Ph�o hoa ��a tin", 50000, 2, 1, 203, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m ��u qu�n", 2000, 2, 1, 1059, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m y gi�p", 50000, 2, 1, 1060, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m hoa kh�", 4000, 2, 1, 1061, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m trang s�c", 1000, 2, 1, 1062, JQ_ITEM_LIMIT_TIME, 1},
					{"B�o r��ng T�ng Ki�m v� kh�", 2000, 2, 1, 1063, JQ_ITEM_LIMIT_TIME, 1},
					{"Nh�t ��i ��i Hi�p", 5000, 2, 1, 1041, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th��ng l�nh_Li�u (Ti�n Phong)", 8000, 2, 1, 9985, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong th��ng l�nh_T�ng (Ti�n Phong)", 8000, 2, 1, 9986, JQ_ITEM_LIMIT_TIME, 1},
					{"Phong l�nh-cao c�p", 2000, 2, 1, 1018, JQ_ITEM_LIMIT_TIME, 1},
					{"Kim Cang Ph�c Ma kinh", 3970, 0, 107, 1, 0, 1},
					{"Ti�m Long M�t t�ch", 3970, 0, 107, 3, 0, 1},
					{"V� Tr�n M�t t�ch", 3970, 0, 107, 5, 0, 1},
					{"Thi�n La M�t T�ch", 3970, 0, 107, 7, 0, 1},
					{"Nh� � M�t T�ch", 3970, 0, 107, 9, 0, 1},
					{"B�ch H�i Ph�", 3970, 0, 107, 11, 0, 1},
					{"H�n ��n M�t t�ch", 3970, 0, 107, 13, 0, 1},
					{"Qu� Thi�n M�t t�ch", 3970, 0, 107, 15, 0, 1},
					{"Huy�n �nh M�t t�ch", 3970, 0, 107, 17, 0, 1},
					{"Qu�n T� M�t t�ch", 3970, 0, 107, 19, 0, 1},
					{"Tr�n Qu�n M�t t�ch", 3970, 0, 107, 21, 0, 1},
					{"Xuy�n V�n M�t t�ch", 3970, 0, 107, 23, 0, 1},
					{"U Minh Qu� L�c", 3970, 0, 107, 25, 0, 1},
					{"Linh C� M�t t�ch", 3970, 0, 107, 27, 0, 1}
					
}

function JQ_CheckEventDate()		--�������2009��04��24�ա�-- 2009��05��24��24��
	if getCurYear() ~= 2009 then
		return 0;
	end
	if getCurMonth() == 4 then
		if getCurDate() >= 24 then
			return 1;
		end
	end
	if getCurMonth() == 5 then
		if getCurDate() <= 31 then
			return 1;
		end
	end
	return 0;
end

function JQ_DoNothing()
end


--------------------------------------
--JQ_GetRandItem()
--ȡ�������Ʒ
--------------------------------------
function JQ_GetRandItem(JQ_WYG_FLAG_ITEM_PARAM)
	local nPos = 0;
	local nRand = random(1, 100000000);
	for i = 1, getn(JQ_WYG_FLAG_ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + JQ_WYG_FLAG_ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + JQ_WYG_FLAG_ITEM_PARAM[i][2];
	end
	return 15;
end