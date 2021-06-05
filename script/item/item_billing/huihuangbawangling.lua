------------------------------------------------------------
-- �ԻͰ�����Ľű� huihuangbawangling.lua
--
-- comment: ʹ�ú�ֱ�ӵ���73��
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID: 2, 1, 1025
------------------------------------------------------------

SHINING_NIGHT_DATE = 83		-- ʦ��������¼�������ID��ŵ��������
SHINING_NIGHT_COUNT = 84	-- �ϴ���ȡʦ�Ŵ��º�������

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("<color=yellow>B� V��ng L�nh<color> s� quy�t ��nh n�i dung ��m huy ho�ng h�m nay, b�n mu�n d�ng <color=yellow>B� V��ng l�nh<color>?",
--		7,
--		"ս��/#vote_shining_night(0)",
		6,
		"Th��ng h�i/#vote_shining_night(1)",
		"Nhi�m v� s� m�n - ng�u nhi�n/#vote_shining_night(2)",
		"Nhi�m v� s� m�n tu�n ho�n/#vote_shining_night(3)",
		"Nhi�m v� s�t th�/#vote_shining_night(4)",
		"Thuy�n r�ng/#vote_shining_night(5)",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function vote_shining_night(nChoice)
	strTab = {"Chi�n tr��ng", "Th��ng h�i", "Nhi�m v� s� m�n - ng�u nhi�n", "Nhi�m v� s� m�n tu�n ho�n", "Nhi�m v� s�t th�", "Thuy�n r�ng"}

	--		          ��	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	local nCurHour = tonumber( nCurrTime[4] )
	local nLastDate = GetTask(SHINING_NIGHT_DATE)
	local nShiningCount = GetTask(SHINING_NIGHT_COUNT)
	
	if (nCurHour > 19) then
		Say("Ho�t ��ng ��m huy ho�ng c�a ng�y h�m nay �� k�t th�c, m�i b�n ng�y mai h�y quay l�i!", 0)
		return
	end
	
	if (DelItem(2, 1, 1025, 1) == 1) then
		if (nCurDate > nLastDate) then
			SetTask(SHINING_NIGHT_DATE, nCurDate)
			nShiningCount = 0
		end
		
		nShiningCount = nShiningCount + 1
		SetTask(SHINING_NIGHT_COUNT, nShiningCount)
		Say("��y l� l�n th� "..nShiningCount.."s� d�ng B� V��ng l�nh! Ho�t ��ng ���c ch�n l�"..strTab[nChoice + 1], 0)
		
		VoteForShiningNight(nChoice, nShiningCount)
		
		local szPlayerName = GetName()
		local msg="Thi�u hi�p "..szPlayerName.." S� d�ng B� V��ng l�nh ch�n ho�t ��ng ��m huy ho�ng h�m nay l� "..strTab[nChoice + 1]
		AddGlobalNews(msg)
	end
end;

