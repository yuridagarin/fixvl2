-- name: mouse_big_gift.lua
-- desc: �������(Խ�ϰ�)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nIdx)
	Say("B�n c� mu�n s� d�ng kh�ng?",
		2,
		"Mu�n/#use_gift("..nIdx..")",
		"Ta ch�a mu�n s� d�ng./end_dialog")
end

-- 5%���ʻ����������
-- 100%���ʻ�� ����װ��� ����ģ�
function use_gift(nIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20080229 then
		Msg2Player("V�t ph�m �� qu� h�n, kh�ng th� s� d�ng.");
		return
	end
	if gf_JudgeRoomWeight(3, 20) ~= 1 then
		Msg2Player(STR_OVERWEIGHT);
		return
	end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end
	local nRet, nItem = 0, 0;
	gf_SetLogCaption("[viet_newyear][mouse_big_gift]");
	local nr = random(1, 100)
	if nr < 4 then
		nRet, nItem = gf_AddItemEx( {0, 105, 33, 1, 1, -1, -1, -1, -1, -1, -1}, "Ni�n th�" );
		if nRet ~= 0 and nItem ~= 0 then
			SetItemExpireTime(nItem, 3600 * 24);
		end
	elseif nr > 20 + 3 then
		return
	end
	
	nRet, nItem = gf_AddItemEx( {2,1,30000,1,1}, "H�p qu� �o n�m m�i" );
	if nRet ~= 0 and nItem ~= nil then
		nRet = gf_setItemExpireDate(nItem, 2008, 2, 17, 24);
		if nRet ~= 1 then
			WriteLog("Th�i h�n s� d�ng h�p qu� �o n�m m�i th�t b�i: date = 2008, 2, 17, 24");
		end
	end
	gf_SetLogCaption("");
end

function end_dialog()
end

