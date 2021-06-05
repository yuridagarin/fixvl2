--coding by romandou 2004-12-22
--ս�۵ı�����Npc�Ի��ű�
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

function main()
CleanInteractive()	--�Ͽ�����

--bt_setnormaltask2type()
if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
	Say("��i qu�n ch�a xu�t ph�t. T��ng s� xin ngh� ng�i ��i l�nh!",0)
	return
end
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ng��i ch�a gia nh�p m�n ph�i n�o! Chi�n tr��ng r�t kh�c li�t! H�c xong v� ngh� h�y quay l�i tham chi�n!", 0)
		return
	end
	-------------------------------------------------------------------	
	--�ж�����Ƿ�Ϊ����״̬
--	local nTime = tonumber(date("%y%m%d%H%M"));
--	if nTime - BT_GetData(PL_LEAVETIME) < 60 then
--		Say("ս��֮�䣬�������ӣ����Ծ������£��㻹���Ⱥú÷�ʡһ�°ɡ�", 0);
--		return
--	end;


--�ж���ҵȼ��뱨����ȼ��Ƿ����ʺ�
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --��ҵȼ�
	local bt_level = 0;	-- ��ǰ��ͼ������ս�۵ȼ�
	
	if (pl_level < 40 ) then
		Say("Xin l�i! Ng��i ch�a ��n c�p 40! H�y quay l�i sau nh�!",2, "Ta s� quay l�i/bt_oncancel", "T�m hi�u Nh�n M�n quan chi�n/bt_onbattleinfo");--��������ĵȼ�С��40������û�д�����������
		return 
	elseif pl_level >= 40 and pl_level < 70 then
		bt_level = 1
	elseif (pl_level >= 70) then
		bt_level = 2
--	else
--		bt_level = 2
	end;

	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("ID b�n �� �i�m b�o danh b�o l�i, xin ki�m tra l�i!");
		 	return 	
		 end
		 Say("N�i n�y l�"..szGAME_GAMELEVEL[maplevel]..", ��ng c�p c�a ng��i ch� c� th� ��n"..szGAME_GAMELEVEL[bt_level].." b�o danh!", 0)--����û�зֵȼ�����ʾ��Ϣ		 
		 return
	end

-------------------------------------------------------------------	

	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("Ti�n ph��ng �ang ngh�n l�i! T�m th�i kh�ng th� v�o chi�n tr��ng!", 0 )
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("Xin l�i! Hi�n chi�n tr��ng ch�a m�. Khi kh�c h�y quay l�i!", 0 )
		SubWorld = tempSubWorld;
		return
	elseif (state == 3) then
		Say("Xin l�i! Hi�n chi�n tr��ng �� k�t th�c. Khi kh�c h�y quay l�i!", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
	sl_clearplayerdata()	--ÿ���¿�ʼ��������һ�ֵ���Ϣ����ս�������
	local str = ""
	if (bt_ncamp == 1) then
		str = "T�c ng� c� c�u: Thi�n h� h�ng vong, th�t phu h�u tr�ch. Nay gi�c Li�u x�m ph�m b� c�i ta, Qu�c gia l�m nguy. L� con d�n ��i T�ng, ta ph�i t�n trung b�o Qu�c! Anh h�ng! Xin h�y ��u qu�n gi�t gi�c l�p c�ng!"
	else
		str = "H�i c�c d�ng s� Li�u Qu�c! Nay ta chi�u m� c�c ng��i �i ti�u di�t T�ng qu�n ngoan c�, ho�n th�nh b� nghi�p c�a ��i Li�u ta. H�y t�n trung b�o qu�c, ��u qu�n gi�t gi�c l�p c�ng!"
	end
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("Xin l�i! Hi�n chi�n tr��ng �� k�t th�c. Khi kh�c h�y quay l�i!", 0)
		return 
	end
	BT_SetData( PL_SERIESKILL, 0 )	--��ն����0
	BT_SetData( PL_KILLPLAYER, 0 )	--ɱ������0
	if (bt_ncamp == 1) then
		Say(str, 2, "Gia nh�p/bt_joinsong", "Ta suy ngh� l�i!/bt_oncancel");
	else
		Say(str, 2, "Gia nh�p/bt_joinjin", "Ta suy ngh� l�i!/bt_oncancel");
	end
	return	
end;

if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp and BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) ) then
	if (bt_ncamp == 1) then
		Say("Tr�ng ng��i t��ng m�o gian �c, nh�t ��nh l� gian t� Li�u Qu�c. Ng��i ��u! Mau b�t n�!",0)
		Msg2Player("Tr�n n�y ng��i thu�c phe Li�u, h�y ��n �i�m b�o danh xin Li�u Qu�n M� Binh Quan v�o tr�n!")
	else
		Say("To gan! D�m x�m nh�p l�nh ��a ��i Li�u ta, ch�n s�ng �!",0)
		Msg2Player("Tr�n n�y ng��i thu�c phe T�ng, h�y ��n �i�m b�o danh xin T�ng Qu�n M� Binh Quan v�o tr�n!")	
	end;
	return 
end

----------------------------------------------------------------------
--��ʽ����ʱ�������ǣ�
--1���Ѿ����˱��ε�ս��
--2���Ѿ��Ǳ���ս�۵���Ӫ��
--3���뱾��ս�ֵ�ս�ֵȼ������

--��ʽ���Ա�����

Say( str, 2, "���c!/bt_enterbattle", "�� ta suy ngh� l�i/bt_oncancel");
end;

function bt_enterbattle()
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("Xin l�i! Ti�n ph��ng �ang ngh�n l�i, t�m th�i kh�ng th� v�o chi�n tr��ng!",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			return
		end
		
		local OldSubWorld = SubWorld;
		SubWorld = idx;
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
	--??if getcamp=��,����ս��ʱ��ʾ����ã���ӭ������ξ��������ɱ���δ���֣������������Ϣ��һ��ǰ���ŽǴ��죬ս���ͻῪʼ����
	--??else =��,����ս��ʱ��ʾ"�ɹ�����ʿ����ӭ��ĵ����������ξ���δ���֣������������Ϣ��һ��ǰ���ŽǴ��죬ս���ͻῪʼ��"
		local SubWorld = OldSubWorld;
		return
	else
		Say("Xin l�i! Ti�n ph��ng �ang ngh�n l�i, t�m th�i kh�ng th� v�o chi�n tr��ng!", 0);
	end
end;

function bt_wantjin()
		Say("Ng��i th�t s� mu�n gia nh�p phe Li�u? Sau khi ch�n phe s� c� hi�u l�c trong m�t v�ng! Ch� c� th� ch�n phe kh�c khi tr�n sau b�t ��u!",2, "Ta quy�t gia nh�p phe Li�u/bt_joinjin", "�� ta suy ngh� l�i/bt_oncancel");
end;

function bt_wantsong()
		Say("Ng��i th�t s� mu�n gia nh�p phe T�ng? Sau khi ch�n phe s� c� hi�u l�c trong m�t v�ng! Ch� c� th� ch�n phe kh�c khi tr�n sau b�t ��u!",2, "Ta quy�t gia nh�p phe T�ng/bt_joinsong", "�� ta suy ngh� l�i/bt_oncancel");
end;

function bt_joinsong()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 1)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("ս�۹��棺��ս�ۿ�ʼ�ˣ�����һ�ε�ս����ս���������㡣")
	Msg2Player("Hoan ngh�nh anh h�ng. H�y nhanh ch�n v�o chi�n tr��ng!")
	Say("Hoan ngh�nh anh h�ng tr� th�nh t��ng s� T�ng Tri�u. Hi�n �� khai chi�n! C� mu�n l�p t�c v�o chi�n tr��ng?", 2, "���c!/bt_enterbattle", "�� ta suy ngh� l�i/bt_oncancel");
end;

function bt_joinjin()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 2)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("ս�۹��棺��ս�ۿ�ʼ�ˣ�����һ�ε�ս����ս���������㡣")
	Msg2Player("Hoan ngh�nh d�ng s� Li�u Qu�c! H�y nhanh ch�n v�o chi�n tr��ng!")
	Say("Hoan ngh�nh anh h�ng tr� th�nh d�ng s� Li�u Qu�c. Hi�n �� khai chi�n! C� mu�n l�p t�c v�o chi�n tr��ng?", 2, "���c!/bt_enterbattle", "�� ta suy ngh� l�i/bt_oncancel");
end;

function bt_oncancel()

end
