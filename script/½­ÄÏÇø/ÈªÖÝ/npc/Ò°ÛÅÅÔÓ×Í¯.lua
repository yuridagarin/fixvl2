--function main()
--	Talk(1,"","<color=green>��ͯ<color>���Ҷ��Ӻö�����")
--end;

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng trung thu : ".."Ti�u ��ng"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>��a b�<color>: "

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	local selTab = {
				"Ta s� �l� xה cho mu�i, mu�i ��i cho ta 1 c�y N�n V�ng nh�!/bug_candle",
				"Ta s� quay l�i sau.!/no",
				}
	Say(g_szInfoHead.."Ho�t ��ng \"Truy t�m l�ng ��n may m�n\" di�n ra t� 05-09-2008 ��n 24:00 ng�y 05-10-2008. L�ng ��n s� xu�t hi�n T� 11:00 ��n 14:00 v� t� 21:00 ��n 24:00 v�o c�c ng�y Th� 6, Th� 7 v� Ch� nh�t h�ng tu�n. Trong th�i gian n�y, ng��i ch�i ��n NPC Ti�u ��ng �� nh�n �N�n v�ng�. � tr�ng th�i chi�n ��u, ng��i ch�i mang N�n V�ng ��n c�c b�n �� �� th�p s�ng L�ng ��n May M�n, s� c� c� h�i nh�n ���c ph�n th��ng �i�m kinh nghi�m v� c�c v�t ph�m c� gi� tr�.",getn(selTab),selTab);
end

function bug_candle()
	if GetCash() < 1000 then
		Say(g_szInfoHead.."Mu�i kh�ng ��i ��u v� s� huynh (t� t�) ch�a l� x� cho mu�i.",1,"�i! Ta qu�n m�t./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	if pay_ex(1000) == 1 then
		add_item_ex("N�n v�ng",2,1,30029,1)
	else
		Say(g_szInfoHead.."Mu�i kh�ng ��i ��u v� s� huynh (t� t�) ch�a l� x� cho mu�i.",1,"�i! Ta qu�n m�t./no")
		return
	end
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Pay("..nNum..") Failed, return value = "..nRetCode);
		return 0
	end
end

function no()
end

