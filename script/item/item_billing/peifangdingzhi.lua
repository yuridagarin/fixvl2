--�򱦸��򱦲�ű�
--by vivi
--08/23/2007

Include("\\script\\lib\\lingshipeifang_info.lua")
TB_LINGSHI_PEIFANG_NAME = new(KTabFile,"\\settings\\item\\quest.txt")

function OnUse()
	Say("<color=green>V�n B�o C�c V�n B�o S�ch<color>: B�n mu�n s� d�ng V�n B�o C�c V�n B�o S�ch ��i l�y m�t Linh Th�ch ph�i ph��ng c�p 7 b�t k� ch� ��nh kh�ng?",
		2,
		"C�, ta mu�n v�o giao di�n l�a ch�n ph�i ph��ng c�p 7/#choose_peifang(0)",
		"T�m th�i kh�ng ��i/nothing")
end

function choose_peifang(nPage)
	local tPeifang = lspf_GetPeiFangTable(SYS_TB_LINGSHI_PF_LEVEL,7);
	if type(tPeifang) ~= "table" then
		return 0;
	end
	local strtab = {};
	local nPageNum = 7; --һҳ��ʾ������
	local nRemaidNum = getn(tPeifang)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaidNum <= nDiaNum then
		nDiaNum = nRemaidNum;
	end
	local sPfName = "";
	for i=1,nDiaNum do
		for j=2,(TB_LINGSHI_PEIFANG_NAME:getRow()) do
			local nId3 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(j,4));
			if nId3 == tPeifang[nPage*nPageNum+i][3] then
				local nId2 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(j,3));
				if nId2 == tPeifang[nPage*nPageNum+i][2] then
					local nId1 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(j,2));
					if nId1 == tPeifang[nPage*nPageNum+i][1] then			
						sPfName = TB_LINGSHI_PEIFANG_NAME:getCell(j,1);
						tinsert(strtab,sPfName.."/#give_peifang("..j..")");
						break
					end
				end
			end
		end
	end
	if nPage ~= 0 then		
		tinsert(strtab,"Trang tr��c/#choose_peifang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(strtab,"Trang k�/#choose_peifang("..(nPage+1)..")");
	end
		tinsert(strtab,"B� �i, t�m th�i kh�ng ��i/nothing");	
		Say("Xin ch�n Linh Th�ch ph�i ph��ng c�p 7 b�n mu�n ��i",
			getn(strtab),
			strtab)
end

function give_peifang(nRow)
	if GetItemCount(2,1,2641) < 1000 then
		Talk(1,"","B�n kh�ng c� �� <color=yellow>m�nh Linh Th�ch ph�i ph��ng<color>");
		return
	end
	if DelItem(2,1,2645,1) == 1 and DelItem(2,1,2641,1000) == 1 then 
		local nId3 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(nRow,4));
		local nId2 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(nRow,3));
		local nId1 = tonumber(TB_LINGSHI_PEIFANG_NAME:getCell(nRow,2));		
		local add_flog = AddItem(nId1,nId2,nId3,1,1);
		if add_flog == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch ph�i ph��ng c�p 7");
		else
			WriteLog("V�n B�o C�c V�n B�o S�ch: ng��i ch�i "..GetName().."L�y Linh Th�ch ph�i ph��ng c�p 7 th�t b�i, ti�u ch� th�t b�i:"..add_flog);
		end
	end
end

function nothing()

end