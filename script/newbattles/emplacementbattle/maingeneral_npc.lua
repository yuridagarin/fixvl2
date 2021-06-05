--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:��̨����ս����˫�������ű�
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

sSongGeneral = "D��ng T�i H�ng";
sLiaoGeneral = "Ti�u Vi�n S�n";
-- Bit quy ��nh t�ng t�n c�ng c�a Ph�o ��i
SONG_BIT = 3
LIAO_BIT = 7

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 23 then
		return 0;
	end;
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch�y th�i! L�a k�o ��n n�i r�i!");
	end;
	local selTab = {			
			"B�i c�nh/knowbackground",
			"Quy t�c chi�n tr��ng/knowbattlerule",
			"Nguy�n So�i ph�t l�nh t�ng t�n c�ng/battle_charge",
			"K�t th�c ��i tho�i/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: Ph�o ��i l� c� �i�m quan tr�ng m� ch�ng ta c�n chi�m l�nh",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Chi�n d�ch l�n n�y c�n ph�i chi�m gi� ph�o ��i, kh�ng ch� c�a �i Nh�n M�n Quan. C�c chi�n binh! Ti�n l�n!!!");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Chi�n d�ch l�n n�y c�n ph�i chi�m gi� ph�o ��i, kh�ng ch� c�a �i Nh�n M�n Quan. C�c chi�n binh! Ti�n l�n!!!");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Phe n�o chi�m l�nh ph�o ��i Nh�n M�n Quan l�u nh�t s� chi�n th�ng<enter>2: Khu v�c chi�n ��u, kh�ng h�n ch� pk<enter>3: �i�m t�ch l�y t�i �a <color=yellow>"..POINT_LIMITED.."<color><enter>4: Nh�n ���c <color=yellow>"..EMPEROR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v�n<enter>5: ���c b�u l�m Ng�i sao chi�n tr��ng+�i�m t�ch l�y <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v�n");
end;
