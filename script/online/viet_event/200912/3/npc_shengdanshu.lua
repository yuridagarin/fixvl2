--=============================================
--create by baiyun 2009.11.13
--describe:越南版12月份活动冰冷巫师圣诞树脚本
--============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
function main()
    local nNpcIndex = GetTargetNpc();
    if GetTrigger(2509) ~= 0 then
        Talk(1, "", "Чi hi謕 l骳 trc  k輈h ho箃 c﹜ gi竛g sinh r錳, h穣 b蕀 v祇 h閜 qu? gi竛g sinh  nh薾 thng.");
        return 0;
    end
    if GetLevel() < 20 or GetPlayerRoute() == 0 then
        Talk(1, "", "C蕄 20 tr? l猲 v?  tham gia v祇 m玭 ph竔 m韎 c? th? k輈h ho箃 i tho筰 v韎 c﹜");
        return 0;
    end
    --local nLeftTime = 30 * 60  - (GetTime() - GetUnitCurStates(nNpcIndex, 6));--NPC存在剩余的秒
    --local nLeftMinute = floor(nLeftTime / 60);--剩余多少分钟
    --SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, nLeftMinute);
    SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, GetUnitCurStates(nNpcIndex, 6) + 30 * 60);
    CreateTrigger(1, 1501, 2509);
    ContinueTimer(GetTrigger(2509));
    Talk(1, "", "Чi hi謕  k輈h ho箃 c﹜ gi竛g sinh r錳, h穣 b蕀 v祇 h閜 qu? gi竛g sinh  nh薾 thng.");
end
