--���õ�ͭ����Ƭ�ű�
--by vivi
--2008/02/17

--��ʯͷ�ļ�
Include("\\script\\lib\\lingshi_head.lua");

function OnUse()
	Say("<color=yellow>20<color>M�nh ��ng kh� c� th� ��i l�y <color=yellow>1<color>linh th�ch ng�u nhi�n c�p 1-5. B�n mu�n ��i bao nhi�u?",
		4,
		"Ta mu�n ��i 1 linh th�ch ng�u nhi�n c�p 1-5/#youyong_lingshi(1)",
		"Ta mu�n ��i 10 linh th�ch ng�u nhi�n c�p 1-5/#youyong_lingshi(10)",
		"Ta mu�n ��i 50 linh th�ch ng�u nhi�n c�p 1-5/#youyong_lingshi(50)",
		"T�m th�i kh�ng ��i. /nothing")
end

function youyong_lingshi(nNum)
	Say("��i <color=yellow>"..nNum.."<color> linh th�ch ng�u nhi�n c�p 1-5 c�n <color=yellow>"..(20*nNum).." <color>m�nh ��ng h�u d�ng. B�n ch�p nh�n?",
		2,
		"�, ta mu�n ��i./#confirm_youyong("..nNum..")",
		"Kh�ng, ta nh�m!/OnUse")
end

function confirm_youyong(nNum)
	local nNeedNum = 20*nNum;
	if GetItemCount(2,1,3217) < nNeedNum then
		Talk(1,"","Tr�n ng��i b�n kh�ng �� <color=yellow>m�nh ��ng h�u d�ng<color>.");
		return
	end
	if DelItem(2,1,3217,nNeedNum) == 1 then
		for i=1,nNum do
			local nRand = random(1,5);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nRand.." (c�p) Linh th�ch, �� ���c cho v�o T� Linh ��nh.");
		end
	end
end

function nothing()

end