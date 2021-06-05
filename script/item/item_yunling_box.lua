--ǧ�����Ʒ�ű�
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
Include("\\script\\lib\\globalfunctions.lua")

t_item_para = 
{
	2,1,30494,"T� �o Thi�n Bi�n Ti�u",
}

function OnUse(nItemIndex)
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
		SendScript2Client('Open([[Collection]]);')
	else
		Say("T� �o Thi�n Bi�n Ti�u t�m ch�a m�", 1, "\nTa bi�t r�i/no")
	end
end

function no()
end

function NpcTalkMain()
	local tbSay = {}
	local szTitle = ""

	szTitle = format("Ta c� T� �o Thi�n Bi�n Ti�u d� d�ng mua v� l�u tr� ngo�i trang.")
	tinsert(tbSay, "Nh�n T� �o Thi�n Bi�n Ti�u/_npc_get_box")
	tinsert(tbSay, "T�m hi�u v� T� �o/_about")
	tinsert(tbSay, "Ra khi/no")

	Say(szTitle, getn(tbSay), tbSay)
end

function _about()
	local tbSay = {}
	local szTitle = "Thi�n Bi�n Ti�u l� T� �o s� d�ng <color=yellow>�i�m Th��ng Ti�u Y Ph��ng<color> �� nh�n ngo�i trang, ��ng th�i <color=yellow>U�n Linh<color>."
	szTitle = format("%s\n%s", szTitle, "Ngo�i trang: c�c h� c� th� th�ng qua t� �o n�y mua ngo�i trang m�i, ��ng th�i c� th� l�u tr� <color=yellow>3 m�n ngo�i trang v�nh vi�n<color> v�o trong (bao g�m hi�u �ng u�n linh)")
	szTitle = format("%s\n%s", szTitle, "U�n linh: khi c�c h� <color=yellow>mua ho�c l�y<color> ngo�i trang t� t� �o, c� th� ti�n h�nh <color=yellow>U�n Linh<color> l�n ngo�i trang. C�c d�ng ch�n u�n linh ���c l�u tr� t� <color=yellow>U�n Linh kh�c b�n<color>.")
	szTitle = format("%s\n%s", szTitle, "<color=red>Nh�ng ngo�i trang v�t ph�m t� T� �o Thi�n Bi�n Ti�u r�t ra ��u 30 ng�y kh�ng th� giao d�ch<color>")

	tinsert(tbSay, "tr� l�i/NpcTalkMain")
	tinsert(tbSay, "Ra khi/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _npc_get_box()
	get_qianbian_box(1)
end

function get_qianbian_box(bNotify)
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
    	--Talk(1,"",format("�����ռ䲻��"))
    	return
    end
	if GetItemCount(t_item_para[1],t_item_para[2],t_item_para[3]) <= 0 then
		AddItem(t_item_para[1],t_item_para[2],t_item_para[3],1,4)
		bt_SetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG, 1)
		--�Զ�ѧ��3����ʼ����
		if GetPlayerCollectionData(2,1) == 0 then
			SetPlayerCollectionData(2, 1, 1)
			SetPlayerCollectionData(2, 2, 1)
			SetPlayerCollectionData(2, 3, 1)
		end
		if bNotify==1 then
			Talk(1,"",format("C�c h� �� nh�n ���c %s.", t_item_para[4]))
		end
	else
		if bNotify==1 then
			Talk(1,"",format("C�c h� �� c� %s r�i.", t_item_para[4]))
		end
	end
end

function show_yunling_box_login_message()
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
    	if bt_GetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG) == 0 then
        	local tbSay = {}
        	local szTitle = ""
    
        	szTitle = format("C�c h� s� nh�n ���c <color=yellow>[T� �o Thi�n Bi�n Ti�u]<color>, trong �� c� th� th� v� mua c�c lo�i ngo�i trang xinh ��p. �i�m th��ng d�ng �� mua ngo�i trang c� th� ��i t� Ng� C�c. \nN�u c�c h� b�t c�n l�m m�t T� �o, v�n c� th� ��n t�m <color=yellow>L�u T� Anh t�i D��ng Ch�u<color> nh�n l�i.")
        	tinsert(tbSay, "Bi�t r�i!/_never_show_login_message")
    
        	Say(szTitle, getn(tbSay), tbSay)
    	end
	end
end

function _never_show_login_message()
	get_qianbian_box(0)
end