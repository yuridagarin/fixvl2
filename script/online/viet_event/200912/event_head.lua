--=============================================
--create by baiyun 2009.11.17
--describe:Խ�ϰ�12�·ݻ ͷ�ļ�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

VIET_0912_TASK_SHIMENG_DATE = 2080;			--ʦ������õ�ʥ���ǹ�������
VIET_0912_TASK_SHIMENG_NUM = 2089;			--ʦ������õ�ʥ���ǹ�������
VIET_0912_TASK_XIANGCAODANGAO_COUNT = 1521;             --�Ѿ�ʹ�õ���ݵ��������
VIET_0912_TASK_GET_NPC_AWARD_DATE = 1522;               --��NPC�����ý���������
VIET_0912_TASK_USE_YANHUO_DATE = 1523;                  --ʹ���̻������
VIET_0912_TASK_USE_YANHUO_COUNT = 1524;                 --�����Ѿ�ʹ���̻�Ĵ���
VIET_0912_TASK_USE_YANHUO_TIME = 1525;                  --�ϴ�ʹ���̻��ʱ��GetTime()
VIET_0912_TASK_USE_KAOROU_TIME = 1526;                  --����ϴε�������ʱ��GetTime()
VIET_0912_TASK_USE_KAOROU_DATE = 1527;                  --��ҵ�ǰ������������
VIET_0912_TASK_USE_KAOROU_COUNT = 1528;                 --��ҽ����Ѿ��������Ĵ���
VIET_0912_TASK_USE_SHENGDANLIHE_DATE = 1529;            --��ҵ��ʥ����е�����
VIET_0912_TASK_USE_SHENGDANLIHE_TIME = 1530;            --��ҵ��ʥ����е�ʱ��GetTime()
VIET_0912_TASK_USE_SHENGDANLIHE_COUNT = 1531;           --��ҽ�����ʥ����е�����
VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME = 1532; --���������ڵ�ʱ�䣬��¼��������ϣ�ÿ�δ�������ʱ���1����λ�Ƿ���

VIET_0912_STR_EVENT_LOG_TITLE = "Hoat dong thang 12";
VIET_0912_NPC_NAME_1 = "<color=green>C�m nang ��i s� ki�n<color>";
VIET_0912_NPC_NAME_2 = "<color=green>Th�ng Gi�ng Sinh v�n ni�n: <color>";
VIET_0912_NPC_NAME_3 = "<color=green>Ph�o hoa: <color>";

VIET_0912_SHIMEN_AWARD_MAX_COUNT = 10;                  --ÿ��ʦ����������ý����Ĵ���
VIET_0912_XIANGCAODANGAO_MAX_COUNT = 1200;              --ÿ��ɫ���ʹ�õ���ݵ��������
VIET_0912_YANHUO_MAX_COUNT = 20;                        --ÿ�����ʹ�õ��̻������
VIET_0912_KAOROU_MAX_COUNT = 120;                       --ÿ��������Ŀ�������
VIET_0912_SHENGDANLIHE_MAX_COUNT = 15;                  --ÿ�������ʥ����е�����

--ͨ��ʦ�������õ�ʥ���ǹ�������
VIET_0912_SHIMEN_SHENGDANTANGGUO = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 30,
	[5] = 30,
	[6] = 40,
	[7] = 50,
	[8] = 60,
	[9] = 70,
}

--��ݵ��⽱����Ʒ
--{����=1(��Ʒ), ����, ����, {id1,id2,id3,count}, ����ʱ��(��������0)}
--{����=2(��Ǯ), ����, ����������ͭ��}
--{����=3(����), ����, ����, 1=ҪMsg2Player��0����Ҫ}
--{����=4(ʦ�Ź��׶�), ����, ����, ������û������ѡ����������, 1=ҪMsg2Player��0��ʾ����Ҫ}
--{����=5(����), ����, ����, 1=ҪMsg2Player��0�����ʾ����}
--{����=6(�Զ�������), ����, "�Զ��������Ҫdostring�Ĵ��룩", "�Զ����Msg2Player����������ʾ����Ҫ"}
--1000000
VIET_0912_XIANGCAODANGAO_AWARD = {
		{1, 4, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
		{1, 4, "Thi�n th�ch", {2, 2, 8, 1}, 0},
		{1, 5, "M�nh B�ng th�ch", {2, 1, 148, 1},  0},
		{1, 5, "B�ng th�ch", {2, 1, 149, 1}, 0},
		{1, 3, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 15 * 24 * 3600},
		{1, 1, "Th� Th�n Ph�", {2, 0, 556, 1}, 15 * 24 * 3600},
		{3, 28, 1, 1},
		{4, 27, 1, 1},
		{1, 2, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 15 * 24 * 3600},
		{1, 2, "X�ch Thi�t Tinh", {2, 1, 2652, 1}, 0},		
		{1, 4, "L�u Tinh l�", {2, 1, 2000, 1}, 0},
		{1, 4, "Ng�c T�y", {2, 1, 2001, 1}, 0},
		{1, 9, "L� Th�y", {2, 0, 351, 1}, 0},
		{1, 2, "Nguy�t Hoa", {2, 1, 2002, 1}, 0},
};

VIET_0912_XIANGCAODANGAO_AWARD_50 = {
		{1, 25, "��ng Ti�n V�ng", {2, 1, 30094, 1}, 0},
		{1, 5, "R��ng B� K�p", {2, 1, 30093, 1}, 15 * 24 * 3600},
		{1, 10,"Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 15 * 24 * 3600},
		{1, 5, "T� Linh Thi�n � Ph�", {0, 107, 160, 1}, 0},
		{1, 5, "T� Linh T� � Ph�", {0, 107, 161, 1}, 0},
		{1, 5, "T� Linh Chi�n � Ph�", {0, 107, 159, 1}, 0},
		{1, 15, "B�n Long b�ch", {2, 1, 1000, 1}, 15 * 24 * 3600},
		{1, 10, "T� Quang B�i", {2, 0, 762, 1}, 15 * 24 * 3600},
		{1, 5, "T�y T�y ��n", {2, 0, 136, 1}, 15 * 24 * 3600},
		{1, 5, "V� Ng�n Th�y", {2, 1, 503, 1}, 15 * 24 * 3600},
		{1, 10, "��u H�n", {2, 1, 1157, 1}, 15 * 24 * 3600},
}

VIET_0912_XIANGCAODANGAO_AWARD_FULL = {
		{1, 7, "B�o R��ng ��c Bi�t", {2, 1, 30091, 1}, 15*3600*24},
		{1, 5468, "R��ng Tr�n Ph�i", {2, 1, 30113, 1}, 15*3600*24},
		{1, 250, "T�y T�y Linh ��n", {2, 0, 137, 1}, 15*3600*24},
		{1, 100, "B�t B�o T�y T�y ��n", {2, 0, 138, 1}, 15*3600*24},
		{1, 250, "R��ng Y�u Quy�t_Cao c�p", {2, 1, 30112, 1}, 15*3600*24},
		{1, 100, "Thi�n C� To�n", {2, 1, 1176, 1}, 15*3600*24},
		{1, 100, "N� Oa Tinh Th�ch", {2, 1, 504, 1}, 15*3600*24},
		{1, 100, "Thi�n Th�ch Linh Th�ch", {2, 1, 1068, 1}, 15*3600*24},
		{1, 1500, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
		{1, 100, "C�u Thi�n V� C�c ��n", {2, 1, 1006, 1}, 15*3600*24},
		{1, 25, "L�ng Ba Vi B�", {0, 112, 78, 1}, 0},
		{1, 200, "T� Linh Chi�n � ph�", {0, 107, 162, 1}, 0},
		{1, 100, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}, 0},
		{1, 100, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 15*3600*24},
		{1, 100, "Phi Y�n Th�ch", {2, 1, 30130, 1}, 0},
		{1, 1500, "Nguy�t Hoa Chi Tinh", {2, 1, 3219, 1}, 0},		
}

--���͸�NPC20����ݵ����Ժ��õĽ���
VIET_0912_NPC_AWARD = {		
		{1, 100, "��i Nh�n S�m", {2, 0, 553, 1}, 15 * 24 * 3600},
		{1, 30, "��u h�n", {2, 1, 1157, 1}, 15 * 24 * 3600},
		{1, 30, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
		{1, 30, "M�t n� S�t Th� ���ng", {2, 1, 1087, 1}, 15 * 24 * 3600},
		{1, 30, "T� Linh Thi�n � Ph�", {0, 107, 160, 1}, 0},
		{1, 30, "T� Linh T� � Ph�", {0, 107, 161, 1}, 0},
		{1, 30, "T� Linh Chi�n � Ph�", {0, 107, 159, 1}, 0},
		{2, 320, 600000},
		{1, 10, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 15 * 24 * 3600},
		{1, 40, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 15 * 24 * 3600},
		{1, 20, "Th�n N�ng ��n", {2, 1, 343, 1}, 15 * 24 * 3600},
		{1, 100, "Th�i H� �a M�t Qu�", {2, 1, 387, 1}, 15 * 24 * 3600},
		{1, 20, "T�y T�y ��n", {2, 0, 136, 1}, 15 * 24 * 3600},
		{1, 15, "B� C�nh", {0, 105, 13, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "H�t L�i B�c", {0, 105, 12, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "X�ch Th�", {0, 105, 9, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "Tr�o Ho�ng Phi Di�n", {0, 105, 11, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 75, "S� M�n L�nh Th�", {2, 1, 1016, 1}, 15 * 24 * 3600},
		{1, 75, "S� M�n T�nh Nguy�n Th�", {2, 1, 1019, 1}, 15 * 24 * 3600},		
};

--�����䡢���š�Ѽ�ȡ�����Ľ���
VIET_0912_YUTUXIAO_AWARD = {
		{1, 5000, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
		{1, 5033, "Thi�n th�ch", {2, 2, 8, 1}, 0},
		{1, 1400, "B�ng th�ch", {2, 1, 149, 1}, 0},
		{1, 100, "T�y T�y linh ��n", {2, 0, 137, 1}, 15 * 24 * 3600},
		{1, 500, "R��ng B� K�p", {2, 1, 30093, 1}, 30 * 24 * 3600},
		{1, 150, "Si�u Quang", {0, 105, 19, 1, 1, -1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 550, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 2000, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 15 * 24 * 3600},
		{1, 10, "R��ng Y�u Quy�t Cao C�p", {2,1,30112}, 0},
--		{1, 60, "R��ng Tr�n Ph�i", {2, 1, 30113, 1}, 30 * 24 * 3600},
--		{1, 40, "Th�n h�nh b�o �i�n", {0, 200, 40, 1}, 30 * 24 * 3600},
		{1, 120, "T� Quang B�i", {2, 0, 762, 1}, 15 * 24 * 3600},
		{1, 15137, "C�m chi�n tr�ng", {1, 1, 14, 1}, 0},
		{1, 14000, "B�nh B�t v�ng", {1, 1, 15, 1}, 15 * 24 * 3600},
		{1, 14000, "L�c Mai", {1, 1, 16, 1}, 0},
		{1, 14000, "Minh Nguy�t D�", {1, 1, 17, 1}, 0},
		{1, 14000, "M�c Lan Xu�n", {1, 1, 18, 1}, 0},
		{1, 14000, "T�y B�c V�ng", {1, 1, 19, 1}, 0},
};

--���͸�NPC20����ݵ����Ժ��ý���
function give_xiangcaodangao_get_award()
    local nDate = tonumber(date("%d"));
    local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
    if GetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),1) ~= nDate then
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),1,nDate))
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),2,0))        
    end
    local nTaskVal = GetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),2)
    if nTaskVal >= 3 then
    		Talk(1, "", VIET_0912_NPC_NAME_2.."H�m nay ��i hi�p �� ��c 3 l�n r�i, mai h�y ti�p t�c!");
        	return 0;
    end    
    if GetItemCount(2, 1, 30124) < 10 then
        Talk(1, "", VIET_0912_NPC_NAME_2.."Kh�ng �� 10 b�nh k�m Vani �� th�c hi�n �i�u ��c!");
        return 0;
    end
    if gf_Judge_Room_Weight(2, 50, VIET_0912_NPC_NAME_2) == 0 then
        return 0;
    end
    if DelItem(2, 1, 30124, 10) == 1 then
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE), 2, nTaskVal + 1))        
        gf_EventGiveRandAward(VIET_0912_NPC_AWARD, 1000, 1, szFullLogTitle, "T�ng B�nh Kem Vani");--������
        gf_EventGiveCustomAward(1, 1500000, 1,"T�ng B�nh Kem Vani")--������
    end
end