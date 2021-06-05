Include("\\script\\lib\\globalfunctions.lua")

need_item={
	[209500208] = {2,95,208,"T� Ngh�a L�nh"},
	[200130409] = {2,1,30409,"Th�ng Thi�n L�nh"},
}
target_item = {2,97,236, "Thi�n Ki�u L�nh"}
function OnUse(nItemIdx)
	Talk(1, "", "Hi�n t�i kh�ng c� g� !!!!")
	do return 0 end
	local nG = GetItemGenre(nItemIdx)
	local nD = GetItemDetail(nItemIdx)
	local nP = GetItemParticular(nItemIdx)
	local nKey = nG*1000*100000 + nD*100000 + nP
	local tPara = need_item[nKey]
	if tPara then
		local nCount = GetItemCount(nG, nD, nP)
		local szItemName = GetItemName(nItemIdx)
		local szTitle = format("%s �� kh�ng th� d�ng, nh�ng c� th� ��i th�nh m�t s� %s, ��ng � ��i kh�ng?",szItemName, target_item[4])
		local tbSay = {
			format("Ta mu�n ��i /#_on_exchange(%d,%d)", nKey, nCount),
			"T� b�/no"
			}
		Say(szTitle, getn(tbSay), tbSay)
	end
	
	
end
function no()
end

function _on_exchange(nKey, nCount)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	AskClientForNumber(format("_request_number_call_back_%d", nKey), 1, nCount, "H�y nh�p v�o s� l��ng c�n ��i")
end

function _request_number_call_back_209500208(nNum)
	_request_number_call_back(209500208, nNum)
end
function _request_number_call_back_200130409(nNum)
	_request_number_call_back(200130409, nNum)
end

function _request_number_call_back(nType, nNum)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	local nG = floor(nType/100000000)
	local nD = mod(floor(nType/100000), 1000)
	local nP = mod(nType, 100000)
	local nDelResult = DelItem(nG, nD, nP, nNum)
	if  nDelResult and nDelResult == 1 then
		AddItem(target_item[1], target_item[2], target_item[3], nNum)
		local szMsg = format("��i th�nh c�ng %d c�i %s", nNum, target_item[4])
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
		WriteLog(format("%s exchange %d %s(%d,%d,%d) using %d",GetName(),nNum, target_item[4], target_item[1], target_item[2], target_item[3], nType));
	end
end