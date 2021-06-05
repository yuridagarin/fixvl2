--filename:maingeneral_npc.lua
--create date:2006-06-05
--describe:��������ս����˫�������ű�
Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");

sSongGeneral = "H� l�nh ��";
sLiaoGeneral = "Ti�u Lan ��t";

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
	Say("<color=green>"..sNpcName.."<color>: L��ng th�o c�ng nhi�u c�ng c� l�i trong chi�n ��u, nh�ng ph�i c�n th�n v�i th� d�n, h� kh�ng d� g� ��i ph�.",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh�n M�n Quan-Th�o c�c chi�n ch�a nhi�u l��ng th�o. Theo d� th�m h�i b�o, phe Li�u c� kh� n�ng cho l�nh ��n c��p b�t k� l�c n�o, v� v�y khi v�o chi�n tr��ng c�n ph�i tranh th� th�i gian!");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Nh�n M�n Quan-Th�o c�c chi�n ch�a nhi�u l��ng th�o. Theo d� th�m h�i b�o, phe T�ng c� kh� n�ng cho l�nh ��n c��p b�t k� l�c n�o, v� v�y khi v�o chi�n tr��ng c�n ph�i tranh th� th�i gian!");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Th�i gian chi�n ��u 30 ph�t <enter>2: Phe n�o t�ch l�y l��ng th�o nhi�u h�n s� th�ng<enter>3: �i�m t�ch l�y cao nh�t<color=yellow>"..POINT_LIMITED.."<color><enter>4: Gi�i h�n pk<enter>5: Nh�n ���c ph�n th��ng c�a Ho�ng �� + �i�m t�ch l�y <color=yellow>"..EMPEROR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v�n<enter>6: ���c b�u l�m ng�i sao chi�n tr��ng+�i�m t�ch l�y <color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v�n");
end;

function wantaward()

end;