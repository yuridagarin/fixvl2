Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnUse()
	local nMapID = GetWorldPos()
	if nMapID >= 700 then
		Talk(1,"","Khu v�c hi�n t�i kh�ng th� d�ng B�ch Bi�n Ti�u Th�n Th�ng");
		return 0;
	end;
	local selTab = {
				"��ng v�y!/confirm",
				"Sau n�y s� d�ng ti�p/nothing",
				}
	Say("B�n x�c nh�n mu�n s� d�ng B�ch Bi�n Ti�u Th�n Th�ng? Sau khi nh�n x�c nh�n, B�ch Bi�n Ti�u Th�n ho�c Ti�u Ni�n Th� c�a b�n s� bi�n m�t.",getn(selTab),selTab);
end;

function confirm()
	KillFollower();
	AskClientForString("create_pet","",1,14,"Xin nh�p t�n c�a n� v�o:");
end;

tModelName = {
		"Th� tr�ng theo sau",
		"M� H�u theo sau",
		"Heo r�ng nh� theo sau",
		"B�ch ��u �i�u theo sau",
		"T� D� H� theo sau",
		"H�c Tinh Tinh theo sau",
		"D� Xoa Nha theo sau",
		"Ki�m H�n theo sau",
		}

function create_pet(sName)
	if DelItem(tItemOther["transformer_card"][2],tItemOther["transformer_card"][3],tItemOther["transformer_card"][4],1) == 1 then
		SetTask(TASK_GOTPET_TIME,GetTime());
		SummonNpc(tModelName[random(1,getn(tModelName))],sName);
		Say("Th�i gian t�n t�i c�a th� c�ng l� 30 ng�y (bao g�m th�i gian r�i m�ng), xin h�y y�u th��ng ch�ng!",0);
	end;
end;

function nothing()

end;