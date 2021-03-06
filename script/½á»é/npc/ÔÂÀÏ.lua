Include("\\script\\结婚\\marriage_head.lua");

CALLBACK_FILE		= "\\script\\结婚\\npc\\月老.lua"		-- 回调文件名
MATE_TITLE			= 
{
	[1] = "Th? t?",
	[2] = "Trng phu"
}
ITEM_LETTER			= {2, 1, 535}		-- 休书
g_InfoHeader = "<color=green>Nguy謙 L穙<color>:";

function main()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	--确保玩家点击的时候Relay没宕机，不过不保证点击后不宕
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."H玭 l?  k誸 th骳, xin h醝 ngi ph鬰 v?.");
		return 0;
	end;
	if GetMateName() == "" and GetTask(TASK_MARRYDATE) ~= 0 then
		Talk(1,"",g_InfoHeader.."B筺  頲 t? do");
		clear_marriage_info(0);
		return 0;
	end;
	if (is_married(PlayerIndex) == 1) then
		local caption = nil
		if (GetSex() == 1) then
			caption = "B籲g h鱱 n t譵 l穙 c? vi謈 g? kh玭g?"
		else
			caption = "C? nng n t譵 l穙 c? vi謈 g? kh玭g?"
		end
		Say(g_InfoHeader..caption,
			2,
			"Ta mu鑞 h駓 b? h玭 c/divorce_talk",
			"Kh玭g c? vi謈 g?/cancel")
		return
	elseif GetTask(TASK_WEDDING_LOVER) == 0 then
		hint_step(1)
		Talk(1, "", g_InfoHeader.."N誹 玭g t? b? nguy謙  se duy猲 k誸 ch?, ngi c飊g ? trung nh﹏ n Dng Ch﹗ g苝 b? mai  lo vi謈 h玭 s?.")
		return
	end
	
	if (check_bride_condition() == 1) then
		Say(g_InfoHeader.."H玭 nh﹏ l? chuy謓 i s?, 2 ngi  ngh? k? ch璦?", 2,
			"Hai ta  quy誸 nh r錳/do_marry",
			"в suy ngh? th猰./cancel")
	end
end

function do_marry()
	if get_wedding_stat() ~= 1 then
		Talk(1,"",g_InfoHeader.."ьi khi t譵 頲 s﹏ kh蕌 k誸 h玭, ta s? gi髉 2 ngi th祅h h玭");
		return 0;
	end;
	if (check_bride_condition() == 1) then
		Talk(1, "", g_InfoHeader.."H醝 xem c? nng 蕐 c? mu鑞 k誸 h玭 v韎 ngi kh玭g? C? 2 c飊g ng ? m韎 頲.")
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			format(g_InfoHeader.."C? nng n祔, v? thi誹 hi謕 %s y mu鑞 c飊g c? th祅h h玭, c? ng ? kh玭g?", GetName(PlayerIndex)),
			2,
			"уng ?/agree_marriage",
			"Kh玭g ng ?/disagree_marriage")
	end
end

function agree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)
	
		marriage_setting();

		hint_step(6)
		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."N誹 c竎 ngi mu鑞 ti誴 nh薾 <color=yellow>Nhi謒 v? phu th? <color> hay h鋍 <color=yellow>K? n╪g h玭 nh﹏<color> th? n<color=yellow>Th祅h Dng Ch竨<color> t譵 <color=green>X秓 n?<color>, c? ta ? g莕 <color=green>B? mai<color>. "
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

function disagree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)

		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."Xem ra t﹎ ? c馻 c竎 ngi v蒼 ch璦 tng th玭g, suy ngh? k? r錳 h穣 n g苝 ta."
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

-- 检查新郎是否满足结婚条件
function check_bridegroom_condition()
	-- 必须男方做队长
	if (GetTeamSize() ~= 2 or GetCaptainName() == GetName()) then
		Talk(1, "", g_InfoHeader.."Hai ngi c飊g t? i do b猲 nam l祄 i trng n g苝 ta  xin k誸 h玭.")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."Ngi  l? ngi k誸 h玭 sao l筰 c遪 ong bm nh? v藋")
	elseif (GetSex(lover) ~= 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Xem ra c竎 ngi nh莕 l蒼 r錳, Nguy謙 L穙 n祔 ch? gi髉 c竎 ngi n猲 phu th?, nh鱪g c竔 kh竎 kh玭g ph秈 vi謈 c馻 ta.")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."D﹜ t? h錸g ch璦 li猲 k誸 ngi v韎 v? thi誹 hi謕 .")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."D﹜ t? h錸g ch璦 li猲 k誸 ngi v韎 c? nng .")
	else
		return 1
	end
	return 0
end

-- 检查是否满足结婚条件
function check_bride_condition()
	-- 必须男方做队长
	if GetSex() == 2 then
		Talk(1, "", g_InfoHeader.."C? nng n t譵 l穙 c? vi謈 g? kh玭g?")
		return 0;
	end;
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", g_InfoHeader.."Лa ? trung nh﹏ n g苝 ta.")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."Ngi  l? ngi k誸 h玭 sao l筰 c遪 ong bm nh? v藋")
	elseif (GetSex(lover) == 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Xem ra c竎 ngi nh莕 l蒼 r錳, Nguy謙 L穙 n祔 ch? gi髉 c竎 ngi n猲 phu th?, nh鱪g c竔 kh竎 kh玭g ph秈 vi謈 c馻 ta.")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."C? nng y v韎 ngi ch璦 頲 玭g t? b? nguy謙 k誸 ch? se duy猲")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."D﹜ t? h錸g  bu閏 ngi v? c? nng ")
	else
		return 1
	end
	return 0
end

-- 离婚
function divorce_talk()
	local seperation_date = GetTask(TASK_SEPERATION_DATE)
	if (seperation_date ~= 0) then
		seperation_divorce(seperation_date, lover)
	else
		-- 直接离婚
		direct_divorce()
	end
end

-- 分居离婚
function seperation_divorce(seperation_date, lover)
	local day = seperation_date
	for i = 1, INTERVAL_SEPERATION do
		day = next_date(day)
	end
	if (curr_date() >= day) then
		-- 过了七天
		Say(g_InfoHeader.."Х 7 ng祔 r錳, suy ngh? k? ch璦? Ngi mu鑞 chia tay hay gi秈 h遖 y?",
			5,
			"Chia tay/part",
			"Gi秈 h遖/reconcile_confirm",
			"Ta kh玭g i 頲 n鱝, ta mu鑞 ly h玭./direct_divorce_letter",
			"T譶h c秏 c馻 ta  r筺 n鴆 r錳/direct_divorce_estrangement",
			"в ta suy ngh? l筰/cancel")
	else
		-- 还没到七天
		Say(g_InfoHeader.."V蒼 ch璦 h誸 7 ng祔, c竎 ngi suy ngh? th猰 甶.",
			4,
			"Gi秈 h遖/reconcile_confirm",
			"Ta kh玭g i 頲 n鱝, ta mu鑞 ly h玭./direct_divorce_letter",
			"T譶h c秏 c馻 ta  r筺 n鴆 r錳/direct_divorce_estrangement",
			"H駓 b?/reconcile_cancel")
	end
end

-- 分居复合确定
function reconcile_confirm()
	-- 分居离婚必须组队
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		if (GetSex() == 1) then
			Talk(1, "", g_InfoHeader.."Ngi v? th? t? c飊g t? i n g苝 ta")
		else
			Talk(1, "", g_InfoHeader.."Ngi v? phu qu﹏ c飊g t? i n g苝 ta")
		end
	else
		SetTask(TASK_SEPERATION_DATE, 0)
		SetTask(TASK_SEPERATION_DATE, 0,  0, lover)
		Talk(1, "", g_InfoHeader.."Ta  h祅 g緉 c竎 ngi l筰, t? nay ta kh玭g mu鑞 c竎 ngi n g苝 ta  ly h玭 n鱝. Ch骳 2 ngi b竎h ni猲 giai l穙!")
	end
end

-- 分居复合取消
function reconcile_cancel()
	Talk(1, "", g_InfoHeader.."Kh玭g mu鑞 gi秈 h遖 ?? V蒼 ch璦 h誸 7 ng祔, ngi suy ngh? th猰 甶 nh?!")
end

-- 分手
function part()
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		Talk(1, "", g_InfoHeader.."Ngi v?" .. MATE_TITLE[GetSex()] .. "t? i v韎 nhau r錳 n g苝 ta")
		return
	end
	Talk(1, "", g_InfoHeader.."V蒼 mu鑞 ly h玭 ?? Л頲," .. MATE_TITLE[GetSex()])

	-- 询问配偶
	SetPlayerScript(CALLBACK_FILE, lover)
	Say2SomeOne(lover, g_InfoHeader.."Ngi v蒼 mu鑞 ly h玭 ??",
		2,
		"уng ?/agree_part",
		"H駓 b?/disagree_part")
end

-- 同意离婚
function agree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		UnMarry()
		local caption = g_InfoHeader.."C竎 ngi  h駓 b? h玭 c, t? nay 阯g ai n蕐 甶!"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
		clear_marriage_info(3);	--分居7天后离婚
	end
end

-- 不同意离婚
function disagree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		Talk2SomeOne(lover,
			1, "", g_InfoHeader.."Hai ngi v蒼 ch璦 th鑞g nh蕋 ? ki課, suy ngh? th猰 甶 nh?.")			
	end
end

-- 直接离婚
function direct_divorce()
	Say(g_InfoHeader.."H駓 b? h玭 c? Ngi suy ngh? k? ch璦?",
		2,
		"уng ?/direct_divorce_option",
		"H駓 b?/cancel")
end

-- 直接离婚选项
function direct_divorce_option()
	Say(g_InfoHeader.."Mu鑞 ly h玭 ?? Х th? th? ta c騨g kh玭g c遪 c竎h n祇. H穣 n Ng? c竎 mua 1 t? <color=yellow>Gi蕐 ly h玭<color> x竎 nh薾 c竎 ngi  kh玭g c遪 t譶h c秏. Ly h玭 tr? уng T﹎ c馻 c竎 ngi s? b? tr? <color=red>50<color> 甶觤.",
		4,
		"Ta  c? gi蕐 ly h玭!/direct_divorce_letter",
		"T譶h c秏 c馻 ta  r筺 n鴆 r錳/direct_divorce_estrangement",
		"Ch髇g t玦  n/direct_divorce_team",
		"в ta suy ngh? l筰/cancel")
	-- TODO: here
end

-- 休书
function direct_divorce_letter()
	if (GetItemCount(ITEM_LETTER[1], ITEM_LETTER[2], ITEM_LETTER[3]) == 0) then
		Talk(1, "", g_InfoHeader.."Kh玭g c? gi蕐 ly h玭 l祄 sao ly h玭? дn {Ng? c竎} mua r錳 quay l筰 y!")
	else
		Say(g_InfoHeader.."Ngi quy誸 nh ly h玭 th? ta c騨g kh玭g c遪 c竎h n祇, nh璶g  h秓 c秏 s? gi秏 xu鑞g = 0! Suy ngh? k? ch璦?",
			2,
			"уng ?/direct_divorce_letter_confirm",
			"H駓 b?/cancel")
	end
end

-- 离婚
--nType:0是配偶离婚后自己点月老离婚，1是直接离婚，2是同心值小于50离婚，3是分居7天后离婚
function divorce(nType)
	UnMarry()
	SetTask(TASK_LOVEGRADE, 0)
	if (GetSex() == 1) then
		Talk(1, "",
			g_InfoHeader.."Ngi  ly h玭,  ta th玭g b竜 v韎 nng t? trc c馻 ngi")
	else
		Talk(1, "",
			g_InfoHeader.."Ngi  ly h玭,  ta th玭g b竜 v韎 v? phu qu﹏ trc c馻 ngi.")
	end
	clear_marriage_info(nType);
end

function clear_marriage_info(nType)
	local szTaskInfo = "";
	for i=2000,2029 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
	end;
	clear_task();
	ma_skill_remove()
	WriteLog("[K誸 h玭]:"..GetName().."Bi課 lng nhi謒 v? trc li h玭:"..szTaskInfo);
	WriteLog("[K誸 h玭]:"..GetName().."Li h玭 r錳, lo筰 li h玭:"..tostring(nType));
end;

-- 休书确认
function direct_divorce_letter_confirm()
	local genre = ITEM_LETTER[1]
	local detail = ITEM_LETTER[2]
	local particular = ITEM_LETTER[3]
	if (GetItemCount(genre, detail, particular) > 0) then
		DelItem(genre, detail, particular, 1)
		divorce(1)
	end
end

-- 感情破裂
function direct_divorce_estrangement()
	if (GetTask(TASK_LOVEGRADE) > 50) then
		Talk(1, "", g_InfoHeader.."Ta th蕐 2 ngi v蒼 c遪 t譶h c秏, h穣 suy ngh? l筰 甶.")
	else
		Say(g_InfoHeader.."Ly h玭  h秓 c秏 c馻 c竎 ngi s? = 0. C竎 ngi suy ngh? k? 甶",
			2,
			"уng ?/#divorce(2)",
			"H駓 b?/cancel")
	end
end

-- 组队离婚
function direct_divorce_team()
	local count = GetTeamSize()
	local title = MATE_TITLE[GetSex()]
	if (count == 0) then
		Talk(1, "", g_InfoHeader.."Th阨 gian s? d鬾g" .. title .. "? u, sao ta kh玭g th蕐")
	elseif (count > 2) then
		Talk(1, "", g_InfoHeader.."Chuy謓 nh? th? n祔  ngi kh竎 lo, ngi v?" .. title .. "2 ngi l筰 y.")
	else
		local lover = get_team_lover(PlayerIndex)
		if (GetName(lover) ~= GetMateName()) then
			Talk(1, "", g_InfoHeader.."Th阨 gian s? d鬾g" .. title .. "? u, sao ta kh玭g th蕐")
		else
			Say(g_InfoHeader.."C竎 ngi quy誸 nh ly h玭 ??",
				2,
				"уng ?/direct_divorce_team_confirm",
				"H駓 b?/cancel")
		end
	end
end

-- 组队离婚确定
function direct_divorce_team_confirm()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		Talk(1, "", g_InfoHeader.."Ta h醝 ngi" .. MATE_TITLE[GetSex()])
	
		-- 询问配偶
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover, g_InfoHeader.."Ngi ng ? ly h玭 ch??",
			2,
			"уng ?/agree_seperation",
			"H駓 b?/disagree_part")
	end
end

-- 同意分居
function agree_seperation()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		local day = curr_date()
		SetTask(TASK_SEPERATION_DATE, day,  0, lover)
		SetTask(TASK_SEPERATION_DATE, day)

		local caption = g_InfoHeader.."Ta cho c竎 ngi th猰 <color=yellow>7 ng祔<color>  suy ngh?, sau  n g苝 ta. N誹 l骳  c竎 ngi v蒼 quy誸 nh ly h玭 th? ta c騨g kh玭g c遪 c竎h n祇"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
	end
end
--村长：2007-05-28增加离婚技能删除
function ma_skill_remove()
	for i = 865,867 do
		if GetSkillLevel(i) ~= 0 then
			RemoveSkill(i)
		end
	end
	return
end
