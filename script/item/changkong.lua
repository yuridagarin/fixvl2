Include("\\script\\online\\zgc_public_fun.lua")
function OnUse(goods_index)
	Say("Xin ch�n <color=yellow>m�n ph�i<color> �ng v�i trang b� Tr��ng Kh�ng:",
		8,
		"Trang b� Tr��ng Kh�ng-Thi�u L�m/#chongk_att_route(1)",
		"Trang b� Tr��ng Kh�ng-V� �ang/#chongk_att_route(2)",
		"Trang b� Tr��ng Kh�ng-Nga My/#chongk_att_route(3)",
		"Trang b� Tr��ng Kh�ng-C�i Bang/#chongk_att_route(4)",
		"Trang b� Tr��ng Kh�ng-���ng M�n/#chongk_att_route(5)",
		"Trang b� Tr��ng Kh�ng-D��ng M�n/#chongk_att_route(6)",
		"Trang b� Tr��ng Kh�ng-Ng� ��c/#chongk_att_route(7)",
		"Kh�ng c�n/end_dialog"
	)	
end
function chongk_att_route(conf_diff)
	local way_name = {"Thi�u L�m","V� �ang","Nga My","C�i Bang","���ng M�n","D��ng M�n","Ng� ��c"}
	local body_dialog = {}
	if conf_diff ~= 1 and conf_diff ~= 3 then
		body_dialog[1] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-nam ti�u chu�n/#changk_add(1,"..conf_diff..")"
		body_dialog[2] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-nam kh�i ng�/#changk_add(2,"..conf_diff..")"
		body_dialog[3] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-Ki�u n�/#changk_add(4,"..conf_diff..")"
		body_dialog[4] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-n� g�i c�m/#changk_add(3,"..conf_diff..")"
		body_dialog[5] = "Ta mu�n ch�n l�i m�n ph�i/#OnUse(0)"
		body_dialog[6] = "�� ta suy ngh� l�i/end_dialog"
	elseif conf_diff == 1 then
		body_dialog[1] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-nam ti�u chu�n/#changk_add(1,"..conf_diff..")"
		body_dialog[2] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-nam kh�i ng�/#changk_add(2,"..conf_diff..")"
		body_dialog[3] = "Ta mu�n ch�n l�i m�n ph�i/#OnUse(0)"
		body_dialog[4] = "�� ta suy ngh� l�i/end_dialog"	
	elseif conf_diff == 3 then
		body_dialog[1] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-Ki�u n�/#changk_add(2,"..conf_diff..")"
		body_dialog[2] = "Mu�n"..way_name[conf_diff].."Trang b� Tr��ng Kh�ng-n� g�i c�m/#changk_add(1,"..conf_diff..")"
		body_dialog[3] = "Ta mu�n ch�n l�i m�n ph�i/#OnUse(0)"
		body_dialog[4] = "�� ta suy ngh� l�i/end_dialog"	
	end
	Say("M�n ph�i b�n ch�n l�: <color=yellow>"..way_name[conf_diff].."<color>, k� ��n l� <color=yellow>th� h�nh<color>:",
		getn(body_dialog),
		body_dialog
	)
end
function changk_add(body_diff,conf_diff)
	--�ж��Ƿ��г��հ�--
	if GetItemCount(2,0,596) == 0 then
		Talk(1,"end_dilog","Xin x�c nh�n tr�n ng��i c� Tr��ng Kh�ng bao!")
		return
	end
	if Zgc_pub_goods_add_chk(2,100) ~= 1 then
		return
	end
	if DelItem(2,0,596,1) ~= 1 then
		Talk(1,"end_dilog","Xin x�c nh�n tr�n ng��i c� Tr��ng Kh�ng bao!")
		return
	end
	--����--
	local changknog_att_table = {
		{{0,109,89,0,108,89},{0,109,90,0,108,90},},													--����		
		{{0,109,91,0,108,91},{0,109,92,0,108,92},{0,109,93,0,108,93},{0,109,94,0,108,94},}, 		--�䵱
		{{0,109,95,0,108,95},{0,109,96,0,108,96},},													--��ü
		{{0,109,97,0,108,97},{0,109,98,0,108,98},{0,109,99,0,108,99},{0,109,100,0,108,100},},		--ؤ��
		{{0,109,101,0,108,101},{0,109,102,0,108,102},{0,109,103,0,108,103},{0,109,104,0,108,104},},	--����
		{{0,109,117,0,108,113},{0,109,118,0,108,114},{0,109,119,0,108,115},{0,109,120,0,108,116},},	--����
		{{0,109,129,0,108,127},{0,109,130,0,108,128},{0,109,131,0,108,129},{0,109,132,0,108,130},},	--�嶾
	}
	local add_flag = 0 
	add_flag = AddItem(changknog_att_table[conf_diff][body_diff][1],changknog_att_table[conf_diff][body_diff][2],changknog_att_table[conf_diff][body_diff][3],1)
	if add_flag == 0 then
		WriteLog(GetName()..":��i Tr��ng Kh�ng chi�n gi�p:"..conf_diff..":"..body_diff..":Th�t b�i!")
	else
		Msg2Player("Ch�c m�ng b�n nh�n ���c Tr��ng Kh�ng chi�n gi�p.")
	end
	add_flag = AddItem(changknog_att_table[conf_diff][body_diff][4],changknog_att_table[conf_diff][body_diff][5],changknog_att_table[conf_diff][body_diff][6],1)
	if add_flag == 0 then
		WriteLog(GetName()..":��i Tr��ng Kh�ng chi�n kh�i:"..conf_diff..":"..body_diff..":Th�t b�i!")
	else
		Msg2Player("Ch�c m�ng b�n nh�n ���c Tr��ng Kh�ng chi�n kh�i.")
	end	
end