--create date:2007-09-29 9:29
--author:yanjun
--describe:��ɽ���������ĺ����ű�
Include("\\script\\lib\\globalfunctions.lua");

TSK_USE_DATE = 2358;
g_szItemName = "T�i Long ��ng T� H�i";
IB_VERSION = 1;
g_tbSkillID = {820,823,832,835,838,841,871};

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d"));
	local nTime = tonumber(date("%H%M"));
	if nDate >= 071009 and nDate <= 071011 and nTime >= 2000 and nTime <= 2200 then
		if nDate > GetTask(TSK_USE_DATE) then
			local szExp = "";
			local nLevel = GetLevel();
			if IB_VERSION == 1 then
				szExp = "<color=yellow>"..floor(5000000*(nLevel^3)/(80^3)).." kinh nghi�m <color>. ";
			else
				szExp = "Chuy�n <color=yellow>"..floor(10000000*(nLevel^3)/(80^3)).." �i�m <color>. ";
			end;
			local selTab = {
						"��ng �/#get_reward("..nItemIdx..","..nDate..")",
						"H�y b�/nothing",
						}
			Say("H�m nay b�n m� ra l�n ��u ti�n <color=yellow>"..g_szItemName.."<color>B�n nh�n ���c 1 ph�o, 1 Ph�o hoa m�u cam, 1 Ph�o hoa m�u xanh, 1 X�ch M�c H�a Di�m, 1 Lam M�c H�a Di�m, 1 Tranh M�c H�a Di�m, 1 Th�n M�t Y�n Hoa"..szExp.."B�n mu�n m� n� ra b�y gi�?",getn(selTab),selTab);
		else
			do_fireworks(nItemIdx);
		end;		
	else
		Talk(1,"",g_szItemName.."Ch� <color=yellow>s� d�ng m�i bu�i t�i t� 20:00 - 22:00, ng�y 9, 10, 11 th�ng 10 n�m <color>.");
	end;
end;

function do_fireworks(nItemIdx)
	local nSkill = g_tbSkillID[random(1,getn(g_tbSkillID))];
	if DoFireworks(nSkill,5) == 1 then
		SetItemUseLapse(nItemIdx,30*18);
	end	
end;

function get_reward(nItemIdx,nDate)
	if gf_JudgeRoomWeight(8,20,"") == 1 then
		do_fireworks(nItemIdx);
		SetTask(TSK_USE_DATE,nDate);
		AddItem(2,3,214,1);
		Msg2Player("B�n nh�n ���c 1 ph�o");
		AddItem(2,1,189,1);
		Msg2Player("B�n nh�n ���c 1 Tranh s�c Y�n Hoa");
		AddItem(2,1,190,1);
		Msg2Player("B�n nh�n ���c 1 Lam S�c Y�n Hoa");
		AddItem(2,1,191,1);
		Msg2Player("B�n nh�n ���c 1 X�ch M�c H�a Di�m");
		AddItem(2,1,192,1);
		Msg2Player("B�n nh�n ���c 1 Lam M�c H�a Di�m");
		AddItem(2,1,193,1);
		Msg2Player("B�n nh�n ���c 1 Tranh M�c H�a Di�m");
		AddItem(2,1,194,1);
		Msg2Player("B�n nh�n ���c 1 Th�n M�t Y�n Hoa");
		local nLevel = GetLevel();
		local nExp = 0;
		local nGoldenExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(5000000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		else
			nGoldenExp = floor(10000000*(nLevel^3)/(80^3));
			nExp = gf_GoldenExp2Exp(nGoldenExp);
		end;
		WriteLog("[V�t ph�m m�ng sinh nh�t V� l�m �� ra l�]:"..GetName().."nh�n ���c 1 l�n th��ng:"..nExp.." �i�m kinh nghi�m");
	end;
end;