--=============================================
--create by zhoulimei 2009-12-28
--describe:Խ�ϰ�ת��ͬ��ϵͳͷ�ļ�
--related files: 
--1��strings.lua  --�ַ���
--2��yin.lua      --���Ż�ӡ������ӡ����ӡ����ӡӥ��ӡ���ű�
--3��shipindai    --ʳƷ���ű�
--4��\script\online_activites\task_values.lua --�������
--=============================================

Include("\\script\\online_activites\\reborn\\tongban\\strings.lua");--�ַ����ļ�
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua")

File_name = "\\script\\online_activites\\reborn\\tongban\\head.lua"

VET_201003_TONGBAN_HEALTH_POINT_MAX = 300        --Խ��200912ͬ��ϵͳ ͬ�齡��������
VET_201003_TONGBAN_UPGRADE_TO_2 = 600            --Խ��200912ͬ��ϵͳ һ��-������ ��Ҫ��������
VET_201003_TONGBAN_UPGRADE_TO_3 = 3600           --Խ��200912ͬ��ϵͳ ����-������ ��Ҫ��������
VET_201003_TONGBAN_GET_HEALTH_POINT_FROM_SHIPINDAI = 10  --Խ��200912ͬ��ϵͳ  ʹ��ʳƷ����ý�����
VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX = 4            --Խ��200912ͬ��ϵͳ  �ճ�����ÿ���ô���
VET_201003_TONGBAN_DAILY_TASK_INTERVAL = 30       --Խ��200912ͬ��ϵͳ   �ճ�����������ʱ�䣨���ӣ�
VET_201003_TONGBAN_TRIGGER_ID_IN_TABLE = 1502     --Խ��200912ͬ��ϵͳ   ����������ID
VET_201003_TONGBAN_MENHUI_TYPE_LONGZI = 1         --Խ��200912ͬ��ϵͳ   �Ż����� ����
VET_201003_TONGBAN_MENHUI_TYPE_FENGZI = 4         --Խ��200912ͬ��ϵͳ   �Ż����� ����
VET_201003_TONGBAN_MENHUI_TYPE_HUZI = 2           --Խ��200912ͬ��ϵͳ   �Ż����� ����
VET_201003_TONGBAN_MENHUI_TYPE_YINGZI = 3         --Խ��200912ͬ��ϵͳ   �Ż����� ӥ��
VET_201003_TONGBAN_JIHUO = 2575                   --Խ��200912ͬ��ϵͳ   ����ID

PET_EXP_NEED = 50000000

function pet_init()
--	if GetLevel() < 75 then
--		Talk(1, "", "��ng c�p 75 tr� l�n m�i c� th� thao t�c t�nh n�ng n�y!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", "Ph�i h�c ��y �� k� n�ng c�p 55 c�a m�n ph�i m�i c� th� thao t�c t�nh n�ng n�y!")
--		return
--	end
	
	if GetTask(TASK_VNG_PET) == 0 then
		Talk(1,"","B�n ch�a c� B�n ��ng H�nh, h�y ��n g�p <color=yellow>B�c ��u L�o Nh�n<color>!")
		return
	end
	
	if gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX) == 0 then
		gf_SetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX,random(1,2))
	end
	
	-- Do l�m lo�i h�nh ��p tr�ng sau khi �� ra pet c�p 1 n�n ph�i set l�i ki�u h�nh v�o task
	if mod(GetTask(TASK_VNG_PET), 100) == 1 then    
		local nUpgradePoint = floor(GetTask(TASK_VNG_PET) / 100)	
		if nUpgradePoint >= 0 and nUpgradePoint <= 100 then
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 1)
    		elseif  nUpgradePoint > 100 and nUpgradePoint <= 200 then
    			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 2)
    		elseif nUpgradePoint > 200 then
    			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 3)
    		end    
	end
	
	local tSay = {}
	local tHeader = "�� k�ch ho�t v� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t, h�y ��n g�p <color=yellow>B�c ��u L�o Nh�n<color>. Ch�n t�nh n�ng mu�n s� d�ng:"	
	tinsert(tSay, "G�i B�n ��ng H�nh/summon_pet")
	tinsert(tSay, "Thu h�i B�n ��ng H�nh/remove_pet")
	tinsert(tSay, "Tr� chuy�n v�i B�n ��ng H�nh/chat_pet")	
	tinsert(tSay, "Nhi�m v� th��ng nh�t ch�m s�c B�n ��ng H�nh/quest_pet")
	tinsert(tSay, "Xem th�ng s� B�n ��ng H�nh/info_pet")	
	tinsert(tSay, "R�i kh�i/dialog_over")
	
	Say(tHeader, getn(tSay), tSay)
end

function info_pet()
	if GetTask(TASK_VNG_PET) == 0 then
		Talk(1,"","B�n ch�a c� B�n ��ng H�nh!")
		return
	end
	local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)	
	local strSexType = tPetInfo[nCurLevel][2][gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX)]
	local nMaxZone = floor(mod(GetTask(TSK_PET_TAIXU_POINT), 1000) / 10)
	local nMaxStage = mod(GetTask(TSK_PET_TAIXU_POINT), 10)
	local nPetInstancePoint = floor(GetTask(TSK_PET_TAIXU_POINT) / 1000)
	local strTalk = format("C�p ��: <color=yellow>%d<color>.\n�i�m n�ng c�p: <color=yellow>%d<color> �i�m.\n�i�m linh l�c: <color=yellow>%d<color> �i�m.\nLo�i h�nh: <color=yellow>%s<color>.\nKi�u h�nh: <color=yellow>%s<color>.\nN�ng l�c b� sung: <color=yellow>Ch�a c�<color>.\n�i�m v��t �i: <color=yellow>%d<color>.\nK� l�c v��t �i: <color=yellow>�i %d t�ng %d<color>.",nCurLevel,nCurPoint,nCurGodPoint,tPetInfo[nCurLevel][1],strSexType,nPetInstancePoint,nMaxZone,nMaxStage)
	Talk(1,"",strTalk)
end

function pet_gp_training()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B�n ch�a g�i B�n ��ng H�nh!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))	
	Pet_ResetTask()	
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	Say("<color=green>�i�m Linh L�c<color> �nh h��ng ��n ti�m n�ng c�a B�n ��ng H�nh. M�i l�n tu luy�n <color=yellow>ti�u hao 50.000.000 �i�m kinh nghi�m c�a b�n th�n<color>. H�m nay b�n �� ho�n th�nh tu luy�n Linh L�c cho B�n ��ng H�nh <color=yellow>"..nQuestGPCount.."<color> l�n. B�n c� mu�n ti�p t�c tu luy�n?",2,"��ng �!/pet_gp_training_confirm","Ta ch�a c�n/gf_DoNothing")
end

function pet_gp_training_confirm()
tRequireElement =
{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Ch�t m� ��i �i�m linh l�c l�m chi !!!")
		return
	end
	Pet_ResetTask()
	local nDate = tonumber(date("%y%m%d"))	
	local nTaskID = GetTask(TASK_VNG_PET_GODPOINT)
	local nCurGodPoint = floor(nTaskID/100)
	local nQuestGPCount = mod(nTaskID,100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
		
	if nCurGodPoint >= tRequireElement[nCurLevel][6] then
		Msg2Player("vao 1")
		Talk(1,"","B�n ��ng H�nh c�a b�n �� ��t �i�m Linh L�c t�i �a c�a c�p!")
		return
	end
	if nQuestGPCount >= tRequireElement[nCurLevel][7] then
		Talk(1,"","H�m nay b�n �� tu luy�n nhi�u r�i! Mai h�y ti�p t�c nh�!")
		return
	end
	if GetExp() < PET_EXP_NEED then
		Talk(1,"","B�n kh�ng �� 50000000 �i�m kinh nghi�m �� truy�n cho B�n ��ng H�nh!")
		return
	end
	ModifyExp(-PET_EXP_NEED)
	SetTask(TASK_VNG_PET_GODPOINT, nTaskID + 1)
	Pet_AddGP(tGP_Daily[nQuestGPCount + 1])
	Msg2Player("B�n ��ng H�nh nh�n ���c "..tGP_Daily[nQuestGPCount + 1].." �i�m Linh L�c.")	
	Msg2Player("B�n b� tr� 50000000 �i�m kinh nghi�m.")
	WriteLogEx("Ban Dong Hanh","r�n luy�n l�n th� "..(nQuestGPCount + 1))
	pet_gp_training()	
end
--==============================================
--function describe:ͬ��ϵͳ�ճ��������������
--===============================================

function vet_201003_tongban_judge_if_jihuo()
    local njihuo = GetTask(VET_201003_TONGBAN_JIHUO);
    if mod(njihuo,10000)/1000 < 1 then
        return 0;
    else
        return 1;
    end
end
--==============================================
--function describe:ͬ��ϵͳ�ճ��������������
--===============================================
function vet_201003_tongban_daily_task_award(nMul)
    gf_EventGiveCustomAward(1, 1000000 * nMul, 1, VET_201003_TONGBAN_STR_LOGTITLE);     --����
    gf_EventGiveCustomAward(3, 24 * nMul, 0, VET_201003_TONGBAN_STR_LOGTITLE);          --����
    if GetPlayerFaction() ~= 0 then
        gf_EventGiveCustomAward(4, 24 * nMul, 1, VET_201003_TONGBAN_STR_LOGTITLE);      --ʦ�Ź���
    end
    local nCurrank = GetTask(704);
    local nRankPoint = GetTask(701);
    if nCurrank ~= 0 then
        SetTask(701, nRankPoint + 300 * nMul);
        Msg2Player(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[22], 300 * nMul));
        --Msg2Player("�������" .. 300 * nMul .. "������");
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[1] .. 300 * nMul);
    end
end

--==============================================
--function describe:ͬ��ϵͳ�ճ��������ѡ������
--===============================================
function vet_201003_tongban_daily_task_item()
    local nRand = random(1, 100);
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nType;
    if nRand <= 30 then
        nType = 1; --�׾���
    elseif nRand <= 60 then
        nType = 2; --������
    elseif nRand <= 90 then
        nType = 3; --������
    else
        nType = 4; --������
    end
    SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, nType);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[13], nLevel, VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nType][1]), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][2] .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nType][1] .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][3], 0);
end

--==============================================
--function describe:ͬ��ϵͳ�ճ�����������
--===============================================
function vet_201003_tongban_hand_daily_task()
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nItemType = GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM);
    if GetItemCount(VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][1], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][2], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][3]) >= nLevel then
        DelItem(VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][1], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][2], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][3], nLevel);
        Msg2Player(VET_201003_TONGBAN_STR_SHOW_MASSAGE[18]);
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[7] .. nLevel .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][1]);
        return 1;
    else
        return 0;
    end
end

--==============================================
--function describe:�Ż�ӡ��ں���
--===============================================
function vet_201003_tongban_menghuiyin_in()
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nGradePoint = GetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT);
    local nHealthPoint = GetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT);
    if nLevel == nil or nLevel < 1 or nLevel > 3 then
        SetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL, 1);
    end
    if nGradePoint == nil then
        SetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT, 0);
    end
    if nHealthPoint == nil then
        SetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT, 0);
    end
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[21], nLevel, nHealthPoint, nGradePoint),
    getn(VET_201003_TONGBAN_STR_YIN_DIALOG),
    VET_201003_TONGBAN_STR_YIN_DIALOG);
end

function pet_rename()
	local nPetIdx = GetFollower()
	if nPetIdx > 0 then
		Talk(1,"","B�n ph�i thu h�i B�n ��ng H�nh tr��c khi ��i t�n!")
		return
	end
	local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nUpgradePoint = floor(GetTask(TASK_VNG_PET) / 100)	
    if nPartnerLevel < 1 then
        Talk(1, "", "Ch�a h�c B�c ��u Ng� Linh Th�n Thu�t n�n kh�ng th� ��i t�n B�n ��ng H�nh!")
        return
    end    
    	local szName = CustomDataRead("pet_name") or ""
	if szName == "" then	
		Talk(1,"","B�n ch�a c� B�n ��ng H�nh n�n kh�ng th� ��i t�n!")
		return
	end	
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","B�n c�n ph�i c� 1 N� Oa Tinh Th�ch �� ��i t�n B�n ��ng H�nh!")
		return
	end
	pet_rename_input()	
end

function pet_rename_input()
	AskClientForString("pet_rename_confirm","",1,16, "Nh�p t�n:")
end

function pet_rename_confirm(szName)
	if szName == "" or szName == nil  then
		Talk(1,"","B�n ��t t�n sai quy ��nh!")
		return
	end
	if DelItem(2,1,504,1) == 1 then		
		CustomDataSave("pet_name","s",szName)		
	end
end

function summon_pet()
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu v�c n�y kh�ng th� g�i b�n ��ng h�nh.")
	      return
	end
    KillFollower()
    --AskClientForString("confirm_summon_pet","",1,31, "Nh�p t�n:")
    Say("B�n mu�n g�i B�n ��ng H�nh?",3,"Ta mu�n g�i!/call_pet","��i t�n B�n ��ng H�nh/pet_rename","�� ta suy ngh�/vet_201003_tongban_end_dialog")    
end

function call_pet()
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu v�c n�y kh�ng th� g�i b�n ��ng h�nh.")
	      return
	end
	local szName = CustomDataRead("pet_name") or ""
	if szName == "" then	
		Say("��y l� l�n ��u ti�n b�n g�i <color=yellow>B�n ��ng H�nh<color>, h�y ��t t�n cho b�n ��ng h�nh. <color=red>Ch� �: Ch� ���c ��t 1 l�n duy nh�t. N�u mu�n ��i t�n B�n ��ng H�nh ph�i g�p B�c ��u L�o Nh�n s� d�ng 1 N� Oa Tinh Th�ch.<color>",2,"Ta ��ng �!/assign_name","�� ta suy ngh�/vet_201003_tongban_end_dialog")
		return
	end	
	confirm_summon_pet(szName)
end

function assign_name()
	AskClientForString("confirm_summon_pet","",1,16, "Nh�p t�n:")
end

function confirm_summon_pet(szName)	
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu v�c n�y kh�ng th� g�i b�n ��ng h�nh.")
	      return
	end
	if szName == "" or szName == nil  then
		Talk(1,"","B�n ��t t�n sai quy ��nh!")
		return
	end
    local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)	
    if nPartnerLevel < 1 or nPartnerLevel > 4 then
        Talk(1, "", "Ch�a h�c B�c ��u Ng� Linh Th�n Thu�t n�n kh�ng th� g�i b�n ��ng h�nh!")
        return
    end
    
    local nPetType = gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_TYPE)
    SummonNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType], szName)
    PetBuffBonus()
    local nPetIdx = GetFollower()
    local nRand1 = random(1, 10)
    if GetBody() ==1 or GetBody() == 2 then
    		NpcChat( nPetIdx, PET_CHANGE_MALE_DLG[nRand1])    		
    else
    		NpcChat( nPetIdx, PET_CHANGE_FEMALE_DLG[nRand1])    		
    end
    local szPetName = CustomDataRead("pet_name") or ""
    if szPetName == "" then	
      	CustomDataSave("pet_name","s",szName)
    end    
end

function remove_pet()
	PetRemoveBufff()
	KillFollower()
end

function chat_pet()
	AskClientForString("confirm_chat_pet","",1,31, "B�n h�i:")
end

function confirm_chat_pet(szContent)
	local nRand = random(1, 10)
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B�n ch�a g�i B�n ��ng H�nh!")
		return
	end
	NpcChat(nPetIdx, PET_RANDOM_CHAT_DLG[nRand])
--	local nDate = tonumber(date("%y%m%d"))
--	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	--if nQuestDay ~= nDate then
		--SetTask(TASK_VNG_PET_QUEST, nDate*100)
	--end
	--nRand = (1,100)
	--if nRand <= 10 then
		--ModifyExp(500000)
		--Msg2Player("B�n nh�n ���c 500000 �i�m kinh nghi�m.")
	--end
end

function quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B�n ch�a g�i B�n ��ng H�nh!")
		return
	end
	local tSay = {}
	local tHeader = "M�i ng�y ch� c� th� l�m <color=yellow>4<color> nhi�m v�, gi�n c�ch gi�a 2 l�n th�c hi�n nhi�m v� l� <color=yellow>900<color> gi�y. �� nh�n th��ng c�n ph�i ho�n th�nh �� <color=yellow>4<color> nhi�m v� trong ng�y."
	
	tinsert(tSay, "Nh�n nhi�m v� th��ng nh�t/receive_quest_pet")
	tinsert(tSay, "Ho�n th�nh nhi�m v� th��ng nh�t/done_quest_pet")
	tinsert(tSay,"R�n luy�n B�n ��ng H�nh/pet_train")
	tinsert(tSay, "Tu luy�n Linh L�c/pet_gp_training")	
	tinsert(tSay, "R�i kh�i/dialog_over")
	
	Say(tHeader, getn(tSay), tSay)
end

function pet_train()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
		return
	end
	local tSay = {
		"Ta mu�n r�n luy�n � sa m�c/pet_train_confirm",
		"Ta mu�n r�n luy�n tr�n bi�n/pet_train_confirm",
		"Ta mu�n r�n luy�n trong r�ng/pet_train_confirm",
		"Ta mu�n r�n luy�n tr�n n�i/pet_train_confirm",
		"Ta mu�n nh�n k�t qu� r�n luy�n/pet_train_award",
		"K�t th�c ��i tho�i/gf_DoNothing",	
	}
	Say("R�n luy�n B�n ��ng H�nh t�i C� ��o. ", getn(tSay), tSay)
end

function pet_train_confirm()
	Pet_ResetTask()
	local nTrainCount = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN)
	if nTrainCount >= 6 then
		Talk(1,"","H�m nay b�n �� r�n luy�n B�n ��ng H�nh 6 l�n! B�n ��ng H�nh �� m�t r�i.")		
		return	
	end	
	if GetTask(TASK_PET_TRAIN_TIME) ~= 0 then
		Talk(1,"","B�n ��ng H�nh �ang r�n luy�n r�i. Xin ��ng l�m phi�n!")		
		return	
	end
	if nTrainCount >= 1 then
		if GetItemCount(2,0,504) < 1 then
			Talk(1,"","��y l� l�n r�n luy�n B�n ��ng H�nh th� 2 trong ng�y. B�n c�n ph�i s� d�ng 1 C�y B�t Nh� nh�!")		
			return	
		end	
		DelItem(2,0,504,1)
	end
	SetTask(TASK_PET_TRAIN_TIME, GetTime())
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN, nTrainCount +1)
	Talk(1,"","B�n ��ng H�nh �� di chuy�n ��n n�i r�n luy�n. X�n m�i 10 ph�t n�a h�y quay l�i!")
end

function pet_train_award()
	Pet_ResetTask()
	if GetTask(TASK_PET_TRAIN_TIME) == 0 then
		Talk(1,"","B�n ��ng H�nh ch�a nh�n nhi�m v�  r�n luy�n!")		
		return	
	end
	if GetTime() - GetTask(TASK_PET_TRAIN_TIME) < 10*60 then
		Talk(1,"","B�n ��ng H�nh v�n �ang r�n luy�n. Xin ��ng l�m phi�n! C�n "..(600 - (GetTime() - GetTask(TASK_PET_TRAIN_TIME))) .." gi�y n�a m�i ho�n th�nh r�n luy�n.")		
		return	
	end
	SetTask(TASK_PET_TRAIN_TIME, 0)
	local nRand = random(1,1000)
	if nRand <= 490 then
		ModifyExp(200000)
		Msg2Player("B�n nh�n ���c 200000 �i�m kinh nghi�m.")
		WriteLogEx("Ban Dong Hanh","r�n luy�n nh�n th��ng lo�i 1")	
	elseif nRand > 490 and nRand <= 990 then
		ModifyExp(200000)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (1 * 100))
		Msg2Player("B�n nh�n ���c 200000 �i�m kinh nghi�m.")
		Msg2Player("B�n nh�n ���c 1 �i�m n�ng c�p.")
		WriteLogEx("Ban Dong Hanh","r�n luy�n nh�n th��ng lo�i 2")	
	elseif nRand > 990 and nRand <= 995 then
		ModifyExp(200000)
		Pet_AddGP(1)
		Msg2Player("B�n nh�n ���c 200000 �i�m kinh nghi�m.")
		Msg2Player("B�n nh�n ���c 1 �i�m linh l�c.")
		WriteLogEx("Ban Dong Hanh","r�n luy�n nh�n th��ng lo�i 3")	
	elseif nRand > 995 and nRand <= 1000 then
		ModifyExp(200000)
		Pet_AddGP(1)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (1 * 100))
		Msg2Player("B�n nh�n ���c 200000 �i�m kinh nghi�m.")		
		Msg2Player("B�n nh�n ���c 1 �i�m n�ng c�p.")
		Msg2Player("B�n nh�n ���c 1 �i�m linh l�c.")
		WriteLogEx("Ban Dong Hanh","r�n luy�n nh�n th��ng lo�i 4")	
	end
	
	local nTrainCounted = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN)
	if nTrainCounted == 6 then
		Pet_AddGP(1)
		Msg2Player("B�n nh�n ���c 1 �i�m linh l�c.")
		gf_AddItemEx2({2, 1, 30114, 1}, "B�t Nh� Ch�ng Th�", "Ban Dong Hanh", "nh�n th��ng r�n luy�n l�n th� 6", 24 * 3600)
	end
	pet_train()
end

function receive_quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B�n ch�a g�i B�n ��ng H�nh!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	Pet_ResetTask()
	
	local nQuestCount = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	local nQuestType = floor(mod(GetTask(TASK_VNG_PET_QUEST), 100) / 10)
	
	if nQuestCount >= 4 then
		Talk(1, "", "�� th�c hi�n 4 l�n nhi�m v� trong ng�y, kh�ng th� nh�n th�m!")
		return
	end
	if nQuestType ~= 0 then
		Talk(1, "", "�ang th�c hi�n nhi�m v�, kh�ng th� nh�n th�m!")
		return
	end
	
	local nDiff = 900 - (GetTime() - GetTask(TASK_VNG_PET_TIME))
	if nDiff > 0 then
		Talk(1,"","C�n "..nDiff.." gi�y n�a m�i c� th� nh�n nhi�m v� ti�p theo!")
		return
	end
	
	local nRand = random(1, 4)
	if nRand == 1 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 10 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi�m v� l�n n�y c�n <color=yellow>8 gi� �y th�c B�ch C�u Ho�n<color> �� th�c hi�n nhi�m v�!")
	elseif nRand == 2 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 20 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi�m v� l�n n�y c�n <color=yellow>8 gi� �y th�c L�c Th�n Ho�n<color> �� th�c hi�n nhi�m v�!")
	elseif nRand == 3 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 30 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi�m v� l�n n�y c�n <color=yellow>8 gi� �y th�c Tam Thanh Ho�n<color> �� th�c hi�n nhi�m v�!")
	elseif nRand == 4 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 40 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi�m v� l�n n�y c�n t�m <color=yellow>1 C�y B�t Nh�<color> �� th�c hi�n nhi�m v�!")
	end
end

function done_quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B�n ch�a g�i B�n ��ng H�nh!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	Pet_ResetTask()
	
	local nQuestCount = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	local nQuestType = floor(mod(GetTask(TASK_VNG_PET_QUEST), 100) / 10)
	
	if nQuestType == 0 then
		Talk(1, "", "Ch�a nh�n nhi�m v�, kh�ng th� ho�n th�nh!")
		return
	end
	
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	
	if nQuestType == 1 then
		if nSmallBCH < 480 then
			Talk(1, "", "Kh�ng �� th�i gian �y th�c B�ch C�u Ho�n, kh�ng th� ho�n th�nh nhi�m v�!")
			return
		else
			SetTask(2501, GetTask(2501) - 480)
		end
	elseif nQuestType == 2 then
		if nSmallLTH < 480 then
			Talk(1, "", "Kh�ng �� th�i gian �y th�c L�c Th�n Ho�n, kh�ng th� ho�n th�nh nhi�m v�!")
			return
		else
			EatLiushen(1, -480)
		end
	elseif nQuestType == 3 then
		if nSmallTTH < 480 then
			Talk(1, "", "Kh�ng �� th�i gian �y th�c Tam Thanh Ho�n, kh�ng th� ho�n th�nh nhi�m v�!")
			return
		else
			EatSanqin(1,-480)
		end
	elseif nQuestType == 4 then
		if GetItemCount(2, 0, 398) < 1 then
			Talk(1, "", "Trong h�nh trang kh�ng c� C�y B�t Nh�, kh�ng th� ho�n th�nh nhi�m v�!")
			return
		else
			DelItem(2, 0, 398, 1)
		end
	end
	
	SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + nQuestCount + 1)
	local nQuestCounted = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 100)
	Msg2Player("Nh�n ���c 1 �i�m n�ng c�p.")
	WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, "nh�n th��ng nhi�m v� l�n th� "..nQuestCounted)
	if tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, 50}, "Hoa H��ng D��ng", "Hoat dong thang 11 nam 2010", "Ho�n th�nh nhi�m v� B�n ��ng H�nh")
	end
	if tonumber(date("%y%m%d")) >= 101210 and tonumber(date("%y%m%d")) <= 110109 then
		gf_AddItemEx2({ 2, 1, 30265, 30},  "Chu�ng Gi�ng Sinh", "Hoat dong thang 12 nam 2010", "Ho�n th�nh nhi�m v� B�n ��ng H�nh")
	end
	get_award_woodenbox()
	if nQuestCounted == 4 then
		ModifyExp(4000000)
		SetTask(336, GetTask(336) + 24)
		ModifyReputation(24, 0)
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + 300)
		else
			SetTask(701, GetTask(701) - 300)
		end
		local nUpgradePoint = 0
		local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
		
		local nRand = random(1, 100)
		if nRand <= 80 then
			nUpgradePoint = 1
		elseif nRand <= 85 then
			nUpgradePoint = 2
		elseif nRand <= 90 then
			nUpgradePoint = 3
		elseif nRand <= 95 then
			nUpgradePoint = 4
		else
			nUpgradePoint = 5
		end
		gf_AddItemEx2({2, 1, 30114, 1}, "B�t Nh� Ch�ng Th�", "Ban Dong Hanh", "nh�n th��ng nhi�m v� h�ng ng�y", 24 * 3600)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nUpgradePoint * 100))
		
		Msg2Player("Nh�n ���c 4000000 �i�m kinh nghi�m. 24 �i�m S� M�n, 24 �i�m Danh V�ng, 300 Qu�n C�ng v� "..nUpgradePoint.." �i�m n�ng c�p.")
		WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, "nh�n th��ng nhi�m v� l�n th� 4")
		if tonumber(date("%y%m%d")) >= 100929 and tonumber(date("%y%m%d")) <= 101024 then
			gf_AddItemEx2({ 2, 1, 30233, 50}, "B�t M�", "Hoat dong thang 9 nam 2010", "Ho�n th�nh nhi�m v� B�n ��ng H�nh")
		end
	end
	
	Talk(1,"","B�n �� ho�n th�nh nhi�m v� ch�m s�c B�n ��ng H�nh l�n th� "..nQuestCounted.." trong ng�y!")
end

function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end

	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][6] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][6]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B�n ��ng H�nh �� ��t ���c �i�m Linh L�c t�i �a c�a c�p, kh�ng th� t�ng th�m.")
	end
end

function Pet_ResetTask()
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)	
	if nQuestDay ~= nDate then
		local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)		
		SetTask(TASK_VNG_PET_QUEST, nDate*100)
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100)
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN, 0)
	end
end

function vet_201003_tongban_daily_task()
    local nPartnerLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    
    --�ȼ���������
    if nPartnerLevel < 1 or nPartnerLevel > getn(VET_201003_TONGBAN_STR_DAILY_TASK) then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[3]);
        return 0;
    end
    
    local nCount = GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT);
    
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[23], nCount, VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX-nCount),
    getn(VET_201003_TONGBAN_STR_DAILY_TASK[nPartnerLevel]),
    VET_201003_TONGBAN_STR_DAILY_TASK[nPartnerLevel]);
end


function vet_201003_tongban_get_task()
    local nDateD = tonumber(date("%Y%m%d"));
    local nDateM = tonumber(date("%y%m%d%H%M"));
    --�µ�һ��
    if GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) == nil or GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) < nDateD then
        SetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK, nDateD);
        SetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT, 0);
        SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, 0);
    end
    
    --�Ƿ��ѽ�������
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) ~= 0 then 
        Talk(1, "", VET_201003_TONGBAN_STR_SHOW_MASSAGE[3]);
        return 0;
    end
    
    --һ���ۼ���ɴ���
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) >= VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[7]);
        return 0;
    end
    
    --ʱ����30����
    if GetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK) == nil or nDateM - GetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK) > VET_201003_TONGBAN_DAILY_TASK_INTERVAL then
        SetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT, GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) + 1);
    else
        local nTime = VET_201003_TONGBAN_DAILY_TASK_INTERVAL - (nDateM - GetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK));
        Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[8], nTime));
        --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[8][1] .. nTime .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[8][2]);
        return 0;
    end
    
    vet_201003_tongban_daily_task_item();
end

function vet_201003_tongban_hand_task()
    local nDateD = tonumber(date("%Y%m%d"));
    local nDateM = tonumber(date("%y%m%d%H%M"));
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    --�µ�һ��
    if GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) == nil or GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) < nDateD then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    --�Ƿ��ѽ�������
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    
    --��������
    local nRetCode = vet_201003_tongban_hand_daily_task();
    if nRetCode == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[9]);
        return 0;
    end
    
    SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, 0);
    SetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK, nDateM);
    
    --�ۼ�4���ճ�������
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) == VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX then
        vet_201003_tongban_daily_task_award(nLevel);
    end
    
end

function vet_201003_tongban_show_task()
    --�Ƿ��ѽ�������
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nItemType = GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM);
    local nLeftTask = GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) - 1;
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[9], nLevel, VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][1], nLeftTask), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][2] .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][1] .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][3] .. nLeftTask .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][4],0);
end

function vet_201003_tongban_task_explain()
    local nCount = GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[8], VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX-nCount), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[8][1] .. nCount .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[8][2],0);
end

function vet_201003_tongban_upgrade_partner()
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[4][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[4][2], 
    local tbSay = {};
    if nLevel == 1 then
        tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[1]);
    elseif nLevel == 2 then
        tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[2]);
    end
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[3]);
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[4]);
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[5]);
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[6]);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[4], nLevel),
    getn(tbSay), 
    tbSay);
end

function vet_201003_tongban_upgrade_partner_to(nNum)
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nGradePoint = GetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT);
    if nNum == 2 then
        if nLevel ~= 1 then
            if nLevel == 2 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[4]);
            elseif nLevel == 3 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[5]);
            end
            return 0;
        end
        --�ж�������
        if nGradePoint < VET_201003_TONGBAN_UPGRADE_TO_2 then
            Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3], VET_201003_TONGBAN_UPGRADE_TO_2 - nGradePoint, nNum));
            --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][1] .. VET_201003_TONGBAN_UPGRADE_TO_2 - nGradePoint .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][2] .. nNum .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][3]);
            return 0;
        end
        
        --�ж�����Ѫ��
        if  vet_201003_tongban_upgrade_judge(nNum) == 0  then
            Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[16]);
            return 0;
        end
        --ɾ��������Ʒ
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][4]);
        
        SetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL, 2);
        SetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT, 0);
        Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[19], 0);
    elseif nNum == 3 then
        if nLevel ~= 2 then
            if nLevel == 1 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[6]);
            elseif nLevel == 3 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[5]);
            end
            return 0;
        end
        
        --3600������
        if nGradePoint < VET_201003_TONGBAN_UPGRADE_TO_3 then
            Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3], VET_201003_TONGBAN_UPGRADE_TO_3 - nGradePoint, nNum));
            --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][1] .. VET_201003_TONGBAN_UPGRADE_TO_3 - nGradePoint .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][2] .. nNum .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][3]);
            return 0;
        end
        --�ж�����Ѫ�裬��Ѫ�裬 �����裬ս����
        if  vet_201003_tongban_upgrade_judge(nNum) == 0 then
            Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[17]);
            return 0;
        end
        
        --ɾ��������Ʒ
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][4]);
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][4]);
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][4]);
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][4]);
        
        SetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL, 3);
        SetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT, 0);
        Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[20], 0);
    else
        return 0;
    end
end

function vet_201003_tongban_upgrade_judge(nType)
    if nType == 2 then
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3]) < 1 then
            return 0;
        end
    elseif nType == 3 then
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3]) < 1 then
            return 0;
        end
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][3]) < 1 then
            return 0;
        end
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][3]) < 1 then
            return 0;
        end
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][3]) < 1 then
            return 0;
        end
    end
    return 1;
end

function vet_201003_tongban_get_assist()
    local nDate = tonumber(date("%Y%m%d"));
    if GetTask(VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY) == nil or GetTask(VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY) < nDate then
        SetTask(VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY, nDate);
    else
        Talk(1, "", VET_201003_TONGBAN_STR_SHOW_MASSAGE[10]);
        return 0;
    end
    
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nAbility;
    if nLevel == 1 then
        nAbility = 5;
    elseif nLevel == 2 then
        nAbility = 10;
    elseif nLevel == 3 then
        nAbility = 20;
    end 
    local nH = tonumber(date("%H"));
    local nM = tonumber(date("%M"));
    local nS = tonumber(date("%S"));
    
    local nLeftTime = 24*60*60 - (nH*60*60 + nM*60 + nS);
    CastState("state_add_allability", nAbility, nLeftTime);
    --Msg2Player(VET_201003_TONGBAN_STR_SHOW_MASSAGE[7][1] .. nAbility .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[7][2])
    Msg2Player(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[7], nAbility));
    if nLevel == 1 then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[4]);
    elseif nLevel == 2 then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[5]);
    elseif nLevel == 3 then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[6]);
    end
end

function vet_201003_tongban_upgrade_condition()
    local tbSay = {};
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_partner", VET_201003_TONGBAN_STR_SHOW_MASSAGE[17]));
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_condition_next_page", VET_201003_TONGBAN_STR_SHOW_MASSAGE[15]));
    Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[12], getn(tbSay), tbSay);
end

function vet_201003_tongban_upgrade_condition_next_page()
    local tbSay = {};
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_partner", VET_201003_TONGBAN_STR_SHOW_MASSAGE[17]));
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_condition", VET_201003_TONGBAN_STR_SHOW_MASSAGE[16]));
    Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[14], getn(tbSay), tbSay);
end

function vet_201003_tongban_view_point()
    local nHealthPoint = GetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT);
    local nUpgradePoint = GetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[11], nHealthPoint, nUpgradePoint), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[11][1] .. nHealthPoint .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[11][2] .. nUpgradePoint .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[11][3], 0);
end

function PetBuffBonus()
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nPetLevel < 4 then
		return
	end
	
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nAttrId = 2600027
	
	CastState(PET_BUFF_TYPE[nPetLevel][3][1], PET_BUFF_TYPE[nPetLevel][3][2], nLeftTime, 1, nAttrId, 1)
	
	local szBuffType = PET_BUFF_TYPE[nPetLevel][1]
	Msg2Player("B�n nh�n ���c tr�ng th�i "..szBuffType.." t� B�n ��ng H�nh.")
end

function PetRemoveBufff()
	local nAttrId = 2600027
	RemoveState(nAttrId)
end

function vet_201003_tongban_end_dialog()
end