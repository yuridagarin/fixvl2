--=============================================
--create by baiyun 2009.4.13
--describe:Խ�ϰ�4�·ݽ����������ǻ ���Ҵ��¼�
--=============================================

Include("\\script\\online\\viet_2009_4\\gsstars\\gsstars_head.lua")
Include("\\script\\online\\viet_2009_4\\collectjqbox\\tianjilaoren.lua")

function OnUse()

	----���ʱ��
	if JQ_CheckEventDate() ~= 1 then
		Talk(1, "", "Th�i gian ho�t ��ng �� h�t.");
		return 0;
	end
	
	Say(
			"Ho�t ��ng ch�o m�ng s� ki�n 30/4 di�n ra trong kho�ng 24-04-2009 ��n 24:00 ng�y 31-05-2009.:",
			5,
			"T�i h� mu�n n�ng c�p Lam K� (C�n 3 Lam K� v� 10 b�c)/JQ_LevelBToRFlag",
			"T�i h� c�n gh�p H�ng K� v�i Ho�ng Kim Th�ch (nh�n ���c Ho�ng Kim K� ho�c B�ch Kim K�)/JQ_GroupRedAndStone",
			"Nh�n Ng�i Sao B�c (nh�n t� 18h � 19h, t� th� hai ��n th� s�u h�ng tu�n)./JQ_GetSilverStar",
			"T�m hi�u th�ng tin s� ki�n/JQ_GetInfo",
			"K�t th�c ��i tho�i/JQ_DoNothing"
		)
end

--------------------------------------
--JQ_GetSilverStar()
--��ȡ������
--------------------------------------
function JQ_GetSilverStar()

	-----�жϵȼ�----------------------------------------------------
	if GetLevel() < GSSTARS_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V�n ch�a ��t ��n c�p <color=yellow>" .. GSSTARS_ROLE_LEVEL_LIMIT .. "<color>, kh�ng th� tham gia ho�t ��ng.");
		return 0;
	end
	
	--��鵱ǰʱ���Ƿ������ȡ�����ǣ���18��00 - 19:00,����1����5ÿ�ܣ�
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDay == 0 or nDay == 6 then
		Talk(1, "", "B�y gi� kh�ng th� nh�n ng�i sao v�ng");
		return 0;
	end
	if nHour ~= 18 and nHour ~= 19 then
		Talk(1, "", "B�y gi� kh�ng th� nh�n ng�i sao v�ng");
		return 0;
	end
	--�������Ƿ��еõ�������
	--���õ��������ǵĴ����Ƿ񵽴�ÿ����Եõ�������
	local nDate = tonumber(date("%y%m%d"));
	
	if GetTask(GSSTARS_TASK_GET_SSTARS_DATE) < nDate then --��������һ�λ��������
		SetTask(GSSTARS_TASK_GET_SSTARS_COUNT, 0);
	end;
	
	--�ж���ȡ�������Ƿ��ѵ��������
	if GetTask(GSSTARS_TASK_GET_SSTARS_COUNT) >= GSSTARS_GET_SSTAR_MAX_TIME then 
		Talk(1, "", "H�m nay �� nh�n <color=yellow>".. GetTask(GSSTARS_TASK_GET_SSTARS_DATE) .." l�n<color> ng�i sao b�c, ��i ng�y mai h�ng ��n l�i nh�.");
			return 0;
	end
	
	--�ж����ϴ���ȡ�����ǵ�ʱ����
		if GetTime() - GetTask(GSSTARS_TASK_GET_SSTARS_TIME) < GSSTARS_GET_SSTARS_INTERVAL then
			Talk(1, "", "Th�i gian gi�n c�ch hai l�n nh�n ng�i sao b�c l� <color=yellow>" .. GSSTARS_GET_SSTARS_INTERVAL .. " gi�y.");
			return 0;
		end
	
	-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin l�i, ") == 0 then
		return 0;
	end
	
	--�ж���ҿ��Եõ�����������
	local nSilverStarCount = GSSTARS_PARAM[floor(GetLevel() / 10)][2];
	--���Ը���������
	if AddItem(2, 1, 30077, nSilverStarCount) == 1 then
				Msg2Player("B�n nh�n ���c " .. nSilverStarCount .. "c�i" .. "Ng�i Sao b�c");
				WriteLog("[Ho�t ��ng ng�i sao v�ng ng�i sao b�c th�ng 4]:" .. GetName() .. "Nh�n ���c" .. "!!" .. nSilverStarCount .. "c�i" .. "Ng�i Sao b�c");
			--���������Ǻ󣬸�������ֵ��
			SetTask(GSSTARS_TASK_GET_SSTARS_DATE, nDate);
			SetTask(GSSTARS_TASK_GET_SSTARS_TIME, GetTime());
			SetTask(GSSTARS_TASK_GET_SSTARS_COUNT, GetTask(GSSTARS_TASK_GET_SSTARS_COUNT) + 1);
	end

end

--------------------------------------
--JQ_GetInfo()
--�˽���Ϣ
--------------------------------------
function JQ_GetInfo()
	Say(
			"S� ki�n 30/4 n�m nay bao g�m c�c ho�t ��ng sau ��y::",
			4,
			"S� ki�n 30 th�ng 4/#JQ_EventDetail(1)",
			"Tr�ng c�y 1 th�ng 5/#JQ_EventDetail(2)",
			"Ng�i Sao V�ng/#JQ_EventDetail(3)",
			"K�t th�c ��i tho�i/JQ_DoNothing"
		)
end

--------------------------------------
--JQ_GetInfo()
--�˽���Ϣ
--------------------------------------
function JQ_EventDetail(nType)
	if nType == 1 then
		Talk(1,"JQ_GetInfo","Ho�t ��ng ch�o m�ng s� ki�n 30/4 di�n ra trong kho�ng 24-04-2009 ��n 24:00 ng�y 31-05-2009. Trong th�i gian s� ki�n, c�c h� c� th� thu th�p R��ng Hi�u K�  th�ng qua nhi�m v� S� M�n,T�ng Ki�m S�n Trang, tr�ng C�y B�t Nh�. M� R��ng Hi�u K� s� thu ���c Lam K�, n�ng c�p Lam K� th�nh H�ng K� (qu� tr�nh n�ng c�p c� th� s� c� th�t b�i, th�t b�i b�n ch� nh�n l�i ���c 2 Lam K�), k�t h�p H�ng K� v�i Ho�ng Kim K� Th�ch s� thu ���c Ho�ng Kim K� , n�u may m�n b�n s� nh�n ���c B�ch Kim K� v�i nh�ng ph�n th��ng c�c k� h�p d�n."	)
	elseif nType == 2 then
		Talk(1,"JQ_GetInfo","Ho�t ��ng tr�ng c�y di�n ra trong kho�ng 24-04-2009 ��n 24:00 31-05-2009. Trong th�i gian s� ki�n, c�c h� c� th� mua H�t Gi�ng t� Ng� C�c. C� th� gieo h�t gi�ng t�i 6 ��i Th�nh Th�. Khi gieo h�t gi�ng s� ng�u nhi�n nh�n ���c c�c lo�i c�y kh�c nhau nh�: C�y H�o �a, C�y B�t T�, C�y B�ch Ng�n, C�y Ho�ng Kim, C�y B�ch Kim. Qu� tr�nh tr�ng c�y di�n ra nh� sau:- Gi�y th� 1 ��n gi�y th� 45: gieo h�t, nh�n ���c lo�i c�y ng�u nhi�n\n- Gi�y th� 46 ��n gi�y th� 240: l� giai �o�n ng��i ch�i s� d�ng l� th�y �� ch�m s�c cho c�y. ��i v�i lo�i c�y B�t T� th� kh�ng c�n d�ng L� Th�y �� ch�m s�c\n- Gi�y th� 241 ��n gi�y th� 300: giai �o�n thu ho�ch ph�n th��ng, ph�n th��ng s� t��ng �ng v�i m�i lo�i c�y kh�c nhau ")	
	else
		Talk(1,"JQ_GetInfo","Ho�t ��ng Ng�i Sao V�ng � Ng�i Sao B�c di�n ra trong kho�ng 24-04-2009 24:00 31-05-2009. V�o c�c th�i gian 18 gi� ��n 19 gi�, t� th� hai ��n th� s�u h�ng tu�n, c�c h� c� th�  thu th�p mi�n ph� Ng�i Sao B�c t�i C�m Nang ��i S� Ki�n. \n- T�y theo c�p �� c�a nh�n v�t m� s� nh�n ���c s� l��ng Ng�i Sao B�c kh�c nhau\n- Th�i gian gi�a 2 l�n nh�n Ng�i Sao B�c li�n ti�p l� 5 ph�t\n- C�c h� d�ng Ng�i Sao B�c �� n�ng c�p th�nh Ng�i Sao V�ng t�i NPC Phi Y�n Ti�n T�.\n- T� th� b�y ��n ch� nh�t h�ng tu�n, c�c h� d�ng Ng�i Sao V�ng �� ��i l�y ph�n th��ng t�i NPC Phi Y�n Ti�n T�."	)	
	end	
end