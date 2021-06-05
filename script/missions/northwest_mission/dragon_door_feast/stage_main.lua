--�ű����ƣ��������ؿ����߹�
--�ű����ܣ��������ؿ����߹����ű�������NPC�Ի������̡������ȵ�
--���ܲ߻��ˣ��¹���
--���ܿ����ˣ��峤
--���ܲ����ˣ����
--���ܿ���ʱ�䣺2007-12-19
--�����޸ļ�¼��
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\lib\\lingshi_head.lua");

--bossѪ����Ӧ����
Tb_boss_life_step = {0.9,0.7,0.5,0.3,0.1}
feast_npc_script_way = "\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"
--С������
feast_devil_num = 50
Tb_feast_npc_info = {
	{"L� Nguy�n Kh�nh","L� Nguy�n Kh�nh",1651,3149,feast_npc_script_way},
	{"Nh�t Ph�m ���ng T�n B�","Nh�t Ph�m ���ng T�n B�",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh�t Ph�m ���ng Th�ch Kh�ch","Nh�t Ph�m ���ng Th�ch Kh�ch",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh�t Ph�m ���ng Phi H�","Nh�t Ph�m ���ng Phi H�",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh�t Ph�m ���ng H� D�c","Nh�t Ph�m ���ng H� D�c",1633,3178,feast_npc_script_way,feast_devil_num},
	{"Nh�t Ph�m ���ng V� V�","Nh�t Ph�m ���ng V� V�",1633,3178,feast_npc_script_way,feast_devil_num},
	{"M�m c�","Y�n ti�c",1634,3180,feast_npc_script_way,120},
}
--npc˲���ƶ�λ��
Tb_npc_newpos = {
	{1657,3153},{1600,3153},{1601,3213},{1665,3212},
	{1682,3187},{1632,3134},{1632,3180},{1615,3170},
	{1654,3199},{1577,3191},{1633,3237},
}
Tb_npc_newpos_dialog = {
	"Nghe danh trung nguy�n K� M�n Thu�n Gi�p uy�n b�c tinh th�ng. Nay r�t may m�n ���c ti�p chi�u Ngh�ch K� M�n n�y!",
	"Xem khinh c�ng c�a v� l�m trung nguy�n c� b� k�p chi�u K� Qu� B� Ph�t c�a Ngh�ch K� M�n hay kh�ng?!",
	"C�c v� th�n th� b�t ph�m, c� th� ti�p chi�u Ngh�ch K� M�n Chi Thu�t c�a ta!",
}
--npc�Ի�
Tb_boss_step_dialog = {
	--��ʼ
	{	"<color=green>L� Nguy�n Kh�nh<color>: Hoan ngh�nh c�c v� quang l�m, h�m nay c�c h� c� � m�i kh�ch, bu�i y�n ti�c n�y nh�m th�t ch�t m�i th�m t�nh, m�i �n o�n xin h�y b� qua cho.",
		"<color=green>L� Nguy�n Kh�nh<color>: T�n l�ng v� D��c Nh�n ��ng binh bi�n, <color=green>Th�c B�t ho�ng<color> ph�n b�i, �� khi�n cho c�c h� tr� th�nh nh�n v�t ��u n�o d��i Thi�t Chu L�nh c�a b�n ���ng, h�m nay g�p m�t qu� nhi�n danh b�t h� truy�n.",
		"<color=green>L� Nguy�n Kh�nh<color>: C�c h� c� th� ti�u di�u t� t�i d��i Thi�t Chu L�nh, t�i h� sau khi nghe danh v�i v�ng ��n trung nguy�n, hy v�ng kh�ng b� c�ng l�n n�y. Gi� �� c� th� di�n ki�n anh h�ng, chi�u ��i s� s�i, mong ���c l��ng th�!",
		"<color=green>L� Nguy�n Kh�nh<color>: Th� h� c�a b�n ���ng ��u l� nh�ng t�n b�t t�i mong c�c h� ��ng c��i, �� l�u s� l� vi�c, l�n n�y t�i h� s� ��ch th�n gi�i quy�t, kh�ng c�n ph�i gi�i th�ch nhi�u, kh�ng ng�i ch�?",
	},
	--�±�
	{	
		{"<color=green>L� Nguy�n Kh�nh<color>: N�u kh�ng th�ng n�i nh�ng t�n nh�i nh�p c�a b�n ���ng, th� xem nh� kh�ng c�n chu�n b� l�n y�n ti�c n�y."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: Th�n th� b�t ph�m, c� th� ��i ph� ���c m�y t�n th� h� b�t t�i c�a t�i h�, qu� nhi�n th�t x�ng ��ng!"
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: Ch� c� m�y t�n th� h� b�t t�i m� c�ng kh�ng ��i ph� ���c, sao c� th� d� bu�i ti�c n�y?",
			"<color=green>L� Nguy�n Kh�nh<color>: Xem ra c�c h� v�n ch�a ph�i l� ��i th� c�a t�i h�, th�t ch�ng th� v� t� n�o."
		}
	},
	--�̿�
	{	
		{"<color=green>L� Nguy�n Kh�nh<color>: Ngay c� th�ch kh�ch c�a b�n ���ng m� kh�ng th�ng n�i, xem ra kh�ng c�n chu�n b� cho b�a ti�c n�y."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: Th�n th� b�t ph�m, t�i h� r�t k�nh ph�c nh�ng ng��i d�ng v�."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: D�a v�o th�n th� nh� th�, m� mu�n n�o lo�n b�n ���ng sao, �� t�i h� xem th� v�n may trung nguy�n ��n ��u.",
			"<color=green>L� Nguy�n Kh�nh<color>: Ch� l� m�y t�n th�ch kh�ch, m� ng��i c�ng �� l�ng t�ng, t�i h� th�t kh�ng hi�u b�n ���ng b�i � ch� n�o."
		}
	},
	--�ɻ�
	{	
		{"<color=green>L� Nguy�n Kh�nh<color>: M�c d� Phi H� c�a b�n ���ng th�c l�c phi ph�m, nh�ng nh�ng ng��i mu�n tham d� y�n ti�c th� ph�i th�ng n�, th�ng n� m�i c� th� b�n ��n vi�c d� ti�c."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: B�n ���ng nhi�u l�n th�t b�i � trung nguy�n, t�i h� nh� kh�ng l�m l� do cao th� trung nguy�n c�n tr�, qu� nhi�n kh�ng ngo�i d� �o�n, th�t s�ch th�t s�ch."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: L�n n�y trung nguy�n h�nh ��ng, t�nh to�n k� l��ng chu ��o, kh�ng ng� b� ng��i ph� ho�i, L� m� th�t b�i r�i.",
			"<color=green>L� Nguy�n Kh�nh<color>: C� ngh� r�ng nh�ng ng��i ��n ��y ��u l� cao th� v� l�m trung nguy�n, n�o ng� ch� c� v�i ng��i ��ch l�i phi h�, v� l�m trung nguy�n qu� th�t h� danh kh�ng �t."
		}
	},
	--����
	{	
		{"<color=green>L� Nguy�n Kh�nh<color>: M�c d� H� D�c c�a b�n ���ng th�c l�c phi ph�m, nh�ng nh�ng ng��i mu�n tham d� y�n ti�c th� ph�i th�ng ���c n�, th�ng n� m�i c� th� b�n ��n vi�c d� ti�c."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: V� l�m trung nguy�n qu� l� ��i th� c�a b�n ���ng, l�n sau h� ��n, ta quy�t to�n l�c ��i ph�, �� tr� th� cho c�c vong h�n �� m�t."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: Ng��i nh�n thi�p c�a L� m�, nh�t ��nh kh�ng ph�i l� ng��i t�m th��ng, sao gi� v�n ch�a ��n ��? V� l�m trung nguy�n ch� c� th� th�i sao.",
			"<color=green>L� Nguy�n Kh�nh<color>: V� l�m trung nguy�n v�n ch�a ��n ��, xem ra c�n ph�i g�i thi�p, m�i cao th� ��n d� ti�c, ch�t d��i tay c�a t�i h� l� m�t s� vinh h�nh."
		}
	},
	--������
	{	
		{"<color=green>L� Nguy�n Kh�nh<color>: V� v� m�i l� tinh anh c�a b�n ���ng, ch� c�n th�ng ���c ch�ng, t�i h� nh�t ��nh s� chu�n b� y�n ti�c th�nh so�n v� qu� h�u h�nh t� T�y H�."
	},
		{	"<color=green>L� Nguy�n Kh�nh<color>: K�  ho�ch c�a b�n ���ng m�c d� b� ng��i ph� h�ng, nh�ng v�n m�nh ��i T�ng kh�ng ph�i n�m trong tay ng��i."
		},
		{	"<color=green>L� Nguy�n Kh�nh<color>: C�c ng��i d�m ��n Long M�n y�n, xem ra c�ng �� gi�c ng� ���c, s� ch�n th�n � n�i n�y, n�n l�y l�m vinh h�nh.",
			"<color=green>L� Nguy�n Kh�nh<color>: B�n ���ng �� l�y l�i kh� ph�ch, l�y l�i nh�ng g� thu�c v� m�nh."
		}
	},
	--���ɵ���
	{	
		"<color=green>L� Nguy�n Kh�nh<color>: V� l�m trung nguy�n qu� nhi�n kh�ng l�m L� m� th�t v�ng, c� th� ��nh m�t tr�n th�t s�ng kho�i, th�t kh�ng u�ng ph�.",
		"<color=green>L� Nguy�n Kh�nh<color>: V� l�m trung nguy�n qu� nhi�n l� ��i th� c�a L� m�, b�n ���ng l�y l�i kh� ph�ch, qu� kh�ng l�m t�i h� th�t v�ng. M�t ng�y g�n ��y s� b�y ti�c chi�u ��i, r�t hoan ngh�nh."
	},
	--ʱ�����
	{
		"<color=green>L� Nguy�n Kh�nh<color>: H�m nay qu� nhi�n ���c di�n ki�n s� uy�n b�c tinh th�ng c�a v� c�ng trung nguy�n, hy v�ng l�n sau l�i ���c th� s�c c�ng c�c v� anh h�ng!",
	}
}
--npc����
Tb_boss_step_chat = {
	--��ʼ
	{	
			"Hoan ngh�nh c�c v� quang l�m! Y�n ti�c s� s�i, chi�u ��i kh�ng chu ��o, mong ���c l��ng th�!",
			"Trung nguy�n c� c� H�ng V� B� V��ng b�y H�ng M�n Y�n, c�c v� c�ng c� kh� kh�i d� ti�c c�a L�u Thi�n T�, tuy�t di�u tuy�t di�u!",
			"Trung nguy�n nh�n t�i v� s�, ch�ng tr�ch kh�p n�i c�a �i tr�ng tr�ng!",
	},
	--�±�
	{	{	"Y�n ti�c sao c� th� thi�u r��u, c�c h� xem th� l�n n�y xem c�c v� c� x�ng ��ng �� d� y�n ti�c hay kh�ng! ",
			"Ng��i ��u! B�y ti�c, chi�u ��i c�c v� kh�ch qu�.",
		},
		{	"Y�n ti�c �� ���c b�y, d�ng kh� c�a c�c v� th�t khi�n t�i h� k�nh ph�c, nay long h� t��ng ph�ng sao c� th� thi�u r��u ���c?"},
		{	"C�c v� t�i ngh� k�m c�i, sao c� th� d� ti�c?"},
	},
	--�̿�
	{	{	"C�ng Th�c B�t T� M� giao chi�n, th�t s�ng kho�i, mau mang r��u cho ta!",
			"Ng��i ��u! B�y ti�c, chi�u ��i c�c v� kh�ch qu�."
		},
		{	"V� l�m trung nguy�n danh b�t h� truy�n, cao th� v� s�, y�n ti�c h�m nay th�t kh�ng l�m t�i h� th�t v�ng!"},
		{	"Ch� l� v�i t�n th�ch kh�ch, khi�n m�i ng��i m�t h�ng, t�i h� th�t l�y l�m ti�c!"},
	},
	--�ɻ�
	{	{	"T�i h� ph�i ch�ng t� th�c l�c c�a m�nh, ti�p chi�u!",
			"Ng��i ��u! B�y r��u!"
		},
		{	"B�n ���ng l�n n�y ch�u thua trung nguy�n, qu� th�t th�c l�c kh�ng ��!"},
		{	"Xem ra b�n ���ng th�m b�i, l� do ng��i c�a b�n ���ng b�t t�i!"},
	},
	--����
	{	{	"M� t�u, th�ch h�p khi ch�n theo ng��i!",
			"Bay ��u! M�i r��u, ��ng tr�ch ta kh�ng n��ng tay"
		},
		{"V� l�m trung nguy�n qu� l� m�t ��i th�, th�t di�m ph�c!"},
		{"Ngay c� H� D�c c�ng kh�ng qua n�i, V� L�m Trung Nguy�n ch� c� th� th�i sao!"},
	},
	--������
	{	{	"�n o�n gi�a b�n ���ng v� trung nguy�n, h�y �� L� m� ta ra tay gi�i quy�t!",
			"Ng��i ��u! B�y r��u, ti�n c�c v� cao th� l�n ���ng!"
		},
		{"Trung nguy�n s�m mu�n g� c�ng thu�c v� T�y H�, v� l�m kh� tr�nh n�n tri�u ��nh!"},
		{"Kh�ng c�n gi�y ch�t n�a, m�ng ng��i �� ���c ��nh s�n r�i!"},
	},
	--���ɵ���
	{	"��t trung nguy�n n�y, L� m� ch� l� kh�ch, c� ch�t �t qu� m�n, mong c�c v� nh�n cho!",
		"L� v�t kh�ng ���c chu ��o c�c v� h�y nh�n cho! "
	},
	--ʱ�����
	{
		"H�m nay qu� th�t �� nh�n th�y r� s� th�m th�y uy�n b�c c�a v� c�ng trung nguy�n, hy v�ng l�n sau s� c� d�p l�nh gi�o!"
	}

}
--npc+buff
Tb_boss_life_buff = {
	{},
	{	
		{"state_move_speed_percent_add",50,64800,0,19801260},
	},
	{
		{"state_magic_parmor_per_add",50,64800,0,19801261},
		{"state_physical_parmor_per_add",50,64800,0,19801262},
	},
	{
		{"state_knockback_when_lose_hp",810,64800,0,19801263},
		{"state_paralysis_when_lose_hp",232,64800,0,19801264},
		{"state_p_attack_percent_add",30,64800,0,19801265},
		{"state_m_attack_percent_add",30,64800,0,19801266},
	},
	{
		{"state_interrupt_rate_add",10,64800,0,19801267},
		{"state_paralysis_attack",10,64800,0,19801268},
		{"state_sleep_attack",10,64800,0,19801269},
		{"state_attack_burst_dec_attack",650,64800,0,19801270},
		{"state_slow_attack",650,64800,0,19801271},
		{"state_shadow_burst", 2565,64800,0,19801272},
	},
	{
		{"state_knockback_attack",10,64800,0,19801273},
		{"state_knockdown_attack",10,64800,0,19801274},
		{"state_fetter_attack",10,64800,0,19801275},
		{"state_confusion_attack",10,64800,0,19801276},
		{"state_vertigo_attack",10,64800,0,19801277},
		{"state_shadow_run",2565,64800,0,19801278},
	}
}
--��ϯ����
feast_exp_prize_max ={
	{1000000,1000000,1000000,1500000,2500000,6000000},
	{2000000,500000,500000,800000,1000000,2000000},
	}
feast_exp_chg_prize_max = 	{500000,800000,800000,1000000,1500000,3000000}
Tb_add_mertiral = {
	{2,1,3330,"Nh�t Thi�m Y�u Ho�ng"},
	{2,1,3331,"Tam Di�u Long Hi"},
	{2,1,3332,"�� Nguy�t Th�n Sa"},
	{2,1,3333,"Ph�n Quang Th�n Sa"},
	{2,1,3334,"Tr�m Tinh Th�n Sa"},
	{2,1,3204," Ng� Th�i Lung T�y"},
	{2,1,3205,"Th�t Huy�n T� V�n"},
}
Tb_feast_mis_prirze = {
	{		--�շѽ���
		--�������-����ת�������-��ʯ�������ȼ����ޡ��ȼ����ޡ�������-������Ч����������1��{ID,����}��{����1������2}{����1������2}����
		{100000,120000,			{1,4,2},	{},									{}						},
		{250000,250000,			{1,4,2},	{},									{}						},
		{250000,250000,			{2,5,2},	{{50,100},{1,2},{1,1}},	{}						},
		{500000,300000,			{2,5,2},	{{50,100},{1,2},{2,2}},	{{50},{1},{3}}	},
		{750000,500000,			{3,6,2},	{{50,100},{1,2},{6,6}},	{{50},{1},{3}}	},
		{12500000,62500000,	{5,6,2},	{{10},{1},{7}},				{{100},{1},{3}}	},
	},
	{		--��ѽ���
		--�������-��ʯ�������ȼ����ޡ��ȼ����ޡ�������-������Ч����������1��{ID,����}��{����1������2}{����1������2}����
		{50000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{2,5,2},	{{50},{1},{1}},		{{25},{1},{3}	}},
		{250000,0,						{2,5,2},	{{10},{1},{2}},		{{25},{1},{3}	}},
		{500000,0,						{3,6,2},	{{5},{1},{6}},			{{25},{1},{3}	}},
		{5000000,0,					{5,6,2},	{{3},{1},{7}},			{{25},{1},{3}	}},
	},
}
--*******************�ؿ����߼�*********************
feast_boss_life_chk_start_sec = 3060
feast_boss_life_chk_end_sec = 60
Tb_feast_time_fun = {
	[feast_boss_life_chk_start_sec] = "chg_boss_2_fight()",
	[feast_boss_life_chk_end_sec] = "feast_fail()",
	[feast_boss_life_chk_end_sec - 1] = "feast_crt()",
	[0] = "feast_end()"
}
for i = 3600,3180,-1 do
	if mod(i,60) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
for i = 3179,3061,-1 do
	if mod(i,20) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
function OnTimer()
	--���߼�
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID) 
	SetMissionV(MS_TIMMER_LOOP_ID,(time_loop_num - 1))
	--ϵͳ��������
	if Tb_feast_time_fun[time_loop_num] ~= nil then
		dostring(Tb_feast_time_fun[time_loop_num])
	end
	--Ѫ�����ʱ��
	local mis_step = GetMissionV(Ms_feast_step)		--bossѪ������10%�Ժ���Ҫ���Ѫ��
	if mis_step < 6 and time_loop_num < feast_boss_life_chk_start_sec and time_loop_num > feast_boss_life_chk_end_sec  then
		feast_boss_life_chk()
	end
	--boss˲���ƶ�����
	if time_loop_num < 3000 and time_loop_num > 60 and mod(time_loop_num,60) == 0 and GetMissionV(Ms_feast_deputy_step) == 0 then
		boss_now_pos()
	end
	--�������׶�ִ��
	local denputy_loop_num =GetMissionV(MS_feast_timmer_deputy_loop_ID)
	if denputy_loop_num >= 0 then
		local denputy_step_id = GetMissionV(Ms_feast_deputy_step)
		if denputy_loop_num == 0 then
			if denputy_step_id == 1 then
				devil_kill_all_fail()
			else
				chg_boss_2_fight()
			end
		else
			SetMissionV(MS_feast_timmer_deputy_loop_ID,(denputy_loop_num-1))
		end
	end
end
--�ڶ���ѭ������ʼK npc
function chg_boss_2_fight()
	--�ȼ�����
	local mis_step = GetMissionV(Ms_feast_step)
	if mis_step == 1 then
		local player_num = GetMissionV(MS_PLAYER_NUM)
		if player_num <= 0 then
			CloseMission(FEAST_MS_ID)
			local map_id =  SubWorldIdx2ID(SubWorld)
			WriteLog("[Y�n ti�c Long M�n]c�a �i: 	"..map_id.."	C�a �i 	")
			return
		end
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th�i gian k�t th�c d� y�n c�n\",3000,0,1)")
	end
	--С������
	feast_devil_clear()
	--bossת��
	local boss_index = GetMissionV(MS_feast_boss_index)
	ChangeNpcToFight(boss_index)
	feast_boss_chat(boss_index)
	--NpcChat(boss_index,Tb_boss_step_chat[mis_step][1][random(1,getn(Tb_boss_step_chat[mis_step][1]))])
	--boss+buff
	if Tb_boss_life_buff[mis_step] ~= nil then
		local buff_num = getn(Tb_boss_life_buff[mis_step])
		if  buff_num~= 0 then
			for i = 1,buff_num do
				CastState2Npc(boss_index,Tb_boss_life_buff[mis_step][i][1],Tb_boss_life_buff[mis_step][i][2],Tb_boss_life_buff[mis_step][i][3],Tb_boss_life_buff[mis_step][i][4],Tb_boss_life_buff[mis_step][i][5])
			end
		end
	end
	--ϵͳ����
	SetMissionV(Ms_feast_forstep_time,GetTime())
	SetMissionV(Ms_feast_deputy_step,0)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
end
--Ѫ�����
function feast_boss_life_chk()
	local mis_step = GetMissionV(Ms_feast_step)
	local boss_index = GetMissionV(MS_feast_boss_index)
	local boss_life_max,boss_life_num = GetUnitCurStates(boss_index,1)
	if (boss_life_num/boss_life_max) < Tb_boss_life_step[mis_step] then
		chg_boss_2_dialog()
	end
end
--��������npc��ʼ�Ի�
function chg_boss_2_dialog()
	--ʱ���¼
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--�ؿ��ȼ�����
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	SetMissionV(Ms_feast_deputy_step,1)
	--npcת��
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	--��Ԫ�챻ɱ��֮ǰ��ҪˢС��
	if mis_step < 7 then	
		local map_id =  SubWorldIdx2ID(SubWorld)
		local devil_num,devil_index = CreateNpc(Tb_feast_npc_info[mis_step][1],Tb_feast_npc_info[mis_step][2],map_id,Tb_feast_npc_info[mis_step][3],Tb_feast_npc_info[mis_step][4],-1,Tb_feast_npc_info[mis_step][6],1,300)
		for i = 0,getn(devil_index) do
			SetNpcScript(devil_index[i],Tb_feast_npc_info[mis_step][5])
		end
		--С��������0
		SetMissionV(Ms_feast_devil_kill_num,0)
		--С������ִ��
		SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_devil_kill_loop_num)
		--ʱ���¼
		SetMissionV(Ms_feast_forstep_time,GetTime())
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th�i gian ��nh b�i h� v� c�n\","..feast_devil_kill_loop_num..",0,2)")
	end
end
--����-1����������ϯ����ȡ����
function devil_kill_all_suc()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--�ؿ��ȼ�����
	SetMissionV(Ms_feast_deputy_step,2)
	--��ϯ����
	feast_crt()
	--��ȡ����ʱ��30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--����Ϊ-1�򲻼���
	SetMissionV(Ms_feast_forstep_time,GetTime())
end
--����-2����С��δ��ɱ��
function devil_kill_all_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--�ؿ��ȼ�����
	SetMissionV(Ms_feast_deputy_step,3)
	--��ͣʱ��30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--����Ϊ-1�򲻼���
	--��һ�׶μ�����
	SetMissionV(Ms_feast_forstep_time,GetTime())
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th�i gian ti�p t�c t� v� c�n\","..feast_prize_get_num..",0,2)")
	feast_devil_clear()
end
--���岽���ؿ�ʧ��
function feast_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	--С�����
	feast_devil_clear()
	--תΪ�Ի�npc
	--���ùؿ�����
	local log_mission_step = GetMissionV(Ms_feast_step)
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--���ùؿ�״̬Ϊ�ȴ�����
	SetMissionV(MS_TIMMER_LOOP_ID,58)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th�i gian h�t y�n ti�c c�n\",60,0,1)")
	player_revive()
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[Y�n ti�c Long M�n]c�a �i: 	"..map_id.."	C�a �i 1 �ang ���c ��ng	"..log_mission_step.."	S� ng��i	"..GetMissionV(MS_PLAYER_NUM).."")
end
--�ؿ�����
function feast_end()
	CloseMission(FEAST_MS_ID)
end
--�������
function player_revive()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,nMapID)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 1 then
			RevivePlayer(0)
		end
	end 
end
--boss˲��
function boss_now_pos()
	local boss_index = GetMissionV(MS_feast_boss_index)
	local rand_seq = random(1,getn(Tb_npc_newpos))
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
	SetNpcPos(boss_index,Tb_npc_newpos[rand_seq][1],Tb_npc_newpos[rand_seq][2])
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
end
--*******************ϵͳ������***********************
--NPC�Ի���Ϣ
Tb_feast_npc_dialog = {
	{"L� Nguy�n Kh�nh","feast_boss_dialog"},
	{"Y�n ti�c Long M�n","feast_banquet_dialog"},
}
--�Ի�������
function main()
	local npc_index = GetTargetNpc()
	local npc_name = GetTargetNpcName()
	if tonumber(date("%w")) == 5 and npc_name == "Y�n ti�c Long M�n" then
		Talk(1,"","Y�n ti�c ch� ���c chi�u ��i v�o ng�y th� 7!")
		return
	end
	for i = 1,getn(Tb_feast_npc_dialog) do
		if npc_name == Tb_feast_npc_dialog[i][1] then
			dostring(Tb_feast_npc_dialog[i][2].."("..npc_index..")")
		end
	end	
end
--��Ԫ��Ի�
function feast_boss_dialog(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_dialog = {}
	--��һ���͵��߲���ֻ��һ�ζԻ�
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_dialog = Tb_boss_step_dialog[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_dialog = Tb_boss_step_dialog[stage_step][stage_deputy_step]
	end
	--�Ի���ʼ
	if random(1,5) == 3 then
		feast_boss_chat(npc_index)
	end
	Talk(1,"",npc_dialog[random(1,getn(npc_dialog))])
end
--NPC����
function feast_boss_chat(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_chat = {}
	--��һ���͵��߲���ֻ��һ�ζԻ�
	if stage_step == 0 then
		return
	end
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_chat = Tb_boss_step_chat[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_chat = Tb_boss_step_chat[stage_step][stage_deputy_step]
	end
	NpcChat(npc_index,npc_chat[random(1,getn(npc_chat))])
end
--��ϯ�Ի�
function feast_banquet_dialog(feast_index)
	Say("<color=green>L� Nguy�n Kh�nh<color>: Trung nguy�n qu� nhi�n cao th� v� s�, tr�n n�y th�t s�ng kho�i! R��u T�y H� n�ng n�n ng�y ng�t, r�t th�ch h�p c�c v� h�o ki�t, m�i d�ng! C�n m�t s� th� c�a T�y H�, c�c v� h�y nh�n l�y!",
	3,
	"Th��ng th�c r��u th�t/feast_restore",
	"Nh�n l�y ph�n th��ng./feast_get_prize",
	"R�i kh�i y�n ti�c/end_dialog"
	)
end
function feast_get_prize()
	local stage_step = (GetMissionV(Ms_feast_step) -1 )
	local prize_step = GetTask(TaskID_feast_prize_step) 
	if prize_step >= min(6,stage_step) then
		Talk(1,"","<color=green>Nh�c nh�<color>: M�i ph�n th��ng ch� nh�n 1 l�n!")
		return
	else
		stage_step = min(6,stage_step)
		SetTask(TaskID_feast_prize_step,stage_step)
		--��������
		--����
		local prize_T = 60/GetMissionV(Ms_feast_waste_sec_num)
		local exp_num = floor(min(feast_exp_prize_max[Sever_diff][stage_step],(Tb_feast_mis_prirze[Sever_diff][stage_step][1] * prize_T)))
		ModifyExp(exp_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_num.." �i�m kinh nghi�m!")
			--��������
		if Sever_diff == 1 then
			local exp_chg_num = min(GetGoldenExp(),floor((Tb_feast_mis_prirze[Sever_diff][stage_step][2] * prize_T)),feast_exp_chg_prize_max[stage_step])
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("Ch�c m�ng b�n �� ��i "..exp_chg_num.." �i�m s�c kh�e th�nh kinh nghi�m!")
			else
				Msg2Player("�i�m s�c kh�e c�a b�n l� 0, kh�ng th� ��i th�nh kinh nghi�m!")
			end
		end
		--��ʯ
		for i = 1,Tb_feast_mis_prirze[Sever_diff][stage_step][3][3] do
				local linshi_level = random(Tb_feast_mis_prirze[Sever_diff][stage_step][3][1],Tb_feast_mis_prirze[Sever_diff][stage_step][3][2])
				lspf_AddLingShiInBottle(linshi_level,1)
				Msg2Player("B�n nh�n ���c 1 vi�n c�p "..linshi_level.." Linh th�ch, �� cho v�o T� Linh ��nh!")
		end
			--��Ч����1
		local ran_num = 0
		for i = 4,5 do
			ran_num = random(1,100)
			if getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i]) ~= 0 then
				for j = 1,getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i][1]) do
					if ran_num <= Tb_feast_mis_prirze[Sever_diff][stage_step][i][1][j] then
						local mertiral_seq = Tb_feast_mis_prirze[Sever_diff][stage_step][i][3][j]
						local mertiral_num = Tb_feast_mis_prirze[Sever_diff][stage_step][i][2][j]
						local add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
						if add_flag == 1 then
							Msg2Player("Ch�c m�ng b�n nh�n ���c "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].."!")
						else
						WriteLog("C�a �i v�ng T�y B�c: �i 7, ng��i ch�i ["..GetName().."]t�ng th�m "..mertiral_num.."c�i"..Tb_add_mertiral[mertiral_seq][4].." th�t b�i, k� hi�u:"..add_flag)
						end
					end
				end
			end
		end
		--������Ϣ
		Msg2Player("B�n ph�t hi�n c� m�t s� v�t k� l� trong y�n ti�c ph�t s�ng l�p l�nh, c� th� l� b�o v�t T�y H� do L� Nguy�n Kh�nh mang ��n!")
	end
end
--���ȫ��
function feast_restore()
	RestoreAll()
	Msg2Player("Kh�ng bi�t lo�i r��u T�y H� n�y ���c n�u nh� th� n�o, n�m v�o mi�ng �� th�y m�i v� ��m ��, d� v� ng�y ng�t, b�n l�p t�c c�m th�y ��u �c s�ng su�t d� ch�u, th� l�c h�i ph�c r�t nhanh!")
end
--������ϯ
function feast_crt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local big_feast_index = CreateNpc("Long M�n ��i y�n ti�c","Y�n ti�c Long M�n",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4])
	SetNpcScript(big_feast_index,Tb_feast_npc_info[7][5])
	SetNpcLifeTime(big_feast_index,30)
	local feast_num,feast_index = CreateNpc("y�n ti�c Long M�n","Y�n ti�c Long M�n",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4],-1,20,2,Tb_feast_npc_info[7][6])
	for i = 0,getn(feast_index) do
		SetNpcScript(feast_index[i],Tb_feast_npc_info[7][5])
		SetNpcLifeTime(feast_index[i],30)
	end
	--��ʱ��ֹͣ
	Zgc_pub_mission_fun(FEAST_MS_ID,"StopTimeGuage(2)")
	--��һ�׶μ�����
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th�i gian nh�n th��ng c�n\","..feast_prize_get_num..",0,2)")
end
--npc������Ϣ
Tb_feast_npc_death = {
	{"L� Nguy�n Kh�nh","boss_death()"},
	{"Nh�t Ph�m ���ng T�n B�","devil_death(npc_index)"},
	{"Nh�t Ph�m ���ng Th�ch Kh�ch","devil_death(npc_index)"},
	{"Nh�t Ph�m ���ng Phi H�","devil_death(npc_index)"},
	{"Nh�t Ph�m ���ng H� D�c","devil_death(npc_index)"},
	{"Nh�t Ph�m ���ng V� V�","devil_death(npc_index)"},
}
--����������
function OnDeath(npc_index)
	for i = 1,getn(Tb_feast_npc_death) do
		if GetNpcName(npc_index) == Tb_feast_npc_death[i][1] then
			dostring(Tb_feast_npc_death[i][2])
			break
		end
	end
end
--��Ԫ������
function boss_death()
	--ʱ�����
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--תΪ�Ի�NPC
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	local map_id =  SubWorldIdx2ID(SubWorld)
	boss_index = CreateNpc(Tb_feast_npc_info[1][1],Tb_feast_npc_info[1][2],map_id,Tb_feast_npc_info[1][3],Tb_feast_npc_info[1][4])
	SetNpcScript(boss_index,Tb_feast_npc_info[1][5])
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	SetMissionV(MS_feast_boss_index,boss_index)
	--������ȡ
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	--��ɱ����(�ƺ�)
	if PlayerIndex ~= 0 and PlayerIndex ~= nil then
		AddTitle(60,8)
		SetCurTitle(60,8)
		SetTitleTime(60,8,(GetTime() +( 7 * 86400)))
		Zgc_pub_mission_fun(FEAST_MS_ID,"Msg2Player(\""..GetName().."  t�i y�n ti�c Long M�n, d�ng m�t chi�u hi�m h�c ��nh b�i Nh�t Ph�m ���ng L� Nguy�n Kh�nh, c�c anh h�ng tung ho�nh T�y V�c c�ng c�ng L� Nguy�n Kh�nh �� s�c, qu� th�c h�o kh� b�ng b�ng!\")")
		AddGlobalNews(GetName().."  t�i y�n ti�c Long M�n, d�ng m�t chi�u hi�m h�c ��nh b�i Nh�t Ph�m ���ng L� Nguy�n Kh�nh, ��t ���c danh hi�u 'Tung Ho�nh T�y H�', anh h�ng c�c ph�i c�ng c�ng L� Nguy�n Kh�nh �� s�c, qu� th�c h�o kh� b�ng b�ng!")
	end
	feast_devil_clear()
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--���ùؿ�״̬Ϊ�ȴ�����
	local log_time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	SetMissionV(MS_TIMMER_LOOP_ID,59)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Th�i gian h�t y�n ti�c c�n\",60,0,1)")
	if tonumber(date("%w")) == 5 then
		local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,map_id)
		for i = 1, getn(player) do
			PlayerIndex = player[i]
			if IsPlayerDeath() == 0 then
				ModifyExp(10000000)
				Msg2Player("Nh�n ���c 10000000 �i�m kinh nghi�m.")
				WriteLog("[Y�n ti�c Long M�n]c�a �i: 	"..map_id.."	C�a �i 	".."nh�n 10000000 �i�m kinh nghi�m")
			end
		end
	end
	player_revive()
	Zgc_pub_mission_fun(FEAST_MS_ID,"Task_finish()")
	--log��¼
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[Y�n ti�c Long M�n]c�a �i: 	"..map_id.."	Th�i gian qua �i c�a �i 2	"..Zgc_pub_time_sec_change((3060 - log_time_loop_num),1).."	S� ng��i	"..GetMissionV(MS_PLAYER_NUM).."")
end
--�������
function Task_finish()
	--�������
	if GetTask(Tb_stage7_sign_task_info[1]) == Tb_stage7_sign_task_info[2] then
		SetTask(Tb_stage7_sign_task_info[1],(Tb_stage7_sign_task_info[2]+1))
		Msg2Player("Cu�i c�ng �� ��nh b�i Nh�t Ph�m ���ng L� Nguy�n Kh�nh, mau quay v� h�i b�o Kh�u Chu�n � Bi�n Kinh.")
		TaskTip("Cu�i c�ng �� ��nh b�i Nh�t Ph�m ���ng L� Nguy�n Kh�nh, mau quay v� h�i b�o Kh�u Chu�n � Bi�n Kinh.")
	end
end
--С������
function devil_death(npc_index)
	local devil_killed_num = GetMissionV(Ms_feast_devil_kill_num)
	if devil_killed_num == (feast_devil_num - 1) then
		devil_kill_all_suc()
	else
		SetMissionV(Ms_feast_devil_kill_num,(devil_killed_num+1))
	end
	SetNpcLifeTime(npc_index,5)
end
--********************����������********************
--С��������
function feast_devil_clear()
	--����С��
	local mission_step = GetMissionV(Ms_feast_step)
	local map_id = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			if GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[1][2] and GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[7][2] then
				SetNpcLifeTime(npc_total_index[i],0)
			end
		end
	end
end
--ϵͳ�㲥����
function feast_broadcast()
	local start_remian_sec_num = (GetMissionV(MS_TIMMER_LOOP_ID)-3060)
	AddGlobalNews("Y�n ti�c Long M�n s� b�t ��u: M�i ng��i ch�i ��n Long M�n tr�n t�m Npc Ti�u Nh� ��ng k� qua �i. Th�i gian k�t th�c ��ng k� c�n "..Zgc_pub_time_sec_change((start_remian_sec_num-1),0).."K�t th�c!")
end
