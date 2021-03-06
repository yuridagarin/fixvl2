--filename:maingeneral_npc.lua
--create date:2006-06-27
--describe:主战场中双方主将脚本
Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

sSongGeneral = "Dng Nghi謕";
sLiaoGeneral = "Gia Lu藅 H璾 C竎h";

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch箉 th玦! L鯽 k衞 n n琲 r錳!");
	end;
	local selTab = {
			"B鑙 c秐h/knowbackground",
			"Quy t綾 chi課 trng/knowbattlerule",
			"B鎛 So竔 mu鑞 tri謚 t藀 chi課 th莕 ph? v遪g v﹜ qu﹏ ch/summon_god_of_war",
			"K誸 th骳 i tho筰/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: Th阨 gian quy誸 chi課  n, ta t? h祇 c竎 tng s? tham gia tr薾 chi課 ng祔 h玬 nay.",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	local sEnemyCampName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		sEnemyCampName = "Li猽";
	else
		sNpcName = sLiaoGeneral;
		sEnemyCampName = "T鑞g";
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh筺 M玭 Quan a th? hi觤 tr? v韎 nhi襲 阯g nh? th玭g su鑤. Ba h醓 ph竜 tr猲 nh c? th? kh鑞g ch? to祅 c鬰 di謓. Ch輓h gi鱝 chi課 trng l? n琲 d﹏ l祅g tu t藀, c? r蕋 nhi襲 甶觤 t礽 nguy猲 v? n筺 d﹏, n誹 kh玭g ch? 頲 h? ta tin n緈 ch綾 ph莕 th緉g. C竎 v? c? g緉g l猲!");
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Trong th阨 gian chi課 u gi誸 頲 ch? so竔 xem nh? chi課 th緉g; <enter>2: H誸 th阨 gian, ch璦 gi誸 頲 s? d鵤 v祇 甶觤 t輈h l騳 c玭g c閚g quy誸 nh, s? 甶觤 b籲g nhau xem nh? h遖.<enter>3: T輈h l騳 t鑙 產 <color=yellow>"..POINT_LIMITED.."<color><enter>4: Nh薾 頲 <color=yellow>"..EMPEROR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v筺<enter>5: Л頲 b莡 l祄 Ng玦 sao chi課 trng+甶觤 t輈h l騳 <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> 甶觤  甶觤 t輈h l騳, kinh nghi謒 <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v筺");
end;
