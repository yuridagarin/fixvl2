--08���˽�С������ű�
--by vivi
--2008/03/03

TASK_SANBA_PETTIME = 2407; --����ʱ��

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","N�i n�y hi�n kh�ng th� s� d�ng Ti�u b�ch tr� ph�");
		return 0;
	end;
	local selTab = {
				"��ng v�y!/confirm",
				"Sau n�y s� d�ng ti�p/nothing",
				}
	Say("Mu�n s� d�ng Ti�u b�ch tr� ph� kh�ng? Sau khi x�c nh�n, b�n s� m�t th� nu�i hi�n t�i.",getn(selTab),selTab);
end;

function confirm()
	KillFollower();
	AskClientForString("create_pet","",1,14,"Xin nh�p t�n c�a n� v�o:");
end;

function create_pet(sName)
	local nSex = GetSex();
	local sPetName = "";
	if nSex == 1 then
		sPetName = "Ti�u B�ch tr� (m�)";
	else
		sPetName = "Ti�u B�ch tr� (b�)";
	end
	
	if DelItem(2,0,621,1) == 1 then
		SetTask(TASK_SANBA_PETTIME,GetTime());
		SummonNpc(sPetName,sName);
		Say("Th�i gian t�n t�i c�a th� c�ng l� 24 gi� (bao g�m th�i gian r�i m�ng), xin h�y y�u th��ng ch�ng!",0);
	end;
end;

function nothing()

end;