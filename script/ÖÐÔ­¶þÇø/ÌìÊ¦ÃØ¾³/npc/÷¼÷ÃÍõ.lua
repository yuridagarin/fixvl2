-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC�����������ӡ������Script
-- By StarryNight
-- 2007/08/07 PM 11:05

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	if GetTask(TASK_XB_ID_02) == 8 then
		local strSay = {
			"�i�.d��..�au qu�!!&@%!#%......!? (Theo th�n ch� m� C�n L�n m�n nh�n �� c�p, c� th� s� gi�i tr� phong �n n�y)",
				KULOUWANG_CURSE[1].."/#Confirm_Curse(1)",
				KULOUWANG_CURSE[2].."/#Confirm_Curse(2)",
				KULOUWANG_CURSE[3].."/#Confirm_Curse(3)",
				"R�i kh�i/Cancel_Curse"
				}
		SelectSay(strSay);			
	else
		local strTalk = {
			"�i�.d��.�au qu�!! &@%!#%....!",
			}
		TalkEx("",strTalk);
	end	
end;

--����ȷ��
function Confirm_Curse(index)

local nCruseIndex = GetTask(KULOUWANG_CURSE_ID);
local nNpcIndex = GetTargetNpc();

	if nNpcIndex == nil then
		return
	end

	--������ȷ
	if nCruseIndex == index then
		ChangeNpcToFight(nNpcIndex);
		TaskTip("Gi�i tr� phong �n c�a C� L�u v��ng th�nh c�ng, mau ti�u di�t n�.");
		Msg2Player("Gi�i tr� phong �n c�a C� L�u v��ng th�nh c�ng, mau ti�u di�t n�.");
	else
		local strTalk = {
			"�i�.d��.�au qu�!! &@%!#%....!",
			"H�nh nh� kh�ng c� hi�u qu� g�, l� n�o l� th�n ch� sai? V� h�i C�n L�n m�n nh�n �i."
			}
		TalkEx("",strTalk);
	end
end

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIdx = 0;
		
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	nNpcIdx = CreateNpc("C� L�u v��ng", "C� L�u v��ng", 329,1620,3354);
	SetNpcScript(nNpcIdx, "\\script\\��ԭ����\\��ʦ�ؾ�\\npc\\������.lua");
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_02) == 8 then
			DelItem(2,0,758,1);--ն����
			AddItem(2,0,717,1,1);--�ǳ�����
			SetTask(TASK_XB_ID_02,9);
			SetTask(KULOUWANG_CURSE_ID,0);--�������������
			TaskTip("Gi�t C� L�u v��ng th�nh c�ng, mau n�i cho �� t� C�n L�n bi�t.");
			Msg2Player("Gi�t C� L�u v��ng th�nh c�ng, mau n�i cho �� t� C�n L�n bi�t.");
		end;
  else
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_02) == 8 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
      	DelItem(2,0,758,1);--ն����
				AddItem(2,0,717,1,1);--�ǳ�����
				SetTask(TASK_XB_ID_02,9);
				SetTask(KULOUWANG_CURSE_ID,0);--�������������
				TaskTip("Gi�t C� L�u v��ng th�nh c�ng, mau n�i cho �� t� C�n L�n bi�t.");
				Msg2Player("Gi�t C� L�u v��ng th�nh c�ng, mau n�i cho �� t� C�n L�n bi�t.");
      end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end

function Cancel_Curse()

end