Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\gem\\imp_item_gem_box.lua")

SZ_NPC_NAME = "Ho�n Nhan Hy Y "
function gem_OnServerStart()
	local npcIndex1 = CreateNpc("Gem_Npc", SZ_NPC_NAME, 350,1381,3017)
    SetNpcScript(npcIndex1, "\\script\\gem\\npc_gem.lua")
end

function gemNpcTalkMain()
	if IsGemSystemOpen(2) ~= 1 then
		return
	end
	
	local szTitle = format("%s", "Ch� c�a ta c� th� ho�n th�nh c�c thao t�c li�n quan v� �� qu�")
	local tbSay = {}

	tinsert(tbSay, format("%s/_open_gem_box_from_npc", "M� C�m Nang �� Qu�"))
	tinsert(tbSay, format("%s/_getGemBox", "Nh�n C�m Nang �� Qu�"))
	tinsert(tbSay, format("%s/_gemOp_OpenHole", "��c l� trang b�"))
	tinsert(tbSay, format("%s/_gemOp_InsertGem", "Kh�m �� qu�"))
	--tinsert(tbSay, format("%s/_gemOp_RemoveGem", "��ʯ���"))
	--tinsert(tbSay, format("%s/_open_gem_shop", "��ʯ�̵�"))
	tinsert(tbSay, format("%s/_open_gem_lucky_box", "R��ng May M�n �� Qu�"))
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _open_gem_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3046, "Ti�m �� Qu�"));
end

function _open_gem_lucky_box()
	SendScript2Client("Open[[luckybox]]");	
end

function _open_gem_box_from_npc()
	OnOpen_GemBox_FromNpc()
end

function _getGemBox()
	local nG,nD,nP = 2, 1, 30699
	if BigGetItemCount(nG,nD,nP) ~= 0 then
		Talk(1, "", format("B�n �� c� [%s] r�i", g_szItemNameGemBox));
		return
	end
	local nRetCode, nItem = AddItem(nG,nD,nP, 1);
	if nRetCode == 1 then
		Msg2Player(format("B�n nh�n ���c 1 %s", g_szItemNameGemBox));
	end
end

function _gemOp_OpenHole()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 5));
end

function _gemOp_InsertGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 8));
end

function _gemOp_RemoveGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 11));
end

function nothing()
end