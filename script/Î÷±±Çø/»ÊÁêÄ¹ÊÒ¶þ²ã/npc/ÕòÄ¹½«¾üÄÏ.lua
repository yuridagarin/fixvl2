-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����Ĺ�Ҷ���NPC��Ĺ������Script
-- By StarryNight
-- 2007/08/03 PM 04:24

-- ǧ�����������ֻΪ����������˺����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nBossState = {0,0,0,0};
local nBossName = {"��ng ","Nam ","T�y ","B�c "}
local strTalk = {
	"B�n h�y ��nh b�i 4 Tr�n M� T��ng Qu�n tr�n gi� t�ng 2 v� ch� c�n t�m ���c Th� M� T��ng Qu�n s� ��nh th�c Qu� T��ng Qu�n �ang gi� b�o r��ng."
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 26 then
			if GetBit(GetTask(ZHENMUJIANGJUN_STATE),2) == 0 then --��δɱ����Ĺ������
				SetTask(ZHENMUJIANGJUN_STATE,SetBit(GetTask(ZHENMUJIANGJUN_STATE),2,1));
				 --4����������
				 if CheckBossStata() == 1 then
					 SetTask(TASK_XB_ID_01,27);
					 SetTask(ZHENMUJIANGJUN_STATE,0);--��ռ�¼��Ĺ��������ı���
					 Msg2Player("T�m ���c Th� M� T��ng Qu�n � t�ng 2 c� th� ��nh th�c Qu� T��ng Qu�n �ang gi� b�o r��ng.");
					 TaskTip("T�m ���c Th� M� T��ng Qu�n � t�ng 2 c� th� ��nh th�c Qu� T��ng Qu�n �ang gi� b�o r��ng.");
					 GivePlayerAward("Award_XB_33","Easy");
					 TalkEx("",strTalk);
				 --��ʾ��δɱ��4����Ĺ������������ʾ
				 elseif  CheckBossStata() == 0 then
					 TipBossMsg();
				 end
			--��ʾ�Ѿ�ɱ��1����Ĺ����������δɱ����	 					
			elseif CheckBossStata() == 0 then
				TipBossMsg();
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) == 26 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				if GetBit(GetTask(ZHENMUJIANGJUN_STATE),2) == 0 then --��δɱ����Ĺ������
					SetTask(ZHENMUJIANGJUN_STATE,SetBit(GetTask(ZHENMUJIANGJUN_STATE),2,1));
					 --4����������
					 if CheckBossStata() == 1 then
						SetTask(TASK_XB_ID_01,27);
						SetTask(ZHENMUJIANGJUN_STATE,0);--��ռ�¼��Ĺ��������ı���
						Msg2Player("T�m ���c Th� M� T��ng Qu�n � t�ng 2 c� th� ��nh th�c Qu� T��ng Qu�n �ang gi� b�o r��ng.");
					 	TaskTip("T�m ���c Th� M� T��ng Qu�n � t�ng 2 c� th� ��nh th�c Qu� T��ng Qu�n �ang gi� b�o r��ng.");
					 	GivePlayerAward("Award_XB_33","Easy");
						TalkEx("",strTalk);
					 --��ʾ��δɱ��4����Ĺ������������ʾ
					 elseif  CheckBossStata() == 0 then
						 TipBossMsg();	 	
					 end
				--��ʾ�Ѿ�ɱ��1����Ĺ����������δɱ����	 					
				elseif CheckBossStata() == 0 then
					TipBossMsg();
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end


--���4����Ĺ����
function CheckBossStata()
	
local i=0;
local nBossState = {0,0,0,0};	
	
	for i=1,4 do
		if GetBit(GetTask(ZHENMUJIANGJUN_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	--��ɱ��
	if nBossState[1] == 1 and nBossState[2] == 1 and nBossState[3] == 1 and nBossState[4] == 1 then
		return 1
	--��δɱ
	elseif nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == 0 then
		return 2
	else
		return 0
	end
	
end

--���4����Ĺ����
function CheckBossStataEx()
	
local i=0;
local nBossState = {0,0,0,0};	
	
	for i=1,4 do
		if GetBit(GetTask(ZHENMUJIANGJUN_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	
	return nBossState
	
end

--��ʾ4����Ĺ�������
function TipBossMsg()

local strMsg = "";
local strTalk = {};
local nNum = 0;
local nBossState = CheckBossStataEx();
local nBossName = {"��ng ","Nam ","T�y ","B�c "};

	for i=1,4 do
		if nBossState[i] == 0 then
			strMsg = strMsg..nBossName[i]
			nNum = nNum + 1
		end
	end
	
	strTalk = {
		"B�n �� h� th�"..(4 - nNum).." Tr�n M� T��ng Qu�n, c�n "..strMsg.." v� "..nNum.." Tr�n M� T��ng Qu�n ch�a ��nh b�i."
		}
		
	TalkEx("",strTalk);
	
end
