-- -----------------------------------------
-- Newbie Quest Lua Scripts / Danexx 2005.02
-- -----------------------------------------
-- Include Files
Include( "\\script\\��ԭһ��\\�꾩\\npc\\init_��������.lua" )

-- Variable

-- Start of Main Function
function main()
--  �����������
	NewbieTaskStrings =	 {"    Ha ha! C�a hi�u ta chuy�n b�n v� kh� t�t nh�t. Trang b� b�n m�nh <color=red>V� kh�<color> ta b�n, ng��i s� v�ng ch� phi�u b�t giang h�. Ta t�ng ng��i thanh v� kh� ph�ng th�n, sau n�y c�n mua g� c� ��n t�m ta!",
						  "    Khi d�ng v�t li�u c� b�n nh� <color=green>kim lo�i<color> v� <color=green>g�<color>, c� th� ph�i gh�p theo t� l� kh�c nhau �� ch� t�o c�c lo�i v� kh�. N�u th�m v�o <color=green>chi�n linh<color> ho�c v�i <color=green>v�t ph�m th�n b�<color> s� gh�p ���c v� kh� c�ng t�t h�n!"}

--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {15,30}
	TaskReward	=	 	 {0,0}
	TaskItem	=		{{0,2,1},
						 {0,0,0}}
						 
--  ��ɽ�������õı��� Task(101) ����5��Bit����¼������������û��Bit�ֱ��ʾ ������/��װ��/�ӻ���/ҩ��/�ӵ�������
    if ( GetBit(GetTask(101), 1) == 1 ) and (GetBit(GetTask(101), 5) == 0) then
		Talk(1, "", NewbieTaskStrings[1])
		SetTask(101, SetBit(GetTask(101), 5, 1))
		ModifyExp(TaskExp[1])
		AddItem(TaskItem[1][1], TaskItem[1][2], TaskItem[1][3])
		if ( GetTask(101) == 31 ) then		--  ��ɽ������ɣ����������������
			SetTask(100, (GetTask(100) + 1))
			Msg2Player("Quest Lv.2 Finished.")
		end
		
--  ������������õı��� Task(106) ����4��Bit����¼������������ÿ��Bit�ֱ��ʾ �¼�/����/����/�ӵ�������
--  ֻ������Ȫ��		
	elseif ( GetBit(GetTask(106), 1) == 1 ) and (GetBit(GetTask(106), 3) == 0) then
		Talk(1, "", NewbieTaskStrings[2])
		SetTask(106, SetBit(GetTask(106), 3, 1))
		ModifyExp(TaskExp[2])
		if ( GetTask(106) == 15 ) then		--  �����������ɣ����������������
			SetTask(100, (GetTask(100) + 1))
			Msg2Player("Quest Lv.7 Finished.")
		end

--	elseif ( GetTask(8) ~= 1 ) and ( GetItemCount(2, 2, 1) >= 2 ) then
--		SetTask(8, 1)
--		Talk(1, "", NewbieString[13])
--		ModifyExp(NewbieExp[8])
--		Earn(2*200)
--	    DelItem(2, 2, 1)
--	    DelItem(2, 2, 1)
--		--AddItem(0, 2, 15) ������(�ȴ���������)
	else
		Sale(12)
	end
end;



















--����ָ��
--lijinyong


--function main()
--	Say("�������ϰ壺����������Ƕ��",2,"����/buy","��Ƕ/xiangqian")

--end;


--function buy()
--		i=random(1,2)
--		if i==1 then
--			Sale(12)
--		else
--			Sale(13)
--		end
--end;


--function xiangqian()
--	EnchaseItem()
--end;





--	Uworld1 = GetTask(1)
--	if Uworld1 == 8  then
--		Say("�������ϰ壺����Ļ����Ҽ���ǰ���Ѿ������������˰������ã��϶������İܼҶ�������������ȥ��Ҥ��û�и���������������������Ҫ��������һ���ˡ�С�ֵܣ��������һ�ˣ�ʵ�ڲ�����˼��������һ���Ӵ�����ûʲô�ò����ģ��͸��㽲��������֪ʶ�ɡ�",2,"Ҫ/yes","������/no")
--	SetTask(1,9)
--	else
--		i=random(1,2)
--		if i==1 then
--			Sale(7)
--		else
--			sale(8)
--		end
--		Talk(1,"","�������ϰ壺�͹���������������ѧ�����������������Ҿͺ��ˣ�ѧ�����͸���ͽ��ȥ�մ��Ӱɡ�")
--		Sale(1)
--	end
--end;


--function yes()
--	Talk(1,"no","�������ϰ壺����һ���Ϊ�̱����������������࣬������ʮ�����ɣ�Ҳ�������Լ����ֵı������ͣ����ǳ�˵ʮ�˰���������������õĲ�û����ô�ࡣһ����˵��Խ�Ƕ̱��������ٶ�Խ�죬��������Խ�͡����ڱ�������Դ������Ұ����䣬����������һ���������ִ��죬�������ۿ϶����ơ�")
	
--end

--function no()
--	Talk(1,"","�������ϰ壺�������գ�С��������һ�ѱ�������ɡ�")
--	AddGoldItem(0,2);
--end




