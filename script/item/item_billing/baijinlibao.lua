Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	local selTab = {
				format("��ng �/#use_yes(%d)",nItemIdx),
				"H�y b�/nothing",
				}
	Say("B�n mu�n m� l� bao b�ch kim?",getn(selTab),selTab);
end;

function use_yes(nItemIdx)
	if gf_JudgeRoomWeight(20,300) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		Earn(200000);
		ModifyReputation(200,0);
		AddItem(2,1,481,1,4);
		Msg2Player("B�n nh�n ���c 1 Ng� Hoa Ng�c L� ho�n");
		AddItem(2,1,483,1,4);
		Msg2Player("B�nh nh�n ���c 1 Sinh Sinh H�a T�n");
		AddItem(0,110,89+nBody-1,1,4);
		Msg2Player("B�n nh�n ���c 1 Ho�ng kim gi�p kh� t�");
		local nRand = random(1,100);
		if nRand <= 50 then
			AddItem(0,109,277+nBody-1,1,4);
			Msg2Player("B�n nh�n ���c 1 Ho�ng kim gi�p y ph�c");
		end;
		nRand = random(1,10000);
		if nRand <= 7000 then
			AddItem(2,1,270,10,4);
			Msg2Player("B�n nh�n ���c 10 B�ch C�u ho�n");
		elseif nRand <= 9000 then
			AddItem(2,1,1007,10,4);
			Msg2Player("B�n nh�n ���c 10 ��i B�ch C�u ho�n");
		elseif nRand <= 9990 then
			AddItem(2,1,1049,1,4);
			Msg2Player("B�n nh�n ���c bao m�nh Thi�n Th�ch");
		elseif nRand <= 9995 then
			AddItem(2,1,1003,1,4);
			Msg2Player("B�nh nh�n ���c K� L�n ho�n");
		else
			AddItem(2,1,1002,1,4);
			Msg2Player("B�n nh�n ���c Long Huy�t ho�n");
		end;
		WriteLog("[L� bao b�ch kim]:"..GetName().."�� s� d�ng 1 l� bao b�ch kim ")
	end;
end;

function nothing()

end;