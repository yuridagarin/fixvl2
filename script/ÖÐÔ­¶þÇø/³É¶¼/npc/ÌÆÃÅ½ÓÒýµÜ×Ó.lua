-- ���Ž�������

function main()
	if GetPlayerFaction() == 5  then
		Say("Ta c� th� gi�p g� ch�ng?",3,"Nh� s� huynh ��a ta v� ph�i./gototangmen","T�m hi�u khu v�c luy�n c�p/maphelp","Nh� s� huynh v�n an L�o L�o gi�m ta!/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","Qu� ph�i danh vang thi�n h�, b�n m�n th�t kh�ng th� b�!")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Tuy c�ng l� ng��i T� Xuy�n, nh�ng tr��c gi� kh�ng can h� g� nhau c�!")
	elseif GetPlayerFaction() == 1 then
		Talk(1,"","V� c�ng thi�n h� ��u b�t ngu�n t� Thi�u L�m, ch�ng hay �m kh� v� b�y c�a ���ng M�n ta c� ngu�n g�c t� ��u?")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","Th�t kh�ng ng� 1 ��m �n m�y c�ng c� th� danh vang 1 c�i, b�n m�n th�t l� b�i ph�c!")
	else
		Say("T�m ta c� vi�c chi?",2,"Ta mu�n tham quan ���ng M�n/gototangmen","Kh�ng c� g�!/no")
	end
end

function gototangmen()
	NewWorld(305, 1532, 2915)			--����Ҵ��͵��������
end;

function no()
end;

function maphelp()
end;