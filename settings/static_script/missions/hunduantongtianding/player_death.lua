Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")

this = tbHDTTD;

function OnDeath(nKiller)
	local m = GetWorldPos();
	SetTempRevPos(m,1474*32,2961*32); --��ʱ������	
	if GetMissionV(MV_STAGE) == 1 then
		ttd_bossRestore();
	end
end

function ttd_bossRestore()
	local nNpcIDX = ttd_findNpc("Huy�t H�u Ti�u D��ng");
	local nQRSidx = ttd_findNpc("Nh�m Doanh Doanh");
	if nNpcIDX ~= 0 then
		NpcChat(nNpcIDX,"Tr�n chi�n sinh t� l� ph�i m�ng ��i m�ng, m�u �� ��u r�i, quy�t chi�n t�i c�ng.");
		NpcChat(nQRSidx,"H�y c�n th�n b�n t� ma ngo�i ��o n�y gi�t ng��i h�t m�u �� h�i ph�c ch�n kh�, v� c�ng d� man!");
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIDX,1);
		local nAddLife = min(floor(nMaxLife*0.1),nMaxLife-nCurLife);
		ModifyNpcData(nNpcIDX,0,nAddLife,1);
	end		
end