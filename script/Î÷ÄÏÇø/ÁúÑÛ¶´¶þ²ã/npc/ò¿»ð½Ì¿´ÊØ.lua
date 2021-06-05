Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")

function main()
	local nMapId = GetWorldPos();
	local sName = gf_GetPlayerSexName();
	if nMapId == 413 then
		Say(format("<color=green>Kh�n Th�:<color> %s mu�n v�o Xi H�a Gi�o Ng�c Gi�m?",sName),2,"Ta mu�n v�o/_entrance","Kh�ng c�n ��u/do_nothing");
	elseif nMapId == 8010 then
		Say(format("<color=green>Kh�n Th�:<color> %s mu�n t� Xi H�a Gi�o Ng�c Gi�m ra ngo�i?",sName),2,"Ta mu�n ra ngo�i/_outprison","Kh�ng c�n ��u/do_nothing");
	else
		Say("<color=green>Kh�n Th�:<color> Nh� lao l� n�i tr�ng ��a, h�y nhanh ch�ng r�i kh�i!", 0)
	end
end

function _entrance()
	if IsHaveTaskOrCanGet2(242, 246) == 1 then
		NewWorld(8010, 1605, 3212);
		SetFightState(1);
		return 1;	
	end
	Say("<color=green>Kh�n Th�:<color> Nh� lao l� n�i tr�ng ��a, h�y nhanh ch�ng r�i kh�i!", 0)
end

function _outprison()
	if IsNpcChangeModel(PIdx2NpcIdx()) == 1 then
		NpcChangeModel(PIdx2NpcIdx(),"");
		return 0;
	end
	NewWorld(413, 1861, 3305);
	SetFightState(1);
	return 1;	
end

function do_nothing()
end