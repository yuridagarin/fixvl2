-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʼ����NPC����Script
-- By StarryNight
-- 2007/06/26 PM 4:12

-- ���������أ����������������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {};

	--SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 13 then
			--��һ��ɱ������
			if GetTask(CANTUI_DEAD_STATE) == 0 then
				AddItem(2,0,751,1,1);--�򵹲��ȵõ�һƷ�����֮����
				SetTask(CANTUI_DEAD_STATE,1);
				--��ûɱ���ϱ�
				if GetTask(DUANBI_DEAD_STATE) == 0 then
					strTalk = {};
					--TalkEx("",strTalk);
					TaskTip("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
					Msg2Player("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
				--�Ѿ�ɱ���ϱ�
				elseif GetTask(DUANBI_DEAD_STATE) == 1 then
					strTalk = {};
					--TalkEx("",strTalk);
					SetTask(TASK_XB_ID_01,14);--��ȥ�ҳ��ְ���
					TaskTip("�� gi�i quy�t xong nh�ng t�n c�n l�i n�n quay v� t�m Xa Lu�n B� V��ng.");
					Msg2Player("�� gi�i quy�t xong nh�ng t�n c�n l�i n�n quay v� t�m Xa Lu�n B� V��ng.");
				end
			--֮ǰ�Ѿ�ɱ������
			elseif GetTask(DUANBI_DEAD_STATE) == 0 then
				strTalk = {};
				--TalkEx("",strTalk);
				TaskTip("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
				Msg2Player("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
			elseif GetTask(DUANBI_DEAD_STATE) == 1 then
				strTalk = {};
				--TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,14);--��ȥ�ҳ��ְ���
				TaskTip("�� gi�i quy�t xong nh�ng t�n c�n l�i n�n quay v� t�m Xa Lu�n B� V��ng.");
				Msg2Player("�� gi�i quy�t xong nh�ng t�n c�n l�i n�n quay v� t�m Xa Lu�n B� V��ng.");
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 13 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
			--��һ��ɱ���ϱ�
			if GetTask(CANTUI_DEAD_STATE) == 0 then
				AddItem(2,0,751,1,1);--�򵹲��ȵõ�һƷ�����֮����
				SetTask(CANTUI_DEAD_STATE,1);
				--��ûɱ���ϱ�
				if GetTask(DUANBI_DEAD_STATE) == 0 then
					strTalk = {};
					--TalkEx("",strTalk);
					TaskTip("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
					Msg2Player("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
				--�Ѿ�ɱ���ϱ�
				elseif GetTask(DUANBI_DEAD_STATE) == 1 then
					strTalk = {};
					--TalkEx("",strTalk);
					SetTask(TASK_XB_ID_01,14);--��ȥ�ҳ��ְ���
					TaskTip("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
					Msg2Player("�i ti�u di�t n�t nh�ng t�n c�n l�i.");
				end
			--֮ǰ�Ѿ�ɱ������
			elseif GetTask(DUANBI_DEAD_STATE) == 0 then
				strTalk = {};
				--TalkEx("",strTalk);
				TaskTip("�i gi�t nh�ng t�n c�n l�i.");
				Msg2Player("�i gi�t nh�ng t�n c�n l�i.");
			elseif GetTask(DUANBI_DEAD_STATE) == 1 then
				strTalk = {};
				--TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,14);--��ȥ�ҳ��ְ���
				TaskTip("�� gi�i quy�t xong nh�ng t�n c�n l�i n�n quay v� t�m Xa Lu�n B� V��ng.");
				Msg2Player("�� gi�i quy�t xong nh�ng t�n c�n l�i n�n quay v� t�m Xa Lu�n B� V��ng.");
			end
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
