
-- Gamveserver����ʱApply����ս����

Include("\\script\\lib\\string.lua")

t_can_do_arrest = 
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
	600,	--����\���첿��
	601,	--����\���ԭһ
	602,	--����\���ԭ��
	603,	--����\���Ź����
	604,	--����\���Ź�
	889,	--�ط�կ
}

function OnCityWarInit(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildCityWarData(szKey, nKey1, nKey2)
	end
end

-- �����������������PlayerIndex
function DoArrest(pTargetIndex)
	if pTargetIndex <= 0 then
		return
	end
	-- �ж��Ƿ����ܹ����õĵ�����
	if can_do_arrest(pTargetIndex) == 1 then
		SetTaskTemp(10, 2132)
		SetTask(450, pTargetIndex)
		DoWait(5, 6, 5)
		local szName = GetName()
		local nOldPlayer = PlayerIndex
		PlayerIndex = pTargetIndex
		-- ��ʱ����ʾһ�°�
		Msg2Player("B�n �ang b� "..szName.."Truy  n�")
	end
end

-- ��������ɱ�˵�PlayerIndex
function OnKill(nKillerIndex)
	SetReviveCD(1, 10)			-- ����Ͻɱ����10������CD
end

-- ��������Ҫ���ĵ�ͼ,ά����,��λ��
function GetOutlay(nMapID, nGold)
	nGold = floor(nGold * 1.5)
	if nGold < 1500 then
		nGold = 1500
	elseif nGold > 20000 then
		nGold = 20000
	end
	SetCityWarOutlay(nMapID, nGold)
end

function can_do_arrest(pTargetIndex)
	if GetPKValue() >= 4 then
		Msg2Player("Tr� PK nh� h�n 4 gi� m�i ���c truy n� ng��i ch�i!")
		return 0
	end
	
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("C�n ph�i c� 1 Th�nh �� T�m N� L�nh m�i c� th� truy n� ng��i ch�i!")
		return 0
	end
	
	if GetDeathPunish() == 0 then
		Msg2Player("B�n �� kh�ng c� tr�ng ph�t t� vong kh�ng ���c truy n�!")
		return 0
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = pTargetIndex
	local nPKValue = GetPKValue()
	local nIsOffline = IsOfflineLive()
	PlayerIndex = nOldPlayer
	if nPKValue == 0 then
		Msg2Player("Kh�ng ���c truy n� ng��i ch�i kh�ng c� tr� PK!")
		return 0
	end
	
	if nIsOffline == 1 then
		Msg2Player("Kh�ng ���c truy n� ng��i ch�i r�i m�ng �y th�c!")
		return 0
	end
	
	local nMapID = GetWorldPos()
	local isExist = 0
	-- �����ж�
	for index, value in t_can_do_arrest do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player("Khu v�c hi�n t�i kh�ng ���c truy n� ng��i ch�i!")
		return 0
	end
	
	local tSpecailMap =
	{
		[100] = {200, 300, 350, 400, 500, 150},
		[300] = {200, 100, 350, 400, 500, 150},
		[350] = {200, 100, 300, 400, 500, 150},
	}
	local nBelongMap, nDuty = GetCityWarDutyFlag()
	if tSpecailMap[nBelongMap] ~= nil then
		for index, value in tSpecailMap[nBelongMap] do
			if nMapID == value then
				Msg2Player("Kh�ng ���c truy n� ng��i ch�i trong th�nh ch�a chi�m l�nh.")
				return 0
			end
		end
	end
	return 1
end

-- ����ʧЧʱ����������Ĳ���
function FireOut(szRoleName)
	DoScriptByName(szRoleName,"\\script\\gongcheng\\city_manage\\manage_head.lua","do_fire_out")
end

function do_fire_out()
	-- �Ƴ��ƺ�
	for i = 1, 12 do
		RemoveTitle(51, i)
	end
	-- �Ƴ���Ʒ���ɶ�֮ӡ����ʦ����Ͻ������
	local n = BigGetItemCount(2,1,1207)
	if n > 0 then
		BigDelItem(2,1,1207,n)
	end
	
	n = BigGetItemCount(2,1,1204)
	if n > 0 then
		BigDelItem(2,1,1204,n)
	end
	
	n = BigGetItemCount(2,1,1205)
	if n > 0 then
		BigDelItem(2,1,1205,n)
	end
end

function player_task_clear()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")
	local nBodyTime = GetTask(448)
	if nBodyTime < nTime then	-- �Ѿ����Ǳ��ܵ���
		CustomDataSave("tongcitywar_person_task","dddd",0,0,0,0)
		SetTask(448,nTime)
	end
end
