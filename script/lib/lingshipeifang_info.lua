Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\lingshi_head.lua");
SYS_TB_LINGSHI_PF_TOTAL = new(KTabFile,"\\settings\\item\\lingshipeifang.txt");
SYS_TB_LINGSHI_PF_LEVEL = {};	--��Ÿ����ȼ�����ʯ�䷽��Ϣ
--SYS_TB_LINGSHI_PF_LEVELԪ�صĽṹ��
--[nLevel] = {{nID1,nID2,nID3,nLevel,nUseLevel},...}
SYS_TB_LINGSHI_PF_USELEVEL = {};	--��Ÿ����ȼ�����ʯ�䷽��Ϣ
--SYS_TB_LINGSHI_PF_USELEVELԪ�صĽṹ��
--[nUseLevel] = {{nID1,nID2,nID3,nLevel,nUseLevel},...}
--===================================================================================

--��ʼ����ʯ�䷽table
function lspf_InitLingShiPeiFangTable()
	local nCount = SYS_TB_LINGSHI_PF_TOTAL:getRow();
	--print("��ʯ�䷽���ݼ�����......");
	local nLevel,nUseLevel,nID1,nID2,nID3 = 0,0,0,0,0;
	for i=2,nCount do
		if tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,42)) ~= nil then
			nLevel = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,46));
			nUseLevel = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,47));
			nID1 = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,41));
			nID2 = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,42));
			nID3 = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,43));
			if SYS_TB_LINGSHI_PF_LEVEL[nLevel] == nil then
				SYS_TB_LINGSHI_PF_LEVEL[nLevel] = {};
			end;
			if SYS_TB_LINGSHI_PF_USELEVEL[nLevel] == nil then
				SYS_TB_LINGSHI_PF_USELEVEL[nLevel] = {};
			end;
			local tbEle = {nID1,nID2,nID3,nLevel,nUseLevel};
			tinsert(SYS_TB_LINGSHI_PF_LEVEL[nLevel],tbEle)
			tinsert(SYS_TB_LINGSHI_PF_USELEVEL[nUseLevel],tbEle);
		end;
	end;
--	print("��ʯ�䷽���ݼ�����ϣ�");
--	for i=1,getn(SYS_TB_LINGSHI_PF_LEVEL) do
--		print("�ȼ�"..i.."����ʯ�䷽�У�"..getn(SYS_TB_LINGSHI_PF_LEVEL[i]).."��");
--	end;
--	for i=1,getn(SYS_TB_LINGSHI_PF_USELEVEL) do
--		print("ʹ�ü�ֵΪ"..i.."����ʯ�䷽�У�"..getn(SYS_TB_LINGSHI_PF_USELEVEL[i]).."��");
--	end;
end;
--���ĳһ�ȼ�����ʯ�䷽table
function lspf_GetPeiFangTable(tbLingShi,nLevel)
	local tb = tbLingShi;
	return tb[nLevel];
end;
--���ĳһ�ȼ�����ʯ�䷽����������2Ϊ0����ʱΪ������еȼ�����ʯ�䷽������
function lspf_GetPeiFangCount(tbLingShi,nLevel)
	local tb = tbLingShi;
	local nCount = 0;
	local nMaxLevel = getn(tb);
	if nLevel < 0 or nLevel > nMaxLevel then
		return 0;
	end;
	if nLevel == 0 or nLevel == nil then
		for i=1,nMaxLevel do
			nCount = getn(tb[i]) + nCount;
		end;
		return nCount;
	else
		return getn(tb[nLevel]);
	end;
end;
--�Ӽ����ȼ��������һ����ʯ�䷽��Ϣ
function lspf_GetRandomPeiFang(tbLingShi,nMinLevel,nMaxLevel)
	local tb = tbLingShi;
	local nTotalCount = 0;
	for i=nMinLevel,nMaxLevel do	--���ѭ����Ϊ�˻���ܴ�С
		if tb[i] ~= nil then
			nTotalCount = getn(tb[i]) + nTotalCount;
		end;	
	end;
	if nTotalCount == 0 then
		return 0;
	end;
	local nRand = random(1,nTotalCount);
	nTotalCount = 0;
	local nPreCount = 0;
	for i=nMinLevel,nMaxLevel do
		nPreCount = nTotalCount;
		nTotalCount = getn(tb[i]) + nTotalCount;
		if nRand <= nTotalCount then
			return tb[i][nRand-nPreCount];
		end;
	end;
	return 0;
end;
--unpack����
function unpack(tb,i)
	i = i or 1;
	if tb[i] then
		return tb[i],unpack(tb,i+1);
	end;
end;
--���һ���̶���Χ�ڵ������ʯ�䷽
function lspf_AddRandomPeiFang(tbLingShi,nMinLevel,nMaxLevel)
	local tbLSPFInfo = lspf_GetRandomPeiFang(tbLingShi,nMinLevel,nMaxLevel);
	if type(tbLSPFInfo) ~= "table" then
		return 0;
	end;
	local nID1,nID2,nID3,nLevel,nUseLevel = tbLSPFInfo[1],tbLSPFInfo[2],tbLSPFInfo[3],tbLSPFInfo[4],tbLSPFInfo[5];
	local nRetCode = AddItem(nID1,nID2,nID3,1);
	return nRetCode,nLevel,nUseLevel;
end;
--�Ӿ��鶦��ȡ���䷽
function lspf_GetPeiFangFromBottle(nLevel,nCount)
	local nLeft = GetTask(SYS_TSK_PEIFANG_ONE+nLevel-1);
	if nCount > nLeft then
		return 0;
	end;
	SetTask(SYS_TSK_PEIFANG_ONE+nLevel-1,nLeft-nCount);
	for i=1,nCount do
		lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLevel,nLevel);
	end;
	return 1;
end;
--================================================================================
lspf_InitLingShiPeiFangTable();
