--IB物品：琅擐福地密匣 使用对应脚本
--功能描述：让其使用本物品选择并兑换对应的师门秘籍
--代码编写人：赵贵春
--代码编写时间：2007年1月17日
--策划人：刘天
Include("\\script\\online\\zgc_public_fun.lua")

MAX_SEL_PER_PAGE = 5;

way_book ={
	{"D辌h C﹏ Kinh (Thi誹 L﹎ t鬰 gia)",0,107,101},
	{"Nh? Lai Kinh (Thi誹 L﹎ v? t╪g)",0,107,102},
	{"T葃 T駓 Kinh (Thi誹 L﹎ thi襫 t╪g)",0,107,103},
	{"H蕄 tinh m藅 t辌h (Л阯g M玭)",0,107,104},
	{"V筺 Tng m藅 t辌h (Nga My ph藅 gia)",0,107,105},
	{"Thi猲  Ch蕁 H錸 ph? (Nga My t鬰 gia)",0,107,106},
	{"Gi竛g Long Chng ph? (C竔 Bang T躰h y)",0,107,107},
	{"Ф C萿 Tr薾 ph? (C竔 Bang ? y)",0,107,108},
	{"Th竔 C鵦 Ki誱 Kinh (V? ng o gia)",0,107,109},
	{"Th竔 C鵦 T﹎ Kinh (V? ng t鬰 gia)",0,107,110},
	{"To祅 Long thng ph? (Dng M玭 thng k?)",0,107,111},
	{"B? Vng ti詎 ph? (Dng M玭 cung k?)",0,107,112},
	{"Thi Vng m藅 t辌h (Hi謕 чc)",0,107,113},
	{"T? C? m藅 t辌h (Ng? чc C? S?)",0,107,114}
}
--**********************************物品使用主函数************************************
function OnUse(goods_index)
	show_page(1,getn(way_book));
end

function show_page(nPageNum,nRecordCount)
	local selTab = {};
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,way_book[i][1].."/#book_add_dtm("..i..")");
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"\n Trang trc/#show_page("..(nPageNum-1)..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,"\n Trang sau/#show_page("..(nPageNum+1)..","..nRecordCount..")");	
	end;
	tinsert(selTab,"\n сng");
	Say("Xin ch鋘 M藅 t辌h tr蕁 ph竔 c莕 i!",getn(selTab),selTab);
end

--********************************物品使用决定************************************
function book_add_dtm(book_seq)
	Say("B筺  ch鋘"..way_book[book_seq][1]..",mu鑞 i kh玭g?",
	2,
	"уng ?/#book_add("..book_seq..")",
	"в ta suy ngh? l筰/end_dialog")
end
--***********************************秘籍增加**************************************
function book_add(book_seq)
	if GetItemCount(2,1,1010) == 0 then
		Talk(1,"end_dialog","Xin x竎 nh薾 h祅h trang c? <color=red>Lang Ho祅 Ph骳 мa M藅 H筽<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	if DelItem(2,1,1010,1) ~= 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 h祅h trang c? <color=red>Lang Ho祅 Ph骳 мa M藅 H筽<color>!")
		return
	end
	local add_flag = AddItem(way_book[book_seq][2],way_book[book_seq][3],way_book[book_seq][4],1)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g B筺 nh薾 頲 1 M藅 t辌h tr蕁 ph竔!")
	else
		WriteLog(GetName()..":фi M藅 t辌h tr蕁 ph竔:"..way_book[book_seq][1].." th蕋 b筰, k? hi謚:"..add_flag)
	end
end