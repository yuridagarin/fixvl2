Include("\\script\\结婚\\marriage_head.lua");

COST_BLESS 		= 18			--祝福所需价钱（18金）

	
CALLBACK_FILE	= "\\script\\结婚\\npc\\喜娘.lua"		-- 回调文件名

this_date 		= 0		-- 日期
this_period 	= 0		-- 时段
this_bridegroom = ""	-- 新郎
this_bride		= ""	-- 新娘
g_inited = 0;

g_InfoHeader = "<color=green>H? Nng<color>:";

function main()
	if (this_date ~= curr_date() or this_period ~= curr_period()) or g_inited == 0 then
		init()
		return
	end
	-- 不同身份的人看到的对话不同
	local caption = g_InfoHeader.."ng qu? lo l緉g, m鋓 vi謈  c? H? nng y lo li謚"
	local name = GetName()
	local selTab = {};
	local selCount = 0;
	if (is_compere() == 1 or is_field_owner() == 1) then
		selCount = selCount + 1;
		selTab[selCount] = "Ta mu鑞 c? h祅h h玭 l?/have_wedding";
		selCount = selCount + 1;
		selTab[selCount] = "Ta mu鑞 b祔 ti謈 ru/feast";
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "Ta mu鑞 ch骳 m鮪g t﹏ lang, t﹏ nng!/#bless(1)";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		if GetFightState() == 1 then
			selTab[selCount] = "Hi謓 kh玭g mu鑞 xu蕋 chi猽/changefightstate";
		else
			selTab[selCount] = "Kh竎h n ng qu?/changefightstate";
		end;
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "H錸g bao t苙g cho i uy猲 ng/give_present";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		selTab[selCount] = " t? H? nng  thay ta nh薾 H錸g bao, b﹜ gi? c? th? cho ta xin l筰./get_present";	
	end;
	selCount = selCount + 1;
	selTab[selCount] = "Kh玭g c? vi謈 g?/cancel";
	Say(caption,getn(selTab),selTab);
end
--是不是场地的主人
function is_field_owner()
	local name = GetName()
	if name == GetMissionS(MS_BRIDEGROOM) or name == GetMissionS(MS_BRIDE) then
		return 1;
	else
		return 0;
	end;
end;

function give_present()
	local selTab = {
			"T苙g "..ITEM_HONGBAO[1][4].."1/#give_present_confirm(1)",
			"T苙g "..ITEM_HONGBAO[2][4].."1/#give_present_confirm(2)",
			"T苙g "..ITEM_HONGBAO[3][4].."1/#give_present_confirm(3)",
			"в ta xem/cancel",
			}
	Say(g_InfoHeader.."Kh玭g bi誸 i hi謕 mu鑞 t苙g lo筰 H錸g bao n祇?",getn(selTab),selTab);
end;

function give_present_confirm(nType)
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		Talk(1,"",g_InfoHeader.."Ngi  c? l遪g, nh璶g ti誧 l? h玭 l?  k誸 th骳, hay l? t薾 tay trao cho h? v藋 nh?!");
		return 0;
	end;
	if DelItem(ITEM_HONGBAO[nType][1],ITEM_HONGBAO[nType][2],ITEM_HONGBAO[nType][3],1) == 1 then
		Say(g_InfoHeader.." t? i hi謕, ta s? chuy觧 cho h?.",0);
		Msg2MSAll(MISSION_ID,GetName().."G鰅 cho i uy猲 ng"..ITEM_HONGBAO[nType][4].."1");
		local nCurrHongBao = GetMissionV(MV_DAHONGBAO_COUNT+nType-1);
		SetMissionV(MV_DAHONGBAO_COUNT+nType-1,nCurrHongBao+1)
		WriteLog("[K誸 h玭]:"..GetName().."H錸g bao, lo筰:"..nType);
	else
		Talk(1,"",g_InfoHeader.."Ngi kh玭g mang theo"..ITEM_HONGBAO[nType][4].."? Hay l? b蕋 c萵 l祄 r琲 u r錳?");
	end;
end;

function get_present()
	if GetSex() == 2 then
		Talk(1,"",g_InfoHeader.."T﹏ nng mang nhi襲 h錸g bao nh? v藋 kh玭g an to祅, hay l? i t﹏ lang n");
		return 0;
	end;
	local selTab = {
			"уng ?/get_present_confirm",
			"Ta s? l穘h sau v藋!/cancel",
			}
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	local sString = "";
	if nDaHongBao > 0 then
		sString = sString..nDaHongBao.." Чi h錸g bao Ho祅g Kim,"
	end;
	if nZhongHongBao > 0 then
		sString = sString..nZhongHongBao.." Чi h錸g bao T? Kim,"
	end;
	if nXiaoHongBao > 0 then
		sString = sString..nXiaoHongBao.." H錸g bao,"
	end;
	if sString == "" then
		Talk(1,"main",g_InfoHeader.."V蒼 ch璦 nh薾 頲 H錸g bao.");
		return 0;
	end;
	Say(g_InfoHeader.."T蕋 c? s? H錸g bao u ? y, c? t蕋 c?"..sString.."Ngi l蕐 h誸 s? H錸g bao ch??",getn(selTab),selTab);
end;

function get_present_confirm()
	if gf_JudgeRoomWeight(4,5) == 0 then
		Talk(1,"",g_InfoHeader.."Kho秐g tr鑞g trong h祅h trang kh玭g !");
		return 0;
	end;
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	SetMissionV(MV_DAHONGBAO_COUNT,0);
	SetMissionV(MV_ZHONGHONGBAO_COUNT,0);
	SetMissionV(MV_XIAOHONGBAO_COUNT,0);
	if nDaHongBao > 0 then
		AddItem(ITEM_HONGBAO[1][1],ITEM_HONGBAO[1][2],ITEM_HONGBAO[1][3],nDaHongBao);
		WriteLog("[K誸 h玭]:"..GetName().."Nh薾 頲"..nDaHongBao.." Чi h錸g bao Ho祅g Kim");
		Msg2Player("B筺 nh薾 頲 "..nDaHongBao.."c竔"..ITEM_HONGBAO[1][4]);
	end;
	if nZhongHongBao > 0 then
		AddItem(ITEM_HONGBAO[2][1],ITEM_HONGBAO[2][2],ITEM_HONGBAO[2][3],nZhongHongBao);
		WriteLog("[K誸 h玭]:"..GetName().."Nh薾 頲"..nZhongHongBao.." Чi h錸g bao T? Kim");
		Msg2Player("B筺 nh薾 頲 "..nZhongHongBao.."c竔"..ITEM_HONGBAO[2][4]);
	end;
	if nXiaoHongBao > 0 then
		AddItem(ITEM_HONGBAO[3][1],ITEM_HONGBAO[3][2],ITEM_HONGBAO[3][3],nXiaoHongBao);
		WriteLog("[K誸 h玭]:"..GetName().."Nh薾 頲"..nXiaoHongBao.." Ti觰 h錸g bao");
		Msg2Player("B筺 nh薾 頲 "..nXiaoHongBao.."c竔"..ITEM_HONGBAO[3][4]);
	end;
end;
--转换状态
function changefightstate()
	local tMsg = {"H玬 nay l? ng祔 i h? c馻 2 v?, h穣 hng h筺h ph骳, xin ng ng th?.",
				"Kh玭g h? l? giang h? n? nhi, cho c竎 v? quan kh竎h n祔 th蕐 t礽 v? ngh? 甶",
				}
	SetFightState(1-GetFightState());
	Say(g_InfoHeader..tMsg[GetFightState()+1],0);
end

function init()
	local mapid, x, y = GetWorldPos()
	local param2 = encode_param2(curr_period(), map_field2type[mapid])
	ApplyRelayShareData(KEY_WEDDING, curr_date(), param2, CALLBACK_FILE, "hook_recvsubs")
	WriteLog("[K誸 h玭]: H? nng s﹏ kh蕌 k誸 h玭, tham s? 1:"..curr_date()..", tham s? 2:"..param2);
end

-- 回调函数：读取场地预订信息
function hook_recvsubs(key, param1, param2, count)
	-- 该场地该时段空闲
	if (count ~= 0) then
		this_date = param1
		local this_period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		SetMissionS(MS_BRIDEGROOM,role)
		SetMissionS(MS_BRIDE,wife)
		this_bridegroom = role;
		this_bride = wife;
	end
	this_date = curr_date()
	this_period = curr_period()
	g_inited = 1;
	map_talk = {
		{
			"Йi phu th? bc v祇 s秐h 阯g, kh玭g kh? t璶g b鮪g h糿 l猲.",
			"H玬 nay l? ng祔 i h? c馻 i t﹏ nng v? t﹏ lang!  t? c竎 v?  n ch骳 m鮪g."
		},
		{
			"T﹏ nng s緋 l猲 ki謚 hoa, h穣 t ph竜 l猲!",
			"чi kh╪ ~t ph竜!"
		},
		{
			"T﹏ nng v? t﹏ lang n kh竎h, bu鎖 ti謈 s緋 b総 u!",
			"M阨 c竎 v? v祇 b祅 nh藀 ti謈!"
		},
		{
			"T﹏ lang v? t﹏ nng s緋 b竔 thi猲 a, chu萵 b? ph竜 v? l? hoa",
			"Xin c竎 v? quan kh竎h chu萵 b? ph竜 v? l? hoa ch骳 ph骳 cho i t﹏ t﹏ lang v? t﹏ nng!"
		},
		{
			"M阨 quan kh竎h ╪ k裲 m鮪g!",
			"Ch骳 cho t﹏ lang v? t﹏ nng u b筩 r╪g long. Ch骳 cho nh鱪g ngi ch璦 y猽 g苝 頲 ngi trong m閚g!"
		},
		{
			"L骳 n祔 c竎 v? quan kh竎h c? th? g鰅 qu? t苙g cho t﹏ phu th?!",
			"Qu? l韓, qu? nh? c騨g u l? l遪g th祅h c?. Xin 產 t? c竎 v?  n d?!"
		},
		{
			"H玭 l? k誸 th骳! T﹏ lang v? t﹏ nng chu萵 b? ng ph遪g!",
			"T﹏ lang, t﹏ nng v祇 ph遪g hoa ch骳~"
		},
	}
	main()
	WriteLog("[K誸 h玭]: S﹏ kh蕌 k誸 h玭 k誸 th骳, tham s? 1:"..param1..", tham s? 2:"..param2);
end

-- 获取婚礼场地上新婚夫妇的名字
function get_couple()
	return GetMissionS(MS_BRIDEGROOM), GetMissionS(MS_BRIDE)
end


function have_wedding()
	Say(g_InfoHeader.."Theo ngi x璦 nghi th鴆 h玭 l? g錷 c竎 bc sau:",
		8,
		"Nghinh th﹏/#wedding_process(1)",
		"Tam s竧/#wedding_process(2)",
		"чi kh╪/#wedding_process(3)",
		"b竔 thi猲 a/#wedding_process(4)",
		"Th竜 kh╪/#wedding_process(5)",
		"T苙g v祅g/#wedding_process(6)",
		"чng ph遪g/#wedding_process(7)",
		"Thuy誸 minh/wedding_process_info",
		"Trang trc./main")
end

function wedding_process(step)
	Say(g_InfoHeader..map_talk[step][1],
		2,
		format("уng ?/#confirm(%d)", step),
		"H駓 b?/cancel")
end

function confirm(step)
	if step == 4 then	--拜天地
		SetMissionV(MV_CAN_MARRY,1);	--可以结婚了
	end;
	Msg2MSAll(MISSION_ID,map_talk[step][2])
end

--婚礼流程说明
function wedding_process_info()

local Talk_str = {
	g_InfoHeader.."<color=yellow>Nghinh th﹏<color> сn kh竎h v祇 s﹏ kh蕌 k誸 h玭, b籲g h鱱 c? th? n <color=yellow>D辌h v? h玭 nh﹏<color> mua <color=yellow>L? hoa<color>cho kh玭g kh? th猰 ph莕 h鴑g kh雐.",
	g_InfoHeader.."<color=yellow>Tam s竧<color> g錷 Thanh dng, ? k? v? Thanh ng璾. Tng truy襫 ch髇g thng c秐 阯g kh玭g cho ngi m韎 v祇 nh?, v? v藋 ph秈 <color=yellow>t ph竜<color>  xua 畊鎖 ch髇g",
	g_InfoHeader.."<color=yellow>чi kh╪<color> T﹏ nng i kh╪  tng tr璶g cho gi鱝 2 ngi  c? m鑙 d﹜ li猲 k誸 kh玭g th? l譨 xa.",
	g_InfoHeader.."<color=yellow>B竔 thi猲 a<color> в t? 琻 tr阨 t. Йi t﹏ lang, t﹏ nng t? nay s? s鑞g n u b筩 r╪g long, con ch竨 y n.",
	g_InfoHeader.."<color=yellow>Th竜 kh╪<color> Tng tr璶g cho t﹏ phu th? s? s韒 sinh qu? t?, cu閏 s鑞g h筺h ph骳, con c竔 th祅h t.",
	g_InfoHeader.."<color=yellow>T苙g ti襫 v祅g<color>, thng 頲  v祇 h錸g bao, mong mu鑞 cho i phu th? c? cu閏 s鑞g sung t骳. H錸g bao c? t觝 mua ? <color=yellow>D辌h v? h玭 nh﹏<color>",
	g_InfoHeader.."<color=yellow>чng ph遪g<color> nghi th鴆 sau c飊g trong h玭 l?.",	
	}
	
	Talk(getn(Talk_str),"",Talk_str);

end

map_bless = {
	"Thi猲 T竎 H頿", 
	"T﹎ t﹎ tng 竛h",
	"V躰h K誸 уng T﹎",
	"Tng Th﹏ Tng 竔",
	"B竎h Ni猲 H秓 H頿",
	"V躰h D鬰 竔 H?",
	"Giai Ng蓇 Thi猲 Th祅h",
	"B筩h u Giai L穙", 
	"B竎h Ni猲 C莔 S総", 
	"B竎h Ni猲 Giai L穙",
	"祅 t? sum v莥",
	"Ph骳 L閏 Uy猲 Μng",
	"Thi猲 duy猲 tr飊g h頿",
	"M? m穘 lng duy猲",
	"Trai t礽 g竔 s綾",
	"T﹎ u ? h頿",
	"Phu xng ph? t飝",
	"X鴑g i v鮝 l鴄",
	"Hoa th琺 tr竔 ng鋞",
	"C蕀 s総 h頿 minh",
	"Tng k輓h nh? t﹏",
	"уng c ng t﹎", 
	"Nh? c? c蕀 s総",
	"Hoa khai t辬h ",
	"д k誸 lng duy猲",
	"Duy猲 nh tam sinh",
	"Uy猲 uy猲 b輈h h頿",
	"V╪ мnh C竧 Tng",
	"Nh﹏ duy猲 tng ph鑙", 
	"B筩h th? th祅h c",
	"Minh k誸 lng duy猲"
}

function bless_talk(talk)
	Say(g_InfoHeader.."C? mu鑞 g鰅 l阨 ch骳 n i t﹏ phu th? kh玭g? H? th鑞g s? chuy觧 l阨 ch骳 c馻 b筺 l猲 d遪g th玭g b竜. Ch? c莕 t鑞 <color=red>"..COST_BLESS.."<color> ng﹏ lng. Xin ch鋘 c﹗ ch骳",
		getn(talk), talk)
end

STEP_COUNT = 8
function bless(step)
	local talk = {}
	local index = 0
	local from = floor((step - 1) * STEP_COUNT + 1)
	local to = floor(step * STEP_COUNT)
	if (to > getn(map_bless)) then
		to = getn(map_bless)
	end
	
	for i = from, to do
		index = index + 1
		talk[index] = format("%s/#process_bless(%d)", map_bless[i], i)
	end
	if (from ~= 1) then
		index = index + 1
		talk[index] = format("Trang trc/#bless(%d)", floor(step - 1))
	end
	if (to ~= getn(map_bless)) then
		index = index + 1
		talk[index] = format("Trang k?/#bless(%d)", floor(step + 1))
	end
	talk[index + 1] = "в ta ngh? l筰/cancel"
	
	bless_talk(talk)	
end

function process_bless(index)
	if (Pay(COST_BLESS*10000) ~= 1) then
		Talk(1, "", g_InfoHeader.."Ngi kh玭g  ng﹏ lng")
		return
	end
	local husband, wife = get_couple()
	Msg2MSAll(MISSION_ID,format("%s ch骳 %s v? %s%s",
		GetName(),
		husband,
		wife,
		map_bless[index]))
end

-- 酒席
function feast()
	local selTab = {
				"Xem m鉵 ╪ tr猲 b祅 th? n祇/see_feast",
				"Ta ph秈 g鋓 th鴆 ╪ i kh竎h/add_foods",
				"T筸 th阨 kh玭g c莕/cancel",
				}
	Say(g_InfoHeader.."H玬 nay l? ng祔 i h?, c? bao nhi猽 quan kh竎h n ch骳 m鮪g. H穣 tr? t礽 n蕌 nng c馻 b筺 i quan kh竎h 甶 n祇!",getn(selTab),selTab);
end

function see_feast()
	local sFoodString = MR_GetFoodsString(2)
	local selTab = {
			"G鋓 th鴆 ╪ th玦/add_foods",
			"в ta xem/cancel",
			}
	if sFoodString == "" then
		Say(g_InfoHeader.."Tr猲 b祅 ti謈  kh玭g c遪 th鴆 ╪, g鋓 th猰 th鴆 ╪ cho kh竎h ch??",getn(selTab),selTab);
		return 0;
	end;
	Say(g_InfoHeader.."Hi謓 v蒼 c遪"..sFoodString.."C? ph秈 g鋓 th猰 th鴆 ╪ kh玭g?",getn(selTab),selTab				);
end;

function add_foods()
	local selTab = {
			"Kh玭g sao, phi襫 b籲g h鱱 qu?/add_foods_check",
			"в ta ngh? xem c莕 ph秈 d鋘 m鉵 g?/cancel",
			}
	Say(g_InfoHeader.."V?  thu薾 ti謓 cho c竎 ngi, ta s? <color=yellow>d鋘 t蕋 c? c竎 m鉵 ╪ l猲 c飊g m閠 l骳<color>. Kh玭g v蕁  g? ch??",getn(selTab),selTab);
end;

function add_foods_check()
	local sFoodString = MR_GetFoodsString(1);
	if sFoodString == "" then
		Talk(1,"",g_InfoHeader.."Ngi ch璦 chu萵 b? m鉵 ╪ ??");
		return 0;
	end;
	local selTab = {
			"L? nh鱪g m鉵 n祔, d鋘 l猲 th玦/add_foods_confirm",
			"Ta suy ngh? l筰/cancel",
			}
	Say(g_InfoHeader.."C竎 m鉵 d鋘 l猲 g錷 c?:"..sFoodString.."Ngi x竎 nh薾 l? nh鱪g m鉵 n祔 ch??",getn(selTab),selTab);
end;

function add_foods_confirm()
	local nCurrFoodCount = 0;
	local nMSValueID = 0;
	local nTag = 0;
	for i=1,getn(tFoods) do
		nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		if nFoodCount > 0 then
			DelItem(tFoods[i][1],tFoods[i][2],tFoods[i][3],nFoodCount);
			nMSValueID = MV_FOOD_BEGIN+i-1;
			if nMSValueID < MV_FOOD_BEGIN or nMSValueID > MV_FOOD_END then
				Talk(1,"",g_InfoHeader.."Xin l鏸, c? m閠 ch髏 s? xu蕋, th鴆 ╪ v蒼 ch璦 d鋘 l猲.");
				return 0;
			end;
			nCurrFoodCount = GetMissionV(nMSValueID);
			SetMissionV(nMSValueID,nCurrFoodCount+nFoodCount);	
			nTag = 1;
		end;
	end;
	if nTag == 1 then
		Talk(1,"",g_InfoHeader.."Th鴆 ╪  d鋘 l猲 b祅 ti謈 r錳, m阨 qu? kh竎h n﹏g ly!");
		Msg2MSAll(MISSION_ID,"Nh鱪g m鉵 ngon n祔 u do T﹏ nng v? t﹏ lang t? tay ch? bi課, m阨 qu? kh竎h thng th鴆!");
	end;
end;
