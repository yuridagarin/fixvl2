--function main()
--IdentiryAll()
--end;
-- -----------------------------------------
-- Newbie Quest Lua Scripts / Danexx 2005.01
-- -----------------------------------------
-- Include Files
Include( "\\script\\��ԭһ��\\�꾩\\npc\\init_��������.lua" )

-- Variable
	
-- Start of Main Function
function main()
--  �����������
	NewbieTaskStrings =	 {"    ��i th� th��ng s� d�ng v� kh� ng� h�nh mang t�nh s�t th��ng gi�i h�n, ch� c�n d�ng <color=blue>v� kh� ng� h�nh<color> d�a theo t�nh t��ng kh�c l� c� th� t�o ra s�t th��ng l�n.",
						  "    Ha! Ha! V� kh� ng� h�nh c�ng c� tai h�i khi ��i m�t v�i thu�c t�nh t��ng sinh kh�ng th� t�o ra s�t th��ng l�n nh�ng kh�ng sao ch� c�n ph�i h�p ��ng thu�c t�nh ng� h�nh th� uy l�c s� cao g�p b�i."}

--  ÿ��������Եõ��Ľ���
	TaskExp		= 	 	 {10,0}
	TaskReward	=	 	 {0,0}
	TaskItem	=		{{0,0,0},
						 {0,0,0}}
--	TaskMagic	=		{{0,0,0},
--						 {0,0,0}}
						 
    if ( GetTask(103) == 1 ) then
		Talk(1, "", NewbieTaskStrings[1])
		SetTask(103, 2)
		SetTask(100, (GetTask(100) + 1))
		ModifyExp(TaskExp[1])
		-- AddItem() ��������
	else
		Talk(1, "", NewbieTaskStrings[2])
	end
end;

