--�ű����ܣ�2011������ҵƻͷ�ļ�
--���ܲ߻�������
--���ܿ�����ţ�����峤
--���ܲ��ԣ�����
--����ʱ�䣺2011-8-10
--�޸ļ�¼��
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")
nActivityId_201108_lamp = 39
VET_201108_LAMPAWARD_TaskGroup=TaskManager:Create(4,1)
VET_201108_LAMPAWARD_TaskGroup.nDaySeq = 1
VET_201108_LAMPAWARD_TaskGroup.nGetLightNum = 2	
VET_201108_LAMPAWARD_TaskGroup.nBossDownNum = 3
--boss�ҵ���û���
HOADANG_LOGTITLE = "Hoat Dong Hoi Hoa Dang 2011"
function vaf_liangshan_boss_down_20110803()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local nBossNum = VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nBossDownNum) + 1
		local tb_award = {2,1,30327,1}
		if zgc_pub_day_turn() ~= VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nDaySeq) then 
			VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nDaySeq,zgc_pub_day_turn())
			VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum,0)
			nBossNum = 1
		end
		if VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum) < 4 and mod(nBossNum,2) == 0 then
			gf_AddItemEx2(tb_award, "��n hoa Trung Thu", HOADANG_LOGTITLE, "nh�n", 24*3600)
			VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum,VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum)+1)
		end
		VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nBossDownNum,nBossNum)
	end
end
--ÿ����������Ʒ
function vaf_liangshan_daily_task_20110803()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local tb_award = {2,1,30327,1}
		gf_AddItemEx2(tb_award, "��n hoa Trung Thu", HOADANG_LOGTITLE, "nh�n", 24*3600)
	end
end
--��������
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--====================�������==============
--�ļ�\script\online\plant\tree_head.lua���Ѷ����������
TASK_PLAN_201108_SMALLTREE_COUNT = 429	--��¼��ҵ�����С���Ĵ���
TASK_PLAN_201108_BIGTREE_COUNT = 431	--��¼��ҵ����ִ����Ĵ���
--С������
function vaf_20110803_small_tree()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local nTimes = GetTask(TASK_PLAN_201108_SMALLTREE_COUNT)
		if nTimes == 8 or nTimes == 16 then			
			local tb_award = {2,1,30327,1}
			gf_AddItemEx2(tb_award, "��n hoa Trung Thu", HOADANG_LOGTITLE, "nh�n", 24*3600)
		end
	end
end
--��������
function vaf_20110803_big_tree()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local nTimes = GetTask(TASK_PLAN_201108_BIGTREE_COUNT)
		if nTimes == 4 or nTimes == 8 then			
			local tb_award = {2,1,30327,1}
			gf_AddItemEx2(tb_award, "��n hoa Trung Thu", HOADANG_LOGTITLE, "nh�n", 24*3600)
		end
	end
end

function vaf_WulinshizhePersonalAwardHD()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local tb_award = {2,1,30327,1}
		gf_AddItemEx2(tb_award, "��n hoa Trung Thu", HOADANG_LOGTITLE, "nh�n", 24*3600)
	end
end

function vaf_WulinshizheTeamAwardHD()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local tb_award = {2,1,30327,1}
		gf_AddItemEx2(tb_award, "��n hoa Trung Thu", HOADANG_LOGTITLE, "nh�n", 24*3600)
	end
end