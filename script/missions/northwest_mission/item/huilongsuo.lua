-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ؿ���Ʊ ������ Script
-- By StarryNight
-- 2::7/12/19 PM :4:18

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
".{Th�ng tin v�t ph�m}: {H�i Long S�ch} v�n l� c�ng c� c�a k� c��p m�, d�ng �� m� c� quan b�n trong. L� v�t �� v�o {Ho�ng L�ng m�t ��o}.\n.{��a �i�m s� d�ng}: N�i Th� m� nh�n �ang canh gi� l�ng m�, t� ��i 3-5 l�u ph�i kh�c nhau, d�ng H�i Long S�ch m� m�t ��o.\n.{�i�u ki�n s� d�ng}: Th�nh vi�n trong ��i ��u ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c.\n.{H�n ch� s� d�ng}: Tu�n n�y b�n �� th� qua kh�m ph� T�y v�c{"..nFinishNum.."} l�n, c�n c� th� kh�m ph� {"..nPlayNum.."} l�n.",
	}
	
	TalkEx("",strTalk);
	
end