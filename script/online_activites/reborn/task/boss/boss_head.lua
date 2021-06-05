--==================================================
--create by zhangming 2010.03.18
--describe: Խ�ϰ� ��������BOSS ͷ�ļ�
--related files:
--==================================================
Include ("\\Script\\lib\\globalfunctions.lua")
VET_201003_STR_LOG_TITLE = "Nhi�m v� chuy�n sinh t� ��i"
VET_201003_STR_LOG_ACTION = "Ph�n th��ng cho gi�t boss m�n h�i nhi�m v� t� ��i"

VET_201003_TB_BOSS_APPEAR_MAPID = {
    { --���� Ȫ�ݸ���
        {108,1420,3079,"B�c Tuy�n Ch�u"},
        {108,1420,3041,"B�c Tuy�n Ch�u"},
        {108,1393,2979,"B�c Tuy�n Ch�u"},
        {108,1493,2911,"B�c Tuy�n Ch�u"},
        {108,1491,2971,"B�c Tuy�n Ch�u"},
        {108,1567,3048,"B�c Tuy�n Ch�u"},
    },
    { --���� �ɶ�����
        {301,1491,3191,"T�y Th�nh ��"},
        {301,1422,3142,"T�y Th�nh ��"},
        {301,1427,3047,"T�y Th�nh ��"},
        {301,1450,2898,"T�y Th�nh ��"},
        {301,1562,2849,"T�y Th�nh ��"},
        {301,1574,2937,"T�y Th�nh ��"},
    },
    { --���� Ȫ�ݸ���
        {108,1601,3064,"B�c Tuy�n Ch�u"},
        {108,1576,2898,"B�c Tuy�n Ch�u"},
        {108,1513,2930,"B�c Tuy�n Ch�u"},
        {108,1438,2914,"B�c Tuy�n Ch�u"},
        {108,1443,2999,"B�c Tuy�n Ch�u"},
        {108,1520,3172,"B�c Tuy�n Ch�u"},
    },
    { --ӥ�� �ɶ�����
        {301,1394,3109,"T�y Th�nh ��"},
        {301,1391,2962,"T�y Th�nh ��"},
        {301,1430,2950,"T�y Th�nh ��"},
        {301,1523,2893,"T�y Th�nh ��"},
        {301,1487,2796,"T�y Th�nh ��"},
        {301,1537,3100,"T�y Th�nh ��"},
    },
}


VET_201003_TB_BOSS_INF = {
    {"Long T�","Long T�","\\script\\online_activites\\reborn\\task\\boss\\boss_longzi.lua"},
    {"Ph�ng T�","Ph�ng T�","\\script\\online_activites\\reborn\\task\\boss\\boss_fengzi.lua"},
    {"H� T�","H� T�","\\script\\online_activites\\reborn\\task\\boss\\boss_huzi.lua"},
    {"�ng T�","�ng T�","\\script\\online_activites\\reborn\\task\\boss\\boss_yingzi.lua"},

}

VET_201003_TB_BOSS_AWARD = {
    {1,8000000,"Nh�n S�m V�n N�m",{2,1,30071,1},0,0},
    {1,125,"Long T� B�i",{2,1,30155,1},0,0},
    {1,125,"Ph�ng T� B�i",{2,1,30156,1},0,0},
    {1,125,"H� T� B�i",{2,1,30157,1},0,0},
    {1,125,"�ng T� B�i",{2,1,30158,1},0,0},
    {1,500000,"��nh H�n Thi�n Th�ch Th�n Th�ch",{2,1,1067,1},0,0},
    {1,1000000,"Thi�n th�ch",{2, 2, 8, 1},0,0},
    {1,499500,"M�nh Thi�n th�ch",{2, 2, 7, 1},0,0},
}


function VET_201003_GIVE_BOSS_AWARD()
    gf_EventGiveRandAward(VET_201003_TB_BOSS_AWARD,10000000,1,VET_201003_STR_LOG_TITLE,VET_201003_STR_LOG_ACTION)
end
