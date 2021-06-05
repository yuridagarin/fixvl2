-- !!! ע��, ����gettask��settask�ӿ�����, ���������32δ����ʹ��

-- getSubBit ��ȡnValue�д�lλ��ʼ��hλ����
-- l = ��λ, ��1��ʼ; h = ��λ, ��1��ʼ; ���l > h, ���Զ�����
-- bDecimal = ����, nil��ʾ2����,������ʾ����Ľ���
function getSubBit(nValue, l, h, bDecimal)
	if nValue < 0 then
		nValue = 65536 * 65536 - (-nValue);
	end
	if l > h then l, h = h, l end
	local t = bDecimal or 2;
	return mod(floor(nValue/t^(l-1)), t^(h-l+1))
end
-- setSubBit ��nValue�д�lλ��ʼ��hλ�����ĳ�nSubValue
-- l = ��λ, ��1��ʼ; h = ��λ, ��1��ʼ; ���l > h, ���Զ�����
-- bDecimal = ����, nil��ʾ2����,������ʾ����Ľ���
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
	taskId = {},	-- ʹ����Щ�����������¼flag
--	tFlags = {		-- flag��֯��ʽ
--		1,			-- 	������flag
--		{2, 3},		--	һ��flag
--	}
}
-- ���²�����flag��1�����ֻ�����, ���ڼ�¼���
function TBitFlag:hasFlag(flag)		-- ��ȡ�Ƿ��п�����
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
function TBitFlag:addFlag(flag, bClear)		-- ���ñ��, bClear == 0 ʱΪ���1�����
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
	gf_Warning(format("[TBitFlag:addFlag] [ERROR] [Role:%s Acc:%s] [kh�ng c� v� tr� ph�i h�p]", GetName(), GetAccount()));
end
function TBitFlag:clearFlag(flag)	-- ������
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
		gf_Error("!!!!!!!!! L�i bi�n l��ng nhi�m v� !!!!!!!!!!!!");
		return
	elseif nTaskId == 0 then
		gf_Error("!!!!!!!!! Th� s� d�ng TASKiD=0 !!!!!!!!!!!!");
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
		gf_Error("!!!!!!!!! L�i bi�n l��ng nhi�m v� !!!!!!!!!!!!");
		return
	elseif nTaskId == 0 then
		gf_Error("!!!!!!!!! Th� s� d�ng TASKiD=0 !!!!!!!!!!!!");
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
