Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
FILE_NAME = "\\script\\��ԭ����\\����\\npc\\����ǿ��.lua"
function main()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"T�n m�y m��i n�m t�m huy�t, r�t cu�c c�ng v�i nh�ng ng��i c�a th� gia �� nghi�n c�u ra trang b� b�t qu�i n�y, ��ng ti�c m�y xe thi�n th�ch c�a ta th�i!");
	end;	
	Say("<color=green>Th� r�n L�u<color>: Nghe n�i trong thi�n h� c� m�t lo�i k� th�ch c� th� l�m thay ��i thu�c t�nh trang b�. N�u ng��i t�m ���c ta c� th� gi�p ng��i t�ng c�p trang b�. <color=red>B�y gi� ng��i c� th� s�a ngo�i trang r�i!<color>",
		9,
		"Nhi�m v� M�nh Thi�n Th�ch th�t l�c/get_ManhThienThach",
		"T�ng c�p trang b�/qianghua",
		"S�a ��c bi�t/xiuli",
		"��i N� Oa Tinh Th�ch (c�n 1 N� Oa Tinh Th�ch (kh�a) v� 1 C�n Kh�n Ph�)/change_nott",
		"Ta mu�n nh�n 10 Phi Y�n Th�ch (ti�u hao 1 trang b� T�ng Ki�m + 1 N� oa tinh th�ch + 1 Ho�ng kim h�ng bao)/#get_PhiYen(1)",
		"Ta mu�n nh�n 19 Phi Y�n Th�ch (ti�u hao 1 trang b� Thi�n Chi T�ng Ki�m + 1 N� oa tinh th�ch + 1 Ho�ng kim h�ng bao)/#get_PhiYen(2)",
		"Ta mu�n nh�n 7 Phi Y�n Th�ch (ti�u hao 1 v� kh� B� Phi Y�n + 1 N� oa tinh th�ch)/#get_PhiYen(3)",
		"H�i th�m tin t�c/dating",
--		"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
		--"N�ng c�p trang b� T�ng Ki�m Ho�ng Kim/UpgradeSwordCollector",
		"R�i kh�i/zhaohu"
		)
end;

function UpgradeSwordCollector()
	UpgradeSwordCollectorEquipment();
end

--==========������¼���װ���ȼ�����=========
	TaskID_equipment_uped = 1249
	Tb_quipment_part = {
		{0,"��u kh�i"},
		{1,"Ngo�i trang"},
		{3,"Qu�n "},
	}
--=========================================
function qianghua()
	Say("C��ng h�a v�t ph�m chia th�nh c��ng h�a v�t ph�m th�ng th��ng, c��ng h�a v�t ph�m cao c�p v� ��nh h�n.", 5, 
	"C��ng h�a th��ng/#qianghua_(0)",
	"C��ng h�a cao c�p/#qianghua_(1)",
		"V�t ph�m Ti�u ��nh H�n (+7)/#qianghua_(-1)",
		"V�t ph�m ��nh h�n (+10)/#qianghua_(-3)",
	"R�i kh�i/zhaohu")
end;

function qianghua_(t)
	local nType = tonumber(t)
	EnhanceItem(nType)
end

function xiuli()
Say("<color=green>Th� r�n L�u<color>: Tinh Luy�n B�ng Th�ch r�t qu�, kh�ch quan xem k� trang b� khi s�a ch�a. <color=yellow>Ch� �, s�a ngo�i trang ch� c� th� ti�n h�nh khi ch�a t�n h�i.<color>",
	5,
	"S�a mi�n ph?(�� b�n tr��c ��y >0)/fix1",
	"S�a mi�n ph� (�� b�n tr��c ��y =0)/fix3",
	"T�ng c�p/fix2",
	"D�ng 2 T� v� ��i h�i b�i �� t�ng ch�nh s�a/fix4",
	"tr� l�i/main")
end;


function fix1()
AdvanceRepair(1)
end;

function fix2()
AdvanceRepair(2)
end;

function fix3()
AdvanceRepair(3)
end;

function fix4()
	AdvanceRepair(4)
end

function dating()
Say("Ng��i c�n ta gi�p g�?",3,"T�m hi�u t�ng c�p/dating1","T�ng c�p ��c bi�t/dating2","tr� l�i/main")
end;

function dating1()
Say("Trang b� d��i c�p 3 c� th� d�ng m�nh b�ng th�ch �� n�ng c�p, n�u cao h�n ph�i d�ng ��i b�ng th�ch m�i c� t�c d�ng.",1,"Ta hi�u r�i!/dating")
end;

function dating2()
Say("S�a ��c bi�t c� 3 c�ch: 1.D�ng m�nh b�ng th�ch c� th� ph�c h�i l�i �� b�n ban ��u. 2. D�ng b�ng th�ch c� th� t�ng �� b�n t�i �a c�a trang b�.3. D�ng b�ng th�ch thu�n khi�t c� th� ph�c h�i l�i to�n b� t�n h�i c�a trang b�",1,"Ta hi�u r�i!/dating")
end;
function zhaohu()
end

function bagua()
	Say("<color=red>trang b� b�t qu�i<color>l� ta c�ng huynh �� M�c gia ta v� C�m N��ng �� to�n l�c c�ng nhau nghi�n c�u ra t�m huy�t. L�m th� n�o nh�n ���c nh�ng m�n c� linh th�ch ng��i �i h�i truy�n nh�n s� r�, ch� t�o trang b� c� l� ng��i �i h�i huynh �� M�c gia, n�u ng��i mu�n t�m hi�u l�m th� n�o <color=yellow>kh�m linh th�ch<color>, th� ��n ch� ta t�m hi�u nh�.",
	4,
	"L�m th� n�o kh�m linh th�ch v�o trang b�/Xiangqian",
	"L�m sao kh�m linh th�ch m�i c� th� h�nh th�nh trang b� b�t qu�i/Xiangbagua",
	"Trang b� b�t qu�i c� c��ng h�a kh�ng/Baguaqianghua",
	"��n h�i th�m th�i m�!/SayHello"
	)
end
function SayHello()
end

function Xiangqian()
	Talk(1,"","Vi�c n�y r�t ��n gi�n, k� thu�t c�a l�o L�u ta kh�ng gi�ng nh�ng ng��i c�a th� gia, nh�p ph�i v�o linh th�ch l� c� th� ti�n h�nh thao t�c kh�m, kh�ng c�n ph�i t�m ng��i kh�m gi�p.")
end

function Xiangbagua()
	Talk(1,"","Sau khi ��t trang b� v�o giao di�n kh�m xem chi ti�t, do �i�m linh kh� trang b� t�i �a l� m�t s� l� ho�c s� ch�n, ���c chia th�nh �m d��ng, v� th� m�i trang b� ch� c� th� xu�t hi�n 2 lo�i thu�c qu� trong <color=yellow>B�t qu�i<color>, xem thu�c qu� trong giao di�n kh�m nh�c nh� c� qu� n�o ng��i c�n kh�ng. Sau khi ��c 1 linh th�ch kh�m v�o th� x�c nh�n b��c 1, thu�c qu� m� n� c� th� xu�t hi�n ch� c�n l�i <color=yellow>2<color>. Sau khi ��t linh th�ch th� hai v�o c� b�n �� x�c nh�n thu�c qu� m� trang b� n�y s� xu�t hi�n, v� th� nh�t ��nh ph�i xem cho k�!")
end

function Baguaqianghua()
	Talk(1,"","Trang b� b�t qu�i t� nhi�n c�ng c� th� c��ng h�a, s�t c�a l�o L�u ta kh�ng ph�i mi�n ph�. Nh�ng n�u ng��i k�ch ho�t trang b� b�t qu�i th�nh �� b�t qu�i, �� b�t qu�i th� ta kh�ng c� c�ch. Nh�ng sau khi ng��i mang �� b�t qu�i v�o ng��i, t� c�t trang b� ��t trang b� b�t qu�i trong b� b�t qu�i v�o c�t c��ng h�a, l�o L�u ta s� c��ng h�a. ")
end

function change_nott()
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","Kh�ng c� N� Oa Tinh Th�ch trong h�nh trang n�n kh�ng th� ti�n h�nh ��i!")
		return
	end
	if GetItemCount(2,0,555) < 1 then
		Talk(1,"","Kh�ng c� C�n Kh�n Ph� trong h�nh trang n�n kh�ng th� ti�n h�nh ��i!")
		return
	end
	PutinItemBox("M� kh�a v�t ph�m" , 2, "X�c nh�n mu�n th�c hi�n?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbItem = {{2,0,555}, {2,1,504}}
	if gf_JudgeRoomWeight(2,200,"") == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end
	for i = 1, getn(tbItem) do
		if genre == tbItem[i][1] and detail == tbItem[i][2] and particular == tbItem[i][3] then
			return 1
		end
	end
	Talk(1, "", "Ch� c� th� b� v�o N� Oa Tinh Th�ch v� C�n Kh�n Ph�!");
	return 0
end

function OnPutinComplete(param)
	if param ~= 1 then
		Talk(1, "","B� v�o v�t ph�m kh�ng ��ng");
		return 0
	end
	local itemList = GetPutinItem()
	if get_item_count(itemList, 2,0,555) ~= 1 or get_item_count(itemList, 2,1,504) ~= 1 then
		Talk(1, "","B� v�o v�t ph�m kh�ng ��ng");
		return 0		
	end
	local nResult = 1
	local nExpireTime = 0
	for i = 1, getn(itemList) do
		local nG, nD, nP = itemList[i][2], itemList[i][3], itemList[i][4]
		if nG == 2 and nD == 1 and nP == 504 then
			nExpireTime = GetItemExpireTime(itemList[i][1]) or 2*24*3600
		end
		if DelItemByIndex(itemList[i][1], -1) ~= 1 then
			nResult = 0
			break;
		end
	end
	if nResult == 1 then
		gf_AddItemEx2({2,1,504,1}, "N� Oa Tinh Th�ch", "Chuyen Doi NOTT", "��i th�nh c�ng", nExpireTime)
	end
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0;
	local nQianghua, nDing, nRandSeed, nLock = 0,0,0,0
	local nMofa1,nLv1 = 0,0
	local nMofa2,nLv2 = 0,0
	local nMofa3,nLv3 = 0,0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
			nCount = nCount + 1;
			if t[i][2] == 0 then
				nQianghua = GetEquipAttr(t[i][1],2)
				nDing = GetItemSpecialAttr(t[i][1],"DING7")
				nLock = GetItemSpecialAttr(t[i][1],"LOCK") 
				nRandSeed = GetItemRandSeed(t[i][1])				
				nMofa1,nLv1 = GetItemAttr(t[i][1],1)
				nMofa2,nLv2 = GetItemAttr(t[i][1],2)
				nMofa3,nLv3 = GetItemAttr(t[i][1],3)		
			end
		end
	end
	return nCount, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed,nLock;
end

tCheck = {
	[1] =  {10, 1, 1, {{0,102,38}, {0,102,39}, {0,102,40}, {0,100,95}, {0,100,96}, {0,100,97}, {0,100,98}, {0,103,95}, {0,103,96}, {0,103,97}, {0,103,98}, {0,101,95}, {0,101,96}, {0,101,97}, {0,101,98}}},	
	[2] =  {19, 1, 1, {{0,102,30001}, {0,102,30002}, {0,102,30003}, {0,102,30004}, {0,102,30005}, {0,102,30006}, {0,102,30007}, {0,102,30008}, {0,102,30009}, {0,102,30010}, {0,102,30011}, {0,102,30011}, {0,103,30001}, {0,103,30002}, {0,103,30003}, {0,103,30004}, {0,101,30001}, {0,101,30002}, {0,101,30003}, {0,101,30004}, {0,100,30001}, {0,100,30002}, {0,100,30003}, {0,100,30004}}},	
	[3] =  {7, 1, 0, {{0,3,6001}, {0,5,6002}, {0,8,6003}, {0,0,6004}, {0,1,6005}, {0,2,6006}, {0,10,6007}, {0,0,6008}, {0,5,6009}, {0,2,6010}, {0,9,6011}, {0,6,6012}, {0,4,6013}, {0,7,6014}, {0,11,6015}}},	
}
function get_PhiYen(nSelected)
	if gf_Judge_Room_Weight(tCheck[nSelected][1], 500, "") == 0 then
        	return 0;
     end
     if GetItemCount(2, 1, 504) < tCheck[nSelected][2] then
		Talk(1, "", "B�n kh�ng mang theo N� oa tinh th�ch!")
		return 0
	end
	if GetItemCount(2, 1, 539) < tCheck[nSelected][3] then
		Talk(1, "", "B�n kh�ng mang theo Ho�ng Kim ��i H�ng Bao (ch�a 999 v�ng)!")
		return 0
	end
	
	local nCheck = 0
	for i = 1, getn(tCheck[nSelected][4]) do
		local nG, nD, nP = gf_UnPack(tCheck[nSelected][4][i])
		if (DelItem(nG, nD, nP, 1) == 1) then
			nCheck = 1
			break
		end	
	end
	if nCheck < 1 then
		Talk(1, "", "��i hi�p kh�ng mang theo v�t ph�m c�n ph�n r�, vui l�ng ki�m tra l�i !!!")
		return 0
	end
	
     if DelItem(2, 1, 504, tCheck[nSelected][2]) == 1 and DelItem(2, 1, 539, tCheck[nSelected][3]) == 1 then
		gf_AddItemEx2({2,1,30130,tCheck[nSelected][1]}, "Phi Y�n Th�ch (t�ch)", "TACH TRANG BI", "nh�n th�nh c�ng")	 
		Msg2Player("B�n nh�n ���c "..tCheck[nSelected][1].." Phi Y�n Th�ch")    		
     end
     
end

function get_ManhThienThach()
	local nNV = mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	local tbSayDialog = {};
	local szSayHead = "<color=green>Th� r�n L�u<color>: Ta �ang t�m m�nh thi�n th�ch b� th�t l�c, ��i hi�p gi�p ta th� s� c� h�u t� !!!."
	if nNV == 0 then
--		tinsert(tbSayDialog, "Nh�n nhi�m v�/accept_MTT")
	else
		tinsert(tbSayDialog, "Ho�n th�nh nhi�m v�/finish_MTT")
	end
	tinsert(tbSayDialog, "Ki�m tra ti�n �� ho�n th�nh nhi�m v�/get_infor_MTT")	
	tinsert(tbSayDialog, "Quy�n l�i/rule_MTT")
	tinsert(tbSayDialog, "T�i h� ch� gh� qua !/zhaohu")
	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function accept_MTT()
	if GetLevel() < 79 then
		Talk(1, "", "��i hi�p ph�i c� ��ng c�p 79 tr� l�n m�i tham gia t�nh n�ng n�y ���c !!!")
		return
	end
	local nMTT_NV = floor(GetTask(TSK_MTT_COUNT) / 10000000)
	local nNum_MTT = mod(GetTask(TSK_MTT_COUNT),10000000)
	if mod(nMTT_NV,10) == 0 then
		nMTT_NV = (nMTT_NV + 1) * 10000000 + nNum_MTT
		SetTask(TSK_MTT_COUNT, nMTT_NV)
		gf_WriteLogEx("CHUOI NHIEM VU MTT", "nh�n th�nh c�ng", 1, "Nh�n nhi�m v� ")		
	end
	local tbSayDialog = {};
	local szSayHead = "<color=green>Th� r�n L�u<color>: Ch�c m�ng ��i hi�p �� nh�n nhi�m v� th�nh c�ng !!!."
	tinsert(tbSayDialog, "Ki�m tra ti�n �� ho�n th�nh nhi�m v�/get_infor_MTT")	
	tinsert(tbSayDialog, "Quy�n l�i/rule_MTT")
	tinsert(tbSayDialog, "T�i h� ch� gh� qua !/zhaohu")	
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end
function rule_MTT()
	Talk(1,"","<color=green>Th� r�n L�u<color>: H��ng d�n nhi�m v� !!! \nNh�n nhi�m v� <color=red>1 l�n/tu�n<color> \nReset nhi�m v� v�o th� 2 h�ng tu�n \nPh�i c� �� 500 Thi�n Th�ch + 3000 v�ng m�i c� th� nh�n th��ng \nPh�n th��ng: 100 tri�u �i�m kinh nghi�m (c� ��nh) v� nh�n v�t ph�m ng�u nhi�n <color=red>(M�nh thi�n th�ch ho�c Thi�n Th�ch Tinh Th�ch)<color>")
end

function get_infor_MTT()
	local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
	local nMTT_CT = mod(floor(GetTask(TSK_MTT_COUNT) / 1000),100)
	local nMTT_TL = mod(floor(GetTask(TSK_MTT_COUNT) / 100000),100)
	local nNV = mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	local nPT = mod(floor(GetTask(TSK_MTT_COUNT) / 100000000),10)
	if nPT == 0 then
		Talk(1,"","<color=green>Th� r�n L�u<color>: C�c nhi�m v� �� ho�n th�nh !!! \nTr�ng h�t gi�ng: <color=red>"..nMTT_HG.."/150<color> \nNhi�m v� C�ng T�: <color=red>"..nMTT_CT.."/6<color> \nNhi�m v� Th�y L�i: <color=red>"..nMTT_TL.."/6<color>\nTr�ng th�i nhi�m v�: <color=red>�ang l�m nhi�m v�<color>")
	else
		Talk(1,"","<color=green>Th� r�n L�u<color>: C�c nhi�m v� �� ho�n th�nh !!! \nTr�ng h�t gi�ng: <color=red>"..nMTT_HG.."<color> \nNhi�m v� C�ng T�: <color=red>"..nMTT_CT.."<color> \nNhi�m v� Th�y L�i: <color=red>"..nMTT_TL.."<color>\nTr�ng th�i nhi�m v�: <color=red>ho�n th�nh v� ��  nh�n th��ng<color>")
	end		
end
function finish_MTT()
	local tbAward = {
						{1, 9980, "M�nh Thi�n Th�ch ", {2, 2, 7, 1}, 0},
						{1, 20, "Thi�n Th�ch Tinh Th�ch ", {2, 1, 1009, 1}, 0},						
					}
	local nMTT_HG = mod(GetTask(TSK_MTT_COUNT), 1000)
	local nMTT_CT = mod(floor(GetTask(TSK_MTT_COUNT) / 1000),100)
	local nMTT_TL = mod(floor(GetTask(TSK_MTT_COUNT) / 100000),100)
	
	local nMTT_NT = floor(GetTask(TSK_MTT_COUNT) / 100000000)
	local nNum_MTT_NT = mod(GetTask(TSK_MTT_COUNT),100000000)
	if mod(nMTT_NT,10) == 1 then
		Talk(1,"","��i hi�p �� nh�n th��ng r�i. Tu�n sau h�y ��n t�m ta �� nh�n nhi�m v� m�i")
		return 0
	end	
	if gf_Judge_Room_Weight(3, 100," ") ~= 1 then
        	return
    end
--    if GetExp() + 100000000 > 2000000000 then
--		Talk(1,"","�i�m kinh nghi�m c�a ��i hi�p qu� nhi�u, s� d�ng b�t �i�m kinh nghi�m r�i h�y nh�n th��ng !!!.")
--		return 0	    
--    end
	if nMTT_HG < 150 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong s� l��ng tr�ng c�y.")
		return 0	
	end
	if nMTT_CT < 6 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong s� l��ng nhi�m v� C�ng T�.")
		return 0	
	end
	if nMTT_TL < 6 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong s� l��ng nhi�m v� Th�y L�i.")
		return 0	
	end
	if GetItemCount(2,2,8) < 500 then
		Talk(1,"","��i hi�p kh�ng c� �� 500 Thi�n Th�ch �� nh�n th��ng.")
		return 0		
	end
	if GetCash() < 30000000 then
		Talk(1,"","��i hi�p kh�ng c� �� 3000 v�ng �� nh�n th��ng.")
		return 0			
	end
		
	if mod(nMTT_NT,10) == 0 then
		nMTT_NT = (nMTT_NT + 1) * 100000000 + nNum_MTT_NT
		SetTask(TSK_MTT_COUNT, nMTT_NT)
	end	
	if DelItem(2,2,8,500) == 1 and Pay(30000000) == 1 then
		ModifyExp(100000000)
		local tbAwardRate = {[1] = 0, [2] = 0}
		local nIndex = 0
		for i=1,500 do
			if random(0,10000) < 20 then
				nIndex = 1
			else
				nIndex = 2
			end
			tbAwardRate[nIndex] = tbAwardRate[nIndex] + 1
		end
		if tbAwardRate[1] > 0 then
			gf_AddItemEx2({2, 1, 1009, tbAwardRate[1]}, "Thi�n Th�ch Tinh Th�ch", "CHUOI NHIEM VU MTT - 1" , "nh�n")
		end
		if tbAwardRate[2] > 0 then
			gf_AddItemEx2({2, 2, 7, tbAwardRate[2]}, "M�nh Thi�n Th�ch", "CHUOI NHIEM VU MTT - 2" , "nh�n")
		end
		gf_WriteLogEx("CHUOI NHIEM VU MTT", "nh�n th�nh c�ng", 1, "Ph�n th��ng")
	end
	
end