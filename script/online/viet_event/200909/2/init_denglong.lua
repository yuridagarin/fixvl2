--=============================================
--create by baiyun 2009.8.27
--describe:越南版9月份中秋活动走军灯笼初始化脚本
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--刷新走军灯笼的坐标
t_denglong_sets = {
	[0] = {"Thi誹 L﹎", {204, 1526, 3269}},--星期日
	[1] = {"Nga My", {303, 1552, 3232}},--星期一
	[2] = {"Л阯g M玭", {305, 1530, 2921}},--星期二
	[3] = {"C竔 Bang", {209, 1515, 3265}},--星期三
	[4] = {"V? ng", {312, 1707, 3477}},--星期四
	[5] = {"Ng? чc", {407, 1555, 3286}},--星期五
	[6] = {"Dng M玭", {219, 1655, 3301}},--星期六
};
function main()
	if tonumber(date("%H")) == 0 or tonumber(date("%H")) == 1 or tonumber(date("%H")) == 22 or tonumber(date("%H")) == 23 then
		return
	end
--	local nDate = tonumber(date("%y%m%d"));
--	if nDate > 091206 or nDate < 091106 then
--		return 0;
--	end
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
--	if nDay == 6 or nDay == 0 then
		create_npcs(nDay);
--	else
--		if nHour ~= 0 and nHour ~= 1 then
--			create_npcs(nDay);
--		end
--	end
end

function create_npcs(nDay)
	local nNpcIndex = 0;
	local nNpcLifeTime = 57 * 60;--因为systemtimetask.txt里面有些整点的时间已经被占用，所以被迫微调几分钟时间
	nNpcIndex = CreateNpc("L? nng b竛h", "L? Nng", gf_UnPack(t_denglong_sets[nDay][2]));
	SetNpcLifeTime(nNpcIndex, nNpcLifeTime);
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\200909\\2\\npc_zoujundenglong.lua");
	AddUnitStates(nNpcIndex, 6, GetTime());--记录NPC创建的时间
	AddGlobalNews("Y課 ti謈 Th辴 Nng 頲 chi猽 i t筰 ["..t_denglong_sets[nDay][1].."]. M阨 ng o n tham d?!");
end