--file name:qiaonv_npc.lua
--author:yanjun
--create date:2006-6-26
--describe:06年七夕活动巧女NPC脚本
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%y%m%d"));
	if nMapID == 100 or nMapID == 200 or nMapID == 300 then
		local selTab = {
				"Ta mu鑞 nh薾 Tinh Tinh мa у/get_atlas",
				"Ta mu鑞 v祇 d秈 Ng﹏ H?/go_to_galaxy",
				"Ta mu鑞 l穘h H錸g bao/get_award",
				"Ta mu鑞 t譵 hi觰 ho箃 ng/know_detail",
				"Ta ch? n xem/nothing",
				}
		if GetTask(TASK_PLANTSTAR_DATE) ~= nDate then
			tremove(selTab,3);
		end;
		--Say("<color=green>巧女<color>：时值七月初七鹊桥会，刚好一段银河化为流星雨坠落人间，真是美妙啊。",getn(selTab),selTab);
	else	--在银河地图
		local selTab = {
				"Phi襫 X秓 N? a ta v?/leave_galaxy",
				"Ta i th猰 m閠 l竧/nothing",
				}
		Say("V祇 ng祔 7 th竛g 7 c莡 ? Thc b綾 sang v鮝 l骳 d秈 Ng﹏ H? h鉧 th祅h tr薾 m璦 sao b╪g r琲 xu鑞g nh﹏ gian, th藅 l? m閠 c秐h tng tuy謙 p!",getn(selTab),selTab);
	end;
end;

function get_award()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_PLANTSTAR_DATE) ~= nDate then
		return 0;
	end;
	if GetTask(TASK_QIAONV_AWARD_DATE) >= nDate then
		Talk(1,"","Xin l鏸! H玬 nay b筺  nh薾 ph莕 thng n祔 r錳");
		return 0;
	end;
	Talk(1,"","Ch髏 qu? m鋘, xin h穣 nh薾 l蕐.");
	SetTask(TASK_QIAONV_AWARD_DATE,nDate);
	ModifyGoldenExp(300000);
	Msg2Player("B筺 nh薾 頲 300000 甶觤 s鴆 kh醗");
	ModifyReputation(10,0);
end;

function know_star_count()
	local nMapID = GetWorldPos()
	Talk(1,"main","D秈 Ng﹏ H? hi謓 c? <color=yellow>"..GetMapTaskTemp(nMapID,4).."<color> ng玦 sao. Ch? c莕 s? lng ng玦 sao t <color=yellow>"..REQUIRE_STAR_COUNT.."<color> ng玦, Ng璾 Lang v? Ch鴆 N? c? th? g苝 nhau ? d秈 Ng﹏ H?, m鋓 ngi h穣 c? g緉g th緋 s竛g c祅g nhi襲 ng玦 sao!");
end;

function get_atlas()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_GOTATLAS_DATE) >= nDate then
		Talk(1,"","H玬 nay b筺  nh薾"..t7XiItem["atlas"][1].."1 l莕 r錳.");
		return 0;
	end;
	SetTask(TASK_GOTATLAS_DATE,nDate);
	local nRetCode = AddItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],1);
	ModifyGoldenExp(100000);
	Msg2Player("B筺 nh薾 頲 100000 甶觤 s鴆 kh醗");
	ModifyReputation(5,0);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲 1 quy觧 "..t7XiItem["atlas"][1]);
	else
		WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]:"..GetName().."L鏸 khi nh薾 Tinh Tinh мa у, tr? quay l筰 ch? l謓h AddItem:"..nRetCode);
	end;
end;

function go_to_galaxy()
	SetLogoutRV(1);	--设为城市重生点
	SetFightState(0);	--和平状态
	local nMapID = GetWorldPos();
	CleanInteractive();
	NewWorld(965+floor(nMapID/100),1628,3298);
end;

function know_detail()
	Talk(3,"know_detail_1","Ho箃 ng l莕 n祔 chia l祄 4 ph莕. <enter><color=yellow>Ph莕 1: M鏸 t鑙 c? th? n Th祅h Й, Bi謓 Kinh, Tuy襫 Ch﹗<color> t譵 <color=yellow>X秓 N?<color> g莕 D? T萿 nh薾 <color=yellow>1 Tinh Tinh мa у<color>. S? d鬾g Tinh Tinh Чi у c? th? nh薾 頲 t鋋 , n t鋋  ch? nh c馻 a  ch? nh s? d鬾g Tinh Tinh мa у c? th? nh薾 頲 ng玦 <color=yellow>Sao b╪g<color>",
					"<color=yellow><enter>Ph莕 2 Th緋 s竛g ng玦 sao: <color><enter> Sau khi ngi ch琲 nh薾 頲 Sao b╪g c? th? t譵 <color=yellow>X秓 N?<color>  v祇 d秈 Ng﹏ H?, trong d秈 Ng﹏ H? s? d鬾g Sao b╪g s? xu蕋 hi謓 1 ng玦 sao.",
					"<color=yellow><enter>Ph莕 3 Ng璾 Lang, Ch鴆 N? tng ng?: Sau khi <color><enter>s? lng ng玦 sao<color=yellow> tr猲 <color>d秈 Ng﹏ H? t n <color=yellow>"..REQUIRE_STAR_COUNT.."<color> ng玦, Ng璾 Lang, Ch鴆 N? s? g苝 nhau l骳 <color=yellow>9 gi? t鑙<color>, Ng璾 Lang, Ch鴆 N? s? b猲 nhau trong <color=yellow>15 ph髏<color>.");
end;

function know_detail_1()
	Talk(3,"main","<color=yellow><enter>Ph莕 4 фi ph莕 thng: <color><enter>Ngi ch琲 ch璦 nh薾 ph莕 thng h玬  v? th緋 s竛g c竎 ng玦 sao c? th? i tho筰 v韎 <color=yellow>Ng璾 Lang ho芻 Ch鴆 N?<color> nh薾 ph莕 thng. Ngi ch琲  th緋 s竛g sao c馻 h玬  c? th? n g苝 <color=yellow>X秓 N?<color> nh薾 1 ph莕 thng nh?.",
					"Th阨 gian ho箃 ng l? t? <color=yellow>28/7 n 6/8 (bao g錷 c? 2 ng祔 n祔)<color>.",
					"Ch? ?: T譵 h秓 h鱱 c飊g tham gia t? i s? c? 甶襲 b蕋 ng? x秠 ra!");
end;

function leave_galaxy()
	local nMapID = GetWorldPos();
	SetLogoutRV(0);
	if nMapID == 966 then
		NewWorld(100,1445,2950);
	elseif nMapID == 967 then
		NewWorld(200,1412,2853);
	elseif nMapID == 968 then
		NewWorld(300,1776,3541);
	else
		--Msg2Player("系统出错，请截图后到论坛联系GM，谢谢您的合作。");
		WriteLog("[L鏸 ho箃 ng Th蕋 T辌h]:"..GetName().."L骳 r阨 kh醝 map d秈 Ng﹏ H?, IP map nh薾 頲 sai, tr? s? l?:"..nMapID);
		NewWorld(100,1445,2950);	--默认传回泉州
	end;
end;

function know_time()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.." gi? "..nMin.." Ph髏 "
	Talk(1,"main","Th阨 gian hi謓 t筰 l? <color=yellow>"..sTimeLeft.."<color>. V祇 kho秐g <color=yellow>21 gi?<color> m鏸 t鑙 Ng璾 Lang v? Ch鴆 N? s? g苝 nhau, m鋓 ngi h穣 nh? r? th阨 gian.");
end;

function get_award_by_atlas()
	local nAtlasCount = GetItemCount(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4])
	if nAtlasCount <= 0 then
		Talk(1,"","B筺 kh玭g c? Tinh Tinh мa у?");
		return 0;
	end;
	local selTab = {
				"Ta mu鑞 i ngay/#get_award_confirm(1,"..nAtlasCount..")",
				"Sau n祔 h穣 i/nothign",
				}
	Say("B筺 c? t鎛g c閚g <color=yellow>"..nAtlasCount.."<color> c竔"..t7XiItem["atlas"][1]..", c? th? i l蕐 <color=yellow>"..(20*nAtlasCount).."<color> v筺 甶觤 s鴆 kh醗 v? <color=yellow>"..(5*nAtlasCount).."<color> 甶觤 danh v鋘g. B筺 mu鑞 i l蕐 ph莕 thng?",getn(selTab),selTab)
end;

function get_award_by_star()
	local nStarCount = GetItemCount(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4])
	if nStarCount <= 0 then
		Talk(1,"","B筺 kh玭g c? ng玦 sao?");
		return 0;
	end;
	local selTab = {
				"Ta mu鑞 i ngay/#get_award_confirm(2,"..nStarCount..")",
				"Sau n祔 h穣 i/nothign",
				}
	Say("B筺 c? t鎛g c閚g <color=yellow>"..nStarCount.."<color> c竔"..t7XiItem["star"][1]..", c? th? i l蕐 <color=yellow>"..(30*nStarCount).."<color> v筺 甶觤 s鴆 kh醗 v? <color=yellow>"..(5*nStarCount).."<color> 甶觤 danh v鋘g. B筺 x竎 nh薾 mu鑞 фi ph莕 thng?",getn(selTab),selTab)			
end;

function get_award_confirm(nType,nCount)
	if nType == 1 then
		if DelItem(t7XiItem["atlas"][2],t7XiItem["atlas"][3],t7XiItem["atlas"][4],nCount) == 1 then
			ModifyGoldenExp(200000*nCount);
			Msg2Player("B筺 nh薾 頲 "..(20*nCount).."v筺 甶觤 kinh nghi謒.");
			ModifyReputation(5*nCount,0);
			WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."D飊g th?"..nCount.."t蕀 Tinh Tinh мa у i 頲 ph莕 thng.");
		end;
	else
		if DelItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],nCount) == 1 then
			ModifyGoldenExp(300000*nCount);
			Msg2Player("B筺 nh薾 頲 "..(30*nCount).."v筺 甶觤 kinh nghi謒.");
			ModifyReputation(5*nCount,0);
			WriteLog("[Ho箃 ng Th蕋 T辌h]:"..GetName().."D飊g th?"..nCount.."t蕀 Tinh Tinh i 頲 ph莕 thng.");
		end;
	end;
end;
