
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 任务系统头文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================


-- 定义各种任务触发的消息枚举
TaskCondition = {

	TaskStart = "B総 u nhi謒 v?",
	
	TaskEnd = "K誸 th骳 nhi謒 v?",
	
	LevelMore = "Ъng c蕄 l韓",
	
	LevelLess = "Ъng c蕄 nh?",
	
	LevelEqual = "Ъng c蕄 = ",
	
	ValueMore = "Bi課 lng l韓",
	
	ValueLess = "Bi課 lng nh?",
	
	ValueEqual = "Bi課 lng b籲g",
	
	ReputeMore = "Danh v鋘g l韓",
	
	HaveItem = "c ph萴",
	
}

-- 定义各种任务方法的枚举
TaskEntity = {

	FindGoods = "T譵 v藅 ph萴",
	
	KillNpc = "Цnh b筰 ai ",
	
	PayMoney = "lng ti襫 ti猽 hao",
	
	ChangeValue = "Thay i bi課 lng",

}

-- 定义各种奖励类型的枚举
TaskAward = {

	AwardGoods = "V藅 ph萴",
	
	AwardMoney = "Ng﹏ lng",
	
	AwardExp = "Kinh nghi謒",
	
	AwardRepute = "Danh v鋘g",
	
	AwardStartTask = "B総 u nhi謒 v?",

}

-- 定义任务标准按键的文字
TaskDialogText = {

	TaskConfirm = "Ti誴 nh薾 nhi謒 v?",
	
	TaskCancel = "H駓 b? nhi謒 v?",
	
}


-- 用于构造任务各种数值索引的类
TaskEngine_Index = {

	-- 对外数据，事件列表，触发条件，任务实体，奖励列表，任务对话的索引
	EventIndex = nil,
	ConditionIndex = nil,
	EntityIndex = nil,
	AwardIndex = nil,
	TalkIndex = nil,

	-- 构造函数，读入触发、实体与奖励的表格，构造索引
	__new = function(self, arg)
		self.EventIndex = self:AssignEventIndex(arg[1]);
		self.ConditionIndex = self:AssignConditionIndex(arg[2]);
		self.EntityIndex = self:AssignEntityIndex(arg[3]);
		self.AwardIndex = self:AssignAwardIndex(arg[4]);
		self.TalkIndex = self:AssignTalkIndex(arg[5])
	end,

	-- 构造任务触发条件的索引
	-- 具体格式为：{任务名称，任务ID，行数，归属的事件ID}
	AssignConditionIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local nEvent = 0;
		local i,j = 0,0;
		
		local nConditionData = {}; -- 最后返回的触发条件索引

			for i=2, nRow do
				j = j + 1;
				
				-- 有些任务可能没有事件归属
				nEvent = tabFile:getCell(i,"EventID");
				if nEvent~="" then
					nEvent = tonumber(nEvent);
				else
					nEvent = 0;
				end;
				
				tinsert(nConditionData, 
						getn(nConditionData) + 1, 
							{	
								tabFile:getCell(i,"TaskName"), 
								tonumber(tabFile:getCell(i,"TaskID")), 
								i,
								nEvent
							}
						);
			end;
			
			return nConditionData;
	end,
	
	-- 构造任务实体数据的索引
	-- 具体格式为：{任务名称，行数}
	AssignEntityIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nEntityData = {}; -- 最后返回的实体数据索引
		
			for i=2, nRow do
				j = j + 1;
				tinsert(nEntityData, 
						getn(nEntityData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nEntityData;
	end,
	
	-- 构造任务奖励数据的索引
	-- 具体格式为：{任务名称，行数}
	AssignAwardIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nAwardData = {}; -- 最后返回的奖励数据索引
		
			for i=2, nRow do
				tinsert(nAwardData, 
						getn(nAwardData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nAwardData;	
	end,
	
	-- 构造事件说明索引
	-- 具体格式为：{事件ID，事件说明，是否可以共享，行数}
	AssignEventIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nEventData = {}; -- 最后返回的奖励数据索引
		
			for i=2, nRow do
				tinsert(nEventData, 
						getn(nEventData) + 1, 
						{tonumber(tabFile:getCell(i,"EventID")),
						 tabFile:getCell(i,"EventText"),
						 tonumber(tabFile:getCell(i,"CanShare")),
						 i}
						);				
			end;
			
			return nEventData;
	end,
	
	-- 构造任务对话数据的索引
	-- 具体格式为：{任务名称，行数}
	AssignTalkIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- 获取表格的总行数
		local i,j = 0,0;
		
		local nTalkData = {}; -- 最后返回的奖励数据索引
		
			for i=2, nRow do
				tinsert(nTalkData, 
						getn(nTalkData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nTalkData;	
	end,

}