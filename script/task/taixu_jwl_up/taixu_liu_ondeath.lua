--脚本名称：太虚首饰任务刘铁匠的死亡脚本
--脚本功能：刘铁匠的死亡脚本，死亡后往可添加物品的人物身上添加奇金
--策划人：铁羊
--代码编写人：村长
--代码编写时间：2007-03-02
--代码修改记录：
--========================================公共变量定义区==============================
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
taixu_jwl_taskID = 998
kill_liu_date_seq_glb = 508
--=========================================脚本主逻辑区===============================
function OnDeath(index)
	--删除NPC
	SetNpcLifeTime(index,0)
	--保存当前索引
	local PlayerIndex_save = PlayerIndex
	--寻找有任务的玩家
	local team_number = GetTeamSize()
	local get_task_index_table = {}
	local j = 1
	get_task_index_table[1] = 0			--初始化为0
	SetGlbValue(kill_liu_date_seq_glb,zgc_pub_day_turn(1))
	if team_number == 0 then
		liu_qijin_add()
		return
	else
		for i = 1,team_number do
			PlayerIndex = GetTeamMember(i)									--修改当前玩家索引
			if BigGetItemCount(2,1,562) ~= 0 then
				if Zgc_pub_goods_add_chk(1,1) == 1 then
					get_task_index_table[j] = PlayerIndex
					j = j + 1
				end
			end
		end
	end
	--队内没有人符合条件
	local player_seq = 0
	if get_task_index_table[1] == 0 then
		player_seq = random(1,team_number)
		PlayerIndex = GetTeamMember(player_seq)
		liu_qijin_add()
	else	--有人符合随机取一个
		player_seq = random(1,j)
		PlayerIndex = get_task_index_table[player_seq]
		liu_qijin_add()
	end
end
function liu_qijin_add()
	local add_flag = AddItem(2,1,563,1)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 K? Kim c馻 th? r蘮 L璾!")
		Msg2SubWorld("Ch骳 m鮪g:"..GetName().."Nhi謒 v? t╪g c蕄 trang s鴆 Th竔 H?, n誹 gi誸 頲 th? r蘮 L璾 s? nh薾 頲 K? Kim!")
		SetTask(taixu_jwl_taskID,4)
	else
		WriteLog("Nhi謒 v? trang s鴆 Th竔 H璤Ngi ch琲:"..GetName().."T╪g K? Kim c馻 th? r蘮 L璾 th蕋 b筰, v? tr? th蕋 b筰:"..add_flag)
	end
end
