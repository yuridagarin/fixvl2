--=============================================
--create by baiyun 2009.11.25
--describe:Խ�ϰ�12�·ݻ ʥ�����NPC�ű��ļ�
--============================================

Include("\\script\\online\\viet_event\\200912\\event_head.lua")

function main()
    local nNpcIndex = GetTargetNpc();
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_DATE) < nDate then
        SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT, 0);
    end
    if GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT) >= VIET_0912_SHENGDANLIHE_MAX_COUNT then
        Talk(1, "", "H�m nay ��i hi�p s� d�ng ph�n th��ng thu ���c gi�i h�n cao nh�t, xin ��i ng�y mai s� d�ng ti�p.");
        return 0;
    end
    if GetTime() - GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME) < 60 then
        Talk(1, "", format("��i hi�p c�n ph�i ��i th�m  %d gi�y m�i c� th� ti�p t�c nh�n th��ng", (60 - GetTime() + GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME))));
        return 0;
    end
    SetNpcLifeTime(nNpcIndex, 0);    
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_DATE, nDate);
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT, GetTask(VIET_0912_TASK_USE_SHENGDANLIHE_COUNT) + 1);
    SetTask(VIET_0912_TASK_USE_SHENGDANLIHE_TIME, GetTime());
    ModifyExp(100000)
    WriteLogEx("Hoat dong thang 12","nh�n th��ng h�p qu�",100000,"�i�m kinh nghi�m")
end
