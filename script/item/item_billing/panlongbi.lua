------------------------------------------------------------
-- �������ɢ�Ľű� dabaobaiyunsan.lua
--
-- comment: �򿪺���250������ɢ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,486
-- ����ɢID: 1,0,4
------------------------------------------------------------
TSK_USE_PLB_DATE = 596
TSK_USE_HSB_DATE = 597
TSK_USE_PLB = 598
TSK_USE_HSB = 599

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n c� mu�n l�y <color=yellow>B�n Long b�ch<color> ��i th�nh ti�n game kh�ng? C� th� ��i ���c <color=yellow>35<color> ti�n.",
		2,
		"���c/open_panlongbi",
		"T�m th�i kh�ng m�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function open_panlongbi()
	local nDate = tonumber(date("%Y%m%d"));
	local nLimitTime = get_limit_time();
	if GetTask(TSK_USE_PLB_DATE) < nDate then
		SetTask(TSK_USE_PLB,0);
	end;
	local nCurUseTime = GetTask(TSK_USE_PLB);
	if nCurUseTime >= nLimitTime and nLimitTime ~= 0 then
		Talk(1,"","D�a v�o ��ng c�p hi�n t�i, h�m nay b�n ch� c� th� d�ng <color=yellow>"..nLimitTime.."<color> B�n Long b�ch.");
		return 0;
	end;
	if (DelItem(2, 1, 1000, 1) == 1) then
		Earn(350000);
		SetTask(TSK_USE_PLB_DATE,nDate);
		SetTask(TSK_USE_PLB,nCurUseTime+1);
		if nLimitTime == 0 then
			Say("B�n nh�n ���c <color=yellow>35 ti�n game<color>!",0);
		else
			Say("B�n nh�n ���c <color=yellow>35 ti�n game<color>! H�m nay b�n �� d�ng B�n Long b�ch l�n th� <color=yellow>"..(nCurUseTime+1).."<color>. D�a v�o ��ng c�p hi�n t�i, h�m nay b�n c� th� d�ng <color=yellow>"..nLimitTime.."<color> B�n Long b�ch.", 0)
			Msg2Player("H�m nay b�n ��ng th�"..(nCurUseTime+1).." l�n");
		end;
		WriteLog("[B�n Long b�ch]:"..GetName().."H�m �� l�n "..(nCurUseTime+1).." l�n");
	else
		Say("B�n kh�ng h� c�<color=yellow>B�n long b�ch<color>!", 0)
	end
end;

function get_limit_time()
	local nLevel = GetLevel();
	local nLimitTime = 0;
	if nLevel <= 10 then
		nLimitTime = 1;
	elseif nLevel <= 20 then
		nLimitTime = 2;
	elseif nLevel <= 30 then
		nLimitTime = 3;
	elseif nLevel <= 40 then
		nLimitTime = 4;
	elseif nLevel <= 50 then
		nLimitTime = 5;
	elseif nLevel <= 60 then
		nLimitTime = 10;
	elseif nLevel <= 70 then
		nLimitTime = 20;
	elseif nLevel <= 75 then
		nLimitTime = 40;
	else
		nLimitTime = 0;
	end;
	return nLimitTime;
end;

