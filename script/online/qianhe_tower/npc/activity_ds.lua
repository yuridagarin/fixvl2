Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

Qht_Dialog_Table = {
	"Gi�i thi�u n�i dung ho�t ��ng/qht_ds_introduce",
	"Gi�i thi�u ph�n th��ng ho�t ��ng/qht_ds_awardinfo",
	"T�i h� ph�i v�o Thi�n T�m Huy�n C�nh/qht_ds_goto",
	"D�ng H� ph� ��i ph�n th��ng/qht_ds_ibshop",
}

Qht_Npc_Name = "<color=green> ��i S� ho�t ��ng: <color>";

Qht_Title = Qht_Npc_Name.."�� ch�c m�ng phi�n b�n H�o Ki�t L�i Tranh ra m�t, ta m� event Thi�n T�m huy�n c�nh,�� khuy�n kh�ch ng��i ch�i.";

function qht_ds_introduce()
	local strTitle = "Ho�t ��ng Thi�n T�m Huy�n C�nh ch� y�u nh� sau \n";
	strTitle = strTitle.."Th�i gian ho�t ��ng: 12/09 - 29/09\n";
	strTitle = strTitle.."Thi�n T�m Huy�n C�nh, L��ng S�n, V�n Ki�m Tr�ng, ��a Huy�n Cung,Th�i Nh�t Th�p\n";
	strTitle = strTitle.."�i�u ki�n tham gia: Nh�n v�t ��t c�p 85, �� gia nh�p l�u ph�i, v� h�c k� n�ng c�p 55\n";
	local tbSay = {
		"Gi�i thi�u Thi�n T�m Huy�n C�nh/qht_ds_introduce_hj",
		"C�ch th�c nh�n v� c�ng d�ng c�a H� ph�/qht_ds_introduce_hf",
		"\n r�t lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_introduce_hj()
	local strTitle = "Thi�n T�m Huy�n C�nh sinh ra t� Thi�n T�m Th�p ��i L�, t�ng c�ng c� 3 t�ng, �i ��n t�ng cao h�n s� chi�u g�i ra qu�i v�t m�nh h�n, nh�n ���c b�o v�t t�t h�n.N�u chi�t trong m�i t�ng s� b� ��a ra Thi�n T�m Huy�n C�nh,cho n�n c�n th�n.Ph�n th��ng cu�i c�ng sau khi v��t qua Thi�n T�m Huy�n C�nh l� : Thi�n Cang L�nh, Thi�n M�n Kim L�nh, Th� c��i v�nh vi�n, bao thi�n ki�u l�nh nh�, bao thi�n ki�u l�nh l�n, �� qu� c�p 1-4,v.v.";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_introduce_hf()
	local strTitle = "Nh�p chu�t ph�i v�o c�c lo�i H� Ph� c� th� m� c�a ti�m t��ng �ng �� ��i ph�n th��ng.\nNgu�n ch� y�u sinh ra H� Ph�:\n  1. M� r��ng trong Thi�n T�m Huy�n C�nh, ti�u di�t qu�i v� boss ��u s� nh�n ���c M�nh H� Ph�, Kim H� Ph�.\n  2. D�ng M�nh H� Ph� v� B� Kim Th�ch �� gh�p th�nh Kim H� Ph�.\n  3. ��nh b�i boss trong L��ng S�n, V�n Ki�m Tr�ng, Th�ng Thi�n Huy�n C�nh, ��a Huy�n Cung, Th�i Nh�t Th�p ��u c� c� h�i nh�n ���c H� Ph�, �i c�ng cao th� t� l� boss r�i ra Kim H� Ph� c�ng cao."
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_awardinfo()
	local strTitle = "Ph�n th��ng c�a ho�t ��ng l�n n�y g�m c� 4 ngu�n sinh ra.\n  1. Trong Thi�n T�m Th�p ��nh b�i k� ��ch, m� r��ng s� nh�n ���c ph�n th��ng\n  2. D�ng Kim H� Ph� v�o trong c�a h�ng t��ng �ng �� ��i ph�n th��ng\n  3. 12:30 v� 22:00 h�ng ng�y, trong c�c t�ng c�a Thi�n T�m Huy�n C�nh ��u c� t�o m�i 1 BOSS Ho�ng Kim, t�ng c�ng cai th� ph�n th��ng do BOSS Ho�ng Kim r�i ra c�ng t�t\n  4. ��nh b�i BOSS Ho�ng Kim s� nh�n ���c Chi�n K� Bang H�i �� d�ng � c�c th�nh ch�nh, t�t c� th�nh vi�n trong bang th�a �i�u ki�n ��u c� th� ��n ch� Chi�n K� �� nh�n ph�n th��ng.\n  Ph�n th��ng c�a ho�t ��ng l�n n�y g�m c�: Thi�n Cang L�nh, Thi�n M�n Kim L�nh, �� qu� c�p 1-4, th� c��i v�nh vi�n, Thi�n Ki�u L�nh, Thi�t Huy�t Bang H�i Chi�n K�...";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n r�t lui","nothing"},
	};
	temp_Talk(tbSay);	
end

function qht_ds_goto()
	local strTitle = "Ng��i c� th� v�o Thi�n T�m Huy�n C�nh 1 m�nh ho�c t� ��i �� �i v�o."--"����һ��þ���ѣ��������þ���Ҫ����1��ͭ�ƻ���/�ˣ���������þ���Ҫ����1�����ƻ���/�ˡ�";
	local tbSay = {
		"V�o Thi�n T�m Huy�n C�nh t�ng 1/#qht_ds_goto_qht(1)",
		--"����ǧѰ�þ�����/#qht_ds_goto_qht(2)",
		--"����ǧѰ�þ�����/#qht_ds_goto_qht(3)",
		"\n r�t lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop()
	local strTitle = "C�c h� mu�n m� c�a ti�m ��i n�o v�y?";
	local tbSay = {
		--"ͭ�ƻ����̵�/qht_ds_ibshop_tw",
		--"���ƻ����̵�/qht_ds_ibshop_yw",
		"C�a ti�m Kim H� ph�/qht_ds_ibshop_jw",
		"\n r�t lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop_tw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	show_equip_shop(3022);
end

function qht_ds_ibshop_yw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	show_equip_shop(3023);
end

function qht_ds_ibshop_jw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event �� h�t h�n");
		return 0;
	end
	show_equip_shop(3024);
end