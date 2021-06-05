--by liubo
--ʥ������Ʒ�ű�

Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua")
Include("\\script\\online\\zgc_public_fun.lua")

function OnUse(nIndex)
	-- ��Ƿ���
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[1])
		return 0
	end

	if gf_CheckEventDateEx2(2019121500, 2020011523) ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[1])
		return 0
	end
	local nLevel = GetLevel()
	if nLevel < 73  or GetPlayerFaction() == 0 then
		Talk(1,"",tSTRING_201111_TABLE[2])
		return 0
	end
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DaySeq,zgc_pub_day_turn())
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DecoTimes,0)
	end
	if VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.DecoTimes) >= VET_201111_DECOTIMES_MAX then
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[10],VET_201111_DECOTIMES_MAX))
		return 0
	end
	local nFlag = VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.IsCreate)
	if nFlag == 0 then
		if Is_In_City_Map() == 1 then
			if DelItemByIndex(nIndex,1) ~= 1 then
				return 0
			end
			local nIndex = CreateNpc("C�y Gi�ng sinh 2d","C�y th�ng noel c�p 1",GetWorldPos())
			SetNpcScript(nIndex,"\\script\\online_activites\\2011_11\\activity_04\\npc_decorate.lua")
			SetNpcLifeTime(nIndex,VET_201111_TREE_EXITSTIME)
			AddUnitStates(nIndex,6,PlayerIndex)
			VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.IsCreate,1)
			VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TreeIndex,nIndex)
			VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.PlayerIndex,PlayerIndex)
			VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.TimeSpace,GetTime())
			VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.DecoTimes,VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.DecoTimes)+1)
			CreateTrigger(1,VET_201111_TRIGGER_TBID,VET_201111_TRIGGER_UFID)
			ContinueTimer(GetTrigger(VET_201111_TRIGGER_UFID))
			gf_EventGiveCustomAward(1,300000,1,"Event trang tri cay thong noel","C�y th�ng gi�o h�i")
			return 1
		else
			Talk(1,"",tSTRING_DECORATETREE_TABLE[4])
			return 0
		end
	end
	Talk(1,"",tSTRING_DECORATETREE_TABLE[5])
	return 0
end

--��7������1��0��
function Is_In_City_Map()
	local tbMapId = {100,150,200,300,350,400,500,}
    local nMapId,nX,nY = GetWorldPos()
    for i = 1, getn(tbMapId) do
        if nMapId == tbMapId[i] then
            return 1
        end
	end
	return 0
end