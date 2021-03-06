--Create Date:2007年第二天
--Describe:０７年春节雪仗传送人脚本（传进传出）
--Author:yanjun
Include("\\script\\online\\春节活动\\snowwar\\snowwar_head.lua");
--==============================================进入部分===================================
function snowwar_enter_main()
        local nDate = tonumber(date("%y%m%d"));
	local strSex = gf_GetPlayerSexName();
	if nDate < 091218 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: M蕐 h玬 nay tuy誸 ch璦 r琲 n猲 khu n衜 tuy誸 ch璦 th? m?"..strSex.."l莕 sau quay l筰 nh?!");
		return 0;
	elseif nDate > 100117 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xu﹏ n hoa n?, tuy誸 b総 u tan, e r籲g kh玭g th鵦 hi謓 頲 k? ho筩h r錳."..strSex.."N╩ t韎 c竎 v? nh? n y ch琲 ti誴 nh?!");
		return 0;
	end;
	local MapID, nX, nY = GetWorldPos()
	if MapID ~= 300 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:Khu v鵦 n衜 tuy誸 ch? m? ? Th祅h Й!");
		return 0;
	end	
	local selTab = {
				"H穣 mau a ta n !/go",
				"T譵 hi觰 ho箃 ng./SW_KnowSnowWar",
				"Ta  qua tu鎖 n祔 r錳 ?!/nothing"
				}
	Say("<color=green>"..g_sNpcName.."<color>: V? "..strSex.."l? n祇 kh玭g mu鑞 nh﹏ c? h閕 ch琲 a th醓 th輈h m閠 l莕 hay sao?",getn(selTab),selTab)	
end

function go()
	local strSex = gf_GetPlayerSexName();
	local nFieldID = SW_GetFieldIDFromMapID(g_CurMapID);
	if GetPlayerRoute() == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: V? "..strSex.."<color=yellow>gia nh藀 m玭 ph竔<color> m韎 頲 tham gia n衜 tuy誸.");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: V? "..strSex.."ьi n c蕄 <color=yellow>11<color> r錳 h穣 quay l筰 nh?!");
		return 0;
	end;
	if mf_GetPlayerCount(MISSION_ID,nFieldID) > MAX_PLAYER then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: S? ngi v祇 khu n衜 tuy誸  , xin"..strSex.."i m閠 ch髏 nh?!");
		return 0;
	end;
	if SW_CheckEquipment() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: в cho c玭g b籲g, xin m鋓 ngi t筸 th阨 kh玭g s? d鬾g t蕋 c? Trang B?");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nFieldID) == MS_STATE_PEACE then
		--mf_OpenMission(MISSION_ID,nFieldID)
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Th阨 gian n衜 tuy誸 v蒼 ch璦 n, m鏸 ng祔 khu n衜 tuy誸 s? ho箃 ng v祇 c竎 gi? 11, 17, v? 21 gi?.");
		return 0;
	end;
	mf_JoinMission(MISSION_ID,0,nFieldID);
end;
--==============================================离开部分===================================
function snowwar_leave_main()
	local selTab = {
			"Ta mu鑞 r阨 kh醝 khu n衜 tuy誸/leave",
			"Ta mu鑞 d飊g 甶觤 t輈h l騳 i ph莕 thng/want_award",
			"Ta mu鑞 mua tuy誸 c莡./buysnowball",
			"Xem 甶觤 t輈h l騳/see_my_point",
			"Xem s? ngi b? ta n衜 ng?/see_rank",
			"Ta qu猲 c竎h ch琲 r錳, h穣 n鉯 l筰 l莕 n鱝./SW_KnowSnowWar",
			"Th藅 v蕋 v? cho ngi!/nothing"
			}
	if GetMissionV(MV_FIELD_STATE) ~= MS_STATE_COMPLETE then
		tremove(selTab,1);
		tremove(selTab,1);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ch琲 vui kh玭g? C? c莕 ta gi髉 g? kh玭g?",getn(selTab),selTab)
end;

function see_my_point()
	Talk(1,"main","<color=green>"..g_sNpcName.."<color>: 觤 t輈h l騳 c馻 b筺 hi謓 l? <color=yellow>"..GetTask(PT_POINT).."<color>");
end;

function leave()
	local selTab = {
			"R阨 kh醝/leave_confirm",
			"Ch璦 mu鑞 r阨 kh醝/nothing",
			}
	local sSayContent = "Ch? ?, sau khi th阨 gian n衜 tuy誸 k誸 th骳. <color=yellow>n閕 trong 20 ph髏<color> c? th? n g苝 <color=yellow>Tuy誸 Gi?<color>  nh薾 ph莕 thng. ng l穘g ph? 甶觤 t輈h l騳. Ngi mu鑞 r阨 kh醝 ch??";
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_FIGHT then
		sSayContent = "Th阨 gian n衜 tuy誸 k誸 th骳, ngi c? th? d飊g 甶觤 t輈h l騳 n衜 tuy誸  i ph莕 thng. C? mu鑞 i ph莕 thng kh玭g?";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: "..sSayContent,getn(selTab),selTab);
end;

function leave_confirm()
	DelMSPlayer(MISSION_ID,0);
end

function buysnowball()
	Sale(52)
end

function want_award()
	local selTab = {
			"Ta mu鑞 i ph莕 thng/get_award",
			"Quay l筰 nh薾 sau/nothing",
			}
	local nPoint = GetTask(PT_POINT);
	local nExp = 0;
	if nPoint > LIMIT_POINT then
		nPoint = LIMIT_POINT;
	end;
	if nPoint < 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ngi c? t蕋 c? <color=yellow>"..nPoint.."<color> 甶觤. Th藅 ng ti誧! 觤 t輈h l騳 kh玭g  kh玭g th? nh薾 甶觤 kinh nghi謒.");
		return 0;
	end;
	nExp = nPoint * 45000;
	Say("<color=green>"..g_sNpcName.."<color>: Ngi c? t蕋 c? <color=yellow>"..nPoint.."<color> 甶觤 t輈h l騳, c? th? i <color=yellow>"..nExp.."<color> 甶觤 kinh nghi謒, ngi c? mu鑞 i kh玭g?",getn(selTab),selTab);
end;

function get_award()
	local nPoint = GetTask(PT_POINT);
	local nExp = 0;
	if nPoint > LIMIT_POINT then
		nPoint = LIMIT_POINT;
	end;
	if nPoint < 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ngi c? t蕋 c? <color=yellow>"..nPoint.."<color> 甶觤. Th藅 ng ti誧! 觤 t輈h l騳 kh玭g  kh玭g th? nh薾 甶觤 kinh nghi謒.");
		return 0;
	end;
	SetTask(PT_POINT,0);
	nExp = nPoint * 45000
	ModifyExp(nExp)
	Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
	WriteLogEx("Hoat dong thang 12","i 甶觤 n衜 tuy誸", nExp, "甶觤 kinh nghi謒")
end;

function see_rank()
	Talk(1,"main","<color=green>"..g_sNpcName.."<color>: b筺  n衜 ng? <color=yellow>"..GetTask(PT_KILL_COUNT).."<color> ngi, b? ng?<color=yellow>"..GetTask(PT_DEATH_COUNT).."<color> l莕.");
end;
--=========================================================================================
