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
local t=0;
local strSay = {
	"Khi ��nh b�i nguy�n h�nh c�a Hoan T��ng , theo l�i c�a Di�p T� Thu, l�c n�y ph�i d�ng th�n ch� phong �n n�. Xin ch�n c�u th�n ch� phong �n: ",
	HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
	HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
	HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
	}

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 64 then
			SelectSay(strSay);
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 64 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetPlayerScript("\\script\\������\\ɳĮ�Թ�\\npc\\����ԭ��.lua");
				SelectSay(strSay);
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end

--ȷ������
function Confirm_Curse(index)

local strTalk = {};

	--��ӡ�ɹ�
	if GetTask(HUANGXIANG_CURSE_ID) == index then
		SetTask(TASK_XB_ID_01,65);
		strTalk = {
			"Ng��i ch�i: Nguy�n h�nh Hoan T��ng �� b� phong �n th�nh c�ng, sau khi t�ng ph�p kh� cho B�ch Thi�n Th�nh li�n tr� th�p phong y�u cho Di�p T� Thu. "
			}
		Msg2Player("Sau khi t�ng ph�p kh� phong �n cho B�ch Thi�n Th�nh, th� mang tr� th�p phong �n cho Di�p T� Thu. ");
		TaskTip("Sau khi t�ng ph�p kh� phong �n cho B�ch Thi�n Th�nh, th� mang tr� th�p phong �n cho Di�p T� Thu. ");

	--��ӡʧ��
	else
		strTalk = {
			"Th�n ch� kh�ng hi�u l�c, nguy�n h�nh Hoan T��ng �� ch�y tho�t!"
			}
	end
	
	TalkEx("",strTalk);

end
