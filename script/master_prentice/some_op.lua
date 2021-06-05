-- ʦͽϵͳ��һЩ����

Include("\\script\\lib\\string.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\global\\battlefield_callback.lua")

tItem = {2,1,588}
GRADUATE_TASK_ID = 1292			-- ����������� \script\item\chushi.lua ��Ҳ�����
TASK_SEED = 1290				-- ����������� \script\master_prentice\task_content.lua ���ж����
TASK_CONTENT = 1291				-- ����������� \script\master_prentice\task_content.lua ���ж����

MAX_FUND_COUNT = 10

t_can_use_map = 
{
	100,	--������\Ȫ��
	101,	--������\����µ�
	102,	--������\�һ���
	103,	--������\��������һ
	104,	--������\����������
	105,	--������\Ȫ�ݸ���
	106,	--������\��Ȫ��
	107,	--������\����ɽ
	108,	--������\Ȫ�ݸ���
	109,	--������\������һ��
	110,	--������\����������
	111,	--������\��Ϫ��
	112,	--������\��ˮ��һ��
	113,	--������\��ˮ������
	114,	--������\��ĸ��һ��
	115,	--������\��ĸ������
	116,	--������\��ĸ������
	117,	--������\���ĺ���
	150,	--������\����
	151,	--������\������
	200,	--��ԭһ��\�꾩
	201,	--��ԭһ��\�꾩����
	202,	--��ԭһ��\�ӻ���
	203,	--��ԭһ��\�꾩����
	204,	--��ԭһ��\����
	205,	--��ԭһ��\�꾩����
	206,	--��ԭһ��\���Źط�
	207,	--��ԭһ��\����ɽ
	208,	--��ԭһ��\��ɽ��
	209,	--��ԭһ��\ؤ��
	210,	--��ԭһ��\���ж�һ��
	211,	--��ԭһ��\���ж�����
	212,	--��ԭһ��\���ж�����
	213,	--��ԭһ��\��������һ��
	214,	--��ԭһ��\�������Ҷ���
	215,	--��ԭһ��\�ڷ綴
	216,	--��ԭһ��\���ƶ�
	217,	--��ԭһ��\Ұ����
	218,	--��ԭһ��\�鱦ɽ
	219,	--��ԭһ��\�첨�
	300,	--��ԭ����\�ɶ�
	301,	--��ԭ����\�ɶ�����
	302,	--��ԭ����\���ɽ
	303,	--��ԭ����\����
	304,	--��ԭ����\�ɶ�����
	305,	--��ԭ����\����
	306,	--��ԭ����\�����
	307,	--��ԭ����\�ᶼ
	308,	--��ԭ����\�ɶ�����
	309,	--��ԭ����\�������
	310,	--��ԭ����\���Ź�
	311,	--��ԭ����\��ţɽ
	312,	--��ԭ����\�䵱
	313,	--��ԭ����\��ʦ��һ��
	314,	--��ԭ����\��ʦ������
	315,	--��ԭ����\���Ķ�һ��
	316,	--��ԭ����\���Ķ�����
	317,	--��ԭ����\��˿��һ��
	318,	--��ԭ����\��˿������
	319,	--��ԭ����\��ħ��һ��
	320,	--��ԭ����\��ħ������
	321,	--��ԭ����\��ⶴ
	322,	--��ԭ����\������һ��
	323,	--��ԭ����\����������
	324,	--��ԭ����\���Ƕ�һ��
	325,	--��ԭ����\���Ƕ�����
	350,	--��ԭ����\����
	326,	--��ԭ����\ĺѩɽׯ
	327,	--��ԭ����\���ɲ�
	328,	--��ԭ����\���Ż���
	329,	--��ԭ����\��ʦ�ؾ�
	400,	--������\����
	401,	--������\���ɽ
	402,	--������\��˫���ɱ���
	403,	--������\��˫�����ϲ�
	404,	--������\����
	405,	--������\����ɽ��
	406,	--������\����ɽ
	407,	--������\�嶾��
	408,	--������\����
	409,	--������\ǧѰ��һ��
	410,	--������\ǧѰ������
	411,	--������\ǧѰ������
	412,	--������\���۶�һ��
	413,	--������\���۶�����
	414,	--������\���۶�
	415,	--������\���۶�����
	416,	--������\��ˮ��һ��
	417,	--������\��ˮ������
	418,	--������\�����Թ�һ
	419,	--������\�����Թ���
	420,	--������\���Ӷ�һ��
	421,	--������\���Ӷ�����
	422,	--������\��կ
	500,	--������\����
	501,	--������\���踮��
	502,	--������\��ɽ
	503,	--������\��ʼ����
	504,	--������\���踮��
	505,	--������\ҩ����
	506,	--������\ɳĮ�Թ�
	507,	--������\������
	508,	--������\������
	509,	--������\����
	510,	--������\ҩ����
	511,	--������\������һ��
	512,	--������\����������
	513,	--������\����Ĺ��һ��
	514,	--������\����Ĺ�Ҷ���
	600,	--����\���첿��
	601,	--����\���ԭһ
	602,	--����\���ԭ��
	603,	--����\���Ź����
	604,	--����\���Ź�
}

function _CheckInvite(nTargetIndex, nPrenticeCount, nMaxPrenticeCount)
	if nPrenticeCount >= nMaxPrenticeCount then
		Say("B�n kh�ng th� th�u n�p �� �� n�a. ", 0)
		return 0
	end
	
	local nLevel = GetLevel()
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	local nOldPlayer = PlayerIndex
	PlayerIndex = nTargetIndex
	if PlayerIndex <= 0 then
		return
	end
	local nTarLevel = GetLevel()
	local szTarName = GetName()
	local tTarInfo = GetMPBaseInfo()
	local nIsSleeping = IsSleeping()
	
	PlayerIndex = nOldPlayer
	if nTarLevel >= nLevel then		-- �ȼ����Լ���,������
		Say(szTarName.." ��ng c�p b�ng ho�c h�n b�n, n�n kh�ng th� thu l�m �� ��", 0)
		return 0
	end
	if nIsSleeping > 0 then
		Say(szTarName.."�ang trong tr�ng th�i ng�, kh�ng th� h�i �m c�a b�n.", 0)
		return 0
	end
	
	local nMTime = tInfo["mtime"] - GetTime()		-- ��ͽ��CD����û
	if nMTime > 0 then
		local nHour = floor(nMTime / 3600)
		nMTime = mod(nMTime, 3600)
		local nMin = floor(nMTime / 60)
		local nSec = mod(nMTime, 60)
		Say("B�n c�n <color=red>"..nHour.."h "..nMin.." Ph�t "..nSec.." gi�y <color>m�i c� th� th�u n�p 1 �� �� .", 0)
		return 0
	end
	
	if tTarInfo["master"] == szName then
		Say(szTarName.."�� l� �� �� c�a b�n r�i.", 0)
		return 0
	end
	
	if tInfo["prentice"] ~= nil then
		for index, value in tInfo["prentice"] do
			if value == szTarName then
				Say(szTarName.."�� l� �� �� c�a b�n r�i.", 0)
				return 0
			end
		end
	end
	
	if tInfo["evermaster"] ~= nil then
		for index, value in tInfo["evermaster"] do
			print("1"..value)
			if value == szTarName then
				Say(szTarName.."B�n �� t�ng S� �� quan h�, kh�ng th� th�u n�p.", 0)
				return 0
			end
		end
	end
	
	if tTarInfo["evermaster"] ~= nil then
		for index, value in tTarInfo["evermaster"] do
			if value == szName then
				print("2"..value)
				Say(szTarName.."B�n �� t�ng S� �� quan h�, kh�ng th� th�u n�p.", 0)
				return 0
			end
		end
	end

	if tTarInfo["master"] ~= "" then
		Say(szTarName.."�� l� �� �� c�a "..tTarInfo["master"]..", kh�ng th� th�u n�p.", 0)
		return 0
	end
	
	if tTarInfo["ismaster"] ~= 0 then
		Say(szTarName.."�� l� s� ph�c, kh�ng th� th�u n�p.", 0)
		return 0
	end
	
	local nPTime = tTarInfo["ptime"] - GetTime()
	if nPTime > 0 then
		local nHour = floor(nPTime / 3600)
		nPTime = mod(nPTime, 3600)
		local nMin = floor(nPTime / 60)
		local nSec = mod(nPTime, 60)
		Say(szTarName.."c�n ph�i <color=red>"..nHour.."h "..nMin.." Ph�t "..nSec.."gi�y <color>m�i c� th� b�i s� ", 0)
		return 0
	end
	
	Talk(1, "", "B�n �� g�i tin m�i "..szTarName.." l�m �� ��")
	return 1
end

function _to_be_master(nRet)
	if nRet == 0 or nRet == 10 then
		Say("T�n c�a c�c h� �� ���c ��ng k�, b�y gi� �� c� th� th�u n�p �� t�. H�y �n F3 �� m� \'trang Thu�c t�nh\' th� s� th�y giao di�n S� ��. N�u mu�n tham gia v� n�ng cao k� n�ng S� ��, h�y ��n t�m ta!",0)
	end
end

function _add_temp_member(nRet, nParam1, nParam2, szParam)
	if nRet == 22 then
		if nParam1 > 0 and szParam == "m" then
			local nHour = floor(nParam1 / 3600)
			nParam1 = mod(nParam1, 3600)
			local nMin = floor(nParam1 / 60)
			local nSec = mod(nParam1, 60)
			Say("B�n c�n "..nHour.."h "..nMin.." Ph�t "..nSec.." gi�y m�i c� th� th�u n�p 1 �� ��.", 0)
		elseif nParam2 > 0 and szParam == "p" then
			local nHour = floor(nParam2 / 3600)
			nParam2 = mod(nParam2, 3600)
			local nMin = floor(nParam2 / 60)
			local nSec = mod(nParam2, 60)
			Say("B�n c�n "..nHour.."h "..nMin.." Ph�t "..nSec.." gi�y m�i c� th� b�i s�. ", 0)
		end
	elseif nRet == 12 or nRet == 13 then
		if szParam == "m" then
			Say("��ng c�p th� nghi�p c�a b�n b�y gi� kh�ng th� th�u n�p th�m �� ��.", 0)
		end
	elseif nRet == 0 then
		if szParam == "p" then
			Say("B�n �� ���c thu nh�n l�m �� t� t�m th�i c�a s� ph� b�n. \n��n khi ��ng c�p c�a b�n ��t c�p 10. Xin h�y t� ��i v�i s� ph�, trong kho�ng c�ch g�n s� d�ng ��ng t�c \'B�i\', s� tr� th�nh �� t� ch�nh th�c.", 0)
		end
	end
end

function _ture_join(nRet, nParam)
	if nRet == 0 and nParam == 0 then		-- ���ǰ�ʦ�Ժ����ǰ�ĳ�ʦ����������
		SetTask(GRADUATE_TASK_ID, 0)
		SetTask(TASK_SEED, 0)
		SetTask(TASK_CONTENT, 0)
		Msg2Player("B�n �� th�nh ch�nh �� t� ch�nh th�c. H�y ��n Qu�c T� Gi�m nh�n trang b�.")
	end
	if nRet == 12 or nRet == 13 then
		if nParam == 1 then
			Say("��ng c�p th� nghi�p c�a b�n b�y gi� kh�ng th� c� th�m �� �� ch�nh th�c.", 0)
		end
	end
end

function _pre_chk_betray()
	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
		return 1
	end
	Say("Mu�n r�i kh�i S� M�n c�n ph�i ti�u hao 99 S� �� ph� ch�, b�n kh�ng �� S� �� ph� ch� ", 0)
	return 0
end

function _betray(nRet)
	if nRet ~= 0 then	-- ʧ���ˣ���ʦͽ��ֽ����ͽ��
		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
	end
end

function _pre_chk_kickout()
	print("_pre_chk_kickout()")
	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
		return 1
	end
	Say("Khi �� t� r�t ra kh�i S� M�n c�n ph�i ti�u hao 99 S� �� ph� ch�, b�n kh�ng �� S� �� ph� ch� ", 0)
	return 0
end

function _kickout(nRet)
	if nRet ~= 0 then	-- ʧ���ˣ���ʦͽ��ֽ�������
		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
	end
end

function _graduate(nRet, nParam, szParam)
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szOtherName = GetName()
	PlayerIndex = nOldPlayer
	if nRet == 0 then
		if szParam == "p" then
			SetTask(GRADUATE_TASK_ID, 0)
			SetTask(TASK_SEED, 0)
			SetTask(TASK_CONTENT, 0)
			local n = CustomDataRead("mp_p_award_final")
			if n == nil then
				AddItem(2, 1, 593, 1, 1)
				CustomDataSave("mp_p_award_final", "d", 1)
				WriteLog("[S� �� - Xu�t S�]:"..GetName().."Nh�n ���c 1 t�i S� �n Kh� qu�n")
				SaveNow()
			end
			Say("B�n �� �� n�ng l�c �� t� ho�nh t�u giang h�, s� ph� <color=yellow>"..szOtherName.."<color> tuy kh�ng n� xa b�n, nh�ng ��nh chia tay �� b�n r�n luy�n m�t phen. B�n �� Xu�t S�.", 0)
		elseif szParam == "m" then
			Say("�� �� <color=yellow>"..szOtherName.."<color> �� Xu�t S�, �n ��c d��ng d�c c� ��i kh� qu�n. ", 0)
			if nParam > 0 then
				AddItem(2, 1, 589, nParam, 1)
				Msg2Player("B�n nh�n ���c "..nParam.." b�ng l�c Qu�c T� Gi�m")
				WriteLog("[S� �� - Xu�t S�]:"..GetName().."Nh�n ���c"..nParam.." b�ng l�c Qu�c T� Gi�m")
				SaveNow()
			end
		end
	end
end

function _buyfund(nRet, nParam, szParam)
	if nRet == 0 and szParam ~= "" then		-- ʦ��
		Say("C�c h� �� mua cho <color=yellow>"..szParam.."<color> <color=yellow>"..nParam.."<color> Hoa H�ng. Xin h�y ch� � tin t�c tr�n b�ng, nh�n b�ng l�c c�ng ti�n h�nh tr�n giao di�n S� ��, c� ch� n�o kh�ng hi�u th� t�m ta",0)
		WriteLog("[H� th�ng S� ��]: Mua Hoa H�ng th�nh c�ng (m) m="..GetName().." p="..szParam.." n="..nParam)
	elseif nRet == 0 and szParam == "" then	-- ͽ��
		Say("L�nh s� �� mua cho b�n <color=yellow>"..nParam.."<color> Hoa H�ng.",0)
		WriteLog("[H� th�ng S� ��]: Mua Hoa H�ng th�nh c�ng (p) m="..GetName().." p="..szParam.." n="..nParam)
	elseif nRet ~= 0 and szParam ~= "" then	-- ʦ�������ҹ���ʧ����
		AddItem(2,1,594,nParam*10,1)
		WriteLog("[H� th�ng S� ��]: Mua Hoa H�ng th�t b�i m="..GetName().." p="..szParam.." n="..nParam)
	end
end

function _p_getfund(nRet, nParam1, nParam2)
	Msg2Player(nRet, nParam1, nParam2)
end

function _m_getfund(nRet, nParam1, nParam2, szParam)
	if nParam1 > 0 then
		local i = 1
		for n=1, 21 do
			i = i * 2
			if i == nParam1 then
				nParam1 = n + 1
				break
			end
		end
	end
	if nRet == 0 and nParam2 > 0 then
		if nParam1 == 1 or nParam1 == 5 or nParam1 == 6 or nParam1 == 9 or nParam1 == 11 or nParam1 == 13 then
			nParam2 = nParam2 * 2
		elseif nParam1 == 2 or nParam1 == 3 or nParam1 == 4 or nParam1 == 8 or nParam1 == 10 or nParam1 == 12 or (nParam1 >= 14 and nParam1 <= 22) then
			nParam2 = nParam2
		elseif nParam1 == 7 then
			nParam2 = nParam2 * 3
		end
			
		AddItem(2,1,589,nParam2)
		Msg2Player("B�n �� nh�n "..nParam2.." b�ng l�c Qu�c T� Gi�m. ")
		SaveNow()
		WriteLog("[S� �� - b�ng l�c s� ph�]"..GetName().."�� nh�n "..nParam2.." b�ng l�c Qu�c T� Gi�m")
	end
end

function _finnalfund(nRet, nParam)
	if nRet == 0 then
		AddItem(2,1,589,nParam)
		Say("B�n �� nh�n "..nParam.." b�ng l�c Qu�c T� Gi�m. ", 0)
		SaveNow()
		WriteLog("[S� �� - Thu nh�p cu�i c�ng c�a s� ph�]"..GetName().."�� nh�n "..nParam.." b�ng l�c Qu�c T� Gi�m")
	elseif nRet == 17 then
		local nDiffTime = nParam
		local nDay = floor(nDiffTime / 86400)
		nDiffTime = mod(nDiffTime, 86400)
		local nHour = floor(nDiffTime / 3600)
		nDiffTime = mod(nDiffTime, 3600)
		local nMin = floor(nDiffTime / 60)
		Say("C�n c�n "..nDay.."Thi�n"..nHour.."h "..nMin.." m�i c� th� nh�n kho�n b�ng l�c n�y", 0)
	elseif nRet == 18 then
		Say("B�n �� nh�n b�ng l�c n�y r�i.", 0)
	end
end

function _free_change_point(nRet, nType, nPoint)
	WriteLog("[S� �� free_change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("B�n kh�ng �� �i�m S� ��")
	elseif nRet == 21 then
		Msg2Player("Tri�u ��nh kh�ng th� gi�p b�n c� th�m �i�m S� ��")
	elseif nRet == 0 then
		if nType == 1 then				-- ��Ǯ
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- ����
			Msg2Player("Danh v�ng")
		elseif nType == 3 then			-- ʦ�Ź��׶�
			Msg2Player("�i�m s� m�n")
		elseif nType == 4 then			-- ����
			SetRankPoint(5, 701, 1)	-- ˥��������SetRankPoint��ʱ��Ž���,����Ҫ��˥��,�ٿ�
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("B�n nh�n ���c "..(20*nPoint).." �i�m c�ng tr�ng")
		elseif nType == 5 then			-- ��������
			Msg2Player("K. nghi�m (S�c kh�e)")
		elseif nType == 6 then			-- ����
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("B�n nh�n ���c "..nAddExp.." �i�m kinh nghi�m")
		elseif nType == 7 then			-- ��������ת����
			Msg2Player("S�c kho� chuy�n th�nh kinh nghi�m")
		end
	end
end

function _change_point(nRet, nType, nPoint)
	WriteLog("[S� �� change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("B�n kh�ng �� �i�m S� ��")
		AddItem(tItem[1],tItem[2],tItem[3],nPoint)	-- ��û�гɹ��һ���ʦͽ��ֽ�������
	elseif nRet == 0 then
		if nType == 0 then				-- ʦ��
			Msg2Player("B�n d�ng "..nPoint.." �i�m S� �� chuy�n th�nh �i�m S� ��c")
		elseif nType == 1 then			-- ��Ǯ
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- ����
			Msg2Player("Danh v�ng")
		elseif nType == 3 then			-- ʦ�Ź��׶�
			Msg2Player("�i�m s� m�n")
		elseif nType == 4 then			-- ������
			SetRankPoint(5, 701, 1)	-- ˥��������SetRankPoint��ʱ��Ž���,����Ҫ��˥��,�ٿ�
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("B�n nh�n ���c "..(20*nPoint).." �i�m c�ng tr�ng")
		elseif nType == 5 then			-- ��������
			Msg2Player("K. nghi�m (S�c kh�e)")
		elseif nType == 6 then			-- ����
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("B�n nh�n ���c "..nAddExp.." �i�m kinh nghi�m")
		elseif nType == 7 then			-- ��������ת����
			Msg2Player("S�c kho� chuy�n th�nh kinh nghi�m")
		end
	end
end

function _disband(nRet)
	if nRet == 9 then
		Msg2Player("L�c m�n h� v�n c�n �� t� th� kh�ng th� hu� ��ng k�")
	elseif nRet == 0 then
		Msg2Player("c�c h� t�i Qu�c T� Gi�m �� hu� ��ng k� Th�n V� Vi�n, c� th� t� �i b�i s�. N�u thay ��i � ��nh mu�n th�u n�p l�i �� t�, h�y t�m ta �� ��ng k� l�i.")
	end
end

function _want_take_on_a_master(nRet)
	if nRet == 1 then
		Say("T�m th�i ng��i ��n b�i s� qu� nhi�u, tin nh�n y�u c�u v�i s� c�a b�n ch�a th� g�i �i. Xin h�y ��i v� th� l�i.", 0)
	end
end

function _tansfer_map_chk(nMapID)
	-- �����ж�
	local isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		return 0
	end
	return 1
end

function _master_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Say(szRoleName.." kh�ng ph�i �� t� b�n, kh�ng th� truy�n t�ng", 0)
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Say(szRoleName.." kh�ng ph�i �� t� b�n, kh�ng th� truy�n t�ng", 0)
		return
	end
	
	if IsStalling() ~= 0 then
		Say("Trong l�c b�y b�n kh�ng th� truy�n t�ng", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Trong qu� tr�nh M�t T�ch kh�ng th� truy�n t�ng", 0)
		return
	end
	
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--ս��״̬��PKģʽ������ʹ��
		Say("� d�ng PK ngo�i th�nh kh�ng th� ��a �i.", 0)
		return
	end

	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _prentice_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		Msg2Player(szRoleName.." kh�ng ph�i s� ph� c�a b�n, kh�ng th� truy�n t�ng")
		return
	end
	if IsStalling() ~= 0 then
		Say("Trong l�c b�y b�n kh�ng th� truy�n t�ng", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Khi luy�n m�t t�ch kh�ng th� ��a �i.", 0)
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--ս��״̬��PKģʽ������ʹ��
		Say("� d�ng PK ngo�i th�nh kh�ng th� ��a �i.", 0)
		return
	end
	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _master_lalala(szRoleName)
	-- ��ͼ���
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < 1 then
		Say("C�n c� <color=green>1 S� �� ph� ch�<color> m�i c� th� h� ho�n �� t�. <color>", 0)
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("Khu v�c hi�n t�i kh�ng th� h� ho�n �� t� ", 0)
		return
	end
	
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Msg2Player(szRoleName.." kh�ng ph�i �� t� c�a b�n, kh�ng th� k�u g�i")
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player(szRoleName.." kh�ng ph�i �� t� c�a b�n, kh�ng th� k�u g�i")
		return
	end
	DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la", GetName())
	Talk(1,"","B�n �� g�i tin m�i "..szRoleName.."�� g�i y�u c�u h� ho�n.")
end

function _tansfer_yes(nMapID, nX, nY, nFightState, nParam)
	-- ��ͼ���
	if _tansfer_map_chk(nMapID) == 0 then
		Say("B�n kh�ng th� chuy�n ��n khu v�c m�c ti�u", 0)
		return
	end

	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--ս��״̬��PKģʽ������ʹ��
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		CleanInteractive()
		if NewWorld(nMapID, nX, nY) ~= 0 then
			SetFightState(nFightState)
		end
	else
		Say("C�n ph�i <color=green>1 S� �� ph� ch� <color>m�i c� th� s� d�ng ch�c n�ng S� �� truy�n t�ng. <color>", 0)
	end
end

function _master_want_la(szRoleName)
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.." kh�ng ph�i �� t� c�a b�n,")
		return
	end
	if tInfo["istemp"] == 0 then			-- ��ʱͽ�ܲ����ô˹���
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."Khu v�c hi�n t�i ")
		return
	end
	if IsPlayerDeath() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."�� t� vong")
		return
	end
	if IsStalling() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."�ang b�y b�n")
		return
	end
	if IsReading() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."�ang tu luy�n M�t T�ch")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--ս��״̬��PKģʽ������ʹ��
		DoScriptByName(szRoleName, "\\script\\master_prentice\\some_op.lua", "_master_want_la_err", szName.."� tr�ng th�i PK ngo�i th�nh, ")
		return
	end

	RandomTaskTipEx("S� ph� c�a b�n mu�n k�u g�i b�n ��n b�n c�ch. ", "_prentice_see_la")
end

function _master_want_la_err(szMsg)
	Talk(1, "", szMsg.."Kh�ng c� c�ch n�o h�i �m l�i k�u g�i c�a b�n!")
end

function _accept_lalala(szMsg)
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "Khu v�c s� ph� b�n �ang � kh�ng th� h� ho�n b�n.")
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice", nMapID..","..nX..","..nY..","..GetFightState())
	else
		Msg2Player("C�n ph�i <color=green>1 S� �� ph� ch�<color> m�i c� th� k�u g�i �� t�.")
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "S� ph� c�a b�n kh�ng �� S� �� ph� ch�, kh�ng th� k�u g�i b�n.")
	end
end

function _lalala_prentice(szMsg)
	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end
	
	local tPos = split(szMsg, ",")
	CleanInteractive()
	if NewWorld(tPos[1], tPos[2], tPos[3]) ~= 0 then
		SetFightState(tPos[4])
	end
end

function _refuse_la(szMsg)
	Msg2Player(szMsg.."T� ch�i l�i k�u g�i c�a b�n!")
end

function _lalala_prentice_err(szMsg)
	Say(szMsg, 0)
end

-- ��ʽ��ʦ and ��ʦ
-- ���������򷵻�1
-- �������򷵻�0
function master_prentice()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ����ʦͽ2�����
		return 0
	end
	local nMap1, nX1, nY1 = GetWorldPos()
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local szMasterLevel = GetLevel()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- Ѿ�ĸ���û��ͽ��
		PlayerIndex = nOldPlayer
		return 0
	end
	
	local nMap2, nX2, nY2 = GetWorldPos()
	local fDistance = distance_between_points(nMap1, nX1, nY1, nMap2, nX2, nY2)
	if fDistance >= 6 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		local t = GetMPBaseInfo()
		if t["master"] == szMasterName then
			if t["istemp"] == 0 then
				Msg2Player("B�n c�ch s� ph� qu� xa, kh�ng �� th�nh t�m, kh�ng th� tr� th�nh �� �� ch�nh th�c.")
			elseif t["istemp"] == 1 then
				Msg2Player("B�n c�ch s� ph� qu� xa, kh�ng �� th�nh t�m, kh�ng th� Xu�t S�.")
			end
		end
		return 0
	end

	PlayerIndex = nOldPlayer
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szMasterName then	-- Ѿ�ĸ�����������˵�ʦ��
		return 0
	end

	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		print(value)
		if value == szName then
			isExist = 1
			break
		end
	end
	
	if isExist == 0 then					-- ����ʦ����ͽ���б�����
		return 0
	end
	
	-- ����ǳ�ʦ
	if GetTask(GRADUATE_TASK_ID) == 1 then
		local isAlright = 1
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		PlayerIndex = nMasterIndex
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		if isAlright == 0 then
			return 0
		end
		PlayerIndex = nOldPlayer
		PrecticeGraduate(szMasterName)
		return 1
	end
	
	-- ��ת��
	if tInfo["istemp"] == 1 then			-- �Ѿ�ת���˻��ݸ�ë��
		return 0
	end
	
	if GetLevel() < 10 then					-- С�ڸ�����ʾ(������Talk, Say֮�����������ݵ����ݿ���������)
		Msg2Player("��ng c�p c�a b�n ch�a ��n c�p 10, kh�ng th� tr� th�nh �� t� ch�nh th�c.")
		return 0
	end
	if GetLevel() >= szMasterLevel then
		Msg2Player("��ng c�p c�a b�n ph�i nh� h�n s� ph� c�a b�n, m�i c� th� tr� th�nh �� t� ch�nh th�c.")
		PlayerIndex = nMasterIndex
		Msg2Player(szName.." (��ng c�p) ph�i nh� h�n b�n, m�i c� th� th�nh c�a b�n �� t� ch�nh th�c.")
		return 0
	end
	
	Msg2Player("B�n �� g�i y�u c�u xin ���c l� �� t� ch�nh th�c. Xin h�y ��i h�i �m c�a s� ph� b�n.")
	-- ת��
	PlayerIndex = nMasterIndex
	SetPlayerScript("\\script\\master_prentice\\some_op.lua")
	Say(szName.."Mu�n ch�nh th�c b�i b�n l�m s�, quy nh�p m�n h� c�a ban, c� ph�i thu n�p �� t� ch�nh th�c kh�ng?", 2 , "��ng �/yes_add_true", "�� ta suy ngh�!/refuse_add_true")
	return 1
end

function refuse_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ����ʦͽ2�����
		return 0
	end
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	if PlayerIndex > 0 then
		Say(szName.."T� ch�i l�i xin tr� th�nh �� t� ch�nh th�c c�a b�n.", 0)
	end
end

function yes_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		return
	end
	local szMasterName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			TakeOnAMaster(1, szMasterName)	-- ��ʽ��ʦ
			break
		end
	end
	PlayerIndex = nOldPlayer
end

-------  npc ����	-------------------------------------------------------------------------

function yes_make_master()
	if GetLevel() < 75 then
		Say("mu�n ���c truy�n th� v� c�ng, b�n th�n �t nh�t c�ng ph�i c� th�c l�c ��y ��. ��i ��n c�p 75 r�i ��n ��ng k� l�i nh�.",0)
		return
	end
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("B�n �� b�i l�m s� ph� r�i, t�m th�i kh�ng th� ��ng k� th�u n�p �� t�.",0)
		return
	end
	ToBeMaster()
end

function yes_be_prentice()
	Say("N�u nh� b�n mu�n l�m �� ��. Xin nh�p ph�i v�o �B�i s� thi�p� �� thao t�c. \nN�u nh� B�i s� thi�p b� m�t c� th� t�m ta nh�n l�i!", 0)
end

function buy_fund()
	if GetTeamSize() ~= 2 then
		Say("N�u nh� c�c h� mu�n mua Hoa H�ng Qu�c t� gi�m cho cao �� �� t�. Xin h�y t� ��i hai ng��i r�i ��n ��y",0)
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		Say("N�u nh� c�c h� mu�n mua Hoa H�ng Qu�c t� gi�m cho cao �� �� t�. Xin h�y t� ��i hai ng��i r�i ��n ��y",0)
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- ��ӵ�û��ʦͽ��ϵ
		PlayerIndex = nOldPlayer
		Say("N�u nh� c�c h� mu�n mua Hoa H�ng cho cao �� �� t�. Xin h�y t� ��i hai ng��i r�i ��n ��y",0)
		return
	end
	
	if tPInfo["istemp"] == 0 then			-- ���ܰ���ʱ���ӹ������
		PlayerIndex = nOldPlayer
		Say("C�c h� kh�ng th� mua Hoa H�ng Qu�c T� Gi�m gi�m �� t� t�m th�i.",0)
		return
	end
	
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ����ʦ����ͽ���б�����
		Say("N�u nh� c�c h� mu�n mua Hoa H�ng Qu�c t� gi�m cho cao �� �� t�. Xin h�y t� ��i hai ng��i r�i ��n ��y",0)
		return
	end
	
	local nAlreadyBuy = tPInfo["lovefund"]
	if tPInfo["lovefund"] >= 10 then
		Say("C�c h� �� mua cho "..szPrenticeName.." 10 Hoa H�ng. ",0)
		return
	end
	if nAlreadyBuy < 0 then
		nAlreadyBuy = 0
	end
	local nMaxBuy = MAX_FUND_COUNT - nAlreadyBuy
	
	Say(" C�c h� mu�n mua hoa cho <color=yellow>"..szPrenticeName.."<color> ph�i kh�ng? Tr��c ��y c�c h� �� mua cho"..szPrenticeName.."<color=red>"..nAlreadyBuy.."<color> r�i. T�i �a c�n c� th� mua th�m <color=red>"..nMaxBuy.."<color> n�a, m�i ph�n 10 T�ng Nguy�n Th�ng B�o. T�ng Nguy�n Th�ng B�o do Th�i t� ��c khi ��ng c�, hi�n nay trong d�n gian hi�m th�y, c�c h� c� th� v�o Ng� c�c �� mua",
		2,
		"X�c nh�n mua/#yes_buy_fund("..nMaxBuy..")",
		"�� ta suy ngh�!/no_say")
end

function yes_buy_fund(nMaxBuy)
	local nCount = GetItemCount(2,1,594)
	if nCount < 10 then
		Say("T�ng Nguy�n th�ng b�o c�a c�c h� kh�ng �� mua m�t ph�n hoa h�ng",0)
		return
	end
	local nMaxCanBuy = tonumber(floor(nCount / 10))
	local nMax = nMaxBuy
	if nMaxCanBuy < nMaxBuy then
		nMax = nMaxCanBuy
	end
	SetTaskTemp(26, nMax)
	AskClientForNumber("yes_buy_fund_cb", 1, nMax, "Mua bao nhi�u hoa h�ng?")
end

function yes_buy_fund_cb(nN)
	local nCount = nN * 10
	if nN > GetTaskTemp(26) then
		SetTaskTemp(26, 0)
		return
	end
	SetTaskTemp(26, 0)
	if GetTeamSize() ~= 2 then
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- ��ӵ�û��ʦͽ��ϵ
		return
	end	
	if tPInfo["istemp"] == 0 then			-- ���ܰ���ʱ���ӹ������
		return
	end
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ����ʦ����ͽ���б�����
		return
	end
	if DelItem(2,1,594,nCount) == 1 then
		BuyLovefund(szPrenticeName, nN)
		WriteLog("[H� th�ng S� ��]: mua hoa h�ng m="..szMasterName.." p="..szPrenticeName.." n="..nN)
	end
end

function get_graduate_item()
	if BigGetItemCount(2,1,590) > 0 then
		Say("<color=green>Qu�c T� gi�m <color>: Ng��i �� c� m�t 'Xu�t s� ti�u' r�i.",0)
		return
	end
	local nTime = CustomDataRead("mp_m_get_graduate_item_time")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	else
		local nDiffTime = 3600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 60���Ӳ�����ȡһ��
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("B�n c�n c�n "..nMin.." Ph�t "..nSec.."(gi�y) m�i ���c l�nh 1 'Xu�t s� ti�u'.", 0)
			return
		end
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	end
		
	
	if AddItem(2,1,590,1,1) == 1 then
		Say("Qu� nhi�n Danh s� xu�t cao ��, l�nh �� ti�n b� r�t nhanh. C� ���c 'Xu�t s� ti�u', th�y tr� c�ng nhau s� d�ng, c� th� k�u g�i Qu�c T� gi�m tu�n kh�o, tri�u ��nh ch� d�ng Xu�t s� ti�u �� s�t h�ch, t� ��i ��nh b�i tu�n kh�o c� th� xu�t s�. Xin ch� �, chi�u sau c�ng ph�i do l�nh �� ho�n th�nh.", 0)
	end
end

function use_point()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "use_point_r2s", 1) == 0 then				-- ��ˢ��һ������
		use_point_r2s()
	end
end

function use_point_r2s()
	Say("Ta mu�n chuy�n �i�m S� �� ",
		4,
		"Ta mu�n l�nh ph�n th��ng tri�u ��nh/use_point_award",
		"Ta mu�n d�ng S� �� ph� ch� chuy�n �i�m s� �� th�nh ph�n th��ng/use_point_award1",
		"Ta mu�n ghi l�i �i�m S� �� th�nh �i�m s� ��c/use_point_point",
		"R�i kh�i/no_say")
end

function use_point_award()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	if nPoint <= 0 then
		Say("C�c h� hi�n kh�ng c� �i�m S� ��, kh�ng th� l�nh th��ng", 0)
		return
	end
	
	if nCanChangePoint - nChangePoint <= 0 then
		Say("c�n c� theo ��ng c�p th� nghi�p , tri�u ��nh mi�n ph� cho b�n<color=yellow>"..nCanChangePoint.."<color>�i�m S� �� l�m ph�n th��ng. L�n n�y b�n �� chuy�n �i�m mi�n ph� qu� <color=yellow>"..nChangePoint.."<color> �i�m S� ��, kh�ng ���c chuy�n nhi�u qu�.", 0)
		return
	end
	
	Say("C�c h� c� <color=yellow>"..nPoint.."<color> �i�m S� ��, c�n c� theo ��ng c�p th� nghi�p, tri�u ��nh s� chuy�n mi�n ph� <color=yellow>"..nCanChangePoint.."<color> �i�m S� �� l�m ph�n th��ng. L�n n�y ng��i �� chuy�n qu� <color=yellow>"..nChangePoint.."<color> �i�m S� ��, c� th� mi�n ph� chuy�n <color=yellow>"..(nCanChangePoint - nChangePoint).."<color> �i�m S� ��. C� mu�n tri�u ��nh chuy�n �i�m S� �� mi�n ph� kh�ng?",
		2,
		"�� xem c� th� ch�n ph�n th��ng n�o?/see_award_type",
		"�� ta suy ngh�!/no_say"
		)
end

function see_award_type()
	Say("C�c h� c� th� ch�n c�cph�n th��ng b�n d��i",
		2,
		--"��Ǯ��ÿ1��ʦͽ�����ɻ�3.8��/#yes_use_point(1)",
		--"����/#yes_use_point(2)",
		--"ʦ�Ź��׶�/#yes_use_point(3)",
		--"������ÿ1��ʦͽ�����ɻ�20�����/#yes_use_point(4)",
		--"��������/#yes_use_point(5)",
		"Kinh nghi�m. M�i 1 �i�m S� �� c� th� ��i ��ng c�p*��ng c�p*10 kinh nghi�m/#yes_use_point(6)",
		--"��������ת����/#yes_use_point(7)",
		"�� ta suy ngh�!/no_say")
end

function yes_use_point(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- ����
		Say("C�c h� v� m�n v� ph�i, kh�ng th� ��i l�y chi�n c�ng.", 0)
		return
	end

	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint > nPoint then
		nDiffPoint = nPoint
	end
	AskClientForNumber("yes_use_point_award_cb", 1, nDiffPoint, "Chuy�n bao nhi�u �i�m S� ��?")
	SetTaskTemp(10, nType)
end

function yes_use_point_award_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	SetTaskTemp(10, 0)
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint < nCount then
		return
	end
	if nPoint < nCount then
		return
	end
	local nRet = FreeChangeTaskPoint(nCount, nType)
	if nRet == -1 then
		Msg2Player("B�n kh�ng �� �i�m S� ��")
	elseif nRet == -2 then
		Msg2Player("Tri�u ��nh kh�ng th� gi�p b�n c� th�m �i�m S� ��")
	end
end

function use_point_award1()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("C�c h� ch�a c� �i�m S� ��, kh�ng th� ��i l�y gi�i th��ng.", 0)
		return
	end
	
	Say("C�c h� c� <color=yellow>"..nPoint.."<color>�i�m, m�i l�n ��i 1 �i�m S� �� ph�i m�t 1 S� �� ph� ch�. Mu�n ��i kh�ng?",
		2,
		"Ta mu�n xem ph�n th��ng/see_award_type1",
		"�� ta suy ngh�!/no_say"
		)
end

function see_award_type1()
	Say("C�c h� c� th� ch�n c�cph�n th��ng b�n d��i",
		4,
		"Kim ti�n. 1 �i�m S� �� ��i ���c 3.8 l��ng/#yes_use_point1(1)",
		--"����/#yes_use_point(2)",
		--"ʦ�Ź��׶�/#yes_use_point(3)",
		"Chi�n c�ng. 1 �i�m S� �� ��i ���c 20 �i�m chi�n c�ng/#yes_use_point1(4)",
		--"��������/#yes_use_point(5)",
		"Kinh nghi�m. M�i 1 �i�m S� �� c� th� ��i ��ng c�p*��ng c�p*10 kinh nghi�m/#yes_use_point1(6)",
		--"��������ת����/#yes_use_point(7)",
		"�� ta suy ngh�!/no_say")
end

function yes_use_point1(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- ����
		Say("C�c h� v� m�n v� ph�i, kh�ng th� ��i l�y chi�n c�ng.", 0)
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	AskClientForNumber("yes_use_point_award1_cb", 1, nPoint, "��i bao nhi�u �i�m S� ��?")
	SetTaskTemp(10, nType)
end

function yes_use_point_award1_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint < nCount then
		return
	end
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("S� �� ph� ch� kh�ng �� �� ��i nhi�u ph�n th��ng nh� th�, chu�n b� S� �� ph� ch� kh�c, c� th� mua � Ng� c�c.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		local nRet = ChangeTaskPoint(nCount, nType)
		if nRet == -1 then
			Msg2Player("B�n kh�ng �� �i�m S� ��")
			AddItem(tItem[1],tItem[2],tItem[3],nCount,1)	-- ��û�гɹ��һ���ʦͽ��ֽ�������
		end
	end
end

function use_point_point()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("C�c h� ch�a c� �i�m S� ��, kh�ng th� ghi l�i �i�m S� ��c", 0)
		return
	end
	
	Say("Ghi �i�m s� ��c th�nh �i�m S� �� ph�i m�t S� �� ph� ch�, m�i <color=yellow>1<color> �i�m s� ��c c�n <color=yellow>1<color> S� �� ph� ch�. �i�m S� �� hi�n t�i l� <color=yellow>"..nPoint.."<color> �i�m, mu�n ghi �i�m s� ��c kh�ng?",
		2,
		"Mu�n ch�/#yes_use_point_point("..nPoint..")",
		"�� ta suy ngh�!/no_say")
end

function yes_use_point_point(nPoint)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < 1 then
		Say("C�c h� ch�a c� S� �� ph� ch�, chu�n b� m�t s� S� �� ph� ch� �em ��n, c� th� mua � Ng� c�c.",0)
		return
	end
	AskClientForNumber("yes_use_point_point_cb", 1, nPoint, "Ghi bao nhi�u �i�m s� ��c?")
end

function yes_use_point_point_cb(nCount)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("S� �� ph� ch� kh�ng �� �� ghi nhi�u �i�m s� ��c nh� th�, chu�n b� m�t s� S� �� ph� ch� �em ��n, c� th� mua � Ng� c�c.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		ChangeTaskPoint(nCount, 0)
	end
end

t_specail_item =
{
	{2,1,2000,"L�u Tinh l�"," T�ng 100 �i�m khi Linh th�ch h�p th�nh",1},
	{2,1,2001,"Ng�c T�y"," T�ng 200 �i�m khi Linh th�ch h�p th�nh",10},
	{2,0,554,"Tu Ch�n Y�u Quy�t"," T�ng 1000 �i�m tu luy�n",1},
	{2,0,141,"Ti�u Ki�p t�n"," T�y 1 �i�m PK",3},
	{2,1,1091,"C� c�i V�ng"," chuy�n v�n",3},
	{2,1,9995,"Gi�n �i�p trang"," ��i phe tham gia chi�n tr��ng",3},
	{2,1,1157,"��u h�n"," T�ng Tr� s�t kh�",15},
	{2,1,1103,"Th�c chi�n kinh nghi�m t�p"," V�t ph�m c�n cho ho�t ��ng thi luy�n s� m�n",4},
	{2,0,553,"��i Nh�n s�m"," T�c �� s�a M�t t�ch t�ng g�p 4 ",5},
	{2,1,1014,"L�c L�m Lang Y�n"," K�u g�i B�c L�c L�m Minh ch�",15},
	{2,1,1047,"Th�y Ho�ng B� Chi�u"," K�u g�i Th��ng Th�n Doanh Thi�n",15},
	{2,1,1024,"Ng� d�ng b�ch ng�c th�ch"," K�u g�i B� Phi Y�n",15},
	{2,1,1048,"Uy�n ��ng Kim Ti B�c"," K�u g�i L�nh H��ng L�ng",20},
	{2,1,1015,"V� L�m b� l�nh"," K�u g�i BOSS S� m�n b�t k�",30},
	{2,1,504,"N� Oa Tinh Th�ch"," G� 1 y�u quy�t tr�n trang b� M�t t�ch",120},
	{2,1,540,"L� r��ng"," 50 l� kim k�t h�n",60},
	{2,0,125,"H�i Minh L�nh B�i"," L�p bang",150},
	{2,1,1003,"K� L�n ho�n"," _Tr�n c�p 31 Danh v�ng ch�a ��t 3000 tr�c ti�p th�ng 3000 Danh v�ng",600},
	{2,1,1002,"Long Huy�t ho�n"," Ng��i th�p h�n c�p 73 tr�c ti�p t�ng ��n c�p 73",1000},
	{2,1,1004,"Ph�ng Huy�t ho�n"," ��ng c�p 72 tr� l�n tr�c ti�p ��t 4000 �i�m c�ng hi�n s� m�n",1200},
	{2,1,1005,"Chi�n Th�n ho�n"," Tr�c ti�p th�ng Chi�n c�ng �� th�ng",1500},
	{0,105,19,"Si�u Quang"," V�nh c�u - 100 con H�c M�",5000},
	{2,21,2016,"Ph�i th�ch c�p 5 (ngo�i c�ng)"," _15% V� kh� ngo�i c�ng",2000},
	{2,21,2021,"Ph�i th�ch c�p 5 (n�i c�ng)"," _15% V� kh� n�i c�ng",2000},
	{2,21,2117,"Ph�i th�ch c�p 5 (t�c �� xu�t chi�u)"," _25% t�c ��",3000},
	{2,21,2240,"Ph�i th�ch c�p 7 (gi�m ngo�i ph�ng)"," _Gi�m 15% v� kh� ngo�i ph�ng",1000},
	{2,21,2247,"Ph�i th�ch c�p 7 (gi�m n�i ph�ng)"," _Gi�m 15% v� kh� n�i ph�ng",1000},
}

function use_fenglu(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang tr��c/#use_fenglu("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(t_specail_item) then
		nEnd = getn(t_specail_item)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = format("%-20s%s? (c�n %d B�ng l�c)/#buy_specail_item(%d)", t_specail_item[i][4],t_specail_item[i][5],t_specail_item[i][6],i)
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(t_specail_item) then
		tSay[nTabIndex] = "Trang k�/#use_fenglu("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "R�i kh�i/no_say"
	
	Say("V�t ph�m hi�n b�n: <color>", getn(tSay), tSay)
end

function buy_specail_item(nIndex)
	local nMaxCount = GetItemCount(2,1,589)
	if nMaxCount < t_specail_item[nIndex][6] then
		Say("B�n kh�ng �� b�ng l�c �� mua <color=yellow>"..t_specail_item[nIndex][4].."<color>.", 0)
		return
	end
	SetTaskTemp(1, nIndex)
	AskClientForNumber("buy_specail_item_cb", 1, floor(nMaxCount/t_specail_item[nIndex][6]), "Mu�n mua bao nhi�u?")
end

function buy_specail_item_cb(nCount)
	if Zgc_pub_goods_add_chk(nCount, nCount) == 0 then
		return
	end
	local nIndex = GetTaskTemp(1)
	if DelItem(2,1,589,nCount * t_specail_item[nIndex][6]) == 1 then
		if nIndex == 22 then
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount,1,-1,-1,-1,-1,-1,-1)
		else
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount)
		end
		Msg2Player("B�n �� mua "..nCount.."c�i"..t_specail_item[nIndex][4])
		WriteLog("[S� ��-B�ng l�c]:"..GetName().."�� mua "..nCount.."c�i"..t_specail_item[nIndex][4])
	end
end

function disband_master()
	Say("H�y b� ��ng k� b�n s� m�t th�n ph�n s� ph�, t� b� �i b�ng l�c ch�a nh�n, m�t �i�m s� ��c, ��ng c�p th� nghi�p. C�c h� mu�n h�y b� kh�ng?",
		2,
		"��ng �/yes_disband_master",
		"H�y b�/no_say")
end

function yes_disband_master()
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] ~= nil then
		Say("C� �� t� kh�ng ���c h�y b� ��ng k�.",0)
		return
	end
	DisbandMaster()
end

function create_task()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)	== 0 then			-- ��ˢ��һ������
		create_task_r2s()
	end
end

function create_task_r2s()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] == 0 then
		return
	end
	
	local ltime = tInfo["taskinterval"]
	if ltime > 0 then
		local nHour = floor(ltime / 3600)
		ltime = mod(ltime, 3600)
		local nMin = floor(ltime / 60)
		local nSec = mod(ltime, 60)
		Say("B�n �� c�ng b� Nhi�m v� S� �� 1 l�n r�i, kho�ng c�ch th�i gian c�ng b� Nhi�m v� S� �� l�n sau l�: <color=yellow>"..nHour..":"..nMin..":"..nSec, 0)
	else
		Say("B�n c� th� ch�n Nhi�m v� S� �� b�n d��i �� c�ng b�",
			8,
			"Ho�n th�nh nhi�m v� s� m�n s� c�p 2 l�n ho�c ho�n th�nh nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: 15 �i�m c�ng hi�n s� m�n/#ask_create_task(1)",
			"Ho�n th�nh Nhi�m v� s�t th� 5 l�n ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: 50 �i�m Danh v�ng/#ask_create_task(2)",
			"��nh xong 1 tr�n ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: 150 �i�m chi�n c�ng/#ask_create_task(3)",
			"Qua ���c 2 �i c�a T�ng Ki�m ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*110)/#ask_create_task(4)",
			"Th�i H� qua 4 qu�i ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*120)/#ask_create_task(5)",
			"Th�c hi�n Long chu 4 l�n ho�c ho�n th�nhNhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*110)/#ask_create_task(6)",
			"Tham gia L�i ��i ��n ��u 5 l�n ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*100)/#ask_create_task(7)",
			"Gi� ch�a mu�n c�ng b� nhi�m v�/no_say")
	end
end

function ask_create_task(nType)
	local strConfirm
	if nType == 1 then
		strConfirm = "Nhi�m v� S� �� s�p c�ng b� l�n n�y l�: ho�n th�nh nhi�m v� s� m�n s� c�p 2 l�n ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: 15 �i�m c�ng hi�n s� m�n."
	elseif nType == 2 then
		strConfirm = "Nhi�m v� s� �� s�p c�ng b� l�n n�y l�: ho�n th�nh Nhi�m v� s�t th� 5 l�n ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: 50 �i�m Danh v�ng."
	elseif nType == 3 then
		strConfirm = "Nhi�m v� s� �� s�p c�ng b� l�n n�y l�: ��nh xong 1 tr�n ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: 150 di�m chi�n c�ng."
	elseif nType == 4 then
		strConfirm = "Nhi�m v� s� �� s�p c�ng b� l�n n�y l�: qua ���c 2 �i T�ng Ki�m ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*110)"
	elseif nType == 5 then
		strConfirm = "Nhi�m v� s� �� s�p c�ng b� l�n n�y l�: qua ���c 4 �i Th�i H� ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*120)."
	elseif nType == 6 then
		strConfirm = "Nhi�m v� s� �� s�p c�ng b� l�n n�y l�: �ua 4 cu�c thuy�n R�ng ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*110)."
	elseif nType == 7 then
		strConfirm = "Nhi�m v� s� �� s�p c�ng b� l�n n�y l�: thi 5 l�n L�i ��i ��n ��u ho�c ho�n th�nh Nhi�m v� th��ng h�i 20 l�n, ph�n th��ng �� ��: kinh nghi�m (��ng c�p*��ng c�p*100)."
	end
	Say(strConfirm.."X�c nh�n c�ng b�?",2, "��ng �/#yes_create_task("..nType..")", "Gi� ch�a mu�n c�ng b� nhi�m v�/no_say")
end

function yes_create_task(nType)
	MasterCreateTask(nType)
	Say("c�ng b� nhi�m v� th�nh c�ng, th�ng b�o cho �� t� bi�t, nh�p v�o n�t 'nh�n nhi�m v�' tr�n b�ng s� �� �� ti�p nh�n Nhi�m v� S� �� n�y.", 0)
end

function no_say()
end
