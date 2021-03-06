Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local npcIndex = GetTriggeringUnit();
	SetNpcLifeTime(npcIndex,0);
	local nRandomNum = random(1,100);
	if nRandomNum <= 10 then
		doeffect(1,"state_move_speed_percent_add",20,5)	--自身加速20%5秒
		Msg2Player("B筺 nh薾 頲 t╪g t鑓 20% trong 5 gi﹜");
	elseif nRandomNum <= 20 then
		doeffect(2,"state_move_speed_percent_add",20,5)	--其他选手加速20%5秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi 頲 t╪g 20% t鑓  trong 5 gi﹜");
	elseif nRandomNum <= 30 then
		doeffect(1,"state_dispear",0,10)	--自身无敌10秒
		Msg2Player("B筺 nh薾 頲 hi謚 qu? v? ch trong 10 gi﹜");
	elseif nRandomNum <= 40 then
		doeffect(2,"state_dispear",0,5)	--其他选手无敌5秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi 頲 tr筺g th竔 v? ch trong 5 gi﹜");
	elseif nRandomNum <= 44 then
		doeffect(1,"state_slow",20,5)	--自身减速20%5秒
		Msg2Player("B筺 b? gi秏 20% t鑓  trong 5 gi﹜");
	elseif nRandomNum <= 48 then
		doeffect(2,"state_slow",20,5)	--其他人减速20%5秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi gi秏 20% t鑓  trong 5 gi﹜");
	elseif nRandomNum <= 52 then
		doeffect(1,"state_confusion",0,3)	--自身混乱3秒
		Msg2Player("B筺 nh薾 頲 hi謚 qu? h鏽 lo筺 trong 3 gi﹜");
	elseif nRandomNum <= 56 then
		doeffect(2,"state_confusion",0,3)	--其他选手混乱3秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi b? lo筺 trong 3 gi﹜");
	elseif nRandomNum <= 60 then
		doeffect(1,"state_sleep",0,3)	--自身睡眠3秒
		Msg2Player("M鋓 ngi s? r琲 v祇 tr筺g th竔 ng? m? trong 3 gi﹜.");
	elseif nRandomNum <= 64 then
		doeffect(2,"state_sleep",0,3)	--其他选手睡眠3秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi s? r琲 v祇 tr筺g th竔 ng? m? trong 3 gi﹜.");
	elseif nRandomNum <= 67 then
		doeffect(1,"state_vertigo",0,3)	--自身眩晕3秒
		Msg2Player("B筺 nh薾 頲 hi謚 qu? cho竛g trong 3 gi﹜");
	elseif nRandomNum <= 70 then
		doeffect(2,"state_vertigo",0,3)	--其他人眩晕3秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi b? cho竛g trong 3 gi﹜");
	elseif nRandomNum <= 73 then
		doeffect(1,"state_fetter",0,3)	--自身定身3秒
		Msg2Player("B筺 nh薾 頲 hi謚 qu? nh th﹏ trong 3 gi﹜");
	elseif nRandomNum <= 76 then
		doeffect(2,"state_fetter",0,3)	--其他人定身3秒
		Msg2MSAll(MISSION_ID,GetName().."M鋓 ngi nh th﹏ trong 3 gi﹜");
	elseif nRandomNum <= 84 then
		ModifyReputation(2,0)	--2点声望
		Msg2Player("B筺 nh薾 頲 2 甶觤 danh v鋘g");
	elseif nRandomNum <= 92 then
		Earn(20000)	--2两金子
		Msg2Player("B筺 nh薾 頲 2 lng v祅g");
	elseif nRandomNum <= 100 then
		ModifyPopur(100)	--10修为
		Msg2Player("B筺 nh薾 頲 100 甶觤 tu luy謓");
	else
		Write_Log("Ho箃 ng t誸 an Ng? sai s鉻","Khi m? rng, l鏸 h祄 s? ng蓇 nhi猲! T猲 nh﹏ v藅:"..GetName())
	end;
end;

--nType为１时，作用于自己；为２时作用于其他人，为３时作用于所有人
function doeffect(nType,sStr,nParam,nTime)
	local OldPlayerIndex = PlayerIndex;
	if nType == 1 then
		CastState(sStr,nParam,nTime*18);
	elseif nType == 2 then
		for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
			PlayerIndex = Get_Player_By_Rank(i);
			if PlayerIndex > 0 and PlayerIndex ~= OldPlayerIndex and GetTask(POSITION) ~= TRAPCOUNT then
				CastState(sStr,nParam,nTime*18);
			end;
		end;
	elseif nType == 3 then
		for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
			PlayerIndex = Get_Player_By_Rank(i);
			if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
				CastState(sStr,nParam,nTime*18);
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;