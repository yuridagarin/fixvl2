-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ؿ���Ʊ ������� Script
-- By StarryNight
-- 2007/12/19 PM 04:18

-- �Ҹ�����ʵ������Щ������䱻������Ƭ�Ρ�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0;
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
".{Th�ng tin v�t ph�m}: Ng� H�nh S� v�n l� v�t ph�m th�n b� c�a Nh�t Ph�m ���ng, truy s�t ph�n �� th��ng �� l�i {Ng� H�nh K� Phi�n}, d�ng �� khi�u chi�n v�i Ng� H�nh S�. V�t �� v�o {Ng� H�nh Tr�n}.\n.{��a �i�m s� d�ng}: Ng� H�nh Tr�n S�, t� ��i 3-5 ng��i l�u ph�i kh�c nhau, ��a Ng� H�nh K� Phi�n ra khi�u chi�n v�i Ng� H�nh Tr�n.\n.{�i�u ki�n s� d�ng}: Th�nh vi�n trong ��i ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c\n.{H�n ch� s� d�ng}: Tu�n n�y b�n �� kh�m ph� T�y v�c{"..nFinishNum.."} l�n, c�n c� th� kh�m ph� {"..nPlayNum.."} l�n.",
	}
	
	TalkEx("",strTalk);
	
end