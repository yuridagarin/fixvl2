
--�޸ģ�1���峤20070123�޸ı��ű������ӻ�ɽ�����������
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--==========================����������������=============================
	huashan_in_num_per_minit_max = 10				--ÿ���ӿɽ�������Ϊ10��
	huashan_in_minit_seq = 0
	huashan_in_num_per_minit = 0
--==============================���߼�����===============================
function fushen_main(npc_index)
	SetTaskTemp(164,npc_index)				--д�븣�������
	--���ϵȼ��ж�
	if spring_2007_date_chk() == 1 then
		local selTab = {
					"Ta mu�n nh�n h�p qu� n�m m�i./get_present",
					"Ta ph�i ��n Hoa S�n tham gia l� H�i Hoa S�n./goto_huashan",
					"S�p x�p th�i gian ho�t ��ng n�m m�i/time_plan",
					"T�m hi�u n�i dung ho�t ��ng n�m m�i/spring_info_choice",
					"Nh�n m�t quy�n Ch� nam ho�t ��ng xu�n/spr_book_add",
					"�a t� Ph�c Th�n!/nothing"
					}
		Say("Nh�n d�p n�m m�i ta c� ch�t qu� t�ng m�i ng��i, ch�c m�i ng��i n�m m�i vui v�!",getn(selTab),selTab)
	else
		Say("Xu�n �� v�, m�i ng��i h�n hoan ch�o ��n, kh�p m�i n�i th�t l� nh�n nh�p!",0)
	end
end

function get_present()
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang kh�ng ��!");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"))
	if Check_Date() == -1 then 	--���ڻ��û��ʼ
		Say("H�y an t�m, m�i ng��i ��u c� qu�!",0)
		return 0		
	end
	if Check_Date() == 1 then	--���ڻ����
		Say("T�t �� qua, h�p qu� n�m m�i �� b� ng��i ch�i l�y h�t r�i. Th�t �y n�y, n�m sau ta nh�t ��nh mang nhi�u qu� h�n!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Ng��i ch�a ��t ��n c�p 10, kh�ng th� nh�n h�p qu� n�m m�i!",0)
		return 0
	end
	if GetTask(TASK_GOT_PRESENT) ~= GetCurDate() then	--�µ�һ�죬����ȡ��������0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if GetTask(TASK_GOT_PRESENT) ~= 0 then	--��������Ѿ���ȡ����������
		Say("H�m nay ng��i �� nh�n qu�, ng�y mai quay l�i nh�!",0)
		return 0
	end
	local nHour = GetLocalTime()
	if GetGlbValue(GLB_PRESENT_NUM) == 0 then	--���﷢����
		local strSex = gf_GetPlayerSexName();
		Say("H�p qu� n�m m�i �� b� l�y h�t r�i,"..strSex.."Th�i gian ph�t qu�: <color=yellow>10, 14 v� 20 gi�<color>. S� l��ng qu� c� h�n, nh� ��n s�m nh�!",0)
		return 0
	end
	if AddItem(2,0,628,1) == 1 then
		WriteLog("[Ho�t ��ng m�a xu�n Ph�c Th�n]:"..GetName().."T�i"..g_sPlace.."Nh�n ���c qu� may m�n c�a Ph�c Th�n")
		SetTask(TASK_GOT_PRESENT,GetCurDate())
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 h�p qu� n�m m�i!")
		local present_left = GetGlbValue(GLB_PRESENT_NUM) - 1
		if present_left < 0 then
			SetGlbValue(GLB_PRESENT_NUM,0)
		end
		SetGlbValue(GLB_PRESENT_NUM,present_left)
		if present_left == 0 then	--û������ʣ���ˣ��췢������Ĺ����
			Msg2Global("Ho�t ��ng"..g_sPlace.."Th�t ��ng ti�c, Ph�c Th�n �� ph�t h�t qu�. L�n sau nh� ��n s�m nh�!")
			return 1
		end
		if mod(present_left,10) == 0 then	--ֻ����10��
			Msg2Global(g_sPlace.." c�n "..present_left.." ph�n qu� n�m m�i ��i ng��i ch�i ��n nh�n")
		end
	end
end

function know_detail()
	Say("T� ng�y 9 ��n ng�y 25 th�ng 2, m�i ng�y (<color=yellow>10 gi�, 14 gi� v� 20 gi�<color>) ��n ch� ta nh�n qu� may m�n!",0)
end
--==========================��ɽ�������==========================
--***************************���͵���ɽ***************************
function goto_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ch�a gia nh�p m�n ph�i kh�ng th� tham gia ho�t ��ng Hoa S�n C�nh K�!")
		return
	else
		local time_distance = 64800 - Zgc_pub_today_sec_num_rtn()
		if time_distance < 0 then
			local player_in_time_distance =  GetTime() - GetTask(991)
			if player_in_time_distance < 600 then
				Talk(1,"","V�o Hoa S�n c�ch nhau 10 ph�t, ng��i c�n"..Zgc_pub_time_sec_change((600-player_in_time_distance),0).." m�i c� th� v�o")
				return
			end
		else
			Talk(1,"","Ho�t ��ng Hoa S�n ch�a m�, xin ch�"..Zgc_pub_time_sec_change(time_distance,0).."_c� th� v�o!")
			return
		end
		local minit_seq_now = floor(GetTime()/60)
		if minit_seq_now < huashan_in_minit_seq or (huashan_in_minit_seq == minit_seq_now and huashan_in_num_per_minit > huashan_in_num_per_minit_max) then
			Talk(1,"","S� ng��i tham gia �� ��, xin ��i"..(((minit_seq_now+1)*60) - GetTime()).." gi�y!")
			return
		elseif huashan_in_minit_seq > minit_seq_now then
			huashan_in_num_per_minit = 0
		end
		huashan_in_minit_seq = minit_seq_now
		huashan_in_num_per_minit = huashan_in_num_per_minit + 1
		SetDeathPunish(0)
		Msg2Player("B�n �� ��i sang tr�ng th�i PK!")
		SetFightState(1)
		NewWorld(969,1633,3263)
	end	
end
--*************************��ɽ�����***************************
function huashan_fight_inf()
	
end
function nothing()

end
--************************�˵��******************************
function time_plan()

	local str_talk = "Cung h� ph�t t�i! Th�i gian ho�t ��ng t�n ni�n t� <color=yellow>09-02-2007<color> ��n <color=yellow>25-02<color>, c� th� nh� sau: \n 10:00: Ph�c Th�n ph�t h�ng bao \n 12:00: m�a l�n \n 14:00: Ph�c Th�n ph�t h�ng bao \n 16:00: M�a l�n \n 18:00: �o�t b�o r��ng \n 20h:00: Ph�c Th�n ph�t h�ng bao \n 22:00: M�a l�n"

	 Talk(1,"",str_talk)

end

function spring_info_choice()

	local selTab = {
			"Online t�ng qu�/#spring_info(1)",
			"Ph�c Th�n ph�t h�ng bao/#spring_info(2)",
			"M�a l�n/#spring_info(3)",
			"�o�t b�o r��ng/#spring_info(4)",
			"Heo v�ng �em ��n c�t t��ng/#spring_info(5)",
			"Ch�c t�t/#spring_info(6)",
			"N�m m�i m�c �� m�i./#spring_info(7)",
			"Ni�n th� l�m th� c��i/#spring_info(8)",
			"R�i kh�i/nothing"
			}
	
	Say("N�m m�i ��n r�i! M�i ng��i chu�n b� th�t nhi�u qu�, nh�p v�o t�n ho�t ��ng t��ng �ng �� xem chi ti�t.",getn(selTab),selTab);

end


function spring_info(nType)

local selTab = {
	{
	"    Ng��i ch�i c�p 10 tr� l�n, m�i ng�y c� th� ��n g�p L� Quan � Bi�n Kinh �� nh�n t�i Ti�u ph�c Kim Tr�. M�i ng�y ch� nh�n ���c 1 l�n.",
		},
	
	{
	"    Ng��i ch�i t� c�p 10 tr� l�n v�o l�c 10:00, 14:00, 20:00 ��n Ph�c Th�n �� nh�n Ti�u H�ng Bao. M�i ng�y Ph�c Th�n ch� ph�t 100 c�i, �u ti�n cho nh�ng ng��i ��n tr��c (m�i ng�y ch� nh�n ���c 1 l�n )",
		},
		
	{
	"    Ho�t ��ng m�a l�n s� xu�t hi�n b�n ngo�i � 3 th�nh th� ch�nh. Ng��i ch�i n�u ��nh b�i ���c Ni�n Th� s� g�i ���c 20 ti�u Ni�n Th� kh�c, nh�p v�o ti�u Ni�n Th� s� nh�n ���c ��i H�ng Bao. (Ch� d�nh cho ng��i ch�i c�p 10 tr� l�n)",
		},
		
	{
	"    M�i ng�y t� 18:00 tr�n ��nh Hoa S�n s� xu�t hi�n m�t b�o r��ng. Ng��i ch�i (�� gia nh�p m�n ph�i) ��n g�p Ph�c Th�n, s� ���c Ph�c Th�n ��a v�o Hoa S�n ho�c c� th� mua Hoa S�n Th�n ph�. Khi v�o Hoa S�n tr�n ��a, b�n s� t� ��ng chuy�n sang tr�ng th�i PK v� �� s�t. Trong th�i gian 10 ph�t b�n d�ng h�t kh� n�ng h� ��i ph��ng �� �o�t b�o r��ng.",
		},
		
	{
	"    Kim Tr� mang ��n may m�n: Trong ph�n th��ng ho�t ��ng t�n ni�n, may m�n b�n c�ng c� th� nh�n ���c Tr� b�o b�o. S� d�ng b�n s� g�i ���c m�t ch� heo xinh x�n v� m�t quy�n  B�o �i�n.",
		},
	
	{
	"    Ch�c t�t: Hai ng��i ch�i ��ng trong m�t ph�m vi nh�t ��nh. Ng��i c�p nh� cung k�nh ch�c t�t ng��i c�p cao th� s� nh�n ���c m�t trong 3 ph�n th��ng sau: �i�m s�c kh�e, �i�m kinh nghi�m ho�c t� 10 ��n 20 �i�m danh v�ng. Ph�n th��ng n�y ph� thu�c v�o ��ng c�p c�a 2 b�n. M�i ng�y ng��i ch�i c�p nh� c� th� ch�c t�t ng��i c�p cao t�i �a 3 l�n, nh�ng ng��i c�p cao th� kh�ng b� gi�i h�n b�i s� l�n ���c ch�c t�t. (Ho�t ��ng n�y ch� d�nh cho ng��i ch�i t� c�p 10 tr� l�n)",
		},
		
	{
	"    Khi m� qu� Kim Tr� ( Kim Tr� ti�u ph�c, Kim Tr� ti�u h�ng bao, Kim Tr� ��i h�ng bao), s� nh�n ���c ph�n th��ng trang ph�c Ngo�i trang t��ng �ng.",
		},
	{
	"    Khi m� qu� Kim Tr� (Kim Tr� ti�u ph�c, Kim Tr� ti�u h�ng bao, Kim Tr� ��i h�ng bao) s� c� c� may nh�n ���c ni�n th�. [Ch� �: ni�n th� ch� s� d�ng trong 1 ng�y ( k� t� khi ng�i l�n). H�t th�i gian ni�n th� s� bi�n m�t!]",
		},

	};

	Say("N�m m�i �� ��n, c� r�t nhi�u ho�t ��ng �� nh�n qu�. Nh�p chu�t v�o t�n ho�t ��ng �� xem chi ti�c! \n"..selTab[nType][1],2,	"tr� l�i/spring_info_choice",
	"R�i kh�i/nothing");

end
function spr_book_add()
	AddItem(2,0,614,1)
end
