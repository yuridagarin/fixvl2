--filename:quartermaster_npc.lua
--create date:2006-06-05
--describe:粮草争夺战场中双方军需官脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nNpcCamp = 0;
	if nNpcName == "M? Lng Quan-T鑞g" then
		nNpcCamp = SONG_ID;
	else
		nNpcCamp = LIAO_ID;
	end;
	local nCamp = BT_GetCamp();
	if nCamp ~= nNpcCamp then	--如果玩家的阵营与NPC阵营不同
		Talk(1,"","<color=green>"..nNpcName.."<color>: To gan! D竚 t nh藀 v祇 y, ngi u b総 l蕐 h緉!");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("<color=green>"..nNpcName.."<color>: Lng th秓  頲 chuy觧 ra ti襫 tuy課, l莕 sau nh? n閜 s韒 nh?!",0);
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local selTab = {
			"N閜 to祅 b? lng th秓/#handin(0)",
			"N閜 lng th秓-s? c蕄 ("..nResourceCount1.." ph莕)/#handin(1)",
			"N閜 lng th秓-trung c蕄 ("..nResourceCount2.." ph莕)/#handin(2)",
			"N閜 lng th秓-cao c蕄 ("..nResourceCount3.." ph莕)/#handin(3)",
			"N閜 Huy襫 thi誸 kho竛g th筩h ("..nStoneCount.." ph莕)/handin_stone",
			"Nh薾 cu鑓/get_hoe",
			"tr? l筰"..tCampNameZ[nCamp].."_h藆 doanh/back_to_home",
			"ng thu th藀/nothing"
			}
	Say("<color=green>"..nNpcName.."<color>: Th阨 gian g蕄 b竎h, mau giao n閜 lng th秓.",getn(selTab),selTab);
end;

function handin(nType)
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nResourceCount1 = GetItemCount(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4]);
	local nResourceCount2 = GetItemCount(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4]);
	local nResourceCount3 = GetItemCount(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4]);
	if nType == 0 and nResourceCount1 == 0 and nResourceCount2 == 0 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ngi kh玭g mang theo lng th秓, mau 甶 t譵 v? y!")
		return 0;
	elseif nType == 1 and nResourceCount1 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ngi kh玭g mang theo lng th秓-s? c蕄, mau 甶 t譵 v? y!")
		return 0;
	elseif nType == 2 and nResourceCount2 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ngi kh玭g mang theo lng th秓-trung c蕄, mau 甶 t譵 v? y!")
		return 0;
	elseif nType == 3 and nResourceCount3 == 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ngi kh玭g mang theo lng th秓-cao c蕄, mau 甶 t譵 v? y!")
		return 0;
	end;
	local nBattlePoint = 0;	--粮草数量
	local nPersonalPoint = 0;
	local str1 = "";
	local str2 = "";
	local str3 = "";
	if nType == 0 or nType == 1 then
		if nResourceCount1 > 0 then
			if DelItem(tBattleItem[1][2],tBattleItem[1][3],tBattleItem[1][4],nResourceCount1) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES1]*nResourceCount1;
				str1 = "Lng th秓-s? c蕄"..nResourceCount1.." ph莕,";
			end;
		end;
	end;
	if nType == 0 or nType == 2 then
		if nResourceCount2 > 0 then
			if DelItem(tBattleItem[2][2],tBattleItem[2][3],tBattleItem[2][4],nResourceCount2) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES2]*nResourceCount2;
				str2 = "Lng th秓-trung c蕄"..nResourceCount2.." ph莕,";
			end;
		end;
	end;
	if nType == 0 or nType == 3 then
		if nResourceCount3 > 0 then
			if DelItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],nResourceCount3) == 1 then
				nBattlePoint = nBattlePoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				nPersonalPoint = nPersonalPoint + tBPEven[BP_RESOURCE_HAND_IN_RES3]*nResourceCount3;
				str3 = "Lng th秓-cao c蕄"..nResourceCount3.." ph莕,";
			end;
		end;
	end;
	local nProbability = 0;
	if nBattlePoint <= 19 then
		nProbability = 0;
	elseif nBattlePoint <= 79 then
		nProbability = 1;				
	else
		nProbability = 3;
	end;
	BT_EmperorAward(nProbability);
	local nCamp = BT_GetCamp();
	Add_Resource(nCamp,nBattlePoint);
	BT_SetData(PT_HANDIN_RESOURCE,BT_GetData(PT_HANDIN_RESOURCE)+nBattlePoint);
	BT_AddPersonalPoint(nPersonalPoint);
	Talk(1,"","<color=green>"..nNpcName.."<color>: Giao n閜 <color=yellow>"..str1..str2..str3.."<color> gi髉 phe m譶h t╪g th猰 <color=yellow>"..nBattlePoint.."<color> 甶觤 t輈h l騳. T鎛g 甶觤 t輈h l騳 <color=yellow>"..Get_ResCount(nCamp).."<color>");
	Msg2MSGroup(MISSION_ID,GetName().." N閜"..str1..str2..str3.."觤 t輈h l騳 hi謓 t筰"..Get_ResCount(nCamp),nCamp);
end;

function get_hoe()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	if BigGetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) > 0 then
		Talk(1,"","<color=green>"..nNpcName.."<color>: Ngi kh玭g ph秈 c? c﹜"..tBattleItem[4][1].."? N誹 kh玭g mang theo th? mau chu萵 b?, th阨 gian kh玭g c遪 nhi襲!");
	else
		if AddItem(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4],1) == 1 then
			BT_SetData(PTNC_USE_HOE_TIMES,0);
			Msg2Player("B筺 nh薾 頲 1 "..tBattleItem[4][1]);
		end;
	end;
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;

function handin_stone()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>: H譶h nh? ngi kh玭g mang theo Huy襫 thi誸 kho竛g th筩h.");
	else
		local selTab = {
					"Ta mu鑞 n閜/handin_stone_confirm",
					"Chuy謓 s琻 t芻 u m鬰/know_cateran_header",
					"Ta suy ngh? l筰!/main",
					}
		Say("<color=green>"..nNpcName.."<color>: Ngi th藅 s? mu鑞 n閜 t蕋 c? Huy襫 thi誸 kho竛g th筩h (<color=yellow>"..nStoneCount.."<color> vi猲)? Nghe n鉯 s琻 t芻 u m鬰 r蕋 th輈h ch髇g.",getn(selTab),selTab);
	end;
end;

function handin_stone_confirm()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nStoneCount = GetItemCount(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4]);
	local nBattlePoint = tBPEven[BP_RESOURCE_HAND_STONE_QM]*nStoneCount;
	if nStoneCount <= 0 then
		Talk(1,"main","<color=green>"..nNpcName.."<color>: H譶h nh? ngi kh玭g mang theo Huy襫 thi誸 kho竛g th筩h.");
	else
		if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],nStoneCount) == 1 then
			BT_AddPersonalPoint(nBattlePoint);	--这里暂不使用BT_AddBattleEvenPoint
			Add_Resource(nCamp,nBattlePoint);
		end;
	end;
end;

function know_cateran_header()
	local nNpcName = GetTargetNpcName();
	if nNpcName == nil then
		return 0;
	end;
	Talk(1,"main","<color=green>"..nNpcName.."<color>: S琻 t芻 u m鬰 c騨g 產ng thu th藀 Huy襫 thi誸 kho竛g th筩h, nghe n鉯 y c? nhi襲 m鉵 b秓 b鑙, b籲g h鱱 c? th? n t譵 h緉.");
end;