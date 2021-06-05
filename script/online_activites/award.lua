--=============================================
--create by baiyun 2010.1.7
--describe:Խ�ϰ����ʦ����������� ͷ�ļ�
--related files: ��ÿ�����ʦ�����񡢲ؽ��ȵõ�����
--               �Ĵ��붼�����ڴ˴�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\happiness_bag\\happiness_bag.lua"); 
Include("\\script\\online_activites\\silingmount\\silingmount.lua")		--��������
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")			--IpBonus
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")			--ʦ��4��װ������
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\2011_08\\activity_03\\lamp_head.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua") --�Ƹ�����
Include("\\script\\online_activites\\2011_11\\activity_02\\init.lua")--201112ʥ���ڻ
Include("\\script\\online_activites\\2011_12\\chunjie\\init.lua") --2012���ڻ
Include("\\script\\online_activites\\201201\\qingrenjie\\init.lua") --2012��2�����˽ڻ
Include("\\script\\online_activites\\201202\\guojifunvjie\\init.lua")--2012��2�¹��ʸ�Ů��
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua") 
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")
Include("\\script\\online_activites\\2014_03\\task_camp.lua")
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

--��ʦ�����������
function Give_Faction_Award()

end
--���ؽ�������
function Give_CangJian_Award(nStage, GS_RECORD_CHANCE)                         
end
--̫���������һ���ָ�����
function Give_TaiXu_KillMonster_Award(szMonsterName)                           

end
--ͨ��̫���8�ظ�����
function Give_PassTaiXu_Award()                                                
	SetTask(VET_201009_00_TASK_TONGGUAN_TAIXU,1)
end

--��ɸ����ճ�������Ľ���
function Give_Daily_Personal_Task_Award(bBonus)
	--�������� ����
	VET_SilingMountDailyPersonalTaskAward(); 
	VET_IpBonusDailyPersonalTaskAward();
	VET_Tier4DailyPersonalTaskAward(bBonus);
	--�Ƹ�����
	get_award_woodenbox()
end

--����Ŷ��ճ�������Ľ���
function Give_Daily_Team_Task_Award(bBonus)
	--�������� ����
	VET_SilingMountDailyTeamTaskAward(); 
	VET_IpBonusDailyTeamTaskAward();
	VET_Tier4DailyTeamTaskAward(bBonus);
	--�Ƹ�����
	get_award_woodenbox()
end
--��С����������
function Give_XiaoBanRuoShu_Award()                                           
	HBRewardInSmallWisdomTree();
	--VET_IpBonusSeedAward();
	--11��6�»��ͳһ����
	vaf_award_api("tPlantSmallTreePrize")
	--�һ���-С��
	vaf_20110803_small_tree()
end
--�ִ����������
function Give_DaBanRuoShu_Award()                                              
	HBRewardInBigWisdomTree();
	--VET_IpBonusSeedAward();
	--11��6�»��ͳһ����
	vaf_award_api("tPlantBigTreePrize")
	--�һ���-С��
	vaf_20110803_big_tree()													
end
--������30086
function Give_Zhongzi_Award()                                              
	HBRewardInPlantingTreeSeeds();
	--VET_IpBonusSeedAward();
	vaf_award_api("tPlantSeedTree")
end
--�����Ӱ���������ע�ⱳ���ռ䣩
function Give_seedbag_Award()                              
	vaf_award_api("tOpenSeedBagPrize")
end

function give_tuoguan_activity_award()
end
--�̻�����
function Give_Business_Award()                                              
	VET_IpBonusBusinessAward();
end
--������30075
function Give_Zhongzi2_Award()                                              
	--VET_IpBonusSeedAward();
	vaf_award_api("tPlantSeedTree")
end
--��ɽ�ؿ�-ɱboss
function vaf_liangshan_boss_down()
	--2011��8�¹ҵƻ
	vaf_liangshan_boss_down_20110803()
	--�Ƹ�����
	--get_award_woodenbox()
	--���ɽɱboss��õ���
	vaf_award_api("tLiangShanKillBoss")
end
--��ɽ�ؿ�-ÿ������
function vaf_liangshan_daily_task()
	--2011��8�¹ҵƻ
	vaf_liangshan_daily_task_20110803()
	--�Ƹ�����
	get_award_woodenbox()
	--2011��12��ʥ���ڻ
	get_award_liangshan()
	--2012���ڻ
	get_award_liangshan_chunjie()
	--2012��2�����˽ڻ
	get_award_liangshan_qingrenjie()
	--2012��3�¹��ʸ�Ů�ڻ
	get_award_liangshan_funvjie()
	--���ɽÿ�������õ���
	vaf_award_api("tLiangShanDailyTask")
end
--��ɽ�ؿ�-�������屦��
function vaf_liangshan_juyibox()
	--201112ʥ���ڻ
	get_award_juyibox()
	--2012���ڻ
	get_award_juyibox_chunjie()
	--2012��2�����˽ڻ
	get_award_juyibox_qingrenjie()
	--2012��3�¹��ʸ�Ů�ڻ
	get_award_juyibox_funvjie()

end
--TODO add ������-������Դ����ս function �ӿ�
--�μ�һ��������
function extra_tianmenzhen_award(nType)
	--�Ƹ�����
	--get_award_woodenbox()
	--201112ʥ���ڻ
	get_award_tianmenzhen(nType)
	--2012���ڻ
	get_award_tianmenzhen_chunjie(nType)
	--2012��2�����˽ڻ
	get_award_tianmenzhen_qingrenjie(nType)
	--2012��3�¹��ʸ�Ů�ڻ
	get_award_tianmenzhen_funvjie(nType)
	--�������û����
	vaf_TianMenZhen_Award_Api(nType)
end
--TODO add ��ڣ���ؽ���
function extra_wjz_award()
	vaf_award_api("tWanJianZhong")
end
--TODO add ͨ��þ����ؽ���
function extra_ttd_award()
	vaf_award_api("tTongTianHuanJing")
end

--������������Ӣ����
function open_dxg_tyjyx_award()
	--vaf_dxg_open_jyx();
end

--��������������ʥ����
function open_dxg_tyswx_award()
	--vaf_dxg_open_swx();
end

--ɱҰ������и��ʵ�������
function trigger_killnpc_drop()
	vaf_kill_npc_drop();
end

--2014���ڸ��2ɱҰ��
function trigger_killnpc_wildpig(sName)
	Vet_201401_Kill_WildPig(sName);
end

--2014���ڸ��3ɱ���ú�Ұ��
function trigger_killnpc_tuzi(sName)
	Vet_201401_Valentine_Trigger(sName);
end

--2014���ڸ��4ɱҰ��
function trigger_killnpc_wildpig2(sName)
	Vet_201401_sprint2_trigger(sName);
end

--�ɱ��ͨ�ýӿ�
function trigger_killnpc_common(sName)
	WN_201403_KillNpc(sName)
	WN_201403_CampTask_Killer(sName)
	g_akct_KillTrigger(sName)
end

--131���������Ʒ
function vaf_get_prize_daily_reset()
	if gf_CheckEventDateEx(131) ~= 1 then
		return 0;
	end
	local tb = TaskManager:Create(5,10)
	tb:SetTask(10, 0);
end

function vaf_get_prize_item_30709(nRand, nNum)
	if gf_CheckEventDateEx(131) ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	local tb = TaskManager:Create(5,10)
	if tb:GetTask(10) >= 30 then
		return 0;
	end
	if random(100) <= nRand then
		tb:SetTask(10, tb:GetTask(10) + nNum);
		gf_AddItemEx2({2,1,30709,nNum}, "Ch� H�t Sen", "Ho�t ��ng th�ng 8", "Nh�n ���c Ch� H�t Sen", 0, 1)
	end
end