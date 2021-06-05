--����ɰ�ű�
--by vivi
--08/23/2007

Include("\\script\\lib\\string.lua")
Include("\\script\\lib\\lingshi_info.lua")
tb_lingshi_attri = new(KTabFile,"\\settings\\item\\item_attribute.txt")

function OnUse()
	Say("<color=green>Hoan linh sa<color>: b�n mu�n d�ng Hoan linh sa �� ��i l�y 1 Linh Th�ch c�p 6 b�t k� kh�ng?",
		2,
		"��ng �, ta ph�i v�o giao di�n ch�n Linh Th�ch c�p 6/#choose_lingshi(0)",
		"T�m th�i kh�ng ��i/nothing")
end

function choose_lingshi(nPage)
	local tLingshiName=get_lingshi_tb();
	local strtab = {}; 
	local nPageNum = 7; --һҳ��ʾ������
	local nRemaidNum = getn(tLingshiName)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaidNum <= nDiaNum then
		nDiaNum = nRemaidNum;
	end	
	for i=1,nDiaNum do
		tinsert(strtab,tLingshiName[nPage*nPageNum+i].."/#choose_weizhi("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr��c/#choose_lingshi("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(strtab,"Trang k�/#choose_lingshi("..(nPage+1)..")");
	end
	tinsert(strtab,"B� �i, t�m th�i kh�ng ��i/nothing");
	Say("<color=green>Hoan linh sa<color>: xin ch�n thu�c t�nh Linh Th�ch c�p 6 b�n mu�n ��i",
		getn(strtab),
		strtab)
end

function choose_weizhi(nType)
	local tLingshiLv = SYS_TB_LINGSHI_MINLEVEL;
	if type(tLingshiLv) ~= "table" then
		return 0;
	end
	local tLingshiName=get_lingshi_tb();
	local strtab = {};
	local nMinLv = 1;                     --SYS_TB_LINGSHI_MINLEVEL�ĵ�һ������
	local nTotal = 0;
	for n = 1,6 do
		if tLingshiLv[n] ~= nil then
			nTotal = nTotal+getn(tLingshiLv[n]);   --������nTotal���nMinLv
			if nType <= nTotal then
				nMinLv = n;
				break
			end
		end
	end
	nTotal = 0;
	if nMinLv ~= 1 then
		for m = 1,nMinLv-1 do
			if tLingshiLv[m] ~= nil then
				nTotal = nTotal+getn(tLingshiLv[m]);	--������nTotal���nType�����ĸ�����
			end
		end
	else
		nTotal = 0;														
	end
	for i = 1,getn(tLingshiLv[nMinLv][nType-nTotal][4]) do
		if tonumber(tLingshiLv[nMinLv][nType-nTotal][4][i]) == 0 then
			tinsert(strtab,"��u/#give_lingshi("..nType..","..i..")");
		end
		if tonumber(tLingshiLv[nMinLv][nType-nTotal][4][i]) == 1 then
			tinsert(strtab,"Ngo�i trang/#give_lingshi("..nType..","..i..")");
		end
		if tonumber(tLingshiLv[nMinLv][nType-nTotal][4][i]) == 3 then
			tinsert(strtab,"H� y/#give_lingshi("..nType..","..i..")");
		end
		if tonumber(tLingshiLv[nMinLv][nType-nTotal][4][i]) == 2 then
			tinsert(strtab,"V� kh�/#give_lingshi("..nType..","..i..")");
		end
	end
	tinsert(strtab,"Ta ch�n nh�m r�i, ch�n l�i/#choose_lingshi(0)");
	tinsert(strtab,"B� �i, t�m th�i kh�ng ��i/nothing");
	Say("<color=green>Hoan linh sa<color>: thu�c t�nh Linh Th�ch b�n ch�n l� <color=yellow>"..tLingshiName[nType].."<color>. Xin ch�n v� tr� kh�m Linh Th�ch",
		getn(strtab),
		strtab)
end

function give_lingshi(nType,nWz)
	if GetItemCount(2,1,2646) < 1000 then
		Talk(1,"","<color=green>Hoan linh sa<color>: <color=yellow> m�nh Linh Th�ch<color> tr�n ng��i ng��i kh�ng ��");
		return
	end
	local tLingshi = SYS_TB_LINGSHI_MINLEVEL;
	if DelItem(2,2,2647,1) == 1 and DelItem(2,1,2646,1000) == 1 then
		local nMinLv = 1;                     --SYS_TB_LINGSHI_MINLEVEL�ĵ�һ������
		local nTotal = 0;
		for n = 1,6 do
			if tLingshi[n] ~= nil then
				nTotal = nTotal+getn(tLingshi[n]);   --������nTotal���nMinLv
				if nType <= nTotal then
					nMinLv = n;
					break
				end
			end
		end
		nTotal = 0;
		if nMinLv ~= 1 then
			for m = 1,nMinLv-1 do
				if tLingshi[m] ~= nil then
					nTotal = nTotal+getn(tLingshi[m]);	--������nTotal���nType�����ĸ�����
				end
			end
		else
			nTotal = 0;														
		end			
		local add_flog = AddLingShi(tLingshi[nMinLv][nType-nTotal][1],tLingshi[nMinLv][nType-nTotal][4][nWz],6);
		if add_flog > 0 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh Th�ch c�p 6");
		else
			WriteLog("Hoan linh sa:"..GetName().."Nh�n Linh Th�ch th�t b�i, ti�u ch� th�t b�i:"..add_flog);
		end
	end
end

function get_lingshi_tb()
	local tLingshi = SYS_TB_LINGSHI_MINLEVEL;
	if type(tLingshi) ~= "table" then
		return 0;
	end
	local tLsName = {};   --�洢6����ʯħ������
	for k=1,6 do
		if tLingshi[k] ~= nil then
			for i=1,getn(tLingshi[k]) do
				local nId = tLingshi[k][i][1];
				local sReName = "";                            --��ʾ����ҵ�
				local sName = tb_lingshi_attri:getCell(nId+1,20); --��ȡħ��id��
				local sFlogOne = strfind(sName,"/1");
				local sFlogTwo = strfind(sName,"/t");
				if sFlogOne ~= nil and sFlogTwo == nil then
					local sAttriOne = tb_lingshi_attri:getCell(nId+1,11); --��ȡ����һ
					local sAttriTwo = "";  --���Զ�
					if tb_lingshi_attri:getCell(nId+1,15) ~= "" then
						sAttriTwo = tb_lingshi_attri:getCell(nId+1,15);
					end
					local nMinLv = tonumber(tb_lingshi_attri:getCell(nId+1,28)); --��ȡ��͵ȼ�
					if nMinLv == nil then
							nMinLv = 1;
					end
					local nIsRand = tonumber(tb_lingshi_attri:getCell(nId+1,29));--��ȡ�Ƿ���� 0Ϊ��� 1Ϊ�����
					local tOne = split(sAttriOne); --�ָ�����һ��Ĭ��","Ϊ�ָ�����ָ��ΪtOne[1],tOne[2]..
					local nOneMin = tonumber(tOne[1])/10;
					local nOneAdd = tonumber(tOne[2])/10;
					local tTwo = {};
					local nTwoMin = 0;
					local nTwoAdd = 0;
					if sAttriTwo ~= "" then
						tTwo = split(sAttriTwo);
						nTwoMin = tonumber(tTwo[1])/10;
						nTwoAdd = tonumber(tTwo[2])/10;
					end
					local sReOne = "";--������ַ���
					local sReTwo = "";
					if nIsRand == 0 then	
						if nMinLv < 6 then
							sReOne = tostring((nOneMin+nOneAdd*(6-nMinLv-1)).."-"..(nOneMin+nOneAdd*(6-nMinLv)));
							if sAttriTwo ~= "" then	
								sReTwo = tostring((nTwoMin+nTwoAdd*(6-nMinLv-1)).."-"..(nTwoMin+nTwoAdd*(6-nMinLv)));
							end
						elseif nMinLv == 6 then
							sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
							if sAttriTwo ~= "" then	
								sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
							end
						end							
					else
						sReOne = tostring(nOneMin+nOneAdd*(6-nMinLv));
						if sAttriTwo ~= "" then	
							sReTwo = tostring(nTwoMin+nTwoAdd*(6-nMinLv));
						end
					end
					sReName = replace(sName,"/1",sReOne);
					if sAttriTwo ~= "" then
						sReName = replace(sReName,"/2",sReTwo);
					end
				elseif sFlogOne == nil and sFlogTwo ~= nil then
					local sReOne = tb_lingshi_attri:getCell(nId+1,6);--������ַ���
					sReName = replace(sName,"/t",sReOne);
				end
				tinsert(tLsName,sReName);	
			end
		end
	end
	return tLsName;
end	

function nothing()

end