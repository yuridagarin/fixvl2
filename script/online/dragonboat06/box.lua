Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local npcIndex = GetTriggeringUnit();
	SetNpcLifeTime(npcIndex,0);
	local nRandomNum = random(1,100);
	if nRandomNum <= 10 then
		doeffect(1,"state_move_speed_percent_add",20,5)	--�������20%5��
		Msg2Player("B�n nh�n ���c t�ng t�c 20% trong 5 gi�y");
	elseif nRandomNum <= 20 then
		doeffect(2,"state_move_speed_percent_add",20,5)	--����ѡ�ּ���20%5��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i ���c t�ng 20% t�c �� trong 5 gi�y");
	elseif nRandomNum <= 30 then
		doeffect(1,"state_dispear",0,10)	--�����޵�10��
		Msg2Player("B�n nh�n ���c hi�u qu� v� ��ch trong 10 gi�y");
	elseif nRandomNum <= 40 then
		doeffect(2,"state_dispear",0,5)	--����ѡ���޵�5��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i ���c tr�ng th�i v� ��ch trong 5 gi�y");
	elseif nRandomNum <= 44 then
		doeffect(1,"state_slow",20,5)	--�������20%5��
		Msg2Player("B�n b� gi�m 20% t�c �� trong 5 gi�y");
	elseif nRandomNum <= 48 then
		doeffect(2,"state_slow",20,5)	--�����˼���20%5��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i gi�m 20% t�c �� trong 5 gi�y");
	elseif nRandomNum <= 52 then
		doeffect(1,"state_confusion",0,3)	--�������3��
		Msg2Player("B�n nh�n ���c hi�u qu� h�n lo�n trong 3 gi�y");
	elseif nRandomNum <= 56 then
		doeffect(2,"state_confusion",0,3)	--����ѡ�ֻ���3��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i b� lo�n trong 3 gi�y");
	elseif nRandomNum <= 60 then
		doeffect(1,"state_sleep",0,3)	--����˯��3��
		Msg2Player("M�i ng��i s� r�i v�o tr�ng th�i ng� m� trong 3 gi�y.");
	elseif nRandomNum <= 64 then
		doeffect(2,"state_sleep",0,3)	--����ѡ��˯��3��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i s� r�i v�o tr�ng th�i ng� m� trong 3 gi�y.");
	elseif nRandomNum <= 67 then
		doeffect(1,"state_vertigo",0,3)	--����ѣ��3��
		Msg2Player("B�n nh�n ���c hi�u qu� cho�ng trong 3 gi�y");
	elseif nRandomNum <= 70 then
		doeffect(2,"state_vertigo",0,3)	--������ѣ��3��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i b� cho�ng trong 3 gi�y");
	elseif nRandomNum <= 73 then
		doeffect(1,"state_fetter",0,3)	--������3��
		Msg2Player("B�n nh�n ���c hi�u qu� ��nh th�n trong 3 gi�y");
	elseif nRandomNum <= 76 then
		doeffect(2,"state_fetter",0,3)	--�����˶���3��
		Msg2MSAll(MISSION_ID,GetName().."M�i ng��i ��nh th�n trong 3 gi�y");
	elseif nRandomNum <= 84 then
		ModifyReputation(2,0)	--2������
		Msg2Player("B�n nh�n ���c 2 �i�m danh v�ng");
	elseif nRandomNum <= 92 then
		Earn(20000)	--2������
		Msg2Player("B�n nh�n ���c 2 l��ng v�ng");
	elseif nRandomNum <= 100 then
		ModifyPopur(100)	--10��Ϊ
		Msg2Player("B�n nh�n ���c 100 �i�m tu luy�n");
	else
		Write_Log("Ho�t ��ng t�t �oan Ng� sai s�t","Khi m� r��ng, l�i h�m s� ng�u nhi�n! T�n nh�n v�t:"..GetName())
	end;
end;

--nTypeΪ��ʱ���������Լ���Ϊ��ʱ�����������ˣ�Ϊ��ʱ������������
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