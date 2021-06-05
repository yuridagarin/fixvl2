--File name:	feiyan_npc.lua
--Describe:		���ڻ��������npc�ļ�
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

TYPE_ITEM 	= 1;	--��ͨ��Ʒ
TYPE_EQUIP 	= 2;	--������װ������Ʒ
TYPE_CMD 	= 3;	--����

g_szLogTitle = "Hoat dong Tet 2009"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."Phi Y�n Ti�n T�".."<color>: "

g_szThisFile = "\\script\\online\\viet_event\\new_year_09\\npc\\feiyan_npc.lua"


g_tbItem = 
{
	--		����	   ����	���� ����					ID1	ID2		ID3		
	[1] = {TYPE_ITEM,	-1,	1,	"Ng� H�nh M�t t�ch",				0,	107,	155,	},
	[2] = {TYPE_ITEM,	-1,	1,	"Thi�n H� M�t t�ch",				0,	107,	64,	},
	[3] = {TYPE_ITEM,	-1,	1,	"T� H� M�t t�ch",				0,	107,	65,	},
	[4] = {TYPE_ITEM,	-1,	1,	"Chi�m Y Ph�",				0,	107,	66,	},
	[5] = {TYPE_ITEM,	7,	1,	"S� tay s�ng",				2,	19,		1,	},
	[6] = {TYPE_ITEM,	7,	1,	"T�y T�y ��n",				2,	0,		136,	},
	[7] = {TYPE_ITEM,	7,	1,	"T�y T�y linh ��n",				2,	0,		137,	},
	[8] = {TYPE_ITEM,	7,	1,	"B�t B�o T�y T�y Ti�n ��n",			2,	0,		138,	},
	[9] = {TYPE_ITEM,	7,	1,	"Ti�u Ki�p t�n",				2,	0,		141,	},
	[10] = {TYPE_ITEM,	7,	1,	"��i Nh�n s�m",				2,	0,		553,	},
	[11] = {TYPE_ITEM,	7,	1,	"Tinh luy�n B�ng Th�ch",				2,	1,		533,	},
	[12] = {TYPE_ITEM,	7,	1,	"Phong l�nh-trung c�p",		2,	1,		1054,	},
	[13] = {TYPE_ITEM,	7,	1,	"Phong l�nh-cao c�p",		2,	1,		1018,	},
	[14] = {TYPE_ITEM,	7,	1,	"Phong l�nh-t�i cao",		2,	1,		1055,	},
	[15] = {TYPE_ITEM,	7,	1,	"V� L�m Cao Th�",	2,	1,		1040,	},
	[16] = {TYPE_ITEM,	7,	1,	"Nh�t ��i ��i Hi�p",	2,	1,		1041,	},

	--		����	    ��ֵ	��ʾ�ַ��� 		�����ַ���
	[17] = {TYPE_CMD,	800000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[18] = {TYPE_CMD,	800000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[19] = {TYPE_CMD,	800000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[20] = {TYPE_CMD,	800000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[21] = {TYPE_CMD,	800000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[22] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[23] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[24] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[25] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[26] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[27] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[28] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[29] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[30] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[31] = {TYPE_CMD,	400000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[32] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[33] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[34] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[35] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[36] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[37] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[38] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[39] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[40] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[41] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[42] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[43] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[44] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[45] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[46] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[47] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[48] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[49] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[50] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
	[51] = {TYPE_CMD,	200000,	" �i�m kinh nghi�m",		"ModifyExp(%d)"},
}


function main()
	if is_new_year_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho�t ��ng t�t �� k�t th�c.");
		return
	end
	local nTime = tonumber(date("%H%M"))
	if nTime >= 0005 and nTime < 1900 then
		exchange_confirm()
	elseif nTime >= 1905 and nTime < 2400 then
		give_prize()
	else
		Say("Quay l�i sau!",0)
	end
end

function exchange_confirm()
	if GetLevel() < 10 then
		Talk(1,"",g_szInfoHead.."Ng��i ch�i ph�i t� c�p 10 ho�c c�p 10 tr� l�n m�i c� th� tham gia.");
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."Ho�t ��ng n�y y�u c�u ng��i ch�i ph�i gia nh�p v�o m�n ph�i.");
		return
	end
	local selTab = {
				"T�i h� mu�n t�ng 4 hoa mai/give_plum",
				"Ta s� quay l�i sau.!/no",
				}
	Say(g_szInfoHead.."M�i ng�y ng��i ch�i c� c�p 10 tr� l�n v� �� v�o m�n ph�i t�ng hoa mai cho NPC Phi Y�n Ti�n T� s� ���c ph�n th��ng c� gi� tr�: \n-T� 0:05 ��n 19:00 ng��i ch�i t�ng 4 hoa mai cho NPC Phi Y�n Ti�n T� s� ���c ph�n th��ng kinh nghi�m\n-T� 19:05 ��n 24:00, ng��i ch�i �� t�ng �� 4 hoa mai ��n ��i tho�i v�i Phi Y�n s� ���c nh�ng ph�n qu� ��c bi�t\n-Ng��i ch�i may m�n nh�t trong ng�y s� ���c 1 Ng� H�nh M�t T�ch.",getn(selTab),selTab);
end

function give_plum()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET) >= nDate then
		Say(g_szInfoHead.."H�m nay ��i hi�p �� t�ng 4 hoa Mai r�i, xin h�y ��i ng�y mai ti�p t�c tham gia ho�t ��ng!", 0)
		return
	end
	local nExp = 200000

	if GetItemCount(2,1,30053) < 4 then
		Say(g_szInfoHead.."��i hi�p kh�ng mang theo �� s� Hoa Mai trong h�nh trang c�a m�nh.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
		return
	end
	if DelItem(2,1,30053,4) == 1 then
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m")
		WriteLogEx(g_szLogTitle, "Phi Y�n", nExp, "�i�m kinh nghi�m", format("ModifyExp(%d)", nExp), GetTongName() )
		SetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET, nDate)


		local nWishType = 0
		local nPrizeType = 0
		local nPrizeFlag = 0
		local nDateFlag = tonumber(GetTime())

		AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
	else
		Say(g_szInfoHead.."��i hi�p kh�ng mang theo �� s� Hoa Mai trong h�nh trang c�a m�nh.",1,"Th�t ng�i qu�, �� ta ki�m tra l�i!/no")
		return
	end
end

function give_prize()
	local selTab = {
				"T�i h� ��n �� nh�n ph�n th��ng/obtain_prize",
				"Ta s� quay l�i sau.!/no",
				}
	Say(g_szInfoHead.."M�i ng�y ng��i ch�i c� c�p 10 tr� l�n v� �� v�o m�n ph�i t�ng hoa mai cho NPC Phi Y�n Ti�n T� s� ���c ph�n th��ng c� gi� tr�: \n-T� 0:05 ��n 19:00 ng��i ch�i t�ng 4 hoa mai cho NPC Phi Y�n Ti�n T� s� ���c ph�n th��ng kinh nghi�m\n-T� 19:05 ��n 24:00, ng��i ch�i �� t�ng �� 4 hoa mai ��n ��i tho�i v�i Phi Y�n s� ���c nh�ng ph�n qu� ��c bi�t\n-Ng��i ch�i may m�n nh�t trong ng�y s� ���c 1 Ng� H�nh M�t T�ch.",getn(selTab),selTab);
end

function obtain_prize()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(GIVE_PLUM_DATE_09_NEWYEAR_VIET) < nDate then
		Say("��i hi�p v�n ch�a �� �i�u ki�n �� nh�n th��ng l�n n�y.",0)
		return
	end

	if GetTask(AWARD_PLUM_09_NEWYEAR_VIET) >= nDate then
		Say("H�m nay ng��i �� nh�n ph�n th��ng r�i, ng�y mai h�y ��n nh�!",0)
		return
	end

	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end

	ApplyRelayShareData(RELAY_DB_09_NEWYEAR_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say("��i hi�p v�n ch�a �� �i�u ki�n �� nh�n th��ng l�n n�y.",0)
		return
	end

	local szPlayerName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	szPlayerName = GetName()

	nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByKey(szKey, nKey1, nKey2, szPlayerName)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	if nPrizeFlag == 1 then
		Say("H�m nay ng��i �� nh�n ph�n th��ng r�i, ng�y mai h�y ��n nh�!",0)
		return
	end

	if nDateNow - nDateFlag > 86400  then
		Say("B�n v�n ch�a nh�n ���c ph�n th��ng t� Phi Y�n Ti�n T�.",0)
		return
	end

	local nRetCode = 0
	if nPrizeType == 0 then
		local nExp = 100000
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c  "..nExp.."  �i�m kinh nghi�m")
		WriteLogEx(g_szLogTitle, "Phi Y�n", nExp, "�i�m kinh nghi�m", format("ModifyExp(%d)", nExp), GetTongName() )
		nRetCode = 1	--Ĭ������ɹ�ִ��
	elseif nPrizeType >= 1 and nPrizeType <= 51 then
		local nType = g_tbItem[nPrizeType][1]
		if nType == TYPE_ITEM then
			nRetCode = add_item_ex(g_tbItem[nPrizeType])
		elseif nType == TYPE_CMD then
			local nItemNum = g_tbItem[nPrizeType][2]
			local szItemName = g_tbItem[nPrizeType][3]
			local szCMDString = format(g_tbItem[nPrizeType][4], nItemNum)
			dostring(szCMDString)
			Msg2Player("B�n nh�n ���c  "..nItemNum.." "..szItemName)
			WriteLogEx(g_szLogTitle, "Phi Y�n", nItemNum, szItemName, szCMDString, GetTongName() )
			nRetCode = 1	--Ĭ������ɹ�ִ��
		end
	else
		return
	end

	if nRetCode == 1 or nRetCode == 2 then
		nPrizeFlag = 1
		AddRelayShareData(RELAY_DB_09_NEWYEAR_VIET, 0, 0, "", "", 0, GetName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		SetTask(AWARD_PLUM_09_NEWYEAR_VIET, tonumber(date("%Y%m%d")))
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[4]
	local G, D, P = tItem[5], tItem[6], tItem[7]
	local nItemNum = tItem[3]
	local nRetCode, nItemIdx = 0, 0

	nRetCode,nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		if tItem[2] > 0 then
			SetItemExpireTime(nItemIdx, tItem[2]*24*3600)
		end
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		if G == 0 and D == 107 and P == 155 then
			Msg2Global("Ch�c m�ng "..GetName().." Th�ng qua Phi Y�n Ti�n T� thu ���c 1 Ng� H�nh M�t T�ch")
		end
		WriteLogEx(g_szLogTitle, "Phi Y�n", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "Phi Y�n", "", "", format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ���c th�t b�i, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode
end

function no()
end

