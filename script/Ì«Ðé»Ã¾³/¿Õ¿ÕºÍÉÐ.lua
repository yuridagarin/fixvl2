--2007��2��28���޸�
--�޸����ݣ�����̫������������ضԻ�
--�߻��ˣ�����
--�����д�ˣ��峤
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\̫��þ�\\head.lua")
Include("\\script\\̫��þ�\\award.lua")
--̫����������
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
taixu_jwl_taskID = 998
--����

--���Ի�ȡ���� ��ӦGetEquipBaGua()����ֵ��ע�ⷵ��5Ϊ̫��
tBaguaNum = {--��2��3��4Ϊ��Ʒid����5λΪ����ֵ81-120��Ҫ������  ����λ����ֵ61-80��Ҫ������
	[1]={"Kh�m",2,1,471,10,10},
	[2]={"Kh�n",2,1,470,10,10},
	[3]={"Ch�n",2,1,474,9,2},
	[4]={"T�n",2,1,476,9,2},
	[6]={"C�n",2,1,469,10,10},
	[7]={"�o�i",2,1,472,10,10},
	[8]={"C�n",2,1,475,9,3},
	[9]={"Ly",2,1,473,9,3}
	}
tWood = {
	{0,0,0,0,0,0,0,5,5},	--100������ľ����
	{0,0,5,5,0,0,0,0,0},	--100�����Ͻ����
	{0,0,0,0,0,0,0,0,0},	--80������ľ����
	{0,0,0,0,0,0,0,0,0},	--80�����Ͻ����
}

function main()
	local tbSay = {}
	local nCount =	mod(GetTask(TSK_THAIHU_DAY),100)
	if nCount >= 6 and floor(GetTask(TSK_THAIHU_DAY)/100) < 1 then
		tinsert(tbSay, "Nh�n th��ng ho�n th�nh 6 l�n Th�i H� Huy�n C�nh/Award_Max");
	end
	tinsert(tbSay, "Th�i H� Huy�n C�nh l� sao?/Hewei");
	tinsert(tbSay, "L�m sao v�o ���c Th�i H� Huy�n C�nh?/Ruhe");
	tinsert(tbSay, "Xin ch�n nh�n ��a v�o Th�i H� Huy�n C�nh/EnterTx");		
--	tinsert(tbSay, "��ȡ̫���������/WantSeed");	
	tinsert(tbSay, "S� d�ng Th�i H� B�t Qu�i b�i ��i ph�n th��ng/GetAwardPai");
	tinsert(tbSay, "Ta mu�n t�ng c�p Trang s�c Th�i H�/taixu_jwl_up_inf");		
	
	if GetLevel() >= 70 then
		tinsert(tbSay, "Ta mu�n k�ch ho�t l�c b�t qu�i c�a trang b�/choose_lingqi");
	end
	tinsert(tbSay,"K�t th�c ��i tho�i/do_nothing");
	Say("B�n ��o ph�ng m�nh C�u Thi�n Huy�n N� ��n nh�n gian �� h�a m�i ng��i ��n Th�i H� Huy�n C�nh. Th� ch� xem ra ng��i h�u duy�n ��n ��y c� chuy�n g� kh�ng?",
		getn(tbSay),tbSay)
end

function WantSeed()
	if GetPlayerRoute() == 0 then
		Talk(1,"main","Ch�a gia nh�p m�n ph�i kh�ng ���c nh�n h�t gi�ng.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 060630 then
		Talk(1,"main","H�t gi�ng �� b� l�y h�t, b�ng h�u ph�i ngh� c�ch kh�c th�i!");
		return 0;
	end;
	local nHour = tonumber(date("%H"));
	local nMapID = GetWorldPos();
	if nHour ~= 14 and nHour ~= 16 and nHour ~= 20 and nHour ~= 22 then
		SetMapTaskTemp(nMapID,2,0);
		Talk(1,"main","Th�i gian ph�t h�t gi�ng ch�a ��n. <color=yellow>M�i ng�y t� 14h - 16h; 20h - 22h<color> c� th� ��n ch� ta nh�n h�t gi�ng Th�i H� B�t Nh�, s� l��ng c� h�n nh�!");
		return 0;
	end;
	if GetLevel() < 10 then
		Talk(1,"","Kinh nghi�m giang h� ng��i c�n k�m, ��i ng��i r�n luy�n gi�i r�i quay l�i!");
		TaskTip("Tr�n c�p 10 m�i c� th� nh�n h�t gi�ng");
		return 0;
	end;
	if GetMapTaskTemp(nMapID,2) >= 10 then
		Talk(1,"main","V� s� l��ng h�t gi�ng c� h�n, b�ng h�u khi kh�c gh� l�i!");
		return 0;
	end;
	local selTab = {
				"Ta mu�n c� m�t h�t gi�ng/GiveSeed",
				"Kh�ng h�ng th�/main",
				}
	Say("S�p ��n gi� m� c�a Th�i h�. B�n ��o l�c tr��c ���c cao nh�n ban t�ng h�t gi�ng c�y Th�i H� B�t Nh�, nay mu�n t�ng l�i cho c�c anh h�ng, kh�ng bi�t � ki�n b�ng h�u ra sao:",getn(selTab),selTab);
end;

function GiveSeed()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%y%m%d"));
	local nHour = tonumber(date("%H"));
	if GetMapTaskTemp(nMapID,2) >= 10 then
		Talk(1,"main","V� s� l��ng h�t gi�ng c� h�n, b�ng h�u ng�y mai h�y quay l�i!");
		return 0;
	end;
	if GetTask(TASK_GETSEEDDATE) < nDate then
		SetTask(TASK_GETSEEDCOUNT,0);
		SetTask(TASK_GETSEEDHOUR,0);
	end;
	local nGetSeedCount = GetTask(TASK_GETSEEDCOUNT);
	if GetTask(TASK_GETSEEDHOUR) == nHour then
		Talk(1,"","M�i l�n ch� nh�n ���c 1 h�t gi�ng, b�ng h�u khi kh�c h�y quay l�i!");
		return 0;
	end;
	if nGetSeedCount >= 2 then
		Talk(1,"","Xin l�i! H�m nay ng��i �� nh�n 2 h�t gi�ng, kh�ng th� nh�n ti�p!");
		return 0;
	end;
	if AddItem(2,0,398,1) == 1 then
		Msg2Player("B�n nh�n ���c 1 h�t gi�ng c�y Th�i H� B�t Nh�");
		SetMapTaskTemp(nMapID,2,GetMapTaskTemp(nMapID,2)+1);
		SetTask(TASK_GETSEEDCOUNT,nGetSeedCount+1);
		SetTask(TASK_GETSEEDDATE,nDate);
		SetTask(TASK_GETSEEDHOUR,nHour);
		Talk(1,"","Th�i gian nh�n h�t gi�ng t� <color=yellow>13h - 14h; 21h - 22h<color>, b�ng h�u c� th� ��n <color=red>Ph� t�y Th�nh ��, ph� ��ng Bi�n Kinh, B�c Tuy�n Ch�u<color> gieo h�t gi�ng. Ngo�i ra, h�t gi�ng �� l�u s� m�t linh kh�, c�n ph�i tr�ng tr��c ng�y <color=yellow>30/6<color>.")
	end;
end;
--=========================================================����Ϊ̫���������Ӻ���===================================================
function taixu_jwl_up_inf()
	local jwl_chk_flag = 0
	for i = 29,35 do
		if GetItemCount(0,102,i) ~= 0 then
			jwl_chk_flag = 1 
			break
		end
	end
	if jwl_chk_flag == 0 then
		Talk(1,"","T�ng c�p <color=yellow>Trang s�c Th�i H�<color> hi�u qu�, ng��i"..Zgc_pub_sex_name()..", ng��i kh�ng mang theo <color=yellow>Trang s�c Th�i H�<color>�?")
	else
		if GetTask(taixu_jwl_taskID) ~= nil and GetTask(taixu_jwl_taskID) ~= 0 then
			Talk(1,"","V� <color=yellow>Trang s�c Th�i H�<color>,"..Zgc_pub_sex_name().."n�n ��n <color=yellow>T��ng D��ng <color> t�m <color=yellow>M�c Tam<color> h�i nh�, �ng �y c� th� gi�p ���c ng��i!")
		else
		Talk(4,"taixu_jwl_up_inf_2",
			"V� "..Zgc_pub_sex_name().."c�ng �� � ��n �?",
			"K� th�c nh�ng lo�i <color=yellow>Trang s�c Th�i H�<color> m� ng��i mang ��n c�ng hi�u c�a ch�ng kh�ng cao.",
			"<color=yellow>Trang s�c Th�i H�<color> kh�ng ph�t huy c�ng l�c.",
			"Ch�ng l� kh�ng c�n c�ch n�o �� ph�t huy hi�u qu� c�a ch�ng sao? Nh�ng trang s�c n�y ta ph�i v�t v� l�m m�i c� ���c ch�ng.")
		end
	end
end
function taixu_jwl_up_inf_2()
	Talk(	4,"taixu_jwl_dia_set",
			"<color=green>Th�n Du Ch�n Nh�n<color>:"..Zgc_pub_sex_name().."��ng n�ng, kh�ng ph�i l� kh�ng c� c�ch, nh�ng c� �i�u ta ch�a ngh� ra",
			"Ng��i mau ngh� ra �i.",
			"Ng��i ��n <color=yellow>T��ng D��ng <color> t�m <color=yellow>M�c Tam<color>. Ng��i  n�y tinh th�ng ch� thu�t c� th� gi�p <color=yellow>Trang s�c Th�i H�<color> c�a ng��i ph�t huy hi�u l�c.",
			"�a t� �� ch� gi�o, ta l�p t�c ��n ch� <color=yellow>M�c Tam<color> ��y.")
end
function taixu_jwl_dia_set()
	TaskTip("B�n �� nh�n nhi�m v� Trang s�c Th�i H� ��n T��ng D��ng t�m M�c Tam.")
	SetTask(taixu_jwl_taskID,1)
end
--===================================================================����==========================================================
function do_nothing()
	--do nothing
end

function choose_lingqi()
	local strtab = {
		"Ta mu�n k�ch ho�t trang b� b�t qu�i c� �i�m linh kh� d��i 60/mianfei_jihuo",
		"Ta mu�n k�ch ho�t trang b� b�t qu� �i�m linh kh� 61-79/#jihuo_bagua(2)",
		"Ta mu�n k�ch ho�t trang b� b�t qu� �i�m linh kh� 80-120/#jihuo_bagua(1)",
		"��i ch�t, �� ta xem �i�m linh kh� trang b� c�a ng��i/do_nothing"
		}
	Say("Mu�n k�ch ho�t b�t qu�i tr�n trang b�, c�n Th�i H� B�t Qu�i B�i t��ng �ng, n�u ��a �� s� l��ng ta s� kh�ch ho�t cho ng��i. H�y ch�n tr� linh kh� mu�n k�ch ho�t, tr� linh kh� <color=yellow>d��i 60<color>, ngo�i trang b� qu� <color=yellow>Ch�n v� T�n<color>, ta c� th� k�ch ho�t <color=yellow>mi�n ph�<color> nh�ng c�i kh�c cho ng��i. Kho�ng tr� linh kh� l�n h�n 60 kh�c nhau s� c�n s� l��ng Th�i H� B�t Qu�i kh�c nhau.",
		getn(strtab),
		strtab)
end

function mianfei_jihuo()
	local strtab = {
		"��u/#mianfei_jihuo_weizhi(0)",
		"Y ph�c/#mianfei_jihuo_weizhi(1)",
		"H� y/#mianfei_jihuo_weizhi(3)",
		"V� kh�/#mianfei_jihuo_weizhi(2)",
		"��i ta m�c trang b� c�n k�ch ho�t v�o./do_nothing"
		}
	Say("N�u tr� linh kh� c�a trang b� t� <color=yellow>60 tr� xu�ng<color>, k�ch ho�t <color=yellow>Ch�n v� T�n<color> qu�i trang b� c�n <color=yellow>1<color> Th�i H� B�t Qu�i b�i t��ng �ng, c�n l�i ta c� th� k�ch ho�t mi�n ph� cho ng��i. Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta. Ng��i mu�n k�ch ho�t trang b� � b� ph�n n�o?",
		getn(strtab),
		strtab)
end

function jihuo_bagua(nType)
	local strtab = {};

	if nType == 2 then
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[3][6].."M�nh Th�i H� B�t Qu�i b�i-Ch�n, �� k�ch ho�t Ch�n qu�i trang b�/#check_bagua(3,2)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[4][6].."M�nh Th�i H� B�t Qu�i b�i-T�n, �� k�ch ho�t T�n qu�i trang b�/#check_bagua(4,2)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[1][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�m, �� k�ch ho�t Kh�m qu�i trang b�/#check_bagua(1,2)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[2][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�n, �� k�ch ho�t Kh�n qu�i trang b�/#check_bagua(2,2)");
	elseif nType == 1 then
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[3][5].."c�i Th�i H� B�t Qu�i B�i - Ch�n + 5 c�i T� Kim B�t Qu�i �� k�ch ho�t m�t chi�c trang b� Tr�n Qu�i/#check_bagua(3,1)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[4][5].."c�i Th�i H� B�t Qu�i B�i - T�n + 5 c�i T� Kim B�t Qu�i �� k�ch ho�t m�t chi�c trang b� T�n Qu�i/#check_bagua(4,1)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[1][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�m, �� k�ch ho�t Kh�m qu�i trang b�/#check_bagua(1,1)");
		tinsert(strtab,"Ta mu�n d�ng "..tBaguaNum[2][5].."M�nh Th�i H� B�t Qu�i b�i-Kh�n, �� k�ch ho�t Kh�n qu�i trang b�/#check_bagua(2,1)");
	end
	tinsert(strtab,"Trang k�/#jihuo_bagua2("..nType..")");
	tinsert(strtab,"Ta kh�ng c� trang b� b�t qu�i ch�a k�ch ho�t./do_nothing");
	Say("Ng��i mu�n k�ch ho�t trang b� thu�c t�nh b�t qu�i n�o? Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta.",
		getn(strtab),
		strtab);
end

function mianfei_jihuo_weizhi(nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if nIndex == 0 then
		Talk(1,"","Ng��i kh�ng m�c n� tr�n ng��i!");
		return
	end
	if GetEquipBaGua(nIndex) == 0 then
		Talk(1,"","Trang b� ng��i �ang m�c kh�ng ph�i trang b� b�t qu�i ch�a k�ch ho�t.");
		return
	end
	local nLingqi = GetItemMaxLingQi(nIndex);
	if GetEquipBaGuaJiHuo(nIndex) ~= 0 then
		Talk(1,"","Trang b� tr�n ng��i ng��i �� k�ch ho�t r�i.")
		return
	end
	if nLingqi > 60 then
		Talk(1,"","Tr� linh kh� t� <color=yellow>60 tr� xu�ng<color>, ta c� th� mi�n ph� k�ch ho�t n�ng l�c trang b� b�t qu�i cho ng��i. Nh�ng trang b� b�t qu�i ng��i �ang m�c c�n Th�i H� B�t Qu�i b�i �� k�ch ho�t.");
		return
	elseif nLingqi == 0 then
		Talk(1,"","Trang b� ng��i �ang m�c kh�ng ph�i trang b� b�t qu�i.")
		return
	end
	if GetEquipBaGua(nIndex) == 3 then
		if GetItemCount(tBaguaNum[3][2],tBaguaNum[3][3],tBaguaNum[3][4]) < 1 then
			Talk(1,"","Mu�n k�ch ho�t Ch�n qu�i trang b�, c�n 1 Ch�n B�n, ng��i kh�ng c� Ch�n B�n.");
			return
		else
			Say("Ng��i quy�t ��nh k�ch ho�t <color=yellow>Ch�n<color> qu�i trang b�? Ti�u hao 1 Ch�n B�n.",
				2,
				"��ng, ta mu�n k�ch ho�t/#jihuo_zhengua(3,"..nWz..")",
				"�� ta suy ngh� l�i/do_nothing")
			return
		end
	end
	if GetEquipBaGua(nIndex) == 4 then
		if GetItemCount(tBaguaNum[4][2],tBaguaNum[4][3],tBaguaNum[4][4]) < 1 then
			Talk(1,"","Mu�n k�ch ho�t T�n qu�i trang b�, c�n 1 T�n B�n, ng��i kh�ng c� T�n B�n.");
			return
		else
			Say("Ng��i quy�t ��nh k�ch ho�t <color=yellow>T�n<color> qu�i trang b�? Ti�u hao 1 T�n B�n.",
				2,
				"��ng, ta mu�n k�ch ho�t/#jihuo_zhengua(4,"..nWz..")",
				"�� ta suy ngh� l�i/do_nothing")
			return
		end
	end
	if nLingqi > 0 and nLingqi <= 60 and GetEquipBaGuaJiHuo(nIndex) == 0 then
		local tZhuangBei = {"��u","Y ph�c","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[nWz+1].."Trang b� thu�c t�nh b�t qu�i");
	end
end

function check_bagua(nType,nLqType)
	if nLqType == 1 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][5] then
			Talk(1,"","thu th�p �� Th�i H� B�t Qu�i b�i r�i quay l�i t�m ta, b�y nhi�u �� sao c� th� k�ch ho�t.");
			return
		end
	elseif nLqType == 2 then
		if GetItemCount(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4]) < tBaguaNum[nType][6] then
			Talk(1,"","thu th�p �� Th�i H� B�t Qu�i b�i r�i quay l�i t�m ta, b�y nhi�u �� sao c� th� k�ch ho�t.");
			return
		end
	end
	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if GetItemCount(2,95,550) < nCount1 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� Th�n M�c B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if GetItemCount(2,95,551) < nCount2 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� T� Kim B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end
		local nMaoziIndex = GetPlayerEquipIndex(0);
		local nYifuIndex = GetPlayerEquipIndex(1);
		local nKuziIndex = GetPlayerEquipIndex(3);
		local nWuqiIndex = GetPlayerEquipIndex(2);
		local strtab = {} ;
		if GetEquipBaGua(nMaoziIndex) == nType and GetEquipBaGuaJiHuo(nMaoziIndex) == 0 then
			tinsert(strtab,"��u/#item_jihuo("..nMaoziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nYifuIndex) == nType and GetEquipBaGuaJiHuo(nYifuIndex) == 0 then
			tinsert(strtab,"Y ph�c/#item_jihuo("..nYifuIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nKuziIndex) == nType and GetEquipBaGuaJiHuo(nKuziIndex) == 0 then
			tinsert(strtab,"H� y/#item_jihuo("..nKuziIndex..","..nLqType..","..nType..")");
		end
		if GetEquipBaGua(nWuqiIndex) == nType and GetEquipBaGuaJiHuo(nWuqiIndex) == 0 then
			tinsert(strtab,"V� kh�/#item_jihuo("..nWuqiIndex..","..nLqType..","..nType..")");
		end
		if getn(strtab) == 0 then
			Talk(1,"","Ng��i kh�ng c� trang b� ch�a k�ch ho�t t��ng �ng v�i thu�c t�nh b�t qu�i n�y.");
		else
			tinsert(strtab,"Th�i ta kh�ng k�ch ho�t n�a./do_nothing");
			Say("Ng��i quy�t ��nh k�ch ho�t thu�c t�nh b�t qu�i n�o? H�y ch�n trang b� c�n k�ch ho�t tr�n ng��i ng��i.",getn(strtab),strtab) --..tBaguaNum[nType][1].."
		end
end

function jihuo_bagua2(nType)
	if nType == 1 then
		local strtab = {
			"Ta mu�n d�ng "..tBaguaNum[6][5].."M�nh Th�i H� B�t Qu�i b�i-C�n, �� k�ch ho�t C�n qu�i trang b�/#check_bagua(6,1)",
			"Ta mu�n d�ng "..tBaguaNum[7][5].."M�nh Th�i H� B�t Qu�i b�i-�o�i, �� k�ch ho�t �o�i qu�i trang b�/#check_bagua(7,1)",
			"Ta mu�n d�ng "..tBaguaNum[8][5].."c�i Th�i H� B�t Qu�i B�i - C�n + 5 c�i Th�n M�c B�t Qu�i �� k�ch ho�t m�t chi�c trang b� C�n Qu�i/#check_bagua(8,1)",
			"Ta mu�n d�ng "..tBaguaNum[9][5].."c�i Th�i H� B�t Qu�i B�i - Ly + 5 c�i Th�n M�c B�t Qu�i �� k�ch ho�t m�t chi�c trang b� Ly Qu�i/#check_bagua(9,1)",
			"Trang tr��c/#jihuo_bagua("..nType..")",
			"Ta kh�ng c� trang b� b�t qu�i ch�a k�ch ho�t./do_nothing"
			}
		Say("Ng��i mu�n k�ch ho�t trang b� thu�c t�nh b�t qu�i n�o? Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta.",
			getn(strtab),
			strtab);
	elseif nType == 2 then
		local strtab = {
			"Ta mu�n d�ng "..tBaguaNum[6][6].."M�nh Th�i H� B�t Qu�i b�i-C�n, �� k�ch ho�t C�n qu�i trang b�/#check_bagua(6,2)",
			"Ta mu�n d�ng "..tBaguaNum[7][6].."M�nh Th�i H� B�t Qu�i b�i-�o�i, �� k�ch ho�t �o�i qu�i trang b�/#check_bagua(7,2)",
			"Ta mu�n d�ng "..tBaguaNum[8][6].."M�nh Th�i H� B�t Qu�i b�i-C�n, �� k�ch ho�t C�n qu�i trang b�/#check_bagua(8,2)",
			"Ta mu�n d�ng "..tBaguaNum[9][6].."M�nh Th�i H� B�t Qu�i b�i-Ly, �� k�ch ho�t Ly qu�i trang b�/#check_bagua(9,2)",
			"Trang tr��c/#jihuo_bagua("..nType..")",
			"Ta kh�ng c� trang b� b�t qu�i ch�a k�ch ho�t./do_nothing"
			}
		Say("Ng��i mu�n k�ch ho�t trang b� thu�c t�nh b�t qu�i n�o? Ch� �, ta kh�ng r�nh ki�m tra h�nh trang c�a ng��i, h�y �em trang b� c�n k�ch ho�t ��n g�p ta.",
			getn(strtab),
			strtab);
	end
end

function item_jihuo(nIndex,nLqType,nType)
	local tZhuangBei = {"��u","Y ph�c","V� kh�","H� y"};
	local nLingqi = GetItemMaxLingQi(nIndex);
	if nLqType == 1 then
		if nLingqi < 80 or nLingqi > 120 then
			Talk(1,"","Sai r�i, linh kh� trang b� c�a ng��i kh�ng ph�i t� 80-120.");
			return
		end
	end
	if nLqType == 2 then
		if nLingqi <= 60 or nLingqi >= 80 then
			Talk(1,"","Sai r�i, linh kh� trang b� c�a ng��i kh�ng ph�i t� 60-80.");
			return
		end
	end

	local nCount1 = tWood[nLqType * 2 - 1][nType];
	if nCount1 > 0 and DelItem(2,95,550, nCount1) ~= 1 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� Th�n M�c B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end
	local nCount2 = tWood[nLqType * 2][nType];
	if nCount2 > 0 and DelItem(2,95,551, nCount2) ~= 1 then
		Talk(1, "", "<color=green>Th�n Du Tr�n Nh�n<color>: c� �� T� Kim B�t Qu�i  r�i ��n g�p t�i, ch� c� m�y c�i n�y l�m sao k�ch ho�t ���c.");
		return
	end

	if nLqType == 1 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][5]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
				  SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[i].."Trang b� thu�c t�nh b�t qu�i");
					break;
				end
			end
		end
	elseif nLqType == 2 then
		if DelItem(tBaguaNum[GetEquipBaGua(nIndex)][2],tBaguaNum[GetEquipBaGua(nIndex)][3],tBaguaNum[GetEquipBaGua(nIndex)][4],tBaguaNum[GetEquipBaGua(nIndex)][6]) == 1 then
			for i=1,4 do
				if GetPlayerEquipIndex(i-1) == nIndex then
					SetEquipBaGuaJiHuo(nIndex,1);
					Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[i].."Trang b� thu�c t�nh b�t qu�i");
					break;
				end
			end
		end
	end
end

function jihuo_zhengua(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz);
	if DelItem(tBaguaNum[nType][2],tBaguaNum[nType][3],tBaguaNum[nType][4],1) == 1 then
		local tZhuangBei = {"��u","Y ph�c","V� kh�","H� y"};
		SetEquipBaGuaJiHuo(nIndex,1);
		Msg2Player("Ch�c m�ng b�n �� k�ch ho�t."..tZhuangBei[nWz+1].."Trang b� thu�c t�nh b�t qu�i");
	end
end