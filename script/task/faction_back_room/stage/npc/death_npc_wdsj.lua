--���ߣ��Ͼ�
--�������ڣ�08��1��31��15:15
--NPC�����ű�
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nMaxNeiLi = GetMaxNeili();
	local nCurNeiLi = GetNeili();
	local nNeiLi = nCurNeiLi + floor(nMaxNeiLi*0.4)
	ModifyNeili(min(nNeiLi,nMaxNeiLi));
	Msg2Player("H�i ph�c 40% n�i l�c");
end;