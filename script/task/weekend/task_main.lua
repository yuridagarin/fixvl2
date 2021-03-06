--周末活动
--created by lizhi
--2005-9-10 11:46

Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

WEEK_MATERIAL = 2160	--一周所需军用物资

function deliver_goods_begin()
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--汴京
	    SetTask(TASK_GQ_DELIVER, PATH_BJ2QZ);
	    --创建触发器
	    for index, value in rect_trigger_table do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("Tuy課 阯g chuy觧 h祅g g錷 Nam Bi謓 Kinh, H筺h Hoa Th玭, Dng Ch﹗, Long Tuy襫 Th玭, B綾 Tuy襫 Ch﹗, Tuy襫 Ch﹗");
	    TaskTip("Tuy課 阯g chuy觧 h祅g g錷 Nam Bi謓 Kinh, H筺h Hoa Th玭, Dng Ch﹗, Long Tuy襫 Th玭, B綾 Tuy襫 Ch﹗, Tuy襫 Ch﹗");
	elseif nMapID == 350 then	--襄阳
		SetTask(TASK_GQ_DELIVER, PATH_XY2YZ);
	    --创建触发器
	    for index, value in rect_trigger_table_2 do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("Tuy課 阯g chuy觧 h祅g g錷 Linh B秓 s琻, Thi誹 L﹎, T﹜ Bi謓 Kinh, Bi謓 Kinh, Nam Bi謓 Kinh, H筺h Hoa Th玭, Dng Ch﹗");
	    TaskTip("Tuy課 阯g chuy觧 h祅g g錷 Linh B秓 s琻, Thi誹 L﹎, T﹜ Bi謓 Kinh, Bi謓 Kinh, Nam Bi謓 Kinh, H筺h Hoa Th玭, Dng Ch﹗");
	elseif nMapID == 150 then	--扬州
		SetTask(TASK_GQ_DELIVER, PATH_YZ2XY);
	    --创建触发器
	    for index, value in rect_trigger_table_3 do
	        CreateTrigger(2, value[1], value[2]);
	    end;
		Msg2Player("Tuy課 阯g chuy觧 h祅g g錷 H筺h Hoa Th玭, Nam Bi謓 Kinh, Bi謓 Kinh, T﹜ Bi謓 Kinh, Thi誹 L﹎, Linh B秓 s琻, Tng Dng");
	    TaskTip("Tuy課 阯g chuy觧 h祅g g錷 H筺h Hoa Th玭, Nam Bi謓 Kinh, Bi謓 Kinh, T﹜ Bi謓 Kinh, Thi誹 L﹎, Linh B秓 s琻, Tng Dng");
	end;
end;

function deliver_goods_end()
    SetTask(TASK_GQ_DELIVER, 0);        --可以继续送货物
    SetTask(TASK_GQ_KILLWK_START, 1);   --可以杀倭寇
    --随便删除一个货物
    for index, value in finished_product_table do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            DelItem(value[1], value[2], value[3], 1);
            --奖励
            AddPlayerPoint(POINT_PER_ONCE_DELIVER);
            Msg2Player("N閜 1 c竔 "..value[4].."nh薾 頲"..POINT_PER_ONCE_DELIVER.." 甶觤 c玭g lao");
            break
        end;
    end;
    --全部移除触发器，没时间了，全部写死
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --清除任务变量，没时间了，直接写死
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
    
    local szSay = {
        " t? <sex> gi髉 chuy觧 v藅 ph萴! Nh璶g hi謓 Oa Kh蕌 xua qu﹏ ti課 v祇 H秈 T﹏, kh玭g bi誸 <sex>gi髉 畊鎖 l? gi芻 甶 頲 kh玭g?",
        "Qu鑓 gia l﹎ nguy sao c? th? ng nh譶/kill_enemy",
        "Ta 產ng b薾!/end_say"
    };
    SelectSay(szSay);
end;

function check_path(nPath)   --返回0则证明全部走过，1则证明没有走完
    local nResult = 0;
    if nPath == PATH_BJ2QZ then
	    for index, value in path_table do
	        if GetTask(value) == 0 then     --如果有没走过的地图
	            return 1
	        end;
	    end;
	elseif nPath == PATH_XY2YZ then
		for index, value in path_table_2 do
	        if GetTask(value) == 0 then     --如果有没走过的地图
	            return 1
	        end;
	    end;
	elseif nPath == PATH_YZ2XY then
		for index, value in path_table_3 do
	        if GetTask(value) == 0 then     --如果有没走过的地图
	            return 1
	        end;
	    end;
	end;
end;

function receive_goods()
    local szPathWrong = {
        "Xin l鏸! Ngi kh玭g 甶 ng tuy課 阯g, gi髉 Чi T鑞g chuy觧 h祅g th蕋 b筰."
    };
    local szNoGoods = {
        "Xin l鏸! Ngi kh玭g mang qu﹏ d鬾g, nhi謒 v? gi髉 Чi T鑞g chuy觧 h祅g th蕋 b筰."
    };
    local nPath = GetTask(TASK_GQ_DELIVER);
    local nMapID = GetWorldPos();
    
    if nMapID == 100 then		--泉州
    	if nPath == PATH_XY2YZ then
	    	local szTalk = {
	    		"Ngi mau mang v藅 t? t? Tng Dng giao cho Ch? huy s? Dng Ch﹗."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_YZ2XY then
	    	local szTalk = {
	    		"Ngi mau mang v藅 t? t? Dng Ch﹗ giao cho Ch? huy s? Tng Dng."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
    elseif nMapID == 150 then	--扬州
		if nPath == PATH_BJ2QZ then
	    	local szTalk = {
	    		"Ngi mau mang v藅 t? t? Bi謓 Kinh giao cho Ch? huy s? Tuy襫 Ch﹗."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_YZ2XY then
	    	local szTalk = {
	    		"Ngi mau mang v藅 t? t? Dng Ch﹗ giao cho Ch? huy s? Tng Dng."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
	elseif nMapID == 350 then	--襄阳
		if nPath == PATH_BJ2QZ then
	    	local szTalk = {
	    		"Ngi mau mang v藅 t? t? Bi謓 Kinh giao cho Ch? huy s? Tuy襫 Ch﹗."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    elseif nPath == PATH_XY2YZ then
	    	local szTalk = {
	    		"Ngi mau mang v藅 t? t? Tng Dng giao cho Ch? huy s? Dng Ch﹗."
	    	};
	    	TalkEx("", szTalk);
	    	return
	    end;
	end;

    if is_exist(finished_product_table) == 0 then   --如果没有货物
        TalkEx("task_failed", szNoGoods);
        return
    end;
    
    if check_path(nPath) == 1 then   --没走完所有地图
        TalkEx("task_failed", szPathWrong);
        return
    end;
    
    deliver_goods_end();    --送货结束
end;

function task_failed()
    SetTask(TASK_GQ_DELIVER, 0);
    --全部移除触发器，没时间了，全部写死
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --清除任务变量，没时间了，直接写死
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
    
    Msg2Player("Gi髉 Чi T鑞g chuy觧 h祅g th蕋 b筰.");
end;

function kill_enemy()
	if GetTask(TASK_WK_ISDISCONNECT) == 0 then	--正常退出的
		local nCoolDown = GetCooldownTime(1800);
		if nCoolDown > 0 then
			local nMinCD = floor(nCoolDown / 60);
			local nSecCD = mod(nCoolDown, 60);
			local szTalk = {
				"<sex> T薾 l鵦 cho t nc c騨g kh玭g n猲 l祄 qu? s鴆, kho秐g"..nMinCD.." Ph髏 "..nSecCD.." gi﹜ quay l筰."
			};
			TalkEx("", szTalk);
			return
		end;
	end;
	local szSay = {
		"<sex> Sau khi v祇 甶觤 ng nh藀 Oa Kh蕌 m阨 n tng l躰h ti襫 tuy課 b竜 danh gi髉 nh 畊鎖 Oa Kh蕌",
		"Ta  chu萵 b?!/kill_enemy_start",
		"Ta 產ng b薾!/end_say"
	};
	SelectSay(szSay);
end;

function kill_enemy_start()
	SetTask(TASK_WK_ISDISCONNECT, 1);
	SetLaskEnterTime();
	
	local nMapid, nX, nY = GetWorldPos();
	--记录当前坐标
    SetTask(TASK_POSITION, nMapid);
    SetTask(TASK_POSITION + 1, nX);
    SetTask(TASK_POSITION + 2, nY);
    
    --记录登陆的是哪个地图
    SetTask(TASK_WHICH_MAP, random(0,1))
    
    --计算是杀什么档次的倭寇
    local szKey = "wk_";
    local nLevel = GetLevel();
    if nLevel > 0 and nLevel <= 27 then
        szKey = szKey..20;
    elseif nLevel > 27 and nLevel <= 37 then
        szKey = szKey..30;
    elseif nLevel > 37 and nLevel <= 47 then
        szKey = szKey..(40 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 47 and nLevel <= 57 then
        szKey = szKey..(50 + GetTask(TASK_WHICH_MAP));
    elseif nLevel > 57 and nLevel <= 99 then
        szKey = szKey..(60 + GetTask(TASK_WHICH_MAP));
    end;
    --传送
    CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
    NewWorld(maps_table[szKey][1], maps_table[szKey][2], maps_table[szKey][3]);
end;

function out_map()
    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;

    for index, value in rect_wk_table do    --移处区域触发器
        RemoveTrigger(GetTrigger(value[2]));
    end;

	RemoveTrigger(GetTrigger(log_wk_table[2]));
        --移除计时器
	RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
        
    SetTask(TASK_GQ_DELIVER, 0);
	SetTask(TASK_GQ_KILLWK, 0);
	SetTask(TASK_GQ_KILLWK_START, 0);
    SetLogoutRV(0);
    SetFightState(0);
	--传送出杀倭寇地图
	NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
end;

function deliver_goods()
    local szMsg = {
        "S? gi? ho箃 ng: Tr猲 ngi b筺 kh玭g c? v藅 t? qu﹏ b? g?  g鰅 ?!"
    };
    local szSayQz = {
        "S? gi? ho箃 ng: H穣 theo tuy課 阯g Bi謓 Kinh-Nam Bi謓 Kinh-H筺h Hoa th玭-Dng Ch﹗-Long Tuy襫 th玭-B綾 Tuy襫 Ch﹗-Tuy襫 Ch﹗ giao h祅g cho Ch? huy s?!",
        "B総 u nhi謒 v? chuy觧 v藅 t?/deliver_goods_begin",
        "Kh玭g mu鑞 chuy觧!/end_say"
    };
    local szSayYz = {
        "S? gi? ho箃 ng: H穣 theo tuy課 阯g Tng Dng-Linh B秓 S琻-Thi誹 L﹎-T﹜ Bi謓 Kinh-Bi謓 Kinh-Nam Bi謓 Kinh-H筺h Hoa th玭-Dng Ch﹗ giao h祅g cho Ch? huy s?!",
        "B総 u nhi謒 v? chuy觧 v藅 t?/deliver_goods_begin",
        "Kh玭g mu鑞 chuy觧!/end_say"
    };
    local szSayXy = {
        "S? gi? ho箃 ng: H穣 theo tuy誸 阯g Dng Ch﹗-H筺h Hoa th玭-Nam Bi謓 Kinh-Bi謓 Kinh-T﹜ Bi謓 Kinh-Thi誹 L﹎-Linh B秓 S琻-Tng Dng giao h祅g cho Ch? huy s?!",
        "B総 u nhi謒 v? chuy觧 v藅 t?/deliver_goods_begin",
        "Kh玭g mu鑞 chuy觧!/end_say"
    };
    local szNoQz = {
    	"S? gi? ho箃 ng: Ngi  nh薾 nhi謒 v? chuy觧 v藅 t? t? Bi謓 Kinh n Tuy襫 Ch﹗, mau 甶 甶!"
    };
    local szNoYz = {
    	"S? gi? ho箃 ng: Ngi  nh薾 nhi謒 v? chuy觧 v藅 t? t? Tng Dng n Dng Ch﹗, mau 甶 甶!"
    };
    local szNoXy = {
    	"S? gi? ho箃 ng: Ngi  nh薾 nhi謒 v? chuy觧 v藅 t? t? Dng Ch﹗ n Tng Dng, mau 甶 甶!"
    };
    
    if is_exist(finished_product_table) == 0 then   --如果没有货物
        TalkEx("deliver_goods_nogoods", szMsg);
        return
    end;
    
    if GetTask(TASK_GQ_DELIVER) == PATH_BJ2QZ then
    	TalkEx("", szNoQz);
    	return
    elseif GetTask(TASK_GQ_DELIVER) == PATH_XY2YZ then
    	TalkEx("", szNoYz);
    	return
    elseif GetTask(TASK_GQ_DELIVER) == PATH_YZ2XY then
    	TalkEx("", szNoXy);
    	return
    end;
    
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--汴京
		SelectSay(szSayQz);
		return
	end;
	if nMapID == 350 then	--襄阳
		SelectSay(szSayYz);
		return
	end;
	if nMapID == 150 then	--扬州
		SelectSay(szSayXy);
		return
	end;
end;

function deliver_goods_nogoods()
    SetTask(TASK_GQ_DELIVER, 0);
    --全部移除触发器，没时间了，全部写死
    for index=2001, 2007 do
        if GetTrigger(index) ~= 0 then
            RemoveTrigger(GetTrigger(index));
        end;
    end;
    --清除任务变量，没时间了，直接写死
    for i=1730, 1736 do
    	SetTask(i, 0);
    end;
end;

function supply_armament()
    local szMsg = {
        "S? gi? ho箃 ng: H譶h nh? ngi kh玭g mang v藅 t? cho Чi T鑞g."
    };
    --没有成品(军备)也没有材料
    if is_exist(material_table) == 0 then
        TalkEx("", szMsg);
        return
    end;
    
    supply_material();
end;

function supply_material()
	local selTab = {
				"Ta mu鑞 n閜 nguy猲 li謚 c馻 tu莕 n祔/supply_week_material",
				"Ta mu鑞 n閜 t蕋 c? c竎 nguy猲 li謚/supply_material_all",
				"Ta mu鑞 n閜 nguy猲 li謚/supply_somekind_material",
				"T筸 th阨 kh玭g n閜/end_say",
				}
	Say("<color=green>S? gi? ho箃 ng<color>: Ngi mu鑞 n閜 nguy猲 li謚 n祇?",getn(selTab),selTab);
end;

function supply_week_material()
	local nTotalCount = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nTotalCount = nTotalCount + nCount;
	end;
	if nTotalCount < WEEK_MATERIAL then
		Talk(1,"supply_material","<color=green>S? gi? ho箃 ng<color>: Ngi kh玭g  nguy猲 li謚, x竎 nh薾 ch? c? <color=yellow>"..WEEK_MATERIAL.."<color>Nguy猲 li謚 qu﹏ d鬾g, hi謓 ngi ch? c?<color=yellow>"..nTotalCount.."<color> ph莕 Qu﹏ ph萴.");
		return 0;
	end;
	local selTab = {
				"ng v藋, ta mu鑞 n閜 nguy猲 li謚 c馻 tu莕 n祔/supply_week_material_confirm",
				"Ta suy ngh? l筰/supply_material",
				}
	Say("<color=green>S? gi? ho箃 ng<color>: Ngi mu鑞 n閜 nguy猲 li謚 c馻 tu莕 n祔? S? nguy猲 li謚 tu莕 trc c馻 ngi b? tr? <color=yellow><color=yellow>"..WEEK_MATERIAL.."<color>, ngi nh薾 頲<color=yellow>"..WEEK_MATERIAL.."<color> 甶觤 nh qu鑓 an bang",getn(selTab),selTab);
end;

function supply_week_material_confirm()
	local nTotalCount = 0;
	local nCount = 0;
	local nDelCount = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nTotalCount = nTotalCount + nCount;
	end;
	if nTotalCount < WEEK_MATERIAL then
		Talk(1,"supply_material","<color=green>S? gi? ho箃 ng<color>: Ngi kh玭g  nguy猲 li謚, x竎 nh薾 ch? c? <color=yellow>"..WEEK_MATERIAL.."<color>Nguy猲 li謚 qu﹏ d鬾g, hi謓 ngi ch? c?<color=yellow>"..nTotalCount.."<color> ph莕 Qu﹏ ph萴.");
		return 0;
	end;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		nDelCount = nDelCount + nCount;
		if nCount >= WEEK_MATERIAL then	--现在应该不可能有军用可以叠加超过2160的，不过不排除以后有可能，所以还是做一下处理吧
			DelItem(value[1], value[2], value[3], WEEK_MATERIAL);	
			break;
		elseif nDelCount < WEEK_MATERIAL then
			DelItem(value[1], value[2], value[3], nCount);
		else
			DelItem(value[1], value[2], value[3], nCount-nDelCount+WEEK_MATERIAL);
			nDelCount = WEEK_MATERIAL;	--这句是用来说明一下而已，没什么意义
			break;
		end;
	end;
	AddPlayerPoint(nDelCount);
 	Msg2Player("B筺 nh薾 頲 "..nDelCount.." 甶觤 c玭g lao");
	Talk(1,"","<color=green>S? gi? ho箃 ng<color>: T鎛g c閚g ngi  n閜 <color=yellow>"..WEEK_MATERIAL.."<color>, nh薾 頲<color=yellow>"..WEEK_MATERIAL.."<color> 甶觤 nh qu鑓 an bang");	
end;

function supply_material_all()
	local selTab = {
				"Ta mu鑞 giao to祅 b? nguy猲 li謚/supply_material_all_confirm",
				"в ta suy ngh? l筰/supply_material",
				}
	Say("<color=green>S? gi? ho箃 ng<color>: Ngi mu鑞 n閜 nguy猲 li謚 qu﹏ d鬾g ?? Tu莕 n祔 ch? d飊g nhi襲 nh蕋 <color=yellow>"..WEEK_MATERIAL.."<color> 甶觤 An Bang мnh Qu鑓 i ph莕 thng, nh璶g n誹 t輈h l騳 nhi襲 甶觤 ngi s? i 頲 danh hi謚 Kh竛g Oa",getn(selTab),selTab);
end;

function supply_material_all_confirm()
	local nCount = 0;
	local nPoint = 0;
	for index, value in material_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		DelItem(value[1], value[2], value[3], nCount);
		nPoint = nPoint + POINT_PER_MATERIALS * nCount;
	end;
	AddPlayerPoint(nPoint);
    Msg2Player("B筺 nh薾 頲 "..nPoint.." 甶觤 c玭g lao");
end;

function supply_somekind_material()
	local selTab = {};
    for index, value in material_table do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            tinsert(selTab,value[4].."/#supply_material_ok("..index..")");
        end;
    end;
    tinsert(selTab,"Ta suy ngh? l筰/supply_material");
    Say("<color=green>S? gi? ho箃 ng<color>: Ngi mu鑞 n閜 nguy猲 li謚 n祇?",getn(selTab),selTab);	
end;

function supply_material_ok(index)
    --给予奖励
    local szSay = {
    	"S? gi? ho箃 ng: M鏸 nguy猲 li謚 i 頲 1 甶觤 c玭g lao, ngi mu鑞 n閜 bao nhi猽?",
    	"1 /#once("..index..", 1)",
    	"10 /#once("..index..", 10)",
    	"50/#once("..index..", 50)",
    	"100 /#once("..index..", 100)",
    	"N閜 h誸/#once_all("..index..")",
    	"Ta ch璦 mu鑞 giao/end_say"
    };
    SelectSay(szSay);
end;

function once(index, nPoint)
	local nCount = POINT_PER_MATERIALS * nPoint;
	local szTalk = {
		"S? gi? ho箃 ng: Ngi kh玭g c遪 nguy猲 li謚  n閜!"
	};
	if GetItemCount(material_table[index][1], material_table[index][2], material_table[index][3]) < nPoint then
		TalkEx("", szTalk);
		return
	end;
    DelItem(material_table[index][1], material_table[index][2], material_table[index][3], nPoint);
    AddPlayerPoint(nCount);
    Msg2Player("B筺 nh薾 頲 "..nCount.." 甶觤 c玭g lao");
end;

function once_all(index)
	local nCount = POINT_PER_MATERIALS * GetItemCount(material_table[index][1], material_table[index][2], material_table[index][3]);
	DelItem(material_table[index][1], material_table[index][2], material_table[index][3], nCount);
	AddPlayerPoint(nCount);
    Msg2Player("B筺 nh薾 頲 "..nCount.." 甶觤 c玭g lao");
end;

function calculate_exp()
    local nLevel = GetLevel();
    local nExpTableIndex = 0;
	local tExpTable = {5,8,10,15,30,60,90};
	if nLevel >=1 and nLevel <= 30 then
		nExpTableIndex = 1;
	elseif nLevel >=31 and nLevel <= 40 then
		nExpTableIndex = 2;
	elseif nLevel >=41 and nLevel <= 50 then
		nExpTableIndex = 3;
	elseif nLevel >=51 and nLevel <= 60 then
		nExpTableIndex = 4;
	elseif nLevel >=61 and nLevel <= 70 then
		nExpTableIndex = 5;
	elseif nLevel >=71 and nLevel <= 80 then
		nExpTableIndex = 6;
	else
		nExpTableIndex = 7;
	end;
	return nLevel^2*tExpTable[nExpTableIndex]
end;

function get_award()
	local nCurPoint = QueryPoint();
	if nCurPoint < 240 then
		local nMaxExp = calculate_exp();
		local nGetExp = floor(nMaxExp*nCurPoint/240);
		local selTab1 = {
					"Ta mu鑞 d飊g 甶觤 An Bang мnh Qu鑓  i kinh nghi謒/get_cheap_exp",
					"Ta kh玭g mu鑞 i ph莕 thng/end_say",
					}
		Say("Hi謓 ngi c? <color=yellow>"..nCurPoint.."<color> 甶觤 An Bang мnh Qu鑓, c? th? i <color=yellow>"..nGetExp.."<color> 甶觤 kinh nghi謒, n誹 甶觤 An Bang > 240 甶觤 c? th? i ph莕 thng",getn(selTab1),selTab1);
	else
		local selTab2 = {"D飊g 240 甶觤 An Bang  i kinh nghi謒 v? ph莕 thng./award_240",
						 "Ta kh玭g mu鑞 i ph莕 thng/end_say",}
		Say("Ngi c? mu鑞 d飊g 甶觤 An Bang i ph莕 thng kh玭g? Trc khi i ph莕 thng xin ki觤 tra l筰 kho秐g tr鑞g trong h祅h trang.",
			getn(selTab2),
			selTab2)
	end;
end;

function get_cheap_exp()
	local nCurPoint = QueryPoint();
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	local selTab = {
				"Ta mu鑞 i/get_cheap_exp_confirm",
				"в ta suy ngh? l筰/end_say",
				}
	Say("Hi謓 ngi c? <color=yellow>"..nCurPoint.."<color> 甶觤 An Bang мnh Qu鑓, c? th? i <color=yellow>"..nGetExp.."<color> 甶觤 kinh nghi謒. N誹 甶觤 An Bang nhi襲 h琻 <color=yellow>240<color> 甶觤, c? th? i 頲 ph莕 thng gi? tr?. Nh璶g l莕 i n祔 c騨g 頲 t輓h v祇 s? l莕 i qu? trong ng祔, (m鏸 ng祔 ch? i 頲 3 l莕) ngi ng ? ch??",getn(selTab),selTab);
end;

function get_cheap_exp_confirm()
	local nCurPoint = QueryPoint();
	if nCurPoint <= 0 then
		Talk(1,"get_award","R蕋 ti誧 甶觤 An Bang c馻 ngi ch璦 . H穣 v? Чi T鑞g c鑞g hi課 th猰.");
		return 0;
	end
	if Add240Times() ~= 1 then	--失败
		Talk(1,"get_award","M鏸 ng祔 ch? i ph莕 thng 頲 3 l莕");
		return 0;
	end;
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	AddPlayerPoint(-nCurPoint);
	ModifyExp(nGetExp);
	Msg2Player("B筺 nh薾 頲 "..nGetExp.." 甶觤 kinh nghi謒");
end;

function award_240()
	if QueryPoint() < 240 then
		Talk(1,"get_award","R蕋 ti誧 甶觤 An Bang c馻 ngi ch璦 . H穣 v? Чi T鑞g c鑞g hi課 th猰.");
		return 0;
	end
	if Add240Times() ~= 1 then	--失败
		Talk(1,"get_award","M鏸 ng祔 ch? i ph莕 thng 頲 3 l莕");
		return 0;
	end
	AddPlayerPoint(-240);	
	local nExpAward = calculate_exp()
	nExpAward = nExpAward + 100000
	ModifyReputation(random(7,15), 0)
	ModifyExp(nExpAward);
	Msg2Player("B筺 nh薾 頲 "..nExpAward.." 甶觤 kinh nghi謒");
	WriteLog("[Ho箃 ng cu鑙 tu莕]:"..GetName().."D飊g 240 甶觤 An Bang i ph莕 thng")
end;

function query_offer()
    local nOffer = QueryPoint();
    Talk(1,"","S? gi? ho箃 ng: 觤 c玭g lao hi謓 t筰 l? <color=yellow>["..nOffer.."]<color>.");
end;

function introduce_detail()
    szSay = {
        "S? gi? ho箃 ng: Чi T鑞g tuy l韓 m筺h th鵦 ch蕋 lo筺 trong gi芻 ngo礽. T? l骳 S琻 H? X? T綾 xu蕋 hi謓, c竎 th? l鵦 ng蕀 ng莔 n鎖 d藋. Chi課 s? phng b綾 li猲 mi猲, Oa Kh蕌 nh﹏ c? h閕 x﹎ nh藀 v飊g bi觧. Binh l鵦 Чi T鑞g kh玭g  ch鑞g tr?! C? th? gi髉 nh 畊鎖 b鋘 ch髇g kh玭g?",
        "Th? 6: Trang b? qu﹏ l鵦/introduce_5",
        "Th? 7: Anh d騨g gi誸 ch/introduce_6",
        "Ch? Nh藅: Tinh v? kh竛g ch/introduce_7",
        "Ch? ?/introduce_inportant",
        "Ph莕 thng ho箃 ng/introduce_award",
        "H? th鑞g x璶g hi謚/introduce_title",
        "Hi觰 r錳!/end_say"
    };
    SelectSay(szSay);
end;

function GetCallBossItem()
	if QueryTimes() > 0 then
		Talk(1,"GiveCallBossItem","S? d鬾g ch髇g nh b筰 v? s? ngo筰 t閏.");
	end;
end;

function GiveCallBossItem()
	if g_probability(19, 100) then
		AddItem(boss_item_table[1][1], boss_item_table[1][2], boss_item_table[1][3],1,1);
	elseif g_probability(39, 100) then
		AddItem(boss_item_table[2][1], boss_item_table[2][2], boss_item_table[2][3],1,1);
	elseif g_probability(59, 100) then
		AddItem(boss_item_table[3][1], boss_item_table[3][2], boss_item_table[3][3],1,1);
	elseif g_probability(74, 100) then
		AddItem(boss_item_table[4][1], boss_item_table[4][2], boss_item_table[4][3],1,1);
	elseif g_probability(84, 100) then
		AddItem(boss_item_table[5][1], boss_item_table[5][2], boss_item_table[5][3],1,1);
	elseif g_probability(89, 100) then
		AddItem(boss_item_table[6][1], boss_item_table[6][2], boss_item_table[6][3],1,1);
	elseif g_probability(94, 100) then
		AddItem(boss_item_table[7][1], boss_item_table[7][2], boss_item_table[7][3],1,1);
	elseif g_probability(97, 100) then
		AddItem(boss_item_table[8][1], boss_item_table[8][2], boss_item_table[8][3],1,1);
	else
		AddItem(boss_item_table[9][1], boss_item_table[9][2], boss_item_table[9][3],1,1);
	end;
	--减一轮
	AddKillWkTimes(-1);
	ModifyReputation(2, 0);	--2点声望
end;

function introduce_5()
	local szTalk = {
		"S? gi? ho箃 ng: Ho箃 ng t? 19h-24h<enter>1) Ngi ch琲 h鋍 k? n╪g ch? t筼 c? th? n s? ph? tng 鴑g h鋍 ph鑙 ch?. <enter>2) Qu? tr譶h nh qu竔 nh薾 頲 c竎 lo筰 nguy猲 li謚 qu﹏ d鬾g 甧m n閜 i 甶觤 c玭g lao. <enter>3) T輈h l騳 甶觤 c玭g lao n m閠 m鴆  s? nh薾 頲 c竎 x璶g hi謚. <enter>4) дn g苝 L? quan Bi謓 Kinh, Th祅h Й, Tuy襫 Ch﹗ d飊g 甶觤 c玭g lao i ph莕 thng*2 m鏸 ng祔 ch? c? 3 c? h閕 nh薾, c? th? l鵤 ch鋘."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_6()
	local szTalk = {
		"S? gi? ho箃 ng: Ho箃 ng t? 19h- 24h <enter>1) Цnh qu竔 nh薾 頲 c竎 lo筰 nguy猲 li謚 qu﹏ d鬾g. <enter>2) D飊g k? n╪g h鋍 頲 甧m c竎 lo筰 nguy猲 li謚 qu﹏ d鬾g l祄 th祅h ph萴. <enter>3) Mang qu﹏ d鬾g n i tho筰 v韎 S? gi? ho箃 ng ? Bi謓 Kinh, Tng Dng ho芻 Dng Ch﹗ m? nhi謒 v? chuy觧 v藅 t?. <enter>4) Theo tuy課 阯g ch? nh mang v藅 t? giao cho Ch? huy s? nh薾 25 甶觤 c玭g lao v? c? h閕 ra ti襫 tuy課 gi誸 Oa Kh蕌."
	};
	TalkEx("introduce_6_next", szTalk);
end;

function introduce_6_next()
	local szTalk = {
		"5) V祇 khu v鵦 Oa Kh蕌 trong 30 ph髏 ti猽 di謙 50 t猲. Sau  t? ng tho竧 kh醝 khu v鵦 n Ch? huy s? nh薾 b秓 v藅 Чi T鑞g. <enter>6) D飊g b秓 v藅 Чi T鑞g g鋓 v? s? ngo筰 t閏, nh b筰 c? c? h閕 nh薾 頲 m秐h tranh b竧 qu竔. <enter>7) b秓 v藅 Чi T鑞g kh竎 nhau tng 鴑g v韎 ng c蕄 v? s? ngo筰 t閏. <enter>8) D飊g m秐h tranh b竧 qu竔 s? c? ch? d蒼, theo ch? d蒼 t譵 kho b竨."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_7()
	local szTalk = {
		"S? gi? ho箃 ng: Ho箃 ng t? 14h-22h <enter>1) Kh玭g r韙 nguy猲 li謚 qu﹏ d鬾g, c遪 l筰 gi鑞g th? 7."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_inportant()
	local szTalk = {
		"S? gi? ho箃 ng: Ho箃 ng t? 19h-24h th? 6, th? 7, Ch? Nh藅 t? 14h-22h. Nh鱪g gi? kh竎 kh玭g th? tham gia ho箃 ng. C竎 nguy猲 li謚 qu﹏ i c莕 ch? r琲 v祇 t鑙 th? 6, th? 7. <enter>H鋍 ph鑙 ch?, ch? t筼 qu﹏ d鬾g th祅h ph萴 v? d飊g 甶觤 c玭g lao i ph莕 thng di詎 ra t? th? 6 n Ch? Nh藅. <enter>X璶g hi謚 d鵤 theo 甶觤 c玭g lao hi謓 t筰. <enter> фi 甶觤 c玭g lao m鏸 tu莕 u x鉧, kh玭g th? t輈h l騳."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_award()
	local szTalk = {
		"S? gi? ho箃 ng: Ph莕 thng ho箃 ng phong ph?! M? h? th鑞g ngo筰 trang, c竎 trang b? cao c蕄, B╪g th筩h v? Thi猲 th筩h, Ng? h祅h th筩h th莕 b?, c玭g c? Ho祅g Kim! Ch? c莕 gi髉 Чi T鑞g nh 畊鎖 Oa Kh蕌 l? c? c? h閕 nh薾 頲."
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_title()
	local szTalk = {
		"S? gi? ho箃 ng: M? trc h? th鑞g x璶g hi謚! Hi謕 kh竎h di謙 Oa, n? hi謕 di謙 Oa, ti猲 phong di謙 Oa, d騨g s? di謙 Oa, tinh anh di謙 Oa, anh h飊g di謙 Oa, danh tng di謙 Oa, ch? huy s? di謙 Oa, i tng qu﹏ di謙 Oa, t鎛g nguy猲 so竔 di謙 Oa."
	};
	TalkEx("introduce_detail", szTalk);
end;

function goto_liguan()
	local szTalk = {
		"S? gi? ho箃 ng: M阨 n L? quan Bi謓 Kinh, Th祅h Й ho芻 Tuy襫 Ch﹗ nh薾 ph莕 thng tng 鴑g."
	};
	TalkEx("", szTalk);
end;

function end_say()

end;