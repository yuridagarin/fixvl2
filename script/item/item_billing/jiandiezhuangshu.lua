Include("\\script\\newbattles\\functions.lua");

function OnUse(nItemIdx)
	local nCurJunGongMul = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurJunGongMul ~= 0 then	--当前有军功章效果
		Talk(1,"","Huy hi謚 chi課 c玭g v? m苩 n? gian 甶謕 kh玭g th? c飊g s? d鬾g, n誹 mu鑞 s? d鬾g m苩 n? gi竛 甶謕 ph秈 h駓 t竎 c玭g hi謚 c馻 huy hi謚 chi課 c玭g");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	local selTab = {
				format("уng ?/#use(%d)",nItemIdx),
				"H駓 b?",
				}
	local sString = "";
	if nTimePassed >= ITEM_SPYCLOTH_TIME then
		sString = "M苩 n? gi竛 甶謕 hi謓 c遪: <color=yellow>0 gi﹜<color>.";
	else
		sString = "M苩 n? gi竛 甶謕 c遪: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.";
	end;
	Say("Ngi mu鑞 s? d鬾g m苩 n? gi竛 甶謕 ch??"..sString.."S? d鬾g ch? ?:\n1: <color=red>Th阨 gian k衞 d礽 hi謚 qu? c馻 Gi竛 甶謕 trang l? 3h, kh玭g c閚g d錸<color>\n2: <color=red>Trong th阨 gian Gi竛 甶謕 trang c遪 hi謚 qu? kh玭g 秐h hng qu﹏ c玭g c馻 b蕋 k? phe n祇, b筺 c? th? v祇 phe ch.<color>\n3: <color=red>Nh薾 ph莕 thng chi課 trng s? h駓 hi謚 qu? c馻 Gi竛 甶謕 trang.<color>",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		BT_SetData(PT_SPYCLOTH_TIME,GetTime());
		Say("B筺  d飊g Gi竛 甶謕 trang, <color=yellow>trong 3h<color> kh玭g 秐h hng qu﹏ c玭g c馻 b蕋 k? phe n祇, b筺 c? th? v祇 phe ch.",0);
		Msg2Player("B筺 s? d鬾g m苩 n? gi竛 甶謕")
		WriteLog("[Chi課 trng Nh筺 M玭 Quan]:"..GetName().." s? d鬾g m苩 n? gi竛 甶謕");
	end;
end;