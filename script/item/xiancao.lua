
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ɲ�¶ʹ���ļ�
-- Edited by peres
-- 2005/08/16 AM 11:20

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

--add by lizhi
-- ǰ3������Ʒ���,��4λ��ʱ��,��5λ���ٶ� / 100 = ���ٱ�

-- ע�⣬��ʼ�������ƶ��� \script\global\autoexec.lua �У�
tItemInfo =
{
	{2, 1, 1012, 7200, 150, "B�ng Lai Ti�n Th�y",1},
	{2, 0, 109, 7200, 200, "B�ng Lai Ti�n L�",1.5},
	{2, 1, 1013, 7200, 300, "B�ng Lai Ti�n ��n",2},
	{2, 1, 1052, 7200, 120, "B�ng Lai L� Th�y",0},
}

keepsake_date_TaskID = 1241
keepsake_num_TaskID = 1227		--2007���磬��������������
--2007��Ϧ�������
TASK_FLOWER_GROW = 2391; --��¼���ĳɳ���
TASK_TOTAL_TIME = 2394; --�����ۻ�����ʱ��
TASK_IS_PLANT = 2396; --�Ƿ����������صĻ�
TASK_IS_GROW = 2397; --����ɳ����Ƿ��Ѿ��ӹ�������day

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			TestEat(index)
			break
		end
	end
end

function ConfirmEat(nItem)
	if DelItem(tItemInfo[nItem][1], tItemInfo[nItem][2], tItemInfo[nItem][3], 1) == 1 then
		local nRet = EatXcl(nItem, tItemInfo[nItem][4])
		if nRet == 1 then
			Msg2Player("B�n nh�n ���c "..tItemInfo[nItem][6].."*hi�u qu�")
		end
	end
end

function TestEat(nIndex)
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if tItemInfo[nIndex][5] < nSpeed then
			Say("B�n nh�n ���c hi�u qu�"..tItemInfo[nType][6].."m�nh nh�t, kh�ng th� s� d�ng"..tItemInfo[nIndex][6], 0)
		elseif tItemInfo[nIndex][5] == nSpeed then
			ConfirmEat(nIndex)
		elseif tItemInfo[nIndex][5] > nSpeed then
			Say("Hi�n b�n b�n c� "..tItemInfo[nType][6]..", mu�n ��i th�nh"..tItemInfo[nIndex][6].."?\n<color=red>Ch� �: Sau khi thay ��i th�i gian hi�u qu� ban ��u s� tr� v� 0<color>", 2, "��ng/#ConfirmEat("..nIndex..")", "Sai/no_say")
		end
	else
		ConfirmEat(nIndex)
	end
end
--ÿ���Ӽ�һ������
--�峤
function OnTimer(nSpeed)
	local dragon_boat_flag = GetTask(keepsake_date_TaskID)
	if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil then
		for i = 1,getn(tItemInfo) do
			if nSpeed == tItemInfo[i][5] then
				SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + tItemInfo[i][7]))
				break
			end
		end
	end
	
--2007��Ϧ	
	if nSpeed == tItemInfo[1][5] or nSpeed == tItemInfo[2][5] or nSpeed == tItemInfo[3][5] then
		local nFlowerPlantFlog = GetTask(TASK_IS_PLANT); 
		if nFlowerPlantFlog ~= 0 and nFlowerPlantFlog ~= nil and GetTask(TASK_FLOWER_GROW) < 100 then
			local nLastDay = floor((GetTime()+28800-60)/86400); --ǰһ���ӵ����ڣ������жϿ���
			local nNowDay = floor((GetTime()+28800)/86400);		 
			if nLastDay ~= nNowDay then  --�����ˣ���0
				SetTask(TASK_TOTAL_TIME,0);
			end
			if GetTask(TASK_IS_GROW) < nNowDay then  --���컹û�ɳ���
				SetTask(TASK_TOTAL_TIME,GetTask(TASK_TOTAL_TIME)+1); --�ۼ�ʱ�䣬��λ����
				if GetTask(TASK_TOTAL_TIME) >= 60 then
					SetTask(TASK_FLOWER_GROW,GetTask(TASK_FLOWER_GROW)+1);
					SetTask(TASK_IS_GROW,nNowDay);
					SetTask(TASK_TOTAL_TIME,0);
				end
			end
		end	
	end	
end
function no_say()

end
