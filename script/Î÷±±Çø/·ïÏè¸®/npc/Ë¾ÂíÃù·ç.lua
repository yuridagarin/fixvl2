-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC˾������Script
-- By StarryNight
-- 2007/06/25 PM 3:13

-- ƣ����Ǽ�ʹ�������㿪�ĵ��£�������Ȼ�˷ܲ�������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

local tbSayDialog = {};
local nSaySize = 0;
local szSayHead = "Ta n�m gi� b� k�p ch� t�o Chuy�n Sinh ��n do Nguy�n Th�y Thi�n T�n �� l�i. N�u mu�n ta ch� t�o Chuy�n Sinh ��n, ng��i h�y gi�p ta ho�n th�nh c�c vi�c sau ��y: 300 nhi�m v� s� m�n, 30 l�n Th�i H� Huy�n C�nh, 81 l�n T�i Nguy�n Chi�n, 30 l�n L��ng S�n, 33 l�n Tr� An (B�nh Thi�n H�), 33 l�n Th�y L�i (B�nh Thi�n H�), 300 H�t Gi�ng, 181 B�t nh� nh�, 99 B�t nh� l�n, 99 c�y T� Linh"

if GetTask(TSK_CSD) < 1 then
	szSayHead = "Ta c�m th�y vui v� v� may m�n th� ta m�i ch� t�o Chuy�n Sinh ��n ���c"
--	tinsert(tbSayDialog, "Nh�n nhi�m v� Chuy�n Sinh ��n (ti�u hao 7 ng�i sao may m�n)/get_mission_CSD")
elseif GetTask(TSK_CSD) == 1 then
	tinsert(tbSayDialog, "Gi�p ch� t�o Chuy�n Sinh ��n (ti�u hao 999 Thi�n th�ch + 333 B�nh b�t v�ng)/get_CSD")
	tinsert(tbSayDialog, "Ho�n th�nh nhanh s� l��ng nhi�m v� s� m�n c�n l�i (4 xu v�t ph�m/1 nhi�m v�)/finish_sumon")	
elseif GetTask(TSK_CSD) == 2 then
	local szSayHead = "Ta �ang ��i n�n kh�ng c� s�c �� ch� t�o Chuy�n Sinh ��n, h�y cho ta 333 B�nh b�t v�ng �� l�t d�."
	tinsert(tbSayDialog, "Gi�p �n no �� ch� t�o Chuy�n Sinh ��n (ti�u hao 333 B�nh b�t v�ng)/confirm_get_CSD")	
else
	local szSayHead = "B�y gi� ta s� ch� t�o Chuy�n Sinh ��n cho ��i hi�p, nh�ng h�y cho ta th�m  333 B�nh b�t v�ng �� d� tr� nha !!!."
	tinsert(tbSayDialog, "Ch� t�o Chuy�n Sinh ��n (ti�u hao 333 B�nh b�t v�ng)/get_confirm_get_CSD")
end
	tinsert(tbSayDialog, "Xem s� l��ng c�c nhi�m v�/get_CSD_infor")
	tinsert(tbSayDialog,"��i Chuy�n Sinh ��n (c� th� giao d�ch, c� h�n s� d�ng 30 ng�y) - ti�u hao 2 C�u Thi�n V� C�c ��n/exchange_CSD"	)	
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/nothing"	)	
nSaySize = getn(tbSayDialog);
Say(szSayHead, nSaySize, tbSayDialog);
	---------------------------------- ��������08������----------------------------------
	
	--���ذκ�����������ҩ��˾������
	if nStep_XBTask == 38 then
		task_008_03_0();
		return
	end
	
	--��δ��ŷ�������ذκ�Ի�
	if nStep_XBTask == 39 then
		task_008_03_1();
		return
	end
	
	---------------------------------- ������13��֧1_5������Ĺ----------------------------------
	--����˿���ֽ���˾������
	if nStep_XBTask_01 == 16 then
		task_013_02_0();
		return
	end
	
	--��δѯ��ŷ������Ĺ���
	if nStep_XBTask_01 == 17 then
		task_013_02_1();
		return
	end
	
	---------------------------------- ������15��֧1_6��Ĺ����----------------------------------
	--��ī�������彻��˾������
	if nStep_XBTask_01 == 28 then
		task_015_04_0();
		return
	end
	
	--��δ���ذκ�Ի�
	if nStep_XBTask_01 == 29 then
		task_015_04_1();
		return
	end
	
	--���ͻ���������Ʊ
	if GetBit(GetTask(GIVE_TICKET_STATE),3) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"Giang h� r�ng l�n, ��u l� n�i c�n ��n?"},
		{"V� c�ng thi�n h� �� nh�t l� ai?"},
		{"suy th�o t� d��ng, c� b�ch thi�n th��ng, c�m t� �� lai tam l��ng h�nh�"},
		{"T�y H� qu� nhi�n l� ��t ng�a h� t�ng long, n�u kh�ng sao l�i �m m�u th�n t�nh trung nguy�n?"},
		}
	local i = random(1,getn(strTalk));

	--TalkEx("",strTalk[i]);
	return
	
end;

--������Ʊ�ű�
function give_ticket_01()

local strTalk = {
	"T� M� Minh Phong: Xin ch�o <sex>, l�u r�i kh�ng g�p. Nghe n�i ng��i bi�t m�t s� tin t�c trong Ho�ng l�ng m� � ch� Li�u ti�n sinh, c� li�n quan ��n T� Qu�n v� ta?",
	"Ng��i ch�i: ��ng, T� M� ti�n b�i, ta ��n t�m �ng c�ng v� chuy�n n�y, chuy�n M� Kim ph� c�a Li�u ti�n sinh �ang c�t gi�u, v� c�a ti�n b�i 18 n�m tr��c �� v�o T�n L�ng t�m b�o v�t. Ta �� ��n l�ng m�, nh�ng t�m kh�ng ra manh m�i c�a b� ta.",
	"T� M� Minh Phong: �a t� <sex>, v� chuy�n n�y m� ng��i �� ��n T�n L�ng. ��i v�i v� ta, khi c�m M�c ��u Ki�m m� <sex> t�m gi�p, ta �� bi�t T� Qu�n ch�t trong m�. T� Qu�n l� ng��i con g�i ki�n c��ng, lu�n c� ch�p, n�u c� ta �i t�m ki�m th� s� kh�ng b� ki�m m� �i. H�n n�a mi�ng ng�c b�i Minh Phong n�y kh�ng th� r�i l�i, ng�c c�n ng��i c�n, ng�c ch�t ng��i ch�t.",
	"Ng��i ch�i: Nh�ng ti�n b�i, trong l�ng m� kh�ng nh�n th�y x�c c�a v� ti�n b�i, sao c� th� d� d�ng k�t lu�n v�y ch�?",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"T� M� Minh Phong: T�m � c�a <sex>, ta kh�c ghi v�o l�ng. C� l� ��i v�i T� Qu�n, vi�c t�m ki�m c�a ta m�i l� m�t k�t c�c. 18 n�m, hy v�ng c�a ta tan bi�n d�n, sau n�y bi�t ���c T� Qu�n v� M�c ��u ki�m �� v�o Ho�ng l�ng, hy v�ng n�y c�ng �� ��n l�c. Nh�ng, theo k� v�ng c�a T� Qu�n, ta l�i kh�ng d�m qu�n.",
	"Ng��i ch�i: Trong th�i gian 18 n�m �au kh� m� ti�n b�i ch�u ��ng th�t s� kh�ng nh�.",
	"T� M� Minh Phong: T�t c� m�i chuy�n m� T� Qu�n �� l�m trong l�ng m�, �t ra c�ng cho ta bi�t r� r�ng, c�ng l� chuy�n ��ng an �i, n�i ra c�n ph�i �a t� <sex>, ��ng r�i, kh�ng bi�t <sex> c� th� cho ta bi�t c�ch v�o t�ng 2 l�ng m� kh�ng?",
	"Ng��i ch�i: Ti�n b�i mu�n v�o l�ng m� m�t chuy�n �?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"T� M� Minh Phong: Tuy kh�ng th� g�p T� Qu�n, nh�ng ���c v�o trong m� c�ng t� linh h�n c�a c� �y. Nh�n ti�n g�p Qu� T��ng Qu�n.",
	"Ng��i ch�i: N�u ti�n b�i mu�n v�o l�ng m�, h�y c�n th�n, Qu� T��ng Qu�n kh�ng d� ��i ph� ��u. H�n n�a khi ��nh ng�n c�n trong m�t th�t Ho�ng l�ng r�i, th� kh�ng th� v�o l�i m�t th�t ���c.",
	"T� M� Minh Phong: ��nh ng�n c�n th�c ch�t l� m�t lo�i c� quan trong l�ng m�, ng��i c��p m� c� v�t ph�. {To�i Th�ch Ch�n} c�a h� l� chuy�n d�ng �� ph� lo�i c� quan n�y, ta v� t�m v�, �� nghi�n c�u c� quan l�ng m� r�t nhi�u, ��y l� To�i Th�ch Ch�n, ng��i c�m �i.",
	"Ng��i ch�i: �a t� ti�n b�i, ta c�ng �ang ��nh �i g�p Qu� T��ng Qu�n, �i th�m d� l�i manh m�i c�a v� ti�n b�i, n�i kh�ng ch�ng ch�ng ta c�n c� th� g�p nhau ��y.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1033,1,1);--�õ���ʯ��
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),3,1));
	
end
function get_mission_CSD()
	
--	if (GetTask(1537) > 0 and GetTask(1537) < 7) or (GetTask(1537) > 7 and GetTask(1537) < 12) or (GetTask(1537) >12 and GetTask(1537) < 22) or (GetTask(1537) >22 and GetTask(1537) < 30) or (GetTask(1537) >30 and GetTask(1537) < 36) then
--		Talk(1, "", "��i hi�p �ang nh�n nhi�m v� Chuy�n Sinh n�n kh�ng th� nh�n ti�p nhi�m v� n�y. H�y ho�n th�nh nhi�m v� Chuy�n Sinh xong r�i quay l�i.")
--		return
--	end
	if GetItemCount(2,1,30191) < 7 then
		Talk(1, "", "��i hi�p ch�a mang theo �� Ng�i sao may m�n?")
		return
	end	
	if DelItem(2,1,30191, 7) == 1 then
		SetTask(TSK_CSD,1)
		Talk(1, "", "��i hi�p h�y gi�p ta l�m c�c nhi�m v�, ta s� ch� t�o Chuy�n Sinh ��n cho ��i hi�p")
		Msg2Player("��i hi�p h�y gi�p ta l�m c�c nhi�m v�, ta s� ch� t�o Chuy�n Sinh ��n cho ��i hi�p")
		gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho�t th�nh c�ng", 1, "�K chuy�n sinh ��n 1")
	end	
end
function get_CSD()
	--TSK_CSD_COUNT_A = 2748		--300 nv s� m�n (x) - 30 l�n th�i h� (y) - 81 t�i nguy�n chi�n (z) - 30 l�n L��ng S�n (w)		- wwzzyyxxx
	--TSK_CSD_COUNT_B = 2749		--300 h�t gi�ng (x) - 33 l�n Tr� An (y) - 33 l�n Th�y l�i (z)			- zzyyxxx
	--TSK_CSD_COUNT_C = 2750		--181 B�t nh� nh� (x) - 99 b�t nh� to (y) - 99 c�y t� linh (z)		- zzyyxxx
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "��i hi�p ch�a mang theo �� 333 B�nh b�t v�ng.")
		return
	end
	if GetItemCount(2,2,8) < 999 then
		Talk(1, "", "��i hi�p ch�a mang theo �� Thi�n Th�ch?")
		return
	end
	if nCSD_BNN < 181 or nCSD_BNL < 99 or nCSD_TLinh < 99 or nCSD_HG < 300 then
		Talk(1, "", "��i hi�p ch�a ho�n th�nh �� s� l��ng tr�ng c�y?")
		return
	end
	if nCSD_SuMon < 300 or nCSD_TH < 30 or nCSD_TNC < 81 or nCSD_LS < 30 then
		Talk(1, "", "��i hi�p ch�a ho�n th�nh �� s� l��ng nhi�m v�: S� m�n, Th�i H�, T�i nguy�n chi�n, L��ng S�n?")
		return	
	end
	if nCSD_TA < 33 or nCSD_TL < 33 then
		Talk(1, "", "��i hi�p ch�a ho�n th�nh �� s� l��ng nhi�m v�: Tr� An, Th�y L�i?")
		return	
	end	
	if DelItem(1,1,15, 333) == 1 and DelItem(2,2,8, 999) == 1 then
		SetTask(TSK_CSD,2)
		 gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho�t th�nh c�ng", 1, "�K chuy�n sinh ��n 2")
	end

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "C� 'Th�c m�i V�c ���c ��o', kh�ng cho ta �n no th� ta kh�ng c� s�c �� ch� t�o Chuy�n Sinh ��n, h�y cho ta 333 B�nh b�t v�ng �� l�t d�."
	
	tinsert(tbSayDialog, "Gi�p �n no �� ch� t�o Chuy�n Sinh ��n (ti�u hao 333 B�nh b�t v�ng)/confirm_get_CSD")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/nothing"	)
		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end
function confirm_get_CSD()
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "��i hi�p ch�a mang theo �� 333 B�nh b�t v�ng..")
		return
	end
	if GetTask(TSK_CSD) < 2 then
		Talk(1, "", "��i hi�p kh�ng th�a �i�u ki�n?")
		return
	end
	if DelItem(1,1,15, 333) == 1 then
		SetTask(TSK_CSD,3)
		 gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho�t th�nh c�ng", 1, "�K chuy�n sinh ��n 3")
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "B�y gi� ta s� ch� t�o Chuy�n Sinh ��n cho ��i hi�p, nh�ng h�y cho ta th�m  333 B�nh b�t v�ng �� d� tr� nha !!!."
	
	tinsert(tbSayDialog, "Ch� t�o Chuy�n Sinh ��n (ti�u hao 333 B�nh b�t v�ng)/get_confirm_get_CSD")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/nothing"	)
		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end
function get_confirm_get_CSD()
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	if GetTask(TSK_CSD) >= 4 then
		Talk(1, "", "��i hi�p �� nh�n Chuy�n Sinh ��n r�i?")
		return
	end
	if GetTask(TSK_CSD) < 3 then
		Talk(1, "", "��i hi�p ch�a cho ta �n no?")
		return
	end
	if nCSD_BNN < 181 or nCSD_BNL < 99 or nCSD_TLinh < 99 or nCSD_HG < 300 then
		Talk(1, "", "��i hi�p ch�a ho�n th�nh �� s� l��ng tr�ng c�y?")
		return
	end
	if nCSD_SuMon < 300 or nCSD_TH < 30 or nCSD_TNC < 81 or nCSD_LS < 30 then
		Talk(1, "", "��i hi�p ch�a ho�n th�nh �� s� l��ng nhi�m v�: S� m�n, Th�i H�, T�i nguy�n chi�n, L��ng S�n?")
		return	
	end
	if nCSD_TA < 33 or nCSD_TL < 33 then
		Talk(1, "", "��i hi�p ch�a ho�n th�nh �� s� l��ng nhi�m v�: Tr� An, Th�y L�i?")
		return	
	end	
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "��i hi�p ch�a mang theo �� 333 B�nh b�t v�ng?")
		return
	end
	if gf_Judge_Room_Weight(3, 100," ") ~= 1 then
        	return
    end
	if DelItem(1,1,15, 333) == 1 and GetTask(TSK_CSD) == 3 then
		SetTask(TSK_CSD,4)
		gf_AddItemEx2({2,1,30345, 1,4}, "Chuy�n Sinh ��n", "CHUOI NHIEM VU CSD", "NHAN THANH CONG CSD")
	end
end
function exchange_CSD()
	if GetItemCount(2,1,30345) < 1 then
		Talk(1, "", "��i hi�p kh�ng mang theo Chuy�n Sinh ��n ?")
		return
	end
	if GetItemCount(2,1,1006) < 2 then
		Talk(1, "", "��i hi�p kh�ng mang theo C�u Thi�n V� C�c ��n ?")
		return
	end
	if DelItem(2,1,30345,1) == 1	and DelItem(2,1,1006,2) == 1 then
		gf_AddItemEx2({2,1,30345, 1,1}, "Chuy�n Sinh ��n", "DOI CSD", "CSD THANH CONG", 30*24*60*60)		
	end
end
function get_CSD_infor()
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	Talk(1, "", "Nhi�m v� S� m�n: "..nCSD_SuMon.."/300\nNhi�m v� Th�i H� Huy�n C�nh: "..nCSD_TH.."/30\nNhi�m v� T�i Nguy�n Chi�n: "..nCSD_TNC.."/81\nNhi�m v� L��ng S�n: "..nCSD_LS.."/30\nNhi�m v� Tr� An: "..nCSD_TA.."/33\nNhi�m v� Th�y L�i: "..nCSD_TL.."/33\nTr�ng H�t Gi�ng: "..nCSD_HG.."/300\nTr�ng B�t nh� nh�: "..nCSD_BNN.."/181\nTr�ng B�t nh� to: "..nCSD_BNL.."/99\nTr�ng c�y T� Linh: "..nCSD_TLinh.."/99")
end
function finish_sumon()
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
	local nRemain = 300 - nCSD_SuMon
	local nCost = nRemain * 4
	if nCSD_SuMon >= 300 then
		Talk(1, "", "B�n �� ho�n th�nh �� s� l��ng nhi�m v� y�u c�u n�n kh�ng c�n ta gi�p �� !!!")
		return
	end
	if GetItemCount(2,1,30230) < nRemain * 4 then
		Talk(1, "", "M�i nhi�m v� t�n 4 xu v�t ph�m. B�n kh�ng �� "..nCost.."  xu v�t ph�m �� ho�n th�nh "..nRemain.." nhi�m v� c�n l�i !!!")
		return	
	end
	if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
		if DelItem(2,1,30230,nCost) == 1 then
			gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho�t th�nh c�ng", 1, "Ho�n th�nh nhanh nv S� M�n")
			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + nRemain)
		end
	end
end
function nothing()

end