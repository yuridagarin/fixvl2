--=============================================
--create by liubo
--describe:Խ�ϰ�2011��8�»2 ��¯�ű�
--related files:
--=============================================
Include("\\script\\online_activites\\2011_08\\activity_02\\baked_cakes_main.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")
Include("\\script\\lib\\globalfunctions.lua")

--NPC�����Ӧ����
function main()
	--ʱ�����
	local nTime = tonumber(GetTime())
	if nTime > (VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End) + 62) then
		Talk(1,"",VET_201108_TB_NPCS_LIST[7])
		return
	end
	--NPC��������
	local nIndexNpc = GetTargetNpc()
	if nIndexNpc ~= VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Npc_Index) then
		Talk(1,"",VET_201108_TB_NPCS_LIST[7])
		return
	end
	--�������Ƿ����
	if VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake) == 1 then
		Say(VET_201108_TB_NPCS_LIST[2],1,VET_201108_TB_NPCS_LIST[3].."/confirm")
		return
	end
	--�Ѿ���ȡ���ϵ��±�
	if VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake) == 2 then
		Talk(1,"",VET_201108_TB_NPCS_LIST[6])
		return
	end
	--������û�н���
	Talk(1,"",VET_201108_TB_NPCS_LIST[1])
end

--ȷ�ϻ�ȡ�Ի���
function confirm()
	Say(VET_201108_TB_NPCS_LIST[2],2,VET_201108_TB_NPCS_LIST[4].."/get_thing",VET_201108_TB_NPCS_LIST[5].."/do_nothing")	
end


function get_thing()
	--�����ռ��ж�
	if gf_Judge_Room_Weight(1,1,"") ~= 1 then 
		return
	end
	VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake,2)
	local nResult,_ = AddItem(VET_201108_ITEM_LIST[3][2],VET_201108_ITEM_LIST[3][3],VET_201108_ITEM_LIST[3][4],5)
	Msg2Player("C�c h� nh�n ���c 5 B�nh Th��ng Hang")
	if nResult ~= 0 then 
		gf_WriteLogEx(VET_201108_LOG_TITLE,VET_201108_TB_LOG_ACTION_LIST[3])
	end
end

function do_nothing()
--do nothing
end