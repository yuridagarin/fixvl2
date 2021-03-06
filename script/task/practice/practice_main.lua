--闭关修炼
--created by lizhi
--2005-9-10 15:52

Include("\\script\\task\\practice\\practice_head.lua");

function init_trigger(nFaction)
    --创建RECT触发器
    CreateTrigger(2, rect_trigger_table[nFaction][1], rect_trigger_table[nFaction][2]);
    --创建下线触发器
    CreateTrigger(3, 300, LEAVE_GAME);
    SetLogType(GetTrigger(LEAVE_GAME), 1);  --logout
    --创建计时触发器
    CreateTrigger(1, 301, TIME_PRACTICE);       --修炼计时器，10小时
    ContinueTimer(GetTrigger(TIME_PRACTICE));
    
    if IsAskQuestion == 1 then
        CreateTrigger(1, 300, TIME_RANDOM_QUESTION);    --随机问题出现计时，1小时
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
    --判断角色本身是否能够使用武功
	if GetUseSkillEnable() == -1 then		--player index 不存在
		print("practice_main.lua 43 line GetUseSkillEnable() get player index nil");
		return
	elseif GetUseSkillEnable() == 0 then	--不能够使用武功
		SetTask(SKILLENABLE, 1);
	elseif GetUseSkillEnable() == 1 then	--能够使用武功
		SetTask(SKILLENABLE, 0);
	end;
    
    LeaveTeam();

    --玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
    SetLogoutRV(1);
    
    --关闭组队功能
    SetCreateTeam(1);
    
    ForbitTrade(1);
    
    SetFightState(1);
    
    SetPKFlag(0,0)--关闭PK开关
    ForbidChangePK(1);  --禁止pk
    UseSkillEnable(0);	--禁止使用武功
    
    --交互开关，0关闭，1打开
    CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
    InteractiveEnable(0);
    
    --摆摊开关
    StallEnable(0);
    
    --双倍修炼速度
    SetPopBoost(DOUBLE_SPEED);
    --print("practice debug : init_player_state");
end;

function restore_player_state()

    SetLogoutRV(0);
    
    SetFightState(0);
        
    ForbidChangePK(0);
    
    ForbitTrade(0);
    
    SetPKFlag(0,0)--关闭PK开关
    
    ForbidChangePK(0);
	if GetTask(SKILLENABLE) == 0 then
		UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
	elseif GetTask(SKILLENABLE) == 1 then
		UseSkillEnable(0);--  (1可以使用武功，0禁止使用武功)
		SetTask(SKILLENABLE, 0);
	end;
    
    --DesaltPlayer(0);
    
    --交互开关，0关闭，1打开
    InteractiveEnable(1);
    
    --摆摊开关
    StallEnable(1);
    
    SetPopBoost(NORMAL_SPEED);
    --print("practice debug : restore_player_state");
    Msg2Player("T鑓  tu luy謓 tr? l筰 b譶h thng.");
end;

function practice_start()
    --设置返回点
    if IsFreeze() == 1 then  --如果用WG被封
        Talk(1,"","<color=yellow>T礽 kho秐 b? l鏸 ho芻 產ng 頲 s? d鬾g!<color>");
        return
    end;
    
	local nFaction = GetPlayerFaction();
	local nMapid, nX, nY = GetWorldPos();
	if DelItem(cards_table[nFaction][1], cards_table[nFaction][2], cards_table[nFaction][3], 1) == 1 then
	    init_trigger(nFaction);
	    --记录坐标，出关时使用
	    SetTask(TASK_PRACTICE, nMapid);
	    SetTask(TASK_PRACTICE + 1, nX);
	    SetTask(TASK_PRACTICE + 2, nY);
	    --设置相应的状态
	    init_player_state()
	    --根据门派传送到相应的房间，要和门派同服务器，否则会出现跨服问题
	    NewWorld(room_table[nFaction][1], room_table[nFaction][2], room_table[nFaction][3]);
	    Msg2Player("T鑓  tu luy謓 t╪g g蕄 i");
	else
		Say("Xin x竎 nh c? 甧m theo l謓h b礽 s? m玭.",0);
	end;
end;

function practice_end()
    local nFaction = GetPlayerFaction();
    free_trigger(nFaction);
    
    --恢复人物状态
    restore_player_state();
    --print("practice debug : practice end");
    Msg2Player("T鑓  tu luy謓 tr? l筰 b譶h thng.");
end;