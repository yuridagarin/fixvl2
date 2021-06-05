Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	local tSay = {}
	for i = 1, getn(ZQ_CAIJI_ITEM) do
		tinsert(tSay, format("Mua %s/#buy_item(", ZQ_CAIJI_ITEM[i][4])..i..")")
	end
	tinsert(tSay, "\n T�i h� ch� xem qua th�i/do_nothing");
	Say("<color=green>Li�u th��ng nh�n: <color>mu�n l�m t�t c�ng vi�c tr��c ti�n ph�i c� c�ng c� t�t!", getn(tSay), tSay);
end

function buy_item(nIndex)
	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 28, 29, nIndex, TASK_ACCESS_CODE_ZQBATTLE);
	local nRoom = GetFreeItemRoom();
	local nPay = floor(GetCash() / ZQ_CAIJI_ITEM[nIndex][5]);
	AskClientForNumber("buy_item_deal", 1, min(nRoom, nPay),"H�y nh�p s� l��ng mua: ","")
end

function buy_item_deal(nNum)
	local nIndex = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 28, 29);
	if nIndex < 1 or nIndex > getn(ZQ_CAIJI_ITEM) then
		return 0;
	end
	if not ZQ_CAIJI_ITEM or getn(ZQ_CAIJI_ITEM[nIndex]) ~= 5 then
		return 0;
	end
	if gf_Judge_Room_Weight(nNum, 2*nNum, " ") ~= 1 then
		return 0;
	end
	if GetCash() < nNum * ZQ_CAIJI_ITEM[nIndex][5] then
		Talk(1,"","Ng�n l��ng trong h�nh trang kh�ng ��");
		return 0;
	end
	if Pay(ZQ_CAIJI_ITEM[nIndex][5] * nNum) == 1 then
		gf_AddItemEx2({ZQ_CAIJI_ITEM[nIndex][1], ZQ_CAIJI_ITEM[nIndex][2], ZQ_CAIJI_ITEM[nIndex][3], nNum}, ZQ_CAIJI_ITEM[nIndex][4], ZQ_szLogTitle, "Mua d�ng c� thu th�p", 0, 1);
	end
end

function do_nothing()
end