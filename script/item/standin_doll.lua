Include("\\script\\global\\mate_head.lua");
Include("\\script\\lib\\time.lua");
ITEM_LIANLIGUO 	 = {2, 1, 534}	-- 连理果

-- 出魂果类型对应的经验分配比例
CHUNHUNGUO_TYPE_SCALE = {
	[1] = 2,	--50%经验获得
	[2] = 1,	--100%经验获得
}

-- 给替身娃娃加经验
function AddExp(exp)
	local doll_exp = GetTask(TASKVAR_DOLLEXP)
	SetTask(TASKVAR_DOLLEXP, doll_exp + exp)
end

-- 修改替身状态变量、生成经验物品并杀死替身娃娃
function FinishDoll()
	local type = floor(GetTask(TASKVAR_DOLLTIME) / DOLL_TIME_LIMIT)
	local nDollExp = GetTask(TASKVAR_DOLLEXP);
	SetTask(TASKVAR_DOLLTIME, 0)
	SetTask(TASKVAR_DOLLEXP, 0)
	SetTask(TASK_DOLL_ACTIVE,0);
	-- 修改替身状态变量
	ActivateDoll(0)
	
	-- 杀死替身娃娃
	KillFollower()
	if type > 2 or type <= 0 then
		WriteLog("[K誸 h玭 b竜 l鏸]:"..GetName().."Tr筺g th竔 b? l鏸. GetTask(2013):"..GetTask(TASKVAR_DOLLTIME));
		return 0;
	end;
	local doll_exp = floor( nDollExp/CHUNHUNGUO_TYPE_SCALE[type])
	-- 生成连理果
	if (doll_exp > 0) then
		local res, item = AddItem(ITEM_LIANLIGUO[1], ITEM_LIANLIGUO[2], ITEM_LIANLIGUO[3], 1)
		if (res ~= 0) then
			local mate_code = UnsignedHash(GetMateName())
			local self_code = UnsignedHash(GetName())
			--local mate_code = Hash(GetMateName())
			--local self_code = Hash(GetName())
			SetItemParam(item, 0, doll_exp)		-- 经验值
			SetItemParam(item, 1, mate_code)	-- 配偶名字编码
			SetItemParam(item, 2, self_code)	-- 自己名字编码
		end
	end
	WriteLog("[K誸 h玭]:"..GetName().."1 Li猲 L? qu? ch鴄:"..doll_exp);
end

-- 检查替身娃娃时间是否到或者配偶是否上线，如果是则修改替身状态变量、生成经验物品并杀死替身娃娃
function UpdateTime(interval)
	local doll_time = GetTask(TASKVAR_DOLLTIME)
	local type = floor(doll_time / DOLL_TIME_LIMIT)
	doll_time = mod(doll_time, DOLL_TIME_LIMIT)
	
	if (doll_time > interval) then
		doll_time = doll_time - interval
		SetTask(TASKVAR_DOLLTIME, doll_time + DOLL_TIME_LIMIT * type)
		if mod(doll_time,10*60) == 0 then	--10分钟报一下剩余时间
			Msg2Player("Hi謚 qu? b髉 b? th? th﹏ c遪"..tf_GetTimeString(doll_time));
		end;
	else
		FinishDoll()
	end
end
