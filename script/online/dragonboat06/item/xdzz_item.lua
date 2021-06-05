function OnUse()
	if DelItem(2,1,390,1) == 1 then
		local nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			local nLevel = GetLevel();
			local nNeedExp = floor((nLevel^2*125000)/(80^2))
			ModifyExp(nNeedExp)
			Msg2Player("B�n �n 1 b�nh �t tr�ng mu�i nh�n ���c"..nNeedExp.." �i�m kinh nghi�m")
		elseif nRandomNum <= 20 then
			CastState("state_confusion",0,10*18);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng �� h�, b� lo�n trong 10 gi�y.");
		elseif nRandomNum <= 30 then
			CastState("state_sleep",0,10*18);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng �� h�, b� m� trong 10 gi�y.");
		elseif nRandomNum <= 40 then
			CastState("state_vertigo",0,10*18);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng �� h�, b� cho�ng trong 10 gi�y.");
		elseif nRandomNum <= 50 then
			CastState("state_move_speed_percent_add",20,10*60*18,1,1001);	--10��������ƶ��ٶ�20%
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng, t�c �� di chuy�n t�ng 20% trong 10 ph�t.");
		elseif nRandomNum <= 60 then
			CastState("state_life_percent_per10s_anytime",10,10*60*18,1,1007);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng, m�i 10 gi�y h�i ph�c 10% sinh l�c trong v�ng 10 ph�t.");
		elseif nRandomNum <= 70 then
			CastState("state_neili_percent_per10s_anytime",10,10*60*18,1,1008);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng, m�i 10 gi�y h�i ph�c 10% n�i l�c trong v�ng 10 ph�t.");
		elseif nRandomNum <= 80 then
			CastState("state_p_attack_percent_add",20,10*60*18,1,1009);
			CastState("state_m_attack_percent_add",20,10*60*18,1,1010);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng, t�ng 20% l�c t�n c�ng n�i ngo�i c�ng trong v�ng 10 ph�t.");
		elseif nRandomNum <= 90 then
			CastState("state_p_attack_percent_dec",20,10*60*18,1,1011);
			CastState("state_m_attack_percent_dec",20,10*60*18,1,1012);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng �� h�, gi�m 20% l�c t�n c�ng n�i ngo�i c�ng trong v�ng 10 ph�t.");
		elseif nRandomNum <= 100 then
			CastState("state_life_max_percent_add",30,10*60*18,1,1013);
			Msg2Player("B�n �� �n 1 c�i b�nh �t nh�n tr�ng, t�ng 30% l��ng m�u trong v�ng 10 ph�t.");
		end;
		Msg2_LeiTai("B�nh �t tr�ng mu�i");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d�ng 1	"..szItemName);
end;
