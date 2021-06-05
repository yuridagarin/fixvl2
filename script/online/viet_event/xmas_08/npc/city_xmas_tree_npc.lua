--File name:	city_xmas_tree_npc.lua
--Describe:		ʥ����(����)npc�ű�
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"				--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."C�y th�ng gi�o h�i".."<color>: "


g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}

function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end
	local selTab = {				
				"Nh�n L� H�p v� Long Huy�t Ho�n/obtain_new_xmas_box",
				"Nh�n h�p qu� may m�n (Vui gi�ng sinh c�ng nhau nh�n th��ng)/obtain_lucky_box",
				"Ta ch� ��n xem th�/no",
				}
	Say(g_szInfoHead.."Ho�t ��ng Qu� T�ng  C�y Th�ng Gi�ng Sinh di�n ra t� ng�y 06-12-2008 ��n 24:00 ng�y 04-01-2009. Trong th�i gian s� ki�n, t�t c� c�c t�i kho�n ���c t�o m�i trong th�i gian n�y c� nh�n v�t ��t c�p 55 tr� l�n, �i�m s� m�n l�n h�n 1200, �i�m danh v�ng l�n h�n 600, �i�m t�ch l�y T�ng Ki�m l�n h�n 1000 v� �i�m t�ch l�y c�ng tr�ng T�ng Li�u l�n h�n 500 th� c� th� ��n ��i tho�i v�i NPC C�y Th�ng Gi�ng Sinh �� nh�n v�t ph�m Long Huy�t Ho�n v� 1 H�p Qu�.",getn(selTab),selTab);
end


function obtain_new_xmas_box()

	if GetTask(GAIN_PILL_08_XMAS_VIET) == 1 then
		Say(g_szInfoHead.."��i hi�p �� nh�n r�i, kh�ng th� ti�p t�c nh�n ���c n�a!",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no")
		return
	end
	
	if GetTask(GAIN_NEW_BOX_08_XMAS_VIET) == 1 then
		Say(g_szInfoHead.."��i hi�p �� nh�n r�i, kh�ng th� ti�p t�c nh�n ���c n�a!",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no")
		return
	end
	
	if is_could_award() == 0 then
		Say(g_szInfoHead.."C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"Th�t l� ng�i qu�! T�i h� xin c�o t�./no")
		return
	end
	
	if gf_Judge_Room_Weight(2,40) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end
	if GetExtPoint(4) == 1 then
		if PayExtPoint(4,1) == 1 then
			if GetExtPoint(4) == 0 then		
				local nRetCode, nItemIdx = add_item_ex( {"Long Huy�t ho�n",	2,	1,	1002,	1} )
				SetTask(GAIN_PILL_08_XMAS_VIET, 1)
				if nRetCode == 1 then
					SetItemExpireTime(nItemIdx, 7*24*3600)		
				end
				
				nRetCode = add_item_ex( {"H�p qu�",	2,	1,	30035,	1} )
				SetTask(GAIN_NEW_BOX_08_XMAS_VIET, 1)
				if nRetCode == 1 then
					Say(g_szInfoHead.."R�t t�t! Ng��i �� ��t c�p 55 r�i sao? ��y l� ph�n qu� c�a ng��i, h�y mau mau s� d�ng, kh�ng kh�o l�i h�t h�n s� d�ng.",1,"�a t� c�y th�ng gi�ng sinh/no")
				end
			end
		end
	end
end


function obtain_lucky_box()
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 6 and nWeek ~= 0 then
		Say(g_szInfoHead.."C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"K�t th�c ��i tho�i/no")
		return
	end

	local nTime = tonumber(date("%H%M"))
	if nTime < 930 or nTime >= 1033 then
		Say(g_szInfoHead.."C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"K�t th�c ��i tho�i/no")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCK_BOX_DATE_08_XMAS_VIET) then
		SetTask(LUCK_BOX_DATE_08_XMAS_VIET, nDate)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, 0)
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, 0)
	end
	
	if GetTask(LUCK_BOX_NUM_08_XMAS_VIET) >= 6 then
		Say(g_szInfoHead.."M�i ng�y m�i nh�n v�t ch� c� th� nh�n 6 h�p qu� may m�n.",1,"K�t th�c ��i tho�i/no")
		return
	end
	
	local tTime =
	{
		{930,938},
		{939,947},
		{948,956},
		{957,1005},
		{1006,1014},
		{1015,1023},
		{1024,1032},
	}
	local nTurn = 0
	local nTurnNum = getn(tTime)
	for i = 1, nTurnNum do
		if nTime >= tTime[i][1] and nTime <= tTime[i][2] then
			nTurn = i
			break
		end
	end
	if GetTask(LUCK_BOX_TURN_08_XMAS_VIET) == nTurn then
		Say(g_szInfoHead.."C�c h� v�n ch�a �� �i�u ki�n l�nh th��ng",1,"K�t th�c ��i tho�i/no")
		return
	else
		if gf_Judge_Room_Weight(1, 20) == 0 then
			Msg2Player("Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
			return
		end

		add_item_ex( {"H�p Qu� May M�n",	2,	1,	30038,	1} )
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, nTurn)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, GetTask(LUCK_BOX_NUM_08_XMAS_VIET)+1 )

		local nMapID = GetWorldPos()
		if GetGlbValue(AWARD_MAP_IDX_XMAS_VIET) == nMapID then
			if GetGlbValue(AWARD_TURN_XMAS_VIET) == nTurn then
				SetGlbValue(g_tbMap[nMapID], GetGlbValue(g_tbMap[nMapID])+1)
				if GetGlbValue(g_tbMap[nMapID]) == 68 then
					add_item_ex( {"H�p Qu� ��c Bi�t",	2,	1,	30037,	1} )
				end
			end
		end
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName..", V�n c�n r�t nhi�u ph�n th��ng �ang ch� b�n, xin m�i h�y ti�p t�c tham gia ho�t ��ng.");
		WriteLogEx(g_szLogTitle, "C�y Th�ng Gi�ng Sinh", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "C�y Th�ng Gi�ng Sinh", "", "", "","", "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode, nItemIdx
end


function is_could_award()
	if GetCreateTime() < 1228406400 or GetCreateTime() >= 1231084800 then
		return 0
	end
	if GetExtPoint(4) ~=1 then
		return 0
	end
	if GetLevel() < 55 then
		return 0
	end
	if GetReputation() <= 600 then
		return 0
	end
	if GetTask(336) <= 1200 then
		return 0
	end
	if GetTask(1801) <= 1000 then
		return 0
	end
	if abs(GetTask(701)) <= 500 then
		return 0
	end
	return 1
end


function no()
end


