-- ���ֽ�������

function main()
	if GetPlayerFaction() == 1  then
		Say("S� ph� ph�i s� �� xu�ng n�i �?",3,"Phi�n huynh ��a �� xu�ng n�i!/gotoshaolin","T�m hi�u khu v�c luy�n c�p/maphelp","Thay �� v�n an s� ph�!/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","V� �ang v�i Thi�u L�m ��u l� Th�i S�n B�c ��u, thi�n h� anh h�ng h�i th�ng sau kh�ng bi�t qu� ph�i cho ai ra ngh�nh chi�n?")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Danh ti�ng qu� ph�i vang xa, ti�u t�ng ��y kh�m ph�c!")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","Ti�u t�ng ng��ng m� t�t c� anh em trong qu� bang.")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","�m kh� v� b�y ���ng M�n danh ch�n giang h�. C� d�p ti�u b�i xin th�nh gi�o v�i chi�u!")
	else
		Say("Th� ch� t�m ti�u t�ng c� vi�c chi?",2,"Ta mu�n tham quan Thi�u L�m/gotoshaolin","Kh�ng c� g�!/no")
	end
end

function gotoshaolin()
	NewWorld(204, 1501, 3328)			--����Ҵ��͵��������
end;

function no()
end;

function maphelp()
end;

