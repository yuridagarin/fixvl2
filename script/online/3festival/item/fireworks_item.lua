--File name:fireworks_item.lua 
--Describe:�����������̻���Ʒ�ű�
--Create Date:2006-9-9
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if tonumber(date("%y%m%d")) > 061008 then
		Talk(1,"","Xin l�i! Ph�o hoa c�a b�n �� h�t h�n s� d�ng.");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","Xin l�i! Ch� c� ng��i ch�i tr�n <color=yellow>c�p 10<color> m�i c� th� ��t Ph�o hoa");
		return 0;
	end;
	if GetTaskTemp(TT_TIMER_LOOP) ~= 0 then
		Talk(1,"","B�n �� ��t 1 c�y Ph�o hoa, m�t l�n ch� c� th� ��t <color=yellow>1 <color> Ph�o hoa.");
		return 0;
	end;
	local selTab = {
				"��t ph�o hoa/confirm",
				"Xem thuy�t minh/know_detail",
				"K�t th�c ��i tho�i/nothing",
				}
	Say("Th�i gian s� d�ng ph�o hoa l� <color=yellow>28/9-8/10<color>. B�n mu�n l�m g�?",getn(selTab),selTab);
end;

function confirm()
	if DelItem(tItemInfo[10][2],tItemInfo[10][3],tItemInfo[10][4],1) == 1 then
		local nMapID,nMapX,nMapY = GetWorldPos();
		local nNpcIndex = CreateNpc("Ng��i V� h�nh",GetName().." ph�o hoa",nMapID,nMapX,nMapY);
		SetNpcLifeTime(nNpcIndex,15*60);	--15���ӣ���10���ӳ�һ��
		SetCurrentNpcSFX(nNpcIndex,936,1,1);
		SetTaskTemp(TT_FIREWORKS_MAPID,nMapID);
		SetTaskTemp(TT_FIREWORKS_MAPX,nMapX);
		SetTaskTemp(TT_FIREWORKS_MAPY,nMapY);
		SetTaskTemp(TT_FIREWORKS_Time,GetTime());
		SetTaskTemp(TT_FIREWORKS_INDEX,nNpcIndex);
		SetTaskTemp(TT_TIMER_LOOP,TIMER_LOOP);
		CreateTrigger(1,TRIGGER_TIMER,TRIGGER_TIMER_CID);
		ContinueTimer(GetTrigger(TRIGGER_TIMER_CID));
		CreateTrigger(3,TRIGGER_LOGOUT,TRIGGER_LOGOUT_CID);
	end;
end;

function know_detail()
	Talk(1,"OnUse","Th�i gian s� d�ng ph�o hoa l� <color=yellow>28-09 ��n 08-10<color>,  ng��i ch�i c�p 10 tr� l�n ��u c� th� tham gia.Th�i gian b�n Ph�o hoa l� 10 ph�t. Ng��i ch�i s� d�ng ph�o hoa m�i ph�t nh�n ���c 50000 �i�m s�c kh�e. C� th� m�i ng��i ch�i kh�c v�o ��i ho�c s� c� ng��i r�i kh�i ��i.");
end;