--�����Ա��䡷�ű�
--by vivi
--08/10/2007

Include("\\script\\task\\lingshi_task.lua")

--��װ�·�table
tTaoZhuang = {
	{"Ng��i m�nh","Kh�n","Kh�m","�o�i","Ly","T�ng S�c m�nh v� G�n c�t","80 tr� xu�ng"},                                 
	{"T�c K�ch","Kh�m","�o�i","Ly","C�n","T�ngS�c m�nh v� Th�n ph�p","80 tr� xu�ng"},                                 
	{"Ki�m kh�","�o�i","Ly","C�n","C�n","T�ng N�i c�ng v� linh ho�t","80 tr� xu�ng"},                                 
	{"��ng ph�","Ly","C�n","C�n","Kh�n","T�ng linh ho�t v� l�c l��ng","80 tr� xu�ng"},                                 
	{"Th�ch kh�ch","C�n","C�n","Kh�n","Kh�m","T�ng th�n ph�p v� linh ho�t","80 tr� xu�ng"},                                 
	{"Phong T�c","Ly","�o�i","Kh�m","C�n","T�ng N�i c�ng v� Th�n ph�p","80 tr� xu�ng"},
	{"Ph�c Long","C�n","Kh�n","Kh�m","�o�i","T�ng N�i c�ng v� G�n c�t","80 tr� xu�ng"},                                 
	{"Huy�n Kh�u","Ch�n","C�n","C�n","Ly","T�ng ph�ng ng� v� c�ng k�ch N�i, ngo�i c�ng","80 tr� xu�ng"},                                 
	{"M�nh h�","Kh�n","T�n","Kh�m","�o�i","S�t th��ng t�ng ","80 tr� xu�ng"},                                 
	{"T��ng Ph��ng","C�n","Kh�m","Ch�n","�o�i","T�ng Sinh l�c v� N�i l�c","80 tr� xu�ng"},                                 
	{"Giao Long","Kh�m","C�n","Ly","T�n","T�ng Sinh l�c v� N�i l�c","80 tr� xu�ng"},                                 
	{"Uy phong","Ch�n","Ch�n","Kh�n","C�n","C�ng k�ch + ","80 tr� xu�ng"},                                 
	{"Hi�p s�","C�n","Kh�m","T�n","T�n","T�ng Sinh l�c","80 tr� xu�ng"},      	
	{"Ti�m long","C�n","Kh�n","Kh�m","�o�i","T�ng Sinh l�c","80 ho�c 80 tr� l�n"},
	{"H�n ��n","Kh�n","Kh�m","�o�i","Ly","T�ng S�c m�nh v� G�n c�t","80 ho�c 80 tr� l�n"},
	{"Ly H�a","Kh�m","�o�i","Ly","C�n","T�ngS�c m�nh v� Th�n ph�p","80 ho�c 80 tr� l�n"},
	{"Huy�n B�ng","�o�i","Ly","C�n","C�n","T�ng N�i c�ng v� linh ho�t","80 ho�c 80 tr� l�n"},
	{"Huy�n Ho�ng","Ly","C�n","C�n","Kh�n","T�ng linh ho�t v� l�c l��ng","80 ho�c 80 tr� l�n"},
	{"C�n B�ng","C�n","C�n","Kh�n","Kh�m","T�ng th�n ph�p v� linh ho�t","80 ho�c 80 tr� l�n"},
	{"Kh�ng Long","Ly","�o�i","Kh�m","C�n","T�ng N�i c�ng v� Th�n ph�p","80 ho�c 80 tr� l�n"},
	{"Ni�t B�n","C�n","Kh�n","Kh�m","�o�i","T�ng N�i c�ng v� G�n c�t","80 ho�c 80 tr� l�n"},
	{"Huy�n V�","Ch�n","C�n","C�n","Ly","T�ng ph�ng ng� v� c�ng k�ch N�i, ngo�i c�ng","80 ho�c 80 tr� l�n"},
	{"H� tr�ng","Kh�n","T�n","Kh�m","�o�i","S�t th��ng t�ng ","80 ho�c 80 tr� l�n"},
	{"Chu T��c","C�n","Kh�m","Ch�n","�o�i","T�ng Sinh l�c v� N�i l�c","80 ho�c 80 tr� l�n"},
	{"Thanh Long","Kh�m","C�n","Ly","T�n","T�ng Sinh l�c v� N�i l�c","80 ho�c 80 tr� l�n"},
	{"V� Song","Ch�n","Ch�n","Kh�n","C�n","C�ng k�ch + ","80 ho�c 80 tr� l�n"},
	{"Qu�c S�","C�n","Kh�m","T�n","T�n","T�ng Sinh l�c","80 ho�c 80 tr� l�n"}                          
	}	
	
tTiandi = {
	{"Thi�n ��a Ti�m Long","C�n","Kh�n","Kh�m","�o�i","T�ng Sinh l�c","T�ng Sinh l�c"," t� 119 tr� l�n"},
	{"Tr�i ��t h�n ��n","Kh�n","Kh�m","�o�i","Ly","T�ng S�c m�nh v� G�n c�t","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Thi�n ��a Ly H�a","Kh�m","�o�i","Ly","C�n","T�ngS�c m�nh v� Th�n ph�p","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Thi�n ��a Huy�n B�ng","�o�i","Ly","C�n","C�n","T�ng N�i c�ng v� linh ho�t","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Thi�n ��a Huy�n Ho�ng","Ly","C�n","C�n","Kh�n","T�ng linh ho�t v� l�c l��ng","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Thi�n ��a C�n B�ng","C�n","C�n","Kh�n","Kh�m","T�ng th�n ph�p v� linh ho�t","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Thi�n ��a Kh�ng Long","Ly","�o�i","Kh�m","C�n","T�ng N�i c�ng v� Th�n ph�p","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Thi�n ��a Ni�t B�n","C�n","Kh�n","Kh�m","�o�i","T�ng N�i c�ng v� G�n c�t","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"},
	{"Tr��ng Sinh Huy�n V�","Ch�n","C�n","C�n","Ly","T�ng ph�ng ng� v� c�ng k�ch N�i, ngo�i c�ng","T�ng Sinh l�c"," t� 119 tr� l�n"},
	{"Hung Tinh B�ch H�","Kh�n","T�n","Kh�m","�o�i","S�t th��ng t�ng ","T�ng Sinh l�c"," t� 119 tr� l�n"},
	{"Chu T��c B�t Di�t","C�n","Kh�m","Ch�n","�o�i","T�ng Sinh l�c v� N�i l�c","T�ng Sinh l�c"," t� 119 tr� l�n"},
	{"T�i Thi�n Thanh Long","Kh�m","C�n","Ly","T�n","T�ng Sinh l�c v� N�i l�c","T�ng Sinh l�c"," t� 119 tr� l�n"},
	{"Thi�n H� V� ��ch","Ch�n","Ch�n","Kh�n","C�n","C�ng k�ch + ","T�ng Sinh l�c"," t� 119 tr� l�n"},
	{"Thi�n Chi Qu�c S�","C�n","Kh�m","T�n","T�n","T�ng Sinh l�c","N�ng cao gi�i h�n n�i l�c v� sinh m�nh"," t� 119 tr� l�n"} 
	};	
	
--���Ե����
tGuaWei = {--��λ ����ʯ��ż ������ż
	{"C�n","L�","L�","L�","L�"},
	{"Kh�n","Ch�n","Ch�n","Ch�n","Ch�n"},
	{"Ly","L�","Ch�n","L�","Ch�n"},
	{"Kh�m","Ch�n","L�","Ch�n","L�"},	
	{"Ch�n","L�","Ch�n","Ch�n","L�"},
	{"T�n","Ch�n","L�","L�","Ch�n"},
	{"C�n","Ch�n","Ch�n","L�","L�"},
	{"�o�i","L�","L�","Ch�n","Ch�n"}
	}

function OnUse()
	local strtab = {
		"C�ch ch� t�o trang b� B�t Qu�i/how_make_bagua",
		"L�m sao l�y Linh Th�ch/how_get_lingshi",
		"L�m sao k�ch ho�t b� B�t Qu�i/how_jihuo_bagua",
		"L�m sao �� c� ���c nguy�n th�ch, linh th�ch v� linh th�ch ph�i ph��ng/ziyuanhuode",
		"Y�u c�u c�c trang b� li�n quan qu� B�t Qu�i/dazao_guawei",
		"Y�u c�u b� trang ph�c B�t Qu�i li�n quan/bagua_taozhuang_yaoqiu",
--		"Nh�n v�t li�n quan ��n h� th�ng B�t Qu�i/bagua_chuansong"
		}
--	if GetTask(TASK_LINGSHI_ID) == 8 or (GetTask(TASK_LINGSHI_ID) == 0 and GetLevel() > 20) then
--		tinsert(strtab,"Ta mu�n m� ra nhi�m ra h� th�ng B�t Qu�i Linh Th�ch/talk_III");
--	end
		tinsert(strtab,"T�m th�i ch�a ngh� ra g�!/nothing");
	Say("B�n mu�n t�m hi�u ph��ng di�n n�o?",
		getn(strtab),
		strtab)
end

function how_make_bagua()
	Talk(1,"how_make_bagua2","Ch� t�o trang b� ch� t�o B�t Qu� c� 3 b��c\n B��c 1, ph�i c� trang b� c� b�n c� linh kh� tr�i ��t, b�n c� th� t�o ra trang b� n�y qua k� n�ng s�ng. M�i trang b� ��u c� 1 <color=red>gi�i h�n gi� tr� linh kh� v� �n S�<color> gi�i h�n gi� tr� linh kh� s� quy�t ��nh �u �i�m c�a linh th�ch c� th� kh�m n�m v� B�t Qu�i Qu�i V� s� xu�t hi�n trong t��ng lai, c�n �n s� s� quy�t ��nh s� l��ng linh th�ch c� th� kh�m n�m, n�u mu�n l�m ra trang b� B�t Qu�i, b�t bu�c ph�i c� 3 thu�c t�nh �n. Mu�n l�m ra m�t b� trang b� c� gi� tr� linh kh� cao, ph�i th�m nhi�u v�t ph�m c� gi� tr� trong l�c ��c, t�ng gi� tr� v�t ph�m c�ng cao, t� l� trang b� gi�i h�n c�a gi� tr� linh th�ch t�o ra c�ng l�n.");
end

function how_make_bagua2()
	Talk(1,"how_make_bagua3","<color=green>B�t Qu�i B�o �i�n<color> B��c 2, l�m xong trang b� c� b�n r�i, m�i b�t ��u kh�m n�m linh th�ch. Tr�n m�i linh th�ch ��u c� 1 �i�m linh kh�, n�u tr� s� �i�m linh kh� l� s� l�, linh th�ch l� D��ng, tr� s� linh kh� l� ch�n s�l� �m. To�n b� tr� linh kh� <color=red>c�a linh th�ch<color> kh�m tr�n trang b� c� b�n <color=red>kh�ng v��t qu�<color> <color=red>gi�i h�n �i�m linh th�ch<color>c�a trang b� c� b�n n�y. L�c �i�m linh kh� v� linh th�ch c�a b� trang b� c� b�n n�y <color=red>b�ng v�i<color> gi�i h�n �i�m linh kh�, s� tr� th�nh trang b� B�t Qu�i ch�a k�ch ho�t. N�u mu�n xem c�ch t�o qu�i v� tr�n trang b� c� th� xem th�m trong <color=red>m�c th� 6<color=red>.");
end

function how_make_bagua3()
	Talk(1,"OnUse","<color=green>B�t Qu�i B�o �i�n<color> B��c 3, sau khi �� c� trang b� B�t Qu�i ch�a k�ch ho�t, v�n ch�a th�y ���c trang b� B�t Qu�i k�ch ho�t, mu�n tham gia k�ch ho�t trang b� B�t Qu�i ph�i <color=red>k�ch ho�t<color> thu�c t�hh. Mang trang b� B�t Qu�i �� k�ch ho�t, t�i c�c th�nh ph� t�m <color=red>Th�n Du Ch�n Nh�n<color> �� nh� k�ch ho�t, nh�ng ph�i ti�u hao Th�i H� B�t Qu�i B�i. Trang b� B�t Qu�i sau khi �� k�ch ho�t c� th� mang ��n C�ng D� Th� Gia <color=red> h�p th�nh b� trang b� B�t Qu�i<color>!");
end

function how_get_lingshi()
	Talk(1,"how_get_lingshi2","<color=green>B�t Qu�i B�o �i�n<color> B��c 1, mu�n c� ���c linh th�ch, ph�i c� nguy�n th�ch v� trang b� c� hi�u qu�. Nguy�n th�ch c� th� t�ch ra l�y thu�c t�nh tr�n trang b�, sau khi t�ch th�nh c�ng, nguy�n th�ch n�y s� bi�n th�nh linh th�ch t��ng �ng. Nguy�n th�ch c� t�c d�ng cao th�p kh�c nhau, ph�n th�nh 7 c�p, n�u ��ng c�p nguy�n th�ch kh�ng ��, c�ng kh�ng th� h�p thu thu�c t�nh c�p cao c�a trang b� �i k�m. Nguy�n th�ch ph�n th�nh <color=red>Thi�n, ��a, Nh�n<color>, ph�n bi�t d�a tr�n c�c thu�c t�nh <color=red> 1, 2, 3<color> t��ng �ng tr�n trang b�. Mu�n t�ch ���c thu�c t�nh n�o th� ph�i s� d�ng lo�i nguy�n th�ch ��.");
end

function how_get_lingshi2()
	Talk(1,"OnUse","<color>: Hai, trang b� c� thu�c t�nh linh kh� cao c�p r�t �t, mu�n nh�n ���c Linh Th�ch cao c�p, c�n m�t c�ch kh�c, t� m�nh<color=red>h�p th�nh Linh Th�ch<color>, bi�n nhi�u Linh Th�ch th�nh m�t Linh Th�ch, n�u nhi�u Linh Th�ch c�ng lo�i, kh� n�ng h�p th�nh Linh Th�ch s� cao. Th�i chi�n Th��ng c� Phong Th�n c� truy�n l�i ph��ng ph�p ph�i h�p h�p th�nh Linh th�ch, n�u l�y ���c ph��ng ph�p ph�i h�p n�y, l�m theo ghi ch�p, b� sung Linh Th�ch t��ng �ng, c� th� h�p th�nh Linh Th�ch, nh�ng ch�a C�c ng��i th�nh c�ng...");
end

function how_jihuo_bagua()
	Talk(1,"how_jihuo_bagua2","B�t Qu�i trong tr�i ��t v�n c� t��ng t�c l�n nhau, thi�n bi�n v�n h�a h�a, C�ng D� Th� Gia c� ��i ra s�c nghi�n c�u�");
end

function how_jihuo_bagua2()
	Talk(1,"how_jihuo_bagua3","B��c 1, ph�i h�p th�nh b� trang b� B�t Qu�i, tr��c h�t ph�i c� <color=red>trang b� B�t Qu�i <color> t��ng �ng. Sau khi t�p h�p ��y ��, ��n C�ng D� Th� Gia h�p th�nh. M�i b� trang b� B�t Qu�i c� tr� Linh kh� kh�c nhau, hi�u qu� h�p th�nh trang b� B�t Qu�i c� li�n quan ��n <color=red>tr� s� linh kh� k�ch ho�t<color>. N�utr� linh kh� k�ch ho�t qu� th�p, hi�u qu� sau khi h�p th�nh s� th�p. L�c h�p th�nh n�u cho th�m c�c v�t ph�m <color=red>gi� tr�<color> th� s� gi�m thi�u t�n th�t!");
end

function how_jihuo_bagua3()
	Talk(1,"OnUse","B��c 2, n�u thu�c t�nh k�ch ho�t cho trang b� B�t Qu�i �� kh�ng ��, ph�i ph�c h�i l�i tr�ng th�i ban ��u. Nh�ng n�u th�t b�i th� s� <color=red>t�n th�t<color> m�t s� trang b� trong b� B�t Qu�i ��. N�u mu�n n�ng cao kh� n�ng th�nh c�ng v� gi�m b�t t�n th�t, trong l�c ph�c h�i l�i ph�i th�m c�c lo�i v�t ph�m c� gi� tr�");
end

function bagua_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTaoZhuang)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTaoZhuang[nPageNum*nPage+i][1].."Trang b�: �i�m linh kh� ��n "..tTaoZhuang[nPageNum*nPage+i][7].."]["..tTaoZhuang[nPageNum*nPage+i][2]..":"..tTaoZhuang[nPageNum*nPage+i][3]..":"..tTaoZhuang[nPageNum*nPage+i][4]..":"..tTaoZhuang[nPageNum*nPage+i][5].."]["..tTaoZhuang[nPageNum*nPage+i][6].."]/#taozhuang_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"Trang tr��c/#bagua_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"Trang k�/#bagua_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"tr� l�i/OnUse");
	Say("Trang b� B�t Qu�i c�: ",
		getn(tDiaTab),
		tDiaTab)
end	

function taozhuang_detail(nPage,nType)
	Talk(1,"#bagua_taozhuang("..nPage..")","\n<color=red>"..tTaoZhuang[nType][1].."<color>trang b�<color=red>"..tTaoZhuang[nType][2].."<color>Qu�i ��u B�+<color=red>"..tTaoZhuang[nType][3].."<color>Qu�i Y Ph�c+<color=red>"..tTaoZhuang[nType][4].."<color>Qu�i H� Trang+<color=red>"..tTaoZhuang[nType][5].."<color>Qu�i V� Kh�. Ph�m vi �i�m linh kh� c�n cho m�i trang b� l�: <color=red>"..tTaoZhuang[nType][7].."<color>. Thu�c t�nh k�ch ho�t l�: <color=red>"..tTaoZhuang[nType][6].."<color>")
end

function dazao_guawei()
	local strtab = {};
	for i=1,getn(tGuaWei) do
		tinsert(strtab,tGuaWei[i][1]..": T�ng linh kh� ["..tGuaWei[i][5].."] Th� t� 3 kh�ng linh kh� ["..tGuaWei[i][2].."]["..tGuaWei[i][3].."]["..tGuaWei[i][4].."]/#guawei_detail("..i..")");
	end
	tinsert(strtab,"Ta bi�t r� c� r�i, ta ta ph�i hi�u r� n�i dung c�a n�./OnUse");
	Say("B�n mu�n t�m hi�u qu�i v� n�o?",
		getn(strtab),
		strtab);
end

function ziyuanhuode()
	Say("Nh�ng v�t li�n quan v�i linh th�ch n�y ph�i l�m sao �� c�!? Ph�i t�m hi�u cho k�!",
	5,
	"Nh�n ���c Nguy�n Th�ch/yuanshihuode",
	"Nh�n ���c Linh Th�ch/lingshihuode",
	"H�p th�nh Linh Th�ch/hechenglingshi",	
	"Bi�t ���c c�ch ph�i h�p Linh Th�ch /lingshipeifanghuode",
	"��n h�i th�m th�i m�!/SayHello"
	)
end

function yuanshihuode()
	Talk(1,"OnUse","B�n c� th� mua Nguy�n th�ch<color> �<color=red>ch� ti�m t�p h�a<color>, c�n ch� � l� v� tr� thu�c t�nh linh kh� t��ng �ng v�i c�c linh th�ch kh�c nhau th� kh�ng gi�ng nhau, thu�c t�nh cao nh�t c�a c�c ��ng c�p nguy�n th�ch kh�c nhau ���c l�y ra c�ng kh�ng gi�ng nhau!")
end

function lingshihuode()
	Talk(1,"OnUse","Ngo�i d�ng Nguy�n Th�ch �� r�t Linh kh� trang b� ra, nghe n�i hai n��c T�ng Li�u �� c� v� t��ng s�, ph�m ai tham gia <color=red>chi�n tr��ng Nh�n M�n quan<color> ��u ���c th��ng <color=red>Linh Th�ch<color>, nh�ng mu�n c� ���c Linh Th�ch ph�i xem x�t c�ng tr�ng v� bi�u hi�n c�a h�. Truy�n r�ng b�n s�t th� r�t h�ng th� v�i Linh Th�ch, c�c anh h�ng khi g�p b�n <color=red>s�t th�<color> c�n l�u t�m xem ch�ng c� mang theo Linh Th�ch n�y kh�ng.")
end

function hechenglingshi()
	Talk(1,"OnUse"," Linh Th�ch n�y th� gian r�t hi�m th�y. C�c v� ti�n nh�n �� v� c�ng kh� c�c nghi�n c�u ra <color=red>Linh Th�ch ph�i ph��ng<color>, ch� c�n <color=red>Linh Th�ch ph�i ph��ng<color> v� <color=red>Linh Th�ch<color> c�ng ��t tr�n c�t h�p th�nh Linh Th�ch �� t�o ra <color=red>Linh Th�ch theo ph�i ph��ng<color>. Kh�ng th�m ph�i ph��ng, t�y � k�p h�p Linh Th�ch tuy c� th� h�p th�nh, nh�ng th�nh c�ng hay kh�ng c�n do Tr�i ��nh.")
end

function lingshipeifanghuode()
	Talk(1,"OnUse","Linh Th�ch ph�i ph��ng t� Th��ng c� l�u truy�n ��n nay kh�ng nhi�u...Ng��i c�ng hi�n cho m�n ph�i, ho�n th�nh <color=red>nhi�m v� s� m�n<color> m�i ng�y, tin r�ng ch��ng m�n s� hi�u ���c s� n� l�c c�a ng��i. C�c s�t th� cao c�p trong <color=red>S�t th� ���ng<color> ��u c� mang theo ph�i ph��ng, nh�ng c� l�y ���c hay kh�ng c�n ph�i xem v�n kh� c�a ng��i n�a!")
end

function guawei_detail(nType)
	if nType > 0 and nType <= getn(tGuaWei) then
		local strtab = {
			"Xem Qu�i v� kh�c/dazao_guawei",
			"Tho�t/nothing"};
		Say("Ch� t�o 1 b� <color=yellow>"..tGuaWei[nType][1].."<color>Qu�i trang b� c�n \ntrang b�: gi�i h�n �i�m linh kh� l� <color=yellow>"..tGuaWei[nType][5].."<color>Trang b� s�\nKh�m n�m vi�n linh th�ch th� 1: �i�m linh kh� kh�m n�m l� <color=yellow>"..tGuaWei[nType][2].."<color>linh th�ch s�\nKh�m n�m vi�n linh th�ch th� 2: �i�m linh kh� kh�m n�m l� <color=yellow>"..tGuaWei[nType][3].."<color>linh th�ch s�\nkh�m n�m vi�n linh th�ch th� 3: d�i�m linh kh� kh�m n�m l� <color=yellow>"..tGuaWei[nType][4].."<color>linh th�ch s�\nB�t Qu�t trang b� v� �i�m linh kh� c�a linh th�ch ph�i ph� h�p tr�n b�ng ch� d�n, l�c �i�m c�a 3 vi�n linh th�ch b�ng v�i gi�i h�n �i�m linh kh� trang b� t�c l� h�nh th�nh trang b� b�t qu�i ch�a k�ch ho�t.",
			getn(strtab),
			strtab)
	end
end

function nothing()

end 

function bagua_chuansong()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"OnUse","Khu v�c hi�n t�i kh�ng th� d�ng ch�c n�ng truy�n t�ng n�y!");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"OnUse","Xin s� d�ng ch�c n�ng truy�n t�ng n�y trong khu v�c h�a b�nh.");
		return
	end
	Say("�� g�i l� b�o �i�n, ���ng nhi�n ph�i kh�c c�c v�t t�m th��ng! Ch� c�n t�n 1 ch�t ti�n l� c� th� ��a ng��i ��n n�i mu�n ��n!",
	5,
	--"Ng��i k�ch ho�t B�t Qu�i trang b� v� l�y linh th�ch/gongyeshijia",
	--"Ng��i gi�p ch� t�o trang b� linh kh� v� ��c l�/zhizuoxi",
	"Ng��i gi�p k�ch ho�t trang b� b�t qu�i!/shenyouzhenren",
	--"Ng��i gi�p kh�m n�m linh th�ch v� t�ng trang b� B�t Qu�i./liutiejiang",
	"Ch� xem th�!/SayHello"	
	)
end

function gongyeshijia()
	Say("C�c truy�n nh�n c�a C�ng �� Th� Gia � ��u c�ng c�. L�y v� h�p th�nh Linh th�ch h� ��u gi�p ���c. Ta c� th� ��a ��n ng��i ��, thu ph� <color=red>20 b�c<color> nh�!.",
	4,
	--"C�ng D� Binh- T��ng D��ng/gongyebing",
	--"C�ng D� Kh�- D��ng Ch�u./gongyeqi",
	--"C�ng D� C� -��i L�/gongyeju",
	"Ta kh�ng mu�n t�m h�./SayHello"	
	)
end

function zhizuoxi()
	Say("Thi�n h� th� r�n kh�o tay r�t nhi�u, m�y v� n�y ��u l� cao th� trong trong ��, b�t qu�i v� c�c trang b� c� l� nh�t ��nh ph�i t�m h� m�i ���c. Thu ph� <color=red>101 b�c<color> nh�!",
	7,
	"Bi�n Kinh to l�n, binh kh� ���c ch� t�o nhi�u, ch� y�u l� c�n, th��ng, thi�n tr��ng/moda",
	"M�c Nh� � Th�nh ��, thi�n v� ch� t�o v� kh� ng�n d�i, ch� y�u l� �ao, ki�m, song �ao, h� th�./moer",
	"M�c Tam � T��ng D��ng, thi�n v� ch� t�o binh kh� k� m�n, ch� y�u �m kh�, ��n, b�t, tr�o, cung/mosan",
	"C�m N��ng � Th�nh ��, thi�n v� d�t v�i, m�i h�nh d�ng ��u c� th� h�c ���c t� b� �y./jinniang",
	"T� Quy�n c� n��ng � ��i L�, thi�n v� d�t h� trang/zijuan",
	"Minh s� ph� � T��ng D��ng, chuy�n v� Kh�i qu�n/mingshifu",
	"Ta kh�ng mu�n t�m h�./SayHello"	
	)
end

function shenyouzhenren()
	Say("N�i ��n B�t Qu�i, ph�i n�i ��n Th�n Du Ch�n Nh�n, k�ch ho�t trang b� b�t qu�i ch�a k�ch ho�t ph�i d�a v�o �ng ta, thu ti�n<color=red>10 b�c<color> nh�.",
	4,
	"Th�n Du Ch�n Nh�n � Bi�n Kinh/bianjingshenyou",
	"Th�n Du Ch�n Nh�n � Th�nh ��/chengdushenyou",
	"Th�n Du Ch�n Nh�n � Tuy�n Ch�u/quanzhoushenyou",
	"Ta kh�ng mu�n t�m h�./SayHello"	
	)
end
	
function liutiejiang()
	Say("C��ng h�a trang b�, c� ai kh�ng bi�t danh ti�ng c�a th� r�n L�u! Thu ti�n <color=red>20 b�c<color>.",
	2,
	"Th� r�n L�u � T��ng D��ng/xiangyangliutie",
	"Ta kh�ng mu�n t�m h�./SayHello"	
)
end

function moneygo1()
	return	PrePay(2000)
end;

function moneygo2()
	return	PrePay(1000)
end;

function gongyebing()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
		NewWorld(350,1399,2992)
		SetFightState(0);
	end
end

function gongyeqi()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(150,1647,3152)
			SetFightState(0);
	end
end

function gongyeju()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(400,1493,3058)
			SetFightState(0);
	end
end

function xiangyangliutie()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(350,1415,2930)
			SetFightState(0);
	end
end

function moda()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(200,1426,3025)
			SetFightState(0);
	end
end

function moer()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(300,1709,3459)
			SetFightState(0);
	end
end

function mosan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(350,1345,2929)
			SetFightState(0);
	end
end

function jinniang()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(300,1862,3479)
			SetFightState(0);
	end
end

function zijuan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(400,1409,2985)
			SetFightState(0);
	end
end

function mingshifu()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(350,1546,2935)
			SetFightState(0);
	end
end
	
function bianjingshenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(200,1151,2855)
			SetFightState(0);
	end
end

function chengdushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(300,1975,3557)
			SetFightState(0);
	end
end

function quanzhoushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H�nh nh� ng��i kh�ng �� ti�n?")
	else 
		CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
			NewWorld(100,1379,2860)
			SetFightState(0);
	end
end

function SayHello()

end

function bagua_taozhuang_yaoqiu()
	local strtab = {
		"trang b� B�t Qu�i Ph� th�ng /#bagua_taozhuang(0)",
--		"���������װ/#tiandi_taozhuang(0)",
		"tr� l�i/OnUse"};
	Say("Ng��i mu�n xem trang b� b�t qu�i n�o?",
		getn(strtab),
		strtab)
end

function tiandi_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTiandi)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTiandi[nPageNum*nPage+i][1].."Trang b�: �i�m linh kh� ��n "..tTiandi[nPageNum*nPage+i][8].."]["..tTiandi[nPageNum*nPage+i][2]..":"..tTiandi[nPageNum*nPage+i][3]..":"..tTiandi[nPageNum*nPage+i][4]..":"..tTiandi[nPageNum*nPage+i][5].."]/#tiandi_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"Trang tr��c/#tiandi_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"Trang k�/#tiandi_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"tr� l�i/OnUse");
	Say("Trang b� Thi�n ��a Huy�n ho�ng bao g�m thu�c t�nh trang b� Ph� th�ng B�t Qu�i.",
		getn(tDiaTab),
		tDiaTab)
end	

function tiandi_detail(nPage,nType)
	Talk(1,"#tiandi_taozhuang("..nPage..")","\n<color=red>"..tTiandi[nType][1].."<color>trang b�<color=red>"..tTiandi[nType][2].."<color>Qu�i ��u B�+<color=red>"..tTiandi[nType][3].."<color>Qu�i Y Ph�c+<color=red>"..tTiandi[nType][4].."<color>Qu�i H� Trang+<color=red>"..tTiandi[nType][5].."<color>Qu�i V� Kh�. Ph�m vi �i�m linh kh� c�n cho m�i trang b� l�: <color=red>"..tTiandi[nType][8].."<color>. Thu�c t�nh k�ch ho�t l�: <color=red>"..tTiandi[nType][6].."."..tTiandi[nType][7].."<color>.")
end