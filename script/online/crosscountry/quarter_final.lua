-- ����

-- ���������ݱ�
-- ����ֵΪ�÷�
-- ��һ����˵�����ڶ����ǳ�ʼֵ���������ǵ�ǰ��ֵ
tQUARTER_FINAL_HEAD =
{
	{"c� ph�i �� ��t ���c c�p 70                             ","return 0"					, "return ChkLevel()"	},
	{"c� ph�i �� h�c ���c k� n�ng v� c�ng c�p 55                     ","return 0"					, "return ChkLearnSkill()"	},
	{"Ho�n th�nh nhi�m v� th��ng h�i, s� l��t l�:                         ","return GetShanghuiChance()", "return GetShanghuiChance()"},
	{"Ho�n th�nh nhi�m v� Truy n�, s� l��t l�:                         ","return GetTongjiChance()"	, "return GetTongjiChance()"}, 
	{" �i�m t�ch l�y chi�n tr��ng                                 ","return GetBattlePoint()"	, "return GetBattlePoint()"},
	{"c� ph�i �� ho�n th�nh n.v ch� tuy�n Bi�n Kinh - Long H� Th�n S�n H�.        ","return 0"					, "return ChkTask(140, 59)"	},
	{"c� ph�i �� ho�n th�nh n.v ch� tuy�n Th�nh �� - Thanh phong d� kh�","return 0"					, "return ChkTask(150, 33)"	},
	{"c� ph�i �� ho�n th�nh n.v ch� tuy�n Tuy�n Ch�u, hi�u ���c ch�n t��ng?          ","return 0"					, "return ChkTask(147, 7)"	},
	{"c� ph�i �� ho�n th�nh nhi�m v� Phong �� - ��nh b�i Ng� Vi�t l�o t�  ","return 0"					, "return ChkTask(1402, 90)"	},
	{"c� ph�i �� ho�n th�nh nhi�m v� Thi�n M�n Tr�n- h�i �m cho D��ng Nghi�p        ","return 0"					, "return ChkTaskTmz()"	},
	{"c� ph�i �� ho�n th�nh n.v ch� tuy�n T�y Nam - c�n ph�n n� c�a Ng� ��c Gi�o      ","return 0"					, "return ChkTask(1316, 3)"	},
	{"Th�m l�u ph�i                                 ","return 0"					, "return GetRouteAddition()"	},
}

THE_FILE = "\\script\\online\\crosscountry\\quarter_final.lua"

function GetRouteAddition()
	local t =
	{
		[8] = 5,	-- ���ҷ��
		[9] = 10,	-- �����׼�
		[17] = 5, 	-- ǹ��
		[18] = 10, -- ����
		[20] = 10, -- а��
		[21] = 10, -- ��ʦ
	}
	local nRoute = GetPlayerRoute()
	if t[nRoute] == nil then
		return 0
	else
		return t[nRoute]
	end
end

function ChkTaskTmz()
	if GetTask(1401) == 125 or GetTask(1401) == 135 then
		return 5
	else
		return 0
	end
end

function ChkTask(nTaskid, nValue)
	if GetTask(nTaskid) >= nValue then
		return 5
	else
		return 0
	end
end

function ChkLevel()
	if GetLevel() >= 70 then
		return 5
	else
		return 0
	end
end

function ChkLearnSkill()
	t =
	{
		[2] = 31,	-- �����׼ң���Ħ�侭
		[3] = 56,	-- ������ɮ���������ָ
		[4] = 43,	-- ������ɮ��������צ��
		[6] = 73,	-- ���ţ����컨��
		[8] = 88,	-- ���ҷ�ң���ȴ���
		[9] = 101,	-- �����׼ң�����Ʈ����
		[11] = 112,	-- ؤ�ﾻ�£���ȭ
		[12] = 123, -- ؤ�����£��򹷹���
		[14] = 145, -- ����������߽ؽ�
		[15] = 158, -- ���䣬�����޼���
		[17] = 731, -- ǹ����·���ǹ
		[18] = 744, -- ��������Ӱ��
		[20] = 377, -- а����ʬ��ħ��
		[21] = 363, -- ��ʦ���Q��
		[23] = 1030,
		[29] = 1176,
		[30] = 1229,
	}
	local nRoute = GetPlayerRoute()
	if t[nRoute] == nil then
		return 0
	else
		local nRet = HaveLearnedSkill(t[nRoute])
		if nRet == nil then
			return 0
		elseif nRet == 0 then
			return 0
		else
			return 5
		end
	end
end

function GetShanghuiChance()
	local nReadyLun = CustomDataRead("yueye_shanghui")		-- �Ѿ���ɵ�����
	if nReadyLun == nil then
		nReadyLun = 0
	end
	local nLun = floor(GetTask(390) / 10)
	return nReadyLun + nLun
end

function GetShanghuiChanceDiff(nLun)
	if nLun < 0 then
		return 0
	end
	
	local nLun = floor(nLun / 10)
	if nLun >= 20 then
		nLun = 20
	end
	return nLun * 2
end

function GetBattlePoint()
	return GetTask(747)
end

function GetBattlePointDiff(nPoint)
	if nPoint < 0 then
		return 0
	end
	
	local nDiff = floor(nPoint / 10000)
	if nDiff >= 20 then
		nDiff = 20
	end
	return nDiff * 5
end

function GetTongjiChance()
	return GetTask(1108)
end

function GetTongjiChanceDiff(nChance)
	if nChance < 0 then
		return 0
	end
	
	local nDiff = floor(nChance / 20)
	if nDiff >= 20 then
		nDiff = 20
	end
	return nDiff
end

function GetCaptainIndex()
	return GetTeamMember(0)
end

function YY_SaveData(szKey, t)
	local nCount = getn(t)
	local szFormat = ""
	local szResult = ""
	local szSplit = ", "
	local nSplitLen = strlen(szSplit)
	for i=1, nCount do
		if type(t[i]) == "number" and floor(t[i]) == t[i] then
			szFormat = szFormat.."d"
			szResult = szResult..t[i]..szSplit
		elseif type(t[i]) == "number" then
			szFormat = szFormat.."f"
			szResult = szResult..t[i]..szSplit
		elseif type(t[i]) == "string" then
			szFormat = szFormat.."s"
			szResult = szResult..format("%q", t[i])..szSplit
		end
	end
	szResult = strsub(szResult, 1, strlen(szResult) - nSplitLen)
	szResult = "CustomDataSave("..format("%q", szKey)..szSplit..format("%q", szFormat)..szSplit..szResult..")"
	dostring(szResult)
end

function YY_GetData(...)
	local t = {}
	for i=1, getn(arg) do
		if tonumber(arg[i]) == nil then
			t[i] = arg[i]
		else
			t[i] = tonumber(arg[i])
		end
	end
	return t
end

-- ����tQUARTER_FINAL_HEAD�����ɽ����Ľṹ
function YY_MakeQuarterFinalInfo(nType)
	local tResult = {}
	
	-- ��������ɳ�ʼ�������ݣ�����ǰ��Ч�����ݶ���Ϊ0
	if nType == 0 then
		nRow = 2
	elseif nType == 1 then
		nRow = 3
	end
	
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		tResult[i] = dostring(tQUARTER_FINAL_HEAD[i][nRow])
	end
	return tResult
end

function qf_team_operation()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	
	local szSay = "Ng��i mu�n ti�n h�nh thao t�c n�o?"
	local t =
	{
		"b�o danh tr�n b�n k�t./qf_signup",
	}
	if szCaptainName ~= nil then
		tinsert(t, 2, "Tra xem �� c�ng hi�n c�a m�nh./qf_offer")
		if szCaptainName == "" then
			tinsert(t, 3, "Tra xem k�t qu�/queue_member_status")
			tinsert(t, 4, "Tra xem t�ng �i�m chi�n ��i./refer_point")
		end
	end
	tinsert(t, getn(t)+1, "R�i kh�i/end_say")
	Say(szSay, getn(t), t)
end

function qf_offer()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil then
		Talk(1, "", "Ch� c� th�nh vi�n chi�n ��i m�i l�m ���c.")
		return
	end
	
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	nPoint = CountPoint(tDiff)
	local szSay = "chi�n ��i c�a b�n, �� c�ng hi�n l�: <color=yellow>["..nPoint.."]<color> �i�m\n(c� th� �� c�ng hi�n chi�n ��i nhi�u h�n so v�i th�c t� do s� sai bi�t th�i gian t�nh to�n)"
	Say(szSay, 2, "Tra xem t�nh h�nh chi�n ��i./show_detail", "R�i kh�i/end_say")
end

function show_detail()
	local szShow = ""
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	
	for i=1, 6 do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." �i�m: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,2,"Trang k�/next_page","R�i kh�i/end_say")
end

function next_page()
	local szShow = ""
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	
	local nCount = getn(tQUARTER_FINAL_HEAD)
	for i=7, nCount do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." �i�m: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,2,"Trang tr��c/show_detail","R�i kh�i/end_say")
end

function queue_member_status()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil or szCaptainName ~= "" then
		Talk(1, "", "Ch� c� ��i tr��ng chi�n ��i m�i c� th� l�m thao t�c n�y.")
	end
	
	local szSay = "B�n mu�n xem tin t�c th�nh vi�n n�o?"
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	for i=1, getn(tMember) do
		tMember[i] = tMember[i].."/#show_member_status("..i..")"
	end
	tinsert(tMember, getn(tMember) + 1, "R�i kh�i/end_say")
	Say(szSay, getn(tMember), tMember)
end

function refer_point()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil or szCaptainName ~= "" then
		Talk(1, "", "Ch� c� ��i tr��ng chi�n ��i m�i c� th� l�m thao t�c n�y.")
	end
	
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local nPoint = 0
	for i=1, getn(tMember) do
		local tMemberResult = YY_GetData(CustomDataRead(tMember[i]))
		nPoint = nPoint + CountPoint(tMemberResult)
	end
	-- ����
	AddRelayShareData("yueye", 0, 0, THE_FILE,
						"AddShareDataCallBack", 2, GetName(), "d", nPoint)
	-- ���̣��������ݺ�relay��һ�µ�
	SaveNow()
	Say("B�n �� c�p nh�t th�nh c�ng �i�m chi�n ��i ��i m�nh, h�y tra xem tin t�c m�i nh�t v� th� h�ng chi�n ��i c�a b�n.", 0)
end

function show_member_status(index)
	local szShow = ""
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local tDiff = YY_GetData(CustomDataRead(tMember[index]))
	local nPoint = CountPoint(tDiff)
	szShow = "T�ng �i�m: <color=yellow>"..nPoint.."<color>\n"
	for i=1, 6 do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." �i�m: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,3,"Trang k�/#member_next_page("..index..")","tr� l�i/queue_member_status", "R�i kh�i/end_say")
end

function member_next_page(index)
	local szShow = ""
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local tDiff = YY_GetData(CustomDataRead(tMember[index]))
	for i=7, getn(tQUARTER_FINAL_HEAD) do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." �i�m: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,3,"Trang tr��c/#show_member_status("..index..")","tr� l�i/queue_member_status", "R�i kh�i/end_say")
end

function qf_signup()
	if check_can_signup() ~= 1 then
		return
	end
	
	local nSize = GetTeamSize()
	local szSay = "Chi�n ��i c�a b�n �� th�a �i�u ki�n b�o danh,"
	if nSize < 8 then
		szSay = szSay.."<color=red>s� th�nh vi�n 1 chi�n ��i t�i �a l� 8 ng��i, hi�n �� c�"..nSize.." th�nh vi�n<color>, b�n c� ��ng � b�o danh kh�ng?"
	else
		szSay = szSay.."B�o danh ch�?"
	end
	
	Say(szSay, 3, "Tra xem danh s�ch th�nh vi�n/show_member_list", "\n��ng � b�o danh\n\n/confirm_signup", "�� ta suy ngh�!/end_say")
end

function show_member_list()
	-- ���ɶ�Ա��Ϣ
	local nSize = GetTeamSize()
	local nCount = 1
	tMember = {}
	szMemberInfo = "��i tr��ng:<color=yellow>"..GetName().."<color>"
	local nOldPlayer = PlayerIndex
	for i=1, nSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 and PlayerIndex ~= GetCaptainIndex() then
			szMemberInfo = szMemberInfo.."\nTh�nh vi�n"..nCount..":<color=green>"..GetName().."<color>"
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldPlayer
	Talk(1, "qf_signup", szMemberInfo)
end

function check_can_signup()
	-- ������ǲ��е�
	local nResult = 1
	if GetTeamSize() < 1 then
		Say("Ch� c� l�p t� ��i m�i c� th� tham gia tr�n b�n k�t.", 2, "Li�n quan t�o l�p t� ��i./about_quarter_final_team", "R�i kh�i/end_say")
		return 0
	end
	
	-- ���Ƕӳ��ǲ��е�
	if PlayerIndex ~= GetCaptainIndex() then
		Say("Ch� c� ��i tr��ng m�i c� th� b�o danh", 2, "Li�n quan t�o l�p t� ��i./about_quarter_final_team", "R�i kh�i/end_say")
		return 0
	end
	
	-- �ӳ����Ǳ����ʺţ�û����ɳ����ǲ��е�
	if GetTask(1785) == 0 then
		Say("��i tr��ng ph�i l� t�i kho�n tham gia ch�y b� ��ng th�i ��ng c�p ph�i t� 30 tr� l�n m�i c� th� tham gia b�o danh.", 2, "Li�n quan t�o l�p t� ��i./about_quarter_final_team", "R�i kh�i/end_say")
		return 0
	end
	
	-- ��Ա���Ѿ��齨��������߲μӹ���������ǲ��е�
	local nOldPlayer = PlayerIndex
	local szMsg = ""
	local szSplit = ","
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nRet = CustomDataRead("yueye_is_join_team")
		if nRet ~= nil then
			nResult = 0
			szMsg = szMsg.."<color=yellow> "..GetName().."<color>"..szSplit
		end
	end
	PlayerIndex = nOldPlayer
	if nResult == 0 then
		szMsg = strsub(szMsg, 1, strlen(szMsg) - strlen(szSplit))
		szMsg = szMsg.."B�n �� l� th�nh vi�n c�a chi�n ��i kh�c, kh�ng th� t�o l�p t� ��i m�i."
		PlayerIndex = nOldPlayer
		Say("<color=green>S� gi� vi�t d�<color>:"..szMsg, 0)
	end
	return nResult
end

function qf_get_award()
	-- ����ս��������ǲ��е�
	local isCaptain = 0
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil then
		Say("Ch� c� th�nh vi�n chi�n ��i m�i c� th� nh�n ph�n th��ng.", 0)
		return
	elseif szCaptainName ~= "" then		-- ��Ա
		-- ������ǲ��е�
		if GetTeamSize() < 1 then
			Say("Ch� c� t� ��i c�ng v�i ��i tr��ng chi�n ��i m�i c� th� nh�n ph�n th��ng.", 0)
		end
		-- �ӳ�����ս�Ӷӳ��ǲ��е�
		local nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		if PlayerIndex <= 0 then
			return 0
		end
		if szCaptainName ~= GetName() then
			Say("Ch� c� t� ��i c�ng v�i ��i tr��ng chi�n ��i m�i c� th� nh�n ph�n th��ng.", 0)
			return 0
		end
		PlayerIndex = nOldPlayer
	else
		isCaptain = 1
	end
	
	-- ����������ǲ��е�
	local nDateNow = tonumber(date("%j"))
	if nDateNow <= nDate then
		Say("H�m nay b�n �� nh�n ph�n th��ng.", 0)
		return 0
	end
	
	-- ok��������ȡ������
	local nReputation = 50
	ModifyReputation(nReputation, 0)
	Talk(1,"", "B�n nh�n ���c "..nReputation.." �i�m danh v�ng. \n�i�m t�ch l�y tr�n b�n k�t c�a b�n �� chuy�n ��n ��i tr��ng.")
	WriteLog("Tr�i Vi�t d� "..GetName().."�� nh�n ph�n th��ng ng�y: "..nReputation.." �i�m danh v�ng"..date("%H%M"))
	-- ��¼������ȡ����
	CustomDataSave("yueye_is_join_team", "sd", szCaptainName, nDateNow)
	
	-- ���ܻ���
	local nDiffDate = nDateNow - nDate
	qf_point_collect(nDiffDate, isCaptain)
end

function confirm_signup()
	if check_can_signup() ~= 1 then
		return
	end
	local nDate = tonumber(date("%j"))
	
	-- �ӳ���¼������Ϣ
	local nOldPlayer = PlayerIndex
	local szCaptainName = GetName()
	local nCount = 1
	local tMemberInfo = {}
	local tResult = {}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			tMemberInfo[i] = GetName()
			if PlayerIndex ~= GetCaptainIndex() then
				-- �Ƿ��Ѿ��齨��ս�ӣ����ڴ���Ŀ��ʾ�Ѿ��齨��ս��
				-- ��Ա��¼�ӳ����֣��ٺ����ϴ���ȡ����Ʒ��ʱ��
				CustomDataSave("yueye_is_join_team", "sd", szCaptainName, nDate-1)
				
				tResult[nCount] = YY_MakeQuarterFinalInfo(0)
				-- ÿ�������ϼ�¼����������ʼʱ��������
				YY_SaveData("yueye_quarter_final_default", tResult[nCount])
				YY_SaveData("yueye_quarter_final_last", tResult[nCount])
				nCount = nCount + 1
			end
		end
	end
	PlayerIndex = nOldPlayer
	
	-- �Ƿ��Ѿ��齨��ս�ӣ����ڴ���Ŀ��ʾ�Ѿ��齨��ս�ӣ��ӳ����ü�¼�Լ�������
	CustomDataSave("yueye_is_join_team", "sd", "", nDate-1)
	YY_SaveData("yueye_all_member_name", tMemberInfo)
	-- �ӳ�����ҲҪ��¼�Լ��ڸ���������ʼʱ��������
	local tSelf = YY_MakeQuarterFinalInfo(0)
	YY_SaveData("yueye_quarter_final_default", tSelf)
	YY_SaveData("yueye_quarter_final_last", tSelf)
	
	-- �ӳ����ϼ�¼���ж�Ա(�����Լ�)�ĸ�������������(�������Ժ�仯������)
	local tMemberResult = {}
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		tMemberResult[i] = 0
	end
	for i=1, getn(tMemberInfo) do
		YY_SaveData(tMemberInfo[i], tMemberResult)
	end
	show_signup_result()
	-- ���̴���
	nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			SaveNow()
		end
	end
	PlayerIndex = nOldPlayer
end

function show_signup_result()
	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= GetCaptainIndex() then
			local szCaptainName = CustomDataRead("yueye_is_join_team")
			local szMsg = "B�n �� th�nh c�ng gia nh�p <color=green>"..szCaptainName.."<color> chi�n ��i."
			Talk(1, "", szMsg)
		else
			local t = YY_GetData(CustomDataRead("yueye_all_member_name"))
			local szMsg = "B�n �� th�nh c�ng t�o l�p chi�n ��i, th�nh vi�n l�:"
			for i=1, getn(t) do
				szMsg = szMsg.."\n"..i..":<color=green>"..t[i].."<color>"
			end
			Talk(1, "", szMsg)
		end
	end
end

function CalcResult(nScale, tNow, tLast)
	local tResult = {}
	
	for i=1, getn(tLast) do
		tResult[i] = tonumber(tNow[i]) - tonumber(tLast[i])
	end

	-- ���ݻ��ֹ��������
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		if i == 3 then		-- �̻�
			tResult[i] = GetShanghuiChanceDiff(tResult[i])
		elseif i == 4 then	-- ͨ��
			tResult[i] = GetTongjiChanceDiff(tResult[i])
		elseif i == 5 then	-- ս��
			tResult[i] = GetBattlePointDiff(tResult[i])
		end
		tResult[i] = tResult[i] * nScale
	end
	return tResult
end

function Add2Table(t1, t2)
	local tResult = {}
	for i=1, getn(t1) do
		tResult[i] = tonumber(t1[i]) + tonumber(t2[i])
	end
	return tResult
end

function qf_point_collect(nDiffDate, isCaptain)
	local nScale = 1
	if nDiffDate > 5 then
		nScale = 0.8
	end
	
	-- �����ֵ
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tLast = YY_GetData(CustomDataRead("yueye_quarter_final_last"))
	local tDiff = CalcResult(nScale, tNow, tLast)
	
	-- �����ڵĽ�����������������´����ֵ
	YY_SaveData("yueye_quarter_final_last", tNow)
	
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		local t = YY_GetData(CustomDataRead(szName))
		tDiff = Add2Table(t, tDiff)
		YY_SaveData(szName, tDiff)
	end
	PlayerIndex = nOldPlayer
	
	if isCaptain == 1 then	-- �ӳ����������ݴ����������а�
		local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
		local nPoint = 0
		for i=1, getn(tMember) do
			local tMemberResult = YY_GetData(CustomDataRead(tMember[i]))
			nPoint = nPoint + CountPoint(tMemberResult)
		end
		-- ����
		AddRelayShareData("yueye", 0, 0, THE_FILE,
							"AddShareDataCallBack", 2, GetName(), "d", nPoint)
		-- ���̣��������ݺ�relay��һ�µ�
		SaveNow()
	end
end

function qf_rank()
	ApplyRelayShareData("yueye", 0, 0, THE_FILE, "ApplyCallBack")
end

function ApplyCallBack(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Talk(1,"","Hi�n t�i cu�c �ua vi�t d� v�n ch�a x�p h�ng.")
		return
	end
	
	local nRankCount = 0
	if nCount > 10 then
		nRankCount = 10
	else
		nRankCount = nCount
	end
	
	-- ���ΰ���û�취��Say,Talk��������ȫ��ʾ10��������ֻ��������
	CustomDataSave("yueye_rank_count", "d", nRankCount)
	for i=1, nRankCount do
		local t = YY_GetData(GetRelayShareDataByIndex(szKey, nKey1, nKey2, i - 1))
		YY_SaveData("yueye_rank"..i, t)
	end
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName ~= nil then
		if szCaptainName == "" then
			szCaptainName = GetName()
		end
		local nMySortType, szMyName, nMyPoint, nMyRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, szCaptainName)
		if nMySortType ~= nil then
			CustomDataSave("yueye_rank_mine", "sdd", szMyName, nMyPoint, nMyRank)
		else
			CustomDataSave("yueye_rank_mine", "sdd", "", 0, 0)
		end
	end
	
	-- �����Relay��������ʱ�仯�ģ�����Ҫɾ��Gamesvr��ߵĸ�����¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
	show_rank_data(1)
end

function show_rank_data(index)
	local szResult = "Th� h�ng�i�m s� t�n ��i tr��ng"
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	local nRankCount = CustomDataRead("yueye_rank_count")
	if index > nRankCount then
		return
	end
	
	local nCount = index + 5	-- һҳ��ʾ6������
	if nCount > nRankCount then
		nCount = nRankCount
	end
	
	if szCaptainName == nil	then		-- ·�˿������
		for i=index, nCount  do
			local nSortType, szName, nPoint = CustomDataRead("yueye_rank"..i)
			szResult = szResult..format("\n%6d%12d        %s", i, nPoint, szName)
		end
	else
		-- �ӳ��Լ��鿴
		if szCaptainName == "" then
			szCaptainName = GetName()
		end
		
		for i=index, nCount do
			local nSortType, szName, nPoint = CustomDataRead("yueye_rank"..i)
			if szCaptainName == szName then
				szResult = szResult..format("\n<color=yellow>%6d%12d        %s<color>", i, nPoint, szName)
			else
				szResult = szResult..format("\n%6d%12d        %s", i, nPoint, szName)
			end
		end
		local szMyName, nMyPoint, nMyRank = CustomDataRead("yueye_rank_mine")
		if szMyName ~= "" then
			szResult = szResult.."\nChi�n ��i <color=green>["..szMyName.."]<color>, �i�m t�ch l�y chi�n ��i l� <color=yellow>["..nMyPoint.."]<color>, x�p h�ng <color=yellow>["..(nMyRank + 1).."]<color>"
		else
			szResult = szResult.."\n<color=yellow>Chi�n ��i c�a b�n v�n ch�a ��a �i�m t�ch l�y, t�m th�i v�n ch�a x�p h�ng<color>"
		end
	end
	
	if index + 5 < nRankCount then
		Say(szResult, 2, "Trang k�/#show_rank_data(7)", "R�i kh�i/end_show_rank")
	else
		Say(szResult, 1, "R�i kh�i/end_show_rank")
	end
end

function end_show_rank()
	local nRankCount = CustomDataRead("yueye_rank_count")
	CustomDataRemove("yueye_rank_count")
	CustomDataRemove("yueye_rank_mine")
	for i=1, nRankCount do
		CustomDataRemove("yueye_rank"..i)
	end
end

function CountPoint(t)
	local nResult = 0
	for i=1, getn(t) do
		if t[i] ~= nil and t[i] >= 0 then
			nResult = nResult + t[i]
		end
	end
	return floor(nResult + 0.5)
end

function about_quarter_final_team()
	local szSay = "1. M�i chi�n ��i t�i �a 8 th�nh vi�n, kh�ng h�n ch� m�n ph�i. \n2. ��i tr��ng chi�n ��i c�n ph�i l� t�i kho�n chuy�n d�ng cho thi ��u, ��i tr��ng ho�n th�nh v�ng s� lo�i ph�i ��t ���c t� c�p 30 tr� l�n, th�nh vi�n chi�n ��i c� th� s� d�ng t�i kho�n kh�ng thi ��u tham gia thi ��u. \n3. T� tr�n b�n k�t tr� �i, ��i tr��ng chi�n ��i t� ��i th�nh vi�n c�a t� ��i m�nh, g�p NPC vi�t d� ti�n h�nh b�o danh. L�c �� NPC vi�t d� s� b�o cho b�n bi�t s� th�nh vi�n c� v��t qu� quy ��nh 8 ng��i kh�ng. \n4. Sau khi b�o danh th�nh c�ng, chi�n ��i kh�ng th� ti�p nh�n th�m th�nh vi�n m�i, ��ng th�i th�nh vi�n trong chi�n ��i c�ng kh�ng th� tham gia chi�n ��i kh�c."
	Say(szSay, 0)
end

function end_say()

end