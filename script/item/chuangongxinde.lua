Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
IB_VERSION = 1;	--免费区

g_szItemName = "Truy襫 C玭g T﹎ Ьc";
g_nMaxUseTime = 100;	--每周最大使用次数

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","Tu莕 n祔 b筺  d飊g "..g_nMaxUseTime.." cu鑞"..g_szItemName..", kh玭g th? d飊g n鱝.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"","Ъng c蕄 qu? th蕄, n c蕄 <color=yellow>60<color> m韎 d飊g 頲 "..g_szItemName..".");
		return 0;
	end;
	local selTab = {
			"S? d鬾g/ask_number",
			"T筸 th阨 ch璦 s? d鬾g!/nothing",
			}
	local szString = "";
	if IB_VERSION == 1 then
		local nExp = floor((nLevel^4)/300);
		szString = "Ngi ng ? s? d鬾g <color=yellow>"..g_szItemName.."<color>? Ngi c? th? nh薾 <color=yellow>m鏸 o c? "..nExp.."<color> 甶觤 kinh nghi謒.";
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4));
		szString = "Ngi ng ? s? d鬾g <color=yellow>"..g_szItemName.."<color>? T鑙 產 c? th? chuy觧 <color=yellow>m鏸 o c? "..nGoldenExp.."<color> 甶觤 s鴆 kh醗, 甶觤 s鴆 kh醗 hi謓 t筰 <color=yellow>"..nCurGoldenExp.."<color>.";
	end;
	Say(szString,getn(selTab),selTab);
end;

function ask_number()
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	local	nItemNum = GetItemCount(2,1,3353);
	
	local nMaxNum = 0;
	
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMaxNum = nItemNum;
	else
		nMaxNum = g_nMaxUseTime - nUseXinDeNum;
	end;
	
	AskClientForNumber("use",1,nMaxNum,"Xin h醝 d飊g m蕐 c竔");
	
end

function use(nCount)
	local nLevel = GetLevel();
	if IB_VERSION == 0 then
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4)) * nCount;
		if GetGoldenExp() < nGoldenExp then
			Say("觤 s鴆 kh醗 c馻 b筺 <color=yellow>"..GetGoldenExp().."<color> kh玭g  <color=yellow>"..nGoldenExp.."<color>, c? mu鑞 i kh玭g?",2,"уng ?/#use_shoufei("..nCount..")","H駓 b?/nothing")
			return
		else
			use_shoufei(nCount);
			return
		end;
	end
	if DelItem(2,1,3353,nCount) == 1 then
		if IB_VERSION == 1 then
			local nExp = floor((nLevel^4)/300) * nCount;--这里是先向下取整还是先乘以nCount呢？
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		else
			
		end;
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("Trong tu莕 n祔 b筺  d飊g cu鑞 th? "..GetTask(TSK_USE_CHUANGONG_XINDE).." cu鑞"..g_szItemName..", m鏸 tu莕 ch? c? th? d飊g "..g_nMaxUseTime.." cu鑞"..g_szItemName);	

	end;
end;

function use_shoufei(nCount)
	if DelItem(2,1,3353,nCount) == 1 then
		local nGoldenExp = floor(((GetLevel()^4)*200000)/(80^4)) * nCount;
		gf_GoldenExp2Exp(nGoldenExp);
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("Trong tu莕 n祔 b筺  d飊g cu鑞 th? "..GetTask(TSK_USE_CHUANGONG_XINDE).." cu鑞"..g_szItemName..", m鏸 tu莕 ch? c? th? d飊g "..g_nMaxUseTime.." cu鑞"..g_szItemName);	
	end;
end
function nothing()

end;

--2,1,3353