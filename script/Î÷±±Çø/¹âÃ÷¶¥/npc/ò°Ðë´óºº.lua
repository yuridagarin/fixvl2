-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC����Script
-- By StarryNight
-- 2007/06/20 PM 2:29

-- һ��һ������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"(Ta kh�ng ph�i th�nh t�m gia nh�p Nh�t Ph�m ���ng, sao ph�i l�m chuy�n h�i ng��i? Nh�t Ph�m ���ng ��ng l� t�i �c c�a v� l�m, coi m�ng ng��i nh� c� r�c. N�u kh�ng di�t t�n g�c s� g�y h�a kh�n l��ng.)",
	"(Ng��i n�y ph�m ph�p tr�n ch�y �� ��nh, l�i c�n c�y th� Nh�t Ph�m ���ng t�n h�i v� l�m ��i T�ng, l� ng��i T�ng m� ph�n b�i n��c nh�, kh�ng c� l�ng y�u n��c, th�t l� ��ng khinh� Ta n�n tr� v� t�m Xa Lu�n B� V��ng tr��c.",
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID) == 32 then
			AddItem(2,0,697,1,1);--�����󺺵õ������׼�һ��
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID,33);
			TaskTip("L�y ���c th� c�p c�a Di Tu ��i H�n, l� l�c v� ph�c m�nh v�i Xa Lu�n Ph�p V��ng.");
			Msg2Player("L�y ���c th� c�p c�a Di Tu ��i H�n, l� l�c v� ph�c m�nh v�i Xa Lu�n Ph�p V��ng.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID) == 32 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,697,1,1);--�����󺺵õ������׼�һ��
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID,33);
				TaskTip("L�y ���c th� c�p c�a Di Tu ��i H�n, l� l�c v� ph�c m�nh v�i Xa Lu�n Ph�p V��ng.");
				Msg2Player("L�y ���c th� c�p c�a Di Tu ��i H�n, l� l�c v� ph�c m�nh v�i Xa Lu�n Ph�p V��ng.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
