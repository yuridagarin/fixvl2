-- ��ʦ����

Include("\\script\\online\\zgc_public_fun.lua")

GRADUATE_TASK_ID = 1292	-- ����������� \script\master_prentice\some_op.lua ��Ҳ�����

t_can_use_map = 
{
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
	151,	--������\������
	201,	--��ԭһ��\�꾩����
	202,	--��ԭһ��\�ӻ���
	203,	--��ԭһ��\�꾩����
	205,	--��ԭһ��\�꾩����
	206,	--��ԭһ��\���Źط�
	207,	--��ԭһ��\����ɽ
	208,	--��ԭһ��\��ɽ��
	210,	--��ԭһ��\���ж�һ��
	211,	--��ԭһ��\���ж�����
	212,	--��ԭһ��\���ж�����
	213,	--��ԭһ��\��������һ��
	214,	--��ԭһ��\�������Ҷ���
	215,	--��ԭһ��\�ڷ綴
	216,	--��ԭһ��\���ƶ�
	217,	--��ԭһ��\Ұ����
	218,	--��ԭһ��\�鱦ɽ
	301,	--��ԭ����\�ɶ�����
	302,	--��ԭ����\���ɽ
	304,	--��ԭ����\�ɶ�����
	306,	--��ԭ����\�����
	307,	--��ԭ����\�ᶼ
	308,	--��ԭ����\�ɶ�����
	309,	--��ԭ����\�������
	310,	--��ԭ����\���Ź�
	311,	--��ԭ����\��ţɽ
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
	326,	--��ԭ����\ĺѩɽׯ
	327,	--��ԭ����\���ɲ�
	328,	--��ԭ����\���Ż���
	401,	--������\���ɽ
	402,	--������\��˫���ɱ���
	403,	--������\��˫�����ϲ�
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
	501,	--������\���踮��
	502,	--������\��ɽ
	503,	--������\��ʼ����
	504,	--������\���踮��
	505,	--������\ҩ����
	506,	--������\ɳĮ�Թ�
	507,	--������\������
	508,	--������\������
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

function OnUse(idx)
	Say("S� d�ng Xu�t S� Ti�u �� g�i ra s�t h�ch vi�n c�a Qu�c T� Gi�m, S� �� h�p s�c �� ti�u di�t. Ch� � �� �� ph�i t�n c�ng cu�i c�ng. B�n quy�t ��nh d�ng ch�? \n<color=red>Xin x�c nh�n b�n �� nh�n ���c to�n b� b�ng l�c, �� �� m�t khi xu�t s�, nh�ng b�ng l�c ch�a nh�n th� kh�ng th� nh�n n�a.<color>", 2, "��ng/yes_use", "Sai/no_say")
end

function yes_use()
	if use_check() > 0 and DelItem(2,1,590,1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		local n = CreateNpc("Qu�c T� Gi�m tu�n kh�o","Qu�c T� Gi�m tu�n kh�o",nMapID, nX + random(-5,5), nY + random(-5,5))
		SetNpcScript(n, "\\script\\item\\chushidaoju.lua")
		SetNpcLifeTime(n, 1800)
	end
end

function OnDeath(idx)
	local nNpcIdx = tonumber(idx)
	SetNpcLifeTime(nNpcIdx, 0)
	if death_check() > 0 then
		SetTask(GRADUATE_TASK_ID, 1)
		Say("Ch�c m�ng b�n �� ho�n th�nh nhi�m v�! M�i s� ph� b�n ��ng ��i di�n r�i th�c hi�n ��ng t�c \'B�i\' l� c� th� xu�t s�",0)
	end
end

function use_check()		-- ʦ��PlayerIndex
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ����ʦͽ2�����
		Say("T� ��i ch� c� 2 s� �� m�i c� th� s� d�ng v�t n�y",0)
		return 0
	end
	local nMMapID, nMX, nMY = GetWorldPos()
	local szMasterName = GetName()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- Ѿ�ĸ���û��ͽ��
		Say("B�n kh�ng c� �� t�, kh�ng th� s� d�ng v�t ph�m n�y!", 0)
		return 0
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	
	if tInfo["master"] ~= szMasterName then	-- Ѿ�ĸ�����������˵�ʦ��
		PlayerIndex = nOldPlayer
		Say("T� ��i ch� c� 2 s� �� m�i c� th� s� d�ng v�t n�y", 0)
		return 0
	end
	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		if value == szName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ����ʦ����ͽ���б�����
		PlayerIndex = nOldPlayer
		Say("T� ��i ch� c� 2 s� �� m�i c� th� s� d�ng v�t n�y", 0)
		return 0
	end
	if GetLevel() < 73 then
		PlayerIndex = nOldPlayer
		Say("�� t� c�a b�n ch�a ��t c�p 73, ch�a th� xu�t s�", 0)
		return 0
	end
	
	if tInfo["istemp"] == 0 then			-- ��ʱ����
		PlayerIndex = nOldPlayer
		Say("�� t� t�m th�i kh�ng ���c xu�t s�", 0)
		return 0
	end
	
	-- �����ж�
	local nPMapID, nPX, nPY = GetWorldPos()
	local fDistance = distance_between_points(nMMapID, nMX, nMY, nPMapID, nPX, nPY)
	if fDistance > 10 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		Say("�� t� c�a b�n c�ch b�n qu� xa, kh�ng th� s� d�ng v�t n�y.", 0)
		return 0
	end
	
	-- �����ж�
	local nMapID = GetWorldPos()
	isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	PlayerIndex = nOldPlayer
	if isExist == 0 then
		Msg2Player("Khu v�c hi�n t�i kh�ng th� s� d�ng ��o c� xu�t s�.")
		return 0
	end
	return 1
end

function death_check()		-- Ĭ��Ϊͽ��PlayerIndex
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- ����ʦͽ2�����
		return 0
	end
	
	if GetLevel() < 73 then
		return 0
	end
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- Ѿ�ĸ���û��ͽ��
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
		if value == szName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- ����ʦ����ͽ���б�����
		return 0
	end
	if tInfo["istemp"] == 0 then			-- ��ʱ����
		return 0
	end
	return 1
end

function msg_2_team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function no_say()
end