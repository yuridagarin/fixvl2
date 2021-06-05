-- file:rescue.lua
-- by:Xsjcs
-- CreateDate: 2005-4-22
--  GetWorldTempTask(0)  ��¼ʱ��hour
--  GetWorldTempTask(1)  ��¼������ȡ����  (���������)
--  GetTask(250)    ��¼��ǰ����1Сʱ���Ƿ�������ȼ�Ʒ
--  ������֣��ղ��ÿ1Сʱ������������У�ÿ��һ����100���ȼ�Ʒ��ÿ��20�����µ�����ÿ��ֻ����ȡһ����ÿ���󳼴���ȡû�����ơ�


function newplayer_help()
	if (GetLevel() >= 20) then 
		Say("Ta ph�ng m�nh Ho�ng th��ng, ph�t l��ng th�c v� ti�n b�c c�u t� n�n d�n! Ai t� c�p 20 tr� l�n ��u c� th� ��n nh�n",0)
	else 
		Say("Ta ch� ���c ph�p c�u t� cho nh�ng t�n th� ��t c�p 20 m� th�i! Ng��i �� �� t� c�ch, c� mu�n nh�n kh�ng?",3,"Hay qu�! Ta �ang kh�n kh� ��y! Ho�ng th��ng anh minh!/present","Xin ch� gi�o, l�m sao �� ���c nh�n c�u t�?!/abouthelpgoods","Ta ��y m� ph�i �i nh�n c�u t� �!?/no")
	end;
end;

function abouthelpgoods()
	Say("Ta ph�ng m�nh Ho�ng th��ng, m�i ng�y �i ph�t c�u t� cho c�c t�n th� c�p 20 � Th�nh ��, Bi�n Kinh, Tuy�n Ch�u. C� c�ch m�i gi� ph�t 1 l�n. M�i ng�y ch� c� 100 ph�n, ai nhanh ch�n th� ���c!",0)
end;



function present()

	local nNowTime = GetWorldTempTask(0)	--������ȫ�ֱ���
	local nQuantity = GetWorldTempTask(1) 	--������ȫ�ֱ���
	local Utask250 = GetTask(250)	
	local nHour = tonumber( date( "%m%d%H" ) )	--��ǰʱ���¼

	if ( nNowTime ~= nHour ) then
		SetWorldTempTask(0,nHour)	--����ʱ���¼
		SetWorldTempTask(1,0)		--����ȡ��������
		AddLocalNews("* * *Kh�m Sai ��i th�n �ang ph�t c�u t�, c�c t�n th� ��t c�p 20 h�y nhanh ch�n ��n Th�nh ��, Bi�n Kinh, Tuy�n Ch�u �� nh�n!* * *")
	end
	nNowTime = GetWorldTempTask(0)
	nQuantity = GetWorldTempTask(1)
	if ( Utask250 ~= nNowTime and nQuantity < 100 ) then
		onTake()
		SetWorldTempTask(1,nQuantity+1)
		SetTask(250,nNowTime)
--		Msg2Player("AddItem 1,total = " ..nQuantity + 1)
	elseif ( Utask250 == nNowTime ) then
		Say("Ng��i �� nh�n ph�n c�a m�nh r�i! H�y nh��ng cho ng��i kh�c nh�!",0)
	else
		Say("�i! Ng��i ngh�o � ��u m� nhi�u th�! Ng��i ��n ch�m ch�n r�i! M�t gi� sau h�y quay l�i nh�!",0)
	end		

end

function onTake()

  	i = random(1,54)
	if ( i == 1 ) then
		Earn(10)
		Msg2Player("B�n nh�n ���c 10 ��ng xu c�u t�!")
	elseif ( i == 2 ) then
		Earn(50)
		Msg2Player("B�n nh�n ���c 50 ��ng xu c�u t�!")
	elseif ( i == 3 ) then
		Earn(100)
		Msg2Player("B�n nh�n ���c 1 l��ng b�c c�u t�!")
	elseif ( i == 4 ) then
		Earn(200)
		Msg2Player("B�n nh�n ���c 2 l��ng b�c c�u t�!")
	elseif ( i == 5 ) then
		AddItem(1,2,1,2)
		Msg2Player("B�n nh�n ���c 2 T�ng H�ng hoa")
	elseif ( i == 6 ) then
		AddItem(1,2,2,2)
		Msg2Player("B�n nh�n ���c 2 C�t c�nh")
	elseif ( i == 7 ) then
		AddItem(1,2,3,2)
		Msg2Player("B�n nh�n ���c 2 Ho�ng li�n")
	elseif ( i == 8 ) then
		AddItem(1,2,8,2)
		Msg2Player("B�n nh�n ���c 2 Ba ��u!")
	elseif ( i == 9 ) then
		AddItem(1,2,9,2)
		Msg2Player("B�n nh�n ���c 2 X�c ve")
	elseif ( i == 10 ) then
		AddItem(2,2,1,2)
		Msg2Player("B�n nh�n ���c 2 Tinh thi�t")
	elseif ( i == 11 ) then
		AddItem(2,2,2,2)
		Msg2Player("B�n nh�n ���c 2 B�ch luy�n cang")
	elseif ( i == 12 ) then
		AddItem(1,2,1,2)
		Msg2Player("B�n nh�n ���c 2 T�ng H�ng hoa")
	elseif ( i == 13 ) then
		AddItem(2,2,9,2)
		Msg2Player("B�n nh�n ���c 2 Tr�ng M�c!")
	elseif ( i == 14 ) then
		AddItem(2,2,10,2)
		Msg2Player("B�n nh�n ���c 2 Thi�t Ch��ng M�c")
	elseif ( i == 15 ) then
		AddItem(2,2,15,2)
		Msg2Player("B�n nh�n ���c 2 Da s�i")
	elseif ( i == 16 ) then
		AddItem(2,2,16,2)
		Msg2Player("B�n nh�n ���c 2 Da h�")
	elseif ( i == 17 ) then
		AddItem(2,2,21,2)
		Msg2Player("B�n nh�n ���c 2 H�c c�m")
	elseif ( i == 18 ) then
		AddItem(2,2,22,2)
		Msg2Player("B�n nh�n ���c 2 Ch�c c�m")
	elseif ( i == 19 ) then
		AddItem(1,3,1,2)
		Msg2Player("B�n nh�n ���c 2 Th�t th�")
	elseif ( i == 20 ) then
		AddItem(1,3,2,2)
		Msg2Player("B�n nh�n ���c 2 Th�t g�")
	elseif ( i == 21 ) then
		AddItem(1,3,9,2)
		Msg2Player("B�n nh�n ���c 2 Quang Th�ng ma")
	elseif ( i == 22 ) then
		AddItem(1,3,10,2)
		Msg2Player("B�n nh�n ���c 2 ��u Khuynh")
	elseif ( i == 23 ) then
		AddItem(1,0,1,2)
		Msg2Player("B�n nh�n ���c 2 cu�n b�ng")
	elseif ( i == 24 ) then
		AddItem(1,0,2,2)
		Msg2Player("B�n nh�n ���c 2 Kim S�ng t�n")
	elseif ( i == 25 ) then
		AddItem(1,0,3,2)
		Msg2Player("B�n nh�n ���c 2 Ch� Huy�t t�n")
	elseif ( i == 26 ) then
		AddItem(1,0,7,2)
		Msg2Player("B�n nh�n ���c 2 Ti�u Ho�n ��n")
	elseif ( i == 27 ) then
		AddItem(1,0,12,2)
		Msg2Player("B�n nh�n ���c 2 Thanh T�m t�n")
	elseif ( i == 28 ) then
		AddItem(1,1,1,2)
		Msg2Player("B�n nh�n ���c 2 B�nh ng�")
	elseif ( i == 29 ) then
		AddItem(1,1,2,2)
		Msg2Player("B�n nh�n ���c 2 C�m n�m")
	elseif ( i == 30 ) then
		AddItem(2,5,1,2)
		Msg2Player("B�n nh�n ���c 2 Gi�m ��nh ph�!")
	elseif ( i == 31 ) then
		AddItem(2,5,2,2)
		Msg2Player("B�n nh�n ���c 2 Gi�m ��nh ph�!")
	elseif ( i == 32 ) then
		AddItem(2,4,1,1)
		Msg2Player("B�n nh�n ���c 1 �m H�o Th�ch!")
	elseif ( i == 33 ) then
		AddItem(2,4,8,1)
		Msg2Player("B�n nh�n ���c 1 D��ng H�o Th�ch!")
	elseif ( i == 34 ) then
		AddItem(1,5,1,2)
		Msg2Player("B�n nh�n ���c 2 H�i ph� Bi�n Kinh")
	elseif ( i == 35 ) then
		AddItem(1,5,2,2)
		Msg2Player("B�n nh�n ���c 2 H�i ph� Th�nh ��")
	elseif ( i == 36 ) then
		AddItem(0,107,31,1)
		Msg2Player("B�n nh�n ���c 1 Tr��ng Quy�n Ph�!")
	elseif ( i == 37 ) then
		AddItem(0,2,14,1)
		Msg2Player("B�n nh�n ���c 1 Hi�p Thi�u Ki�m!")
	elseif ( i == 38 ) then
		AddItem(0,2,15,1)
		Msg2Player("B�n nh�n ���c 1 T�ng V�n Ki�m!")
	elseif ( i == 39 ) then
		AddItem(0,5,27,1)
		Msg2Player("B�n nh�n ���c 1 Hi�p Thi�u C�n!")
	elseif ( i == 40 ) then
		AddItem(0,5,28,1)
		Msg2Player("B�n nh�n ���c 1 T� Mi C�n!")
	elseif ( i == 41 ) then
		AddItem(0,1,40,1)
		Msg2Player("B�n nh�n ���c 1 Hi�p Thi�u �m kh�!")
	elseif ( i == 42 ) then
		AddItem(0,1,41,1)
		Msg2Player("B�n nh�n ���c 1 Ng� Quang th�ch!")
	elseif ( i == 43 ) then
		AddItem(0,3,53,1)
		Msg2Player("B�n nh�n ���c 1 Gi�i �ao!")
	elseif ( i == 44 ) then
		AddItem(0,10,64,1)
		Msg2Player("B�n nh�n ���c 1 Ng�c V�n C�m")
	elseif ( i == 45 ) then
		AddItem(0,9,75,1)
		Msg2Player("B�n nh�n ���c 1 Ph�n Quan b�t")
	elseif ( i == 46 ) then
		AddItem(0,8,86,1)
		Msg2Player("B�n nh�n ���c 1 T�ch tr��ng")
	elseif ( i == 47 ) then
		AddItem(0,100,1,1)
		Msg2Player("B�n nh�n ���c 1 Hi�pThi�u B� y!")
	elseif ( i == 48 ) then
		AddItem(0,100,2,1)
		Msg2Player("B�n nh�n ���c 1 H�c C�m B� Y")
	elseif ( i == 49 ) then
		AddItem(0,100,19,1)
		Msg2Player("B�n nh�n ���c 1 Hi�pThi�u Y!")
	elseif ( i == 50 ) then
		AddItem(0,100,20,1)
		Msg2Player("B�n nh�n ���c 1 Thi�t H� Uy�n")
	elseif ( i == 51 ) then
		AddItem(0,100,37,1)
		Msg2Player("B�n nh�n ���c 1 Th�i Th��ng")
	elseif ( i == 52 ) then
		AddItem(0,100,38,1)
		Msg2Player("B�n nh�n ���c 1 T� L�ng Th��ng")
	elseif ( i == 53 ) then
		AddItem(0,100,55,1)
		Msg2Player("B�n nh�n ���c 1 V� Th��ng")
	else 
		AddItem(0,100,56,1)
		Msg2Player("B�n nh�n ���c 1 H�ng V�n Th��ng")
	end
end

function no()
	Say("Th�y ng��i c� ch� kh� nh� v�y, b�n quan v� c�ng kh�m ph�c!",0)
end
