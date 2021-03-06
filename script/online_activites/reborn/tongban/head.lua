--=============================================
--create by zhoulimei 2009-12-28
--describe:越南版转生同伴系统头文件
--related files: 
--1、strings.lua  --字符串
--2、yin.lua      --各门会印（龙子印凤子印虎子印鹰子印）脚本
--3、shipindai    --食品袋脚本
--4、\script\online_activites\task_values.lua --任务变量
--=============================================

Include("\\script\\online_activites\\reborn\\tongban\\strings.lua");--字符串文件
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua")

File_name = "\\script\\online_activites\\reborn\\tongban\\head.lua"

VET_201003_TONGBAN_HEALTH_POINT_MAX = 300        --越南200912同伴系统 同伴健康点上限
VET_201003_TONGBAN_UPGRADE_TO_2 = 600            --越南200912同伴系统 一级-》二级 需要的升级点
VET_201003_TONGBAN_UPGRADE_TO_3 = 3600           --越南200912同伴系统 二级-》三级 需要的升级点
VET_201003_TONGBAN_GET_HEALTH_POINT_FROM_SHIPINDAI = 10  --越南200912同伴系统  使用食品袋获得健康点
VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX = 4            --越南200912同伴系统  日常任务每天获得次数
VET_201003_TONGBAN_DAILY_TASK_INTERVAL = 30       --越南200912同伴系统   日常任务任务间隔时间（分钟）
VET_201003_TONGBAN_TRIGGER_ID_IN_TABLE = 1502     --越南200912同伴系统   触发器表内ID
VET_201003_TONGBAN_MENHUI_TYPE_LONGZI = 1         --越南200912同伴系统   门会类型 龙子
VET_201003_TONGBAN_MENHUI_TYPE_FENGZI = 4         --越南200912同伴系统   门会类型 凤子
VET_201003_TONGBAN_MENHUI_TYPE_HUZI = 2           --越南200912同伴系统   门会类型 虎子
VET_201003_TONGBAN_MENHUI_TYPE_YINGZI = 3         --越南200912同伴系统   门会类型 鹰子
VET_201003_TONGBAN_JIHUO = 2575                   --越南200912同伴系统   激活ID

PET_EXP_NEED = 50000000

function pet_init()
--	if GetLevel() < 75 then
--		Talk(1, "", "Ъng c蕄 75 tr? l猲 m韎 c? th? thao t竎 t輓h n╪g n祔!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", "Ph秈 h鋍 y  k? n╪g c蕄 55 c馻 m玭 ph竔 m韎 c? th? thao t竎 t輓h n╪g n祔!")
--		return
--	end
	
	if GetTask(TASK_VNG_PET) == 0 then
		Talk(1,"","B筺 ch璦 c? B筺 уng H祅h, h穣 n g苝 <color=yellow>B綾 u L穙 Nh﹏<color>!")
		return
	end
	
	if gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX) == 0 then
		gf_SetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX,random(1,2))
	end
	
	-- Do l祄 lo筰 h譶h p tr鴑g sau khi  ra pet c蕄 1 n猲 ph秈 set l筰 ki觰 h譶h v祇 task
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
	local tHeader = "в k輈h ho箃 v? n﹏g c蕄 B綾 u Ng? Linh Th莕 Thu藅, h穣 n g苝 <color=yellow>B綾 u L穙 Nh﹏<color>. Ch鋘 t輓h n╪g mu鑞 s? d鬾g:"	
	tinsert(tSay, "G鋓 B筺 уng H祅h/summon_pet")
	tinsert(tSay, "Thu h錳 B筺 уng H祅h/remove_pet")
	tinsert(tSay, "Tr? chuy謓 v韎 B筺 уng H祅h/chat_pet")	
	tinsert(tSay, "Nhi謒 v? thng nh藅 ch╩ s鉩 B筺 уng H祅h/quest_pet")
	tinsert(tSay, "Xem th玭g s? B筺 уng H祅h/info_pet")	
	tinsert(tSay, "R阨 kh醝/dialog_over")
	
	Say(tHeader, getn(tSay), tSay)
end

function info_pet()
	if GetTask(TASK_VNG_PET) == 0 then
		Talk(1,"","B筺 ch璦 c? B筺 уng H祅h!")
		return
	end
	local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)	
	local strSexType = tPetInfo[nCurLevel][2][gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX)]
	local nMaxZone = floor(mod(GetTask(TSK_PET_TAIXU_POINT), 1000) / 10)
	local nMaxStage = mod(GetTask(TSK_PET_TAIXU_POINT), 10)
	local nPetInstancePoint = floor(GetTask(TSK_PET_TAIXU_POINT) / 1000)
	local strTalk = format("C蕄 : <color=yellow>%d<color>.\n觤 n﹏g c蕄: <color=yellow>%d<color> 甶觤.\n觤 linh l鵦: <color=yellow>%d<color> 甶觤.\nLo筰 h譶h: <color=yellow>%s<color>.\nKi觰 h譶h: <color=yellow>%s<color>.\nN╪g l鵦 b? sung: <color=yellow>Ch璦 c?<color>.\n觤 vt 秈: <color=yellow>%d<color>.\nK? l鬰 vt 秈: <color=yellow>秈 %d t莕g %d<color>.",nCurLevel,nCurPoint,nCurGodPoint,tPetInfo[nCurLevel][1],strSexType,nPetInstancePoint,nMaxZone,nMaxStage)
	Talk(1,"",strTalk)
end

function pet_gp_training()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B筺 ch璦 g鋓 B筺 уng H祅h!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))	
	Pet_ResetTask()	
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	Say("<color=green>觤 Linh L鵦<color> 秐h hng n ti襪 n╪g c馻 B筺 уng H祅h. M鏸 l莕 tu luy謓 <color=yellow>ti猽 hao 50.000.000 甶觤 kinh nghi謒 c馻 b秐 th﹏<color>. H玬 nay b筺  ho祅 th祅h tu luy謓 Linh L鵦 cho B筺 уng H祅h <color=yellow>"..nQuestGPCount.."<color> l莕. B筺 c? mu鑞 ti誴 t鬰 tu luy謓?",2,"уng ?!/pet_gp_training_confirm","Ta ch璦 c莕/gf_DoNothing")
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
		Talk(1, "", "Ch誸 m? i 甶觤 linh l鴆 l祄 chi !!!")
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
		Talk(1,"","B筺 уng H祅h c馻 b筺  t 甶觤 Linh L鵦 t鑙 產 c馻 c蕄!")
		return
	end
	if nQuestGPCount >= tRequireElement[nCurLevel][7] then
		Talk(1,"","H玬 nay b筺  tu luy謓 nhi襲 r錳! Mai h穣 ti誴 t鬰 nh?!")
		return
	end
	if GetExp() < PET_EXP_NEED then
		Talk(1,"","B筺 kh玭g  50000000 甶觤 kinh nghi謒  truy襫 cho B筺 уng H祅h!")
		return
	end
	ModifyExp(-PET_EXP_NEED)
	SetTask(TASK_VNG_PET_GODPOINT, nTaskID + 1)
	Pet_AddGP(tGP_Daily[nQuestGPCount + 1])
	Msg2Player("B筺 уng H祅h nh薾 頲 "..tGP_Daily[nQuestGPCount + 1].." 甶觤 Linh L鵦.")	
	Msg2Player("B筺 b? tr? 50000000 甶觤 kinh nghi謒.")
	WriteLogEx("Ban Dong Hanh","r蘮 luy謓 l莕 th? "..(nQuestGPCount + 1))
	pet_gp_training()	
end
--==============================================
--function describe:同伴系统日常任务给奖励函数
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
--function describe:同伴系统日常任务给奖励函数
--===============================================
function vet_201003_tongban_daily_task_award(nMul)
    gf_EventGiveCustomAward(1, 1000000 * nMul, 1, VET_201003_TONGBAN_STR_LOGTITLE);     --经验
    gf_EventGiveCustomAward(3, 24 * nMul, 0, VET_201003_TONGBAN_STR_LOGTITLE);          --声望
    if GetPlayerFaction() ~= 0 then
        gf_EventGiveCustomAward(4, 24 * nMul, 1, VET_201003_TONGBAN_STR_LOGTITLE);      --师门贡献
    end
    local nCurrank = GetTask(704);
    local nRankPoint = GetTask(701);
    if nCurrank ~= 0 then
        SetTask(701, nRankPoint + 300 * nMul);
        Msg2Player(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[22], 300 * nMul));
        --Msg2Player("您获得了" .. 300 * nMul .. "军功！");
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[1] .. 300 * nMul);
    end
end

--==============================================
--function describe:同伴系统日常任务随机选择任务
--===============================================
function vet_201003_tongban_daily_task_item()
    local nRand = random(1, 100);
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nType;
    if nRand <= 30 then
        nType = 1; --白驹丸
    elseif nRand <= 60 then
        nType = 2; --六神丸
    elseif nRand <= 90 then
        nType = 3; --三清丸
    else
        nType = 4; --军功章
    end
    SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, nType);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[13], nLevel, VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nType][1]), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][2] .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nType][1] .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][3], 0);
end

--==============================================
--function describe:同伴系统日常任务交纳任务
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
--function describe:门会印入口函数
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
		Talk(1,"","B筺 ph秈 thu h錳 B筺 уng H祅h trc khi i t猲!")
		return
	end
	local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nUpgradePoint = floor(GetTask(TASK_VNG_PET) / 100)	
    if nPartnerLevel < 1 then
        Talk(1, "", "Ch璦 h鋍 B綾 u Ng? Linh Th莕 Thu藅 n猲 kh玭g th? i t猲 B筺 уng H祅h!")
        return
    end    
    	local szName = CustomDataRead("pet_name") or ""
	if szName == "" then	
		Talk(1,"","B筺 ch璦 c? B筺 уng H祅h n猲 kh玭g th? i t猲!")
		return
	end	
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","B筺 c莕 ph秈 c? 1 N? Oa Tinh Th筩h  i t猲 B筺 уng H祅h!")
		return
	end
	pet_rename_input()	
end

function pet_rename_input()
	AskClientForString("pet_rename_confirm","",1,16, "Nh藀 t猲:")
end

function pet_rename_confirm(szName)
	if szName == "" or szName == nil  then
		Talk(1,"","B筺 t t猲 sai quy nh!")
		return
	end
	if DelItem(2,1,504,1) == 1 then		
		CustomDataSave("pet_name","s",szName)		
	end
end

function summon_pet()
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu v鵦 n祔 kh玭g th? g鋓 b筺 ng h祅h.")
	      return
	end
    KillFollower()
    --AskClientForString("confirm_summon_pet","",1,31, "Nh藀 t猲:")
    Say("B筺 mu鑞 g鋓 B筺 уng H祅h?",3,"Ta mu鑞 g鋓!/call_pet","фi t猲 B筺 уng H祅h/pet_rename","в ta suy ngh?/vet_201003_tongban_end_dialog")    
end

function call_pet()
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu v鵦 n祔 kh玭g th? g鋓 b筺 ng h祅h.")
	      return
	end
	local szName = CustomDataRead("pet_name") or ""
	if szName == "" then	
		Say("Зy l? l莕 u ti猲 b筺 g鋓 <color=yellow>B筺 уng H祅h<color>, h穣 t t猲 cho b筺 ng h祅h. <color=red>Ch? ?: Ch? 頲 t 1 l莕 duy nh蕋. N誹 mu鑞 i t猲 B筺 уng H祅h ph秈 g苝 B綾 u L穙 Nh﹏ s? d鬾g 1 N? Oa Tinh Th筩h.<color>",2,"Ta ng ?!/assign_name","в ta suy ngh?/vet_201003_tongban_end_dialog")
		return
	end	
	confirm_summon_pet(szName)
end

function assign_name()
	AskClientForString("confirm_summon_pet","",1,16, "Nh藀 t猲:")
end

function confirm_summon_pet(szName)	
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu v鵦 n祔 kh玭g th? g鋓 b筺 ng h祅h.")
	      return
	end
	if szName == "" or szName == nil  then
		Talk(1,"","B筺 t t猲 sai quy nh!")
		return
	end
    local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)	
    if nPartnerLevel < 1 or nPartnerLevel > 4 then
        Talk(1, "", "Ch璦 h鋍 B綾 u Ng? Linh Th莕 Thu藅 n猲 kh玭g th? g鋓 b筺 ng h祅h!")
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
	AskClientForString("confirm_chat_pet","",1,31, "B筺 h醝:")
end

function confirm_chat_pet(szContent)
	local nRand = random(1, 10)
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B筺 ch璦 g鋓 B筺 уng H祅h!")
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
		--Msg2Player("B筺 nh薾 頲 500000 甶觤 kinh nghi謒.")
	--end
end

function quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B筺 ch璦 g鋓 B筺 уng H祅h!")
		return
	end
	local tSay = {}
	local tHeader = "M鏸 ng祔 ch? c? th? l祄 <color=yellow>4<color> nhi謒 v?, gi穘 c竎h gi鱝 2 l莕 th鵦 hi謓 nhi謒 v? l? <color=yellow>900<color> gi﹜. в nh薾 thng c莕 ph秈 ho祅 th祅h  <color=yellow>4<color> nhi謒 v? trong ng祔."
	
	tinsert(tSay, "Nh薾 nhi謒 v? thng nh藅/receive_quest_pet")
	tinsert(tSay, "Ho祅 th祅h nhi謒 v? thng nh藅/done_quest_pet")
	tinsert(tSay,"R蘮 luy謓 B筺 уng H祅h/pet_train")
	tinsert(tSay, "Tu luy謓 Linh L鵦/pet_gp_training")	
	tinsert(tSay, "R阨 kh醝/dialog_over")
	
	Say(tHeader, getn(tSay), tSay)
end

function pet_train()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B筺 уng H祅h ng c蕄 2 tr? l猲 m韎 c? th? s? d鬾g ch鴆 n╪g n祔!")
		return
	end
	local tSay = {
		"Ta mu鑞 r蘮 luy謓 ? sa m筩/pet_train_confirm",
		"Ta mu鑞 r蘮 luy謓 tr猲 bi觧/pet_train_confirm",
		"Ta mu鑞 r蘮 luy謓 trong r鮪g/pet_train_confirm",
		"Ta mu鑞 r蘮 luy謓 tr猲 n骾/pet_train_confirm",
		"Ta mu鑞 nh薾 k誸 qu? r蘮 luy謓/pet_train_award",
		"K誸 th骳 i tho筰/gf_DoNothing",	
	}
	Say("R蘮 luy謓 B筺 уng H祅h t筰 C? Фo. ", getn(tSay), tSay)
end

function pet_train_confirm()
	Pet_ResetTask()
	local nTrainCount = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN)
	if nTrainCount >= 6 then
		Talk(1,"","H玬 nay b筺  r蘮 luy謓 B筺 уng H祅h 6 l莕! B筺 уng H祅h  m謙 r錳.")		
		return	
	end	
	if GetTask(TASK_PET_TRAIN_TIME) ~= 0 then
		Talk(1,"","B筺 уng H祅h 產ng r蘮 luy謓 r錳. Xin ng l祄 phi襫!")		
		return	
	end
	if nTrainCount >= 1 then
		if GetItemCount(2,0,504) < 1 then
			Talk(1,"","Зy l? l莕 r蘮 luy謓 B筺 уng H祅h th? 2 trong ng祔. B筺 c莕 ph秈 s? d鬾g 1 C﹜ B竧 Nh? nh?!")		
			return	
		end	
		DelItem(2,0,504,1)
	end
	SetTask(TASK_PET_TRAIN_TIME, GetTime())
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN, nTrainCount +1)
	Talk(1,"","B筺 уng H祅h  di chuy觧 n n琲 r蘮 luy謓. X譶 m阨 10 ph髏 n鱝 h穣 quay l筰!")
end

function pet_train_award()
	Pet_ResetTask()
	if GetTask(TASK_PET_TRAIN_TIME) == 0 then
		Talk(1,"","B筺 уng H祅h ch璦 nh薾 nhi謒 v?  r蘮 luy謓!")		
		return	
	end
	if GetTime() - GetTask(TASK_PET_TRAIN_TIME) < 10*60 then
		Talk(1,"","B筺 уng H祅h v蒼 產ng r蘮 luy謓. Xin ng l祄 phi襫! C遪 "..(600 - (GetTime() - GetTask(TASK_PET_TRAIN_TIME))) .." gi﹜ n鱝 m韎 ho祅 th祅h r蘮 luy謓.")		
		return	
	end
	SetTask(TASK_PET_TRAIN_TIME, 0)
	local nRand = random(1,1000)
	if nRand <= 490 then
		ModifyExp(200000)
		Msg2Player("B筺 nh薾 頲 200000 甶觤 kinh nghi謒.")
		WriteLogEx("Ban Dong Hanh","r蘮 luy謓 nh薾 thng lo筰 1")	
	elseif nRand > 490 and nRand <= 990 then
		ModifyExp(200000)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (1 * 100))
		Msg2Player("B筺 nh薾 頲 200000 甶觤 kinh nghi謒.")
		Msg2Player("B筺 nh薾 頲 1 甶觤 n﹏g c蕄.")
		WriteLogEx("Ban Dong Hanh","r蘮 luy謓 nh薾 thng lo筰 2")	
	elseif nRand > 990 and nRand <= 995 then
		ModifyExp(200000)
		Pet_AddGP(1)
		Msg2Player("B筺 nh薾 頲 200000 甶觤 kinh nghi謒.")
		Msg2Player("B筺 nh薾 頲 1 甶觤 linh l鵦.")
		WriteLogEx("Ban Dong Hanh","r蘮 luy謓 nh薾 thng lo筰 3")	
	elseif nRand > 995 and nRand <= 1000 then
		ModifyExp(200000)
		Pet_AddGP(1)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (1 * 100))
		Msg2Player("B筺 nh薾 頲 200000 甶觤 kinh nghi謒.")		
		Msg2Player("B筺 nh薾 頲 1 甶觤 n﹏g c蕄.")
		Msg2Player("B筺 nh薾 頲 1 甶觤 linh l鵦.")
		WriteLogEx("Ban Dong Hanh","r蘮 luy謓 nh薾 thng lo筰 4")	
	end
	
	local nTrainCounted = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN)
	if nTrainCounted == 6 then
		Pet_AddGP(1)
		Msg2Player("B筺 nh薾 頲 1 甶觤 linh l鵦.")
		gf_AddItemEx2({2, 1, 30114, 1}, "B竧 Nh? Ch鴑g Th?", "Ban Dong Hanh", "nh薾 thng r蘮 luy謓 l莕 th? 6", 24 * 3600)
	end
	pet_train()
end

function receive_quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B筺 ch璦 g鋓 B筺 уng H祅h!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	Pet_ResetTask()
	
	local nQuestCount = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	local nQuestType = floor(mod(GetTask(TASK_VNG_PET_QUEST), 100) / 10)
	
	if nQuestCount >= 4 then
		Talk(1, "", "Х th鵦 hi謓 4 l莕 nhi謒 v? trong ng祔, kh玭g th? nh薾 th猰!")
		return
	end
	if nQuestType ~= 0 then
		Talk(1, "", "ng th鵦 hi謓 nhi謒 v?, kh玭g th? nh薾 th猰!")
		return
	end
	
	local nDiff = 900 - (GetTime() - GetTask(TASK_VNG_PET_TIME))
	if nDiff > 0 then
		Talk(1,"","C遪 "..nDiff.." gi﹜ n鱝 m韎 c? th? nh薾 nhi謒 v? ti誴 theo!")
		return
	end
	
	local nRand = random(1, 4)
	if nRand == 1 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 10 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi謒 v? l莕 n祔 c莕 <color=yellow>8 gi? 駓 th竎 B筩h C﹗ Ho祅<color>  th鵦 hi謓 nhi謒 v?!")
	elseif nRand == 2 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 20 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi謒 v? l莕 n祔 c莕 <color=yellow>8 gi? 駓 th竎 L鬰 Th莕 Ho祅<color>  th鵦 hi謓 nhi謒 v?!")
	elseif nRand == 3 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 30 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi謒 v? l莕 n祔 c莕 <color=yellow>8 gi? 駓 th竎 Tam Thanh Ho祅<color>  th鵦 hi謓 nhi謒 v?!")
	elseif nRand == 4 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 40 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","Nhi謒 v? l莕 n祔 c莕 t譵 <color=yellow>1 C﹜ B竧 Nh?<color>  th鵦 hi謓 nhi謒 v?!")
	end
end

function done_quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B筺 ch璦 g鋓 B筺 уng H祅h!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	Pet_ResetTask()
	
	local nQuestCount = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	local nQuestType = floor(mod(GetTask(TASK_VNG_PET_QUEST), 100) / 10)
	
	if nQuestType == 0 then
		Talk(1, "", "Ch璦 nh薾 nhi謒 v?, kh玭g th? ho祅 th祅h!")
		return
	end
	
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	
	if nQuestType == 1 then
		if nSmallBCH < 480 then
			Talk(1, "", "Kh玭g  th阨 gian 駓 th竎 B筩h C﹗ Ho祅, kh玭g th? ho祅 th祅h nhi謒 v?!")
			return
		else
			SetTask(2501, GetTask(2501) - 480)
		end
	elseif nQuestType == 2 then
		if nSmallLTH < 480 then
			Talk(1, "", "Kh玭g  th阨 gian 駓 th竎 L鬰 Th莕 Ho祅, kh玭g th? ho祅 th祅h nhi謒 v?!")
			return
		else
			EatLiushen(1, -480)
		end
	elseif nQuestType == 3 then
		if nSmallTTH < 480 then
			Talk(1, "", "Kh玭g  th阨 gian 駓 th竎 Tam Thanh Ho祅, kh玭g th? ho祅 th祅h nhi謒 v?!")
			return
		else
			EatSanqin(1,-480)
		end
	elseif nQuestType == 4 then
		if GetItemCount(2, 0, 398) < 1 then
			Talk(1, "", "Trong h祅h trang kh玭g c? C﹜ B竧 Nh?, kh玭g th? ho祅 th祅h nhi謒 v?!")
			return
		else
			DelItem(2, 0, 398, 1)
		end
	end
	
	SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + nQuestCount + 1)
	local nQuestCounted = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 100)
	Msg2Player("Nh薾 頲 1 甶觤 n﹏g c蕄.")
	WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, "nh薾 thng nhi謒 v? l莕 th? "..nQuestCounted)
	if tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, 50}, "Hoa Hng Dng", "Hoat dong thang 11 nam 2010", "Ho祅 th祅h nhi謒 v? B筺 уng H祅h")
	end
	if tonumber(date("%y%m%d")) >= 101210 and tonumber(date("%y%m%d")) <= 110109 then
		gf_AddItemEx2({ 2, 1, 30265, 30},  "Chu玭g Gi竛g Sinh", "Hoat dong thang 12 nam 2010", "Ho祅 th祅h nhi謒 v? B筺 уng H祅h")
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
		gf_AddItemEx2({2, 1, 30114, 1}, "B竧 Nh? Ch鴑g Th?", "Ban Dong Hanh", "nh薾 thng nhi謒 v? h祅g ng祔", 24 * 3600)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nUpgradePoint * 100))
		
		Msg2Player("Nh薾 頲 4000000 甶觤 kinh nghi謒. 24 甶觤 S? M玭, 24 甶觤 Danh V鋘g, 300 Qu﹏ C玭g v? "..nUpgradePoint.." 甶觤 n﹏g c蕄.")
		WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, "nh薾 thng nhi謒 v? l莕 th? 4")
		if tonumber(date("%y%m%d")) >= 100929 and tonumber(date("%y%m%d")) <= 101024 then
			gf_AddItemEx2({ 2, 1, 30233, 50}, "B閠 M?", "Hoat dong thang 9 nam 2010", "Ho祅 th祅h nhi謒 v? B筺 уng H祅h")
		end
	end
	
	Talk(1,"","B筺  ho祅 th祅h nhi謒 v? ch╩ s鉩 B筺 уng H祅h l莕 th? "..nQuestCounted.." trong ng祔!")
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
		Msg2Player("B筺 уng H祅h  t 頲 甶觤 Linh L鵦 t鑙 產 c馻 c蕄, kh玭g th? t╪g th猰.")
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
    
    --等级输入有误
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
    --新的一天
    if GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) == nil or GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) < nDateD then
        SetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK, nDateD);
        SetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT, 0);
        SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, 0);
    end
    
    --是否已接受任务
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) ~= 0 then 
        Talk(1, "", VET_201003_TONGBAN_STR_SHOW_MASSAGE[3]);
        return 0;
    end
    
    --一天累计完成次数
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) >= VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[7]);
        return 0;
    end
    
    --时间间隔30分钟
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
    --新的一天
    if GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) == nil or GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) < nDateD then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    --是否已接受任务
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    
    --交纳任务
    local nRetCode = vet_201003_tongban_hand_daily_task();
    if nRetCode == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[9]);
        return 0;
    end
    
    SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, 0);
    SetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK, nDateM);
    
    --累计4次日常任务奖励
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) == VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX then
        vet_201003_tongban_daily_task_award(nLevel);
    end
    
end

function vet_201003_tongban_show_task()
    --是否已接受任务
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
        --判断升级点
        if nGradePoint < VET_201003_TONGBAN_UPGRADE_TO_2 then
            Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3], VET_201003_TONGBAN_UPGRADE_TO_2 - nGradePoint, nNum));
            --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][1] .. VET_201003_TONGBAN_UPGRADE_TO_2 - nGradePoint .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][2] .. nNum .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][3]);
            return 0;
        end
        
        --判断有龙血丸
        if  vet_201003_tongban_upgrade_judge(nNum) == 0  then
            Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[16]);
            return 0;
        end
        --删除升级物品
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
        
        --3600升级点
        if nGradePoint < VET_201003_TONGBAN_UPGRADE_TO_3 then
            Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3], VET_201003_TONGBAN_UPGRADE_TO_3 - nGradePoint, nNum));
            --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][1] .. VET_201003_TONGBAN_UPGRADE_TO_3 - nGradePoint .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][2] .. nNum .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][3]);
            return 0;
        end
        --判断有龙血丸，凤血丸， 麒麟丸，战神丸
        if  vet_201003_tongban_upgrade_judge(nNum) == 0 then
            Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[17]);
            return 0;
        end
        
        --删除升级物品
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
	Msg2Player("B筺 nh薾 頲 tr筺g th竔 "..szBuffType.." t? B筺 уng H祅h.")
end

function PetRemoveBufff()
	local nAttrId = 2600027
	RemoveState(nAttrId)
end

function vet_201003_tongban_end_dialog()
end