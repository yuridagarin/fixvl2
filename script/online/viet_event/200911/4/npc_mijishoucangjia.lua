--=============================================
--create by baiyun 2009.10.15
--describe:越南版11月份活动 秘籍收藏家NPC脚本文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
g_szNpcName = "<color=green>Nh? S璾 T莔 M藅 T辌h: <color>";
FILE_NAME = "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua";


function main()
	Say(g_szNpcName.."Trong th阨 gian t? ng祔 06-11-2009 n 06-12-2009. уng o c? th? s? d鬾g 3 cu鑞 T? Linh Chi課 ? Ph? (lo筰 2 ph? l鬰)  n﹏g c蕄 th祅h T? Linh Chi課 ? Ph? (lo筰 4 ph? l鬰)".."<enter><color=red>Чi hi謕 ph秈 thi誸 t m藅 kh萿 h祅h trang v? m? kh鉧 h祅h trang m韎 c? th? n閜<color>",
			2,
			"Ta mu鑞 n﹏g c蕄 m藅 t辌h/get_miji",
			"T筰 h? ch? ti謓 gh? ngang./nothing"
	);
end


function get_miji()
	PutinItemBox("N﹏g c蕄 m藅 t辌h" ,9 , "Чi hi謕 ph秈 b? 3 t? linh chi課 ? ph? v? 6 tu ch﹏ y誹 quy誸  n﹏g c蕄 th祅h t? linh chi課 ? ph? (4 ph? l鬰). C竎 h? x竎 nh薾 mu鑞 c藀 nh藅?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if (genre ~= 0 or detail ~= 107 or particular ~= 159) and (genre ~= 2 or detail ~= 0 or particular ~= 554) then
		Talk(1, "", g_szNpcName.."Ch? c? th? b? v祇 t? linh chi課 ? ph? ho芻 tu ch﹏ y誹 quy誸.");
		return 0;
	end
	return 1;
end
	
function OnPutinComplete(param)
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."B? v祇 v藅 ph萴 kh玭g ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= 9 then		-- 额外检测
		return 0;
	end
	if get_item_count(t, 0, 107, 159) ~= 3 or get_item_count(t, 2, 0, 554) ~= 6 then
		Talk(1, "", g_szNpcName.."B? v祇 v藅 ph萴 kh玭g ng");
		return 0;
	end
	
	if GetCash() < 1000000 then
		Talk(1, "", g_szNpcName.."Ng﹏ lng tr猲 ngi kh玭g ");
		return 0;
	end
	
	local nResult = 1;
	for i = 1, getn(t) do
		local nCount = 0;
		if t[i][4] == 159 then
			nCount = -1;
		else
			nCount = 1;
		end
		if DelItemByIndex(t[i][1], nCount) ~= 1 then
			nResult = 0;
		end
	end
	if nResult == 1 and Pay(1000000) == 1 then
		--添加新秘籍
		gf_AddItemEx({0, 107, 162, 1}, "T? Linh Chi課 ? Ph?");
		WriteLogEx("Hoat dong thang 11","n﹏g c蕄",1,"T? Linh Chi課 ? Ph?")
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function nothing()

end