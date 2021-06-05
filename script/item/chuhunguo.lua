Include("\\script\\global\\mate_head.lua");

tChuHunGuo = 
{
	[1] = {2, 1, 555,"Xu�t h�n qu�"},
	[2] = {2, 1, 545,"��i xu�t h�n qu�"},
}

function OnUse(item)
	if GetFollower() ~= 0 then	--�������и���NPC����ȷ��ɾ��
		local selTab = {
					"��ng �/#confirm_use("..item..")",
					"H�y b�/nothing",
					}
		Say("Tr��c khi d�ng Xu�t H�n Qu�,<color=red>ngo�i thi th� ra th� nh�ng k� �i theo s� b� bi�n m�t<color>. Quy�t ��nh d�ng Xu�t H�n Qu� ch�?",getn(selTab),selTab);
	else
		confirm_use(item);
	end;
end

function confirm_use(item)
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","B�n s� d�ng kh�ng thu�c b�t c� lo�i Xu�t H�n Qu� n�o.");
		return 0;
	end;
	KillFollower();
	local selTab = {
				"��ng �/#confirm_use_final("..item..")",
				"H�y b�/nothing",
				}
	Say("    Khi ph�i ng�u kh�ng � tr�n m�ng c� th� d�ng <color=yellow>"..tChuHunGuo[nType][4].."<color> �� t�ch l�y kinh nghi�m cho ��i ph��ng, c� t�c d�ng trong v�ng <color=yellow>2<color> ti�ng. Trong v�ng 2 ti�ng �� to�n b� kinh nghi�m �� ���c t�ch l�y s� chuy�n h�a th�nh Li�n L� Qu�, n�u t�ng Li�n L� Qu� cho b�ng h�u , h� s� c�ng h��ng kinh nghi�m khi c�ng ��mh qu�i, nh�ng <color=red>n�u b�ng h�u c�a b�n ��ng nh�p tr� ch�i trong l�c b�n d�ng Xu�t H�n Qu�, th� Xu�t H�n Qu� s� l�p t�c m�t t�c d�ng, kinh nghi�m t�ch l�y ���c s� bi�n th�nh Li�n L� Qu�<color>.<enter> N�u ��ng nh�p l�i c� th� s� b� m�t c�ng h��ng, nh�ng kh�ng l�m �nh h��ng ��n kinh nghi�m t�ch l�y.<enter> "..tChuHunGuo[nType][4].."Trong qu� tr�nh ph�t huy t�c d�ng n�n ch�a <color=green>1 � tr�ng v� 1 �i�m s�c l�c<color> �� ��t Li�n L� qu� v�o. B�n mu�n s� d�ng kh�ng?",getn(selTab),selTab);
end;

function confirm_use_final(item)
	local mate = GetMateName()
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","B�n s� d�ng kh�ng thu�c b�t c� lo�i Xu�t H�n Qu� n�o.");
		return 0;
	end;
	
	if DelItemByIndex(item, 1) == 1 then
		-- ʹ����������
		local npc = SummonNpc("Ho�t ��ng Ng��i V� h�nh", mate)
		npc = GetFollower();	--�������洴��ʧ����Ҳ����ǰ����NPC���һ��Ч��
		SetCurrentNpcSFX(npc, SFX_DOLL, 1, 1)
		ActivateDoll(1)
		-- ����ʹ��ʱ��ͳ��������
		SetTask(TASKVAR_DOLLTIME, DOLL_TIME + DOLL_TIME_LIMIT * nType)
		SetTask(TASKVAR_DOLLEXP, 0);	--������0
		SetTask(TASK_DOLL_ACTIVE,GetTime());
		WriteLog("[K�t h�n]:"..GetName().."�� s� d�ng m�t Xu�t h�n qu� ");
	end;
end;

function check_state()
	if GetTask(TASK_LOVEGRADE) < 300 then
		Talk(1,"","Tr� ��ng t�m c�a b�n qu� th�p, t�m th�i kh�ng th� d�ng Xu�t h�n qu�. L�n h�n <color=yellow>300<color> �i�m m�i s� d�ng ���c.");
		return 0;
	end;
	local mate = GetMateName()
	if (mate == "") then
		Talk(1, "", "B�n ch�a k�t h�n kh�ng th� d�ng Xu�t h�n qu�")
		return 0;
	end;
	if (GetMateOnlineStatus() == 1) then
		Talk(1, "", format("Ph�i ng�u <color=red>%s<color> tr�n m�ng, kh�ng th� d�ng Xu�t h�n qu�", mate))
		return 0;
	end;
	if (IsDollActive() == 1) then
		Talk(1, "", "Xu�t h�n qu� c�a b�n ch�a h�t t�c d�ng kh�ng th� ti�p t�c s� d�ng")
		return 0;
	end;
end;

function get_type(nItemIdx)
	for i=1,getn(tChuHunGuo) do
		local genre,detail,particular = GetItemInfoByIndex(nItemIdx);
		if genre == tChuHunGuo[i][1] and detail == tChuHunGuo[i][2] and particular == tChuHunGuo[i][3] then
			return i;
		end;
	end;
	return 0;
end;