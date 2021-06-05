--�չ�����
--created by lizhi
--2005-9-10 15:52

Include("\\script\\task\\practice\\practice_head.lua");

function init_trigger(nFaction)
    --����RECT������
    CreateTrigger(2, rect_trigger_table[nFaction][1], rect_trigger_table[nFaction][2]);
    --�������ߴ�����
    CreateTrigger(3, 300, LEAVE_GAME);
    SetLogType(GetTrigger(LEAVE_GAME), 1);  --logout
    --������ʱ������
    CreateTrigger(1, 301, TIME_PRACTICE);       --������ʱ����10Сʱ
    ContinueTimer(GetTrigger(TIME_PRACTICE));
    
    if IsAskQuestion == 1 then
        CreateTrigger(1, 300, TIME_RANDOM_QUESTION);    --���������ּ�ʱ��1Сʱ
        ContinueTimer(GetTrigger(TIME_RANDOM_QUESTION));
        CreateTrigger(1, 302, TIME_ANSWER);
    end;
    --print("practice debug : create trigger");
end;

function free_trigger(nFaction)
    --remove rect trigger
    RemoveTrigger(GetTrigger(rect_trigger_table[nFaction][2]));
    --remove log trigger
    RemoveTrigger(GetTrigger(LEAVE_GAME));
    --remove time trigger
    RemoveTrigger(GetTrigger(TIME_PRACTICE));
    
    if IsAskQuestion == 1 then
        RemoveTrigger(GetTrigger(TIME_RANDOM_QUESTION));
        RemoveTrigger(GetTrigger(TIME_ANSWER));
    end;
    --print("practice debug : remove trigger");
end;

function init_player_state()
    --�жϽ�ɫ�����Ƿ��ܹ�ʹ���书
	if GetUseSkillEnable() == -1 then		--player index ������
		print("practice_main.lua 43 line GetUseSkillEnable() get player index nil");
		return
	elseif GetUseSkillEnable() == 0 then	--���ܹ�ʹ���书
		SetTask(SKILLENABLE, 1);
	elseif GetUseSkillEnable() == 1 then	--�ܹ�ʹ���书
		SetTask(SKILLENABLE, 0);
	end;
    
    LeaveTeam();

    --����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
    SetLogoutRV(1);
    
    --�ر���ӹ���
    SetCreateTeam(1);
    
    ForbitTrade(1);
    
    SetFightState(1);
    
    SetPKFlag(0,0)--�ر�PK����
    ForbidChangePK(1);  --��ֹpk
    UseSkillEnable(0);	--��ֹʹ���书
    
    --�������أ�0�رգ�1��
    CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
    InteractiveEnable(0);
    
    --��̯����
    StallEnable(0);
    
    --˫�������ٶ�
    SetPopBoost(DOUBLE_SPEED);
    --print("practice debug : init_player_state");
end;

function restore_player_state()

    SetLogoutRV(0);
    
    SetFightState(0);
        
    ForbidChangePK(0);
    
    ForbitTrade(0);
    
    SetPKFlag(0,0)--�ر�PK����
    
    ForbidChangePK(0);
	if GetTask(SKILLENABLE) == 0 then
		UseSkillEnable(1);--  (1����ʹ���书��0��ֹʹ���书)
	elseif GetTask(SKILLENABLE) == 1 then
		UseSkillEnable(0);--  (1����ʹ���书��0��ֹʹ���书)
		SetTask(SKILLENABLE, 0);
	end;
    
    --DesaltPlayer(0);
    
    --�������أ�0�رգ�1��
    InteractiveEnable(1);
    
    --��̯����
    StallEnable(1);
    
    SetPopBoost(NORMAL_SPEED);
    --print("practice debug : restore_player_state");
    Msg2Player("T�c �� tu luy�n tr� l�i b�nh th��ng.");
end;

function practice_start()
    --���÷��ص�
    if IsFreeze() == 1 then  --�����WG����
        Talk(1,"","<color=yellow>T�i kho�n b� l�i ho�c �ang ���c s� d�ng!<color>");
        return
    end;
    
	local nFaction = GetPlayerFaction();
	local nMapid, nX, nY = GetWorldPos();
	if DelItem(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3], 1) == 1 then
	    init_trigger(nFaction);
	    --��¼���꣬����ʱʹ��
	    SetTask(TASK_PRACTICE, nMapid);
	    SetTask(TASK_PRACTICE + 1, nX);
	    SetTask(TASK_PRACTICE + 2, nY);
	    --������Ӧ��״̬
	    init_player_state()
	    --�������ɴ��͵���Ӧ�ķ��䣬Ҫ������ͬ���������������ֿ������
	    NewWorld(room_table[nFaction][1], room_table[nFaction][2], room_table[nFaction][3]);
	    Msg2Player("T�c �� tu luy�n t�ng g�p ��i");
	else
		Say("Xin x�c ��nh c� �em theo l�nh b�i s� m�n.",0);
	end;
end;

function practice_end()
    local nFaction = GetPlayerFaction();
    free_trigger(nFaction);
    
    --�ָ�����״̬
    restore_player_state();
    --print("practice debug : practice end");
    Msg2Player("T�c �� tu luy�n tr� l�i b�nh th��ng.");
end;