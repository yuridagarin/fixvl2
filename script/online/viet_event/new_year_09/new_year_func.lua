--File name:	new_year_func.lua
--Describe:		���ڻ�����ļ�
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua")
Include("\\script\\lib\\writelog.lua")

--���������
function add_bag_new_year_09_viet(nItemNum, szLog)
	local szLogTitle = "Hoat dong Tet 2009"
	local szItemName = "T�i L�c M�ng Xu�n"
	local G, D, P = 2, 1, 30046
	local nRetCode = 0
	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName)
		WriteLogEx(szLogTitle, szLog, nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(szLogTitle, szLog, "", "", "", "", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
end

