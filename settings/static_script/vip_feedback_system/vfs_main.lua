--消费积分反馈系统
Include("\\settings\\static_script\\vip_feedback_system\\vfs_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\global\\ib_callback.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\invite_code\\ic_head.lua")

--御街消耗回调-----
--nCost消耗的Xu单价
--nExpValue经验值倍率
--nJinJuan金券数倍率
function vfs_main_callback(nCost, nExpValue, nJinJuan)
	if not nCost or not nExpValue or not nJinJuan then
		print("UDERROR:vfs_main_callback error");
		return 0;
	end
	--做以前的事------------------------------------------
	ib_status_relay_ret(tonumber(nCost));
	--消费反馈--------------------------------------------
	if tonumber(nCost) <= 0 then
		--等于零表示不反馈
		return 0;
	end
	_vfs_AddVipXuValue(tonumber(nCost));
	if tonumber(nExpValue) > 0 then
		_vfs_AddVipExpValue(tonumber(nCost) * tonumber(nExpValue) * VFS_XU_TO_EXP);
	end
	if tonumber(nJinJuan) > 0 then
		_vfs_AddVipJinJuan(tonumber(nCost) * tonumber(nJinJuan) * VFS_XU_TO_JJ);
	end
	--邀请码活动
	_ic_IbCcost(tonumber(nCost));
end

function vfs_open_JJ_shop()
	local tSay = {
		"Ti謒 ViP c蕄 1/#vfs_open_shop(3030)",
		"Ti謒 ViP c蕄 2/#vfs_open_shop(3031)",
		"Ti謒 ViP c蕄 3/#vfs_open_shop(3032)",
		"Ra kh醝/do_nothing"
	}
	Say("Чi hi謕 ngi c蕁 g? kh玭g?", getn(tSay), tSay);
end

function vfs_open_shop(nIndex)
	show_equip_shop(tonumber(nIndex));
end

function vfs_open_YJ_shop()
	show_equip_shop(3033);
end

--------------------------------------------------------------------------------
--增加当前VIP等级经验值
function _vfs_AddVipExpValue(nValue)
	if not nValue or tonumber(nValue) < 0 then
		return 0;
	end
	local nCurrentLevel = GetVipLevel();
	if nCurrentLevel < 0 or nCurrentLevel >= getn(VFS_VIP_LEVEL_TABLE) then
		return 0;
	end
	--最大值检测
	if nValue > VFS_VIP_EXP_MAX then
		gf_WriteLogEx("[vip_feedback_system]", "_vfs_AddVipExpValue", tostring(nValue));
		print("UDERROR: [vip_feedback_system] _vfs_AddVipExpValue this value is too large, pls check!");
		nValue = VFS_VIP_EXP_MAX;
	end
	local nValueAfter = GetVipExp() + tonumber(nValue);
	if nValueAfter >= 2^31 - 1 then
		return 0;
	end
	local msg = format("Ngi nh薾 頲 %d 甶觤 ViP kinh nghi謒 Ng? C竎!", tonumber(nValue));
	Msg2Player(msg);
	--Say(msg,0);
	
	--决定是否要升级VIP等级
	local bIsUpdate = 0;
	while VFS_VIP_LEVEL_TABLE[GetVipLevel() + 1] and nValueAfter >= VFS_VIP_LEVEL_TABLE[GetVipLevel() + 1] do
		if 1 == _vfs_AddVipLevel() then
			nValueAfter = nValueAfter - VFS_VIP_LEVEL_TABLE[GetVipLevel()];
			SetVipExp(VFS_VIP_LEVEL_TABLE[GetVipLevel()]);
		else
			break;
		end
		bIsUpdate = 1;
	end
	if GetVipLevel() < getn(VFS_VIP_LEVEL_TABLE) then
		SetVipExp(nValueAfter);
	end
	if 1 == bIsUpdate then
		local msg = format("Ch骳 m鮪g ngi n﹏g c蕄 l? Ng? C竎 ViP%d!", GetVipLevel());
		Msg2Player(msg);
		Say(msg,0);
	end
	return 1;
end

--增加当前消耗XU总值
function _vfs_AddVipXuValue(nValue)
	if not nValue or tonumber(nValue) < 0 then
		return 0;
	end
	local nValueAfter = GetVipCost() + tonumber(nValue);
	if nValueAfter >= 2^31 - 1 then
		return 0;
	end
	
	SetTask(VFS_TASK_VIP_COST, nValueAfter, TASK_ACCESS_CODE_VIP_FEEDBACK_SYS);
	return 1;
end

--增加Vip等级+1
function _vfs_AddVipLevel()
	local nVipLevel = GetVipLevel();
	if nVipLevel >= getn(VFS_VIP_LEVEL_TABLE) then
		return 0;
	end
	SetTask(VFS_TASK_VIP_LEVEL, nVipLevel + 1, TASK_ACCESS_CODE_VIP_FEEDBACK_SYS);
	return 1;
end

function _vfs_AddVipJinJuan(nValue)
	if not nValue or tonumber(nValue) < 0 then
		return 0;
	end
	local nValueAfter = GetVipJinJuan() + tonumber(nValue);
	if nValueAfter >= 2^31 - 1 then
		return 0;
	end
	--最大值检测
	if nValue > VFS_VIP_JJ_MAX then
		gf_WriteLogEx("[vip_feedback_system]", "_vfs_AddVipJinJuan", tostring(nValue));
		print("UDERROR: [vip_feedback_system] _vfs_AddVipJinJuan this value is too large, pls check!");
		nValue = VFS_VIP_JJ_MAX;
	end
	if -1 == ModifyJinJuan(nValue,1) then
		return 0;
	end
	--local msg = format("您获得%d点金券！", tonumber(nValue));
	--Say(msg,0);
	return 1;
end