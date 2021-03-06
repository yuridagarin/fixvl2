--三大boss掉的小包裹
--by vivi
--2008/12/10
Include("\\script\\lib\\globalfunctions.lua");

TSK_GET_ITEM_TIME = 584; --记录拾起包裹的日期 每天一次
TSK_GET_ITEM_COUNT_BYTE = 1;
TSK_GET_ITEM_DAY_BYTE = 2;
TSK_GET_ITEM_MONTH_BYTE = 3;

t_TUOGUAN_HIG_VOZ = {
	[1] = {"Kim Cang B竧 Nh? Ch﹏ Quy觧", {0,107,204,1,1}},
	[2] = {"V? Tr莕 B? б Ch﹏ Quy觧",{0,107,206,1,1}},
	[3] = {"Ti襪 Long T骳 Di謙 Ch﹏ Quy觧",{0,107,205,1,1}},
	[4] = {"Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧",{0,107,207,1,1}},
	[5] = {"Nh? ? Kim жnh Ch﹏ Quy觧",{0,107,208,1,1}},
	[6] = {"B輈h H秈 Tuy謙  Ch﹏ Quy觧",{0,107,209,1,1}},
	[7] = {"H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧",{0,107,210,1,1}},
	[8] = {"Qu? Thi猲 Du Long Ch﹏ Quy觧",{0,107,211,1,1}},
	[9] = {"Huy襫 秐h M? T玭g Ch﹏ Quy觧",{0,107,212,1,1}},
	[10] = {"Qu﹏ T? ыi Phong Ch﹏ Quy觧",{0,107,213,2,1}},
	[11] = {"Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧",{0,107,214,1,1}},
	[12] = {"Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧",{0,107,215,1,1}},
	[13] = {"Huy襫 Minh Phong Ma Ch﹏ Quy觧",{0,107,216,1,1}},
	[14] = {"Linh C? Huy襫 T? Ch﹏ Quy觧",{0,107,217,2,1}},
	[15] = {"C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧", {0,107, 218,1,1}},		
	[16] = {"H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧", {0,107, 222,1,1}},		
	[17] = {"Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧", {0,107, 223,1,1}},			
};

function main()
	local npcIndex = GetTargetNpc()
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))

	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE) ~= nDay or gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE) ~= nMonth then
		gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, 0)
	end
	
	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) >= 4 then
		Talk(1,"","M鏸 ng祔 ch? c? th? nh苩 t鑙 產 4 t骾")
		return 0
	end
	
	local nWait = 300 - (GetTime() - GetUnitCurStates(npcIndex, 6))
	if nWait > 0 then
		Talk(1,"","C遪 "..nWait.." gi﹜ m韎 c? th? nh苩 t骾!")
		return 0
	end
	
	local nDelay = 5 - (GetTime() - GetTask(2278))
	if nDelay > 0 then
		Talk(1,"","Sau "..nDelay.." gi﹜ m韎 c? th? nh苩 t骾 ti誴 theo!")
		return 0
	end
	
	-- 把自己删除
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE, nDay)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE, nMonth)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) + 1)
	SetTask(2278, GetTime())
	
	local nLv = GetLevel();
	local nExp = nLv^3*2;
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 "..nExp.."Kinh nghi謒");
	local nRand = random(1,10000);
	if nRand <= 5 then
		AddItem(0,102,15,1,1,2,24,3,14,0,0);
	elseif nRand <= 10 then
		AddItem(0,102,20,1,1,2,24,3,14,0,0);
	end
	
	if nRand <= 9975 then
		gf_EventGiveCustomAward(3, 10, "Tui boss The Gioi")
	else
		gf_AddItemEx2({2, 1, 30071, 1}, "Nh﹏ S﹎ V筺 N╩", "Tui boss The Gioi")
	end
	
	if nRand <= 300 then
		AddItem(0,107,66,1,4) 
	elseif nRand <= 600 then
		AddItem(0,107,65,1,4) 
	elseif nRand <= 900 then
		AddItem(0,107,64,1,4) 
	end
	
	local nRandomNum = 0;
	nRandomNum = random(1,100);
	if nRandomNum <= 5 then
		if AddItem(2,2,7,1) == 1 then
			Msg2Player("B筺 nh薾 頲 1 m秐h Thi猲 Th筩h");
			WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."Nh薾 頲 1 m秐h Thi猲 Th筩h");
		end;		
	end;
	

	nRandomNum = random(1,500);
	if nRandomNum <= 1  then
		local nRandBook = random(1,17);
		gf_AddItemEx(t_TUOGUAN_HIG_VOZ[nRandBook][2], t_TUOGUAN_HIG_VOZ[nRandBook][1]);		
		Msg2Player("B筺  nh薾 頲 1 M藅 t辌h m玭 ph竔 "..t_TUOGUAN_HIG_VOZ[nRandBook][1]);
		WriteLog("[Ho箃 ng tr錸g c﹜ Th竔 H璢:"..GetName().."  nh薾 頲 1 M藅 t辌h m玭 ph竔 "..t_TUOGUAN_HIG_VOZ[nRandBook][1]);
	end;

end