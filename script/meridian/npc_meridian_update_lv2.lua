--升级武将境界NPC会话脚本
Include ("\\script\\meridian\\meridian_level_update_2.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--越南转生脚本
Include ("\\script\\system_switch_config.lua")
Include("\\script\\lib\\globalfunctions.lua");

SZ_THIS_SCRIPT="\\script\\meridian\\npc_meridian_update_lv2.lua"
N_THIS_CALL_BACK_CODE=1387 --随便的一个数值 用于校验的

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function OnNpcTalkToUpdateLevel2()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H? th鑞g kinh m筩h v蒼 ch璦 khai th玭g"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh筩 B蕋 Qu莕: Ngi ch琲  t C秐h Gi韎 V? Gi? v? chuy觧 t? c蕄 1 n c蕄 99, c? th? t譵 ta xung k輈h C秐h Gi韎 V? Tng. Xung k輈h C秐h Gi韎 V? Tng c莕 ti猽 hao <color=yellow>%s<color>. X竎 nh薾 c? mu鑞 xung k輈h kh玭g?"
		, GetNeedConsumeDesc())
	tinsert(tbSay, format("X竎 nh/_DoUpdateLevel2"))
	tinsert(tbSay, "Ta ch? gh? ch琲/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel2()
	if 1 == _CheckMeridianCanUpdateToLevel2() then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
    		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,912,0,1); --地面特效
			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1, getn(t_rand_npc_sfx))],2,1); --特效
    	end
	else
		--Talk(1,"",format("你现在不能冲击武将境界!"))
	end
end

--步进回调函数
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,912,0,1); --地面特效
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --特效
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
	else
		if wCurProcess ==  (wMaxProcess - 1) then
			if _CheckMeridianCanUpdateToLevel2() == 1 then
				if 1 == _DoMeridiaUpdateToLevel2() then
					gf_WriteLogEx("KICK HOAT KINH MACH", "th祅h c玭g", 1, "V? Gi?")					
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --地面特效
				end
			end
		end
	end
end


function _CheckMeridianCanUpdateToLevel2()
	if GetTranslifeCount() < 1 then
		Talk(1,"",format("Kh玭g ho祅 th祅h chuy觧 1 kh玭g th? xung k輈h C秐h Gi韎 V? Tng!"))
		return 0
	end
	return CheckCondition(2, 1)
end

function _DoMeridiaUpdateToLevel2()
	return MeridianUpdateLevel()
end

function no()
end
