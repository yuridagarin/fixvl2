Include("\\script\\online\\viet_event\\200908\\quockhanh\\quockhanh_head.lua")

function main()
	if CheckEventDate() == 1 then
		Say("<color=green>B� x� th� r�n L�u:<color> D�o n�y ta th�m �n k�o nh�ng l�o L�u l�i b�n b�u c�ng vi�c, kh�ng bi�t c� ai mang k�o cho ta �n hay kh�ng ?",
				2,
				"��i k�o l�y ph�n th��ng. (33 K�o S�u Ri�ng + 33 K�o M�ng C�u + 33 K�o Nho)/trade_candy",
				"Ta ch� gh� ngang!/end_dialogover");
	else
		Say("Ho�t ��ng �� k�t th�c!",0)
	end
end

function trade_candy()
	if GetLevel() < 73 then
		Say("<color=green>B� x� th� r�n L�u:<color> Ng��i ch�a t�i c�p 73, kh�ng ���c ph�p ��i", 0);
		return 0;
	end
	
	if GetItemCount(2, 1, 30103) < 33 then
		Say("<color=green>B� x� th� r�n L�u:<color> S� k�o M�ng C�u ng��i mang theo kh�ng ��", 0);
		return 0;
	end
	
	if GetItemCount(2, 1, 30104) < 33 then
		Say("<color=green>B� x� th� r�n L�u:<color> S� k�o S�u Ri�ng ng��i mang theo kh�ng ��", 0);
		return 0;
	end
	
	if GetItemCount(2, 1, 30102) < 33 then
		Say("<color=green>B� x� th� r�n L�u:<color> S� k�o Nho ng��i mang theo kh�ng ��", 0);
		return 0;
	end
	
	if GetTask(INDEPENDENCE_DATE_TASKID) >= tonumber(date("%y%m%d")) then
		Say("<color=green>B� x� th� r�n L�u:<color> Ng�y h�m nay ng��i �� ��i m�t l�n r�i, ng�y mai h�y quay l�i.", 0);
		return 0;
	end
	
	nType = 1;
	nRand = random(1, 100);
	if  nRand <= 60 then
		nType = 1;
	elseif nRand > 60 and nRand <= 85 then
		nType = 2;
	elseif nRand > 85 then
		nType = 3;
	end
	
	if gf_Judge_Room_Weight(tIndependenceItem[nType][3], tIndependenceItem[nType][4], "B� x� Th� r�n L�u") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return 0;
	end
	
	if DelItem(2, 1, 30103, 33) == 1 and DelItem(2, 1, 30104, 33) == 1 and DelItem(2, 1, 30102, 33) == 1 then
		ModifyExp(14000000);
		
		nRetCodeAll = 1;
		for i = 1, tIndependenceItem[nType][2][4] do
			local nRetCode, nItem = AddItem(tIndependenceItem[nType][2][1], tIndependenceItem[nType][2][2], tIndependenceItem[nType][2][3], 1);
			if nRetCode == 1 then
				if tIndependenceItem[nType][5] ~= 0 then
					SetItemExpireTime(nItem, tIndependenceItem[nType][5]*24*60*60)
				end
			else
				nRetCodeAll = 0;
			end
		end
		
		if nRetCodeAll == 1 then
			Say("<color=green>B� x� th� r�n L�u:<color> Ch�c m�ng ng��i �� nh�n ���c "..tIndependenceItem[nType][2][4].." "..tIndependenceItem[nType][1],0);
			Msg2Player("B�n nh�n ���c "..tIndependenceItem[nType][2][4].." "..tIndependenceItem[nType][1]);
			WriteLogEx("Hoat dong thang 8","Quoc Khanh",tIndependenceItem[nType][2][4],tIndependenceItem[nType][1]);
			SetTask(INDEPENDENCE_DATE_TASKID, tonumber(date("%y%m%d")));
		else
			WriteLogEx("Hoat dong thang 8","AddItem th�t b�i",tIndependenceItem[nType][2][4],tIndependenceItem[nType][1]);
		end
	end
end