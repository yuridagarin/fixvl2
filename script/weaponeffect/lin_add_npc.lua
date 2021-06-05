--�ű����ƣ�����NPC�Ի�
--�ű����ܣ��������NPC����
--���ܲ߻��ˣ���ǿ
--���ܿ����ˣ��峤
--���ܿ���ʱ�䣺2008-01-15
--�޸ļ�¼��
Include("\\script\\weaponeffect\\ling_add_main.lua")
Include("\\script\\weaponeffect\\yun_ling_add.lua")
Include("\\script\\lib\\globalfunctions.lua")
--���Ի�
function main()
	local tSel = {
--		"��Ҫ����������װ/yunling_main",
--		"���봦����������Ч�������/lin_main",
		"Ta mu�n n�ng c�p ngo�i trang U�n Linh/upgrade_clothes",
		"Ta mu�n �p Linh Ph�ch v�o v� kh� �ang s� d�ng (c�n 70 v�t ph�m Xu + 200 v�ng)/soul_upgrade",
		"Ta ch� gh� qua th�i/end_dialog",
	}
	Say(Npc_name.."H�m nay tr�i tr� l�, c� y�u kh� t�i ��i m�c t�y b�c, l� �� t� C�n L�n ph�i bi�t tr�m ma tr� y�u. B�n ��o g�n ��y nghi�n c�u ra c�ch g�n th�m linh t�nh l�n trang ph�c, th�m g�i Linh t�nh cho v� kh� �� tr� n�n m�nh m� h�n, ��i hi�p c� h�ng th� kh�ng?",
		getn(tSel), tSel)
end
--�����������Ч�����Ի�
function lin_main()
	if GetPlayerRoute() == 0 then
		Talk(1,"",Npc_name.."B�n ��o ch� d�y v� cho anh h�ng h�o ki�t <color=yellow>�� v�o l�u ph�i<color> c�c m�n ph�i v� l�m!")
		return
	end
	if Tb_route_point_info[GetPlayerRoute()] == nil then
		Talk(1,"",Npc_name.."B�n ��o ch� d�y v� cho anh h�ng h�o ki�t <color=yellow>�� v�o l�u ph�i<color> c�c m�n ph�i v� l�m!")
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	SetTaskTemp(Weapon_index_save_TasktempID,weapon_index)
	Say(Npc_name.."C�n L�n c� lo�i ��o thu�t, c� th� d�a v�o t� c�ch c�a thi�n h� h�o ki�t �� k�ch ho�t <color=yellow>Linh Ph�ch<color> c�a v� kh�, l�m v� kh� r�c r� �nh s�ng, th�m Linh t�nh cho <color=yellow>Linh Ph�ch<color> c� th� t�ng th�m uy l�c cho v� kh�. V� ��i hi�p n�y mu�n b�n ��o gi�p g� ��y?",
		6,
		"Ta mu�n k�ch ho�t Linh Ph�ch c�a v� kh� trong tay/soul_add",
		"Ta mu�n th�m Linh t�nh cho v� kh� trong tay/ability_add",
		"Xem t� li�u li�n quan Linh t�nh v� Linh Ph�ch/soul_info",
		"Ta mu�n th�o Linh Ph�ch cho v� kh� trong tay (Linh Ph�ch Linh t�nh ��u m�t)/soul_del",
		"Ta mu�n th�o Linh t�nh cho v� kh� trong tay (ch� m�t Linh t�nh)/ability_del",
		"Ta ch� gh� qua th�i/end_dilaog"
	)
end
--=========================����============================
--��������
function soul_add()
	local weapon_index = GetPlayerEquipIndex(2)
	--����װ���ж�
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H�y trang b� v� kh� tr��c r�i ��n t�m ta!")
		return
	end
	local weapon_nume = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	--�����;��ж�
	if AbradeItem(weapon_index,0) == 0 then
		Talk(1,"",Npc_name.."  "..weapon_nume.."�� h�t �� b�n, kh�ng th� k�ch ho�t <color=yellow>Linh Ph�ch<color>!")
		return
	end
	--�ж��Ƿ��Ѿ�����������
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name  ~= "" then
		Talk(1,"",Npc_name.."  "..weapon_nume.."�� c� <color=yellow>"..aptitude_name.."<color> Linh Ph�ch, th�o tr��c r�i h�y k�ch ho�t <color=yellow>Linh Ph�ch<color>!")
		return
	end
	--��ʼ������������
	SetTaskTemp(Aptitue_seq_save_1_TasktempID,0)
	SetTaskTemp(Aptitue_seq_save_10_TasktempID,0)
	SetTaskTemp(Break_sky_get_date_seq_TaskID,0)
	SetTaskTemp(Aptitue_cent_TasktempID,0)
	--��������ѡ��Ի�
	aptitude_sel(0,0)
end
--����ѡ��Ի�
function aptitude_sel(aptitue_count,page_seq)
	--���Ի���������
	local dia_main = Npc_name.."Ch� c� t� ch�t t��ng �ng m�i c� th� k�ch ho�t <color=yellow>Linh Ph�ch<color> t��ng �ng. Sau khi b�n ��o k�ch ho�t <color=yellow>Linh Ph�ch<color>, n�u mu�n g�i h�n ch� c�n nh�n 2 ch� <color=yellow>k�ch ho�t<color> tr�n ch�n dung v� kh� l� ���c. Ng��i c� t� ch�t n�o? Sau khi ch�n xong nh� b�o cho b�n ��o m�t ti�ng."
	if aptitue_count ~= 0 then
		dia_main = Npc_name.."Ta bi�t r�i"..Zgc_pub_sex_name().." b�n ��o �� ghi nh�,  "..Zgc_pub_sex_name().."V�n c�n t� ch�t kh�c sao? (T�ng linh l�c hi�n t�i l�: <color=red>"..GetTaskTemp(Aptitue_cent_TasktempID).."<color>)"
	end
	--ѡ������
	local dia_sel = {}
	local page_start,page_end = 0,0
	if page_seq == 0 then
		page_start = 1
		page_end = 6
	else
		page_start = 7
		page_end = getn(Tb_aptitude_info)
	end
	if page_seq ~= 0 then
		tinsert(dia_sel,"Trang tr��c/#aptitude_sel("..aptitue_count..",0)")
	end
	for i = page_start,page_end do
		tinsert(dia_sel,Tb_aptitude_info[i][1].."/#aptitude_chk("..aptitue_count..","..i..")")
	end
	if page_seq == 0 then
		tinsert(dia_sel,"Trang k�/#aptitude_sel("..aptitue_count..",1)")
	end
	tinsert(dia_sel,"Ta ch�n r�i, t� ch�t c�a ta c� nhi�u ��y th�i/#aptitude_dtm(0)")
	tinsert(dia_sel,"�� ta suy ngh� l�i/end_dilaog")
	--�Ի�չ��
	Say(dia_main,
		getn(dia_sel),
		dia_sel
	)
end
--�����ʸ���
function aptitude_chk(aptitue_count,aptitue_seq)
	--�Ƿ��Ѿ�ѡȡ��������
	local aptidue_sel_temp_taskid = Aptitue_seq_save_1_TasktempID
	local aptitue_save_seq = aptitue_seq
	if aptitue_seq >= 10 then
		aptidue_sel_temp_taskid = Aptitue_seq_save_10_TasktempID
		aptitue_save_seq = aptitue_seq + 1 - 10
	end
	local aptidue_saved = GetTaskTemp(aptidue_sel_temp_taskid)
	local aptidue_uped_chk = strfind(tostring(aptidue_saved),tostring(aptitue_save_seq))
	if aptidue_uped_chk ~= 0  and aptidue_uped_chk ~= nil then
		Talk(1,"#aptitude_sel("..aptitue_count..",0)",Npc_name.."�m�B�n ��o bi�t t� ch�t n�y c�a ng��i, c� t� ch�t kh�c sao?")
		return
	end
	--�����Ƿ����
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	--�������
	if dostring(Tb_aptitude_info[aptitue_seq][2]) ~=1  then
		Talk(1,"#aptitude_sel("..aptitue_count..",0)",Npc_name.."Ha ha, ��ng c� l�a b�n ��o, b�n ��o kh�ng th�y ng��i c� t� ch�t n�y. Ng��i xem c�n t� ch�t n�o kh�c c�n b�o cho b�n ��o kh�ng?")
		return
	end
	--���ݴ���ͻص�
	SetTaskTemp(aptidue_sel_temp_taskid,((aptidue_saved * 10) + aptitue_save_seq))
	aptitue_count =  (aptitue_count + Tb_aptitude_info[aptitue_seq][5])
	SetTaskTemp(Aptitue_cent_TasktempID,aptitue_count)
	aptitude_sel(aptitue_count,0)
end
--����ȷ�Ϻ���
num_per_page = 8
function aptitude_dtm(page_seq)
	--�Ƿ�ѡȡ������
	local aptitue_count = GetTaskTemp(Aptitue_cent_TasktempID)
	if aptitue_count == 0 or aptitue_count == nil then
		Talk(1,"#aptitude_sel(0,0)",Npc_name..Zgc_pub_sex_name().."V�n ch�a ch�n t� ch�t n�o?")
		return
	end
	--���ʷֽ�
	local magic_dia_sel = {}
	local aptitude_seled = ""
	local aptitude_seq = 0
	for i = Aptitue_seq_save_1_TasktempID,Aptitue_seq_save_10_TasktempID do
		aptitude_seled = tostring(GetTaskTemp(i))
		if tonumber(aptitude_seled) ~= 0 then
			for j = 1,strlen(aptitude_seled) do
				if i == Aptitue_seq_save_1_TasktempID then
					aptitude_seq = tonumber(strsub(aptitude_seled,j,j))
				else
					aptitude_seq = tonumber(strsub(aptitude_seled,j,j)) + 9
				end
				tinsert(magic_dia_sel,Tb_aptitude_info[aptitude_seq][3].."(Th�i h�n: "..Tb_aptitude_info[aptitude_seq][8].." ng�y)".."/#magic_add("..aptitude_seq..")")
			end
		end
	end
	tinsert(magic_dia_sel,"Ng��i xem t� ch�t ta c� th� k�ch ho�t Linh Ph�ch m�nh h�n kh�ng?/break_sky_chk")
	--�Ի���֯
	local dia_sel = {}
	local dia_sel_num = getn(magic_dia_sel)
	if page_seq ~= 0 then
		tinsert(dia_sel,"Trang tr��c/#aptitude_dtm("..(page_seq - 1)..")")
	end
	for i = (1+num_per_page * page_seq),min((num_per_page * (1 +page_seq)),dia_sel_num) do
		tinsert(dia_sel,magic_dia_sel[i])
	end
	--���뺳��
	if dia_sel_num == (num_per_page + 1) then
		tinsert(dia_sel,magic_dia_sel[dia_sel_num])
	elseif dia_sel_num > (num_per_page + 1 + (num_per_page * page_seq)) then
		tinsert(dia_sel,"Trang k�/#aptitude_dtm("..(page_seq + 1)..")")
	end
	tinsert(dia_sel,"�� ta suy ngh� l�i/end_dialog")
	--�Ի�չ��
	Say(Npc_name.."Kh�ng th� k�ch ho�t nhi�u <color=yellow>Linh Ph�ch<color> v�y, ng��i ch� c� th� k�ch ho�t 1 <color=yellow>Linh Ph�ch<color> cho 1 v� kh�. Ch� �: khi �� b�n v� kh� l� <color=yellow>0<color> ho�c <color=yellow>h�t h�n<color>, Linh Ph�ch s� b� m�t, ng��i c�n ��n ch� ta �� k�ch ho�t Linh Ph�ch l�i. Ng��i mu�n k�ch ho�t Linh Ph�ch n�o?",
	getn(dia_sel),
	dia_sel
	)
end
------------------------------��ͨ��Ч--------------------
--ȷ�϶Ի�
function magic_add(aptitude_seq)
	Say(Npc_name.."Linh Ph�ch ng��i mu�n k�ch ho�t l�: <color=yellow>"..Tb_aptitude_info[aptitude_seq][3].."<color>, c�n t� ch�t: "..Tb_aptitude_info[aptitude_seq][6].."; C�n ti�u hao: "..aptitude_cost_string_build(Tb_aptitude_info[aptitude_seq][4])..". Linh Ph�ch t�n t�i: <color=yellow>"..Tb_aptitude_info[aptitude_seq][8].."<color> ng�y. Ng��i c� th� nh�n ch� '<color=yellow>Linh'<color> tr�n ch�n dung v� kh� �� k�ch ho�t Linh Ph�ch. Ch� �: N�u t� ch�t kh�ng �� �i�u ki�n th� kh�ng th� k�ch ho�t, ch� khi �� m�i ���c. Ngo�i ra ph�i y�u th��ng Th�n binh c�a ng��i, m�t khi �� b�n l� 0, Linh Ph�ch s� bi�n m�t, ph�i ��n ch� ta k�ch ho�t l�i. Mu�n k�ch ho�t Linh Ph�ch n�y kh�ng?",
		3,
		"��ng �, ta �� nghe r� l�i khuy�n kh�ch c�a ng��i/#magic_add_dtm("..aptitude_seq..")",
		"Ta kh�ng c� v�t li�u c�ng mu�n k�ch ho�t H�o M�n Linh Ph�ch/use_money_consume",
		"Kh�ng, �� ta suy ngh� ��/end_dialog"
	)
end
--2208-5-20:������Ǯ���Ѻ��ŵĴ���
Tb_consume_money = {3000,4000}
function use_money_consume()
	--�����л����
	if weapon_cha_chk() ~= 1 then
		return
	end
	Say(Npc_name.."Kh�ng c� v�t li�u c�ng ���c, nh�ng chi ph� kh� cao. C�n ti�u hao <color=yellow>"..Tb_consume_money[Sever_diff].."<color> v�ng, ��ng � k�ch ho�t kh�ng?",
		2,
		"��ng �!/use_money_dtm",
		"Kh�ng, ta mu�n suy ngh�/end_dialog"
	)
end
--ȷ������
function use_money_dtm()
	--�����л����
	if weapon_cha_chk() ~= 1 then
		return
	end
	local aptitude_seq = getn(Tb_aptitude_info)
	--���ѻ����ж�
	if dostring(Tb_aptitude_info[aptitude_seq][2]) ~=1  then
		Talk(1,"end_dialog",Npc_name.."�i�m t�ch l�y ti�u d�ng kh�ng ��, kh�ng th� th�m hi�u �ng <color=yellow>H�o m�n<color>!")
		return
	end	
	--��ǮЯ���ж�
	if GetCash() < (Tb_consume_money[Sever_diff] * 10000) then
		Talk(1,"",Npc_name.."Ti�n v�ng kh�ng �� <color=yellow>"..Tb_consume_money[Sever_diff].."<color> v�ng, �� qu�n trong r��ng �?")
		return
	end
	--��Ǯɾ���ж�
	if Pay(Tb_consume_money[Sever_diff] * 10000) ~=  1 then
		Talk(1,"",Npc_name.."Ti�n v�ng kh�ng �� <color=yellow>"..Tb_consume_money[Sever_diff].."<color> v�ng, �� qu�n trong r��ng �?")
		return
	end
	--������Ч����
	SetTask(IB_cost_num,(GetTask(IB_cost_num) - Tb_aptitude_num[12][Sever_diff]))
	SetTask(Consume_get_sec_seq_TaskID,GetTime())
	if BindWeaponEffect(Tb_aptitude_info[aptitude_seq][7],(Tb_aptitude_info[aptitude_seq][8]*86400)) == 1 then
		--����ʱ�䴦��
		--SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Ch�c m�ng �� th�m hi�u �ng <color=yellow>"..Tb_aptitude_info[aptitude_seq][7].."<color> th�nh c�ng! � <color=yellow>g�c tr�i ch�n dung v� kh�<color>, nh�n n�t k�ch ho�t m�u �� l� c� th� k�ch ho�t <color=yellow>Linh Ph�ch<color>. Ph�m t�t k�ch ho�t <color=yellow>Linh Ph�ch<color> l�: <color=red>F<color>!")
		if Tb_aptitude_info[aptitude_seq][4] == 4 or Tb_aptitude_info[aptitude_seq][4] == 5 then
			AddGlobalNews("Tin giang h� m�i nh�t, "..GetName().."V�i b�n l�nh h�n ng��i, �� k�ch ho�t Linh Ph�ch: "..Tb_aptitude_info[aptitude_seq][7]..", kh�ng h� l� ��i hi�p v�n v� song to�n!")
		end
		return
	else
		WriteLog("Hi�u �ng v� kh�: Ng��i ch�i["..GetName().."]g�n th�m "..Tb_aptitude_info[aptitude_seq][7].."hi�u �ng th�t b�i!")
	end
end
--���Ӳ���
function magic_add_dtm(aptitude_seq)
	--�����л����
	if weapon_cha_chk() ~= 1 then
		return
	end
	--��ƷЯ�����
	if aptitude_cost_deal(1,Tb_aptitude_info[aptitude_seq][4]) ~= 1 then
		return
	end
	--��Ʒɾ�����
	if aptitude_cost_deal(2,Tb_aptitude_info[aptitude_seq][4]) ~= 1 then
		return
	end
	--���Ŵ���
	if aptitude_seq == getn(Tb_aptitude_info) then
		SetTask(IB_cost_num,(GetTask(IB_cost_num) - Tb_aptitude_num[12][Sever_diff]))
		SetTask(Consume_get_sec_seq_TaskID,GetTime())
	end
	--��Ч����
	if BindWeaponEffect(Tb_aptitude_info[aptitude_seq][7],(Tb_aptitude_info[aptitude_seq][8]*86400)) == 1 then
		--����ʱ�䴦��
		--SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Ch�c m�ng �� th�m hi�u �ng <color=yellow>"..Tb_aptitude_info[aptitude_seq][7].."<color> th�nh c�ng! � <color=yellow>g�c tr�i ch�n dung v� kh�<color>, nh�n n�t k�ch ho�t m�u �� l� c� th� k�ch ho�t <color=yellow>Linh Ph�ch<color>. Ph�m t�t k�ch ho�t <color=yellow>Linh Ph�ch<color> l�: <color=red>F<color>!")
		if Tb_aptitude_info[aptitude_seq][4] == 4 or Tb_aptitude_info[aptitude_seq][4] == 5 then
			AddGlobalNews("Tin giang h� m�i nh�t, "..GetName().."V�i b�n l�nh h�n ng��i, �� k�ch ho�t Linh Ph�ch: "..Tb_aptitude_info[aptitude_seq][7]..", kh�ng h� l� ��i hi�p v�n v� song to�n!")
		end
		return
	else
		WriteLog("Hi�u �ng v� kh�: Ng��i ch�i["..GetName().."]g�n th�m "..Tb_aptitude_info[aptitude_seq][7].."hi�u �ng th�t b�i!")
	end
end
------------------------------�������---------------------
--������
function break_sky_chk()
	--SetTaskTemp(Aptitue_cent_TasktempID,26)
	local aptitue_count = GetTaskTemp(Aptitue_cent_TasktempID)
	if aptitue_count >= 26 then
		Talk(1,"break_sky_dia",Npc_name.."T� ch�t c�a ng��i c� th� k�ch ho�t Linh Ph�ch <color=red>H�m Thi�n<color>! Linh Ph�ch n�y ph�t ra s�t, �nh s�ng kh�c th��ng. Hy v�ng ng��i c� th� ph�t huy s�c m�nh c�a n�!")
		return
	else
		Talk(1,"#aptitude_dtm(0)",Npc_name.."T� ch�t d��ng nh� kh�ng �� y�u c�u �� k�ch ho�t hi�u �ng H�m Thi�n, Linh Ph�ch n�y y�u c�u t� ch�t (tr�ng th�i v� trang b� tr�n ng��i hi�n t�i) �� cung c�p t�ng linh l�c c�a Linh Ph�ch ��t ho�c h�n <color=red>26<color>. Xin h�y luy�n t�p th�m!\nLinh l�c 1: <color=yellow>Thi�t C�t, L�c H�<color>\nLinh l�c 2: <color=yellow>B�ch Chi�n, Ch��c Nh�t, Tu�n D�t, ��o L�, Danh T�, L�ng Ti�u<color>\nLinh l�c 3: <color=yellow>Ph�n V�n, Tinh Di<color>\nLinh l�c 4: <color=yellow>C�i Th�<color>\nLinh l�c 6: <color=yellow>�o�n Giao<color>\nLinh l�c 7: <color=red>H�o M�n<color>\nLinh l�c 8: <color=red>Ph� Qu�n<color>")
		return
	end
end
--��������ȷ��
function break_sky_dia()
	Say(Npc_name.."Linh Ph�ch ng��i mu�n k�ch ho�t l�: <color=red>H�m Thi�n<color>; T� ch�t c�n l�: <color=red>Ch�a r�<color>; Ti�u hao c�n: "..aptitude_cost_string_build(5)..". Th�i gian Linh Ph�ch t�n t�i: <color=yellow>30<color> ng�y. Ng��i c� th� nh�n ch� 'Linh' tr�n ch�n dung v� khh� �� k�ch ho�t Linh Ph�ch. Ch� �: N�u t� ch�t kh�ng �� �i�u ki�n th� kh�ng th� k�ch ho�t, ch� khi �� m�i ���c. Ngo�i ra ph�i y�u th��ng Th�n binh c�a ng��i, m�t khi �� b�n l� 0, Linh Ph�ch s� bi�n m�t, ph�i ��n ch� ta k�ch ho�t l�i. Mu�n k�ch ho�t Linh Ph�ch n�y kh�ng?",
		2,
		"��ng �, ta �� nghe r� l�i khuy�n kh�ch c�a ng��i/break_sky_dtm",
		"Kh�ng, �� ta suy ngh� ��/end_dialog"
	)
end
--���촦��
function break_sky_dtm()
	--�����л����
	if weapon_cha_chk() ~= 1 then
		return
	end
	--��ƷЯ�����
	if aptitude_cost_deal(1,5) ~= 1 then
		return
	end
	--��Ʒɾ�����
	if aptitude_cost_deal(2,5) ~= 1 then
		return
	end
	--��Ч����
	if BindWeaponEffect("H�m Thi�n",(30*86400)) == 1 then
		--��������ʱ�䴦��
		SetTask(Break_sky_get_sec_seq_TaskID,GetTime())
		Talk(1,"",Npc_name.."Ch�c m�ng th�m hi�u �ng <color=red>H�m Thi�n<color> cho trang b� th�nh c�ng! � <color=yellow>g�c ph�i ch�n dung v� kh�<color>, nh�n n�t g�i h�n m�u �� l� c� th� k�ch ho�t <color=yellow>Linh Ph�ch<color>. Ph�m t�t k�ch ho�t <color=yellow>Linh Ph�ch<color> l�: <color=red>F<color>!")
		AddGlobalNews("Tin giang h� m�i nh�t, "..GetName().."V�i b�n l�nh h�n ng��i, �� k�ch ho�t Linh Ph�ch: H�m Thi�n, kh�ng h� l� ��i hi�p v�n v� song to�n!")
		return
	else
		WriteLog("Hi�u �ng v� kh�: Ng��i ch�i["..GetName().."] th�m hi�u �ng 'H�m Thi�n' th�t b�i!")
	end
end
--���ĶԻ�����
function aptitude_cost_string_build(aptitude_level)
	local string_rtn = "<color=yellow>Kh�ng ti�u hao g�<color>"
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] ~= 0 then
		string_rtn ="<color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][1].."<color> v�ng; "
	end
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  ~= 0 then
		string_rtn = string_rtn.."<color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][2].."<color> <color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][4].."<color>;"
	end
	return string_rtn
end
--����Я����ɾ�����
function aptitude_cost_deal(deal_flag,aptitude_level)
	--deal_flag��1ΪЯ����⣬2Ϊɾ�����
	local chk_flag = 1
	--��Ǯ
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] ~= 0 then
		if deal_flag == 1 then 
			if GetCash() < (Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] * 10000) then
				chk_flag = 0
			end
		else 
			if Pay(Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] * 10000) ~= 1 then
				chk_flag = 0
			end
		end
		if chk_flag == 0 then
			Talk(1,"",Npc_name.."Tr�n ng��i kh�ng �� <color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][1] .."<color> v�ng, �� qu�n trong r��ng �?")
			return 0
		end
	end
	--����
	if Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  ~= 0 then
		if deal_flag == 1 then 
			if GetItemCount(Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][1],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][2],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][3]) <  Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]  then
				chk_flag = 0
			end
		else
			if DelItem(Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][1],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][2],Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][3],Tb_aptitude_cost_info[Sever_diff][aptitude_level][2]) ~= 1 then
				chk_flag = 0
			end
		end
		if chk_flag == 0 then
			Talk(1,"",Npc_name.."Ng��i mang <color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][aptitude_level][3]][4].."<color> kh�ng �� <color=yellow>"..Tb_aptitude_cost_info[Sever_diff][aptitude_level][2] .."<color> c�i, �� qu�n trong r��ng �?")
			return 0
		end
	end
	return 1
end
--=========================������============================
function ability_add()
	--�ж��Ƿ��Ѿ���������
	if GetWeaponEffectAttributes() ~= 0 then
		Talk(1,"",Npc_name.."V� kh� hi�n t�i �� k�ch ho�t <color=yellow>Linh t�nh<color>, ch� khi <color=yellow>X�a b�<color> c�i c� tr��c b�n ��o m�i k�ch ho�t c�i m�i!")
		return 0
	end
	--�Ի�����
	Say(Npc_name.."Ng��i mu�n k�ch ho�t <color=yellow>Linh t�nh<color> g�? Nh�: N�u kh�ng th� k�ch ho�t <color=yellow>Linh Ph�ch<color>, <color=yellow>Linh t�nh<color> c�ng kh�ng th� ph�t huy t�c d�ng.",
	4,
		"Linh t�nh t�ng sinh l�c t�i �a/#add_ability_dia(1)",
		"Linh t�nh t�ng thu�c t�nh l�u ph�i/#add_ability_dia(3)",
		"Linh t�nh t�ng to�n thu�c t�nh/#add_ability_dia(2)",
		"Ta mu�n suy ngh� l�i"
	)
end
--���ѶԻ�
function add_ability_dia(ability_diff)
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	local aptitude_level = aptitude_level_rtn()
	if aptitude_level == 0 then
		return
	end
	if ability_diff == 1 then
		Say(Npc_name.."Linh t�nh mu�n k�ch ho�t l�: "..ability_cost_string_rtn(ability_diff).."Ch� �, n�u Linh Ph�ch m�t �i, Linh t�nh c�ng m�t �i! Tr��c khi k�ch ho�t Linh t�nh v� kh� hi�n t�i, nh� t�m hi�u th�ng tin Linh Ph�ch, mu�n k�ch ho�t kh�ng?",
		2,
		"Ta mu�n k�ch ho�t/#add_ability_dtm(1)",
		"�� ta suy ngh� l�i/end_dialog"
		)
	elseif ability_diff == 2 then
		Say(Npc_name.."Linh t�nh mu�n k�ch ho�t l�: "..ability_cost_string_rtn(ability_diff).."Ch� �, n�u Linh Ph�ch m�t �i, Linh t�nh c�ng m�t �i! Tr��c khi k�ch ho�t Linh t�nh v� kh� hi�n t�i, nh� t�m hi�u th�ng tin Linh Ph�ch, mu�n k�ch ho�t kh�ng?",
		2,
		"Ta mu�n k�ch ho�t/#add_ability_dtm(7)",
		"�� ta suy ngh� l�i/end_dialog"
		)
	else
		local player_route = GetPlayerRoute()
		Say(Npc_name.."Linh t�nh mu�n k�ch ho�t l�: "..ability_cost_string_rtn(ability_diff).."Ch� �, n�u Linh Ph�ch m�t �i, Linh t�nh c�ng m�t �i! Tr��c khi k�ch ho�t Linh t�nh v� kh� hi�n t�i, nh� t�m hi�u th�ng tin Linh Ph�ch, xin ch�n �i�m thu�c t�nh l�u ph�i mu�n k�ch ho�t.",
		3,
		"Ta mu�n t�ng"..Tb_point_name[Tb_route_point_info[player_route][1]].." �i�m/#add_ability_dtm("..Tb_route_point_info[player_route][1]..")",
		"Ta mu�n t�ng"..Tb_point_name[Tb_route_point_info[player_route][2]].." �i�m/#add_ability_dtm("..Tb_route_point_info[player_route][2]..")",
		"�� ta suy ngh� l�i/end_dialog"
		)
	end
end
--��������ȷ��
function add_ability_dtm(point_diff)
	--��������
	local aptitude_diff = 3
	if point_diff == 1 then
		aptitude_diff = 1
	elseif point_diff == 7 then
		aptitude_diff = 2
	end
	--���ܵȼ����
	local aptitude_level = aptitude_level_rtn()
	if aptitude_level == 0 then
		return
	elseif aptitude_level > 5 then
		aptitude_level = aptitude_level - 4
	end
	--����Я�����
	if ability_cost_deal(1,aptitude_diff) ~= 1 then
		return
	end
	--����ɾ�����
	if ability_cost_deal(2,aptitude_diff) ~= 1 then
		return
	end
	--��������
	if AddWeaponEffectAttribute(point_diff,aptitude_level) == 1 then
		Talk(1,"",Npc_name.."Ch�c m�ng k�ch ho�t Linh t�nh th�nh c�ng!")
		return
	else
		WriteLog("Hi�u �ng v� kh�: Ng��i ch�i["..GetName().."]g�n th�m "..aptitude_level.."C�p "..aptitude_diff.."T�ng Linh t�nh th�t b�i!")
	end
end
--���ǵȼ��ص�
function aptitude_level_rtn()
	--�Ƿ�Я��������
	local weapon_index = GetPlayerEquipIndex(2)
	if weapon_index == nil then
		Talk(1,"",Npc_name.."Hi�n kh�ng mang v� kh�, kh�ng th� th�m <color=yellow>Linh t�nh<color>!")
		return 0
	end
	--�����Ƿ��Ѿ���������
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"",Npc_name.."V� kh� c�n ph�i th�m <color=yellow>Linh Ph�ch<color> xong m�i c� th� th�m <color=yellow>Linh t�nh<color>, "..Zgc_pub_sex_name().."h�y �em v� kh� th�m <color=yellow>Linh Ph�ch<color> r�i quay l�i!")
		return 0
	end
	--�������⴦��
	if aptitude_name == "H�m Thi�n" then
		return 5
	end
	--�������ǵȼ�
	for i = 1,getn(Tb_aptitude_info) do
		if Tb_aptitude_info[i][7] == aptitude_name then
			return Tb_aptitude_info[i][4]
		end
	end
	Talk(1,"",Npc_name.."V� kh� c�n ph�i th�m <color=yellow>Linh Ph�ch<color> xong m�i c� th� th�m <color=yellow>Linh t�nh<color>, "..Zgc_pub_sex_name().."h�y �em v� kh� th�m <color=yellow>Linh Ph�ch<color> r�i quay l�i!")
	return 0
end
--������Ҫ�����ַ�������
function ability_cost_string_rtn(deal_diff)
	--deal_diff:1Ϊ����������2Ϊ���ӵ����ԣ�3Ϊ����ȫ����
	local aptitude_level = aptitude_level_rtn()
	local attribute_level_real = aptitude_level
	if attribute_level_real > 5 then
		attribute_level_real =  attribute_level_real - 4
	end
	local cost_string_rtn ="<color=yellow>"..Tb_lin_ability_info[deal_diff][1]..(Tb_lin_ability_info[deal_diff][2] + (Tb_lin_ability_info[deal_diff][3] * (attribute_level_real - 1))).."<color> �i�m, c�n ti�u hao: "
	cost_string_rtn = cost_string_rtn.."<color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> v�ng; "
	local mertiral_seq = 3
	if deal_diff == 2 then
		mertiral_seq = 5
	elseif deal_diff == 3 then
		mertiral_seq = 4
	end
	if Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level] ~= 0 then
		cost_string_rtn = cost_string_rtn.."<color=yellow>"..Tb_add_mertiral[mertiral_seq][4]..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>;"
	end
	return cost_string_rtn
end
--���ϼ��
function ability_cost_deal(deal_flag,deal_diff)
	--deal_flag:1ΪЯ����⣬2Ϊɾ�����
	--deal_diff:1Ϊ����������2Ϊ����ȫ���ԣ�3Ϊ���ӵ�����
	if weapon_cha_chk() ~= 1 then
		return 0
	end
	local mertiral_seq = 3
	if deal_diff == 2 then
		mertiral_seq = 5
	elseif deal_diff == 3 then
		mertiral_seq = 4
	end
	--���ǵȼ���ȡ
	local aptitude_level = aptitude_level_rtn()
	--����Я�����
	if deal_flag == 1 then
		if GetCash() < (Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff]*10000)  then
			Talk(1,"", Npc_name.."Ng��i mang <color=yellow>ti�n v�ng<color> kh�ng �� <color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> v�ng")
			return 0
		end
		if GetItemCount(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3]) < Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level] then
			Talk(1,"",Npc_name.."Ng��i mang <color=yellow>"..Tb_add_mertiral[mertiral_seq][4].."<color> kh�ng �� <color=yellow>"..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>.")
			return 0
		end
	else
		if Pay(Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff]*10000) ~= 1  then
			Talk(1,"", Npc_name.."Ng��i mang <color=yellow>ti�n v�ng<color> kh�ng �� <color=yellow>"..Tb_ability_cost_num[Sever_diff][aptitude_level][deal_diff].."<color> v�ng")
			return 0
		end
		if DelItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level]) ~= 1 then
			Talk(1,"",Npc_name.."Ng��i mang <color=yellow>"..Tb_add_mertiral[mertiral_seq][4].."<color> kh�ng �� <color=yellow>"..Tb_ability_magic_goods_cost_num[Sever_diff][mertiral_seq][aptitude_level].."<color>.")
			return 0
		end
	end
	return 1
end
--=====================����ɾ��==================
function soul_del()
	--�Ƿ�������
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"main",Npc_name.."��ng ��a v�i b�n ��o, ta kh�ng th� th�y ���c Linh Ph�ch tr�n v� kh� c�a ng��i.")
		return
	end
	--�������Ƿ�����
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."R��ng ch�a �� �� kh�a, m� kh�a tr��c r�i m�i ��n b�n ��o th��ng l��ng x�a b� Linh Ph�ch!")
		return
	end
	--�����Ƿ�����
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main",Npc_name.."<color=yellow>V� kh�<color> c�a b�n �� b� kh�a, m� kh�a tr��c r�i m�i ��n b�n ��o th��ng l��ng x�a b� Linh Ph�ch!")
		return
	end
	Say(Npc_name.."Mu�n x�a b� Linh Ph�ch <color=yellow>"..aptitude_name.."<color> kh�ng? N�u x�a Linh t�nh c�ng m�t theo! Ng��i c� th� suy ngh� k�!",
		2,
		"Ta suy ngh� r�i/soul_del_dtm",
		"Kh�ng, ta mu�n ngh� l�i/end_dialog"
	)
end
--�ٴ�ȷ��
function soul_del_dtm()
	Say(Npc_name.."��y l� chuy�n l�n, ��ng tr�ch b�n ��o n�i nhi�u. Ng��i �� h� quy�t t�m ch�a?",
	2,
	"Ta th�t mu�n x�a b�/soul_del_deal",
	"Kh�ng, ta ��i � r�i/end_dialog"
	)
end
--ɾ������
function soul_del_deal()
	--�����Ƿ����
	if weapon_cha_chk() ~= 1 then
		return
	end
	--�Ƿ�������
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name == nil or aptitude_name == "" then
		Talk(1,"main",Npc_name.."��ng ��a v�i b�n ��o, ta kh�ng th� th�y ���c <color=yellow>Linh Ph�ch<color> tr�n v� kh� c�a ng��i.")
		return
	end
	--�������Ƿ�����
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."R��ng ch�a �� �� kh�a, m� kh�a tr��c r�i m�i ��n b�n ��o th��ng l��ng x�a b� <color=yellow>Linh Ph�ch<color>!")
		return
	end
	--�����Ƿ�����
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main",Npc_name.."<color=yellow>V� kh�<color> c�a b�n �� b� kh�a, m� kh�a tr��c r�i m�i ��n b�n ��o th��ng l��ng x�a b� Linh Ph�ch!")
		return
	end
	--ɾ������
	UnbindWeaponEffect()
end
--==================����ɾ��=====================
function ability_del()
	local ability_num,tb_ability_id = GetWeaponEffectAttributes()
	if ability_num == 0 then
		Talk(1,"",Npc_name.."��ng ��a v�i b�n ��o, ta kh�ng th� th�y ���c <color=yellow>Linh t�nh<color> tr�n v� kh� c�a ng��i.")
		return
	end
--�������Ƿ�����
	if IsBoxLocking() == 1 then
		Talk(1,"main",Npc_name.."R��ng ch�a �� �� kh�a, m� kh�a tr��c r�i m�i ��n b�n ��o th��ng l��ng x�a b� <color=yellow>Linh t�nh<color>!")
		return
	end

	Say(Npc_name.."Mu�n x�a <color=yellow>Linh t�nh<color> tr�n v� kh� hi�n t�i kh�ng?",
	2,
	"Ta mu�n x�a/ability_del_dtm",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--ɾ��ȷ��
function ability_del_dtm()
	--�����Ƿ����
	if weapon_cha_chk() ~= 1 then
		return
	end
	local ability_num,tb_ability_id = GetWeaponEffectAttributes()
	for i = 1 ,getn(tb_ability_id)  do
		RemoveWeaponEffectAttribute(tb_ability_id[i].id)
		WriteLog("Linh t�nh k�m theo: Ng��i ch�i["..GetName().."]�� x�a "..tb_ability_id[i].id.."Linh Ph�ch!")
	end
	Msg2Player("B�n �� x�a th�nh c�ng Linh t�nh tr�n v� kh� hi�n t�i!")
end
--==================���Ǻ�������Ϣ===============
function soul_info()
	local tb_dia = {
		"L�m sao k�ch ho�t Linh Ph�ch v� Linh t�nh/Say1_4_1",
		"��ng c�p, m�u s�c, �i�u ki�n k�ch ho�t Linh Ph�ch/#Say1_4_2(1)",
		"V�t li�u c�n �� k�ch ho�t Linh Ph�ch/Say1_4_3",
		"Tr� s�, thu�c t�nh, ��ng c�p Linh t�nh/Say1_4_4",
		"V�t li�u c�n �� k�ch ho�t Linh t�nh/Say1_4_5",
		"Ta mu�n tra �i�m t�ch l�y ti�u d�ng c�a m�nh/Say_1_4_6",
		"Kh�ng t�m hi�u/main"
	}
	Say(Npc_name.."Ng��i mu�n t�m hi�u g�?",
		getn(tb_dia),
		tb_dia
	)
end
--�Ի�1-4-1
function Say1_4_1()
	Talk(1,"soul_info",Npc_name.."<color=yellow>Linh Ph�ch<color> l� 1 lo�i h�o quan c�a v� kh�, ch� khi t� ch�t ch� nh�n ��t ��n �i�u ki�n nh�t ��nh m�i c� th� k�ch ho�t. N�u sau khi k�ch ho�t t� ch�t kh�ng ��p �ng �� y�u c�u <color=yellow>Linh Ph�ch<color> n�a, s� kh�ng th� k�ch ho�t, ch� c� t� c�ch c� th� ��p �ng y�u c�u c�a <color=yellow>Linh Ph�ch<color> l�n n�a m�i c� th� k�ch ho�t. <color=yellow>Linh t�nh<color> v� <color=yellow>Linh Ph�ch<color> t��ng sinh, c�p <color=yellow>Linh t�nh<color> t��ng �ng c�p <color=yellow>Linh Ph�ch<color>. Ch� khi k�ch ho�t <color=yellow>Linh Ph�ch<color> th� <color=yellow>Linh t�nh<color> m�i c� t�c d�ng. <color=yellow>Linh Ph�ch<color> ch� c� th� duy tr� <color=red>30<color> ng�y, <color=yellow>Linh Ph�ch<color> m�t �i, <color=yellow>Linh t�nh<color> c�ng s� m�t �i. L�c �� t�m b�n ��o k�ch ho�t l�i. Ngo�i ra, khi �� b�n v� kh� l� <color=red>0<color>, Linh Ph�ch c�ng m�t �i.")
end
function Say1_4_2(att_seq)
	local attitude_string = Npc_name.."�i�u ki�n t��ng �ng Linh Ph�ch v� kh� kh�c nhau nh� sau:"
	local for_num_min = ((att_seq -1) * 5 +1)
	local for_num_max = min((for_num_min + 4),getn(Tb_aptitude_info))
	for i = for_num_min ,for_num_max do
		attitude_string =attitude_string.. "\n<color=yellow>"..Tb_aptitude_info[i][3].."<color>: Linh l�c "..Tb_aptitude_info[i][5].." �i�m, �i�u ki�n "..Tb_aptitude_info[i][6]..", th�i h�n "..Tb_aptitude_info[i][8].." ng�y."
	end
	if for_num_max == getn(Tb_aptitude_info) then
		attitude_string = attitude_string.."\n<color=red>H�m Thi�n, ch�m s�ng s�m s�t t�m lam (Linh Ph�ch c�p 5)<color>: Y�u c�u tr� cung c�p cho Linh Ph�ch ��t ��n ho�c v��t qua <color=red>26<color>, th�i h�n 30 ng�y!"
		Talk(1,"soul_info",attitude_string)
	else
		Talk(1,"#Say1_4_2("..(att_seq+1)..")",attitude_string)
	end
end
function Say1_4_3()
	local mertiral_needs_string = ""
	for i = 1,5 do
		mertiral_needs_string = mertiral_needs_string.."\n<color=yellow>"..i.."<color> c�p: "
		mertiral_needs_string = mertiral_needs_string ..Tb_aptitude_cost_info[Sever_diff][i][1].." Kim     "
		if Tb_aptitude_cost_info[Sever_diff][i][2] ~= 0 then
			mertiral_needs_string = mertiral_needs_string .."<color=yellow>"..Tb_add_mertiral[Tb_aptitude_cost_info[Sever_diff][i][3]][4].."<color><color=red>"..Tb_aptitude_cost_info[Sever_diff][i][2].."<color> c�i"
		end
	end
	Talk(1,"soul_info",Npc_name.."V�t li�u �� k�ch ho�t Linh Ph�ch nghe n�i ��u r�i v�o tay v�i cao th� T�y V�c, v�t qu� nh�t l� <color=red>Th�t Huy�n L�u V�n<color> r�i v�o tay <color=green>L� Nguy�n Kh�nh<color>, khi t�m ki�m th� c�n c�n th�n! S� l��ng nh� sau "..mertiral_needs_string)
end
function Say1_4_4()
	Talk(1,"soul_info",Npc_name.."Sau khi th�m <color=yellow>Linh t�nh<color> v�o v� kh�, thu�c t�nh t��ng �ng t�ng nh� sau\nT�ng <color=yellow>sinh l�c<color>: 500/1000/1500/2000/2500 �i�m\nT�ng <color=yellow>thu�c t�nh ��n<color>: 6/12/18/24/30 �i�m\nT�ng <color=yellow>to�n thu�c t�nh<color>: 3/6/9/12/15 �i�m")
end
function Say1_4_5()
	local talk_string =" \n<color=yellow>�� Nguy�t Th�n Sa<color>: �i T�y B�c, t�ng <color=yellow>sinh l�c t�i �a<color>, ti�u hao theo ��ng c�p "..Tb_ability_magic_goods_cost_num[Sever_diff][3][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][3][5]
	talk_string =talk_string.." \n<color=yellow>Ph�n Quang Th�n Sa<color>: ��i � m�t th�t s� m�n, t�ng <color=yellow>thu�c t�nh l�u ph�i<color>, ti�u hao theo ��ng c�p "..Tb_ability_magic_goods_cost_num[Sever_diff][4][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][4][5]
	talk_string =talk_string.." \n<color=yellow>Tr�m Tinh Th�n Sa<color>: ��i �i�m t�chl�y chi�n tr��ng, t�ng <color=yellow>to�n thu�c t�nh<color>, ti�u hao theo ��ng c�p "..Tb_ability_magic_goods_cost_num[Sever_diff][5][1].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][2].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][3].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][4].."/"..Tb_ability_magic_goods_cost_num[Sever_diff][5][5]
	Talk(1,"soul_info",Npc_name.."V�t li�u ��c bi�t c�n l�: "..talk_string)
end
--���ѻ��ֲ�ѯ
function Say_1_4_6()
	local consume_cent = GetTask(IB_cost_num)
	if consume_cent == nil then
		consume_cent = 0 
	end
	Talk(1,"",Npc_name.."�i�m t�ch l�y ti�u d�ng hi�n t�i l� <color=yellow>"..consume_cent.."<color>! Ch� c�n mua t�i Ng� C�c l� ���c t�ng!"..Tb_aptitude_info[getn(Tb_aptitude_info)][6] .."C� th� d�ng <color=yellow>"..Tb_aptitude_info[getn(Tb_aptitude_info)][8] .."<color> ng�y! <color=red>Ch� �: � Ng� C�c d�ng  "..Tb_ib_money[Sever_diff].." c� th� nh�n ���c 1 �i�m t�ch l�y.<color>")
end

tUpgradableClothes =
{
				{0,108,510},
				{0,109,510},
				{0,110,510},
				{0,108,511},
				{0,109,511},
				{0,110,511},
				{0,108,513},
				{0,109,513},
				{0,110,513},
				{0,108,512},
				{0,109,512},
				{0,110,512},	
				{0,108,207},
				{0,108,208},
				{0,108,209},
				{0,108,210},
				{0,108,211},
				{0,108,212},
				{0,108,213},
				{0,108,214},
				{0,108,215},
				{0,108,216},
				{0,108,217},
				{0,108,218},	
				{0,109,281},
				{0,109,282},
				{0,109,283},
				{0,109,284},
				{0,109,285},
				{0,109,286},
				{0,109,287},
				{0,109,288},
				{0,109,289},
				{0,109,290},
				{0,109,291},
				{0,109,292},
				{0,110,281},
				{0,110,282},
				{0,110,283},
				{0,110,284},
				{0,110,285},
				{0,110,286},
				{0,110,287},
				{0,110,288},
				{0,110,289},
				{0,110,290},
				{0,110,291},
				{0,110,292},	
				{0,108,199},
				{0,108,200},
				{0,108,201},
				{0,108,202},
				{0,109,277},
				{0,109,278},
				{0,109,279},
				{0,109,280},
				{0,110,89},
				{0,110,90},
				{0,110,91},
				{0,110,92},	
				{0,108,195},
				{0,108,196},
				{0,108,197},
				{0,108,198},
				{0,109,255},
				{0,109,256},
				{0,109,257},
				{0,109,258},
				{0,110,85},
				{0,110,86},
				{0,110,87},
				{0,110,88},
				{0,108,139},
				{0,109,185},
				{0,110,81},
				{0,108,140},
				{0,109,186},
				{0,110,82},
				{0,108,141},
				{0,109,187},
				{0,110,83},
				{0,108,142},
				{0,109,188},
				{0,110,84},
				{0,108,30001},
				{0,108,30002},
				{0,108,30003},
				{0,108,30004},
				{0,108,30005},
				{0,108,30006},
				{0,108,30007},
				{0,108,30008},
				{0,108,30009},
				{0,108,30010},
				{0,108,30011},
				{0,108,30012},
				{0,109,30001},
				{0,109,30002},
				{0,109,30003},
				{0,109,30004},
				{0,109,30005},
				{0,109,30006},
				{0,109,30007},
				{0,109,30008},
				{0,109,30009},
				{0,109,30010},
				{0,109,30011},
				{0,109,30012},
				{0,110,30001},
				{0,110,30002},
				{0,110,30003},
				{0,110,30004},
				{0,110,30005},
				{0,110,30006},
				{0,110,30007},
				{0,110,30008},
				{0,110,30009},
				{0,110,30010},
				{0,110,30011},
				{0,110,30012},
				{0, 108, 109},
				{0, 108, 110},
				{0, 108, 111},
				{0, 108, 112},
				{0, 109, 109},
				{0, 109, 110},
				{0, 109, 111},
				{0, 109, 112},
				{0, 110, 73},
				{0, 110, 74},
				{0, 110, 75},
				{0, 110, 76},
				{0, 108, 1},
				{0, 108, 2},
				{0, 108, 3},
				{0, 108, 4},
				{0, 108, 5},
				{0, 108, 6},
				{0, 108, 7},
				{0, 108, 8},
				{0, 108, 9},
				{0, 108, 10},
				{0, 108, 11},
				{0, 108, 12},
				{0, 108, 13},
				{0, 108, 14},
				{0, 108, 15},
				{0, 108, 16},
				{0, 108, 17},
				{0, 108, 18},
				{0, 108, 518},
				{0, 108, 522},
				{0, 108, 526},
				{0, 108, 19},
				{0, 108, 20},
				{0, 108, 21},
				{0, 108, 22},
				{0, 108, 23},
				{0, 108, 24},
				{0, 108, 25},
				{0, 108, 26},
				{0, 108, 27},
				{0, 108, 28},
				{0, 108, 29},
				{0, 108, 30},
				{0, 108, 31},
				{0, 108, 32},
				{0, 108, 33},
				{0, 108, 34},
				{0, 108, 35},
				{0, 108, 36},
				{0, 108, 519},
				{0, 108, 523},
				{0, 108, 527},
				{0, 108, 37},
				{0, 108, 38},
				{0, 108, 39},
				{0, 108, 40},
				{0, 108, 41},
				{0, 108, 42},
				{0, 108, 43},
				{0, 108, 44},
				{0, 108, 45},
				{0, 108, 46},
				{0, 108, 47},
				{0, 108, 48},
				{0, 108, 49},
				{0, 108, 50},
				{0, 108, 51},
				{0, 108, 52},
				{0, 108, 53},
				{0, 108, 54},
				{0, 108, 520},
				{0, 108, 524},
				{0, 108, 528},
				{0, 108, 55},
				{0, 108, 56},
				{0, 108, 57},
				{0, 108, 58},
				{0, 108, 59},
				{0, 108, 60},
				{0, 108, 61},
				{0, 108, 62},
				{0, 108, 63},
				{0, 108, 64},
				{0, 108, 65},
				{0, 108, 66},
				{0, 108, 67},
				{0, 108, 68},
				{0, 108, 69},
				{0, 108, 70},
				{0, 108, 71},
				{0, 108, 72},
				{0, 108, 521},
				{0, 108, 525},
				{0, 108, 529},
				{0, 109, 1},
				{0, 109, 2},
				{0, 109, 3},
				{0, 109, 4},
				{0, 109, 5},
				{0, 109, 6},
				{0, 109, 7},
				{0, 109, 8},
				{0, 109, 9},
				{0, 109, 10},
				{0, 109, 11},
				{0, 109, 12},
				{0, 109, 13},
				{0, 109, 14},
				{0, 109, 15},
				{0, 109, 16},
				{0, 109, 17},
				{0, 109, 18},
				{0, 109, 518},
				{0, 109, 522},
				{0, 109, 526},
				{0, 109, 19},
				{0, 109, 20},
				{0, 109, 21},
				{0, 109, 22},
				{0, 109, 23},
				{0, 109, 24},
				{0, 109, 25},
				{0, 109, 26},
				{0, 109, 27},
				{0, 109, 28},
				{0, 109, 29},
				{0, 109, 30},
				{0, 109, 31},
				{0, 109, 32},
				{0, 109, 33},
				{0, 109, 34},
				{0, 109, 35},
				{0, 109, 36},
				{0, 109, 519},
				{0, 109, 523},
				{0, 109, 527},
				{0, 109, 37},
				{0, 109, 38},
				{0, 109, 39},
				{0, 109, 40},
				{0, 109, 41},
				{0, 109, 42},
				{0, 109, 43},
				{0, 109, 44},
				{0, 109, 45},
				{0, 109, 46},
				{0, 109, 47},
				{0, 109, 48},
				{0, 109, 49},
				{0, 109, 50},
				{0, 109, 51},
				{0, 109, 52},
				{0, 109, 53},
				{0, 109, 54},
				{0, 109, 520},
				{0, 109, 524},
				{0, 109, 528},
				{0, 109, 55},
				{0, 109, 56},
				{0, 109, 57},
				{0, 109, 58},
				{0, 109, 59},
				{0, 109, 60},
				{0, 109, 61},
				{0, 109, 62},
				{0, 109, 63},
				{0, 109, 64},
				{0, 109, 65},
				{0, 109, 66},
				{0, 109, 67},
				{0, 109, 68},
				{0, 109, 69},
				{0, 109, 70},
				{0, 109, 71},
				{0, 109, 72},
				{0, 109, 521},
				{0, 109, 525},
				{0, 109, 529},
				{0, 110, 1},
				{0, 110, 2},
				{0, 110, 3},
				{0, 110, 4},
				{0, 110, 5},
				{0, 110, 6},
				{0, 110, 7},
				{0, 110, 8},
				{0, 110, 9},
				{0, 110, 10},
				{0, 110, 11},
				{0, 110, 12},
				{0, 110, 13},
				{0, 110, 14},
				{0, 110, 15},
				{0, 110, 16},
				{0, 110, 17},
				{0, 110, 18},
				{0, 110, 518},
				{0, 110, 522},
				{0, 110, 526},
				{0, 110, 19},
				{0, 110, 20},
				{0, 110, 21},
				{0, 110, 22},
				{0, 110, 23},
				{0, 110, 24},
				{0, 110, 25},
				{0, 110, 26},
				{0, 110, 27},
				{0, 110, 28},
				{0, 110, 29},
				{0, 110, 30},
				{0, 110, 31},
				{0, 110, 32},
				{0, 110, 33},
				{0, 110, 34},
				{0, 110, 35},
				{0, 110, 36},
				{0, 110, 519},
				{0, 110, 523},
				{0, 110, 527},
				{0, 110, 37},
				{0, 110, 38},
				{0, 110, 39},
				{0, 110, 40},
				{0, 110, 41},
				{0, 110, 42},
				{0, 110, 43},
				{0, 110, 44},
				{0, 110, 45},
				{0, 110, 46},
				{0, 110, 47},
				{0, 110, 48},
				{0, 110, 49},
				{0, 110, 50},
				{0, 110, 51},
				{0, 110, 52},
				{0, 110, 53},
				{0, 110, 54},
				{0, 110, 520},
				{0, 110, 524},
				{0, 110, 528},
				{0, 110, 55},
				{0, 110, 56},
				{0, 110, 57},
				{0, 110, 58},
				{0, 110, 59},
				{0, 110, 60},
				{0, 110, 61},
				{0, 110, 62},
				{0, 110, 63},
				{0, 110, 64},
				{0, 110, 65},
				{0, 110, 66},
				{0, 110, 67},
				{0, 110, 68},
				{0, 110, 69},
				{0, 110, 70},
				{0, 110, 71},
				{0, 110, 72},
				{0, 110, 521},
				{0, 110, 525},
				{0, 110, 529},				
}

tUpgradeClothCost =
{
	[1] = {3, 100, 1000000},
	[2] = {3, 150, 1000000},
	[3] = {3, 200, 1000000},
}

function upgrade_clothes()
	local tSay = {}
	tinsert(tSay, "Ta mu�n n�ng c�p M�o Ngo�i Trang/#upgrade_choose_1(6)")
	tinsert(tSay, "Ta mu�n n�ng c�p Th��ng Y Ngo�i Trang/#upgrade_choose_1(7)")
	tinsert(tSay, "Ta mu�n n�ng c�p H� Y Ngo�i Trang/#upgrade_choose_1(8)")
	tinsert(tSay, "�� ta suy ngh� l�i/end_dialog")
	
	Say(Npc_name.."C�c h� h�y ch�n lo�i ngo�i trang mu�n n�ng c�p:", getn(tSay), tSay)
end

function upgrade_choose_1(nCloth)
	local tSay = {}
	tinsert(tSay, format("Ta mu�n n�ng c�p S�c M�nh/#upgrade_choose_2(%d, 246)",nCloth))
	tinsert(tSay, format("Ta mu�n n�ng c�p N�i C�ng/#upgrade_choose_2(%d, 249)",nCloth))
	tinsert(tSay, format("Ta mu�n n�ng c�p G�n C�t/#upgrade_choose_2(%d, 245)",nCloth))
	tinsert(tSay, format("Ta mu�n n�ng c�p Th�n Ph�p/#upgrade_choose_2(%d, 247)",nCloth))
	tinsert(tSay, format("Ta mu�n n�ng c�p Linh Ho�t/#upgrade_choose_2(%d, 248)",nCloth))
	tinsert(tSay, "�� ta suy ngh� l�i/end_dialog")
	
	Say(Npc_name.."C�c h� mu�n n�ng c�p thu�c t�nh n�o:", getn(tSay), tSay)
end

function upgrade_choose_2(nCloth, nType1)
	local tSay = {}
	tinsert(tSay, format("C�p 1 - 5 �i�m (C�n 3 �� Nguy�t Th�n Sa, 100 �i�m s� m�n, 100 v�ng)/#confirm_upgrade_cloth(%d, %d, 1)",nCloth,nType1))
	tinsert(tSay, format("C�p 2 - 10 �i�m (C�n 3 �� Nguy�t Th�n Sa, 150 �i�m s� m�n, 100 v�ng)/#confirm_upgrade_cloth(%d, %d, 2)",nCloth,nType1))
	tinsert(tSay, format("C�p 3 - 15 �i�m (C�n 3 �� Nguy�t Th�n Sa, 200 �i�m s� m�n, 100 v�ng)/#confirm_upgrade_cloth(%d, %d, 3)",nCloth,nType1))
--	tinsert(tSay, format("C�p 4 - 20 �i�m (C�n 3 �� Nguy�t Th�n Sa, 250 �i�m s� m�n, 1 T� Kim H�ng Bao)/#confirm_upgrade_cloth(nCloth, nType1, 4)",nCloth,nType1))
	tinsert(tSay, "�� ta suy ngh� l�i/end_dialog")
	
	Say(Npc_name.."H�y ch�n lo�i n�ng c�p::", getn(tSay), tSay)
end

function confirm_upgrade_cloth(nCloth, nType1, nType2)
	local nG, nD, nP  = GetPlayerEquipInfo(nCloth)
	local cloth_index = GetPlayerEquipIndex(nCloth)

	if  cloth_index == 0 then
		Talk(1,"",Npc_name.."H�y trang b� ngo�i trang tr��c r�i ��n t�m ta!")
		return
	end
	
	local nCheck = 0
	for i = 1, getn(tUpgradableClothes) do
		if nG  == tUpgradableClothes[i][1] and nD == tUpgradableClothes[i][2] and nP == tUpgradableClothes[i][3] then
			nCheck = 1
			break
		end
	end
	if nCheck == 0 then
		Talk(1,"",Npc_name.."Ngo�i trang n�ng c�p kh�ng ph� h�p!")
		return
	end
	
	local cloth_name = GetItemName(cloth_index)
	if AbradeItem(cloth_index, 0) == 0 then
		Talk(1,"", Npc_name.."  "..cloth_name.." �� h�t �� b�n, kh�ng th� n�ng c�p!")
		return
	end

	if GetPlayerRoute() == 0 then
		Talk(1,"", Npc_name.."Ch�a gia nh�p h� ph�i kh�ng th� n�ng c�p ngo�i trang!")
		return
	end

	if GetTask(336) < 10000 then
		Talk(1,"",Npc_name.."Kh�ng �� �i�m s� m�n �� n�ng c�p!")
		return
	end
	
	if GetLevel() < 79 then
		Talk(1,"",Npc_name.."C�p 79 tr� l�n m�i c� th� n�ng c�p ngo�i trang!")
		return
	end
	
	if GetCash()  < tUpgradeClothCost[nType2][3] then
		Talk(1,"",Npc_name.."Kh�ng �� ng�n l��ng �� n�ng c�p!")
		return
	end
	
	if GetItemCount(2, 1, 3332) <  tUpgradeClothCost[nType2][1] then
		Talk(1,"", "Kh�ng �� �� Nguy�t Th�n Sa �� n�ng c�p")
		return
	end
	
	local nCustomExpire = 30 * 24 * 3600
	local nExpire = GetItemExpireTime(cloth_index)
	if nExpire <= 0 or nExpire == nil then
		nExpire = nCustomExpire
	end
	UnEquipAtPosition(nCloth)
	if DelItemByIndex(cloth_index, -1) == 1 and DelItem(2, 1, 3332,  tUpgradeClothCost[nType2][1]) == 1 then
		Pay(tUpgradeClothCost[nType2][3])
		SetTask(336, GetTask(336) - tUpgradeClothCost[nType2][2])
		gf_AddItemEx2({nG, nD, nP, 1, 1, nType2, nType1}, cloth_name, "Nang cap ngoai trang Uan Linh", "n�ng c�p ���c", nExpire)
	else
		Talk(1,"", Npc_name.."N�ng c�p th�t b�i!")
		return
	end	
end

function soul_upgrade()
	local tSay = {}
	
	tinsert(tSay, "Ta mu�n k�ch ho�t Danh T�c/#confirm_soul_upgrade(1)")
	tinsert(tSay, "Ta mu�n k�ch ho�t ��o L�/#confirm_soul_upgrade(2)")
	tinsert(tSay, "Ta mu�n k�ch ho�t Tu�n D�t/#confirm_soul_upgrade(3)")
	tinsert(tSay, "Ta mu�n k�ch ho�t Ch��c Nh�t/#confirm_soul_upgrade(4)")
	tinsert(tSay, "Ta mu�n k�ch ho�t B�ch Chi�n/#confirm_soul_upgrade(5)")
	tinsert(tSay, "�� ta suy ngh� l�i/end_dialog")
	
	Say(Npc_name.."Kh�ng th� k�ch ho�t nhi�u <color=yellow>Linh Ph�ch<color>, ng��i ch� c� th� k�ch ho�t 1 <color=yellow>Linh Ph�ch<color> cho 1 v� kh�. Ch� �: khi �� b�n v� kh� l� <color=yellow>0<color> ho�c <color=yellow>h�t h�n sau 7 ng�y<color>, Linh Ph�ch s� b� m�t, ng��i c�n ��n ch� ta �� k�ch ho�t Linh Ph�ch l�i. Ng��i mu�n k�ch ho�t Linh Ph�ch n�o?", getn(tSay), tSay)
end

function confirm_soul_upgrade(nType)
	if GetPlayerRoute() == 0 or GetLevel() < 73 or gf_Check55MaxSkill() == 0 then
		Talk(1,"", Npc_name.."��i hi�p c�n ph�i gia nh�p m�n ph�i, ��ng c�p 73 tr� l�n v� �� th�ng th�o v� c�ng c�p 55 m�i c� th� �p Linh Ph�ch cho v� kh�!")
		return
	end
	if GetItemCount(2,1,30230) < 70 or GetCash() < 2000000 then
		Talk(1,"", Npc_name.."��i hi�p c�n ph�i mang �� 70 v�t ph�m Xu v� 200 v�ng ��n m�i c� th� �p Linh Ph�ch cho v� kh�!")
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H�y trang b� v� kh� tr��c r�i ��n t�m ta!")
		return
	end
	local weapon_name = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	if AbradeItem(weapon_index, 0) == 0 then
		Talk(1,"",Npc_name.."  "..weapon_name.." �� h�t �� b�n, kh�ng th� k�ch ho�t <color=yellow>Linh Ph�ch<color>!")
		return
	end
	
	local tSoulType =
	{
		[1] = "Danh T�c",
		[2] = "��o L�",
		[3] = "Tu�n D�t",
		[4] = "Ch��c Nh�t",
		[5] = "B�ch Chi�n",
	}
	
	if DelItem(2,1,30230, 70) == 1 and Pay(2000000) == 1 then
		BindWeaponEffect(tSoulType[nType], 7 * 24 * 3600)
		Talk(1,"", Npc_name.."Ch�c m�ng ��i hi�p �� �p Linh Ph�ch th�nh c�ng cho "..weapon_name.."!")
	end
end