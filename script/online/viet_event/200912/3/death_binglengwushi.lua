--=============================================
--create by baiyun 2009.11.13
--describe:Խ�ϰ�12�·ݻ������ʦ�����ű�
--============================================
--
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
function OnDeath(nNpcIndex)
    --ˢʥ����
    local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);
    local nNewIndex = CreateNpc("C�y Gi�ng sinh 4a", "C�y  gi�ng sinh", GetNpcWorldPos(nNpcIndex));
    SetNpcLifeTime(nNpcIndex, 0);
    SetNpcLifeTime(nNewIndex, 35 * 60);
    SetNpcScript(nNewIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanshu.lua");
    SetCurrentNpcSFX(nNewIndex,947,1,1);
    AddUnitStates(nNewIndex, 6, GetTime());--��¼NPC������ʱ

    --���̻�
    for i=1,5 do
    	DoFireworks(871, 1);
    end    
   
    --����ʦ��
    gf_AddItemEx2({2, 1, 30126, 1}, "Tr�i Tim Ph� Th�y", VIET_0912_STR_EVENT_LOG_TITLE, 0, 0, 0, 1,"Ti�u di�t ph� th�y b�ng gi�");

    --ˢ100��ʥ�����    
    for i = 1, 100 do
        local nNewNpcIndex2 = CreateNpc("Event gi�ng sinh VN", "H�p qu� gi�ng sinh", nMapId, nMapX + random(-30, 30), nMapY + random(-30, 30));
        SetNpcLifeTime(nNewNpcIndex2, 150);
        SetNpcScript(nNewNpcIndex2, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
    end

    --��mission��ÿ3���ӳ���50��ʥ����У�����30����
    SetGlbValue(1026, nNewIndex);

    OpenMission(MISSION_ID, nMapId)
end

