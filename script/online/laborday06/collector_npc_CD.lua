--File name:collector_npc_CD.lua
--Describe:成都聚宝斋商人脚本
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local selTab = {
			"фi l蕐 ph莕 thng./handin",
			"L祄 sao  b竛 v藅 ph萴?/knowhow",
			"Xem n閕 dung ho箃 ng./#knowdetail(1)",
			"tra xem v藅 li謚  n閜./#queryinfor(1)",
			"Nh薾 s竎h c玭g lao T? B秓 Trai./#getbook(1)",
			"K誸 th骳 i tho筰/nothing",
			};
	local nState = Get_Laborday_State();
	if nState == 0 then
		Talk(1,"","Ho箃 ng ch璦 b総 u");
	elseif nState == 3 then
		Talk(1,"","Ho箃 ng  k誸 th骳!");
	elseif nState == 2 then
		Talk(1,"","B籲g h鱱  n閜 v藅 li謚 r錳 m?, h穣 mau n l穘h thng!");
	elseif nState == 1 then
		Say("Hi謓 gi? b鎛 ti謒 s璾 t莔 nh鱪g v藅 qu? gi? l璾 truy襫 trong giang h?, n誹 b籲g h鱱 thu th藀 頲 s? c? nh鱪g ph莕 thng tr鋘g h藆.",getn(selTab),selTab);
	else
		Talk(1,"","Tr筺g th竔 b? sai s鉻, h穣 li猲 h? v韎 b? ph薾 qu秐 l?");
		Write_Log("Ho箃 ng t誸 lao ng c? sai s鉻","Ho箃 ng sai s鉻:"..nState);
	end
end;

function handin()
	local selTab = {
			"уng ?/confirm",
			"thuy誸 minh ph莕 thng./#knowrule(1)",
			"в ta s緋 x誴 l筰./nothing",
			}
	local selTab2 = {
		"уng ?/confirm",
		"Ta v蒼 ch璦 hi觰./knowmore",
		"thuy誸 minh ph莕 thng./#knowrule(1)",
		"Ta hi觰 r錳!/donotnoteme",
		"в ta s緋 x誴 l筰./nothing",
		}
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1);
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2);
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);
	local nTag = Get_Task_Byte(BIG_PRIZE,4);
	if nTag == 0 then
		local sContent = "Ch? ?! B籲g h鱱 hi謓  ";
		if GetThreePrize >= 3 then
			sContent = sContent.."<color=yellow> nh薾 3 l莕 ph莕 thng lo筰 3<color>,";
		end;
		if GetTwoPrize >= 1 then
			sContent = sContent.."<color=yellow>1 l莕 ph莕 thng lo筰 2<color>,";
		end;
		if GetOnePrize >= 1 then
			sContent = sContent.."<color=yellow>1 l莕 ph莕 thng lo筰 1<color>,";
		end;
		sContent = sContent.."cho d? c? n閜  v藅 thu th藀 c騨g ch? nh薾 頲 ph莕 thng lo筰 4 (t鴆 gi秏 1 c蕄). S? lng v藅 ph萴 hi謓 t筰 B籲g h鱱  n閜 l?: <color=yellow>"..GetTask(ITEMNUM).."<color>. H穣 ch鋘 lo筰 ph莕 thng. B籲g h鱱 c? ng ? giao n閜 s? lng v藅 thu th藀 trong h祅h trang kh玭g?";
		if GetOnePrize >= 1 or GetTwoPrize >= 3 or GetThreePrize >= 3 then
			Say(sContent,getn(selTab2),selTab2);
			return TRUE;
		end;
	end;
	Say("B籲g h鱱 c? ng ? giao n閜 to祅 b? s? lng v藅 thu th藀 c? trong h祅h trang kh玭g? S? lng v藅 li謚 c莕 thi誸 xin h穣 tra trong <color=yellow>S竎h c玭g lao T? B秓 Trai<color>.",getn(selTab),selTab);
end;

function donotnoteme()
	Set_Task_Byte(BIG_PRIZE,4,1);
	main();
end;

function confirm()
	local nHandInNum = 0;
	for i=1,g_TotalItemNum do
		if Hand_In_Item(i) == TRUE then
			nHandInNum = nHandInNum + 1;
			Msg2Player("Х n閜 s? hi謚 l?:"..i.."v藅 ph萴: "..ItemTab[i][5]);
		end;
	end;
	if nHandInNum == 0 then
		Talk(1,"","L莕 n祔 b籲g h鱱 v蒼 ch璦 n閜 v藅 ph萴 n祇 c?, h穣 x竎 nh薾 c?  v藅 li謚 v? ch璦 n閜 qua v藅 ph萴 n祔.");
		return FALSE;
	else
		Talk(1,"","L莕 n祔 t鎛g c閚g  n閜 <color=yellow>"..nHandInNum.."<color> lo筰 v藅 thu th藀, h穣 tra xem tin t鴆 h? th鑞g  bi誸 th猰 chi ti誸.");
		Write_Log("N閜 v藅 ph萴.","Х n閜"..nHandInNum.."lo筰 v藅 ph萴");
		return TRUE;
	end;		
end;

function knowhow()
	Talk(1,"main","B籲g h鱱 ch? c莕  v藅 mu鑞 n閜 trong h祅h trang, ta s? gi髉 s緋 x誴 l筰. N誹 s? lng kh玭g  ta s? kh玭g l蕐!");
end;

function knowmore()
	Talk(1,"handin","Trong th阨 gian di詎 ra ho箃 ng, ph莕 thng lo筰 1 v? lo筰 2 ch? c? th? nh薾 1 l莕. Ph莕 thng lo筰 3 t鑙 產 nh薾 3 l莕, ph莕 thng kh竎 m鏸 ng祔 c? th? nh薾 3 l莕. N誹 nh? s? l莕 i l蕐 ph莕 thng  y, th? ng c蕄 ph莕 thng s? gi秏 1 c蕄. V? d?: n誹 ngi ch琲 thu th藀 203 lo筰 v藅 ph萴,  фi ph莕 thng lo筰 1, khi 蕐 ch? c? th? фi ph莕 thng lo筰 2, n誹  i l蕐 ph莕 thng lo筰 2 th? ch? c? th? i l蕐 ph莕 thng lo筰 3. N誹 s? l莕 i l蕐 ph莕 thng lo筰 3  y th? ch? c? th? i l蕐 ph莕 thng lo筰 4.");
end;
