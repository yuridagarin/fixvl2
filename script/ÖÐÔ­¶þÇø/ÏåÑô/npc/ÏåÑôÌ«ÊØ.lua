Include("\\script\\lib\\globalfunctions.lua")
--201403�
Include("\\script\\online_activites\\2014_03\\task_camp.lua")

function main()
	local tMsg = {
		"T��ng D��ng_��ng n�i s�ng Ho�i, t�y li�n Thi�n ph�, nam th�ng Mi�u L�nh, b�c ��n Bi�n Kinh. L� trung t�m c�a thi�n h� r�i c�n g�.",
		"T��ng D��ng tuy kh�ng ph�n vinh b�ng Bi�n Kinh, Th�nh ��, Tuy�n Ch�u nh�ng � ��y l�a g�o ��y �p, s�n v�t phong ph�, ng��i d�n ch�t ph�t. Ta l�m th�i th� � ��y c�ng qu� an nh�n.",
		"Y�n V� l�u � ph�a B�c th�nh th��ng c� nh�n s� giang h� ��n g�y chuy�n. Ph�i cho ch�ng bi�t T��ng D��ng c�n c� T� M� th� gia cai qu�n n�u kh�ng ch�ng s� l�m lo�n m�i.",
		"V�n M�ng Tr�ch � ph�a ��ng qu�i v�t th��ng xu�t hi�n n�u ti�n th� Phi�n b�ng h�u ��n �� m�t chuy�n."
	}
	local tSay = {}
	--�
  if gf_CheckEventDateEx(WN_201403_CAMPTASK_ID) == 1 then
  	tinsert(tSay, WN_201403_CAMPTASK_TASK);
  end
  --
  tinsert(tSay, "T�i h� ch� xem qua th�i/nothing")
	Say(tMsg[random(getn(tMsg))], getn(tSay), tSay)
end
