Include("\\script\\class\\mem.lua")
Include("\\settings\\static_script\\lib\\tag.lua")

_getinfo = getinfo
g_nfrequency = 18;

--missionv����------------------------------
MV_TIMER_STEP 	= 80		-- ʱ�䴥�����ۼ���
MV_TIMER_STEP_MAX = 89
MV_TIMER_SECOND = 70  --ʱ�䴥����ÿ���ۼ���
MV_TIMER_SECOND_MAX = 79
MV_PHASE_LEVEL	= 60  --PHASE��ǰ�׶�
MV_PHASE_LEVEL_MAX	= 69
---------------------------------------------

phaseBase = {
	name='phaseBase',
	phases = {},
	triggers = {},
	
	curPhaseLv = MV_PHASE_LEVEL,
	frequency = 18,		-- timerƵ��(��λ:֡)
	step = MV_TIMER_STEP,		-- ��ǰ����
	second = MV_TIMER_SECOND,	-- ��ǰʱ��(��λ:frequency/g_nfrequency��)
	maxstep = 1,		-- ������
	maxsecond = 1,  -- ���ʱ��(��λ:��)
}
function phaseBase:onInit(father)
	self.father = father;
	if father then
		if father.step >= MV_TIMER_STEP_MAX or father.second >= MV_TIMER_SECOND_MAX or father.curPhaseLv >= MV_PHASE_LEVEL_MAX then
			assert(format("[phaseBase timer]:OverFlow!file:%s",tostring(thisFile)));
		end	
		self.step = father.step + 1;
		self.second = father.second + 1;
		self.curPhaseLv = father.curPhaseLv + 1;
	end
	SetMissionV(self.curPhaseLv,1);
	SetMissionV(self.step,0);
	SetMissionV(self.second,0);
--	print("phaseBase:onInit",SubWorld,self.curPhaseLv,self.step,self.second)
	if self.guage then
		local guage = self.guage;
--		print("guage =", guage.msg, guage.time, guage.cyc, guage.id)
		this.msCamp:turnPlayer(0, StartTimeGuage, guage.msg, guage.time, guage.cyc, guage.id);
	end
	local nCurLv = GetMissionV(self.curPhaseLv);
	if self.phases[nCurLv] and self.phases[nCurLv].onInit then
		self.phases[nCurLv]:onInit(self);
	end
end
function phaseBase:addTimeGuage()
	if self.guage then
		StartTimeGuage(self.guage.msg, self.maxsecond - GetMissionV(self.second), self.guage.cyc, self.guage.id);
	end
	local nCurLv = GetMissionV(self.curPhaseLv);
	if self.phases[nCurLv] and self.phases[nCurLv].guage then
		self.phases[nCurLv]:addTimeGuage();
	end
end

function phaseBase:resetFather(father)
	self.father = father;
	if father then
		if father.step >= MV_TIMER_STEP_MAX or father.second >= MV_TIMER_SECOND_MAX or father.curPhaseLv >= MV_PHASE_LEVEL_MAX then
			assert(format("[phaseBase timer]:OverFlow!file:%s",tostring(thisFile)));
		end	
		self.step = father.step + 1;
		self.second = father.second + 1;
		self.curPhaseLv = father.curPhaseLv + 1;
	end
	local nCurLv = GetMissionV(self.curPhaseLv);
	if self.phases[nCurLv] and self.phases[nCurLv].resetFather then
		self.phases[nCurLv]:resetFather(self);
	end
end
function phaseBase:onFinish()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	if not self.father then
		for k,v in this.msPhases do
			v:resetFather()
		end
	end	
	if self.father then
		self.father:nextPhase()
	end
end
function phaseBase:onFailed()
	if self.guage and self.guage.id then
		StopTimeGuage(self.guage.id);
	end
	if not self.father then
		for k,v in this.msPhases do
			v:resetFather()
		end
	end
	if self.father then
		self.father:onFailed()
	end	
end
function phaseBase:onTimer()
	local nCurLv = GetMissionV(self.curPhaseLv);
	if self.phases[nCurLv] and self.phases[nCurLv].onTimer then
		self.phases[nCurLv]:onTimer();
	end
	local nCurSecond = GetMissionV(self.second) + self.frequency / g_nfrequency;
	SetMissionV(self.second,nCurSecond);
	SetMissionV(self.step,GetMissionV(self.step)+1);
	if nCurSecond > self.maxsecond then
		self:onTimeout();
		return 1;
	end
	return
end
function phaseBase:setTime(second)
	local step = second / (self.frequency / g_nfrequency);
	SetMissionV(self.second,second);
	SetMissionV(self.step, step);
	self:onTimer()
end
function phaseBase:onTimeout()
--	print("phaseBase:onTimeout")
	self:onFailed()
end
function phaseBase:onEvent(event, data)
--	print("phaseBase:onEvent",self.name, event,data)
	local trs = self.triggers[event];
	local nEventRet;
	if trs then
		for i, tg in trs do
			local nRet = 1;
			if tg.condition then
				nRet = tg.condition(self, event, data);
			end
			if nRet == 1 then
				nEventRet = tg.action(self, event, data);
			end
		end
	end
	local curPhase = self:getCurPhase();
	if curPhase then
		curPhase:onEvent(event, data);
	end
	return nEventRet;
end

function phaseBase:getCurPhase()
	local nCurLv = GetMissionV(self.curPhaseLv);
	return self.phases[nCurLv];
end

function phaseBase:nextPhase()
	local nCurLv = GetMissionV(self.curPhaseLv)+1;
	SetMissionV(self.curPhaseLv,nCurLv);
	if self.phases[nCurLv] then
		self.phases[nCurLv]:onInit(self);
	else
		self:onFinish();
	end
end

function phaseBase:setPhase(n)
	if type(n) ~= "number" then return end
	if not n or not self.phases[n] then return end
	SetMissionV(self.curPhaseLv,n);
	if self.phases[n] then
		self.phases[n]:onInit(self);
	end
end

inherit_meta = {
	["function"] = function(self, t)
		t = inherit(self,t);
		return t;
	end
}
setmetatable(phaseBase, inherit_meta)

-----------------------------------------------------------
cycPhase = phaseBase({
	frequency = 18,			-- timerƵ��
	actionsType = "second",
-- actions		ʱ�����ϵ�ע�ắ��
--   һά����, ��ʱ���±�ע�ắ����table (���Ǻ���)
--   ÿ�����ڱ�����1��, ���д��������ڵ�������֮�ڵ�ʱ������ע��ĺ���������
--   ��������10, ��ǰ�ǵ�8����, ��ô71-80��˳�򱻴���
	actions = {
--		[0] = init,
--		[100] = {callBoss},
--		[150] = {callFish1, callFish2},
--		[500] = {callout(print,1,2), }
--		[1000] = timeout,
	},

-- cycActions	�����Դ�����action
--   ��ά����, ��1���±��ǳ���, ��2���±�������
--   ��cycActions[100][1]�� mod(curStep, 100) == 1 ʱ������
	cycActions = {
--		[100] = {
--			[0] = callout(print,100,1),
--			start = 500,		-- ��ʲôʱ��ʼ
--		},
--		[150] = {
--			[10] = callout(print, 111, 10),
--		},
	},
})

function cycPhase:onTimer()
	if 1 == phaseBase.onTimer(self) then return end
	local maxType = "max"..self.actionsType;
	local toStep = min(self[maxType], GetMissionV(self[self.actionsType]) + self.frequency / g_nfrequency - 1);
	if self.DEBUG then
--		print(self.name..":onTimer", GetMissionV(self.second))
	end
	for curStep = GetMissionV(self[self.actionsType]), toStep do
		local co = self.actions[curStep];
		if co then 
			self:callout(co, curStep) 
		end
		for m, yv in self.cycActions do
			if curStep >= (yv.start or 0) then
--				print("curStep, m",curStep, m)
				co = yv[mod(curStep, m)];
				if co then self:callout(co, curStep) end
			end
		end
	end
end

function cycPhase:callout(co, curTime)
	if type(co) == "table" then
		for _, f in co do self:callout(f, curTime) end
	elseif type(co) == "function" then
		co(curTime)
	else
		print(format("[ERROR] [tCyc:callout] [type=%s, co=%s]", type(co), tostring(co)));
	end
end

-----------------------------------------------------------
--trigger = {
--	[event] = {
--		{condition, action},
--	},
--}

def_conditions = {
	"PlayerDeath",
	"NpcDeath",
	"UseItem",
	"Talk",
	"Trap",
	"PlayerState",
	"NpcState",
	"NpcRemove",
	"OnRevive",
}

-----------------------------------------------------------