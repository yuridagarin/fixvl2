--��ұ����npc�ű�
--by vivi
--08/13/2007

Include("\\script\\task\\lingshi_task.lua")

--npc����Ӧ���ݡ�����������
tNpcName = {"C�ng D� kh� ","C�ng D� binh ","C�ng D� c� "}

function main()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	if BigGetItemCount(2,0,1022) < 1 and Zgc_pub_goods_add_chk(1,1) == 1 then
		AddItem(2,0,1022,1,1);
	end
	local strtab = {
		"Ta mu�n h�p th�nh trang b� B�t qu�i/hecheng_bagua",
		"Ta mu�n g� b� trang b� B�t qu�i/chongzu_bagua",
		"Ta mu�n nh�n Linh Th�ch/chouqu_lingshi",
--		"Ta mu�n h�p th�nh Linh Th�ch/hecheng_lingshi",
--		"Nh�n ���c Nguy�n Th�ch, Linh Th�ch v� Linh Th�ch ph�i ph��ng/ziyuanhuode",
--		"Thuy�t minh h�p th�nh b� B�t Qu�i/detail_bagua",
--		"L�nh 'b�o �i�n B�t Qu�i'/bagua_baodian"
		}
	--if GetTask(TASK_LINGSHI_ID) == 1 or GetTask(TASK_LINGSHI_ID) == 4 or GetTask(TASK_LINGSHI_ID) == 5 or GetTask(TASK_LINGSHI_ID) == 7 then
		--tinsert(strtab,"Ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/new_task");
	--end
		tinsert(strtab,"Kh�ng c�n ��u/nothing");
	Say("<color=green>"..sNowNpc.."<color>: ch�nh l� ta "..sNowNpc.."Ta c�n c� hai huynh ��, "..sXiongDi..", l� truy�n nh�n c�a C�ng tr� th� gia, ta v� l�o L�u � T��ng D��ng �� nghi�n c�u ch� t�o th�nh c�ng Linh Th�ch truy�n thuy�t v� b� trang b� B�t Qu�i th�n k�. Ngo�i ra c�n ch� ra ch�c n�ng <color=red>B�t Qu�i l�y Linh Th�ch<color>. Kh�ng tin , h�y nh�n ch�n <color=green>L�y Linh Th�ch<color> xem th� tin t�c!",
		getn(strtab),
		strtab)
end

function hecheng_bagua()
	BaguaCompose(); --�ϳɰ�����װ����
end

function chongzu_bagua()
	--BaguaDepose(); --����������װ����
	--Talk(1,"","���Դ�ɢ���Ѿ�ȫȨ����<color=yellow>����������������<color>�ˣ���ȥ���������ɡ�");
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>: Xin ch� �! c�n ph�i n�p v�o <color=red> 10000 l��ng gi� tr� <color> m�i c� th� ��m b�o khi t�ch ra trang b� c�a b�n kh�ng bi�n m�t.",
		2,
		"M� giao di�n ��c/dasan_bagua_item",
		"Kh�ng c� g�/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --����������װ����
end

function chouqu_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	--TransformAttr(); --��ȡ��ʯ
	Say("<color=green>"..sNowNpc.."<color>: Trang b� B�t Qu�i c�ng c� th� l�y ���c Linh Th�ch. B�ng h�u c� mu�n t�m hi�u huy�n c� n�y kh�ng?",2,
	"Mu�n ch�!/how_chouqu",
	"Kh�i �i! Ta hi�u r�i/chouqu_lingstone")
end

function how_chouqu()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"chouqu_lingstone","<color=green>"..sNowNpc.."<color>: Ch� c�n <color=red>trang b� �� kh�m qua Linh Th�ch<color> l� c� th� l�y ���c Linh Th�ch ra, Trang b� B�t Qu�i th� kh�ng th�! Ch� c�n d�ng <color=green>Thi�n C� to�n<color> l� c� th� l�y, nh�ng ch� l�y ���c <color=red>1 Linh Th�ch<color> ra. L�y ra xong <color=green>trang b� s� m�t<color>. Linh Th�ch n�u b� l�y ra nhi�u l�n c� th� bi�n t�nh, <color=red>tr� Linh kh� c� th� thay ��i<color> nh�ng <color=green>Thu�c t�nh �m d��ng<color> th� v�n gi� nguy�n. Thi�n C� to�n c� th� xem � <color=yellow>Ng� C�c<color>!")
end

function chouqu_lingstone()
	TransformAttr()
end

function hecheng_lingshi()
	ComposeLingShi();--�ϳ���ʯ
end

function ziyuanhuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>: Xin h�y xem k� c�c ph��ng ph�p c� ���c nh�ng v�t ph�m li�n quan Linh Th�ch!",
	5,
	"Nh�n ���c Nguy�n Th�ch/yuanshihuode",
	"Nh�n ���c Linh Th�ch/lingshihuode",
	"H�p th�nh Linh Th�ch/hechenglingshi",
	"Bi�t ���c c�ch ph�i h�p Linh Th�ch /lingshipeifanghuode",
	"��n h�i th�m th�i m�!/SayHello"
	)
end

function yuanshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: C� th� ��n <color=red>Ch� ti�m T�p h�a<color> �� mua <color=red>Nguy�n Th�ch<color>. C�n ch� �, Nguy�n Th�ch kh�c nhau c� v� tr� thu�c t�nh Linh kh� t��ng �ng kh�c nhau, Nguy�n Th�ch kh�ng c�ng ��ng c�p l�y ���c thu�c t�nh t�i cao kh�c nhau, n�n xem tr��c thuy�t minh c� li�n quan ��n Nguy�n Th�ch r�i h�y r�t.")
end

function lingshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>Ngo�i d�ng Nguy�n Th�ch �� r�t Linh kh� trang b� ra, nghe n�i hai n��c T�ng Li�u �� c� v� t��ng s�, ph�m ai tham gia <color=red>chi�n tr��ng Nh�n M�n quan<color> ��u ���c th��ng <color=red>Linh Th�ch<color>, nh�ng mu�n c� ���c Linh Th�ch ph�i xem x�t c�ng tr�ng v� bi�u hi�n c�a h�. Truy�n r�ng b�n s�t th� r�t h�ng th� v�i Linh Th�ch, c�c anh h�ng khi g�p b�n <color=red>s�t th�<color> c�n l�u t�m xem ch�ng c� mang theo Linh Th�ch n�y kh�ng.")
end

function hechenglingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Linh Th�ch n�y th� gian r�t hi�m th�y. C�c v� ti�n nh�n �� v� c�ng kh� c�c nghi�n c�u ra <color=red>Linh Th�ch ph�i ph��ng<color>, ch� c�n <color=red>Linh Th�ch ph�i ph��ng<color> v� <color=red>Linh Th�ch<color> c�ng ��t tr�n c�t h�p th�nh Linh Th�ch �� t�o ra <color=red>Linh Th�ch theo ph�i ph��ng<color>. Kh�ng th�m ph�i ph��ng, t�y � k�p h�p Linh Th�ch tuy c� th� h�p th�nh, nh�ng th�nh c�ng hay kh�ng c�n do Tr�i ��nh.")
end

function lingshipeifanghuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].." v�"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].." v�"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>: Linh Th�ch ph�i ph��ng t� Th��ng c� l�u truy�n ��n nay kh�ng nhi�u...Ng��i c�ng hi�n cho m�n ph�i, ho�n th�nh <color=red>nhi�m v� s� m�n<color> m�i ng�y, tin r�ng ch��ng m�n s� hi�u ���c s� n� l�c c�a ng��i. C�c s�t th� cao c�p trong <color=red>S�t th� ���ng<color> ��u c� mang theo ph�i ph��ng, nh�ng c� l�y ���c hay kh�ng c�n ph�i xem v�n kh� c�a ng��i n�a!")
end

function detail_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	local strtab = {
		"L�m sao ch� t�o trang b� B�t Qu�i?/how_make_bagua",
		"L�m sao nh�n ���c Linh Th�ch/how_get_lingshi",
		"L�m sao k�ch ho�t b� B�t Qu�i/how_jihuo_bagua",
		"T�m th�i ch�a ngh� ra g�!/nothing"	
		}
	Say("<color=green>"..sNowNpc.."<color>: B�t Qu�i t��ng tr�ng cho 8 th� l�c t� nhi�n thi�n, ��a, l�i, phong, th�y, h�a, s�n, tr�ch. Thi�n ��a v�n v�t, kh�ng c� v�t n�o kh�ng ��nh �m d��ng, kh�ng ph�n B�t Qu�i. N�u ng��i c� trang b� c� n�ng l�c B�t Qu�i, ta c� th� gi�p k�ch ho�t n�ng l��ng B�t Qu�i.",
		getn(strtab),
		strtab);	
end

function how_make_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua2","<color=green>"..sNowNpc.."<color> Mu�n ch� t�o trang b� B�t Qu�i kh�ng d� ��u\nM�t, ph�i c� trang b� c� b�n c� Thi�n ��a linh kh�, ng��i c� th� ch� t�o trang b� n�y nh� k� n�ng s�ng. M�i trang b� c� m�t <color=red>gi�i h�n tr� Linh kh� v� s� l�<color>, gi�i h�n tr� Linh kh� quy�t ��nh �� b�n c�a Linh Th�ch ���c kh�m v� Qu�i v� B�t Qu�i s� xu�t hi�n, s� l� quy�t ��nh s� l��ng Linh Th�ch ���c kh�m, n�u mu�n t�o trang b� B�t Qu�i, c�n c� 3 l�. Mu�n t�o m�t trang b� c� gi�i h�n tr� Linh kh� cao, ph�i th�m nhi�u v�t ph�m <color=red>gi� tr�<color>, t�ng gi� tr� v�t ph�m c�ng cao, t� l� t�o th�nh trang b� c� tr� Linh kh� c�ng cao.");
end

function how_make_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua3","<color=green>"..sNowNpc.."<color>Hai, l�m xong trang b� c� b�n, b�t ��u kh�m Linh Th�ch. Tr�n m�i Linh Th�ch ��u c� tr� Linh kh�, tr� s� Linh kh� l� <color=red>l�<color> th� Linh Th�ch <color=red>D��ng<color>, tr� s� l� <color=red>ch�n<color>, th� Linh Th�ch <color=red>�m<color>. To�n b� Tr� Linh kh� c�a Linh Th�ch kh�m tr�n m�t trang b� c� b�n, kh�ng ���c v��t qu� gi�i h�n Linh kh� c�a trang b� ��. Khi <color=red>Tr� linh kh� Linh Th�ch<color> v�a <color=red>b�ng<color> <color=red>gi�i h�n tr� Linh kh� c�a trang b�<color>, trang b� n�y s� h�p th�nh m�t <color=red>Trang b� B�t Qu�i ch�a k�ch ho�t<color>, trang b� m�i b�t v� c� th� c�n t�o ra sao. Xin xem 'B�t Qu�i B�o �i�n'");
end

function how_make_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Ba, c� trang b� B�t Qu�i ch�a k�ch ho�t v�n kh�ng th� tham gia v�i trang b� B�t Qu�i �� k�ch ho�t, mu�n tham gia k�ch ho�t B� B�t Qu�i, ph�i k�ch ho�t tr��c thu�c t�nh B�t Qu�i tr�n trang b� B�t Qu�i. Mang theo trang b� B�t Qu�i mu�n k�ch ho�t,��n c�c th�nh t�m <color=red>Th�n Du Ch�n Nh�n<color> �� nh� �ng ta k�ch ho�t, nh�ng ph�i ti�u hao Th�i H� B�t Qu�i B�i t��ng �ng. Trang b� B�t qu�i sau khi �� k�ch ho�t c� th� ��n g�p ta �� ti�n h�nh h�p th�nh");
end

function how_get_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_get_lingshi2","<color=green>"..sNowNpc.."<color>: C� nhi�u �i�u ph�i n�i v� Linh Th�ch\nM�t, mu�n nh�n Linh Th�ch, ph�i c� Nguy�n Th�ch tr��c v� c�c trang b� hi�u qu�. Nguy�n Th�ch n�y v�a c� th� dung n�p thi�n ��a linh kh�, v�a c� th� r�t thu�c t�nh tr�n trang b�, sau khi r�t th�nh c�ng, Nguy�n Th�ch bi�n th�nh Linh Th�ch t��ng �ng. T� Nguy�n Th�ch c�ng c� t�c d�ng v� cao th�p kh�c nhau, ph�n th�nh 7 c�p n�u ��ng c�p Nguy�n Th�ch kh�ng ��, kh�ng c� c�ch n�o dung n�p thu�c t�nh cao c�p b� sung tr�n trang b�. Nguy�n Th�ch ph�n th�nh <color=red>Thi�n, ��a, Nh�n<color>, t��ng �ng v�i 3 v� tr� thu�c t�nh <color=red>1,2,3<color>. Mu�n nh�n ���c thu�c t�nh � v� tr� n�o ph�i d�ng lo�i Nguy�n Th�ch ��.");
end

function how_get_lingshi2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Hai, trang b� c� thu�c t�nh linh kh� cao c�p r�t �t, mu�n nh�n ���c Linh Th�ch cao c�p, c�n m�t c�ch kh�c, t� m�nh<color=red>h�p th�nh Linh Th�ch<color>, bi�n nhi�u Linh Th�ch th�nh m�t Linh Th�ch, n�u nhi�u Linh Th�ch c�ng lo�i, kh� n�ng h�p th�nh Linh Th�ch s� cao. Th�i chi�n Th��ng c� Phong Th�n c� truy�n l�i ph��ng ph�p ph�i h�p h�p th�nh Linh th�ch, n�u l�y ���c ph��ng ph�p ph�i h�p n�y, l�m theo ghi ch�p, b� sung Linh Th�ch t��ng �ng, c� th� h�p th�nh Linh Th�ch, nh�ng ch�a C�c ng��i th�nh c�ng...");
end

function how_jihuo_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua2","<color=green>"..sNowNpc.."<color>: Ta d�nh t�m huy�t c� ��i, nghi�n c�u ra b� B�t Qu�i bi�n h�a kh�n l��ng, c� mu�n t�m hi�u kh�ng?");
end

function how_jihuo_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua3","<color=green>"..sNowNpc.."<color>: M�t, mu�n k�ch ho�t b� B�t Qu�i, ��u ti�n ph�i c� <color=red>trang b� B�t Qu�i<color> t��ng �ng v�i m�i b� B�t Qu�i. Sau khi t�p h�p trang b� B�t Qu�i t��ng �ng, c� th� h�p th�nh t�i ��y. Nh�ng linh kh� m�i b� trang b� B�t Qu�i kh�c nhau, hi�u qu� sau khi k�ch ho�t v� <color=red>Tr� Linh kh� trang b� B�t Qu�i<color> tham gia h�p th�nh c� t��ng quan, n�u tr� linh kh� trang b� B�t Qu�i tham gia h�p th�nh qu� th�p, hi�u qu� b� B�t Qu�i s� th�p. B� B�t Qu�i n�y khi h�p th�nh do thi�n th�i bi�n h�a, hi�u qu� s� kh�ng �n ��nh. Mu�n c� hi�u qu� t�t nh�t c�n th�m c�c v�t ph�m <color=red>gi� tr�<color>");
end

function how_jihuo_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>: Hai, n�u kh�ng h�i l�ng v�i thu�c t�nh k�ch ho�t b� B�t Qu�i, ch� c�n th�o r�i b� B�t Qu�i t�o b� m�i. Nn�ng n�u kh�ng th�o r�i b� B�t Qu�i, s� t�n th�t m�t s� trang b� trong b� B�t Qu�i. Mu�n n�ng t� l� th�nh c�ng v� h� th�p t�n th�t, ch� c�n th�m nhi�u v�t ph�m <color=red>gi� tr�<color> khi ��c l�i, n�u �� gi� tr�, c� th� <color=red>kh�ng h� t�n th�t<color>.");
end

function nothing()

end

function bagua_baodian()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetItemCount(2,1,2639) >= 1 then
		Talk(1,"main","<color=green>"..sNowNpc.."<color>: Ch�ng ph�i ng��i �� c� m�t quy�n r�i sao?");
	elseif AddItem(2,1,2639,1) == 1 then
		Msg2Player("B�n nh�n ���c m�r B�t Qu�i B�o �i�n");
		Talk(1,"main","<color=green>"..sNowNpc.."<color>: 'B�t Qu�i B�o �i�n' n�y ghi ch�p li�n quan ��n b� B�t Qu�i!");
	end 
end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end	

function new_task()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetTask(TASK_LINGSHI_ID) == 1 then
		Say("<color=green>"..sNowNpc.."<color>: Ch� c� Linh Th�ch th� kh�ng ���c, Linh Th�ch n�y ch� c� kh�m tr�n trang b� m�i ph�t huy t�c d�ng, trang b� Ph� th�ng kh�ng th� kh�m Linh Th�ch, ch� c� truy�n t� M�c ��i, M�c Nh�, M�c Tam, C�m Lang, linh kh� c�a T� Quy�n c� n��ng v� Minh s� ph� m�i c� th� kh�m Linh Th�ch, ng��i h�y �i h�i m�t trong s� 6 ng��i h� xem",
			3,
			"Ta �i t�m s�u ng��i h� ��y!/#goto_zhizao_npc(1)",
			"R�nh r�i ta s� �i t�m h� sau!/#goto_zhizao_npc(2)",
			"���c r�i, ta �� hi�u!/confirm_cancel");	
	elseif GetTask(TASK_LINGSHI_ID) == 4 then
		Say("<color=green>"..sNowNpc.."<color>: kh�ng ng� ng��i �� �i ���c t�i ��y r�i, sau khi ng��i m� giao di�n k�ch ho�t, nh�p v� hi�u qu� b� B�t Qu�i c�n k�ch ho�t, c�n c� theo b�t v� �� ch� d�n m� s�p ��t l�n trang b� B�t Qu�i t��ng �ng. L�o Th�n Du ��a ng��i 4 trang b� B�t Qu�i n�y �t nhi�u c� th� k�ch ho�t b� Ti�m Long, tuy b� n�y �� l�u kh�ng s�a ch�a, hi�u qu� k�ch ho�t r�t k�m, nh�ng ng��i c� th� xem. Sau �� h�y ��n t�m ta.",
			1,
			"���c, �� ta th� xem!/try_try");
	elseif GetTask(TASK_LINGSHI_ID) == 5 then
		if GetLevel() < 75 then 
			Talk(1,"","<color=green>"..sNowNpc.."<color>: Th� xong ch�a? ���c ��, c� ti�n ��, gi� �� hi�u h� th�ng Linh Th�ch v� B�t Qu�i, nh�ng mu�n hi�u r� h�n, c�n xem m�t truy�n c�a 'B�t Qu�i b�o �i�n'. Ta v�n ��nh cho ng��i m�t s� ph��ng ph�p ph�i h�p Linh Th�ch, nh�ng ��ng c�p ng��i th�p qu� l�m sao d�ng ���c! ��n <color=yellow>c�p 75<color> h�y ��n t�m ta.");
		else
			Talk(1,"","<color=green>"..sNowNpc.."<color>: Th� xong ch�a? ���c ��, c� ti�n ��, gi� �� hi�u h� th�ng Linh Th�ch v� B�t Qu�i, nh�ng mu�n hi�u r� h�n, c�n xem m�t truy�n c�a 'B�t Qu�i b�o �i�n'. Ng��i ch�y l�u nh� v�y, c�c kh� r�i, nh�n l�y Linh Th�ch ph�i ph��ng �i, tuy kh�ng ph�i th� qu� hi�m g� nh�ng l� t�m l�ng c�a ta.")
			give_final();
		end
	elseif GetTask(TASK_LINGSHI_ID) == 7 then
		Talk(1,"go_id_one","<color=green>"..sNowNpc.."<color>: R�t Linh Th�ch ch�a? Quang h�i Linh Th�ch h�t ch�a ��. N�n bi�t, Linh Th�ch n�y th� gian r�t hi�m, c�c ph�m Linh Th�ch c�ng kh� ki�m, ti�n nh�n ph�i tr�i qua mu�n ng�n kh� c�c, t�o ra nhi�u Linh Th�ch ph�i ph��ng, ch� c�n c�ng ph�i h�p Linh Th�ch ph�i ph��ng v� Linh Th�ch theo h��ng d�n l� c� th� h�p th�nh ra Linh Th�ch. Kh�ng th�m ph�i ph��ng, t�y � k�t h�p Linh Th�ch. Tuy c� th� h�p th�nh, nh�ng th�nh c�ng hay kh�ng l� do m�nh Tr�i. Ng��i th� xem!")	
	end
end

function goto_zhizao_npc(nType)
	SetTask(TASK_LINGSHI_ID,2);
	if nType == 1 then
		local nRand = random(1,6);
		NewWorld(tZhizaoNpc[nRand][1],tZhizaoNpc[nRand][2],tZhizaoNpc[nRand][3]);
	end
end

function try_try()
	SetTask(TASK_LINGSHI_ID,5);
end

--����7������1
function go_id_one()
	for i = 1,5 do
		AddLingShi(343,0,1);
	end
	local add_flog = AddItem(2,21,2325,1,1);
	if add_flog == 1 then
		Msg2Player("B�n nh�n ���c 5 Linh Th�ch, 1 Linh Th�ch ph�i ph��ng");
		SetTask(TASK_LINGSHI_ID,1);
		TaskTip("Th� t�o ra Linh Th�ch theo ph�i ph��ng ghi, sau �� t�m truy�n nh�n C�ng Tr� Th� Gia");
	else
		WriteLog("Nhi�m v� h� th�ng Linh Th�ch: ng��i ch�i "..GetName().."Nh�n Linh Th�ch v� Linh Th�ch ph�i ph��ng th�t b�i. Log: "..add_flog);
	end
end

