--=============================================
--create by zhangming 2010.8.20
--describe:Խ�ϰ�2010��9�»1 ͷ�ļ�
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�
Include("\\script\\online_activites\\2010_09\\activites_01\\strings.lua");--��ַ���
Include("\\script\\lib\\globalfunctions.lua");--���������ļ�
Include("\\script\\online\\viet_event\\vng_task_control.lua");

VET_201009_01_EVENT_NUMBER = 13;--�ڻ���ϵı����13
VET_201009_01_EXP_LIMITE_SP = 250000000 --�������±��ľ�������
VET_201009_01_EXP_LIMITE = 490000000 --����ͨ�±��ľ�������

function VET_201009_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201009_01_TB_STRING_LIST[2];                            --���Ҵ��¼�say�ı���
        tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[3].."/vet_201009_01_make_mooncake");
        --tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[5].."/vet_201009_02_jihuohuadeng");
        --tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[24].."/vet_201009_02_goumaihuanglazhu");
        --tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[7].."/gf_DoNothing");
    end
    return tbSayDialog, szSayHead;
end

function vet_201009_01_make_mooncake()
    if GetItemCount(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4]) < 1 or GetItemCount(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4]) < 5 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if DelItem(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4],1) == 1 and DelItem(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4],5) == 1 then
        local nItemIds = {VET_201009_01_TB_ITEM_LIST[4][2],VET_201009_01_TB_ITEM_LIST[4][3],VET_201009_01_TB_ITEM_LIST[4][4],1}
        gf_AddItemEx2(nItemIds,VET_201009_01_TB_ITEM_LIST[4][1],VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[4],0,1)
    end
    SelectSay()
end

function vet_201009_01_jihuokaolu()
    if GetItemCount(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4]) < 8 or GetItemCount(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4]) < 40 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201009_01_TB_MAPID) do
        if nMapId == VET_201009_01_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[10])
        return
    end
    local nTimeLastKaolu = GetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU)
    local nTimeNow = GetTime()
    if nTimeLastKaolu == nil then
        nTimeLastKaolu = 0
    end
    if nTimeNow - nTimeLastKaolu < 240 then
        Talk(1,"",format(VET_201009_01_TB_STRING_LIST[9],240-nTimeNow+nTimeLastKaolu))
        return
    end
    if DelItem(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4],8) ~= 1 or DelItem(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4],40) ~= 1 then
        return
    end
    SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,nTimeNow)
    local nNpcIndex = CreateNpc(VET_201009_01_TB_NPC_LIST[1][1],VET_201009_01_TB_NPC_LIST[1][2],GetWorldPos())
    SetNpcScript(nNpcIndex,VET_201009_01_TB_NPC_LIST[1][3])
    --SetNpcDeathScript(nNpcIndex,VET_201009_01_TB_NPC_LIST[1][3])
    SetNpcLifeTime(nNpcIndex,235) --�����ʱ��Ϊ235��
    SetTask(VET_201009_01_TASK_FLAG_KAOLU,nNpcIndex) --��¼npc����
    SetTask(VET_201009_01_TASK_KAOLU_PHASE,1) --��ʼ��npc�����׶�
    SetTask(VET_201009_01_TASK_KAOLU_TIME,nTimeNow) --��ʼ���µĽ׶ο�ʼʱ��
    SetTask(VET_201009_01_TASK_MUCAI_NUM, 0) --��ʼ���ɹ����뿾¯��ľ����
    StartTimeGuage("L� n��ng", 30,0,1)
end


function vet_201009_01_goumaihuocai()
    if GetCash() < 40000 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[13])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(40000) == 1 then
        local tbItemIds = {VET_201009_01_TB_ITEM_LIST[6][2],VET_201009_01_TB_ITEM_LIST[6][3],VET_201009_01_TB_ITEM_LIST[6][4],4}
        gf_AddItemEx2(tbItemIds, VET_201009_01_TB_ITEM_LIST[6][1],VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[5],0,1)
    end
end



function VET_201009_01_GivePlayerLoginItem()
--    print(VET_201009_01_EVENT_NUMBER)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if GetItemCount(VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][4]) < 1 then
        gf_AddItemEx2({VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][4], 1}, VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][1], VET_201009_01_STR_LOG_TITLE, VET_201009_01_TB_LOG_ACTION_LIST[1], 0, 1);
    end
end

function VET_201009_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 75},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GivePlantBigTreeAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 100},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 60},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 60},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_Give_ZhongziAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 50},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function vet_201009_01_get_limitaward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        local nNumEatCake = GetTask(VET_201009_01_TASK_NUM_MOONCAKES)
        if nNumEatCake == nil then
            nNumEatCake = 0
        end
        if nNumEatCake < 2450 then
            Talk(1,"",format(VET_201009_01_TB_STRING_LIST[5],nNumEatCake))
            return
        end
        if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_LIMIT) == 1 then
            Talk(1,"",VET_201009_01_TB_STRING_LIST[24])
            return
        end
        gf_SetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_LIMIT, 1)
        ModifyExp(20000000)
        Msg2Player("Nh�n ���c 20000000 �i�m kinh nghi�m!")
        if mod(GetTask(TASK_VNG_PET), 100) > 0 then
        		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (10 * 100))
        		Msg2Player("Nh�n ���c 10 �i�m n�ng c�p B�n ��ng H�nh!")
        end       
        gf_EventGiveRandAward(VET_201009_01_LIMITED_AWARD,1000,1,VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[7])
    else
        Talk(1,"",VET_201009_01_TB_STRING_LIST[25])
    end
end

function change_receive_method_201009()
	local tSay = {}
	local szHeader = "��i hi�p mu�n s� d�ng h�nh th�c nh�n th��ng n�o?"
	
	tinsert(tSay, "K�ch ho�t s� d�ng B�nh Trung Thu (kh�ng nh�n v�t ph�m, th�m 25% �i�m kinh nghi�m)/#confirm_method(1)")
	tinsert(tSay, "K�ch ho�t s� d�ng B�nh Trung Thu (c� nh�n v�t ph�m)/#confirm_method(0)")
	
	Say(szHeader, getn(tSay), tSay)
end

function confirm_method(nType)
	if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD_CONFIRM) == 0 then
		gf_SetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD_CONFIRM, 1)
	end
	gf_SetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD, nType)
	gf_WriteLogEx("Hoat dong thang 9 nam 2010", "Thay ��i h�nh th�c nh�n th��ng "..nType)
end

function make_cake_201009_01()
	AskClientForNumber("confirm_make_cake_201009_01", 1, 999, "S� b�nh Trung Thu?")
end

function confirm_make_cake_201009_01(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	if gf_Judge_Room_Weight(3, 2," ") ~= 1 then
        	return
     end
	if GetItemCount(2, 1, 30233) < (5 * nQuantity) or GetItemCount(2,1,30230) < (2 * nQuantity) then
		Talk(1, "", "��i hi�p kh�ng mang �� B�t M� ho�c v�t ph�m Xu �� ��i!")
		return
	end
	if DelItem(2, 1, 30233, 5 * nQuantity) == 1 and DelItem(2,1,30230, 2 * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30236, nQuantity}, "B�nh trung thu", "Hoat dong thang 9 nam 2010", "l�m b�nh b�ng v�t ph�m Xu")
	end
	SelectSay()
end

function rabbit_make_cake()
	if GetItemCount(2, 1, 30230) < 16 or GetItemCount(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4]) < 100 or GetItemCount(VET_201009_01_TB_ITEM_LIST[6][2], VET_201009_01_TB_ITEM_LIST[6][3], VET_201009_01_TB_ITEM_LIST[6][4]) < 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201009_01_TB_MAPID) do
        if nMapId == VET_201009_01_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[10])
        return
    end
    
    local nTimeLastKaolu = GetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU)
    local nTimeNow = GetTime()
    if nTimeLastKaolu == nil then
        nTimeLastKaolu = 0
    end
    if nTimeNow - nTimeLastKaolu < 90 then
        Talk(1,"","L� n��ng c�n �ang ho�t ��ng, kh�ng th� n��ng th�m!")
        return
    end
    if DelItem(2, 1, 30230, 16) == 1 and DelItem(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4], 100) == 1 and DelItem(VET_201009_01_TB_ITEM_LIST[6][2], VET_201009_01_TB_ITEM_LIST[6][3], VET_201009_01_TB_ITEM_LIST[6][4], 1) == 1 then
    		local nNpcIndex = CreateNpc("Th�nh H�a ��i", GetName().." L� n��ng", GetWorldPos())
    		SetTask(VET_201009_01_TASK_FLAG_KAOLU,nNpcIndex)
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_09\\activites_01\\npc\\npc_new_kaolu.lua")
		SetNpcLifeTime(nNpcIndex, 90)
		StartTimeGuage("N��ng b�nh", 30,0,1)
    		SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,nTimeNow)
   		SetTask(VET_201009_01_TASK_KAOLU_TIME,nTimeNow) --��ʼ���µĽ׶ο�ʼʱ��
   		SetTask(VET_201009_01_TASK_MUCAI_NUM, 0) --��ʼ���ɹ����뿾¯��ľ����
    end
end