--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:��������ս����˫�������ű�
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");

sSongGeneral = "Phan Nh�n M�";
sLiaoGeneral = "Gia Lu�t Sa";

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
	Say("<color=green>"..sNpcName.."<color>: � Th�n trang chi�n ch� y�u t�m th� l�nh th� d�n, tr�nh g�y th��ng vong!",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Bi�t ng��i bi�t ta, tr�m tr�n tr�m th�ng, ta ch� y�u t�m th� l�nh th� d�n, nh� h� gi�p ��");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>: Bi�t ng��i bi�t ta, tr�m tr�n tr�m th�ng, ta ch� y�u t�m th� l�nh th� d�n, nh� h� gi�p ��");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1: Phe n�o t�m ���c Th� l�nh Th� d�n tr��c s� gi�nh chi�n th�ng<enter>2: Th�i gian: 30 ph�t. N�u 2 b�n ��u kh�ng t�m ���c Th� d�n s� d�a theo b��c �� t�nh, b�n n�o c� s� b��c ho�n th�nh nhi�u h�n s� gi�nh th�ng l�i <enter>3: N�u s� b��c nh� nhau xem nh� h�a<enter>4: Kh�ng gi�i h�n pk nh�ng khi ti�u di�t t��ng s� ��i ph��ng s� kh�ng nh�n ���c �i�m t�ch l�y<enter>5: �i�m t�ch l�y cao nh�t <color=yellow>"..POINT_LIMITED.."<color><enter>6: Nh�n ���c ph�n th��ng c�a Ho�ng �� + �i�m t�ch l�y<color=yellow>"..EMPEROR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>v�n<enter>7: ���c b�u l�m ng�i sao chi�n tr��ng+�i�m t�ch l�y<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color> �i�m  �i�m t�ch l�y, kinh nghi�m <color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color> v�n");
end;

function wantaward()

end;
