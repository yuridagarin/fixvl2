-- mail_carrier.lua
-- �ʵ�Ա

Include("\\script\\lib\\globalfunctions.lua");

THE_FILE = "\\script\\misc\\mail_carrier.lua"
NPC_NAME = "<color=green>Ch� B�u c�c<color>";

function main()
	Say( NPC_NAME.."Qu� kh�ch ��n nh�n th� ph�i kh�ng?",
		3,
		"Nh�n th�/query_mail_list",
		"H��ng d�n giao d�ch ti�n xu/trade_gold_coin_help",
		"Quay l�i sau!/nothing"
	);
end

function trade_gold_coin_help()
	Say( NPC_NAME.."C�c thao t�c giao d�ch c� li�n quan ��n ti�n Xu ��u ph�i th�ng qua B�u c�c �� g�i ho�c nh�n. Sau khi song ph��ng x�c ��nh ho�n t�t giao d�ch, h� th�ng s� th�ng b�o d��i h�nh th�c th� cho hai b�n. Ch� �: n�u r��ng trong tr�ng th�i kh�a th� s� kh�ng th� th�c hi�n giao d�ch!",
		1,
		"Bi�t r�i!/main" );
end

-- nMailCount ��ǰȡ�������ʼ��б����ж��ٷ��ʼ�
-- nMaxMailCount һ���ж��ٷ��ʼ�
-- nNewMailCount ���ʼ���δ���ʼ���������
function query_mail_list(nMailCount, nMaxMailCount, nNewMailCount)
	if nMailCount == 0 then
		Say("Kh�ch quan hi�n ch�a c� th� n�o!", 0);
		return
	end

	local tMailList = QueryMailList(THE_FILE, "query_mail_list");
	if tMailList == nil then
		return
	end
	if tMailList == 0 then
		Say("Kh�ch quan hi�n ch�a c� th� n�o!", 0);
		return
	end

	local nCount = getn(tMailList)
	if nCount == 0 then
		Say("Kh�ch quan hi�n ch�a c� th� n�o!", 0);
		return
	end

	nMailCount = nCount;
	if nCount > 6 then
		nCount = 6;
	end
	local tSayNote = {};
	for i = 1, nCount do
		local y,m,d,h,n,s = GmTime(tMailList[i].time + 8 * 3600);
		local sz_time = format("%d:%d:%d %d-%d-%d", h,n,s,y,m,d);
		tSayNote[i] = format("%17s%17s%20s/#receive_mail(%d,%d)",
			tMailList[i].subject,
			tMailList[i].sender,
			sz_time,
			tMailList[i].lowid,
			tMailList[i].highid);
	end
	tSayNote[nCount+1] = "K�t th�c ��i tho�i/nothing";
	local msg = "";
	if nMailCount > 6 then
		msg = format("B�n c� %d th� m�i, hi�n t�i ch� c� th� hi�n th� 6 th� m�i nh�t, h�y nhanh ch�ng d�n d�p ch� tr�ng. \n 6 th� m�i nh�t: ", nMailCount);
	else
		msg = "Danh s�ch th� c�a b�n: "
	end
	Say(msg, nCount + 1, tSayNote);
end

function nothing()
end

function receive_mail(lowid, highid)
	if lowid == 0 and highid == 0 then
		Say(NPC_NAME.."Kh�ch quan hi�n ch�a c� th� n�o!", 0)
		return
	end

	local tMail = ReceiveMail(lowid, highid, THE_FILE, "receive_mail");
	if tMail == nil or tMail == 0 then
		return
	end

	local uId = tMail.ID;

--	if tMail.Attachments.count <= 0 then
--		Say("empty content",0);
--		return
--	end

	local szMsg = "";
	local tSelNode = {};

	if tMail.Attachments._zw_ then
		szMsg = szMsg .."N�i dung: "..tMail.Attachments._zw_.."\n";
	end
	if tMail.Attachments._wj_ then
		local nCount = tMail.Attachments.obj_count;
		if nCount == nil then
			nCount = 0;
		end
		szMsg = szMsg.."Th�ng tin v�t ph�m: "..tMail.Attachments._wj_.."\n";
		tSelNode[1] = format("Nh�n v�t ph�m/#pickup(%d,%d)", uId, nCount);
	end
	if tMail.Attachments._gbi then
		szMsg = szMsg .."Tin t�c Ti�n xu: "..tMail.Attachments._gbi.."\n";
	end
	if getn(tSelNode) == 0 then
		--tSelNode[1] = format("ɾ���ʼ�/#DelMail(%d, %s, %s)", uId, THE_FILE, "nothing");
		tSelNode[1] = format("X�a th�/#pickup(%d, %d)", uId, 0);
	end
	tSelNode[getn(tSelNode)+1] = "K�t th�c ��i tho�i/nothing";

	Say( szMsg, getn(tSelNode), tSelNode );
end

function pickup(uId, nObjCount)
	if gf_Judge_Room_Weight(nObjCount, 0) == 0 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	local bDelResult = DelMail(uId, THE_FILE, "pickup_2");
end

function pickup_2(nRetCode, uID)
	if nRetCode > 0 then
		GetAttachments(uID);
		RemoveGSMailCache(uID)
	end
end

