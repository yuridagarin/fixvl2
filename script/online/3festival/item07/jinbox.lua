--盛世金宝箱脚本
--by vivi
--09/13/2007

Include("\\script\\online\\3festival\\3festival_head.lua")

--存储灵石任务变量
SYS_TSK_LINGSHI_ONE = 2321;   --1级灵石的数量
SYS_TSK_LINGSHI_TWO = 2322;
SYS_TSK_LINGSHI_THREE = 2323;
SYS_TSK_LINGSHI_FOUR = 2324;
SYS_TSK_LINGSHI_FIVE = 2325;
SYS_TSK_LINGSHI_SIX = 2326;
SYS_TSK_LINGSHI_SEVEN = 2327;  --7级灵石的数量

--存储灵石配方任务变量
SYS_TSK_PEIFANG_ONE = 2328;   --1级配方的数量
SYS_TSK_PEIFANG_TWO = 2329;
SYS_TSK_PEIFANG_THREE = 2330;
SYS_TSK_PEIFANG_FOUR = 2331;
SYS_TSK_PEIFANG_FIVE = 2332;
SYS_TSK_PEIFANG_SIX = 2333;
SYS_TSK_PEIFANG_SEVEN = 2334;  --7级配方的数量

function OnUse()
	Say("M? rng v祅g Th辬h Th? ph秈 c? ch譨 kh鉧 v祅g Th辬h Th?, m? kh玭g? ",
		2,
		"уng ?/choose_weapon",
		"Kh玭g c? g?/nothing")
end

function choose_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then
		Say("M? rng v祅g Th辬h Th? c? th? m? ra Ho祅g д v? kh?, n誹 m? ra Ho祅g д v? kh?. Xin h穣 ch鋘 c竎 lo筰 v? kh? sau: ",
			3,
			"Ta mu鑞 l蕐 Hi猲 Vi猲 To竔 V? o /#want_weapon(1)",
			"Ta mu鑞 l蕐 Hi猲 Vi猲 To竔 V? o/#want_weapon(2)",
			"T筸 th阨 kh玭g m? rng /nothing")	
	else
		confirm_open(0);
	end	
end

function want_weapon(nType)
	if nType == 1 then
		Say("N誹 m? ra Ho祅g д v? kh?, b筺 ch鋘 Hi猲 Vi猲 To竔 V? o, b筺 x竎 nh薾 kh玭g? ",
			2,
			"уng ?/#confirm_open(1)",
			"Ta ch鋘 nh莔 r錳./choose_weapon");
	elseif nType == 2 then
		Say("N誹 m? ra Ho祅g д v? kh? ,b筺 ch鋘 Hi猲 Vi猲 To竔 V? C玭, b筺 x竎 nh薾 kh玭g? ",
			2,
			"уng ?/#confirm_open(2)",
			"Ta ch鋘 nh莔 r錳./choose_weapon");	
	end	
end

function confirm_open(nType)
	if GetItemCount(2,0,1019) < 1 then
		Talk(1,"","M? rng v祅g Th辬h Th? ph秈 c? ch譨 kh鉧 v祅g Giang S琻, b筺 kh玭g c? ch譨 kh鉧 v祅g Th辬h Th?!");
		return
	else 
		if Zgc_pub_goods_add_chk(5,35) ~= 1 then   --空间负重检测
			return
		end	
		if DelItem(2,0,1028,1) == 1 and DelItem(2,0,1019,1) == 1 then
			AddItem(tBoxAward[4][1][2],tBoxAward[4][1][3],tBoxAward[4][1][4],tBoxAward[4][1][5],1);
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tBoxAward[4][1][1]..tBoxAward[4][1][5].."!");
			local nRandOne = random(1,100)
			if nRandOne <= tBoxAward[4][2][3] then
				local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
															SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}				
				local nLv = random(tBoxAward[4][2][1],tBoxAward[4][2][2]);
				Talk(1,"","Ch骳 m鮪g b筺 nh薾 頲 <color=yellow>"..nLv.."<color> (c蕄) Linh th筩h <color=yellow>1<color>, b筺 d飊g <color=yellow>T? Linh nh <color> l蕐 n? ra. T? Linh nh c? th? n ch? <color=yellow>V? L﹎ Minh Truy襫 Nh﹏<color>l蕐.");
				SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])+1);
			else
				local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
															SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
				local nLv = random(tBoxAward[4][2][4],tBoxAward[4][2][5]);
				Talk(1,"","Ch骳 m鮪g b筺 nh薾 頲 <color=yellow>"..nLv.."<color> (c蕄) Linh th筩h Ph鑙 Phng <color=yellow>1<color>, b筺 c? th? d飊g <color=yellow>T? Linh nh <color> l蕐 n? ra. T? Linh nh c? th? n <color=yellow>V? L﹎ Minh Truy襫 Nh﹏<color>  nh薾.");
				SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])+1);
			end
			local nRandTwo = random(1,10000);
			local nRandThree = random(1,10000);
			if nRandTwo <= tBoxAward[4][3][6] then
				AddItem(tBoxAward[4][3][2],tBoxAward[4][3][3],tBoxAward[4][3][4],tBoxAward[4][3][5],1);
				Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..tBoxAward[4][3][1]..tBoxAward[4][3][5].."!");
				Msg2Global("Ngi ch琲"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 "..tBoxAward[4][3][1]..tBoxAward[4][3][5].."!");
			end
			if nRandThree <= tBoxAward[4][4][2] then
				local nRoute = GetPlayerRoute();
				local nRand = random(1,getn(tbHuangDiRing1[nRoute]));
				local nRetCode = AddItem(tbHuangDiRing1[nRoute][nRand][2],tbHuangDiRing1[nRoute][nRand][3],tbHuangDiRing1[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing1[nRoute][nRand][1]);
					Msg2Global("Ngi ch琲"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing1[nRoute][nRand][1].."!");
					WriteLog("[07 Tam ti誸 li猲 th玭g]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing1[nRoute][nRand][1]);
				else
					WriteLog("[B竜 l鏸 Tam ti誸 li猲 th玭g 07]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing1[nRoute][nRand][1].."B竜 l鏸 khi AddItem, nRetCode:"..nRetCode);
				end	
			elseif nRandThree <= tBoxAward[4][4][4] then
				local nRoute = GetPlayerRoute();
				local nRand = random(1,getn(tbHuangDiRing2[nRoute]));
				local nRetCode = AddItem(tbHuangDiRing2[nRoute][nRand][2],tbHuangDiRing2[nRoute][nRand][3],tbHuangDiRing2[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing2[nRoute][nRand][1]);
					Msg2Global("Ngi ch琲"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing2[nRoute][nRand][1].."!");
					WriteLog("[07 Tam ti誸 li猲 th玭g]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing2[nRoute][nRand][1]);
				else
					WriteLog("[B竜 l鏸 Tam ti誸 li猲 th玭g 07]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tbHuangDiRing2[nRoute][nRand][1].."B竜 l鏸 khi AddItem, nRetCode:"..nRetCode);
				end							
			elseif nRandThree <= tBoxAward[4][4][6] then --黄帝武器
				local nRoute = GetPlayerRoute();
				if nRoute == 2 then
					local nRetCode = AddItem(tHuangDiWeapon[nRoute][nType][2],tHuangDiWeapon[nRoute][nType][3],tHuangDiWeapon[nRoute][nType][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nType][1]);
						Msg2Global("Ngi ch琲"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nType][1].."!");
						WriteLog("[07 Tam ti誸 li猲 th玭g]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nType][1]);
					else
						WriteLog("[B竜 l鏸 Tam ti誸 li猲 th玭g 07]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nType][1].."B竜 l鏸 khi AddItem, nRetCode:"..nRetCode);
					end	
				else
					local nRand = random(1,getn(tHuangDiWeapon[nRoute]));
					local nRetCode = AddItem(tHuangDiWeapon[nRoute][nRand][2],tHuangDiWeapon[nRoute][nRand][3],tHuangDiWeapon[nRoute][nRand][4],1,1,-1,-1,-1,-1,-1,-1);
					if nRetCode == 1 then
						Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nRand][1]);
						Msg2Global("Ngi ch琲"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nRand][1].."!");
						WriteLog("[07 Tam ti誸 li猲 th玭g]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nRand][1]);
					else
						WriteLog("[B竜 l鏸 Tam ti誸 li猲 th玭g 07]:"..GetName().."M? rng v祅g Th辬h Th? nh薾 頲 trang b? Ho祅g д "..tHuangDiWeapon[nRoute][nRand][1].."B竜 l鏸 khi AddItem, nRetCode:"..nRetCode);
					end					
				end				
			end
		end
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end
