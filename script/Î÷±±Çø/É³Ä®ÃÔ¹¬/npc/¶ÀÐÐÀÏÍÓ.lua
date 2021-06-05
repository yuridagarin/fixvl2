-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ɳĮ�Թ�NPC��������Script
-- By StarryNight
-- 2007/08/07 AM 11:58

-- ��Ҫ�۸����ձ�����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t = 0;
local strTalk = {
	"<sex> ch�ng ta l�i g�p nhau r�i. Ta truy b�t t�n ��c H�nh L�o �� m�y ng�y nay, kh�ng ng� r�ng h�n tr�n ��n sa m�c v�n b� b�t b�i <sex>, th�t �a t�.",
	"��ng kh�ch s�o, v� ta c� chuy�n mu�n th�nh gi�o Vi�n B� kho�i m� nha m�n cho bi�t �ng ��n sa m�c b�t t�n ��c H�nh L�o ��, v�a may ta g�p ���c n�n ra tay tr��c, kh�ng bi�t c� l�m l� k� ho�ch c�a �ng kh�ng?",
	"T�n n�y r�t gian manh, nh�t th�i ta v�n ch�a t�m ���c k� hay, t�m l�i b�t ���c ng��i v� quy �n l� ���c. <sex> t�m ta c� chuy�n g�?",
	}

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 53 then
			TalkEx("talk_01",strTalk);
			nNpcIndex = CreateNpc("Vi�n Phi V�n ","Vi�n Phi V�n ",nMapId,nX,nY,-1,1,1,30);
			SetNpcLifeTime(nNpcIndex,180);
			SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\Ԭ����.lua");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 53 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetPlayerScript("\\script\\������\\ɳĮ�Թ�\\npc\\��������.lua");
				TalkEx("talk_01",strTalk);
				if t==0 then
					nNpcIndex = CreateNpc("Vi�n Phi V�n ","Vi�n Phi V�n ",nMapId,nX,nY,-1,1,1,30);
					SetNpcLifeTime(nNpcIndex,180);
					SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\Ԭ����.lua");
					t=1;
				end
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end

--���Ի�
function talk_01()

local strTalk = {
	"Tr��c ��y ch�ng ta �� di�n m�t m�n k�ch hay, gi� ta �ang mu�n ti�u di�t S�t Th� Oa Oa. D� g� t�n �� c�ng l� Th�p ��i Kim Cang r�t kh� ��nh b�i, n�n ta ��n h�i �ng xem c� c�ch g� kh�ng.",
	"Chuy�n <sex> ��o lo�n Nh�t Ph�m ���ng c�ng c� ch�t th�nh t�ch, gi� ph�i tr�c ti�p ��i ��u v�i Th�p ��i Kim Cang r�i. S�t Th� Oa Oa nham hi�m ��c �c, nh�ng nh��c �i�m c�a h�n ch�nh l� K�o H� L�.",
	"K�o H� L�? Ta nh� h�n t�ng n�i k�o h� l� c�a h�n b� �ng c��p m�t, sau n�y s� m�i ta �n k�o h� l�.",
	}

	TalkEx("talk_02",strTalk);

end

--���Ի�
function talk_02()

local strTalk = {
	"Khi nh�n th�y S�t Th� Oa Oa th�ch nh�t k�o h� l� n�n ta �� b� lo�i Thu�c m� kh�ng m�u kh�ng m�i v�o K�o H� L� v� gi� l�m ng��i b�n k�o �� b�n cho h�n, nh�n l�c h�n h�n m� b�t v� quy �n. Ng��i c� th� ti�n h�nh theo c�ch n�y, v� ng��i �� t�ng c�u h�n n�n d� h�nh ��ng h�n.",
	"Th� ra l� v�y, Vi�n B� kho�i qu� l� cao minh.",
	"Vi�c g� c�ng ��ng v� l�c th� qu� l� h� s�ch. Ch� ta c�n �t Thu�c m� ng��i h�y l�y d�ng, S�t Th� Oa Oa th�ch nh�t K�o H� L� c�a ���ng H� L� � Ph�ng T��ng ph� ng��i c� th� �i mua. Ta ph�i �p gi�i ��c H�nh L�o �� v� nha m�n, sau khi xong chuy�n ch�ng ta s� n�ng ly ch�c m�ng v� ng��i ph�i k� cho ta di�n bi�n s� vi�c. B�o tr�ng v� h�n g�p l�i.",
	"Ta nh�t ��nh s� gi� m�ng s�ng �� t�i nh� c�ng Vi�n B� kho�i, h�n g�p l�i.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,54);
	AddItem(2,0,753,1,1);--�õ���ҩ
	TaskTip("��n Ph�ng T��ng ph� t�m mua K�o H� L� c�a ���ng H� L� �� d� S�t Th� Oa Oa.");
	Msg2Player("��n Ph�ng T��ng ph� t�m mua K�o H� L� c�a ���ng H� L� �� d� S�t Th� Oa Oa.");
	GivePlayerAward("Award_XB_47","Easy");

end

