--=============================================
--create by baiyun 2009.4.15
--describe:Խ�ϰ�4�» ������Եweb,����ʹ��NPC
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

--�������
WL_TASK_GET_ITEM_DATE = 2146;					--������ĵ�������
WL_TASK_ALREADY_GET_EXP = 2147;				--ʹ�����ĵ��Ѿ���õľ�����
JXWEB_EXT = 1;

WL_ROLE_LEVEL_LIMIT = 50;							--��ȼ�����
WL_GET_MAX_EXP = 60000000;						--ʹ�����ĵ������60000000����
WL_GET_EACH_EXP = 3000000;						--ʹ�����ĵ�ÿ�λ�õľ���

JXWEB_EXPIRED_DATE = 09052924	

--------------------------------------
--main()
--������
--------------------------------------
function main()
	Say(
			"�� ch�o m�ng s� ki�n <color=gold>Open Beta game V� L�m Web<color>, trong kho�ng th�i gian t�  <color=gold>ng�y 01-05-2009 ��n 24 gi� ng�y 23-05-2009<color>, t�t c� v� l�m nh�n s� khi tham gia game V� L�m Web v� ��t ���c c�c th�nh t�ch trong game, khi �� c� th� ��n g�p ta �� nh�n ph�n th��ng, th�ng tin chi ti�t t�i trang ch� game V� L�m Web.",
			2,
			"T�i h� ��n nh�n ph�n th��ng H� Tr� T�n Th�!/WLGetReward",
			"T�i h� ch� gh� ngang!/WLDoNothing"
		)
end

--------------------------------------
--WLGetReward()
--��ȡ����
--------------------------------------
function WLGetReward()
	--�жϻ����
	if tonumber(date("%Y%m%d%H")) <= 2009043024 or tonumber(date("%Y%m%d%H")) > 2009052324 then
		Talk(1, "", "Ho�t ��ng n�y v�n ch�a m�.");
		return 0;
	end
	
	local nExtVal = GetExtPoint(JXWEB_EXT)	
	--�ж���չ�㣬�ж�����Ƿ����ʸ���ȡ
	if nExtVal ~= 1 then
		Say("C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng", 1, "Th�t ng�i qu�! T�i h� s� quay l�i sau./WLDoNothing");
		return 0;
	end

	
	--�жϽ����Ƿ��Ѿ�������ĵ�
	if GetTask(WL_TASK_GET_ITEM_DATE) >= tonumber(date("%y%m%d")) then 
		Talk(1, "", "H�m nay ng��i �� nh�n Li�n T�m �an r�i.");
		return 0;
	end
	
	-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(1, 1, "Xin l�i, ") == 0 then
		return 0
	end
	
	--��������Ʒ
	PayExtPoint(JXWEB_EXT,1)
	SetTask(WL_TASK_GET_ITEM_DATE, tonumber(date("%y%m%d")));
	
end

function WLDoNothing()
end