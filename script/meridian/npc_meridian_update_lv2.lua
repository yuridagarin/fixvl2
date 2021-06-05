--�����佫����NPC�Ự�ű�
Include ("\\script\\meridian\\meridian_level_update_2.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--Խ��ת���ű�
Include ("\\script\\system_switch_config.lua")
Include("\\script\\lib\\globalfunctions.lua");

SZ_THIS_SCRIPT="\\script\\meridian\\npc_meridian_update_lv2.lua"
N_THIS_CALL_BACK_CODE=1387 --����һ����ֵ ����У���

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function OnNpcTalkToUpdateLevel2()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh�c B�t Qu�n: Ng��i ch�i �� ��t C�nh Gi�i V� Gi� v� chuy�n t� c�p 1 ��n c�p 99, c� th� t�m ta xung k�ch C�nh Gi�i V� T��ng. Xung k�ch C�nh Gi�i V� T��ng c�n ti�u hao <color=yellow>%s<color>. X�c nh�n c� mu�n xung k�ch kh�ng?"
		, GetNeedConsumeDesc())
	tinsert(tbSay, format("X�c ��nh/_DoUpdateLevel2"))
	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel2()
	if 1 == _CheckMeridianCanUpdateToLevel2() then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
    		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,912,0,1); --������Ч
			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1, getn(t_rand_npc_sfx))],2,1); --��Ч
    	end
	else
		--Talk(1,"",format("�����ڲ��ܳ���佫����!"))
	end
end

--�����ص�����
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,912,0,1); --������Ч
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --��Ч
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
	else
		if wCurProcess ==  (wMaxProcess - 1) then
			if _CheckMeridianCanUpdateToLevel2() == 1 then
				if 1 == _DoMeridiaUpdateToLevel2() then
					gf_WriteLogEx("KICK HOAT KINH MACH", "th�nh c�ng", 1, "V� Gi�")					
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --������Ч
				end
			end
		end
	end
end


function _CheckMeridianCanUpdateToLevel2()
	if GetTranslifeCount() < 1 then
		Talk(1,"",format("Kh�ng ho�n th�nh chuy�n 1 kh�ng th� xung k�ch C�nh Gi�i V� T��ng!"))
		return 0
	end
	return CheckCondition(2, 1)
end

function _DoMeridiaUpdateToLevel2()
	return MeridianUpdateLevel()
end

function no()
end
