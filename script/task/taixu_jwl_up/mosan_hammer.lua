--脚本名：莫三铁锤的使用脚本
--脚本功能：使用莫三的铁锤在GLB变量内记录下使用的坐标，然后系统按使用的坐标创建刘铁匠
--策划人：铁羊
--代码编写人：村长
--代码编写时间：2007-03-02
--代码修改记录：
--========================================公共变量定义区==============================
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
taixu_jwl_hammer_date = 997				--玩家使用物品日期序号
taixu_jwl_task_step_taskID = 998		--玩家任务步骤
taixu_jwl_hammer_date_glbID = 507		--服务器物品使用序号
taixu_liu_killed_date_glbID = 508		--刘铁匠被杀日期序号
taixu_jwl_liu_crt_att_glbID_srt = 511	--记录坐标的世界变量开始位置
taixu_jwl_liu_crt_att_glbID_end = 550	--记录坐标的时间变量结束位置
--=========================================脚本主逻辑区===============================
function OnUse()
	local date_seq_now = zgc_pub_day_turn(1)
	--任务步骤判断
	if GetTask(taixu_jwl_task_step_taskID) == nil or GetTask(taixu_jwl_task_step_taskID) == 0 then
		Talk(1,"","Ch飝 n祔 ta  nh譶 th蕐 ? u r錳, c? t竎 d鬾g g? ch??")
		return
	end
	--使用地图判断
	local mapID = GetWorldPos()
	if mapID ~= 218 then
		Talk(1,"","V藅 ph萴 n祔 ch? s? d鬾g ? <color=red>Linh B秓 s琻<color>!")
		return
	end
	--一天只能使用一次检测
	local use_date_seq = GetTask(taixu_jwl_hammer_date)
	if use_date_seq == nil then
		SetTask(taixu_jwl_hammer_date,0)
	end
	if use_date_seq >= date_seq_now then
		Talk(1,"","V藅 ph萴 n祔 m鏸 ng祔 ch? s? d鬾g <color=red>1<color> l莕!")
		return		
	end
	--使用时间限制
	if Zgc_pub_today_sec_num_rtn() > 75600 then
		Talk(1,"","Mu閚 r錳, ti謒 <color=yellow>th? r蘮 L璾<color>  ng c鯽"..Zgc_pub_sex_name().."hay l? ng祔 mai quay l筰!")
		return
	end
	--刘铁匠昨天被杀提示
	if GetGlbValue(taixu_liu_killed_date_glbID) == (zgc_pub_day_turn(1) - 1) then
		Talk(1,"","<color=yellow>Th? r蘮 L璾<color> h玬 qua g苝 c鮱 nh﹏ b? nh m閠 tr薾, e r籲g h玬 nay kh玭g n."..Zgc_pub_sex_name().."hay l? ng祔 mai quay l筰!")
		return
	end
	--铁锤存在判断
	if GetItemCount(2,1,564) == 0 then
		Talk(1,"","X竎 nh薾 b筺 c? mang theo <color=yellow>M筩 Tam Thi誸 Ch飝<color>.")
		return
	end
	--可以使用处理
	--铁锤删除判断
	if DelItem(2,1,564,1) ~= 1 then
		Talk(1,"","X竎 nh薾 b筺 c? mang theo <color=yellow>M筩 Tam Thi誸 Ch飝<color>.")
		return
	end
	local glb_use_date_seq = GetGlbValue(taixu_jwl_hammer_date_glbID)
	--计算出坐标值（一个空间同时放置X坐标和Y坐标）
	local map_ID,att_X,att_Y = GetWorldPos()		
	local att_save = (att_X * 10000) + att_Y
	--如果本次使用为服务器本轮第一次使用
	if glb_use_date_seq == nil or glb_use_date_seq < date_seq_now then
		--在服务器写入当前日期序号
		SetGlbValue(taixu_jwl_hammer_date_glbID,date_seq_now)			
		--在第一个位置写入第一坐标
		SetGlbValue(taixu_jwl_liu_crt_att_glbID_srt,att_save)			
		--其他位置初始化
		for i = (taixu_jwl_liu_crt_att_glbID_srt+1),taixu_jwl_liu_crt_att_glbID_end do	
			SetGlbValue(i,0)
		end
	else		--在后面的的空位置中补上当前的坐标
		for i = taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end do
			--找空位置写入坐标
			if GetGlbValue(i) == 0 then
				SetGlbValue(i,att_save)
				break
			end
			--如果没有空位置就随机找个位置覆盖
			if i == taixu_jwl_liu_crt_att_glbID_end then
				i = random(taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end)
				SetGlbValue(i,att_save)
				break
			end
		end
	end
	SetTask(taixu_jwl_hammer_date,date_seq_now)
	Talk(1,"","Thi誸 Ch飝 l祄 xong r錳, i n (<color=yellow>21:00-21:30) <color> <color=yellow>th? r蘮 L璾<color> s? n!")	
end
