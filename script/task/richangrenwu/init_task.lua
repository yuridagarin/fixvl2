--=============================================
--create by baiyun 2009.12.14
--describe:Խ�ϰ�����ʹ���ճ����� ��ʼ�������ļ�
--=============================================
--ע����ļ��еĶ���������޸ģ�һ��Ҫͬʱ�޸�\����������ļ�\Relay\RelaySetting\Task\daliytask.lua����ͬ�Ķ���

Include("\\script\\lib\\globalfunctions.lua");

DAILY_TASK_0912_SWITCH = 1; --�ճ�����أ�0�رգ�1��

DAILY_TASK_0912_PERSONAL_TASK = 1027;--������ȫ�ֱ�������ʾ�������ĸ���������
DAILY_TASK_0912_TEAM_TASK = 1028;--������ȫ�ֱ�������ʾ�������ĸ��Ŷ�����


--�����ճ������б�
DALIY_TASK_0912_PERSONAL_TASK_LIST = {
    {"Thu ph�c  Ph��ng Ho�ng t�i Th�i H� �o c�nh", 10, {"Kinh nghi�m Ph�ng ho�ng", "Luy�n Ph�ng Ho�ng", "Trang b� Ph�ng ho�ng"}},
    {"Thu ph�c Th�c Nh�n Th�o t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m Th�c nh�n th�o", "Luy�n Th�c Nh�n Hoa",  "Trang b� Th�c nh�n th�o"}},
    {"Thu ph�c Th� t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m Th�", "Luy�n Th� t�", "Trang b� Th�"}},
    {"Thu ph�c H�a K� L�n t�i Th�i H� �o c�nh", 10, {"Kinh nghi�m H�a K� L�n", "Luy�n H�a K� L�n", "Trang b� H�a K� L�n"}},
    {"Thu ph�c B� T�y T�ng t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m B� T�y T�ng", "Luy�n Mao Ng�u", "Trang b� B� T�y T�ng"}},
    {"Thu ph�c C�m Ti�n T� t�i Th�i H� �o c�nh", 20, {"Kinh nghi�m C�m Ti�n T�", "Luy�n C�m Ti�n T�", "Trang b� C�m Ti�n T�"}},
}

--�Ŷ��ճ������б�
DALIY_TASK_0912_TEAM_TASK_LIST = {
    {"Truy t�m B�c L�c L�m L�nh", 10, "B�c L�c L�m l�nh"},
    {"Truy t�m Tr�c �nh th��ng", 20, "Tr�c �nh Th��ng"},
    {"Truy t�m Tuy�t T�nh Th�ch", 20, "Tuy�t T�nh Th�ch"},
    {"Truy t�m L�nh B�i T�ng Qu�n ngo�i vi�n", 5, "L�nh b�i t�ng qu�n ngo�i vi�n"},
    {"Truy t�m L�nh B�i T�ng qu�n n�i vi�n", 5, "L�nh b�i t�ng qu�n n�i vi�n"},
    {"Truy t�m Vi�t N� Ki�m", 5, "Vi�t N� ki�m"},
    {"Truy t�m Trang Ch� Kim �n", 15, "Trang ch� kim �n"},
    {"Truy t�m Tr��ng L�o ch� ho�n", 20, "Tr��ng L�o Ch� Ho�n"},
}

--function main()
--    if DAILY_TASK_0912_SWITCH == 1 then
--        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, gf_GetRandItemByTable(DALIY_TASK_0912_PERSONAL_TASK_LIST, 100, 2));
--        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, gf_GetRandItemByTable(DALIY_TASK_0912_TEAM_TASK_LIST, 100, 2));
--    end
--end


