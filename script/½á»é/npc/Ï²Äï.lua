Include("\\script\\���\\marriage_head.lua");

COST_BLESS 		= 18			--ף�������Ǯ��18��

	
CALLBACK_FILE	= "\\script\\���\\npc\\ϲ��.lua"		-- �ص��ļ���

this_date 		= 0		-- ����
this_period 	= 0		-- ʱ��
this_bridegroom = ""	-- ����
this_bride		= ""	-- ����
g_inited = 0;

g_InfoHeader = "<color=green>H� N��ng<color>:";

function main()
	if (this_date ~= curr_date() or this_period ~= curr_period()) or g_inited == 0 then
		init()
		return
	end
	-- ��ͬ��ݵ��˿����ĶԻ���ͬ
	local caption = g_InfoHeader.."��ng qu� lo l�ng, m�i vi�c �� c� H� n��ng ��y lo li�u"
	local name = GetName()
	local selTab = {};
	local selCount = 0;
	if (is_compere() == 1 or is_field_owner() == 1) then
		selCount = selCount + 1;
		selTab[selCount] = "Ta mu�n c� h�nh h�n l�/have_wedding";
		selCount = selCount + 1;
		selTab[selCount] = "Ta mu�n b�y ti�c r��u/feast";
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "Ta mu�n ch�c m�ng t�n lang, t�n n��ng!/#bless(1)";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		if GetFightState() == 1 then
			selTab[selCount] = "Hi�n kh�ng mu�n xu�t chi�u/changefightstate";
		else
			selTab[selCount] = "Kh�ch ��n ��ng qu�/changefightstate";
		end;
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "H�ng bao t�ng cho ��i uy�n ��ng/give_present";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		selTab[selCount] = "�a t� H� n��ng �� thay ta nh�n H�ng bao, b�y gi� c� th� cho ta xin l�i./get_present";	
	end;
	selCount = selCount + 1;
	selTab[selCount] = "Kh�ng c� vi�c g�/cancel";
	Say(caption,getn(selTab),selTab);
end
--�ǲ��ǳ��ص�����
function is_field_owner()
	local name = GetName()
	if name == GetMissionS(MS_BRIDEGROOM) or name == GetMissionS(MS_BRIDE) then
		return 1;
	else
		return 0;
	end;
end;

function give_present()
	local selTab = {
			"T�ng "..ITEM_HONGBAO[1][4].."1/#give_present_confirm(1)",
			"T�ng "..ITEM_HONGBAO[2][4].."1/#give_present_confirm(2)",
			"T�ng "..ITEM_HONGBAO[3][4].."1/#give_present_confirm(3)",
			"�� ta xem/cancel",
			}
	Say(g_InfoHeader.."Kh�ng bi�t ��i hi�p mu�n t�ng lo�i H�ng bao n�o?",getn(selTab),selTab);
end;

function give_present_confirm(nType)
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		Talk(1,"",g_InfoHeader.."Ng��i �� c� l�ng, nh�ng ti�c l� h�n l� �� k�t th�c, hay l� t�n tay trao cho h� v�y nh�!");
		return 0;
	end;
	if DelItem(ITEM_HONGBAO[nType][1],ITEM_HONGBAO[nType][2],ITEM_HONGBAO[nType][3],1) == 1 then
		Say(g_InfoHeader.."�a t� ��i hi�p, ta s� chuy�n cho h�.",0);
		Msg2MSAll(MISSION_ID,GetName().."G�i cho ��i uy�n ��ng"..ITEM_HONGBAO[nType][4].."1");
		local nCurrHongBao = GetMissionV(MV_DAHONGBAO_COUNT+nType-1);
		SetMissionV(MV_DAHONGBAO_COUNT+nType-1,nCurrHongBao+1)
		WriteLog("[K�t h�n]:"..GetName().."H�ng bao, lo�i:"..nType);
	else
		Talk(1,"",g_InfoHeader.."Ng��i kh�ng mang theo"..ITEM_HONGBAO[nType][4].."? Hay l� b�t c�n l�m r�i ��u r�i?");
	end;
end;

function get_present()
	if GetSex() == 2 then
		Talk(1,"",g_InfoHeader.."T�n n��ng mang nhi�u h�ng bao nh� v�y kh�ng an to�n, hay l� ��i t�n lang ��n");
		return 0;
	end;
	local selTab = {
			"��ng �/get_present_confirm",
			"Ta s� l�nh sau v�y!/cancel",
			}
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	local sString = "";
	if nDaHongBao > 0 then
		sString = sString..nDaHongBao.." ��i h�ng bao Ho�ng Kim,"
	end;
	if nZhongHongBao > 0 then
		sString = sString..nZhongHongBao.." ��i h�ng bao T� Kim,"
	end;
	if nXiaoHongBao > 0 then
		sString = sString..nXiaoHongBao.." H�ng bao,"
	end;
	if sString == "" then
		Talk(1,"main",g_InfoHeader.."V�n ch�a nh�n ���c H�ng bao.");
		return 0;
	end;
	Say(g_InfoHeader.."T�t c� s� H�ng bao ��u � ��y, c� t�t c�"..sString.."Ng��i l�y h�t s� H�ng bao ch�?",getn(selTab),selTab);
end;

function get_present_confirm()
	if gf_JudgeRoomWeight(4,5) == 0 then
		Talk(1,"",g_InfoHeader.."Kho�ng tr�ng trong h�nh trang kh�ng ��!");
		return 0;
	end;
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	SetMissionV(MV_DAHONGBAO_COUNT,0);
	SetMissionV(MV_ZHONGHONGBAO_COUNT,0);
	SetMissionV(MV_XIAOHONGBAO_COUNT,0);
	if nDaHongBao > 0 then
		AddItem(ITEM_HONGBAO[1][1],ITEM_HONGBAO[1][2],ITEM_HONGBAO[1][3],nDaHongBao);
		WriteLog("[K�t h�n]:"..GetName().."Nh�n ���c"..nDaHongBao.." ��i h�ng bao Ho�ng Kim");
		Msg2Player("B�n nh�n ���c "..nDaHongBao.."c�i"..ITEM_HONGBAO[1][4]);
	end;
	if nZhongHongBao > 0 then
		AddItem(ITEM_HONGBAO[2][1],ITEM_HONGBAO[2][2],ITEM_HONGBAO[2][3],nZhongHongBao);
		WriteLog("[K�t h�n]:"..GetName().."Nh�n ���c"..nZhongHongBao.." ��i h�ng bao T� Kim");
		Msg2Player("B�n nh�n ���c "..nZhongHongBao.."c�i"..ITEM_HONGBAO[2][4]);
	end;
	if nXiaoHongBao > 0 then
		AddItem(ITEM_HONGBAO[3][1],ITEM_HONGBAO[3][2],ITEM_HONGBAO[3][3],nXiaoHongBao);
		WriteLog("[K�t h�n]:"..GetName().."Nh�n ���c"..nXiaoHongBao.." Ti�u h�ng bao");
		Msg2Player("B�n nh�n ���c "..nXiaoHongBao.."c�i"..ITEM_HONGBAO[3][4]);
	end;
end;
--ת��״̬
function changefightstate()
	local tMsg = {"H�m nay l� ng�y ��i h� c�a 2 v�, h�y h��ng h�nh ph�c, xin ��ng ��ng th�.",
				"Kh�ng h� l� giang h� n� nhi, cho c�c v� quan kh�ch n�y th�y t�i v� ngh� �i",
				}
	SetFightState(1-GetFightState());
	Say(g_InfoHeader..tMsg[GetFightState()+1],0);
end

function init()
	local mapid, x, y = GetWorldPos()
	local param2 = encode_param2(curr_period(), map_field2type[mapid])
	ApplyRelayShareData(KEY_WEDDING, curr_date(), param2, CALLBACK_FILE, "hook_recvsubs")
	WriteLog("[K�t h�n]: H� n��ng s�n kh�u k�t h�n, tham s� 1:"..curr_date()..", tham s� 2:"..param2);
end

-- �ص���������ȡ����Ԥ����Ϣ
function hook_recvsubs(key, param1, param2, count)
	-- �ó��ظ�ʱ�ο���
	if (count ~= 0) then
		this_date = param1
		local this_period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		SetMissionS(MS_BRIDEGROOM,role)
		SetMissionS(MS_BRIDE,wife)
		this_bridegroom = role;
		this_bride = wife;
	end
	this_date = curr_date()
	this_period = curr_period()
	g_inited = 1;
	map_talk = {
		{
			"��i phu th� b��c v�o s�nh ���ng, kh�ng kh� t�ng b�ng h�n l�n.",
			"H�m nay l� ng�y ��i h� c�a ��i t�n n��ng v� t�n lang! �a t� c�c v� �� ��n ch�c m�ng."
		},
		{
			"T�n n��ng s�p l�n ki�u hoa, h�y ��t ph�o l�n!",
			"��i kh�n ��~��t ph�o!"
		},
		{
			"T�n n��ng v� t�n lang ��n kh�ch, bu�i ti�c s�p b�t ��u!",
			"M�i c�c v� v�o b�n nh�p ti�c!"
		},
		{
			"T�n lang v� t�n n��ng s�p b�i thi�n ��a, chu�n b� ph�o v� l� hoa",
			"Xin c�c v� quan kh�ch chu�n b� ph�o v� l� hoa ch�c ph�c cho ��i t�n t�n lang v� t�n n��ng!"
		},
		{
			"M�i quan kh�ch �n k�o m�ng!",
			"Ch�c cho t�n lang v� t�n n��ng ��u b�c r�ng long. Ch�c cho nh�ng ng��i ch�a y�u g�p ���c ng��i trong m�ng!"
		},
		{
			"L�c n�y c�c v� quan kh�ch c� th� g�i qu� t�ng cho t�n phu th�!",
			"Qu� l�n, qu� nh� c�ng ��u l� l�ng th�nh c�. Xin �a t� c�c v� �� ��n d�!"
		},
		{
			"H�n l� k�t th�c! T�n lang v� t�n n��ng chu�n b� ��ng ph�ng!",
			"T�n lang, t�n n��ng v�o ph�ng hoa ch�c~"
		},
	}
	main()
	WriteLog("[K�t h�n]: S�n kh�u k�t h�n k�t th�c, tham s� 1:"..param1..", tham s� 2:"..param2);
end

-- ��ȡ���񳡵����»�򸾵�����
function get_couple()
	return GetMissionS(MS_BRIDEGROOM), GetMissionS(MS_BRIDE)
end


function have_wedding()
	Say(g_InfoHeader.."Theo ng��i x�a nghi th�c h�n l� g�m c�c b��c sau:",
		8,
		"Nghinh th�n/#wedding_process(1)",
		"Tam s�t/#wedding_process(2)",
		"��i kh�n/#wedding_process(3)",
		"b�i thi�n ��a/#wedding_process(4)",
		"Th�o kh�n/#wedding_process(5)",
		"T�ng v�ng/#wedding_process(6)",
		"��ng ph�ng/#wedding_process(7)",
		"Thuy�t minh/wedding_process_info",
		"Trang tr��c./main")
end

function wedding_process(step)
	Say(g_InfoHeader..map_talk[step][1],
		2,
		format("��ng �/#confirm(%d)", step),
		"H�y b�/cancel")
end

function confirm(step)
	if step == 4 then	--�����
		SetMissionV(MV_CAN_MARRY,1);	--���Խ����
	end;
	Msg2MSAll(MISSION_ID,map_talk[step][2])
end

--��������˵��
function wedding_process_info()

local Talk_str = {
	g_InfoHeader.."<color=yellow>Nghinh th�n<color> ��n kh�ch v�o s�n kh�u k�t h�n, b�ng h�u c� th� ��n <color=yellow>D�ch v� h�n nh�n<color> mua <color=yellow>L� hoa<color>cho kh�ng kh� th�m ph�n h�ng kh�i.",
	g_InfoHeader.."<color=yellow>Tam s�t<color> g�m Thanh d��ng, � k� v� Thanh ng�u. T��ng truy�n ch�ng th��ng c�n ���ng kh�ng cho ng��i m�i v�o nh�, v� v�y ph�i <color=yellow>��t ph�o<color> �� xua �u�i ch�ng",
	g_InfoHeader.."<color=yellow>��i kh�n<color> T�n n��ng ��i kh�n �� t��ng tr�ng cho gi�a 2 ng��i �� c� m�i d�y li�n k�t kh�ng th� l�a xa.",
	g_InfoHeader.."<color=yellow>B�i thi�n ��a<color> �� t� �n tr�i ��t. ��i t�n lang, t�n n��ng t� nay s� s�ng ��n ��u b�c r�ng long, con ch�u ��y ��n.",
	g_InfoHeader.."<color=yellow>Th�o kh�n<color> T��ng tr�ng cho t�n phu th� s� s�m sinh qu� t�, cu�c s�ng h�nh ph�c, con c�i th�nh ��t.",
	g_InfoHeader.."<color=yellow>T�ng ti�n v�ng<color>, th��ng ���c �� v�o h�ng bao, mong mu�n cho ��i phu th� c� cu�c s�ng sung t�c. H�ng bao c� t�h mua � <color=yellow>D�ch v� h�n nh�n<color>",
	g_InfoHeader.."<color=yellow>��ng ph�ng<color> nghi th�c sau c�ng trong h�n l�.",	
	}
	
	Talk(getn(Talk_str),"",Talk_str);

end

map_bless = {
	"Thi�n T�c H�p", 
	"T�m t�m t��ng �nh",
	"V�nh K�t ��ng T�m",
	"T��ng Th�n T��ng �i",
	"B�ch Ni�n H�o H�p",
	"V�nh D�c �i H�",
	"Giai Ng�u Thi�n Th�nh",
	"B�ch ��u Giai L�o", 
	"B�ch Ni�n C�m S�t", 
	"B�ch Ni�n Giai L�o",
	"�o�n t� sum v�y",
	"Ph�c L�c Uy�n ��ng",
	"Thi�n duy�n tr�ng h�p",
	"M� m�n l��ng duy�n",
	"Trai t�i g�i s�c",
	"T�m ��u � h�p",
	"Phu x��ng ph� t�y",
	"X�ng ��i v�a l�a",
	"Hoa th�m tr�i ng�t",
	"C�m s�t h�p minh",
	"T��ng k�nh nh� t�n",
	"��ng ��c ��ng t�m", 
	"Nh� c� c�m s�t",
	"Hoa khai t�nh ��",
	"�� k�t l��ng duy�n",
	"Duy�n ��nh tam sinh",
	"Uy�n uy�n b�ch h�p",
	"V�n ��nh C�t T��ng",
	"Nh�n duy�n t��ng ph�i", 
	"B�ch th� th�nh ��c",
	"Minh k�t l��ng duy�n"
}

function bless_talk(talk)
	Say(g_InfoHeader.."C� mu�n g�i l�i ch�c ��n ��i t�n phu th� kh�ng? H� th�ng s� chuy�n l�i ch�c c�a b�n l�n d�ng th�ng b�o. Ch� c�n t�n <color=red>"..COST_BLESS.."<color> ng�n l��ng. Xin ch�n c�u ch�c",
		getn(talk), talk)
end

STEP_COUNT = 8
function bless(step)
	local talk = {}
	local index = 0
	local from = floor((step - 1) * STEP_COUNT + 1)
	local to = floor(step * STEP_COUNT)
	if (to > getn(map_bless)) then
		to = getn(map_bless)
	end
	
	for i = from, to do
		index = index + 1
		talk[index] = format("%s/#process_bless(%d)", map_bless[i], i)
	end
	if (from ~= 1) then
		index = index + 1
		talk[index] = format("Trang tr��c/#bless(%d)", floor(step - 1))
	end
	if (to ~= getn(map_bless)) then
		index = index + 1
		talk[index] = format("Trang k�/#bless(%d)", floor(step + 1))
	end
	talk[index + 1] = "�� ta ngh� l�i/cancel"
	
	bless_talk(talk)	
end

function process_bless(index)
	if (Pay(COST_BLESS*10000) ~= 1) then
		Talk(1, "", g_InfoHeader.."Ng��i kh�ng �� ng�n l��ng")
		return
	end
	local husband, wife = get_couple()
	Msg2MSAll(MISSION_ID,format("%s ch�c %s v� %s%s",
		GetName(),
		husband,
		wife,
		map_bless[index]))
end

-- ��ϯ
function feast()
	local selTab = {
				"Xem m�n �n tr�n b�n th� n�o/see_feast",
				"Ta ph�i g�i th�c �n ��i kh�ch/add_foods",
				"T�m th�i kh�ng c�n/cancel",
				}
	Say(g_InfoHeader.."H�m nay l� ng�y ��i h�, c� bao nhi�u quan kh�ch ��n ch�c m�ng. H�y tr� t�i n�u n��ng c�a b�n ��i quan kh�ch �i n�o!",getn(selTab),selTab);
end

function see_feast()
	local sFoodString = MR_GetFoodsString(2)
	local selTab = {
			"G�i th�c �n th�i/add_foods",
			"�� ta xem/cancel",
			}
	if sFoodString == "" then
		Say(g_InfoHeader.."Tr�n b�n ti�c �� kh�ng c�n th�c �n, g�i th�m th�c �n cho kh�ch ch�?",getn(selTab),selTab);
		return 0;
	end;
	Say(g_InfoHeader.."Hi�n v�n c�n"..sFoodString.."C� ph�i g�i th�m th�c �n kh�ng?",getn(selTab),selTab				);
end;

function add_foods()
	local selTab = {
			"Kh�ng sao, phi�n b�ng h�u qu�/add_foods_check",
			"�� ta ngh� xem c�n ph�i d�n m�n g�/cancel",
			}
	Say(g_InfoHeader.."V� �� thu�n ti�n cho c�c ng��i, ta s� <color=yellow>d�n t�t c� c�c m�n �n l�n c�ng m�t l�c<color>. Kh�ng v�n �� g� ch�?",getn(selTab),selTab);
end;

function add_foods_check()
	local sFoodString = MR_GetFoodsString(1);
	if sFoodString == "" then
		Talk(1,"",g_InfoHeader.."Ng��i ch�a chu�n b� m�n �n �?");
		return 0;
	end;
	local selTab = {
			"L� nh�ng m�n n�y, d�n l�n th�i/add_foods_confirm",
			"Ta suy ngh� l�i/cancel",
			}
	Say(g_InfoHeader.."C�c m�n d�n l�n g�m c�:"..sFoodString.."Ng��i x�c nh�n l� nh�ng m�n n�y ch�?",getn(selTab),selTab);
end;

function add_foods_confirm()
	local nCurrFoodCount = 0;
	local nMSValueID = 0;
	local nTag = 0;
	for i=1,getn(tFoods) do
		nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		if nFoodCount > 0 then
			DelItem(tFoods[i][1],tFoods[i][2],tFoods[i][3],nFoodCount);
			nMSValueID = MV_FOOD_BEGIN+i-1;
			if nMSValueID < MV_FOOD_BEGIN or nMSValueID > MV_FOOD_END then
				Talk(1,"",g_InfoHeader.."Xin l�i, c� m�t ch�t s� xu�t, th�c �n v�n ch�a d�n l�n.");
				return 0;
			end;
			nCurrFoodCount = GetMissionV(nMSValueID);
			SetMissionV(nMSValueID,nCurrFoodCount+nFoodCount);	
			nTag = 1;
		end;
	end;
	if nTag == 1 then
		Talk(1,"",g_InfoHeader.."Th�c �n �� d�n l�n b�n ti�c r�i, m�i qu� kh�ch n�ng ly!");
		Msg2MSAll(MISSION_ID,"Nh�ng m�n ngon n�y ��u do T�n n��ng v� t�n lang t� tay ch� bi�n, m�i qu� kh�ch th��ng th�c!");
	end;
end;
