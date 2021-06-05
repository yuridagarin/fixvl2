--�����佫����NPC�Ự�ű�
Include ("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\vet_jihuo_wuzun.lua")

SZ_THIS_SCRIPT="\\settings\\static_script\\meridian\\npc_meridian_level_update.lua"
N_THIS_CALL_BACK_CODE=100 --����һ����ֵ ����У��ģ�*10+levelҪ>=100��ʾ����Ҫ�������������

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function onNpcTalkToUpdateMeridianLevel()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh�c B�t Qu�n: L�o phu c� th� gi�p thi�u hi�p k�ch ho�t khai th�ng kinh m�ch, nh�ng �� k�ch ho�t c�nh gi�i kh�c nhau c� y�u c�u ti�u hao kh�c nhau, thi�u h�p c�n khai th�ng c�nh gi�i n�o?")
	
	local nCurOpenCount = 4
	for i = 1, nCurOpenCount do
		if i ~= 4 then
			local szTalk = format("K�ch ho�t %s c�nh gi�i %s", meridianlevel_getname(i), format("/#_onTalkToUpdateLevel(%d)", i))
			tinsert(tbSay, szTalk)
		else
			tinsert(tbSay, "K�ch ho�t V� T�n c�nh gi�i/vjw_MerdianIBActivate");
		end
	end

	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _onTalkToUpdateLevel(nNewLevel)
	if not nNewLevel or nNewLevel < 1 or nNewLevel > 6 then
		return
	end
	local tbSay = {}
	local szTitle = format("Nh�c B�t Qu�n: ��t ��n %s ��ng th�i �� ��t c�nh gi�i %s, c� th� t�m ta khai th�ng c�nh gi�i %s. C�n ti�u hao <color=yellow>%s<color>. X�c ��nh th�c hi�n?"
		, meridianlevel_get_require_desc(nNewLevel)
		, meridianlevel_getname(nNewLevel - 1)
		, meridianlevel_getname(nNewLevel)
		, meridianlevel_get_ib_consume_desc(nNewLevel)
		)
	tinsert(tbSay, format("X�c ��nh/#_DoUpdateLevel(%d)", nNewLevel))
	tinsert(tbSay, format("tr� l�i/onNpcTalkToUpdateMeridianLevel"))
	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel(nNewLevel)
	if 1 == _CheckMeridianCanUpdateToLevel(nNewLevel) then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE*10+nNewLevel, SZ_THIS_SCRIPT, 1) then
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
	if floor(wCheckCode/10) ~= N_THIS_CALL_BACK_CODE then
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
			local nNewLevel = mod(wCheckCode,10)--�ص�ȷ�����λ��ʾ����ȼ�
			if _CheckMeridianCanUpdateToLevel(nNewLevel) == 1 then
				if 1 == _DoMeridiaUpdateToLevel(nNewLevel) then
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --������Ч
				end
			end
		end
	end
end


function _CheckMeridianCanUpdateToLevel(nNewLevel)
	return meridianlevel_check_all_ib(nNewLevel, 1)
end

function _DoMeridiaUpdateToLevel(nNewLevel)
	local bUpdateSuccess = MeridianUpdateLevel()
	if 0 ~= bUpdateSuccess then
		return meridianlevel_check_consume(nNewLevel, 1, 0)
	end
	return 0
end

function no()
end
