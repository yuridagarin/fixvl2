-- !!! 注意, 由于gettask和settask接口限制, 任务变量第32未不能使用

-- getSubBit 获取nValue中从l位开始到h位的数
-- l = 低位, 从1开始; h = 高位, 从1开始; 如果l > h, 会自动互换
-- bDecimal = 进制, nil表示2进制,其他表示输入的进制
function getSubBit(nValue, l, h, bDecimal)
	if nValue < 0 then
		nValue = 65536 * 65536 - (-nValue);
	end
	if l > h then l, h = h, l end
	local t = bDecimal or 2;
	return mod(floor(nValue/t^(l-1)), t^(h-l+1))
end
-- setSubBit 把nValue中从l位开始到h位的数改成nSubValue
-- l = 低位, 从1开始; h = 高位, 从1开始; 如果l > h, 会自动互换
-- bDecimal = 进制, nil表示2进制,其他表示输入的进制
function setSubBit(nValue, l, h, nSubValue, bDecimal)
	if nValue < 0 then
		nValue = 65536 * 65536 - (-nValue);
	end
	if l > h then l, h = h, l end
	local t = bDecimal or 2;
	assert(nSubValue < t^(h-l+1))
	local nOldValue = getSubBit(nValue,l,h,bDecimal);
	nValue = nValue + (nSubValue - nOldValue) * t^(l-1);
	return nValue;
end

TBitFlag = {
	taskId = {},	-- 使用哪些任务变量来记录flag
--	tFlags = {		-- flag组织格式
--		1,			-- 	单个的flag
--		{2, 3},		--	一组flag
--	}
}
-- 以下参数的flag是1个数字或数组, 用于记录标记
function TBitFlag:hasFlag(flag)		-- 获取是否有空余标记
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == 0 then
			return 1;
		end
	end
	return nil;
end
function TBitFlag:getFreeFlagCount(flag)
	local nFreeFlagCount = 0;
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == 0 then
			nFreeFlagCount = nFreeFlagCount + 1;
		end
	end
	return nFreeFlagCount;
end
function TBitFlag:addFlag(flag, bClear)		-- 设置标记, bClear == 0 时为清除1个标记
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	local nClear = 0;
	if bClear then
		nClear = 1;
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == nClear then
			self:setFlagBit(flag[i], bClear);
			return 1;
		end
	end
	gf_Warning(format("[TBitFlag:addFlag] [ERROR] [Role:%s Acc:%s] [kh玭g c? v? tr? ph鑙 h頿]", GetName(), GetAccount()));
end
function TBitFlag:clearFlag(flag)	-- 清除标记
	if not self or not flag then return end
	if type(flag) == "number" then
		flag = {flag};
	end
	for i = 1, getn(flag) do
		if self:getFlagBit(flag[i]) == 0 then
			self:setFlagBit(flag[i], 0);
		end
	end
end
function TBitFlag:getFlagBit(nBit)
	nBit = nBit - 1;
	local nRealTask = floor(nBit / 31);
	local nTaskId = self.taskId[nRealTask + 1];
	if not nTaskId then
		gf_Error("!!!!!!!!! L鏸 bi課 lng nhi謒 v? !!!!!!!!!!!!");
		return
	elseif nTaskId == 0 then
		gf_Error("!!!!!!!!! Th? s? d鬾g TASKiD=0 !!!!!!!!!!!!");
		return
	end
	local nRealBit = mod(nBit, 31) + 1;
	local nValue = GetTask(nTaskId)
	return GetBit(nValue, nRealBit);
end
function TBitFlag:setFlagBit(nBit, nVal)
	nBit = nBit - 1;
	local nRealTask = floor(nBit / 31);
	local nTaskId = self.taskId[nRealTask + 1];
	if not nTaskId then
		gf_Error("!!!!!!!!! L鏸 bi課 lng nhi謒 v? !!!!!!!!!!!!");
		return
	elseif nTaskId == 0 then
		gf_Error("!!!!!!!!! Th? s? d鬾g TASKiD=0 !!!!!!!!!!!!");
		return
	end
	local nRealBit = mod(nBit, 31) + 1;
	local nValue = GetTask(nTaskId)
	if nVal == 0 then
		nValue = SetBit(nValue, nRealBit, 0);
	else
		nValue = SetBit(nValue, nRealBit, 1);
	end
	SetTask(nTaskId, nValue);
end
gf_Warning = gf_Warning or print
