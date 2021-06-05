--���ʹ�ű�
--ͳ��
Include("\\script\\online\\liangshanboss\\npc\\���ʹ.lua")
Include("\\script\\online\\olympic\\npc\\activity_ds.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\online\\collect_card\\cc_npc.lua")
Include("\\script\\online\\spring2014\\sp_npc.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")
Include("\\script\\function\\invite_code\\ic_head.lua")
Include("\\script\\function\\cdkey\\ck_head.lua")

function main()
	g_Act_Count = 0;
	g_Act_Dialog = {};
	g_Act_Title = {};
	g_Act_Select = {};
	
	--��ɽBoss�
	if LSB_IsActivityOpen(LSB_ACTIVITY_ID) == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "BOSS L��ng S�n";
		for i=1,getn(tbSay_201206) do 
			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201206[i]);
		end
		g_Act_Title[g_Act_Count] = sTitle_201206;
	end
	
	--���˻
	if oly_IsActivityOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "�o V�n Th�nh H�a";
		for i=1,getn(tbSay_201207) do 
			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201207[i]);
		end
		g_Act_Title[g_Act_Count] = sTitle_201207;
	end
	
	--ǧѰ���
	if qht_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho�t ��ng Thi�n T�m Th�p";
		for i=1,getn(Qht_Dialog_Table) do 
			tinsert(g_Act_Dialog[g_Act_Count], Qht_Dialog_Table[i]);
		end
		g_Act_Title[g_Act_Count] = Qht_Title;
	end
	
	--׷�ش���������ս
	if dzt_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "T� Thi�p ��i T�c Chi�n";
		for i=1, getn(DZT_DIALOG_TABLE) do 
			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
		end
		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
	end
	
	--�������ռ����ƻ
	if cc_activity_isopen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho�t ��ng thu th�p th� b�i m�n ph�i m�i";
		for i=1, getn(CC_MAIN_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], CC_MAIN_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = CC_NPC..CC_TITLE;
	end
	
	--2014���ڻ
	if sp_IsOpenActivity() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho�t ��ng n�m m�i 2014";
		for i = 1, getn(SP_NPC_TALK) do 
			tinsert(g_Act_Dialog[g_Act_Count], SP_NPC_TALK[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..SP_TITLE;
	end
	
	--���˴���
	if lb_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "R��ng May M�n L�n";
		for i = 1, getn(LB_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], LB_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..LB_NPC_TITLE;
	end
	
	--������
	if ic_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "Ho�t ��ng m� m�i";
		for i = 1, getn(IC_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], IC_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..IC_NPC_TITLE;
	end	
	
	--CDKEY�
	if ck_IsOpen() == 1 and ck_IsStatus() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "T�ng Ki�m L�nh 2";
		for i = 1, getn(CK_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], CK_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..CK_NPC_TITLE;
	end	
	
	-----------------------
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		else
			Say("<color=green> ��i S� ho�t ��ng: <color>".."Hi�n t�i kh�ng m� ho�t ��ng n�o ��u", 0);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("\n%s/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tinsert(tbSay, "\nT�i ch� xem xem th�i/nothing");
		Say("<color=green> ��i S� ho�t ��ng: <color>"..format("%s mu�n tham gia ho�t ��ng g�!", gf_GetPlayerSexName()), getn(tbSay), tbSay);
	end
end

function aa_SayDialog(nIndex)
	local nSelect = tonumber(nIndex);
	tinsert(g_Act_Dialog[nIndex], "T�i h� ch� xem qua th�i/nothing");
	Say(g_Act_Title[nIndex], getn(g_Act_Dialog[nIndex]), g_Act_Dialog[nIndex]);
end

function nothing()
--do nothing
end