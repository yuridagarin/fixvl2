--author:yanjun
--date:06-12-13
--describe:����ű�
Include("\\script\\task\\prison\\jail_head.lua");
g_NpcName = " Ng�c t�t"
function main()
	local selTab = {};
	local sString = "";
	if GetPKValue() > 0 then
		tinsert(selTab,"Xem ra ph�i h�i l� th�i!/want_bail");
	else
		tinsert(selTab,"Ta ��n th�m b�ng h�u, mau ��a ta �i/#go_outside(2)");
	end;
	tinsert(selTab,"Kh�ng c� g�/nothing");
	Say("<color=green>"..g_NpcName.."<color>: �i hay �, ng��i quy�t ��nh �i.",getn(selTab),selTab);
end;

function want_bail()
	local selTab = {
				"��ng �/#go_outside(1)",
				"H�y b�/nothing",
				}
	Say("<color=green>"..g_NpcName.."<color>: H�i l� c�n <color=yellow>10 ti�n v�ng<color>, c� ti�n kh�ng?",getn(selTab),selTab);
end;

function go_outside(nType)
	CleanInteractive();
	if nType == 1 then	--����
		if Pay(100000) == 1 then
			if NewWorld(tJailOutPoint[1],tJailOutPoint[2],tJailOutPoint[3],100) == 1 then	--701��ͼ��NewWorld�������ƣ�Ҫ����Ĳ�����Ȩ�����òο�\GameSvr\maps\god_power.ini�����ļ�
				UseScrollEnable(1);	--����ʹ�ûس�
				local nPKValue = GetPKValue();
				SetZoomPKValue(nPKValue*36000);
				SetCanRestorePK(0);	--������PKֵ
				ForbidRead(0)	--������
			else	
				Earn(100000)
			end;
		else
			Talk(1,"","<color=green>"..g_NpcName.."<color>: Kh�ng ti�n m� c�ng ��i qua �i �? L�m m�t th�i gian c�a ta qu�!");
		end;
	elseif nType == 2 then	--̽���뿪��
		if NewWorld(tJailOutPoint[1],tJailOutPoint[2],tJailOutPoint[3],100) == 1 then	--701��ͼ��NewWorld�������ƣ�Ҫ����Ĳ�����Ȩ�����òο�\GameSvr\maps\god_power.ini�����ļ�
			ForbidRead(0)	--������
			UseScrollEnable(1);	--����ʹ�ûس�
		end;
	end;
end;