--�����󲹸���
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local tSay = {
		"\nKh�i ��ng tr�c ti�p/#ZQ_OpenTmzPak("..nItem..","..ZQ_OPEN_PAK_COST_L1..")",
		format("\nD�ng %dXU kh�i ��ng/#ZQ_OpenTmzPak(", ZQ_OPEN_PAK_COST_L2)..nItem..","..ZQ_OPEN_PAK_COST_L2..")",
		format("\nD�ng %dXU kh�i ��ng/#ZQ_OpenTmzPak(", ZQ_OPEN_PAK_COST_L3)..nItem..","..ZQ_OPEN_PAK_COST_L3..")",
	}
	tinsert(tSay, "\nT�m th�i kh�ng c�n/do_nothing");
	Say("H�y ch�n h�nh th�c kh�i ��ng: ", getn(tSay), tSay);
end

function do_nothing()
end