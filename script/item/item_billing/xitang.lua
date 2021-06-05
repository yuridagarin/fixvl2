Include("\\script\\���\\marriage_head.lua");

MAX_USE = 10;

function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","� khu v�c k�t h�n m�i d�ng ���c k�o m�ng.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_EAT_XITANG_DATE) < nDate then
		SetTask(TASK_EAT_XITANG_COUNT,0);
		SetTask(TASK_EAT_XITANG_DATE,nDate);
	end;
	local selTab = {
				format("��ng �/#eat(%d)",nItemIdx),
				"H�y b�",
				}
	local nLevel = GetLevel();
	local nExp = nLevel^2*15;
	local nLeft = MAX_USE - GetTask(TASK_EAT_XITANG_COUNT);
	if nLeft <= 0 then
		Talk(1,"","H�m nay b�n �� d�ng <color=yellow>"..MAX_USE.."<color> vi�n k�o m�ng, xin �� l�n sau d�ng ti�p!");
		return 0;
	end;
	Say("��ng c�p hi�n t�i c� th� nh�n ���c <color=yellow>"..nExp.."<color> �i�m kinh nghi�m. H�m nay b�n c�n d�ng ���c <color=yellow>"..nLeft.."<color> vi�n k�o m�ng, mu�n d�ng kh�ng?",getn(selTab),selTab);
end;

function eat(nItemIdx) 
	local nEatedCount = GetTask(TASK_EAT_XITANG_COUNT)
	if nEatedCount >= MAX_USE then
		Talk(1,"","H�m nay b�n �� d�ng <color=yellow>"..MAX_USE.."<color> vi�n k�o m�ng, xin �� l�n sau d�ng ti�p!");
		return 0;
	end;
	local nLevel = GetLevel();
	local nExp = nLevel^2*15;
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyExp(nExp);
		SetTask(TASK_EAT_XITANG_COUNT,nEatedCount+1);
		WriteLog("[K�t h�n]:"..GetName().."S� d�ng 1 vi�n k�o m�ng, t�ng"..nExp.." �i�m kinh nghi�m")
	end;
end;