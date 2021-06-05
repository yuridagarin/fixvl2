--�ű����ƣ��������ؿ�boss��������
--�ű����ܣ�boss��������Ҫ�ǽ����ĸ���mission����ز���
--�߻��ˣ��¹���
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-06
--�����޸ļ�¼
--��ע��������style
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua")
Include("\\script\\task\\world\\xibei\\task_main.lua")
Include("\\script\\task\\world\\task_head.lua")

	Tb_boss_script = {
						{"C� D��ng Th�","guyang_death_1",""},
						{"Tr�n M� Th�","zhenmu_death_1",""},
						{"Qu� T��ng Qu�n","ghost_death_1",""},
						{"D��c V��ng","drugking_death_1",""},
						{"Ng� H�nh Kim S�","iron_death_1",""},
						{"Ng� H�nh Th�y S�","water_death_1",""},
						{"Ng� H�nh M�c S�","wood_death_1",""},
						{"Ng� H�nh H�a S�","fire_death_1",""},
						{"Ng� H�nh Th� S�","dust_death_1",""},
						{"Th�ng l�nh t��ng binhHoanT��ng ","binma_yong_death_1",""},
						{"Tr�n M� Th�Hoan T��ng ","zhenmu_jia_death_1",""},
						{"Tr�n m� T��ng qu�nHoan T��ng ","zhenmu_jj_death_1",""},
						{"Huy�t Ma Nh�nHoan T��ng ","xuemo_death_1",""},
						{"Qu� T��ng ��uHoan T��ng ","gui_jj_death_1",""},
						{"Nguy�n h�nh Hoan T��ng","sheng_death_1",""},
						}
	Tb_stage6_boss_info = {
		{"Hoan T��ng (T��ng l�nh t��ng)","Th�ng l�nh t��ng binhHoanT��ng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T��ng (C� D��ng Th�)","Tr�n M� Th�Hoan T��ng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T��ng (Tr�n m� T��ng qu�n)","Tr�n m� T��ng qu�nHoan T��ng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T��ng (Huy�t Ma Nh�n)","Huy�t Ma Nh�nHoan T��ng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Hoan T��ng (Qu� T��ng ��u)","Qu� T��ng ��uHoan T��ng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Nguy�n h�nh Hoan T��ng","Nguy�n h�nh Hoan T��ng - Con trai",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	}
--��������������
function OnDeath(monster_index)
	local monster_name = GetNpcName(monster_index)
	local stage_diff = GetMissionV(MS_DIFF)
	if stage_diff ~= 1 and stage_diff ~= 2 then
		return
	end
	for i = 1,getn(Tb_boss_script) do
		if monster_name == Tb_boss_script[i][1] then
			dostring(Tb_boss_script[i][1+stage_diff].."("..monster_index..","..PlayerIndex..")")
		end
	end
end
--============================��ͨ�ؿ�����===========================
function guyang_death_1(monster_index)
	local strTalk = {
		"(1 �nh h�ng quang l�e l�n c�ng v�i ti�ng r�t ch�i tai)",
		"Ng��i ch�i: ??!? (�nh h�o quang v� ti�ng r�t l�c n�y l� sao? Hay n�n �i h�i Di�p T� Thu.)",
		}
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
	  PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_02) == 17 and IsPlayerDeath() == 0 then
			DelItem(2,0,704,1)--������
			DelItem(2,0,759,1)--��ľ��
			AddItem(2,0,705,1,1)--Ѫ�꾧��
			TalkEx("",strTalk)
			SetTask(TASK_XB_ID_02,18)
			TaskTip("�� ��nh b�i C� D��ng Th� , tr� v� C�n L�n g�p Di�p T� Thu. ")
			Msg2Player("�� ��nh b�i C� D��ng Th� , tr� v� C�n L�n g�p Di�p T� Thu. ")
		end
	end
	normal_stage_finish()
end
function zhenmu_death_1(monster_index)
	local strTalk = {
		"M�t �m thanh l�n vang l�n, l�i v�o t�ng 2 �� m�, mau ch�ng v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng."
		}
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����	
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 25 and IsPlayerDeath() == 0 then
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,26);
			TaskTip("Mau v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng.");
			Msg2Player("Mau v�o l�y b�o r��ng d�a theo ch� d�n c�a m�t h�m T�y H� Ph�p v��ng.");
			GivePlayerAward("Award_XB_32","Easy");
		end
	end
	normal_stage_finish()
end
function ghost_death_1(monster_index)
	local strTalk = {
		"Ch�ng l� ��y l� M�c ��u Ki�m? Ng�c b�i n�y l� g�? Sao kh�ng th�y m�t �� Thi�n H� X� T�c? Tr�o V��ng �� ��n t�i, kh�ng ai c�a Nh�t Ph�m ���ng v�o t�ng 2. Nh�ng v�t n�y nh�t ��nh c� li�n quan t�i v� c�a T� M� ti�n b�i, t�t nh�t n�n h�i �ng ta tr��c."
		};
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 27 and IsPlayerDeath() == 0 then
			DelItem(2,0,717,1);--ɾȥ�ǳ�����
			AddItem(2,0,718,1,1);--���ī��
			AddItem(2,0,719,1,1);--�������
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,28);
			TaskTip("Mang cho T� M� Minh Phong nh�ng v�t c� trong b�o r��ng.");
			Msg2Player("Mang cho T� M� Minh Phong nh�ng v�t c� trong b�o r��ng.");
		end
	end
	normal_stage_finish()
end
function drugking_death_1(monster_index)

	local strTalk = {
		"Ta �� chu�n b� cho ng��i 100 d��c nh�n. D��c Nh�n d��c ph��ng nghi�p �� ph�i th�nh, ��u d�ng nguy�n li�u D��c Nh�n Th�o trong d��c v��ng ��ng.",
		"Kh�ng hay r�i, T�y H� mu�n t�o ra ��i qu�n D��c Nh�n, gi� ph��ng thu�c �� n�m trong tay ta, ph�i v� g�p �u D��ng ti�n b�i.",
		}

	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ	
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 47 and IsPlayerDeath() == 0 then
			DelItem(2,0,760,1)	--ɾ��ҩ������װ
			AddItem(2,0,726,1,1);--��ҩ���õ�ҩ��ҩ��
			AddItem(2,0,727,1,1);--���ķ����麯
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,48);
			TaskTip("H�i b�o �u D��ng H�a, T�y H� C�c t�m ph��ng thu�c D��c V��ng t�o ra ��i qu�n D��c Nh�n, vi�c n�y v� c�ng c�p b�ch.");
			Msg2Player("H�i b�o �u D��ng H�a, T�y H� C�c t�m ph��ng thu�c D��c V��ng t�o ra ��i qu�n D��c Nh�n, vi�c n�y v� c�ng c�p b�ch.");
		end
	end
	normal_stage_finish()
end
function iron_death_1(monster_index)
	local strTalk = {
		"�� ��nh b�i Ng� H�nh S�, v� b�o l�i Th�c B�t Ho�ng."
		}	
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function water_death_1(monster_index)
	local strTalk = {
			"�� ��nh b�i Ng� H�nh S�, v� b�o l�i Th�c B�t Ho�ng."
			}	
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function wood_death_1(monster_index)

	local strTalk = {
		"�� ��nh b�i Ng� H�nh S�, v� b�o l�i Th�c B�t Ho�ng."
		}	
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function fire_death_1(monster_index)

	local strTalk = {
		"�� ��nh b�i Ng� H�nh S�, v� b�o l�i Th�c B�t Ho�ng."
		}	
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function dust_death_1(monster_index)

	local strTalk = {
		"�� ��nh b�i Ng� H�nh S�, v� b�o l�i Th�c B�t Ho�ng."
		}	
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TaskTip("Khi ��nh b�i ���c Ng� H�nh S�, v� h�i b�o Th�c B�t Ho�ng. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function binma_yong_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	nNpcIndex = CreateNpc("Hoan T��ng (C� D��ng Th�)","Tr�n M� Th�Hoan T��ng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--ȡ�ùؿ��������������
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi �� ti�u di�t �o �nh Th�ng l�nh t��ng binh m�, Hoan T��ng bi�n h�a th�nh Tr�n M� Th�!");
			Msg2Player("Khi �� ti�u di�t �o �nh Th�ng l�nh t��ng binh m�, Hoan T��ng bi�n h�a th�nh Tr�n M� Th�!");
		end
	end
end

function zhenmu_jia_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	nNpcIndex = CreateNpc("Hoan T��ng (Tr�n m� T��ng qu�n)","Tr�n m� T��ng qu�nHoan T��ng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--ȡ�ùؿ��������������
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi �� ti�u di�t Hoan T��ng Tr�n M� Th�, Hoan T��ng h�a th�nh Tr�n m� T��ng qu�n!");
			Msg2Player("Khi �� ti�u di�t Hoan T��ng Tr�n M� Th�, Hoan T��ng h�a th�nh Tr�n m� T��ng qu�n!");
		end
	end
end

function zhenmu_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	nNpcIndex = CreateNpc("Hoan T��ng (Huy�t Ma Nh�n)","Huy�t Ma Nh�nHoan T��ng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--ȡ�ùؿ��������������
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi �� ti�u di�t �o �nh Tr�n m� T��ng qu�n, Hoan T��ng h�a th�nh Huy�t Ma Nh�n!");
			Msg2Player("Khi �� ti�u di�t �o �nh Tr�n m� T��ng qu�n, Hoan T��ng h�a th�nh Huy�t Ma Nh�n!");
		end
	end
end

function xuemo_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	nNpcIndex = CreateNpc("Hoan T��ng (Qu� T��ng ��u)","Qu� T��ng ��uHoan T��ng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--ȡ�ùؿ��������������
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Khi �� ti�u di�t �o �nh Huy�t Ma Nh�n, Hoan T��ng h�a th�nh Qu� T��ng ��u! ");
			Msg2Player("Khi �� ti�u di�t �o �nh Huy�t Ma Nh�n, Hoan T��ng h�a th�nh Qu� T��ng ��u! ");
		end
	end
end

function gui_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	nNpcIndex = CreateNpc("Nguy�n h�nh Hoan T��ng","Nguy�n h�nh Hoan T��ng",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--ȡ�ùؿ��������������
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--����
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("Ti�u di�t �o �nh Qu� T��ng ��u, nguy�n h�nh c�a Hoan T��ng-Con trai xu�t hi�n!!");
			Msg2Player("Ti�u di�t �o �nh Qu� T��ng ��u, nguy�n h�nh c�a Hoan T��ng-Con trai xu�t hi�n!!");
		end
	end
end

function sheng_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	local strSay = {
		"Khi ��nh b�i nguy�n h�nh c�a Hoan T��ng , theo l�i c�a Di�p T� Thu, l�c n�y ph�i d�ng th�n ch� phong �n n�. Xin ch�n c�u th�n ch� phong �n: ",
		HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
		HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
		HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
		}
	SetNpcLifeTime(monster_index,15);--ʹ��ʬ����ʧ
	--ȡ�ùؿ��������������
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	normal_stage_finish()
	--����
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 64 and IsPlayerDeath() == 0 then
			SetPlayerScript("\\script\\missions\\northwest_mission\\npc\\boss_death.lua")
			SelectSay(strSay);
		end
	end
end

--ȷ������
function Confirm_Curse(index)
	local strTalk = {};
	--��ӡ�ɹ�
	if GetTask(HUANGXIANG_CURSE_ID) == index then
		SetTask(TASK_XB_ID_01,65);
		strTalk = {
			"Ng��i ch�i: Nguy�n h�nh Hoan T��ng �� b� phong �n th�nh c�ng, sau khi t�ng ph�p kh� cho B�ch Thi�n Th�nh li�n tr� th�p phong y�u cho Di�p T� Thu. "
			}
		Msg2Player("Sau khi t�ng ph�p kh� phong �n cho B�ch Thi�n Th�nh, th� mang tr� th�p phong �n cho Di�p T� Thu. ");
		TaskTip("Sau khi t�ng ph�p kh� phong �n cho B�ch Thi�n Th�nh, th� mang tr� th�p phong �n cho Di�p T� Thu. ");
	--��ӡʧ��
	else
		strTalk = {
			"Th�n ch� kh�ng hi�u l�c, nguy�n h�nh Hoan T��ng �� ch�y tho�t!"
			}
	end
	TalkEx("",strTalk);
end
--�ؿ��ɹ����
function normal_stage_finish()
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--�����boss�����ĸ���
function stage_5_boss_index_deal(monster_index)
	local boss_index_att = 0		--��ʱboss��������
	local boss_index_att_0 = 0		--�հ�����λ��
	for i = MS_BOSS_INDEX_1,MS_BOSS_INDEX_5 do
		if GetMissionV(i) == 0 then
			boss_index_att_0 = i
			break
		elseif monster_index == GetMissionV(i) then
			boss_index_att = i
		end
	end
	SetMissionV(boss_index_att,GetMissionV(boss_index_att_0-1))
	SetMissionV((boss_index_att_0-1),0)
end
--============================���ӹؿ�����===========================
--����ʹ������ʹ
function moon_sun_death(kill_index)
	--����ǹ�����ɱ���Ĳ�������
	if kill_index == 0 then
		return
	end
	--��������ɱ���������Ѫħ�˵�����
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--Ѫħ��
function blood_monster_death(kill_index)
	--ֻ����һ�Ĵ���
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--���ͺ���
function dragon_fox_death(kill_index)
	--����ǹ�����ɱ����
	if kill_index == 0 then
		local boss_index = mf_GetMissionV(MS_ID,MS_BOSS_INDEX_ID)
		stage_1_boss_add_life(boss_index,1,1)
	end
	mf_SetMissionV(MS_ID,MS_DRAGON_FOX_NUM,(mf_GetMissionV(MS_ID,MS_DRAGON_FOX_NUM)-1))
end
--������
function stage_1_boss_death()
	--����Ϣ
	Zgc_pub_mission_team_msg("�C� D��ng Th� b� ti�u di�t, v��t qua �i!")
	--���ùؿ�״̬
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_end)
	--��������
	--����ؿ����״̬���������ô�����
end
