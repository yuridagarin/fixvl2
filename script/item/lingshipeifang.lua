--��ʯ�䷽��ʾ�ű�
--by vivi
--08/10/2007

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\string.lua");
lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
lingshi_attri = new(KTabFile,"\\settings\\item\\item_attribute.txt")


--��Ƕλ�ö�Ӧtable
tXqPos = {
	{"V� tr� t�ng �ng b�t k�",-1},
	{"M�o",0},
	{"Y ph�c",1},
	{"V� kh�",2},
	{"H� y",3},
	{"T�y �",4}
	}

function OnUse(nItemIndex)
	local nParticular = GetItemParticular(nItemIndex); --��ϸ��ID����ΪΨһ��ʶ
	local nPartRow = lingshi_pf:selectRowNum(43,nParticular); --��ø��䷽���ڵ�����
	local nId = tonumber(lingshi_pf:getCell(nPartRow,1)); --ħ������
	local nPos = tonumber(lingshi_pf:getCell(nPartRow,2)); --��Ƕλ��
	local nLv = tonumber(lingshi_pf:getCell(nPartRow,3));		--��ʯ�ȼ�
	local nNum = tonumber(lingshi_pf:getCell(nPartRow,4));  --��Ҫ����ʯ����
	local nScId = tonumber(lingshi_pf:getCell(nPartRow,44)); --���ɺ��ħ������
	local nScPos = tonumber(lingshi_pf:getCell(nPartRow,45)); --���ɺ����Ƕλ��
	local nScLv = tonumber(lingshi_pf:getCell(nPartRow,46));  --���ɺ����ʯ�ȼ�
	local nId2 = tonumber(lingshi_pf:getCell(nPartRow,5)); --ħ������
	local nPos2 = tonumber(lingshi_pf:getCell(nPartRow,6)); --��Ƕλ��
	local nLv2 = tonumber(lingshi_pf:getCell(nPartRow,7));		--��ʯ�ȼ�
	local nNum2 = tonumber(lingshi_pf:getCell(nPartRow,8));  --��Ҫ����ʯ����
	
	local sReName = "";                            --��ʾ����ҵ�
	if nId ~= -1 then
		local sName = lingshi_attri:getCell(nId+1,20); --��ȡħ��id��
		local sFlogOne = strfind(sName,"/1");
		local sFlogTwo = strfind(sName,"/t");
		if sFlogOne ~= nil and sFlogTwo == nil then
			local sAttriOne = lingshi_attri:getCell(nId+1,11); --��ȡ����һ
			local sAttriTwo = "";  --���Զ�
			if lingshi_attri:getCell(nId+1,15) ~= "" then
				sAttriTwo = lingshi_attri:getCell(nId+1,15);
			end
			local nMinLv = tonumber(lingshi_attri:getCell(nId+1,28)); --��ȡ��͵ȼ�
			if nMinLv == nil then
				nMinLv = 1;
			end
			local nIsRand = tonumber(lingshi_attri:getCell(nId+1,29));--��ȡ�Ƿ���� 0Ϊ��� 1Ϊ�����
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
				if nLv > nMinLv then
					if nOneAdd == 1 then
						sReOne = nOneMin+nOneAdd*(nLv-nMinLv);
					else	
						sReOne = tostring((nOneMin+nOneAdd*(nLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nLv-nMinLv)));
					end
					if sAttriTwo ~= "" then	
						if nTwoAdd == 1 then
							sReTwo = nTwoMin+nTwoAdd*(nLv-nMinLv);
						else	
							sReTwo = tostring((nTwoMin+nTwoAdd*(nLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nLv-nMinLv)));
						end
					end
				elseif nLv == nMinLv then
					sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
					if sAttriTwo ~= "" then
						sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
					end
				end
			else
				sReOne = tostring(nOneMin+nOneAdd*(nLv-nMinLv));
				if sAttriTwo ~= "" then	
					sReTwo = tostring(nTwoMin+nTwoAdd*(nLv-nMinLv));
				end
			end
			sReName = replace(sName,"/1",sReOne);
			if sAttriTwo ~= "" then
				sReName = replace(sReName,"/2",sReTwo);
			end
		elseif sFlogOne == nil and sFlogTwo ~= nil then
			local sReOne = lingshi_attri:getCell(nId+1,nLv);--������ַ���
			sReName = replace(sName,"/t",sReOne);
		end
	else
	 sReName = "Thu�c t�nh t��ng �ng b�t k�";
	end
	
	local sReName2 = "";                            --��ʾ����ҵ�
	if nScId ~= -1 then
		local sName = lingshi_attri:getCell(nScId+1,20); --��ȡħ��id��
		local sFlogOne = strfind(sName,"/1");
		local sFlogTwo = strfind(sName,"/t");
		if sFlogOne ~= nil and sFlogTwo == nil then
			local sAttriOne = lingshi_attri:getCell(nScId+1,11); --��ȡ����һ
			local sAttriTwo = "";  --���Զ�
			if lingshi_attri:getCell(nScId+1,15) ~= "" then
				sAttriTwo = lingshi_attri:getCell(nScId+1,15);
			end
			local nMinLv = tonumber(lingshi_attri:getCell(nScId+1,28)); --��ȡ��͵ȼ�
			if nMinLv == nil then
				nMinLv = 1;
			end			
			local nIsRand = tonumber(lingshi_attri:getCell(nScId+1,29));--��ȡ�Ƿ���� 0Ϊ��� 1Ϊ�����
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
				if nScLv > nMinLv then
					if nOneAdd == 1 then
						sReOne = nOneMin+nOneAdd*(nScLv-nMinLv);
					else	
						sReOne = tostring((nOneMin+nOneAdd*(nScLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nScLv-nMinLv)));
					end
					if sAttriTwo ~= "" then	
						if nTwoAdd == 1 then
							sReTwo = nTwoMin+nTwoAdd*(nScLv-nMinLv);
						else
							sReTwo = tostring((nTwoMin+nTwoAdd*(nScLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nScLv-nMinLv)));
						end
					end
				elseif nScLv == nMinLv then
					sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
					if sAttriTwo ~= "" then
						sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
					end
				end				
			else
				sReOne = tostring(nOneMin+nOneAdd*(nScLv-nMinLv));
				if sAttriTwo ~= "" then	
					sReTwo = tostring(nTwoMin+nTwoAdd*(nScLv-nMinLv));
				end
			end
			sReName2 = replace(sName,"/1",sReOne);
			if sAttriTwo ~= "" then
				sReName2 = replace(sReName2,"/2",sReTwo);
			end
		elseif sFlogOne == nil and sFlogTwo ~= nil then
			local sReOne = lingshi_attri:getCell(nScId+1,nScLv);--������ַ���
			sReName2 = replace(sName,"/t",sReOne);
		end
	else
	 sReName2 = "Thu�c t�nh t��ng �ng b�t k�";
	end
	
	local sReName3 = "";                            --��ʾ����ҵ�
	if nId2 ~= nil then
		if nId2 ~= -1 then
			local sName = lingshi_attri:getCell(nId2+1,20); --��ȡħ��id��
			local sFlogOne = strfind(sName,"/1");
			local sFlogTwo = strfind(sName,"/t");
			if sFlogOne ~= nil and sFlogTwo == nil then
				local sAttriOne = lingshi_attri:getCell(nId2+1,11); --��ȡ����һ
				local sAttriTwo = "";  --���Զ�
				if lingshi_attri:getCell(nId2+1,15) ~= "" then
					sAttriTwo = lingshi_attri:getCell(nId2+1,15);
				end
				local nMinLv = tonumber(lingshi_attri:getCell(nId2+1,28)); --��ȡ��͵ȼ�
				if nMinLv == nil then
					nMinLv = 1;
				end			
				local nIsRand = tonumber(lingshi_attri:getCell(nId2+1,29));--��ȡ�Ƿ���� 0Ϊ��� 1Ϊ�����
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
					if nScLv > nMinLv then
						if nOneAdd == 1 then
							sReOne = nOneMin+nOneAdd*(nScLv-nMinLv);
						else	
							sReOne = tostring((nOneMin+nOneAdd*(nScLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nScLv-nMinLv)));
						end
						if sAttriTwo ~= "" then	
							if nTwoAdd == 1 then
								sReTwo = nTwoMin+nTwoAdd*(nScLv-nMinLv);
							else
								sReTwo = tostring((nTwoMin+nTwoAdd*(nScLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nScLv-nMinLv)));
							end
						end
					elseif nScLv == nMinLv then
						sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
						if sAttriTwo ~= "" then
							sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
						end
					end				
				else
					sReOne = tostring(nOneMin+nOneAdd*(nScLv-nMinLv));
					if sAttriTwo ~= "" then	
						sReTwo = tostring(nTwoMin+nTwoAdd*(nScLv-nMinLv));
					end
				end
				sReName3 = replace(sName,"/1",sReOne);
				if sAttriTwo ~= "" then
					sReName3 = replace(sReName2,"/2",sReTwo);
				end
			elseif sFlogOne == nil and sFlogTwo ~= nil then
				local sReOne = lingshi_attri:getCell(nScId+1,nScLv);--������ַ���
				sReName3 = replace(sName,"/t",sReOne);
			end
		else
		 sReName3 = "Thu�c t�nh t��ng �ng b�t k�";
		end
	end	
	
	local nXqRow = 1;   --tXqPos���Ӧ������
	local nScXqRow = 1; --���ɺ�
	for j=1,getn(tXqPos) do
		if nPos == tXqPos[j][2] then
			nXqRow = j;
			break
		end
	end
	for p=1,getn(tXqPos) do
		if nScPos == tXqPos[p][2] then
			nScXqRow = p;
			break
		end
	end
	local nXqRow2 = 1;
	if nPos2 ~= nil then
		for q=1,getn(tXqPos) do
			if nPos2 == tXqPos[q][2] then
				nXqRow2 = q;
				break
			end
		end
	end
	
	if nId2 == nil then 		
		Talk(1,"","<color=green>Y�u c�u nguy�n li�u<color>: c�n <color=yellow>"..nNum.."<color> linh th�ch c�p <color=yellow>"..nLv.."<color> c� thu�c t�nh linh th�ch l� <color=yellow>"..sReName.."<color>, v� tr� kh�m l� <color=yellow> "..tXqPos[nXqRow][1].."<color>. \n<color=green>Linh th�ch sinh th�nh<color>: nh�n ���c linh th�ch c�p <color=yellow>"..nScLv.."<color>, thu�c t�nh linh th�ch l� <color=yellow>"..sReName2.."<color>, v� tr� kh�m l� <color=yellow> "..tXqPos[nScXqRow][1].."<color> \n<color=red>�em linh th�ch ph�i ph��ng v� nguy�n li�u y�u c�u n�m v�o trong H�p Th�nh t�i C�ng D� Binh, m�i l�n ch� d�a theo 1 lo�i ph�i ph��ng h�p th�nh, n�u kh�ng d�a theo th� ng�u nhi�n m� h�p th�nh linh th�ch. Ch� �: ngo�i thu�c t�nh linh th�ch ra, ��ng c�p linh th�ch ph�i ph� h�p v�i y�u c�u.<color>");	
	else
		Talk(1,"","<color=green>Y�u c�u nguy�n li�u<color>: c�n <color=yellow>"..nNum.."<color> linh th�ch c�p <color=yellow>"..nLv.."<color> c� thu�c t�nh linh th�ch l� <color=yellow>"..sReName.."<color>, v� tr� kh�m l� <color=yellow> "..tXqPos[nXqRow][1].."<color> v� <color=yellow>"..nNum2.."<color> linh th�ch c�p <color=yellow>"..nLv2.."<color> c� thu�c t�nh linh th�ch l� <color=yellow>"..sReName3.."<color>, v� tr� kh�m l� <color=yellow> "..tXqPos[nXqRow2][1].."<color>. \n<color=green>Linh th�ch sinh th�nh<color>: nh�n ���c linh th�ch c�p <color=yellow>"..nScLv.."<color>, thu�c t�nh linh th�ch l� <color=yellow>"..sReName2.."<color>, v� tr� kh�m l� <color=yellow> "..tXqPos[nScXqRow][1].."<color> \n<color=red>�em linh th�ch ph�i ph��ng v� nguy�n li�u y�u c�u n�m v�o trong H�p Th�nh t�i C�ng D� Binh, m�i l�n ch� d�a theo 1 lo�i ph�i ph��ng h�p th�nh, n�u kh�ng d�a theo th� ng�u nhi�n m� h�p th�nh linh th�ch. Ch� �: ngo�i thu�c t�nh linh th�ch ra, ��ng c�p linh th�ch ph�i ph� h�p v�i y�u c�u.<color>");		
	end
end