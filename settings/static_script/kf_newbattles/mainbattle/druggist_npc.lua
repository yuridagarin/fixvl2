--filename:druggist_npc.lua
--create date:2006-12-19
--describe:��ս����ս��ҩƷ����ٽű�
Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");
g_NpcName = "Qu�n nhu quan";
function main()
	local nNpcIndex = GetTargetNpc();
	local selTab = {
				"Nh�n mi�n ph� d��c ph�m chi�n tr��ng/get_free_medicine",
				"��i �i�m t�ch l�y l�y d��c ph�m chi�n tr��ng/buy_medicine",
				"K�t th�c ��i tho�i/nothing",
				}
	local nPlayerCamp = BT_GetCamp();
	local nResourceCamp = GetGlbValue(GLB_RESOURCE);
	local szSaySth = "";
	if nPlayerCamp ~= nResourceCamp then
		tremove(selTab,1);	--ʧ�ܷ�������ȡ���ҩ
		tremove(selTab,1);	--ʧ�ܷ������û��ֻ�ר��ҩ
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"Hi�n ch�a c� d��c ph�m, xin quay l�i sau!");
		end;
		szSaySth = "Hi�n ch�a c� d��c ph�m, xin quay l�i sau!";
	else
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"Mu�n mua d��c ph�m c� ��n ch� ta xem th�.");
		end;
		szSaySth = "Ch� ta cung c�p m�t s� thu�c mi�n ph�, m�i xem qua!";
	end;
	Say("<color=green>"..g_NpcName.."<color>: "..szSaySth,getn(selTab),selTab);
end;

function get_free_medicine()
	if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		Talk(1,"main","<color=green>"..g_NpcName.."<color>: D��c ph�m kh�ng nhi�u, m�i ng��i ch� ���c nh�n m�t l�n.");
		return 0;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then
		give_medicine();
	else
		Talk(1,"","<color=green>"..g_NpcName.."<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
	end;
end;

function give_medicine()
	BT_SetData(PTNC_GOT_MEDICINE,1);
	AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],30);
	AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],30);
	AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],30);
	Msg2Player("B�n nh�n ���c m�t �t thu�c chuy�n d�ng");
end;

function buy_medicine()

end;