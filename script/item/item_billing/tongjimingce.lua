
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ͨ������ű�
-- ���ã���ȡһ��ͨ������
-- Edited by StarryNight
-- 2007/01/17 10:25

-- �����㣬Ӯ�����������
-- ������������
-- ������Զ�����ᶮ

-- ======================================================

Include("\\script\\task\\killer\\killer_head.lua");

USE_TIME = 1116;--һ����ʹ��ͨ�������ۼ�����
LAST_TIME = 1117;--��һ��ʹ��ͨ�����������

function OnUse()
	
	Say("B�n mu�n d�ng danh s�ch truy n�? N� c� th� gi�p b�n nh�n nhi�m v� truy n�, t�i �a 20 l�n.",
	2,
	"��ng �/confirm_use",
	"T�m th�i ch�a s� d�ng!/cancel_use"
	)

end

--ȷ��ʹ��ͨ������
function confirm_use()

local nLastTime = GetTask(LAST_TIME);
local nNowTime = GetYMDTime();
local nUseTime = GetTask(USE_TIME);

	--����ȼ�С��20����ʹ��
	if GetLevel() < 20 then
		Say("��ng c�p hi�n th�i c�a b�n kh�ng th� nh�n nhi�m v� truy n�, ��t c�p <color=yellow>20<color> h�y quay l�i!",0)
		return
	end
	
	--֮ǰ�Ѿ���ȡʦ���������޷�ʹ��
	if GetTask(TASK_KILLER_STATE_ID) ~= 0 then
		Say("B�n ch�a ho�n th�nh nhi�m v� tr��c, c� g�ng l�n!",0)
		return
	end
	
	if nLastTime == nNowTime then
		if GetTask(USE_TIME) >= 20 then
		 Say("H�m nay b�n �� s� d�ng �� danh s�ch truy n�, ng�y mai h�y quay l�i!",0)
		 return
		end
	end
	
	--����һ��ͨ������
	if DelItem(2,1,1022,1) == 1 then
	
		local nKillerName = "";
		local nKillerMode = "";
		local nMapName = "";
		local nMapID = 0;
		local nWx,nWy,nMx,nMy = 0,0,0,0;
		local nTriggerID = 0;
		local nCustomID = 0;
			
		--����һ��ɱ������
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--����һ��ͨ�������ñ���Ϊ 1
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--��¼��ҽӻ�����ʱ�ĵȼ�
		
		Say("Theo tin th�m b�o, s�t th� <color=yellow>"..nKillerName.."<color> g�n ��y hay xu�t hi�n t�i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H�y mau �i di�t tr�! (H�m nay b�n �� d�ng <color=yellow>"..(nUseTime+1).."<color> c�i danh s�ch truy n�, c�n <color=yellow>"..20-(nUseTime+1).."<color> l�n c� h�i).",0);
		
		--����ʱ�䴥����������ֵΪ900
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--���浱ǰʱ��
		nTime = GetTime();--��ȡ1970�����񾭹�������
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--���ɵ�ͼ������
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--�����ͼ������ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);
	
		TaskTip("N�i 15 ph�t ph�i ho�n th�nh, xem th�m trong L�nh truy n�!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end
		
		--��¼ʹ��ʱ��͵���ʹ�ô���
		if nLastTime ~= nNowTime then
			SetTask(USE_TIME,1);
		else
		 SetTask(USE_TIME,nUseTime+1);
		end
		
		SetTask(LAST_TIME,nNowTime);
		
	else
		Say("B�n kh�ng mang danh s�ch truy n�, kh�ng th� s� d�ng.",0)
	end
	
end

--ȡ��ʹ��ͨ������
function cancel_use()

end

--��ȡ��ǰ�������ַ���
function GetYMDTime()

local nYMD_str = date("%y")..date("%m")..date("%d")

	return nYMD_str

end