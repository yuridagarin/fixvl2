-- ��������
-- �ɶ�-���� ��������
-- ������ʼ

-- wq : World Quest
-- id : 4, 14, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");
Include("\\script\\��ԭһ��\\�꾩\\npc\\�������ϰ�.lua");

quest_giver = cf_ox_SetColor("Ch� Ti�m v� kh�", "green")..":"
quest_title = cf_ox_SetColor("Thu�c t�nh v� kh�", "yellow").."\n"
quest_detail = cf_ox_SetColor("B�n nh�n ���c v� kh� t��ng kh�c v�i qu�i thu�c t�nh �m.", "gray").."\n\n"
quest_description_1 = quest_giver.."��ng l� nh�ng nguy�n li�u n�y, ta s� gi�p ng��i ch� t�o."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_004()
	local ws = random(1,5)
	if (GetItemCount(2, 2, 1) >= 20) and (GetItemCount(2, 2, 9) >= 10) and (GetItemCount(2, 0, 12) >= 1) then
		-- �����Ǵ������Ʋ���
		RemoveTrigger(GetRunningTrigger())		-- ɾ����ǰ������
		SetTask(101, 18)

	
		-- ����������������
		DelItem(2, 2, 1, 20)					-- ɾ������������
		DelItem(2, 2, 9, 10)					-- ɾ������������
		DelItem(2, 0, 12, 1)					-- ɾ������������
		ModifyExp(200)							-- ������Ҿ��齱��
		if (GetPlayerRoute() == 2) then
			AddItem(0,5,31,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 3) then			
			AddItem(0,8,88,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 4) then
			AddItem(0,0,5,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 6) then
			AddItem(0,1,44,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 8) then
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 9) then
			AddItem(0,10,66,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 11) then
			AddItem(0,0,5,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 12) then
			AddItem(0,5,31,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 14) then
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 15) then
			AddItem(0,9,77,1,1,0,16383,0,16383,0,16383,ws)
		else
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		end

--���·��ӳ���
--0	��·��
--1	������·��
--2	�����׼�
--3	������ɮ
--4	������ɮ
--5	������·��
--6	������ͨ
--7	������·��
--8	���ҳ���
--9	�����׼�
--10	ؤ����·��
--11	ؤ�ﾻ��
--12	ؤ������
--13	�䵱��·��
--14	�䵱����
--15	�䵱�׼�
	
		-- ������������ʾ����
		TaskTip("B�n nh�n ���c v� kh� t��ng kh�c v�i qu�i thu�c t�nh �m.")
		Say(quest_title..quest_detail..quest_description_1, 0)
	else
		main()
	end
end