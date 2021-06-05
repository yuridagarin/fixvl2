Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","Khu v�c hi�n t�i kh�ng th� d�ng Ti�u Ni�n Th� ph�");
		return 0;
	end;
	local selTab = {
				"��ng v�y!/confirm",
				"Sau n�y s� d�ng ti�p/nothing",
				}
	Say("B�n x�c nh�n mu�n d�ng Ti�u Ni�n Th� Ph�? Sau khi nh�n x�c nh�n B�ch Bi�n Ti�u Th�n Th�ng ho�c Ti�u Ni�n Th� c�a b�n s� m�t �i.",getn(selTab),selTab);
end;

function confirm()
	KillFollower();
	AskClientForString("create_pet","",1,14,"Xin nh�p t�n c�a n� v�o:");
end;

function create_pet(sName)
	if DelItem(tItemOther["monster_card"][2],tItemOther["monster_card"][3],tItemOther["monster_card"][4],1) == 1 then
		SetTask(TASK_GOTPET_TIME,GetTime());
		SummonNpc("Ti�u K� L�n",sName);
		Say("Th�i gian t�n t�i c�a th� c�ng l� 30 ng�y (bao g�m th�i gian r�i m�ng), xin h�y y�u th��ng ch�ng!",0);
	end;
end;

function nothing()

end;