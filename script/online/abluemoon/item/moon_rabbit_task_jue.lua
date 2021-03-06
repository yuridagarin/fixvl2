--脚本名称：师门诀要包使用脚本
--脚本功能：玩家使用脚本后，随机给玩家增加任意一个门派的任意两本诀要
--代码编写人：村长
--代码编写时间：2007-01-28
--修改记录：小蓝打补丁
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=================================公共变量定义区============================
jue_list = {
		{{"少林刀法诀要",2,6,1},
		{"少林棍法诀要",2,6,2},
		{"斩魔刀法诀要",2,6,3},
		{"封魔棍法诀要",2,6,4},
		{"金钟罩诀要",2,6,5},
		{"燃木刀法诀要",2,6,6},
		{"无常棍法诀要",2,6,7},
		{"舍身诀诀要",2,6,8},
		{"大乘如来心法诀要",2,6,9},
		{"达摩武经诀要",2,6,10},
		{"七宝神照心法诀要",2,6,11},
		{"罗汉拳诀要",2,6,12},
		{"迦叶腿诀要",2,6,13},
		{"慧眼咒诀要",2,6,14},
		{"韦陀拳诀要",2,6,15},
		{"文殊出云腿诀要",2,6,16},
		{"罗汉阵诀要",2,6,17},
		{"大须弥掌诀要",2,6,18},
		{"无影脚诀要",2,6,19},
		{"少林龙爪手诀要",2,6,20},
		{"伏虎气功诀要",2,6,21},
		{"少林修心法诀要",2,6,22},
		{"五转指诀要",2,6,23},
		{"破魔咒诀要",2,6,24},
		{"金刚不坏诀要",2,6,25},
		{"因陀罗雷印破诀要",2,6,26},
		{"袈裟伏魔神通诀要",2,6,27},
		{"无相神功诀要",2,6,28},
		{"狮子吼诀要",2,6,29},
		{"不动明王咒诀要",2,6,30},
		{"大力金刚指诀要",2,6,31}},
		{{"暗器制作术诀要",2,6,32},
		{"心眼诀要",2,6,33},
		{"毒刺骨诀要",2,6,34},
		{"解毒秘术诀要",2,6,35},
		{"勾魂阱诀要",2,6,36},
		{"机关破解术诀要",2,6,37},
		{"追心箭诀要",2,6,38},
		{"秋毫明查诀要",2,6,39},
		{"穿心刺诀要",2,6,40},
		{"淬毒秘术诀要",2,6,41},
		{"夺魄幡诀要",2,6,42},
		{"暴雨梨花针诀要",2,6,43},
		{"含沙射影诀要",2,6,44},
		{"锁命针诀要",2,6,45},
		{"满天花雨诀要",2,6,46}},
		{{"观音诀诀要",2,6,47},
		{"峨嵋佛意诀要",2,6,48},
		{"玉女剑法诀要",2,6,49},
		{"渡元诀诀要",2,6,50},
		{"佛光普照诀要",2,6,51},
		{"莲华心经诀要",2,6,52},
		{"清音梵唱诀要",2,6,53},
		{"流水诀诀要",2,6,54},
		{"普济众生诀要",2,6,55},
		{"不灭心法诀要",2,6,56},
		{"佛光战气诀要",2,6,57},
		{"佛音战意诀要",2,6,58},
		{"大慈大悲咒诀要",2,6,59},
		{"随意曲诀要",2,6,60},
		{"曲艺精通诀要",2,6,61},
		{"月蚀曲诀要",2,6,62},
		{"断水心法诀要",2,6,63},
		{"静夜思诀要",2,6,64},
		{"余音绕梁功诀要",2,6,65},
		{"阳关三叠诀要",2,6,66},
		{"覆水心法诀要",2,6,67},
		{"焚琴煮鹤诀诀要",2,6,68},
		{"乌夜啼诀要",2,6,69},
		{"迷心飘香曲诀要",2,6,70}},
		{{"丐帮掌法诀要",2,6,71},
		{"通臂拳诀要",2,6,72},
		{"千斤闸诀要",2,6,73},
		{"霸王拳诀要",2,6,74},
		{"锁喉擒拿手诀要",2,6,75},
		{"逍遥游诀要",2,6,76},
		{"六合拳法诀要",2,6,77},
		{"醉蝶诀要",2,6,78},
		{"醉拳诀要",2,6,79},
		{"丐帮棍法诀要",2,6,80},
		{"驱蛇棍法诀要",2,6,81},
		{"乞天讨地诀要",2,6,82},
		{"泥鳅功诀要",2,6,83},
		{"妙手诀诀要",2,6,84},
		{"偷龙转凤诀要",2,6,85},
		{"霸王卸甲诀要",2,6,86},
		{"偷天换日诀要",2,6,87},
		{"打狗棍法诀要",2,6,88}},
		{{"武当剑法诀要",2,6,89},
		{"流光剑法诀要",2,6,90},
		{"未央剑法诀要",2,6,91},
		{"柔云剑法诀要",2,6,92},
		{"烈焰剑法诀要",2,6,93},
		{"奔雷剑诀诀要",2,6,94},
		{"无我心法诀要",2,6,95},
		{"太清剑气诀要",2,6,96},
		{"缠梦剑意诀要",2,6,97},
		{"落霜剑意诀要",2,6,98},
		{"炙阳剑气诀要",2,6,99},
		{"玄武剑阵诀要",2,6,100},
		{"御剑诀诀要",2,6,101},
		{"正两仪剑法诀要",2,6,102},
		{"太乙三清剑诀要",2,6,103},
		{"神门十三剑诀要",2,6,104},
		{"地宁玄阴剑诀要",2,6,105},
		{"天清纯阳剑诀要",2,6,106},
		{"八卦剑气诀要",2,6,107},
		{"真武七截剑诀要",2,6,108},
		{"武当笔法诀要",2,6,109},
		{"太乙逍遥功诀要",2,6,110},
		{"六气化玉功诀要",2,6,111},
		{"梯云纵诀要",2,6,112},
		{"七星诀诀要",2,6,113},
		{"少阳诀诀要",2,6,114},
		{"少阴诀诀要",2,6,115},
		{"北斗七星阵诀要",2,6,116},
		{"残影诀诀要",2,6,117},
		{"乾坤诀诀要",2,6,118},
		{"上清无极功诀要",2,6,119}},
		{{"杨家枪法诀要",2,6,120},
		{"杨家破风枪诀要",2,6,121},
		{"杨家驭马术诀要",2,6,122},
		{"杨家奔狼枪诀要",2,6,123},
		{"杨家战定诀诀要",2,6,124},
		{"杨家巧战诀诀要",2,6,125},
		{"杨家天衡枪诀要",2,6,126},
		{"杨家英雄气诀要",2,6,127},
		{"杨家倒海枪诀要",2,6,128},
		{"杨家御马术诀要",2,6,129},
		{"碧月飞星枪诀要",2,6,130},
		{"杨家弓法诀要",2,6,131},
		{"杨家连射术诀要",2,6,132},
		{"杨家阵疗术诀要",2,6,133},
		{"杨家回龙箭诀要",2,6,134},
		{"杨家缠云箭诀要",2,6,135},
		{"杨家奇门盾诀要",2,6,136},
		{"杨家正气箭诀要",2,6,137},
		{"杨家碎金箭诀要",2,6,138},
		{"杨家幻神诀诀要",2,6,139},
		{"杨家续命诀诀要",2,6,140},
		{"流光绝影箭诀要",2,6,141}},
		{{"五毒刀法诀要",2,6,142},
		{"引魂咒诀要",2,6,143},
		{"操尸术诀要",2,6,144},
		{"尸毒术诀要",2,6,145},
		{"尸爆大法诀要",2,6,146},
		{"集尸邪气诀要",2,6,147},
		{"驭尸术诀要",2,6,148},
		{"万毒夺命刀诀要",2,6,149},
		{"阴邪吸魂气诀要",2,6,150},
		{"催尸邪气诀要",2,6,151},
		{"邪灵大法诀要",2,6,152},
		{"邪毒功诀要",2,6,153},
		{"尸裂魔功诀要",2,6,154},
		{"下蛊秘方诀要",2,6,155},
		{"疯蛊诀要",2,6,156},
		{"养蛊秘术诀要",2,6,157},
		{"狂风爪诀要",2,6,158},
		{"毒蛊诀要",2,6,159},
		{"血鼎功诀要",2,6,160},
		{"血蛊诀要",2,6,161},
		{"香蛊诀要",2,6,162},
		{"尸蛊诀要",2,6,163},
		{"妖蛊诀要",2,6,164},
		{"心蛊诀要",2,6,165},
		{"万蛊蚀天诀要",2,6,166},
		{"幻蛊诀要",2,6,167},
		{"蠶蛊诀要",2,6,168}},
}
jue_id = {	{607,"少林诀要包"},
			{608,"唐门诀要包"},
			{609,"峨嵋诀要包"},
			{610,"丐帮诀要包"},
			{611,"武当诀要包"},
			{612,"杨门诀要包"},
			{613,"五毒诀要包"}}
--==================================脚本主逻辑区=============================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i =1, getn(jue_id) do
		if goods_id == jue_id[i][1] then
			goods_diff = i
			break
		end
	end
	Say("S? d鬾g t骾 b? ki誴 s? may m緉 nh薾 頲 c竎 lo筰 y誹 quy誸 m玭 ph竔. S? d鬾g?",2,
	"уng ?!/#goods_use_det("..goods_diff..")",
	"Ch璦 c莕/end_dialog"
	)
end

function end_dialog()
end

--***********************************物品使用区******************************
function goods_use_det(goods_diff)
	if Zgc_pub_goods_add_chk(5,50) ~= 1 then		--空间/负重判断
		Talk(1,"","请确认您的背包有足够的负重和空间！")
		return
	end
	if GetItemCount(2,0,jue_id[goods_diff][1]) == 0 then
		Talk(1,"","请确认您的包裹中有<color=red>"..jue_id[goods_diff][2].."<color>！")
		return
	end
	if DelItem(2,0,jue_id[goods_diff][1],1) ~= 1 then
		Talk(1,"","请确认您的包裹中有<color=red>"..jue_id[goods_diff][2].."<color>！")
		return
	else
		for i = 1, 5 do
			local ran_num = random(1,getn(jue_list[goods_diff]))
			local add_flag = AddItem(jue_list[goods_diff][ran_num][2],jue_list[goods_diff][ran_num][3],jue_list[goods_diff][ran_num][4],1)
			if add_flag == 1 then
				Msg2Player("你获得一本:\""..jue_list[goods_diff][ran_num][1].."\"")
			else
				WriteLog(GetName().."获得奖励："..jue_list[goods_diff][ran_num][1].."增加失败，失败标志："..add_flag)
			end
		end
	end	
end
