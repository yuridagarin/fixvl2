Include("\\script\\newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\mainbattle\\mission\\mission_head.lua");
function OnUse()
	local selTab = {
				". Thuy�t minh chi�n tr��ng/battle_introduce",
				". Tin t�c chi�n tr��ng/battle_info",
				". T�m hi�u thu�c t�nh trang b� chi�n tr��ng/know_equip",
				"��ng/nothing",
				}
	Say("H��ng d�n chi�n tr��ng:",getn(selTab),selTab);
end;

function battle_info()
	local selTab = {
				". Th�n l�ng chi�n/village_info",
				". Th�o c�c chi�n/resource_info",
				". Ph�o ��i chi�n/emplacement_info",
				". Nh�n M�n Quan chi�n/main_info",
				"Tr��c/OnUse",
				"��ng/nothing",
				}
	Say("Tin t�c chi�n tr��ng:",getn(selTab),selTab);
end;

function battle_introduce()
	local selTab = {
				". C�ch ch�i/battle_intro_technique",
				". Ph�n th��ng/battle_intro_award",
				". Qu�n h�m/battle_intro_rank",
				"Tr��c/OnUse",
				"��ng/nothing",
				}
	Say("Thuy�t minh chi�n tr��ng:",getn(selTab),selTab);
end;

function battle_intro_technique()
	local selTab = {
				". Nh�n M�n Quan_L��ng Th�o chi�n/battle_intro_technique_res",
				". Nh�n M�n Quan_Th�n L�ng chi�n/battle_intro_technique_vill",
				". Nh�n M�n Quan_Ph�o ��i chi�n/battle_intro_technique_empl",
				". Nh�n M�n Quan_Chi�n tr��ng ch�nh/battle_intro_technique_main",
				"Tr��c/battle_introduce",
				"��ng/nothing",
				}
	Say("C�ch ch�i � chi�n tr��ng m�i:",getn(selTab),selTab);
end;

function battle_intro_technique_res()
	Talk(1,"battle_intro_technique_res_1","    Sau khi v�o chi�n tr��ng ��n Qu�n Nhu quan nh�n {Cu�c} �i t�m l��ng th�o v� cho <color=yellow>Qu�n Nhu quan<color> ho�c <color=yellow>N�n d�n<color>. Giao <color=yellow>Huy�n thi�t kho�ng th�ch<color> cho {Qu�n Nhu quan} ho�c <color=yellow>S�n t�c th� l�nh<color>. Ph�n th��ng: <color=yellow>Binh k� v� Chi�n c�<color>, ��ng th�i �� h�o h�u v�i S�n t�c s� t�ng l�n. B�n �t �i�m h�o h�u s� b� <color=yellow>S�n t�c l�u la<color> t�n c�ng, kh�ng ��nh b�i ch�ng �i�m t�ch l�y s� <color=yellow>gi�m<color>! Trong th�i gian quy ��nh b�n n�o t�ch tr� l��ng th�c nhi�u h�n s� th�ng.");
end;

function battle_intro_technique_res_1()
	Talk(1,"battle_intro_technique","Nh�c nh�: \n1. Ph�i bi�t t�n d�ng ngu�n <color=yellow>l��ng th�o cao c�p<color>. \n2. S� d�ng binh k� gi�p ��ng ��i kh�ng b� ��i ph��ng ��nh b�i. \n3. <color=yellow>Chi�n c�<color> khi�n phe ��ch r�i v�o tr�ng th�i h�n lo�n, cho�ng. \n4. C�n t�ng �� h�o h�u � s�n t�c th� l�nh.");
end;

function battle_intro_technique_vill()
	Talk(1,"battle_intro_technique_vill_1","    Sau khi v�o chi�n tr��ng ��n g�p <color=yellow>Chi�n tr��ng h��ng ��o<color> nh�n nhi�m v�. H� th�ng ng�u nhi�n ch� ��nh m�i b�n 3 ng��i �i t�m npc. L�c n�y chi�n tr��ng s� xu�t hi�n c�c npc <color=yellow>B�ch S� Th�ng<color>, ��nh b�i ch�ng s� bi�t t�a �� npc. NPC nhi�m v� s� c�n c� s� ng��i hai b�n gi�t ���c B�ch S� Th�ng ��a ra ph�n �ng kh�c nhau. ��nh b�i NPC nhi�m v� h� th�ng b�t ��u l�i nhi�m v�, ��n khi b�n n�o ��t ���c 99 l�n xem nh� chi�n th�ng!");
end;

function battle_intro_technique_vill_1()
	Talk(1,"battle_intro_technique","Nh�c nh�: \n1. <color=yellow>��nh b�i k� ��ch kh�ng nh�n ���c �i�m t�ch l�y ho�c qu�n c�ng<color>. \n2. {Chi�n tr��ng ch� nam} �� xem tin t�c nhi�m v�. \n3. B� ��ch ph��ng ch�n c�a c� th� d�ng <color=yellow>K� m�n tr�n ph� (Ng� C�c)<color> di chuy�n ��n n�i kh�c. \n4. <color=yellow>H�n ch� di�t B�ch S� Th�ng b�n m�nh<color> �� nhanh ch�ng ho�n th�nh nhi�m v�!");
end;

function battle_intro_technique_empl()
	Talk(1,"battle_intro_technique","    B�n n�o chi�m gi� ph�o ��i l�u xem nh� chi�n th�ng! \n Nh�c nh�: \n1. C� th� d�ng <color=yellow>K� m�n tr�n ph� (Ng� C�c)<color> nhanh ch�ng ��n ph�o ��i. \n2. C� 3 ���ng l�n c� th� ��n ph�o ��i. \n3. Do ph�o ��i nhi�u n�m kh�ng tu s�a, kh�ng n�n ��ng g�n tr�nh t�n th�t.. \n4. B�o r��ng b�n ���ng c� th� gi�p ���c �t nhi�u cho ch�ng ta.");
end;

function battle_intro_technique_main()
	Talk(1,"battle_intro_technique_main_1","    K�t qu� 3 chi�n tr��ng nh� s� �nh h��ng tr�c ti�p ��n chi�n tr��ng l�n: Phe th�ng L��ng Th�o chi�n nh�n ���c nhi�u d��c ph�m, phe th�ng Th�n L�ng chi�n ���c th� d�n gi�p ��, phe th�ng Ph�o ��i chi�n ���c ��a �i�m t�t kh�ng ch� ph�o ��i (�o�t l�i ���c). Th� t� ��nh b�i <color=yellow>hi�u �y, �� th�ng<color> xu�t hi�n <color=yellow>ti�n phong<color>, ��nh b�i <color=yellow>ti�n phong, �� th�ng<color> xu�t hi�n <color=yellow>t��ng qu�n<color>, ��nh b�i <color=yellow>t��ng qu�n, ti�n phong<color> xu�t hi�n <color=yellow>nguy�n so�i<color>, gi�t ���c nguy�n so�i xem nh� chi�n th�ng n�u hai b�n ch�a gi�t ���c s� c�n c� �i�m t�ch l�y c�ng c�ng quy�t ��nh.");
end;

function battle_intro_technique_main_1()
	Talk(1,"battle_intro_technique","Nh�c nh�: \n1. <color=yellow>D�ng k� m�n tr�n ph� (Ng� C�c)<color> ��n m�t n�i n�o ��. \n2. M�t �i�m ghi nh� t� h�u doanh ��n ti�n doanh khi gi�nh quy�n chi�m gi� ph�o ��i. \n3. Gi�t th� d�n th� l�nh hay k� nh�n d� s� s� nh�n ���c b�t ng�. \n4. L�y �i�m t�ch l�y th�ng qua ��nh b�i n�n d�n. \n5. B� ��i ph��ng ��nh b�i hay ��nh b�i ��i ph��ng ��u c� c� h�i ��i kh�ng.");
end;


function battle_intro_award()
	Talk(1,"battle_intro_award_1","    K�t th�c tr�n ��nh ng��i ch�i ��n NPC nh�n th��ng m�i c� th� ti�p t�c b�o danh tr�n sau, ph�n th��ng: qu�n c�ng, �i�m t�ch l�y v� kinh nghi�m, ta c� th� mua qu�n c�ng ch��ng, ��i qu�n c�ng ch��ng ho�c huy ho�ng ch��ng � Ng� C�c �� t�ng b�i s� nh�t ��nh, h�n n�a qu�n h�m cao, ��ng c�p cao �i�m kinh nghi�m nh�n ���c s� nhi�u h�n. \nN�u ng��i ch�i ��t qu�n h�m t� �� th�ng tr� l�n c� th� ��n NPC mua trang b�.");
end;

function battle_intro_award_1()
	Talk(1,"battle_introduce","Nh�c nh�: \n1. S� ng��i ch�nh l�ch s� �nh h��ng ��n qu�n c�ng, �i�m t�ch l�y, kinh nghi�m, s� ng��i b�n n�o nhi�u h�n ph�n th��ng s� �t l�i, nhi�u nh�t h�n 6 l�n. \n2. ��i <color=yellow>d��c ph�m ��c bi�t<color> n�u kh�ng ghi chi�n tr��ng chuy�n d�ng c� th� <color=yellow>mang ra ngo�i s� d�ng<color> nh�n hi�u qu� ��c bi�t nh� <color=yellow>mi�n d�ch lo�n, cho�ng, v� ��ch...<color>! \n3. � h�u ph��ng c� th� ��i d��c ph�m chuy�n d�ng cho chi�n tr��ng.");
end;

function battle_intro_rank()
	Talk(1,"battle_intro_rank_1","    <color=yellow>21 gi� th� 7 h�ng tu�n<color> h� th�ng s� trao qu�n h�m cho ng��i ch�i online. ��n g�p NPC b�o danh nh�n qu�n h�m.")
end;

function battle_intro_rank_1()
	Talk(1,"battle_introduce","Nh�c nh�: \n1. Kh�ng c� qu�n h�m kh�ng th� kho�c trang b� chi�n tr��ng. \n2. Ng��i ch�i c� qu�n c�ng h�n <color=yellow>80000<color> m�i tu�n s� b� tr� <color=yellow>1/8<color>. \n3. Hi�u �y: 15000; �� th�ng: 50000; Ti�n phong: h�n 80000 v� ph�i <color=yellow>���c x�p h�ng t� 7-16<color>; T��ng qu�n: h�n 120000 v� ph�i <color=yellow>���c x�p h�ng t� 2-6<color>; Nguy�n so�i: h�n 250000 v� ph�i <color=yellow>���c x�p h�ng 1<color>. \n4. Ng��i ch�i mang qu�n h�m ti�n phong, t��ng qu�n hay nguy�n so�i khi b� gi�t s� b� tr� �i�m qu�n c�ng: Ti�n phong: 40; T��ng qu�n: 80; Nguy�n so�i: 150.");
end;

function village_info()
	if BT_GetData(PT_BATTLE_TYPE) == VILLAGE_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;	
		local nTargetNameSong = GetMissionS(MSTR_SONG_TARGETNAME);
		local nTargetNameLiao = GetMissionS(MSTR_LIAO_TARGETNAME);
		local _,nTargetSongPosX,nTargetSongPosY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_SONG));
		local _,nTargetLiaoPosX,nTargetLiaoPosY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_LIAO));
		Talk(1,"battle_info","�i�m t�ch l�y c� nh�n trong Chi�n tr��ng Th�n trang: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>Ti�n �� phe T�ng: <color=yellow>"..GetMissionV(MV_SONG_TASKSTEP).."<color> Ti�n �� phe Li�u: <color=yellow>"..GetMissionV(MV_LIAO_TASKSTEP).."<color><enter>S� l��ng B�ch S� Th�ng b� ch�nh phe m�nh ti�u di�t: <color=yellow>"..GetMissionV(MV_SONG_KILL_SONG+nCamp-1).."<color>S� l��ng B�ch S� Th�ng c�a phe ��ch b� phe m�nh di�t: <color=yellow>"..GetMissionV(MV_SONG_KILL_LIAO+nCamp-1).."<color>")
	else
		Talk(1,"battle_info"," hi�n kh�ng trong Chi�n tr��ng Th�n trang.");
	end;
end;

function resource_info()
	if BT_GetData(PT_BATTLE_TYPE) == RESOURCE_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;	
		Talk(1,"battle_info","�i�m t�ch l�y c� nh�n: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>S� l��ng th�o phe m�nh: <color=yellow>"..GetMissionV(MV_RESOURCE_SONG+nCamp-1).."<color>S� l��ng th�o phe ��ch: <color=yellow>"..GetMissionV(MV_RESOURCE_SONG+nEnemyCamp-1).."<color>");
	else
		Talk(1,"battle_info"," hi�n kh�ng trong Th�o C�c chi�n.");
	end;
end;

function emplacement_info()
	if BT_GetData(PT_BATTLE_TYPE) == EMPLACEMENT_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;
		local nOccupyTime = 0;
		local nOccupyTimeSong = 0;
		local nOccupyTimeLiao = 0;
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--���Ŀǰ��ռ������̨
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime;
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime;
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);	
		end;
		Talk(1,"battle_info","�i�m t�ch l�y c� nh�n trong chi�n tr��ng ph�o ��i: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>�i�m t�ch l�y phe m�nh: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1).."<color><enter>�i�m t�ch l�y phe ��ch: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nEnemyCamp-1).."<color><enter>Th�i gian phe T�ng chi�m l�nh ph�o ��i: <color=yellow>"..Get_Time_String(nOccupyTimeSong).."<color> Th�i gian phe Li�u chi�m l�nh ph�o ��i: <color=yellow>"..Get_Time_String(nOccupyTimeLiao).."<color>")
	else
		Talk(1,"battle_info"," hi�n kh�ng trong chi�n tr��ng ph�o ��i.");
	end;
end;

function main_info()
	local nCamp = BT_GetCamp();
	local nEnemyCamp = 3-nCamp;
	if BT_GetData(PT_BATTLE_TYPE) == MAINBATTLE_ID then
		Talk(1,"battle_info","�i�m t�ch l�y c� nh�n: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>�i�m t�ch l�y phe m�nh: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1).."<color><enter>�i�m t�ch l�y phe ��ch: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nEnemyCamp-1).."<color><enter>Hi�u �y phe ��ch: <color=yellow>"..(12-GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)).."<color> �� th�ng phe ��ch: <color=yellow>"..(6-GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)).."<color> Ti�n phong phe ��ch: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)).."<color> ��i t��ng phe ��ch: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)).."<color><enter>Hi�u �y phe m�nh: <color=yellow>"..(12-GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nCamp-1)).."<color> �� th�ng phe m�nh: <color=yellow>"..(6-GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nCamp-1)).."<color> Ti�n phong phe m�nh: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nCamp-1)).."<color> ��i t��ng phe m�nh: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nCamp-1)).."<color>")
	else
		Talk(1,"battle_info"," hi�n kh�ng trong Nh�n M�n Quan chi�n tr��ng ch�nh.");
	end;
end;


function total_info()
	local selTab = {
				"�i�m t�ch l�y/my_point_total",
				"Ho�t ��ng chi�n tr��ng/my_data_total",
				"tr� l�i/battle_info",
				"K�t th�c/nothing"
				}
	Say("B�n mu�n xem s� li�u n�o?",getn(selTab),selTab);
end;

function my_point_total()
	Talk(1,"total_info","T�ng �i�m t�ch l�y c� nh�n: <color=yellow>"..BT_GetData(PT_TOTALPOINT).."<color> C�ng tr�ng phe T�ng: <color=yellow>"..BT_GetData(PT_RANKPOINT).."<color> C�ng tr�ng phe Li�u: <color=yellow>"..(-BT_GetData(PT_RANKPOINT)).."<color> C�ng tr�ng phe T�ng cao nh�t: <color=yellow>"..BT_GetData(PT_MAX_RANKPOINT_SONG).."<color> C�ng tr�ng phe Li�u cao nh�t: <color=yellow>"..(-BT_GetData(PT_MAX_RANKPOINT_LIAO)).."<color><enter>�i�m t�ch l�y Th�n trang chi�n: <color=yellow>"..BT_GetData(PT_VILL_POINT).."<color> �i�m t�ch l�y T�i Nguy�n chi�n: <color=yellow>"..BT_GetData(PT_RESO_POINT).."<color> �i�m t�ch l�y Ph�o ��i chi�n: <color=yellow>"..BT_GetData(PT_EMPL_POINT).."<color> �i�m t�ch l�y Chi�n tr��ng ch�nh: <color=yellow>"..BT_GetData(PT_MAIN_POINT).."<color>")
end;

function my_data_total()
	Talk(1,"total_info","T�nh h�nh ��n ��u: <color=yellow>"..BT_GetData(PT_SINGLE_WIN).."<color> th�ng <color=yellow>"..BT_GetData(PT_SINGLE_DRAW).."<color> h�a <color=yellow>"..BT_GetData(PT_SINGLE_LOSE).."<color> thua, s� l�n vua ban th��ng: <color=yellow>"..BT_GetData(PT_EMPEROR_AWARD_COUNT).."<color> S� l�n ng�i sao chi�n ��a: <color=yellow>"..BT_GetData(PT_BATTLE_STAR_COUNT).."<color><enter>T��ng s� phe T�ng b� gi�t: <color=yellow>"..BT_GetData(PT_KILL_SONG_PLAYER).."<color> S� l�n b� phe T�ng gi�t: <color=yellow>"..BT_GetData(PT_KILL_BY_SONG).."<color><enter>T��ng s� phe Li�u b� gi�t: <color=yellow>"..BT_GetData(PT_KILL_LIAO_PLAYER).."<color> S� l�n b� phe Li�u gi�t: <color=yellow>"..BT_GetData(PT_KILL_BY_LIAO).."<color><enter>S� l�n t�m th�y th� l�nh: <color=yellow>"..BT_GetData(PT_FIND_HEADER).."<color> S� l�n giao n�p l��ng th�o: <color=yellow>"..BT_GetData(PT_HANDIN_RESOURCE).."<color> S� l�n �o�t ph�o ��i: <color=yellow>"..BT_GetData(PT_KILL_EMPLACEMENT).."<color><enter>S� l�n tham gia Th�n trang chi�n: <color=yellow>"..BT_GetData(PT_ATTEND_VILLAGE).."<color> S� l�n tham gia T�i Nguy�n chi�n: <color=yellow>"..BT_GetData(PT_ATTEND_RESOURCE).."<color> S� l�n tham gia Ph�o ��i chi�n: <color=yellow>"..BT_GetData(PT_ATTEND_EMPLACEMENT).."<color> S� l�n tham gia Chi�n tr��ng ch�nh: <color=yellow>"..BT_GetData(PT_ATTEND_MAIN).."<color><enter>S� l�n chi�n th�ng Th�n trang chi�n: <color=yellow>"..BT_GetData(PT_VILLAGE_WIN).."<color> S� l�n chi�n th�ng T�i Nguy�n chi�n: <color=yellow>"..BT_GetData(PT_RESOURCE_WIN).."<color> S� l�n chi�n th�ng Ph�o ��i chi�n: <color=yellow>"..BT_GetData(PT_EMPLACEMENT_WIN).."<color> S� l�n chi�n th�ng Chi�n tr��ng ch�nh: <color=yellow>"..BT_GetData(PT_MAIN_WIN).."<color>");
end;

function other_info()
	if BT_GetData(PT_BATTLE_TYPE) == 0 then
		Talk(1,"battle_info"," hi�n kh�ng trong chi�n tr��ng.");
		return 0;
	end;
	local selTab = {
				"Xem s� ng��i c�a c�c m�n ph�i trong chi�n tr��ng/see_faction_player_count",
				--"�鿴�Լ�����������/see_secret",
				"Quay l�i n�i dung tr��c./OnUse",
				"��ng/nothing",
				}
	Say("Xem tin t�c n�o?",getn(selTab),selTab);
end;

function see_faction_player_count()
	local sContent = "";
	for i=1,7 do
		sContent = sContent..tFaction[i]..": <color=yellow>"..BT_GetFactionPlayerCount(i).."<color> ng��i ";
		if mod(i,2) == 0 or i == 0 then
			sContent = sContent.."\n";
		end;
	end;
	Talk(1,"other_info",sContent);
end;

function see_secret()
	Talk(1,"other_info","H� s� ho�t ��ng hi�n t�i:"..BT_GetData(PTNC_ACTIVITY).." Tin t�c b�o danh:"..BT_GetData(PT_SIGN_UP).." Th�i gian b�o danh:"..BT_GetData(PT_BATTLE_DATE).."<enter>Hi�n � chi�n tr��ng:"..BT_GetData(PT_BATTLE_TYPE).." Tr�ng th�i chi�n tr��ng hi�n t�i:"..GetMissionV(MV_BATTLE_STATE).." T�ch l�y:"..BT_GetData(PTNC_BATTLEPOINT).."");
end;

function know_equip()
	local selTab = {
	    ". Xem thu�c t�nh trang b� �� th�ng /equip_info_dutong",
    	". Xem thu�c t�nh trang b� ti�n phong /equip_info_xianfeng",
    	". Xem thu�c t�nh trang b� T�ng t��ng qu�n/equip_info_jiangjun_song",
    	". Xem thu�c t�nh trang b� Li�u t��ng qu�n/equip_info_jiangjun_liao",
   	 	". Xem thu�c t�nh trang b� T�ng nguy�n so�i/equip_info_yuanshuai_song",
    	". Xem thu�c t�nh trang b� Li�u nguy�n so�i/equip_info_yuanshuai_liao",
		"Tr��c/OnUse",
		"��ng/nothing",
    	}
    Say("Ng��i mu�n xem thu�c t�nh trang b� n�o?",getn(selTab),selTab);
end;

function equip_info_dutong()
	Talk(1,"know_equip","T�ng/Li�u �� th�ng Chi�n kh�i: T�c �� thi tri�n 12%. Sinh l�c + 5%. T�t c� thu�c t�nh 6 \nT�ng/Li�u �� th�ng Chi�n b�o: N�i, ngo�i c�ng 8%. Sinh l�c + 5%  T�t c� thu�c t�nh 6 \nT�ng/Li�u �� th�ng Chi�n trang: T� l� gi�m n�a S�t th��ng 10%. Sinh l�c + 5% . T�t c� thu�c t�nh 6 \n Thu�c t�nh tr�n b� 1: �� b�n n�n, �o, qu�n 600 gi�y h�i 2 �i�m \nThu�c t�nh tr�n b� 2: M�i tr�ng th�i ph� x�c su�t tr�nh 10%");
end;

function equip_info_xianfeng()
	Talk(1,"know_equip","T�ng/Li�u ti�n Phong hi�u k�: Sinh l�c + 15%. N�i, ngo�i c�ng 5%  \nT�ng/Li�u Ti�n phong Hi�u ph�: Sinh l�c + 15%. T�ng 40 �i�m s�t th��ng \nThu�c t�nh tr�n b�: T�c �� di chuy�n + 15%");
end;

function equip_info_jiangjun_song()
	Talk(1,"know_equip","T�ng t��ng qu�n Chi�n kh�i: T�c �� thi tri�n 25%. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80\nT�ng t��ng qu�n Chi�n b�o: N�i, ngo�i c�ng 15%. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80\n T�ng t��ng qu�n Chi�n trang: Sinh l�c + 15%. N�i l�c + 15%. N�i, ngo�i ph�ng + 80\nT�ng t��ng qu�n l�nh b�i: X�c su�t xu�t chi�u 3%. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80 \nT�ng t��ng qu�n l�nh k�: 255 tr�nh lo�n, ng�, ng�. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80 \nT�ng t��ng qu�n l�nh ph�: 25% tr�nh ��nh, m�, k�ch. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80");
end;

function equip_info_jiangjun_liao()
	Talk(1,"know_equip","Li�u t��ng qu�n Chi�n kh�i: T�c �� thi tri�n 25%. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80\n Li�u t��ng qu�n Chi�n b�o: N�i ngo�i c�ng 15%. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80\n Li�u t��ng qu�n Chi�n trang: Sinh l�c + 15%. N�i l�c + 15%. N�i, ngo�i ph�ng + 80\n Li�u t��ng qu�n l�nh b�i: X�c su�t xu�t chi�u 3%. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80\n Li�u t��ng qu�n l�nh k�: 25% tr�nh ��nh, m�, k�ch. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80\n Li�u t��ng qu�n l�nh ph�: 25% tr�nh lo�n, ng�, ng�. Sinh l�c + 15%. N�i, ngo�i ph�ng + 80");
end;

function equip_info_yuanshuai_song()
	Talk(1,"know_equip","T�ng nguy�n so�i Chi�n kh�i: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng Sinh l�c ��ng ��i 20% \nT�ng nguy�n so�i Chi�n b�o: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng Sinh l�c ��ng ��i m�i n�a gi�y 1% \nT�ng nguy�n so�i chi�n trang: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120  T�ng N�i l�c ��ng ��i + 20% \nT�ng nguy�n so�i h� ph�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120  T�ng xu�t chi�u ��ng ��i +5% \nT�ng nguy�n so�i l�nh k�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. Gi�p ��ng ��i t�ng 50% tr�nh lo�n, ng�, ng� \n T�ng nguy�n so�i hi�u ph�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng n�i, ngo�i c�ng ��ng ��i+ 15% \nT�ng nguy�n so�i Hi�u k�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. Gi�p ��ng ��i t�ng 50% tr�nh ��nh, cho�ng, lui");
end;

function equip_info_yuanshuai_liao()
	Talk(1,"know_equip","Li�u nguy�n so�i Chi�n kh�i: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng Sinh l�c ��ng ��i + 20% \nLi�u nguy�n so�i Chi�n b�o: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. H�i ph�c sinh l�c ��ng ��i m�i n�a gi�y 1% \nLi�u nguy�n so�i Chi�n trang: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng N�i l�c ��ng ��i + 20% \nLi�u nguy�n so�i h� ph�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng n�i, ngo�i c�ng ��ng ��i + 15% \nLi�u nguy�n so�i L�nh k�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. Gi�p ��ng ��i t�ng 50% tr�nh ��nh, cho�ng, lui \nLi�u nguy�n so�i Hi�u ph�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. T�ng xu�t chi�u ��ng ��i + 5% \nLi�u nguy�n so�i Hi�u k�: Sinh l�c + 2000. N�i, ngo�i ph�ng + 120. Gi�p ��ng ��i t�ng 50% tr�nh lo�n, ng�, ng�");
end;









