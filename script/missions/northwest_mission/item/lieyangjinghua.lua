-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ؿ���Ʊ �������� Script
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
".{Th�ng tin v�t ph�m}: T�ch D��ng c�n, {T�ch D��ng Tinh Hoa} l�y 3 lo�i T�ch D��ng c�n luy�n ch� th�nh. L� kh�c tinh c�a D��c Nh�n Th�o, c� th� kh�c ch� D��c Nh�n. V�t �� v�o {Luy�n ��n ��ng}.\n.{��a �i�m s� d�ng}: D��c th�t th� v�, D��c Nh�n r�t s� v�t n�y, t� ��i 3-5 ng��i l�u ph�i kh�c nhau, mang theo v�t n�y l� c� th� v�o trong.\n.{�i�u ki�n s� d�ng}: Th�nh vi�n trong ��i ph�i ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c\n.{H�n ch� s� d�ng}: Tu�n n�y b�n �� kh�m ph� T�y v�c{"..nFinishNum.."} l�n, c�n c� th� kh�m ph� {"..nPlayNum.."} l�n.",
	}
	
	TalkEx("",strTalk);
	
end