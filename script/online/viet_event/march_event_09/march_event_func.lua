--File name:	march_event_func.lua
--Describe:		���»�����ļ�
--Create Date:	2009-02-17
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\march_event_09\\march_event_head.lua")
Include("\\script\\lib\\writelog.lua")

--���ԭ�ϰ�
function add_bag_march_09_viet(nItemNum, szLog)
	local szLogTitle = "Event th�ng 3"
	local szItemName = "Bao nguy�n li�u"
	local G, D, P = 2, 1, 30061
	local nRetCode = 0
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName)
		WriteLogEx(szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLogTitle,"", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

