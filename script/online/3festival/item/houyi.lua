function OnUse(nItemIndex)
	--��̨ʹ������
	if GetTaskTemp(242) ~= 0 or GetTask(1151) ~= 0 or check_map() == 0 then
		Msg2Player("Trong l�i ��i kh�ng th� s� d�ng k� n�ng n�y");
		return 1;
	end
	--�����ؿ�ʹ������
	if nw_map_chk() == 1 then
		Msg2Player("�i T�y B�c kh�ng th� s� d�ng k� n�ng n�y!")
		return 1
	end
	local nPlace = GetItemPlace(nItemIndex);
	if nPlace == 1 then
		if DoFireworks(862,1) == 1 then
			SetItemUseLapse(nItemIndex,5*60*18);	--��ȴʱ�䣺5����
		end;
		return 1;
	end;
	return 0;
end;

function CanEquip()
	return 0;	--���ط�1��ʾ���Ҽ�װ��������1��ʾ����װ��
end

function OnEquip()
	return 0
end

function OnUnEquip()
	return 0
end

function check_map()
	local nMapID = GetWorldPos();
	if nMapID >= 839 and nMapID <= 842 or nMapID == 2010 or nMapID == 1010 or nMapID == 961 or nMapID == 962 or nMapID == 963 then
		return 0;
	else
		return 1;
	end;
end;
--�����ؿ���ͼ����
function nw_map_chk()
	local map_id = GetWorldPos()
	for i = 1,5 do
		for j = 0,6 do
			if map_id == (1000+ (i*100) +j) then
				return 1
			end
		end
	end
	return 0
end
