tTitle = {	--称号名字，称号大类，称号小类，物品编号1，物品编号2，物品编号3
	[2] = {{"H祅h gi?",6,1,2,1,395},{"H鏽 Nguy猲 T╪g",6,2,2,1,396}},
	[3] = {{"Kh? H祅h T╪g",8,1,2,1,399},{"Thi襫 Tu T╪g",8,2,2,1,400}},
	[4] = {{"Sa Di",7,1,2,1,397},{"u T╪g",7,2,2,1,398}},
	[6] = {{"Trang Kh竎h",9,1,2,1,401},{"H? V?",9,2,2,1,402}},
	[8] = {{"Thanh T﹎ S?",10,1,2,1,403},{"V? Y S?",10,2,2,1,404}},
	[9] = {{"T? Kh骳 S?",11,1,2,1,405},{"Ph筺  S?",11,2,2,1,406}},
	[11] = {{"Ch蕄 B竧 е T?",12,1,2,1,407},{"Tr? Gian е T?",12,2,2,1,408}},
	[12] = {{"Ch蕄 B鎛g е T?",13,1,2,1,409},{"Tr鮪g 竎 е T?",13,2,2,1,410}},
	[14] = {{"Thanh Tu o nh﹏",14,1,2,1,411},{"Nh藀 Quan o nh﹏",14,2,2,1,412}},
	[15] = {{"Thanh Phong o nh﹏",15,1,2,1,413},{"S琻 Dng o nh﹏",15,2,2,1,414}},
	[17] = {{"Khinh k? binh",16,1,2,1,415},{"Hi謚 髖",16,2,2,1,416}},
	[18] = {{"Xuy猲 Dng Th?",17,1,2,1,417},{"Й 髖",17,2,2,1,418}},
	[20] = {{"箃 Ph竎h T秐 Nh﹏",18,1,2,1,419},{"Th玦 M謓h T秐 Nh﹏",18,2,2,1,420}},
	[21] = {{"чc T祄 T秐 Nh﹏",19,1,2,1,421},{"Th鵦 T﹎ T秐 Nh﹏",19,2,2,1,422}},
}

function Use_Title(nRoute,nTitleLevel)	--第一个参数是允许使用该物品的路线，第二个参数是称号的等级
	if GetPlayerRoute() ~= nRoute then
		Talk(1,"","B筺 kh玭g th? s? d鬾g v藅 ph萴 l璾 ph竔 kh竎");
		return 0;
	end;
	local selTab = {
			"уng ?/#Confirm("..nTitleLevel..")",
			"в ta suy ngh? l筰/nothing",
			}
	Say("S? d鬾g v藅 ph萴 n祔 c? th? thay i danh hi謚 s? m玭 c馻 b筺, b筺 x竎 nh薾 mu鑞 s? d鬾g?",getn(selTab),selTab);
end;

function Remove_Other_Title()
	for i=6,19 do	--增加新的路线时这个要修改
		for j=1,2 do	--增加新的称号时这个要修改
			RemoveTitle(i,j);
		end;
	end;
end;

function Confirm(nTitleLevel)
	local nRoute = GetPlayerRoute();
	local nGenreIndex = nTitleLevel;
	Remove_Other_Title();
	if DelItem(tTitle[nRoute][nTitleLevel][4],tTitle[nRoute][nTitleLevel][5],tTitle[nRoute][nTitleLevel][6],1) == 1 then
		if AddTitle(tTitle[nRoute][nTitleLevel][2],tTitle[nRoute][nTitleLevel][3]) == 1 then
			SetCurTitle(tTitle[nRoute][nTitleLevel][2],tTitle[nRoute][nTitleLevel][3]);
			Msg2Player("B筺 nh薾 頲 danh hi謚"..tTitle[nRoute][nTitleLevel][1].."{X璶g hi謚}");
		end;
	end;
end;

function nothing()

end;