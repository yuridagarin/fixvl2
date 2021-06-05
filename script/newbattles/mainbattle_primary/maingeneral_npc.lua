--filename:maingeneral_npc.lua
--create date:2006-06-27
--describe:��ս����˫�������ű�
Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");

sSongGeneral = "D��ng Nghi�p";
sLiaoGeneral = "Gia Lu�t H�u C�ch";

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Ch�y th�i! L�a k�o ��n n�i r�i!");
	end;
	local selTab = {
			"B�i c�nh/knowbackground",
			"Quy t�c chi�n tr��ng/knowbattlerule",
			"K�t th�c ��i tho�i/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>: Th�i gian quy�t chi�n �� ��n, ta t� h�o c�c t��ng s� tham gia tr�n chi�n ng�y h�m nay.",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	local sEnemyCampName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		sEnemyCampName = "Li�u";
	else
		sNpcName = sLiaoGeneral;
		sEnemyCampName = "T�ng";
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: Ng�c M�n quan ��a th� hi�m tr� v�i nhi�u ���ng nh� th�ng su�t. Ba h�a ph�o tr�n ��nh c� th� kh�ng ch� to�n c�c di�n. Ch�nh gi�a chi�n tr��ng l� n�i d�n l�ng tu t�p, c� r�t nhi�u �i�m t�i nguy�n v� n�n d�n, n�u kh�ng ch� ���c h� ta tin n�m ch�c ph�n th�ng. C�c v� c� g�ng l�n!");
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Trong th�i gian chi�n ��u gi�t ���c ch� so�i xem nh� chi�n th�ng; <enter>2: H�t th�i gian, ch�a gi�t ���c s� d�a v�o �i�m t�ch l�y c�ng c�ng quy�t ��nh, s� �i�m b�ng nhau xem nh� h�a.<enter>3: T�ch l�y t�i �a <color=yellow>"..POINT_LIMITED.."<color><enter>4: Nh�n ���c <color=yellow>"..EMPEROR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v�n<enter>5: ���c b�u l�m Ng�i sao chi�n tr��ng+�i�m t�ch l�y <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v�n");
end;
