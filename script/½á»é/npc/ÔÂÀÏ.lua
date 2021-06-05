Include("\\script\\���\\marriage_head.lua");

CALLBACK_FILE		= "\\script\\���\\npc\\����.lua"		-- �ص��ļ���
MATE_TITLE			= 
{
	[1] = "Th� t�",
	[2] = "Tr��ng phu"
}
ITEM_LETTER			= {2, 1, 535}		-- ����
g_InfoHeader = "<color=green>Nguy�t L�o<color>:";

function main()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	--ȷ����ҵ����ʱ��Relayû崻�����������֤������
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."H�n l� �� k�t th�c, xin h�i ng��i ph�c v�.");
		return 0;
	end;
	if GetMateName() == "" and GetTask(TASK_MARRYDATE) ~= 0 then
		Talk(1,"",g_InfoHeader.."B�n �� ���c t� do");
		clear_marriage_info(0);
		return 0;
	end;
	if (is_married(PlayerIndex) == 1) then
		local caption = nil
		if (GetSex() == 1) then
			caption = "B�ng h�u ��n t�m l�o c� vi�c g� kh�ng?"
		else
			caption = "C� n��ng ��n t�m l�o c� vi�c g� kh�ng?"
		end
		Say(g_InfoHeader..caption,
			2,
			"Ta mu�n h�y b� h�n ��c/divorce_talk",
			"Kh�ng c� vi�c g�/cancel")
		return
	elseif GetTask(TASK_WEDDING_LOVER) == 0 then
		hint_step(1)
		Talk(1, "", g_InfoHeader.."N�u �ng t� b� nguy�t �� se duy�n k�t ch�, ng��i c�ng � trung nh�n ��n D��ng Ch�u g�p b� mai �� lo vi�c h�n s�.")
		return
	end
	
	if (check_bride_condition() == 1) then
		Say(g_InfoHeader.."H�n nh�n l� chuy�n ��i s�, 2 ng��i �� ngh� k� ch�a?", 2,
			"Hai ta �� quy�t ��nh r�i/do_marry",
			"�� suy ngh� th�m./cancel")
	end
end

function do_marry()
	if get_wedding_stat() ~= 1 then
		Talk(1,"",g_InfoHeader.."��i khi t�m ���c s�n kh�u k�t h�n, ta s� gi�p 2 ng��i th�nh h�n");
		return 0;
	end;
	if (check_bride_condition() == 1) then
		Talk(1, "", g_InfoHeader.."H�i xem c� n��ng �y c� mu�n k�t h�n v�i ng��i kh�ng? C� 2 c�ng ��ng � m�i ���c.")
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			format(g_InfoHeader.."C� n��ng n�y, v� thi�u hi�p %s ��y mu�n c�ng c� th�nh h�n, c� ��ng � kh�ng?", GetName(PlayerIndex)),
			2,
			"��ng �/agree_marriage",
			"Kh�ng ��ng �/disagree_marriage")
	end
end

function agree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)
	
		marriage_setting();

		hint_step(6)
		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."N�u c�c ng��i mu�n ti�p nh�n <color=yellow>Nhi�m v� phu th� <color> hay h�c <color=yellow>K� n�ng h�n nh�n<color> th� ��n<color=yellow>Th�nh D��ng Ch�u<color> t�m <color=green>X�o n�<color>, c� ta � g�n <color=green>B� mai<color>. "
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

function disagree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)

		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."Xem ra t�m � c�a c�c ng��i v�n ch�a t��ng th�ng, suy ngh� k� r�i h�y ��n g�p ta."
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

-- ��������Ƿ�����������
function check_bridegroom_condition()
	-- �����з����ӳ�
	if (GetTeamSize() ~= 2 or GetCaptainName() == GetName()) then
		Talk(1, "", g_InfoHeader.."Hai ng��i c�ng t� ��i do b�n nam l�m ��i tr��ng ��n g�p ta �� xin k�t h�n.")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."Ng��i �� l� ng��i k�t h�n sao l�i c�n ong b��m nh� v�y")
	elseif (GetSex(lover) ~= 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Xem ra c�c ng��i nh�n l�n r�i, Nguy�t L�o n�y ch� gi�p c�c ng��i n�n phu th�, nh�ng c�i kh�c kh�ng ph�i vi�c c�a ta.")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."D�y t� h�ng ch�a li�n k�t ng��i v�i v� thi�u hi�p ��.")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."D�y t� h�ng ch�a li�n k�t ng��i v�i c� n��ng ��.")
	else
		return 1
	end
	return 0
end

-- ����Ƿ�����������
function check_bride_condition()
	-- �����з����ӳ�
	if GetSex() == 2 then
		Talk(1, "", g_InfoHeader.."C� n��ng ��n t�m l�o c� vi�c g� kh�ng?")
		return 0;
	end;
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", g_InfoHeader.."��a � trung nh�n ��n g�p ta.")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."Ng��i �� l� ng��i k�t h�n sao l�i c�n ong b��m nh� v�y")
	elseif (GetSex(lover) == 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Xem ra c�c ng��i nh�n l�n r�i, Nguy�t L�o n�y ch� gi�p c�c ng��i n�n phu th�, nh�ng c�i kh�c kh�ng ph�i vi�c c�a ta.")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."C� n��ng ��y v�i ng��i ch�a ���c �ng t� b� nguy�t k�t ch� se duy�n")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."D�y t� h�ng �� bu�c ng��i v� c� n��ng ��")
	else
		return 1
	end
	return 0
end

-- ���
function divorce_talk()
	local seperation_date = GetTask(TASK_SEPERATION_DATE)
	if (seperation_date ~= 0) then
		seperation_divorce(seperation_date, lover)
	else
		-- ֱ�����
		direct_divorce()
	end
end

-- �־����
function seperation_divorce(seperation_date, lover)
	local day = seperation_date
	for i = 1, INTERVAL_SEPERATION do
		day = next_date(day)
	end
	if (curr_date() >= day) then
		-- ��������
		Say(g_InfoHeader.."�� 7 ng�y r�i, suy ngh� k� ch�a? Ng��i mu�n chia tay hay gi�i h�a ��y?",
			5,
			"Chia tay/part",
			"Gi�i h�a/reconcile_confirm",
			"Ta kh�ng ��i ���c n�a, ta mu�n ly h�n./direct_divorce_letter",
			"T�nh c�m c�a ta �� r�n n�c r�i/direct_divorce_estrangement",
			"�� ta suy ngh� l�i/cancel")
	else
		-- ��û������
		Say(g_InfoHeader.."V�n ch�a h�t 7 ng�y, c�c ng��i suy ngh� th�m �i.",
			4,
			"Gi�i h�a/reconcile_confirm",
			"Ta kh�ng ��i ���c n�a, ta mu�n ly h�n./direct_divorce_letter",
			"T�nh c�m c�a ta �� r�n n�c r�i/direct_divorce_estrangement",
			"H�y b�/reconcile_cancel")
	end
end

-- �־Ӹ���ȷ��
function reconcile_confirm()
	-- �־����������
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		if (GetSex() == 1) then
			Talk(1, "", g_InfoHeader.."Ng��i v� th� t� c�ng t� ��i ��n g�p ta")
		else
			Talk(1, "", g_InfoHeader.."Ng��i v� phu qu�n c�ng t� ��i ��n g�p ta")
		end
	else
		SetTask(TASK_SEPERATION_DATE, 0)
		SetTask(TASK_SEPERATION_DATE, 0,  0, lover)
		Talk(1, "", g_InfoHeader.."Ta �� h�n g�n c�c ng��i l�i, t� nay ta kh�ng mu�n c�c ng��i ��n g�p ta �� ly h�n n�a. Ch�c 2 ng��i b�ch ni�n giai l�o!")
	end
end

-- �־Ӹ���ȡ��
function reconcile_cancel()
	Talk(1, "", g_InfoHeader.."Kh�ng mu�n gi�i h�a �? V�n ch�a h�t 7 ng�y, ng��i suy ngh� th�m �i nh�!")
end

-- ����
function part()
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		Talk(1, "", g_InfoHeader.."Ng��i v�" .. MATE_TITLE[GetSex()] .. "t� ��i v�i nhau r�i ��n g�p ta")
		return
	end
	Talk(1, "", g_InfoHeader.."V�n mu�n ly h�n �? ���c," .. MATE_TITLE[GetSex()])

	-- ѯ����ż
	SetPlayerScript(CALLBACK_FILE, lover)
	Say2SomeOne(lover, g_InfoHeader.."Ng��i v�n mu�n ly h�n �?",
		2,
		"��ng �/agree_part",
		"H�y b�/disagree_part")
end

-- ͬ�����
function agree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		UnMarry()
		local caption = g_InfoHeader.."C�c ng��i �� h�y b� h�n ��c, t� nay ���ng ai n�y �i!"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
		clear_marriage_info(3);	--�־�7������
	end
end

-- ��ͬ�����
function disagree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		Talk2SomeOne(lover,
			1, "", g_InfoHeader.."Hai ng��i v�n ch�a th�ng nh�t � ki�n, suy ngh� th�m �i nh�.")			
	end
end

-- ֱ�����
function direct_divorce()
	Say(g_InfoHeader.."H�y b� h�n ��c? Ng��i suy ngh� k� ch�a?",
		2,
		"��ng �/direct_divorce_option",
		"H�y b�/cancel")
end

-- ֱ�����ѡ��
function direct_divorce_option()
	Say(g_InfoHeader.."Mu�n ly h�n �? �� th� th� ta c�ng kh�ng c�n c�ch n�o. H�y ��n Ng� c�c mua 1 t� <color=yellow>Gi�y ly h�n<color> x�c nh�n c�c ng��i �� kh�ng c�n t�nh c�m. Ly h�n tr� ��ng T�m c�a c�c ng��i s� b� tr� <color=red>50<color> �i�m.",
		4,
		"Ta �� c� gi�y ly h�n!/direct_divorce_letter",
		"T�nh c�m c�a ta �� r�n n�c r�i/direct_divorce_estrangement",
		"Ch�ng t�i �� ��n/direct_divorce_team",
		"�� ta suy ngh� l�i/cancel")
	-- TODO: here
end

-- ����
function direct_divorce_letter()
	if (GetItemCount(ITEM_LETTER[1], ITEM_LETTER[2], ITEM_LETTER[3]) == 0) then
		Talk(1, "", g_InfoHeader.."Kh�ng c� gi�y ly h�n l�m sao ly h�n? ��n {Ng� c�c} mua r�i quay l�i ��y!")
	else
		Say(g_InfoHeader.."Ng��i quy�t ��nh ly h�n th� ta c�ng kh�ng c�n c�ch n�o, nh�ng �� h�o c�m s� gi�m xu�ng = 0! Suy ngh� k� ch�a?",
			2,
			"��ng �/direct_divorce_letter_confirm",
			"H�y b�/cancel")
	end
end

-- ���
--nType:0����ż�����Լ���������飬1��ֱ����飬2��ͬ��ֵС��50��飬3�Ƿ־�7������
function divorce(nType)
	UnMarry()
	SetTask(TASK_LOVEGRADE, 0)
	if (GetSex() == 1) then
		Talk(1, "",
			g_InfoHeader.."Ng��i �� ly h�n, �� ta th�ng b�o v�i n��ng t� tr��c c�a ng��i")
	else
		Talk(1, "",
			g_InfoHeader.."Ng��i �� ly h�n, �� ta th�ng b�o v�i v� phu qu�n tr��c c�a ng��i.")
	end
	clear_marriage_info(nType);
end

function clear_marriage_info(nType)
	local szTaskInfo = "";
	for i=2000,2029 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
	end;
	clear_task();
	ma_skill_remove()
	WriteLog("[K�t h�n]:"..GetName().."Bi�n l��ng nhi�m v� tr��c li h�n:"..szTaskInfo);
	WriteLog("[K�t h�n]:"..GetName().."Li h�n r�i, lo�i li h�n:"..tostring(nType));
end;

-- ����ȷ��
function direct_divorce_letter_confirm()
	local genre = ITEM_LETTER[1]
	local detail = ITEM_LETTER[2]
	local particular = ITEM_LETTER[3]
	if (GetItemCount(genre, detail, particular) > 0) then
		DelItem(genre, detail, particular, 1)
		divorce(1)
	end
end

-- ��������
function direct_divorce_estrangement()
	if (GetTask(TASK_LOVEGRADE) > 50) then
		Talk(1, "", g_InfoHeader.."Ta th�y 2 ng��i v�n c�n t�nh c�m, h�y suy ngh� l�i �i.")
	else
		Say(g_InfoHeader.."Ly h�n �� h�o c�m c�a c�c ng��i s� = 0. C�c ng��i suy ngh� k� �i",
			2,
			"��ng �/#divorce(2)",
			"H�y b�/cancel")
	end
end

-- ������
function direct_divorce_team()
	local count = GetTeamSize()
	local title = MATE_TITLE[GetSex()]
	if (count == 0) then
		Talk(1, "", g_InfoHeader.."Th�i gian s� d�ng" .. title .. "� ��u, sao ta kh�ng th�y")
	elseif (count > 2) then
		Talk(1, "", g_InfoHeader.."Chuy�n nh� th� n�y �� ng��i kh�c lo, ng��i v�" .. title .. "2 ng��i l�i ��y.")
	else
		local lover = get_team_lover(PlayerIndex)
		if (GetName(lover) ~= GetMateName()) then
			Talk(1, "", g_InfoHeader.."Th�i gian s� d�ng" .. title .. "� ��u, sao ta kh�ng th�y")
		else
			Say(g_InfoHeader.."C�c ng��i quy�t ��nh ly h�n �?",
				2,
				"��ng �/direct_divorce_team_confirm",
				"H�y b�/cancel")
		end
	end
end

-- ������ȷ��
function direct_divorce_team_confirm()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		Talk(1, "", g_InfoHeader.."Ta h�i ng��i" .. MATE_TITLE[GetSex()])
	
		-- ѯ����ż
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover, g_InfoHeader.."Ng��i ��ng � ly h�n ch�?",
			2,
			"��ng �/agree_seperation",
			"H�y b�/disagree_part")
	end
end

-- ͬ��־�
function agree_seperation()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		local day = curr_date()
		SetTask(TASK_SEPERATION_DATE, day,  0, lover)
		SetTask(TASK_SEPERATION_DATE, day)

		local caption = g_InfoHeader.."Ta cho c�c ng��i th�m <color=yellow>7 ng�y<color> �� suy ngh�, sau �� ��n g�p ta. N�u l�c �� c�c ng��i v�n quy�t ��nh ly h�n th� ta c�ng kh�ng c�n c�ch n�o"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
	end
end
--�峤��2007-05-28������鼼��ɾ��
function ma_skill_remove()
	for i = 865,867 do
		if GetSkillLevel(i) ~= 0 then
			RemoveSkill(i)
		end
	end
	return
end
