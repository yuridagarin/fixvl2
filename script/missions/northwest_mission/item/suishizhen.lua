-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ؿ���Ʊ ��ʯ�� Script
-- By StarryNight
-- 2007/12/19 PM 04:18

-- �Ҹ�����ʵ������Щ������䱻������Ƭ�Ρ�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")

function OnUse()

local nFinishNum = 0
	if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq() then
		nFinishNum = GetTask(Mission_login_times_TaskID)
	end
local nPlayNum = 10-nFinishNum;
local strTalk = {
".{Th�ng tin v�t ph�m}: {To�i th�ch ch�n} l� h�a kh� c�a nh�ng t�n c��p m�, c� th� ph� th�ch m�n ngh�n c�n. V�t�� v�o {Ho�ng L�ng m�t th�t}.\n.{��a �i�m s� d�ng}: Th� M� T��ng Qu�n, t� ��i 3-5 ng��i l�u ph�i kh�c nhau, d�ng To�i th�ch ch�n ph� h�y th�ch m�n.\n.{�i�u ki�n s� d�ng}: Th�nh vi�n trong ��i ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c\n.{H�n ch� s� d�ng}: Tu�n n�y b�n �� kh�m ph� T�y v�c{"..nFinishNum.."} l�n, c�n c� th� kh�m ph� {"..nPlayNum.."} l�n.",
	}
	
	TalkEx("",strTalk);
	
end