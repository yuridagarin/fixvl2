--升级武将境界NPC会话脚本
Include ("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\settings\\static_script\\meridian\\vet_jihuo_wuzun.lua")

SZ_THIS_SCRIPT="\\settings\\static_script\\meridian\\npc_meridian_level_update.lua"
N_THIS_CALL_BACK_CODE=100 --随便的一个数值 用于校验的（*10+level要>=100表示不需要检查真气容量）

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function onNpcTalkToUpdateMeridianLevel()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H? th鑞g kinh m筩h v蒼 ch璦 khai th玭g"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh筩 B蕋 Qu莕: L穙 phu c? th? gi髉 thi誹 hi謕 k輈h ho箃 khai th玭g kinh m筩h, nh璶g  k輈h ho箃 c秐h gi韎 kh竎 nhau c? y猽 c莡 ti猽 hao kh竎 nhau, thi誹 h頿 c莕 khai th玭g c秐h gi韎 n祇?")
	
	local nCurOpenCount = 4
	for i = 1, nCurOpenCount do
		if i ~= 4 then
			local szTalk = format("K輈h ho箃 %s c秐h gi韎 %s", meridianlevel_getname(i), format("/#_onTalkToUpdateLevel(%d)", i))
			tinsert(tbSay, szTalk)
		else
			tinsert(tbSay, "K輈h ho箃 V? T玭 c秐h gi韎/vjw_MerdianIBActivate");
		end
	end

	tinsert(tbSay, "Ta ch? gh? ch琲/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _onTalkToUpdateLevel(nNewLevel)
	if not nNewLevel or nNewLevel < 1 or nNewLevel > 6 then
		return
	end
	local tbSay = {}
	local szTitle = format("Nh筩 B蕋 Qu莕: t n %s ng th阨  t c秐h gi韎 %s, c? th? t譵 ta khai th玭g c秐h gi韎 %s. C莕 ti猽 hao <color=yellow>%s<color>. X竎 nh th鵦 hi謓?"
		, meridianlevel_get_require_desc(nNewLevel)
		, meridianlevel_getname(nNewLevel - 1)
		, meridianlevel_getname(nNewLevel)
		, meridianlevel_get_ib_consume_desc(nNewLevel)
		)
	tinsert(tbSay, format("X竎 nh/#_DoUpdateLevel(%d)", nNewLevel))
	tinsert(tbSay, format("tr? l筰/onNpcTalkToUpdateMeridianLevel"))
	tinsert(tbSay, "Ta ch? gh? ch琲/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel(nNewLevel)
	if 1 == _CheckMeridianCanUpdateToLevel(nNewLevel) then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE*10+nNewLevel, SZ_THIS_SCRIPT, 1) then
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
	if floor(wCheckCode/10) ~= N_THIS_CALL_BACK_CODE then
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
			local nNewLevel = mod(wCheckCode,10)--回调确认码个位表示冲击等级
			if _CheckMeridianCanUpdateToLevel(nNewLevel) == 1 then
				if 1 == _DoMeridiaUpdateToLevel(nNewLevel) then
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --地面特效
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
