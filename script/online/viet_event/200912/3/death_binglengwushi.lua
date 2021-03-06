--=============================================
--create by baiyun 2009.11.13
--describe:越南版12月份活动冰冷巫师死亡脚本
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
function OnDeath(nNpcIndex)
    --刷圣诞树
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    local nNewIndex = CreateNpc("C﹜ Gi竛g sinh 4a", "C﹜  gi竛g sinh", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNpcIndex, 0);
    SetNpcLifeTime(nNewIndex, 35 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    SetCurrentNpcSFX(nNewIndex,947,1,1);
    AddUnitStates(nNewIndex, 6, GetTime());--记录NPC创建的时

    --放烟火
    for i=1,5 do
    	DoFireworks(871, 1);
    end    
   
    --给巫师心
    gf_AddItemEx2({2, 1, 30126, 1}, "Tr竔 Tim Ph? Th駓", VIET_0912_STR_EVENT_LOG_TITLE, 0, 0, 0, 1,"Ti猽 di謙 ph? th駓 b╪g gi?");

    --刷100个圣诞礼盒    
    for i = 1, 100 do
        local nNewNpcIndex2 = CreateNpc("Event gi竛g sinh VN", "H閜 qu? gi竛g sinh", nMapId, nMapX + random(-30, 30), nMapY + random(-30, 30));
        SetNpcLifeTime(nNewNpcIndex2, 150);
        SetNpcScript(nNewNpcIndex2, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --打开mission，每3分钟出现50个圣诞礼盒，持续30分钟
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

