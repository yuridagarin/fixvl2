
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

--*****************************************���峣����Ԥ����*********************************
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEVELTASKID49=517  --����������
TASK_GATHER_FLAG=1931 --������Ʒ�ɼ���ʾ

strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
function main()

	strName = GetTargetNpcName();
	if strName=="" or strName==nil then return end;
	strTitle = "<color=green>"..strName.."<color>: ";
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local strTitle = "<color=yellow>Ch� ti�m v� kh�: <color>"
	local a =  goto_takelifeskill_task()
	
----------------------------------------------���Ի�-----------------------------------------------
	if (nState==1) then	
		task_001_00();
		return	
	end
	
	local tSay = {
		"Mua v� kh�/_buy_sale_equip",
		"Trang b� t�ch/_equip_recycle",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>Ch� Ti�m V� Kh�:<color> V� kh� � ch� c�a ta v�n l� m�t h�ng ph� bi�n, kh�ng bi�t m�n v� kh� c� thu�c qu� s� nh� th� n�o!", getn(tSay), tSay);
end;		

function _buy_sale_equip()
	Sale(33);
end

function _equip_recycle()
	SendScript2Client("Open[[EquipRecycle]]");
end

function nothing()
	--do nothing
end
		
--  ǿ����������
--  ������
--  2004.01.17
--Include("\\script\\global\\itemhead.lua")
	
	
-- UTask_world1502 = GetTask(1502)
--	if (UTask_world1502 == 0) and (GetLevel() > 7) then 		--��������
--		Talk(2,"W1502_get","��������λС�����Ҳ�ڽ����ϻ���һЩʱ���ˣ���ôû�Ѿ����ı��а�����","<color=green>���<color>����������λʦ�����԰�æô��")
--	elseif (UTask_world1502 == 5) then
--		if (GetItemCount("XXXX") >= N) and (GetItemCount("XXXX") >= N) then		-- �������
--			SetTask(1502,10)
--				for i=1,N do
--							DelItem("XXX")
--							DelItem("XXXX")
--				end
--			Talk(1,"","�������ã�����ȫ�ˣ������ΪС������һ��ǿ���ı��С�")
--			AddNote("��XXX��XXXX����������������ɡ�")
--			TaskTip("��XXX��XXXX����������������ɡ�")
--			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
--			if(GetSex() == 0) then
--				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
--				TaskTip("�õ��������塣")
--			else
--				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
--				TaskTip("�õ�Ѭ�����ҡ�")
--			end
--			AddRepute(8)
--			TaskTip("��Ľ�������������8��")
--			AddItem(0)
--		else
--			Talk(1,"","��������ô��������������ô��")
--		end
--	elseif (UTask_world1502 == 10) then		-- �����Ѿ����
--		EnchaseItem() --�򿪾������棬�����������Ƕ�Ľű�
--	else
--		Talk(1,"","������������ֽ������У�")
--	end

		
		
--		Talk(1, "", "�Ѿ�˵�����ϣ�")
--	end
--end;
-- Vaiable States
--	Task(2) = 6/7

-- Start of Sub Function
function W1502_get()
	Say("Ta c� th� gi�p ng��i s�a v� kh� nh�ng c�n 2 lo�i nguy�n li�u XXX v� XXXX m�i lo�i N ph�n, ng��i h�y ra ngo�i Bi�n Kinh ph� t�m ch�ng!",2,"Ta �i ngay!/W1502_get_yes","Sau n�y h�y t�nh/W1502_get_no")
end

function W1502_get_yes()
	SetTask(1502,5)
	Talk(1,"","T�t l�m! Ta �i t�m ngay ��y!")
	AddNote("Nh�n nhi�m v�: �i t�m xxx v� xxxx, ��n Th� r�n gi�p n�ng c�p v� kh�.")
	TaskTip("Nh�n nhi�m v�: �i t�m xxx v� xxxx, ��n Th� r�n gi�p n�ng c�p v� kh�.")
end

function W1502_get_no()
end

