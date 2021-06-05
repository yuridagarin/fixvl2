--�������νű�

t_collect_consume = 
{
	[1] = {
		gold = 10,
		},
	[2] = {
		gold = 20,
		t_item = {
			{"Kh�c b�n",2, 1, 30373,2},
		},
	},
	[3] = {
		gold = 40,
		t_item = {
			{"Kh�c b�n",2, 1, 30373,4},
		},
	},
	[4] = {
		gold = 5,
		t_item = {
			{"Kh�c b�n",2, 1, 30373,10},
		},
	},
	[5] = {
		gold = 100,
		t_item = {
			{"Kh�c b�n",2, 1, 30373,20},
		},
	},
	[6] = {
		gold = 900,
		t_item = {
			{"Kh�c b�n",2, 1, 30373,40},
		},
	},
}

function OnUse(nItemIdx)
	OnUse_real(nItemIdx)
end

function OnUse_real(nItemIdx)
	local tbSay = {}
	local szTitle = ""
	szTitle = format("C�c h� c� th� u�n linh tr�c ti�p ��n ngo�i trang ho�c mang u�n linh l�m th�nh ph�i ph��ng l�u tr� trong T� �o Thi�n Bi�n Ti�u. \nPh�i ph��ng sau khi ���c l�u tr� trong T� �o Thi�n Bi�n Ti�u, m�i l�n r�t ngo�i trang t� t� �o ra s� d�ng ��u c� th� th�m u�n linh l�n ngo�i trang, v� c�ng ti�n l�i.")
	tinsert(tbSay, format("Ta mu�n g�n linh t�nh/_OpenForCiXiu"))
	tinsert(tbSay, format("Ta mu�n l�u tr�/#_Collect(%d)", nItemIdx))
	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OpenForCiXiu()
	SendScript2Client("Open([[CommonEnhanceItem]], 1);");
end

function _Collect(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if nCollectIndex < 0 then
		return
	end
	local nResult = GetPlayerCollectionData(2, nCollectIndex);
	if nResult == 1 then
		Talk(1,"","C�c h� �� c� u�n linh n�y r�i.");
		return 0;
	elseif nResult == -1 then
		return 0;
	end
	
	local tbSay = {}
	local szTitle = ""
	local nLevel = GetItemLevel(nItemIdx)
	szTitle = format("L�u tr� %s c�n ti�u hao <color=yellow>%s<color>, x�c ��nh mu�n l�u tr�?", GetItemName(nItemIdx), _get_consume_desc(nLevel))
	tinsert(tbSay, format("X�c ��nh/#_do_collect(%d)", nItemIdx))
	tinsert(tbSay, format("tr� l�i/#OnUse_real(%d)", nItemIdx))
	tinsert(tbSay, "T� b�/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_collect(nItemIdx)
	local nLevel = GetItemLevel(nItemIdx)
	if _check_consume(nLevel, 1, 1) ~= 1 then
		Talk(1,"","L�u tr� U�n Linh th�t b�i!");
		return
	end
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if DelItemByIndex(nItemIdx,-1) == 1 then
		
		SetPlayerCollectionData(2, nCollectIndex, 1);
		Talk(1,"","C�c h� �� l�u tr� U�n Linh n�y th�nh c�ng, t� nay v� sau khi r�t ngo�i trang t� <color=yellow>[T� �o Thi�n Bi�n Ti�u]<color> ��u c� th� ��nh k�m hi�u �ng u�n linh n�y.");
	end
end

--��ȡ������ϸ��������
--����szDesc
function _get_consume_desc(nLevel)
	local szDesc = ""
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			szDesc = format("V�ng %d", t.gold)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		local strTemp2 = format("%sx%d", t.t_item[i][1], t.t_item[i][5])
        		szDesc = format("%s, %s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "[kh�ng]"
	end
	return szDesc
end

--IB���������������
--0 ��ʾδ���
--1��ʾ�Ѵ��
function _check_consume(nLevel, bDelete, bNotify)
	if nLevel < 1 or nLevel > getn(t_collect_consume) then
		return 0
	end
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			if GetCash() < t.gold * 10000 then
				if 1 == bNotify then
					Msg2Player(format("V�ng kh�ng �� %d!", t.gold))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        			if 1 == bNotify then
        				Msg2Player(format("%sx%d kh�ng ��", ti[1], ti[5]))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --���ж����ͨ���ˣ�ִ��ɾ��
    		if t.gold then
            	Pay(t.gold*10000)
    		end
    		if t.t_item then
    			for i = 1, getn(t.t_item) do
                    local ti = t.t_item[i]
            		local nDelResult = DelItem(ti[2], ti[3], ti[4], ti[5])
            		if not nDelResult or nDelResult ~= 1  then
            			return 0
            		end
    			end
    		end
		end
	end
	return 1
end

function no()
end



