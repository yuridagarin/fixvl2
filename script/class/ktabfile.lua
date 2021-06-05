
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ļ���ȡ����ͷ�ļ�
-- ���ݽ����� KTabFile ����Щ���޸�
-- Edited by peres
-- 2005/04/12 PM 16:38

-- ������  Ϩ����
-- ��ʧ��  ��ס��
-- ��վ��  ��������
-- ����    ������ѿ
-- �ȴ�    꼻��ٿ�
-- �ѷҷ�  �����껪
-- �˰�    û�е���
-- ����Ȼ  ������
-- ���    ˢ����ͷ��
-- ������  �һ��
-- ����    �Ҷ��Լ�˵
-- �Ҳ�����
-- �Һܰ���

-- lyrics : �˰���
-- �峤2011-2-17���ӹ���
-- ======================================================

Include("\\script\\class\\mem.lua");

KTabFile = {
	__encodeType = 0,
	__new = function(self,arg)
		if (not arg) then return end
		self:load(arg[1])
	end,

	load = function(self,filename)
		self.__filename = filename
		if(TabFile_Load(filename) ==0) then
			return nil
		end
		self.__bOpen = 1;
		return 1
	end,

	getCell = function(self,row,col)
		return TabFile_GetData(self.__filename,row,col, "", self.__encodeType)
	end,

	getRow = function(self)
		return TabFile_GetRowCount(self.__filename)
	end,
	
	getCol = function(self)
		return TabFile_GetColCount(self.__filename)
	end,

	-- ��������ȡ��������Ϊһ����ά����
	createArray = function(self, col)
		local nRow = self:getRow();
		local ary = {};
		local i=0;

		for i=3, nRow do
			rawset(ary,	getn(ary)+1, self:getCell(i, col));
		end;

		return ary;

	end,

	-- ��������ȷ������ֵ����Ϊ�ڼ��У����֣�
	selectRowNum = function(self, col, value)
		local nRow = self:getRow();
		local i=0;

		for i=3, nRow do
			if tonumber(self:getCell(i, col))==value then
				return i;
			end;
		end;

		return 0;
	end,

	-- ��������ȷ������ֵ����Ϊ�ڼ��У��ַ���
	selectRowString = function(self, col, value)
		local nRow = self:getRow();
		local i=0;

		for i=3, nRow do
			if self:getCell(i, col)==value then
				return i;
			end;
		end;

		return 0;
	end,
	
	--�ر�
	close = function(self)
		if self.__bOpen ~= 0 then
			local bCloseFailed = 0;
			local nCnt = 10;--��ೢ��ɾ��10��
			repeat
				bCloseFailed = TabFile_Unload(self.__filename);
				nCnt = nCnt - 1;
			until bCloseFailed == 0 or nCnt <= 0;
		end
		self.__filename = nil;
		self.__bOpen = 0;
	end,
}
--========���´峤���ӣ���������==================================--
--����ԭ�Σ�sf_RemoveEndSpace(str)
--���ߣ�tanzi
--�������ڣ�2010-6-18
--����޸����ڣ�2010-6-18
--����������
--	���ַ���ĩβ�Ŀո�ȥ��
--������
--	str��Ŀ���ַ���
--����ֵ��
--	����Ŀ���ַ���ȥ��ĩβ���пո�Ľ��
--  ���Ŀ���ַ����ǿ�ֵ���򷵻ظÿ�ֵ
--==================================================--
function sf_RemoveEndSpace(str)
	local space = " "
	local strStart = 1
	local strLength = strlen(str)
	if str == nil or str == "" then
		return str
	end
	for i = strLength, strStart, -1 do
		strEnd = strsub(str, i)
		if strEnd == space then
			str = strsub(str, strStart, (i - 1))
		else
			break
		end
	end
	return str
end
--�������ļ��ж�ȡ���ݣ�����һ����ʽ��Ӧ��table
--�����ļ���һ��Ϊ��ͷ���ڶ��п�ʼ�Ǿ�������
--��������Ϊ����
function ff_GetTabFileTable(szFilePath,nDataStartLine)
	nDataStartLine = nDataStartLine or 2;	--����������Ĭ�ϴӵ�2�п�ʼ
	szFilePath = sf_RemoveEndSpace(szFilePath)
	local tbFile = new(KTabFile,szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	tbRet[0] = {};
	for i=1,nCol do
		tbRet[0][i] = tbFile:getCell(1,i);	--����0Ϊ��ͷ����
	end;	
	for i=1,nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j=1,nCol do
			tbRet[i][j] = tbFile:getCell(i+nDataStartLine-1,j);	--������
		end;
	end;
	TabFile_Unload(szFilePath);
	return tbRet;
end;
--�Ա�ͷ�ַ���Ϊ����
function ff_GetTabFileTableEx(szFilePath,nDataStartLine)
	nDataStartLine = nDataStartLine or 2;
	szFilePath = sf_RemoveEndSpace(szFilePath)
	local tbFile = new(KTabFile,szFilePath);
	if not tbFile then
		TabFile_Unload(szFilePath);
		return {};
	end;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	for i=1,nRow-nDataStartLine+1 do
		tbRet[i] = {};
		for j=1,nCol do
			local szKey = sf_Replace(tbFile:getCell(1,j)," ","");
			tbRet[i][szKey] = tbFile:getCell(i+nDataStartLine-1,j);
		end;
	end;
	TabFile_Unload(szFilePath);
	return tbRet;
end;
--�����ļ�����
function ff_GetIniFileObj(szFilePath)
	szFilePath = sf_RemoveEndSpace(szFilePath)
	local objIniFile = 
	{
		szFilePath = szFilePath or "",
		bOpen = 0,
		--��
		Open = function(self)
			self:Close();	--�ȹرգ������Ϳ��Ի�ȡ�����µ�����
			if IniFile_Load(self.szFilePath) == 1 then
				self.bOpen = 1;
				return 1;
			else
				return 0;
			end;
		end,
		--��ȡ��������
		GetNum = function(self,szSection,szKey)
			--����Ϊnilֱ�ӱ���
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			if self.bOpen == 1 then
				return tonumber(IniFile_GetData(self.szFilePath,szSection,szKey));
			else
				return nil;
			end;
		end,
		--��ȡ�ַ�������
		GetString = function(self,szSection,szKey)
			--����Ϊnilֱ�ӱ���
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			if self.bOpen == 1 then
				return IniFile_GetData(self.szFilePath,szSection,szKey);
			else
				return nil;
			end;
		end,
		GetTable = function(self,szSection,szKey)	--���һ��table����1,2����{1,2}��1,2;3,4����{{1,2},{3,4}}
			--����Ϊnilֱ�ӱ���
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			if self.bOpen == 1 then
				local szTableData = IniFile_GetData(self.szFilePath,szSection,szKey);
				if strlen(szTableData) == 0 then
					return nil;
				end;
				local tb = sf_Split(szTableData,";");
				local tbRet = {};
				local nSize = getn(tb);
				if nSize == 1 then
					tbRet = sf_Split(tb[1],",");
				elseif nSize > 1 then
					for i=1,getn(tb) do
						tinsert(tbRet,sf_Split(tb[i],","));
					end;
				end;
				return tbRet;
			else
				return nil;
			end;
		end,
		GetNumTable = function(self,szSection,szKey)	--���һ����������Ϊnumber��table
			--����Ϊnilֱ�ӱ���
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			local tbTable = self:GetTable(szSection,szKey)
			if type(tbTable) ~= "table" then
				return nil;
			else
				return gf_TableElementToNumber(tbTable);
			end;
		end,
		GetMixTable = function(self,szSection,szKey)
			--����Ϊnilֱ�ӱ���
			if szSection == nil then
				print("error! szSection is nil in ff_GetIniFileObj()")
				return nil
			end
			local tbTable = self:GetTable(szSection,szKey)
			if type(tbTable) ~= "table" then
				return nil;
			else
				return gf_TableNumberElementToNumber(tbTable);
			end;			
		end,
		--�ر�
		Close = function(self)
			self.bOpen = 0;
			if DEBUG_VERSION == 1 then	--����ǵ��԰汾����һ��ѭ��ȥж��
				local bCloseFailed = 0;
				repeat
					bCloseFailed = IniFile_Unload(self.szFilePath);
				until bCloseFailed == 0;
			else	--����Ƿ����汾��һ����Ϊ�����ļ������иĶ�������ֻж��һ�ξ͹��ˣ�
				IniFile_Unload(self.szFilePath);
			end;
		end,
	};
	return objIniFile;
end;
--========��������==================================--
--����ԭ�Σ�split(str,splitor)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2004-6-1
--����������
--	���ַ���str�÷��ѷ�splitor���ѳ�������ʽ
--������
--	str�������ѵ��ַ���
--	splitor�����ѷ�,����ò���û�У�Ĭ��Ϊ��,��
--����ֵ��
--	�����ѵ����飮����ַ���str��û�а������ѷ�splitor��
--�򷵻ص�����ֻ�У���Ԫ�أ�Ԫ�����ݾ���str����
--������
--	local s = "aaa,bbb,ccc,ddd"
--	local arr = splite(s,",")
--	��arr������Ϊ��
--	arr[1]��aaa
--	arr[2]��bbb
--	arr[3]��ccc
--	arr[4]��ddd
--==================================================--
function sf_Split(str,splitor)
	return split(str,splitor);
end;
function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end
--��table������ַ���ת������
function gf_TableElementToNumber(tb)
	for k,v in tb do
		if type(v) == "string" then
			tb[k] = tonumber(v);
		elseif type(v) == "table" then
			tb[k] = gf_TableElementToNumber(v);
		end;
	end;
	return tb;
end;
--��table����Ŀ�ת��Ϊ���ֵ�ת��Ϊ����
function gf_TableNumberElementToNumber(tb)
	for k,v in (tb) do
		if type(v) == "string" and tonumber(v) ~= nil then
			tb[k] = tonumber(v);
		elseif type(v) == "table" then
			tb[k] = gf_TableNumberElementToNumber(v);
		end;
	end;
	return tb;
end