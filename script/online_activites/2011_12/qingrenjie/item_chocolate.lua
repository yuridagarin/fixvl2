--�ɿ���ʹ�ýű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_201112_USED_MAX = 10 --ʹ�ô���10��
VET_201112_EXP = 680000 --ÿ15���õľ���
VET_201112_EXP_ALL = 272000000

VET_201112_CHOCOLATE_TASK = TaskManager:Create(8,1);
VET_201112_CHOCOLATE_TASK.Num = 1;
VET_201112_CHOCOLATE_TASK.IsUsed = 2;
VET_201112_CHOCOLATE_TASK.TriggerTime = 3;
VET_201112_CHOCOLATE_TASK.DaySeq = 4;
VET_201112_CHOCOLATE_TASK.TotalIndex = 5;
VET_201112_CHOCOLATE_TASK.TotalMaxExp = 6;

VET_201112_AWARD_TABLE = {
   	{3, 200, 14020000, 1},
	{1, 1420, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
   	{1, 1420, "Nh�n kim c��ng", {0, 102, 104, 1, 1}, 0},
   	{1, 1420, "Nh�n kim c��ng", {0, 102, 105, 1, 1}, 0},
   	{1, 2100, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},
   	{31, 3440,"give_201112_award()",""},
}

function give_201112_award()
	ModifyReputation(14, 1);
	SetTask(336, GetTask(336) + 14);
	Msg2Player("C�c h� nh�n ���c 14 �i�m S� M�n v� 14 �i�m Danh V�ng.");
end

function OnUse(ItemIndex)
	--�Ƿ��ڻ�ڼ�
	if gf_CheckEventDateEx(53) == 0 then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng!");
		return 0;
	end
	--�Ƿ��Ƕӳ�
  if GetCaptainName() ~= GetName() then
    Talk(1, "", "Ch� c� ��i tr��ng c� quy�n k�ch ho�t s� d�ng.");
    return 0;
  end
  --��������
  local nTeamSize = GetTeamSize();
	if nTeamSize ~= 2 then
  	Talk(1, "","C�n t� ��i 2 ng��i �� k�ch ho�t s� d�ng Socola.");
  	return 0;
  end	
  --�ж��Ƿ��Ѽ�����һ���ɿ���
	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.IsUsed) == 1 then
		Talk(1,"","M�i l�n ch� ���c k�ch ho�t 1 Socola");
		return 0;
	end
	--���79�����ϡ��Ѽ�������ѧ��1��55�����ܲſ��Բμӻ
	local nOldPlayer,i;
	nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel()
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh�n v�t c�p 79 tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c 1 k� n�ng c�p 55 m�i c� th� tham gia")
			local sName = GetName();
			PlayerIndex = nOldPlayer;
			Talk(1,"",format("%s ch�a th�a �i�u ki�n y�u c�u, nh�n v�t c�p 79 tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c 1 k� n�ng c�p 55 m�i c� th� tham gia",sName));
			return 0;
		end
	end
	PlayerIndex = nOldPlayer;
	--�Ƿ�������
	nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if Is_In_City_Map() == 0 then
			Talk(1,"","Ch� c� th� s� d�ng Socola t�i 7 th�nh th� l�n.");
			local sName = GetName();
			PlayerIndex = nOldPlayer;
			Talk(1,"",format("%s ch�a th�a �i�u ki�n y�u c�u, ch� c� th� s� d�ng Socola t�i 7 th�nh th� l�n.",sName));
			return 0;
		end
  end
  PlayerIndex = nOldPlayer;
  --�ж��Ƿ���һ��һŮ�㶮�õ�
  local nSex1,nSex2;
  nOldPlayer = PlayerIndex;
  PlayerIndex = GetTeamMember(1);
  nSex1 = GetSex();
  PlayerIndex = GetTeamMember(2);
  nSex2 = GetSex();
  PlayerIndex = nOldPlayer;
  if nSex1 == nSex2 then
  	Talk(1,"","C�n t� ��i 1 nam 1 n� �� s� d�ng Socola t�nh nh�n.")
  	return 0;
  end
  --�������ʹ�ô���
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
		if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.DaySeq) ~= zgc_pub_day_turn() then
			VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.DaySeq,zgc_pub_day_turn());
			VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.Num,0);
		end
	end
	PlayerIndex = nOldPlayer;
  --�ж��Ƿ����ɿ���
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if GetItemCount(2,1,30356) < 1 then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th�nh vi�n trong ��i <color=green>%s<color> kh�ng mang theo Socola, kh�ng th� k�ch ho�t.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  
    --max �i�m exp to�n ch��ng tr�nh
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp) * VET_201112_EXP * 4 >= VET_201112_EXP_ALL then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th�nh vi�n trong ��i <color=green>%s<color> �� ��t gi�i h�n �i�m kinh nghi�m trong to�n ch��ng tr�nh n�n kh�ng th� k�ch ho�t Socola.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  
  --�Ƿ���ʹ������10��
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num) >= VET_201112_USED_MAX then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th�nh vi�n trong ��i <color=green>%s<color> �� ��t gi�i h�n s� l�n s� d�ng Socola, kh�ng th� k�ch ho�t.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  --�ж϶����Ƿ������18��
  nOldPlayer = PlayerIndex;
  PlayerIndex = GetTeamMember(1);
	local nMapId1,nX1,nY1 = GetWorldPos();
	PlayerIndex = GetTeamMember(2);
	local nMapId2,nX2,nY2 = GetWorldPos();
	local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
  if  nDis < 0 or nDis > 18 then
  	local sName = GetName();
   	PlayerIndex = nOldPlayer
		Talk(1, "",format("Th�nh vi�n trong ��i <color=green>%s<color> ngo�i ph�m vi 18 th��c, k�ch ho�t th�t b�i.",sName))
		return 0;
  end
  PlayerIndex = nOldPlayer
  --�����ռ䲻�㣬������
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
		if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
			local sName = GetName();
   		PlayerIndex = nOldPlayer
			Talk(1, "",format("Th�nh vi�n trong ��i <color=green>%s<color> kh�ng gian h�nh trang kh�ng �� � ch�a, k�ch ho�t th�t b�i.",sName));
      return 0
		end
  end
  PlayerIndex = nOldPlayer;
  --ɾ��ÿ�������ϵ��ɿ���
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if DelItem(2,1,30356,1) == 0 then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Th�nh vi�n trong ��i <color=green>%s<color> s� d�ng Socola c� hi�n t��ng b�t th��ng, k�ch ho�t th�t b�i.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  --�ۼӱ��
  for i = 1,nTeamSize do
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalIndex,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalIndex)+tonumber(GetTeamMember(i)));
  end
  --�ӳ�����������
  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,1);
  --ʱ�䴥����
  CreateTrigger(1,1519,1519*2);
  ContinueTimer(GetTrigger(1519*2));
  --�ǳ�������
  CreateTrigger(3,3006,3006*2);
  --������ʾ
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);	
  	Talk(1,"","�� k�ch ho�t Socola, h�y ��m b�o ph�m vi hi�u �ng, kh�ng n�n r�i kh�i ��i ng� (<color=red>kh�ng ���c m�i th�m th�nh vi�n<color>)")
  end	
  PlayerIndex = nOldPlayer
  --ʹ�ô�����һ�͸����ս���
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);	
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.Num,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num)+1);
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp)+1);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num) == VET_201112_USED_MAX then
	  	gf_EventGiveRandAward(VET_201112_AWARD_TABLE,10000,1,"L� valentine 2012","Ph�n th��ng l� t�nh nh�n");
	  end
	end
	PlayerIndex = nOldPlayer;
end

--��7������1��0��
function Is_In_City_Map()
	local tbMapId = {100,150,200,300,350,400,500,}
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(tbMapId) do
        if nMapId == tbMapId[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
end

--�жϾ���
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
        return -1
    else
		local dx = MapX2 - MapX1
        local dy = MapY2 - MapY1
        local nDist = (dx * dx + dy * dy)^(1/2)
        return nDist
    end;
end

function OnTimer()
	local i;
	local nCount = 0;
	local nMapId1,nX1,nY1 = GetWorldPos();
	local nTeamSize = GetTeamSize();
	local nOldPlayer = PlayerIndex;
	for i = 1,nTeamSize do
	  PlayerIndex = GetTeamMember(i);
	  nCount = nCount + tonumber(PlayerIndex);
	end
	PlayerIndex = nOldPlayer;
	--ɾ��������
	if nTeamSize ~= 2 or nCount ~= VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalIndex) or VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TriggerTime) >= 4 then
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3006*2));
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,0);
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,0);
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalIndex,0);
	  return 1;
	end
	--������
	nOldPlayer = PlayerIndex;
	for i = 1,nTeamSize do
	  PlayerIndex = GetTeamMember(i);
	  local nMapId2,nX2,nY2 = GetWorldPos();
	  local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2);
		if  nDis >= 0 and nDis <= 18 then
			gf_Modify("Exp",VET_201112_EXP);
		end
	end
	PlayerIndex = nOldPlayer;
	--����������һ
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TriggerTime)+1);
	return 0;
end

function Leave_Game()
	RemoveTrigger(GetRunningTrigger());
	RemoveTrigger(GetTrigger(1519*2));
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,0);
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,0);
end