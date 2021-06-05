--��ɽboss���ʹ
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\liangshanboss\\lsb_daliy_task.lua")

Activity_Npc_Name = "<color=green>��i S� ho�t ��ng: <color>";

Item_table1 = {2,1,30384,"L��ng S�n M�t B�o R��ng"};
Item_table2 = {2,1,30385,"Ch�a kh�a v�ng L��ng S�n"};
Coin_cost = 50;
Item_cost = 100;


tbSay_201206 = {
		"\n Gi�i thi�u ho�t ��ng/introduce_201206",
		"\n Nhi�m v� ng�y/daily_task_201206",
		"\n D�ng L��ng S�n M�t B�o R��ng ��i ch�a kh�a v�ng L��ng S�n/exchange_201206",
		};
		
sTitle_201206 = "Hoan ngh�nh tham gia ho�t ��ng ch�o m�ng Phi�n B�n m�i. Ph�n th��ng l� Thi�n Cang L�nh, trang b� Hi�n Vi�n, c�n c�c ph�n th��ng phong ph� kh�c �ang ch� b�n, h�y mau tham gia"


function introduce_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
	"\n Ho�t ��ng 1: Khi�u chi�n Boss ��i Ho�ng Kim/Activity1_201206",
	"\n Ho�t ��ng 2: Tri�u g�i L��ng S�n h�o ki�t/Activity2_201206",
	"\n Ho�t ��ng 3: M� L��ng S�n M�t B�o R��ng/Activity3_201206",
	--"\n������һ��/main",
	"\n T�i h� ch� xem qua th�i/nothing",
	};
	Say(Activity_Npc_Name.."Phi�n b�n m�i m�, T�y B�c li�n d�y s�ng, L��ng S�n h�o ki�t mang theo b�o v�t kh�p n�i th�m d� tin t�c. Ho�t ��ng n�y ch� d�nh cho ng��i ch�i c�p <color=red>80<color> tr� l�n �� gia nh�p h� ph�i. ",getn(tbSay),tbSay);
end

function Activity1_201206()
	local tbSay = {
	"\n Quay v� c�p �� tr��c /introduce_201206",
	"T�i h� ch� xem qua th�i/nothing",
	};
	Say(Activity_Npc_Name.."M�i ng�y 12:30, 15:30, 19:30, 22:30 s� xu�t hi�n Boss ��i Ho�ng Kim L��ng S�n, ��nh b�i s� nh�n ���c Thi�n Cang L�nh, trang b� Hi�n Vi�n. ",getn(tbSay),tbSay);
end

function Activity2_201206()
	local tbSay = {
	"\n Quay v� c�p �� tr��c /introduce_201206",
	"T�i h� ch� xem qua th�i/nothing",
	};
	Say(Activity_Npc_Name.."\n\t M�i ng�y gi�t qu�i � xung quanh Ph��ng T��ng Ph� nh�n ���c L��ng S�n t�n v�t, thu th�p �� 9 c�i c� th� tri�u g�i L��ng S�n h�o ki�t, m�i ng�y 5 l�n. \n\t C�ng c� th� mua Xuy�n V�n Ti�n � Ng� C�c �� tri�u g�i L��ng S�n h�o ki�t--kh�ng h�n ch� s� l�n mua.\n D�ng c�ch th�c n�o c�ng c� th� tri�u g�i Ho�ng Kim ��i Boss, ng��i g�i ra s� nh�n ���c Thi�n Cang L�nh.",getn(tbSay),tbSay);
end

function Activity3_201206()
	local tbSay = {
	"\n Quay v� c�p �� tr��c /introduce_201206",
	"T�i h� ch� xem qua th�i/nothing",
	};
	Say(Activity_Npc_Name.."\n\t Tham gia ho�t ��ng nh�n ���c L��ng S�n M�t B�o R��ng, d�ng ch�a kh�a v�ng m� B�o R��ng �� nh�n ph�n th��ng. \n\t M� 1 B�o R��ng nh�n ���c 1 m�nh Thi�n Cang (d�ng �� ��i Thi�n Cang L�nh), ph�n th��ng l�n nh�t l� Thi�n Cang L�nh, ��i ��nh H�n Thi�n Th�ch Th�n Th�ch.\n\t C� th� mua ch�a kh�a v�ng L��ng S�n �  Ng� C�c, c�ng c� th� d�ng L��ng S�n M�t B�o R��ng ��i v�i t�i h�. ",getn(tbSay),tbSay);
end

function daily_task_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
	"\n Nh�t ��i B�o R��ng c�a Boss Ho�ng Kim (%s)/task_1",
	"\n Tri�u g�i 5 l�n L��ng S�n h�o ki�t (%s)/task_2",
	"\n M� 1 L��ng S�n M�t B�o R��ng (%s)/task_3",
	--"\n������һ��/main",
	"\n T�i h� ch� xem qua th�i/nothing",
	};
	tbSay[1] = format(tbSay[1],return_status(89));
	tbSay[2] = format(tbSay[2],return_status(90));
	tbSay[3] = format(tbSay[3],return_status(91));
	Say(Activity_Npc_Name.."Ti�p nh�n nhi�m v� ng�y �� nh�n th�m ph�n th��ng. ",getn(tbSay),tbSay);
end

function exchange_201206()
	if LSB_IsActivityOpen() ~= 1 then
		Talk(1,"",Activity_Npc_Name.."Event �� h�t h�n");
		return 0;
	end
	local tbSay = {
	"\n T�i h� mu�n ��i/deal_exchange_201206",
	--"\n������һ��/main",
	"\n T�i h� ch� xem qua th�i/nothing",
	};
	Say(Activity_Npc_Name.."\n\t D�ng L��ng S�n M�t B�o R��ng ��i ch�a kh�a v�ng v�i t�i h�. \n\t 100 c�i L��ng M�t B�o R��ng + 50 v�ng=1 ch�a kh�a v�ng L��ng S�n",getn(tbSay),tbSay);
end

function deal_exchange_201206()
	local nCount1 = floor(GetCash() / Coin_cost*10000);
	local nCount2 = floor(GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) / Item_cost);--��ɽ�ܱ�����Ŀ
	AskClientForNumber("call_exchage_201206",0,min(nCount1,nCount2),"Nh�p s� l��ng ��i","");
end

function call_exchage_201206(nNum)
	if gf_Judge_Room_Weight(1,nNum," ") ~= 1 then
    Talk(1,"",Activity_Npc_Name.."Kh�ng gian h�nh trang kh�ng ��");
		return 0;
  end
  if GetCash() < nNum * Coin_cost * 10000 then
  	Talk(1,"",Activity_Npc_Name..format("V�ng trong h�nh trang kh�ng �� %d",nNum * Coin_cost ));
  	return 0;
  end
  if GetItemCount(Item_table1[1],Item_table1[2],Item_table1[3]) < nNum * Item_cost then
  	Talk(1,"",Activity_Npc_Name..format("S� l��ng %s trong h�nh trang kh�ng �� %d c�i",Item_table1[4],nNum * Item_cost));
  	return 0;
  end
	if Pay(nNum * Coin_cost * 10000) == 1 and DelItem(Item_table1[1],Item_table1[2],Item_table1[3],nNum * Item_cost) == 1 then
		gf_AddItemEx2({Item_table2[1],Item_table2[2],Item_table2[3],nNum}, Item_table2[4], "��i S� ho�t ��ng", "��i L��ng S�n M�t B�o R��ng", 0, 1)
	end
end