Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

SZ_NPC_NAME="Ng� H�nh T�n Gi�"
function equip_feed_OnServerStart()
	local npcIndex1 = CreateNpc("C�n L�n T�n Ch��ng M�n", SZ_NPC_NAME, 300,1921,3576)
    SetNpcScript(npcIndex1, "\\script\\equip_feed\\equip_feed_npc.lua")
end

function main(bTag)
	return equip_feed_NpcTalkMain(bTag)
end

function equip_feed_NpcTalkMain(bTag)
	
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Thi�n ��a khai, ng� h�nh sinh, t�y theo phong �n c� ��i m� kh�a d��ng th�nh trang b� cu�i c�ng t�i xu�t th� gian.")
	local tbSay = {}
	
	--�
	local tID = {121}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(121, bTag) then
			return
		end
	end

	tinsert(tbSay, "Gi�i thi�u d��ng th�nh trang b�/_equip_feed_desc")
	tinsert(tbSay, "Nu�i d��ng trang b� d��ng th�nh/_equip_feed_weiyang")
	tinsert(tbSay, "Tr�ng luy�n trang b� d��ng th�nh/_equip_feed_chongzhu")
	tinsert(tbSay, "Tinh luy�n trang b� d��ng th�nh/_equip_feed_jinglian")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_desc()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Hi�n t�i d��ng th�nh trang b� xu�t th� c� Huy Ch��ng, �o Cho�ng v� gi�y. Khi ng��i nh�n ���c trang b� th� ��ng c�p trang b� t��ng ��i th�p, nh�ng c� th� th�ng qua nu�i d��ng Thi�t Tinh ho�c nh�ng th� kh�c �� n�ng c�p trang b�.")
	szTitle = format("%s\n%s", szTitle, "T�y theo n�ng c�p ��ng c�p d��ng th�nh trang b�, thu�c t�nh d��ng th�nh c�a trang b� s� d�n d�n ph�t tri�n, m� kh�a thu�c t�nh sau khi ��t ��n tr� s� t��ng �ng c�ng s� m� kh�a.")
	local tbSay = {}

	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_chongzhu()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "Thu�c t�nh ph�t tri�n c�a trang b� d��ng th�nh c� th� th�ng qua T�y T�m Th�ch ti�n h�nh tr�ng luy�n, sau khi tr�ng luy�n ��ng c�p c�a trang b� kh�ng thay ��i, thu�c t�nh ph�t tri�n s� thay ��i.")
	szTitle = format("%s\n%s", szTitle, "D��ng th�nh trang b� c�p sao c�ng cao, c�n c�p �� c�a T�y T�m Th�ch c�ng cao.")
	local tbSay = {}

	tinsert(tbSay, "Tr�ng luy�n trang b�/_equip_feed_do_chongzhu")
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_jinglian()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "M� kh�a thu�c t�nh c�a trang b� d��ng th�nh c� th� th�ng qua Luy�n L� Thi�t ti�n h�nh tinh luy�n, sau khi tinh luy�n ��ng c�p c�a trang b� kh�ng thay ��i, thu�c t�nh m� kh�a s� thay ��i.")
	szTitle = format("%s\n%s", szTitle, "D��ng th�nh trang b� c�p sao c�ng cao, c�n c�p �� c�a Luy�n L� Thi�t c�ng cao.")
	local tbSay = {}

	tinsert(tbSay, "Tinh luy�n trang b�/_equip_feed_do_jinglian")
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_weiyang()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "D��ng th�nh trang b� c� th� th�ng qua vi�c th�m v�o d��ng th�nh trang b� kh�ng d�ng ��n ho�c Thi�t Tinh �� n�ng c�p.")
	szTitle = format("%s\n%s", szTitle, "D��ng th�nh trang b� c�p sao c�ng cao, th� kinh nghi�m c�n �� n�ng c�p c�ng nhi�u")
	local tbSay = {}

	tinsert(tbSay, "Nu�i d��ng trang b�/_equip_feed_do_weiyang")
	tinsert(tbSay, "Quay l�i /equip_feed_NpcTalkMain")
	tinsert(tbSay, "Ra kh�i/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_do_chongzhu()
	SendScript2Client("Open([[EquipEvolution]], 2);");
end

function _equip_feed_do_jinglian()
	SendScript2Client("Open([[EquipEvolution]], 3);");
end


function _equip_feed_do_weiyang()
	SendScript2Client("Open([[CommonEnhanceItem]], 101);");
end

function nothing()
end