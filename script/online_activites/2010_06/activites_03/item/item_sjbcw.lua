--=============================================
--create by zhoulimei 2010.6.4
--describe��Խ�ϰ�2010��6�¶���ڻ  ���籭����ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_06\\activites_03\\head.lua");--�ͷ�ļ�

function OnUse(nItemIdx)
    local tbSay = {};
    tinsert(tbSay,  format("%s/vet_201006_03_create_pet", VET_201006_03_TB_STRING_LIST[17]));
    tinsert(tbSay,  format("%s/vet_201006_03_nothing", VET_201006_03_TB_STRING_LIST[18]));
    Say(VET_201006_03_TB_STRING_LIST[16] ,getn(tbSay),tbSay); 
    KillFollower();
end

--function vet_201006_03_use()
--    KillFollower();
--    AskClientForString("vet_201006_03_create_pet","",1,14,VET_201006_03_TB_STRING_LIST[19]);
--end

function vet_201006_03_create_pet()
--    if DelItem(VET_201006_03_TB_ITEM_LIST[6][2], VET_201006_03_TB_ITEM_LIST[6][3], VET_201006_03_TB_ITEM_LIST[6][4], 1) == 1 then		
		local nMapID = GetWorldPos()
		if nMapID == 606 or nMapID >= 700 then
			Talk(1,"","Khu v�c n�y kh�ng th� s� d�ng v�t ph�m.")
			return
		end
		SetTask(VET_201006_03_TASK_GET_CHONGWU_DATE,GetTime());
		SummonNpc(VET_201006_03_CHONGWU_NPC,"WorldCup 2010");
		Say(VET_201006_03_TB_STRING_LIST[21],0);
	--	end
end

function vet_201006_03_nothing()
end
