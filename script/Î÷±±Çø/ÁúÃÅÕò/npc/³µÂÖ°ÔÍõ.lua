-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������NPC���ְ���Script
-- By StarryNight
-- 2007/06/13 AM 10:38

-- ���ߵ����磬���ǻ����ҵ�ʲô��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ��������05�²ְ���----------------------------------
	
	--�복�ֶԻ���ȡ05�²ְ�������
	if nStep_XBTask == 16 then
		task_005_01_0();
		return
	end
	
	--δ��ŷ�����Ի�ѯ�ʼ���λ��(���һƷ���±��ƺ�)
	if nStep_XBTask == 17 then
		task_005_01_1();
		return
	end
	
	--��δ�ȳ�����ɱ��ǰ�Ի�
	if nStep_XBTask >= 18 and nStep_XBTask <= 23 then
		task_005_01_2();
		return
	end
	
	--�ȳ�ɱ�����޽�������ɵ�һ������
	if nStep_XBTask == 24 then		
		if is_show_title_level() == 1 then --����һƷ���±��ƺ� 
			task_005_09_0();
		else
			xb_title_tip(1,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	---------------------------------- ��������06������----------------------------------
	
	--��ȡ�ڶ�������
	if nStep_XBTask == 25 then
		if is_show_title_level() == 1 then --����һƷ���±��ƺ� 
			task_006_01_0();
		else
			xb_title_tip(1,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��û��ɵڶ�������
	if nStep_XBTask >= 26 and nStep_XBTask <= 29 then
		task_006_01_1();
		return
	end
	
	--��ɵڶ�������
	if nStep_XBTask == 30 then
		if is_show_title_level() == 1 then --����һƷ���±��ƺ� 
			task_006_06_0();
		else
			xb_title_tip(1,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	---------------------------------- ������07�ж��----------------------------------
	
	--��ȡ����������
	if nStep_XBTask == 31 then
		if is_show_title_level() == 1 then --����һƷ���±��ƺ� 
			task_007_01_0();
		else
			xb_title_tip(1,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--δ��ɵ���������
	if nStep_XBTask == 32 then
		task_007_01_1();
		return
	end
	
	--����ɵ���������(���һƷ��-�̿ͳƺ�)
	if nStep_XBTask == 33 then
		if is_show_title_level() == 1 then --����һƷ���±��ƺ� 
			task_007_02_0();
		else
			xb_title_tip(1,"Xa Lu�n B� V��ng");
		end		
		return
	end
	
	--��δ����Ԭ����
	if nStep_XBTask >= 34 and nStep_XBTask <= 35 then
		task_007_02_1();
		return
	end
	
	---------------------------------- ������08������----------------------------------
	
	--��ȡǰ��ѯ���ذκ������
	if nStep_XBTask == 36 then
		if is_show_title_level() == 1 then --����һƷ�ô̿ͳƺ� 
			task_008_01_0();
		else
			xb_title_tip(2,"Xa Lu�n B� V��ng");
		end		
		return
	end
	
	--��δǰ�����ذκ�Ի�
	if nStep_XBTask >= 37 and nStep_XBTask <= 38 then
		task_008_01_1();
		return
	end
	
	---------------------------------- ������11��֧1_3����֮Ĺ----------------------------------
	
	--��������������복�ְ����Ի������һƷ�÷ɻ��ƺţ�
	if nStep_XBTask_01 == 8 then
		if is_show_title_level() == 1 then --����һƷ�ô̿ͳƺ� 
			task_011_02_0();
		else
			xb_title_tip(2,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��û��ŷ�����Ի���ûȡ�ý�˿����֮ǰ
	if nStep_XBTask_01 >= 9 and nStep_XBTask_01 <=  11 then
		task_011_02_1();
		return
	end
	
	--------------------------------- ������12��֧1_4�ϱ۲���----------------------------------	
	
	--ȡ�û�ûȡ�ý�˿����
	if nStep_XBTask_01 == 12 then
		if is_show_title_level() == 1 then --����һƷ�÷ɻ��ƺ� 
			task_012_01_0();
		else
			xb_title_tip(3,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��ûɱ���ϱ۲���
	if nStep_XBTask_01 == 13 then
		task_012_02_1();
		return
	end
	
	--�Ѿ�ɱ���ϱ۲���
	if nStep_XBTask_01 == 14 then
		if is_show_title_level() == 1 then --����һƷ�÷ɻ��ƺ� 
			task_012_03_0();
		else
			xb_title_tip(3,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��ûǰ�����ذκ�Ի�
	if nStep_XBTask_01 == 15 then
		task_012_03_1();
		return
	end
	
	---------------------------------- ������16��֧1_7ҩ�˾���----------------------------------
	--�복�ֻ㱨������Ĺ�����
	if nStep_XBTask_01 == 30 then
		if is_show_title_level() == 1 then --����һƷ�û���ƺ� 
			task_016_02_0();
		else
			xb_title_tip(4,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��δ��ŷ�����㱨ҩ��һ��
	if nStep_XBTask_01 == 31 then
		task_016_02_1();
		return
	end
	
	---------------------------------- ������20��֧1_11������թ----------------------------------
	--��α��ҩ���������ְ��������һƷ�������ƺţ�
	if nStep_XBTask_01 == 51 then
		if is_show_title_level() == 1 then --����һƷ�û���ƺ� 
			task_020_02_0();
		else
			xb_title_tip(4,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��δ�벶��Ի�
	if nStep_XBTask_01 == 52 then
		task_020_02_1();
		return
	end
	
	---------------------------------- ������21��֧1_12��������----------------------------------
	--ɱ������ɱ�ֺ�ؼ����ְ���
	if nStep_XBTask_01 == 56 then
		if is_show_title_level() == 1 then --����һƷ�������ƺ� 
			task_021_01_0();
		else
			xb_title_tip(5,"Xa Lu�n B� V��ng");
		end
		return
	end

	----δ���ذκ�Ի�
	if nStep_XBTask_01 == 57 then
		task_021_01_1();
		return
	end
	
	---------------------------------- ������22��֧1_13��Į����----------------------------------	
	
	--�복�ְ���ս��
	if nStep_XBTask_01 == 60 then
		if is_show_title_level() == 1 then --����һƷ�������ƺ� 
			task_022_01_0();
		else
			xb_title_tip(5,"Xa Lu�n B� V��ng");
		end
		return
	end
	
	--��ܳ��ְ�����Ի�
	if nStep_XBTask_01 >= 61 then
		task_022_01_2();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"Ng��i c�ng bi�t Nh�t Ph�m ���ng? Xem ra danh ti�ng Nh�t Ph�m ���ng � Ph�ng T��ng kh� vang d�i."},
		{"V�y ng��i nghe qua Th�p ��i Kim Cang c�a Nh�t Ph�m ���ng ch�a? Ta ch�nh l� th� l�nh c�a Th�p ��i Kim Cang."},
		{"N�u ng��i c� h�ng th� v�i tin c�a Nh�t Ph�m ���ng th� c� th� th��ng l��ng."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--���ְ��������ű�
function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {
	"X�a nay ta ��u r�t c�nh gi�c kh�ng ng� m�t ph�t l� l� �� b� t�n ti�u b�i th�a n��c ��c th� c�u, l�m h�ng chuy�n t�t c�a ta v� t�n th�t th�c l�c c�a Nh�t Ph�m ���ng. N�i th�t v�i ng��i, ng�y t�n c�a ��i T�ng s�p ��n r�i, s�m mu�n th� trung nguy�n c�ng s� thu�c v� T�y H�. C�c ng��i ch�y kh�ng tho�t �o gi�c sa m�c ��u. Ha ha...",
	"Sao? Th� n�o l� �o gi�c sa m�c?",
	"Ha ha�",
	"(Kh�ng l� th�n tr� h�n kh�ng b�nh th��ng? E r�ng h�n bi�t ���c Nh�t Ph�m ���ng s� kh�ng tha cho h�n n�n �i�n lo�n r�i. Nghe gi�ng h�n kh�ng gi�ng n�i kho�c, Th�c B�t ti�n b�i t�ng n�i T�y H� Ph�p V��ng ti�n v� Sa m�c nh�t ��nh c� �m m�u. Kh�ng xong r�i ph�i b�o cho �u d��ng ti�n b�i.)",
	}

	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	nNpcIndex = CreateNpc("Xa Lu�n B� V��ng","Xa Lu�n B� V��ng",507,1791,3173);
	SetNpcScript(nNpcIndex,"\\script\\������\\������\\npc\\���ְ���.lua");
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 60 then
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,61);
			TaskTip("V� b�o v�i �u D��ng H�a chuy�n �o gi�c sa m�c.");
			Msg2Player("V� b�o v�i �u D��ng H�a chuy�n �o gi�c sa m�c.");
			--���֮ǰ��õ�һƷ�óƺ�
			for t=1,5 do
				RemoveTitle(60,t);
			end
			add_xb_title(6);--һƷ�ü�ϸ�ƺ�
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 60 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,61);
				TaskTip("V� b�o v�i �u D��ng H�a chuy�n �o gi�c sa m�c.");
				Msg2Player("V� b�o v�i �u D��ng H�a chuy�n �o gi�c sa m�c.");
				--���֮ǰ��õ�һƷ�óƺ�
				for t=1,5 do
				RemoveTitle(60,t);
				end
				add_xb_title(6);--һƷ�ü�ϸ�ƺ�
				end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end
