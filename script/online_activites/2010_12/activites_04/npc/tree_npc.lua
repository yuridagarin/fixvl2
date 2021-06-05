--=============================================
--create by xiongyizhi 2010-11-5
--describe:Խ�ϰ�12�·�������� ��NPC�ű�
--=============================================
Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

function main()
    local nNpcIndex = GetTargetNpc();
    local nLevel = Judge_tree_level_cost() --�ж������ĸ��׶�
    if Judge_tree_owner(nNpcIndex) == 0 then--ֻ��͵���˵�
        stolen_process(nNpcIndex);
        return 0; --͵�����ˣ����������˵���
    end
    if nLevel == tonumber(getn(VET_201012_04_TB_TREE_GROW)) then --ȫ���ɳ��׶����ˣ��ջ�
        Say(VET_201012_04_NPC_TALK_STRINGS[12], 2, VET_201012_04_NPC_TALK_STRINGS[13].."/get_4_soul_tree_award",
                                                   VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");
    else 
        tree_feed_talk(nNpcIndex);
    end
end

function Judge_tree_owner(nNpcIndex)
    local nNpcName = GetNpcName(nNpcIndex);
    local nNameLen = strlen(GetName());
    if GetName() == strsub(nNpcName, 1, nNameLen) then --���������ж��ǲ�����ҵ���
	return 1;
    else
        return 0;
    end
end

--͵�Դ���,�ɹ�����1�����ɹ�����0
function stolen_process(nNpcIndex)
    if GetPlayerRoute() == 0 then
    	   Talk(1, "", "Ch�a gia nh�p m�n ph�i kh�ng th� c��p c�y!")
        return 0;
    end
    local nStolenFlag = GetUnitCurStates(nNpcIndex, 4);--͵ȡʱ��Ϊ: 0������͵�Ľ׶�;ʱ���Ϊ͵��ʱ��, -1Ϊ͵����
    if nStolenFlag == 0 or GetTime() < nStolenFlag then --ֻ���ջ�׶�͵
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[18])
        return 0;
    end
    if nStolenFlag == -1 then 
        Talk(1, "", gf_FixColor(VET_201012_04_NPC_TB[2][2], 2, 1)..VET_201012_04_NPC_TALK_STRINGS[7]);
        return 0;
    else --û�б�͵��
        for i = 1, getn(VET_201012_04_TB_ITEM) do
            gf_AddItemEx2({VET_201012_04_TB_ITEM[i][2][1], VET_201012_04_TB_ITEM[i][2][2], VET_201012_04_TB_ITEM[i][2][3], 1}, 
                          VET_201012_04_TB_ITEM[i][1], 
                          VET_201012_04_STR_LOG_TITLE, 
                          VET_201012_04_TB_LOG_ACTION_LIST[4], 
                          0, 
                          1);
        end
        nStolenFlag = - nStolenFlag - 1;
        AddUnitStates(nNpcIndex, 4, nStolenFlag); --ʹ��NPC���λ����¼�Ѿ�͵ȡ����
    end
end

--���ݴ����µ����ڵ�ʱ��,�ж������ڴ��ڵĳɳ��׶�
--���η��� �ɳ��׶Σ��������ĵ��ַ���
--�� (5, "��ˮ*1 ʩ��*2 ɱ��*3 ")
function Judge_tree_level_cost()
    local nLife = tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME);
    local nLevel, nCostCount; 
    local szCost = "";
    if nLife < 0 then return -1 end

    local nLevelTime = VET_201012_04_TB_TREE_GROW[1][4];
    for nLevel = 1, getn(VET_201012_04_TB_TREE_GROW) do
        if nLife <= nLevelTime then --�����ĳ���׶����䣬ȡ��������������
            if VET_201012_04_TB_TREE_GROW[nLevel][3] ~= nil then --Ҫ�в������ģ��еĽ׶ο���û����
                for nCostCount = 1,getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    local nSingleAct = get_cost2action_name(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1]);
                    szCost = szCost..format(nSingleAct.."*%d ", VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2]);--��¼�²������ĵ��ַ������ڶԻ���
                                                                                                                      --��ʽ "��ˮ*1 ʩ��*2 ɱ��*3 "
                end
                return nLevel, "["..szCost.."]";
            else 
                return nLevel, "";
            end
        else
            if nLevel + 1 <= getn(VET_201012_04_TB_TREE_GROW) then
                nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[nLevel + 1][4];
            end
        end
    end
    return 0, ""; --�����κ�����Ĵ������
end

--����VET_201012_04_TREE_ITEM_TO_ACTION��������ƷID��{G, D, P}, ��������ֵ��������"��Ӧ����","��Ʒ��"���Ҳ�������0
function get_cost2action_name(tItem)
    local g, d, p = gf_UnPack(tItem);
    local g1, d1, p1
    for i = 1,getn(VET_201012_04_TREE_ITEM_TO_ACTION) do
        g1, d1, p1 = gf_UnPack(VET_201012_04_TREE_ITEM_TO_ACTION[i][2]);
        if g == g1 and d == d1 and p == p1 then  --���ܱȽϱ�ı��취
            return VET_201012_04_TREE_ITEM_TO_ACTION[i][3], VET_201012_04_TREE_ITEM_TO_ACTION[i][1];        
        end
    end
    return 0;
end

--�Լ����������Ի�,�����Ƿ��ý�ˮʩ��
function tree_feed_talk(nNpcIndex)
    local nLevel, szCost = Judge_tree_level_cost();
    if nLevel == 0 then
        reset_npc_player_state(nNpcIndex);
        return 0;
    end
    local tbTreeDialog = {};
    if szCost ~= "" and GetUnitCurStates(nNpcIndex, 5) ~= nLevel then
        tinsert(tbTreeDialog, szCost.."/#tree_feed_process("..nNpcIndex..")")
    end
    tinsert(tbTreeDialog, VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");--�����Ի�

    local nLevelTime = 0;
    for i = 1, nLevel do
        nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[i][4];
    end
    local nTime2NextLevel = nLevelTime - (tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
    if nTime2NextLevel < 0 then
        reset_npc_player_state(nNpcIndex);
        return 0;
    end
    local szLevelName = "["..VET_201012_04_TB_TREE_GROW[nLevel][1].."]";
    Say(format(VET_201012_04_NPC_TALK_STRINGS[10], szLevelName, nTime2NextLevel), getn(tbTreeDialog), tbTreeDialog);
end

--����ˮʩ����Щ����
function tree_feed_process(nNpcIndex)
    if GetTargetNpc() ~= nNpcIndex then --������ֶԻ�һֱ����,�������Ѿ�����,����NpcIndex������npcռ��
        return 0;
    end
    local nLife = tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME);
    local nLevel, nCostCount;
    local szCost = "";
    if nLife < 0 then return -1 end
    local nLevelTime = VET_201012_04_TB_TREE_GROW[1][4];
    for nLevel = 1, getn(VET_201012_04_TB_TREE_GROW) do
        if nLife <= nLevelTime then --�����ĳ���׶����䣬ȡ��������������
            if VET_201012_04_TB_TREE_GROW[nLevel][3] ~= nil then --Ҫ�в������ģ��еĽ׶ο���û����
                for nCostCount = 1, getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    if GetItemCount(gf_UnPack(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1])) 
                                    < VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2] then
                        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[11]); --�����Ĳ��ϲ���
                        return 0;
                    end
                end
                for nCostCount = 1,getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    DelItem(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][1], 
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][2],
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][3],
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2]);
                end

                --����������,���������¸��׶ε�NPC
                local nOldNpcIdx = nNpcIndex;
                nNpcIndex = CreateNpc(VET_201012_04_TB_TREE_GROW[nLevel][2], 
                                      GetName()..VET_201012_04_NPC_TALK_STRINGS[17]..VET_201012_04_NPC_TB[2][2], 
                                      GetNpcWorldPos(nOldNpcIdx));
                SetNpcScript(nNpcIndex, VET_201012_04_TREE_SCRIPT);
                SetNpcLifeTime(nOldNpcIdx, 0);  --ɱ��ԭNPC

                local nLevelTime = 0;
                for i = 1, (nLevel + 1) do
                    nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[i][4];
                end
                local nTime2NextLevel = nLevelTime - (GetTime() - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
                SetNpcLifeTime(nNpcIndex, nTime2NextLevel);
                AddUnitStates(nNpcIndex, 5, nLevel); --ʹ��NPC�ڷ���λ��¼�Ѿ���������׶�
                local nStolenTime = GetTime() + nTime2NextLevel - VET_201012_04_TB_TREE_GROW[nLevel + 1][4]
                if nLevel + 1 == getn(VET_201012_04_TB_TREE_GROW) then
                    AddUnitStates(nNpcIndex, 4, nStolenTime) --ʹ��NPC���λ��¼����͵ȡ��ʱ��
                end
                return 0;
            end
        else
            nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[nLevel + 1][4]
        end
    end
end

function get_4_soul_tree_award()
    local nNpcIndex = GetTargetNpc();
    if Judge_tree_owner(nNpcIndex) == 0 then
        return 0;
    end
    local g,d,p;
    if gf_Judge_Room_Weight(4, 0, "") == 1 then
    		  ThuHoachCayTuLinh()
    	   --nhi�m v� l�m gi�u
	   if CFG_NhiemVuLamGiau == 1 then
			if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 9) == 0 then
				gf_SetTaskBit(TSK_LAMGIAU, 9, 1, 0)
				TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Tr�ng th�nh c�ng 01 C�y T� Linh.")
			end
	   end
		-----------------------Chu�i nhi�m v� ��ng H�nh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 20 then
				DongHanh_SetStatus()
			end
		end
        gf_EventGiveCustomAward(1, 500000, 1, VET_201012_04_STR_LOG_TITLE, VET_201012_04_TB_LOG_ACTION_LIST[3])
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, 0)
        if GetUnitCurStates(nNpcIndex, 4) == -1 then --��͵����
            for i = 1, getn(VET_201012_04_TB_ITEM) do
                g,d,p = gf_UnPack(VET_201012_04_TB_ITEM[i][2])
                if random(1, 2) == 1 then  --���Ƹ���50%����
                    gf_AddItemEx2({g, d, p, 3}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[3], 
                                  0, 
                                  1);
                else
                    gf_AddItemEx2({g, d, p, 2}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[3], 
                                  0, 
                                  1);
                end
            end
        else  --û�б�͵
            for i = 1, getn(VET_201012_04_TB_ITEM) do
                g,d,p = gf_UnPack(VET_201012_04_TB_ITEM[i][2])
                if random(1, 4) == 1 then  --���Ƹ���25%����
                    gf_AddItemEx2({g, d, p, 5}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[5], 
                                  0, 
                                  1);
                else
                    gf_AddItemEx2({g, d, p, 3}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[5], 
                                  0, 
                                  1);
                end
            end
        end
         -- Nhi�m v� chuy�n sinh 5
        if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) < 69 then
		gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) == 69 then
			TaskTip("Ho�n th�nh y�u c�u c�a B�ch Ti�n Sinh ho�n th�nh tr�ng th�nh c�ng 69 c�y T� Linh")
		end
	end
        reset_npc_player_state(nNpcIndex)
    end
end

function reset_npc_player_state(nNpcIndex)
    SetNpcLifeTime(nNpcIndex, 0); --NPC���ʱ�䳬������ʱ��Ĵ������,ɾ�����NPC
    SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, 0);
    return 0;
end
