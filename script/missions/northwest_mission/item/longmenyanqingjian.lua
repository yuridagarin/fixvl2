-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ؿ���Ʊ ��������� Script
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
"{.Th�ng tin v�t ph�m}: L� Nguy�n Kh�nh ��ch th�n ��n Long M�n Tr�n, ��i ti�c chi�u ��i nh�ng ai c� hi�m kh�ch v�i Nh�t Ph�m ���ng. N�u b� Thi�t chu l�nh truy s�t, �em {Thi�p m�i Long M�n} c� th� tham gia khi�u chi�n L� Nguy�n Kh�nh t�i {y�n ti�c Long M�n}.\n{.��a �i�m s� d�ng}: Ti�u Nh�, {M�i th� 6, th� 7 t� 16:00 - 16:10} ��n {qu�n tr� Long M�n Tr�n} ��a thi�p ra l� c� th� tham d�.\n{.�i�u ki�n s� d�ng}: Ho�n th�nh nhi�m v� T�y b�c-Ho�ng Sa L�c M�c.\n",
	}
	
	TalkEx("",strTalk);
	
end