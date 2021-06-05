--=============================================
--create by baiyun 2009.5.30
--describe:Խ�ϰ�7�·ݻ֮���̻����̻��ű�
--=============================================
Include("\\script\\item\\yanhuo.lua");
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d%H"));
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDate < 09061900 or nDate >= 09071924 then
		Talk(1, "", "Ho�t ��ng l�n n�y �� k�t th�c");
		return
	end
	if GetLevel() < 50 then
		Talk(1, "", "��i hi�p v�n ch�a �� c�p 50, kh�ng th� s� d�ng ph�o hoa");
		return
	end
	if nDay == 1 or nDay == 2 or nDay == 3 then
		Talk(1, "", "Th�i gian s� d�ng ph�o hoa l�: th� 5, 6,7, ch� nh�t h�ng tu�n trong kho�ng th�i gian t� 16:00 � 24:00");
		return
	end
	if nHour < 16 then
		Talk(1, "", "Th�i gian s� d�ng ph�o hoa l�: th� 5, 6,7, ch� nh�t h�ng tu�n trong kho�ng th�i gian t� 16:00 � 24:00");
		return
	end
	if GetTask(TASK_LAST_USE_DATE) < tonumber(date("%y%m%d")) then
		SetTask(TASK_TODAY_USE_COUNT, 0);
		SetTask(TASK_USE_YANHUA_TIME, 0);
	end
	if GetTask(TASK_TODAY_USE_COUNT) >= CONST_MAX_USE_COUNT then
		Talk(1, "", "M�i ng�y ch� ���c s� d�ng "..CONST_MAX_USE_COUNT.." ph�o hoa");
		return
	end
	
	if tonumber(date("%H%M%S")) - GetTask(TASK_USE_YANHUA_TIME) < CONST_USE_YANHUA_INTERVAL  then
		Talk(1, "", "Gi�n c�ch hai l�n s� d�ng ph�o hoa l� 5 ph�t");
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) ~= 1 then
		return
	end
	
	local nCount = getn(YANHUO_TABLE);
	local nIndex = random(1, nCount);
	local nRetCode = DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
	
	SetItemUseLapse(nItemIdx, CONST_USE_INTERVAL);	--��ȴʱ�䣺5����
	
	SetTask(TASK_TODAY_USE_COUNT, GetTask(TASK_TODAY_USE_COUNT) + 1);
	SetTask(TASK_LAST_USE_DATE, tonumber(date("%y%m%d")));
	SetTask(TASK_USE_YANHUA_TIME, tonumber(date("%H%M%S")));
	gf_SetLogCaption("Hoat dong phao hoa viet nam");
	gf_Modify( "Exp", CONST_USE_GIVE_EXP);
	gf_SetLogCaption("");
	ModifyReputation(8,0)
	Msg2Player("B�n nh�n ���c 8 �i�m danh v�ng.")
end