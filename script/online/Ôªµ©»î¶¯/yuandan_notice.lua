--filename:yuandan_notice.lua
--create date:2005-12-26
--author:yanjun
--describe:������ͨ���
Include("\\script\\online\\Ԫ���\\yuandan_head.lua")

function main()
	local iMonth = GetCurMonth()
	local iDay = GetCurDate()
	if ((iMonth == 12 and iDay ==31) or (iMonth == 1 and iDay <= 5)) and YUANDAN_SWITCH == 1 then
		if GetLocalTime() == 20 then
			AddLocalNews("H�m nay 21:00 s� m� ho�t ��ng Nguy�n ��n �o�t k�, c�c b�n nh� ��n g�p �o�t K� Gi�o ��u � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u �� t�m hi�u th�ng tin v� ho�t ��ng.")
			Msg2SubWorld("H�m nay 21:00 s� m� ho�t ��ng Nguy�n ��n �o�t k�, c�c b�n nh� ��n g�p �o�t K� Gi�o ��u � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u �� t�m hi�u th�ng tin v� ho�t ��ng.")
		elseif GetLocalTime() == 22 then
			AddLocalNews("H�m nay 23:00 s� m� ho�t ��ng Nguy�n ��n �o�t k�, c�c b�n nh� ��n g�p �o�t K� Gi�o ��u � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u �� t�m hi�u th�ng tin v� ho�t ��ng.")
			Msg2SubWorld("H�m nay 23:00 s� m� ho�t ��ng Nguy�n ��n �o�t k�, c�c b�n nh� ��n g�p �o�t K� Gi�o ��u � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u �� t�m hi�u th�ng tin v� ho�t ��ng.")
		end
	end
end