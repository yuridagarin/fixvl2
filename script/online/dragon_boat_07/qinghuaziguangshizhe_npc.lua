--Describe:清华紫光使者NPC脚本
--Create Date:2007-6-13
--Author:yanjun
Include("\\script\\lib\\globalfunctions.lua");
g_szInforHeader = "<color=green>Thanh Hoa T? quang S? gi?<color>: ";
function main()
	local selTab = {
			"Gi髉 b筺 h鋍 t藀 tho秈 m竔- Thanh Hoa Chi Tinh/talk1",
			"Gi髉 gia nh c? kh玭g kh? vui v?- T﹏ Th? tuy課 e/talk2",
			"M祏 甧n kinh 甶觧- Laptop th? h? H8/talk3",
			"Ta th輈h m鉵 n祔 qu?!/choose_the_favour",
			"L莕 sau s? quay l筰 xem/nothing",
			}
	Say(g_szInforHeader.."Ta l? T? Quang S? gi?, mang may m緉 n cho m鋓 ngi. T苙g c竎 h? b竛h 輙 n祔! Xem th? v薾 kh? c馻 c竎 h? nh? th? n祇!",getn(selTab),selTab);
end;

function nothing()

end;

function talk1()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>H筺 ch? gi竜 d鬰<color>: ");
end;

function talk2()
	Talk(1,"talk2_1",g_szInforHeader.."\n\n<color=yellow>xem y<color>: Ti vi tinh th? l醤g<color=red>3 t蔯/5t蔯<color>\n<color=yellow>Vi t輓h gia nh<color>: <color=red>16: 10<color>");
end;

function talk2_1()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>Thi誸 k? chi ti誸<color>: \n<color=yellow><color>: n﹏g c蕄 t輓h n╪g <color=red>40##<color>, <color=red>40##<color>\nEasy n gi秐, Enjoy s秐g kho竔, Ease tinh t?.");
end;

function talk3()
	Talk(1,"main",g_szInforHeader.."\n\n<color=yellow>T? do t? t筰<color>: ");
end;

function choose_the_favour()
	local selTab = {
				"Ta th輈h Thanh Hoa Chi Tinh/select_one",
				"Ta th輈h T﹏ Th? tuy課 e/select_one",
				"Ta th輈h Laptop th? h? H8/select_one",
				"Ta mu鑞 xem gi韎 thi謚 s秐 ph萴/main",
				}
	Say(g_szInforHeader.."Thi誹 Hi謕 th輈h s秐 ph萴 n祇?",getn(selTab),selTab);
end;

function select_one()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 070624 then
		Talk(1,"",g_szInforHeader.."B竛h 輙  t╪g h誸 r錳. Xin h穣 i k? ho箃 ng sau");
		return 0;
	end;
	if GetLevel() < 30 then
		Talk(1,"",g_szInforHeader.."Thi誹 hi謕 n╪g l鵦 c遪 y誹 qu?. Xin luy謓 n c蕄 <color=yellow>30<color> r錳 quay l筰 g苝 ta!");
		return 0;
	end;
	if GetTask(2357) ~= 0 then
		Talk(1,"",g_szInforHeader.."M鏸 nh﹏ v藅 ch? nh薾 頲 b竛h 輙 1 l莕 th玦!");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"",g_szInforHeader.."H祅h trang ho芻 s鴆 l鵦 c馻 ngi kh玭g ! H穣 quay l筰 sau nh?!");
		return 0;
	end;
	SetTask(2357,1);
	Talk(1,"",g_szInforHeader.."Зy l? ch髏 qu? m鋘! Xin ng ch?!");
	local nRand = random(1,1000);
	if nRand <= 650 then
		AddItem(2,1,1123,1);
		Msg2Player("B筺 nh薾 頲 1 B竛h 輙 Ng穒 hng");
	elseif nRand <= 850 then
		AddItem(2,1,1124,1);
		Msg2Player("B筺 nh薾 頲 1 B竛h 輙 th辴 nng");
	elseif nRand <= 950 then
		AddItem(2,1,1125,1);
		Msg2Player("B筺 nh薾 頲 1 B竛h 輙 b竧 b秓");
	elseif nRand <= 994 then
		AddItem(2,1,1126,1);
		Msg2Player("B筺 nh薾 頲 1 B竛h 輙 Vui v?");
	elseif nRand <= 999 then
		AddItem(2,1,1127,1);
		Msg2Player("B筺 nh薾 頲 1 B竛h 輙 May m緉");
	else
		AddItem(2,1,1128,1);
		Msg2Player("B筺 nh薾 頲 1 B竛h 輙 Th駓 tinh");
	end;
end;

