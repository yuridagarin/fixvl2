---------------------------------------------------------
--	��ȡ���߾���
--	
---------------------------------------------------------
Include("\\script\\lib\\offline_head.lua")
Include("\\script\\global\\offlinelive_action.lua")
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

function offline_exchange_talk_main()
	local tbDialog = {
		"Ta mu�n d�ng th�i gian r�i m�ng �y th�c ��i l�y kinh nghi�m �y th�c c�a B�ch C�u Ho�n/get_offline_baiju",
		"Ta mu�n d�ng th�i gian r�i m�ng �y th�c ��i l�y danh v�ng �y th�c c�a L�c Th�n Ho�n/get_offline_liushen",
		"Ta mu�n d�ng th�i gian r�i m�ng �y th�c ��i l�y �� c�ng hi�n s� m�n �y th�c c�a Tam Thanh Ho�n./get_offline_sanqing",
		"Ta mu�n s� d�ng th�i gian �y th�c ��i l�y T� Linh Ho�n Ch�n Kh� �y th�c/get_offline_juling_talk",
		"R�i kh�i/no"
		};
	Say("C�c h� mu�n d�ng th�i gian �y th�c quy ��i ph�n th��ng g�?", getn(tbDialog), tbDialog)
end

function get_offline_baiju()
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	if OfflineBaijuTime <= 0 then
		Say("C�c h� kh�ng �� th�i gian �y th�c B�ch C�u Ho�n c� th� quy ��i", 0)
		return
	end
	
	local Baiju = min(GetTask(TASKVAL_BAIJUWAN), OfflineBaijuTime)
	local Baiju1 = min(GetTask(TASKVAL_BAIJUWAN1), OfflineBaijuTime)
	local Baiju2 = min(GetTask(TASKVAL_BAIJUWAN2), OfflineBaijuTime)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
	end
	
	local GiveExp = GiveExpPerMin * Baiju
	local GiveExp1 = floor(GiveExpPerMin * Baiju1 * 1.5)
	local GiveExp2 = GiveExpPerMin * Baiju2 * 2
	
	local GiveExpMax = GiveExpPerMin * OfflineBaijuTime
	
	Say("Th�i gian �y th�c B�ch C�u Ho�n c� th� quy ��i l� <color=yellow>"..OfflineBaijuTime.." ph�t (d�ng B�ch C�u Ho�n c� th� ��i l�y kinh nghi�m"..GiveExpMax..", ��i B�ch C�u Ho�n g�p 1.5 l�n kinh nghi�m, B�ch C�u Ti�n ��n g�p ��i) <color><enter>Th�i gian �y th�c B�ch C�u Ho�n d�ng �� ��i l� <color=yellow>"..Baiju.." ph�t (kinh nghi�m:"..GiveExp.." )<color><enter>Th�i gian �y th�c ��i B�ch C�u Ho�n l� <color=yellow>"..Baiju1.." ph�t (kinh nghi�m:"..GiveExp1.." )<color><enter>Th�i gian �y th�c B�ch C�u ti�n ��n l� <color=yellow>"..Baiju2.." ph�t (kinh nghi�m:"..GiveExp2.." )<color><enter>Thao t�c ��i s� kh�u tr� th�i gian �y th�c t��ng �ng c�a ng��i (n�u ch�a ��i xong, c� th� ��i l�i sau khi d�ng B�ch C�u Ho�n/��i B�ch C�u Ho�n/B�ch C�u ti�n ��n)",
		5,
		"D�ng th�i gian �y th�c B�ch C�u Ho�n �� ��i kinh nghi�m/#confirm_use_baiju(0)",
		"D�ng th�i gian ��i B�ch C�u ho�n �� ��i kinh nghi�m/#confirm_use_baiju(1)",
		"D�ng th�i gian �y th�c B�ch C�u Ti�n ��n �� ��i kinh nghi�m/#confirm_use_baiju(2)",
		"tr� l�i/offline_exchange_talk_main",
		"R�i kh�i/no"
		)
end

function confirm_use_baiju(BaijuType)
	if BaijuType == 0 then
		Say("X�c ��nh s� d�ng <color=yellow>B�ch C�u Ho�n<color> quy ��i th�nh �i�m kinh nghi�m?", 3, "��ng �/yes_get_offline_baiju", "tr� l�i/get_offline_baiju", "R�i kh�i/no")
	elseif BaijuType == 1 then
		Say("X�c ��nh s� d�ng <color=yellow>��i B�ch C�u Ho�n<color> quy ��i th�nh �i�m kinh nghi�m?", 3, "��ng �/yes_get_offline_baiju1", "tr� l�i/get_offline_baiju", "R�i kh�i/no")
	elseif BaijuType == 2 then
		Say("X�c ��nh s� d�ng <color=yellow>B�ch C�u Ti�n ��n<color> quy ��i th�nh �i�m kinh nghi�m?", 3, "��ng �/yes_get_offline_baiju2", "tr� l�i/get_offline_baiju", "R�i kh�i/no")
	end
end

function yes_get_offline_baiju()
	local Baiju = GetTask(TASKVAL_BAIJUWAN)
	if Baiju <= 0 then
		Say("C�c h� kh�ng �� th�i gian B�ch C�u Ho�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
	end
	
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("�i�m t�ch l�y kinh nghi�m c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)
	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:0("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian B�ch C�u Ho�n quy ��i th�nh c�ng <color=yellow>"..GiveExp.."<color> �i�m kinh nghi�m, kinh nghi�m t�i �a ng��i c� th� nh�n ���c l� <color=yellow>1950000000<color>, hi�n gi� kinh nghi�m c�n d� <color=yellow>"..LeftExp.."<color> �i�m ch�a ��i, n�u c� kinh nghi�m d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (B�ch C�u Ho�n/��i B�ch C�u Ho�n/B�ch C�u Ti�n ��n) �� ��i kinh nghi�m d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng B�ch C�u Ho�n ��i "..GiveExp.." �i�m kinh nghi�m")
end

function yes_get_offline_baiju1()
	local Baiju = GetTask(TASKVAL_BAIJUWAN1)
	if Baiju <= 0 then
		Say("C�c h� kh�ng �� th�i gian ��i B�ch C�u Ho�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000 * 1.5
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2) * 1.5
	end
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("�i�m t�ch l�y kinh nghi�m c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end

	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN1, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:1("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian ��i B�ch C�u Ho�n quy ��i th�nh c�ng<color=yellow>"..GiveExp.."<color> �i�m kinh nghi�m, kinh nghi�m t�i �a ng��i c� th� nh�n ���c l� <color=yellow>1950000000<color>, hi�n gi� kinh nghi�m c�n d� <color=yellow>"..LeftExp.."<color> �i�m ch�a ��i, n�u c� kinh nghi�m d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (B�ch C�u Ho�n/��i B�ch C�u Ho�n/B�ch C�u Ti�n ��n) �� ��i kinh nghi�m d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng ��i B�ch C�u Ho�n ��i "..GiveExp.." �i�m kinh nghi�m")
end

function yes_get_offline_baiju2()
	local Baiju = GetTask(TASKVAL_BAIJUWAN2)
	if Baiju <= 0 then
		Say("C�c h� kh�ng �� th�i gian B�ch C�u Ti�n ��n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000 * 2
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2) * 2
	end
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("�i�m t�ch l�y kinh nghi�m c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)
	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN2, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:2("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian B�ch C�u Ti�n ��n quy ��i th�nh c�ng<color=yellow>"..GiveExp.."<color> �i�m kinh nghi�m, kinh nghi�m t�i �a ng��i c� th� nh�n ���c l� <color=yellow>1950000000<color>, hi�n gi� kinh nghi�m c�n d� <color=yellow>"..LeftExp.."<color> �i�m ch�a ��i, n�u c� kinh nghi�m d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (B�ch C�u Ho�n/��i B�ch C�u Ho�n/B�ch C�u Ti�n ��n) �� ��i kinh nghi�m d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng B�ch C�u Ti�n ��n ��i "..GiveExp.." �i�m kinh nghi�m")
end

function get_offline_liushen()
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	if floor(OfflineLiushenTime / 6) <= 0 then
		Say("C�c h� kh�ng �� th�i gian L�c Th�n Ho�n.", 0)
		return
	end
	
	local Liushen = min(EatLiushen(1, 0), OfflineLiushenTime)
	local Liushen1 = min(EatLiushen(2, 0), OfflineLiushenTime)
	local Liushen2 = min(EatLiushen(3, 0), OfflineLiushenTime)
	
	Say("Th�i gian L�c Th�n Ho�n c� th� quy ��i l�<color=yellow>"..GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME).." ph�t (d�ng L�c Th�n Ho�n ��i l�y danh v�ng"..floor(OfflineLiushenTime/6)..", d�ng C��ng L�c Th�n Ho�n ��i l�y 2 l�n danh v�ng, L�c Th�n Ti�n ��n l� 3 l�n) <color><enter>Th�i gian �y th�c L�c Th�n Ho�n d�ng �� ��i l� <color=yellow>"..Liushen.." ph�t (danh v�ng:"..floor(Liushen / 6).." )<color><enter>Th�i gian �y th�c c�a C��ng L�c Th�n Ho�n l� <color=yellow>"..Liushen1.." ph�t (danh v�ng:"..floor(Liushen1 / 3).." )<color><enter>Th�i gian �y th�c c�a L�c Th�n Ti�n ��n l� <color=yellow>"..Liushen2.." ph�t (danh v�ng:"..floor(Liushen2 / 2).." )<color><enter>Thao t�c ��i s� kh�u tr� th�i gian �y th�c t��ng �ng c�a ng��i (n�u ch�a ��i xong, c� th� ��i l�i sau khi d�ng L�c Th�n Ho�n/C��ng L�c Th�n Ho�n/L�c Th�n Ti�n ��n)",
		5,
		"D�ng th�i gian �y th�c L�c Th�n Ho�n �� ��i danh v�ng/#confirm_use_liushen(0)",
		"D�ng th�i gian �y th�c C��ng L�c Th�n Ho�n �� ��i danh v�ng/#confirm_use_liushen(1)",
		"D�ng th�i gian L�c Th�n Ti�n ��n �� ��i danh v�ng/#confirm_use_liushen(2)",
		"tr� l�i/offline_exchange_talk_main",
		"R�i kh�i/no"
		)
end

function confirm_use_liushen(LiushenType)
	if LiushenType == 0 then
		Say("X�c ��nh s� d�ng <color=yellow>L�c Th�n Ho�n<color> quy ��i th�nh �i�m danh v�ng?", 3, "��ng �/yes_get_offline_liushen", "tr� l�i/get_offline_liushen", "R�i kh�i/no")
	elseif LiushenType == 1 then
		Say("X�c ��nh s� d�ng <color=yellow>C��ng Hi�u L�c Th�n Ho�n<color> quy ��i th�nh �i�m danh v�ng?", 3, "��ng �/yes_get_offline_liushen1", "tr� l�i/get_offline_liushen", "R�i kh�i/no")
	elseif LiushenType == 2 then
		Say("X�c ��nh s� d�ng <color=yellow>L�c Th�n Ti�n ��n<color> quy ��i th�nh �i�m danh v�ng?", 3, "��ng �/yes_get_offline_liushen2", "tr� l�i/get_offline_liushen", "R�i kh�i/no")
	end
end

function yes_get_offline_liushen()
	local Liushen = EatLiushen(1, 0)
	if Liushen <= 0 then
		Say("C�c h� kh�ng �� th�i gian L�c Th�n Ho�n, kh�ng th� quy ��i.", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("Danh v�ng c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 6, CalcTime)
	
	EatLiushen(1, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 6)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 6)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:0("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian L�c Th�n Ho�n quy ��i th�nh c�ng <color=yellow>"..Reputation.."<color> �i�m danh v�ng, danh v�ng hi�n gi� l� <color=yellow>"..GetReputation().."<color>, danh v�ng t�i �a hi�n gi� c�a ng��i l� <color=yellow>"..LevelReputationLimit.."<color>, hi�n gi� kinh nghi�m c�n d� <color=yellow>"..LeftReputation.."<color> �i�m ch�a ��i, n�u c� danh v�ng d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (L�c Th�n Ho�n/C��ng L�c Th�n Ho�n/L�c Th�n Ti�n ��n) �� ��i danh v�ng d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng L�c Th�n Ho�n ��i "..Reputation.." �i�m danh v�ng")
end

function yes_get_offline_liushen1()
	local Liushen = EatLiushen(2, 0)
	if Liushen <= 0 then
		Say("C�c h� kh�ng �� th�i gian C��ng Hi�u L�c Th�n Ho�n, kh�ng th� quy ��i.", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("Danh v�ng c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 3, CalcTime)
	
	EatLiushen(2, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 3)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 3)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:1("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian C��ng Hi�u L�c Th�n Ho�n quy ��i th�nh c�ng <color=yellow>"..Reputation.."<color> �i�m danh v�ng, danh v�ng hi�n gi� l� <color=yellow>"..GetReputation().."<color>, danh v�ng t�i �a hi�n gi� c�a ng��i l� <color=yellow>"..LevelReputationLimit.."<color>, hi�n gi� kinh nghi�m c�n d� <color=yellow>"..LeftReputation.."<color> �i�m ch�a ��i, n�u c� danh v�ng d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (L�c Th�n Ho�n/C��ng L�c Th�n Ho�n/L�c Th�n Ti�n ��n) �� ��i danh v�ng d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng C��ng L�c Th�n Ho�n ��i "..Reputation.." �i�m danh v�ng")
end

function yes_get_offline_liushen2()
	local Liushen = EatLiushen(3, 0)
	if Liushen <= 0 then
		Say("C�c h� kh�ng �� th�i gian L�c Th�n Ti�n ��n, kh�ng th� quy ��i.", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("Danh v�ng c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 2, CalcTime)
	
	EatLiushen(3, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 2)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 2)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:2("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian L�c Th�n Ti�n ��n quy ��i th�nh c�ng <color=yellow>"..Reputation.."<color> �i�m danh v�ng, danh v�ng hi�n gi� l� <color=yellow>"..GetReputation().."<color>, danh v�ng t�i �a hi�n gi� c�a ng��i l� <color=yellow>"..LevelReputationLimit.."<color>, hi�n gi� kinh nghi�m c�n d� <color=yellow>"..LeftReputation.."<color> �i�m ch�a ��i, n�u c� danh v�ng d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (L�c Th�n Ho�n/C��ng L�c Th�n Ho�n/L�c Th�n Ti�n ��n) �� ��i danh v�ng d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng L�c Th�n Ti�n ��n ��i "..Reputation.." �i�m danh v�ng")
end

function get_offline_sanqing()
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	if floor(OfflineSanqingTime / 20) <= 0 then
		Say("C�c h� kh�ng �� th�i gian Tam Thanh Ho�n.", 0)
		return
	end
	
	local Sanqing = min(EatSanqin(1, 0), OfflineSanqingTime)
	local Sanqing1 = min(EatSanqin(2, 0), OfflineSanqingTime)
	local Sanqing2 = min(EatSanqin(3, 0), OfflineSanqingTime)
	
	Say("Th�i gian Tam Thanh Ho�n c� th� quy ��i hi�n c� l� <color=yellow>"..GetTask(TASKVAL_SANQING_OFFLINE_TIME).." ph�t (d�ng Tam Thanh Ho�n ��i �� c�ng hi�n s� m�n"..floor(OfflineSanqingTime/20)..", C��ng Tam Thanh l� g�p ��i, Tam Thanh Ti�n ��n l� g�p 3) <color><enter>Th�i gian �y th�c Tam Thanh Ho�n d�ng �� ��i l� <color=yellow>"..Sanqing.." ph�t (�� c�ng hi�n s� m�n: "..floor(Sanqing / 20).." )<color><enter>Th�i gian �y th�c C��ng Tam Thanh Ho�n l� <color=yellow>"..Sanqing1.." ph�t (�� c�ng hi�n s� m�n: "..floor(Sanqing1 / 10).." )<color><enter>Th�i gian �y th�c Tam Thanh Ti�n ��n l� <color=yellow>"..Sanqing2.." ph�t (�� c�ng hi�n s� m�n: "..floor(Sanqing2 * 3 / 20).." )<color><enter>Thao t�c ��i s� kh�u tr� th�i gian �y th�c t��ng �ng c�a ng��i (n�u ch�a ��i xong, c� th� ��i l�i sau khi d�ng Tam Thanh Ho�n/C��ng Tam Thanh Ho�n/Tam Thanh Ti�n ��n)",
		5,
		"D�ng th�i gian �y th�c Tam Thanh Ho�n �� ��i �� c�ng hi�n s� m�n/#confirm_use_sanqing(0)",
		"D�ng th�i gian �y th�c C��ng Tam Thanh Ho�n �� ��i �� c�ng hi�n s� m�n/#confirm_use_sanqing(1)",
		"D�ng th�i gian �y th�c Tam Thanh Ti�n ��n �� ��i �� c�ng hi�n s� m�n/#confirm_use_sanqing(2)",
		"tr� l�i/offline_exchange_talk_main",
		"R�i kh�i/no"
		)
end

function confirm_use_sanqing(SanqingType)
	if SanqingType == 0 then
		Say("X�c ��nh s� d�ng <color=yellow>Tam Thanh Ho�n<color> ��i �i�m C�ng Hi�n S� M�n?", 3, "��ng �/yes_get_offline_sanqing", "tr� l�i/get_offline_sanqing", "R�i kh�i/no")
	elseif SanqingType == 1 then
		Say("X�c ��nh s� d�ng <color=yellow>C��ng Hi�u Tam Thanh Ho�n<color> ��i �i�m C�ng Hi�n S� M�n?", 3, "��ng �/yes_get_offline_sanqing1", "tr� l�i/get_offline_sanqing", "R�i kh�i/no")
	elseif SanqingType == 2 then
		Say("X�c ��nh s� d�ng <color=yellow>Tam Thanh Ti�n ��n<color> ��i �i�m C�ng Hi�n S� M�n?", 3, "��ng �/yes_get_offline_sanqing2", "tr� l�i/get_offline_sanqing", "R�i kh�i/no")
	end
end

function yes_get_offline_sanqing()
	local Sanqing = EatSanqin(1, 0)
	if Sanqing <= 0 then
		Say("C�c h� kh�ng �� th�i gian Tam Thanh Ho�n, kh�ng th� quy ��i.", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("�i�m C�ng Hi�n S� M�n c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(GainLimit * 20, CalcTime)
	
	EatSanqin(1, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime / 20)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) / 20)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:0("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian Tam Thanh Ho�n quy ��i th�nh c�ng <color=yellow>"..FactionReputation.."<color> �i�m �� c�ng hi�n s� m�n, �� c�ng hi�n s� m�n hi�n t�i l� <color=yellow>"..GetTask(336).."<color>, �� c�ng hi�n s� m�n t�i �a hi�n t�i l� <color=yellow>"..FactionReputationLimit.."<color>, hi�n gi� �� c�ng hi�n s� m�n c�n d� <color=yellow>"..LeftReputation.."<color> �i�m ch�a ��i, n�u c� �� c�ng hi�n s� m�n d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (Tam Thanh Ho�n/C��ng Tam Thanh Ho�n/Tam Thanh Ti�n ��n) �� ��i danh v�ng d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng Tam Thanh Ho�n ��i "..FactionReputation.." �i�m c�ng hi�n S� M�n ")
end

function yes_get_offline_sanqing1()
	local Sanqing = EatSanqin(2, 0)
	if Sanqing <= 0 then
		Say("C�c h� kh�ng �� th�i gian C��ng Hi�u Tam Thanh Ho�n, kh�ng th� quy ��i.", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("�i�m C�ng Hi�n S� M�n c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(GainLimit * 10, CalcTime)
	
	EatSanqin(2, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime / 10)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) / 10)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:1("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian C��ng Hi�u Tam Thanh Ho�n quy ��i th�nh c�ng <color=yellow>"..FactionReputation.."<color> �i�m �� c�ng hi�n s� m�n, �� c�ng hi�n s� m�n hi�n t�i l� <color=yellow>"..GetTask(336).."<color>, �� c�ng hi�n s� m�n t�i �a hi�n t�i l� <color=yellow>"..FactionReputationLimit.."<color>, hi�n gi� �� c�ng hi�n s� m�n c�n d� <color=yellow>"..LeftReputation.."<color> �i�m ch�a ��i, n�u c� �� c�ng hi�n s� m�n d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (Tam Thanh Ho�n/C��ng Tam Thanh Ho�n/Tam Thanh Ti�n ��n) �� ��i danh v�ng d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng C��ng Tam Thanh Ho�n ��i "..FactionReputation.." �i�m c�ng hi�n S� M�n ")
end

function yes_get_offline_sanqing2()
	local Sanqing = EatSanqin(3, 0)
	if Sanqing <= 0 then
		Say("C�c h� kh�ng �� th�i gian Tam Thanh Ti�n ��n, kh�ng th� quy ��i.", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("�i�m C�ng Hi�n S� M�n c�a c�c h� �� ��t gi�i h�n, kh�ng th� quy ��i.", 0)
		return
	end
	
	local ActualTime = min(floor(GainLimit * 20 / 3), CalcTime)
	
	EatSanqin(3, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime * 3 / 20)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) * 3 / 20)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:2("..ActualTime..")")
	Say("C�c h� �� d�ng th�i gian Tam Thanh Ti�n ��n quy ��i th�nh c�ng <color=yellow>"..FactionReputation.."<color> �i�m �� c�ng hi�n s� m�n, �� c�ng hi�n s� m�n hi�n t�i l� <color=yellow>"..GetTask(336).."<color>, �� c�ng hi�n s� m�n t�i �a hi�n t�i l� <color=yellow>"..FactionReputationLimit.."<color>, hi�n gi� �� c�ng hi�n s� m�n c�n d� <color=yellow>"..LeftReputation.."<color> �i�m ch�a ��i, n�u c� �� c�ng hi�n s� m�n d� nh�ng ch�a ��t t�i �a, ng��i c� th� d�ng l�i (Tam Thanh Ho�n/C��ng Tam Thanh Ho�n/Tam Thanh Ti�n ��n) �� ��i danh v�ng d�, s� l�n kh�ng gi�i h�n.", 0)
	Msg2Player("Ng��i d�ng C��ng Tam Thanh Ti�n ��n ��i "..FactionReputation.." �i�m c�ng hi�n S� M�n ")
end

function no()
end



