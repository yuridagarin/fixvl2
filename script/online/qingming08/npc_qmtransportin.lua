--File name:npc_qmtransportin.lua
--Describe:2008��ɨĹ�����ˣ�������
--Create Date:2008-3-18
--Author:ChenMoxian
Include("\\script\\online\\qingming08\\head_qingming.lua")--����ͷ�ļ�

function main()


	if is_qingming_opened() == -1 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Thanh Minh s�p ��n r�i, h�y gi�nh ch�t th�i gian �� c�ng t� ti�n.");
	elseif is_qingming_opened() == 0 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Ti�t Thanh Minh �� qua, "..get_player_sex().."nh� n�m sau ��n c�ng t� t� ti�n.");
	elseif is_qingming_opened() == 2 then
		Talk(1,"","<color=green>"..get_transport_name()..":<color> Ho�t ��ng Thanh Minh �� ��ng.");
	elseif is_qingming_opened() == 1 then
		local selTab = {
					"��n "..get_tomb_name().." c�ng b�i./#gotocemetery("..get_type()..")",
					"Nh�n 1 quy�n ch� nam ho�t ��ng Ti�t Thanh Minh./#AddItem(2,0,685,1)",
					"Ho�t ��ng Ti�t Thanh Minh./knowdetail",
					"H�y quay l�i c�ng t� sau nh�!/nothing",
					}
		Say("<color=green>"..get_transport_name()..":<color> Trong ti�t Thanh Minh, "..get_player_sex().." c� mu�n ��n "..get_tomb_name().." b�i t�, b�y t� th�nh � kh�ng?",getn(selTab),selTab);
	else
		WriteLog("Ti�t Thanh Minh 2008: Kh�ng th� nh�n ���c tr�ng th�i ho�t ��ng ti�t Thanh Minh.");
		return FALSE;--����
	end;
end;

--������ҵ���ͬ��Ĺ԰
function gotocemetery(MapIndex)
	if GetLevel() < 11 then
		Say("<color=green>"..get_transport_name()..":<color> Ng��i v� luy�n ��n <color=yellow>c�p 11<color> m�i ��n ��y t�m ta.",0);
		return FALSE;
	end
	NewWorld(EnterPointTab[MapIndex][1],EnterPointTab[MapIndex][2],EnterPointTab[MapIndex][3]);
end;

function knowdetail()
	Talk(4,"","<color=green>"..get_transport_name()..":<color> Ho�t ��ng Ti�t Thanh Minh di�n ra v�o <color=yellow>3/4-12/4<color>, ng��i ch�i <color=yellow>c�p 11<color> ��u c� th� tham gia b�ng c�ch �i t�o m� c�c ��i hi�p.",
				"<color=green>"..get_transport_name()..": <color>C�ng<color=yellow> b�i m� ph�n c�c v� nh�<color> Ho�ng ��i hi�p, H�n ��i hi�p, Hi�n Vi�n ��i hi�p. Th�i gian di�n ra ho�t ��ng ch� c�n c�ng b�i b�t k� m� ph�n c�a m�t v� ��i hi�p b�ng c�ch <color=yellow>'v�i l�y'<color> l� ���c.",
				"<color=green>"..get_transport_name()..":<color> B� ��i hi�p kh�ch l�, s� khi�n cho kinh nghi�m giang h� c�a ng��i t�ng kh�ng �t. C�n c� c� h�i nh�n ���c g�p 10 l�n kinh nghi�m giang h�. N�u trong th�i gian di�n ra ho�t ��ng, m�i ng�y ��u th�nh t�m c�ng b�i, c�ng b�i <color=yellow>8<color> ng�y, s� nh�n ���c kh�ch l� l�n.",
				"<color=green>"..get_transport_name()..":<color> N�u m�i ng�y tr��c khi c�ng t� c� th� d�ng m�t v�i ��o c� c�ng s� t�ng �� th�nh �, c� c� h�i nh�n ���c <color=yellow>10<color> l�n kinh nghi�m giang h�.");
end;