--========�ļ�����==================================--
--�ļ�����string.lua
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	��չluaδ�ṩ���ַ���������
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--

if not STRING_HEAD then
STRING_HEAD = 1

--========��������==================================--
--����ԭ�Σ�replace(str,pattern,s)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	���ַ���s�滻�ַ���str�е�pattern
--������
--	str��Դ�ַ���n
--	pattern��Ҫ�滻���ַ���
--	s���滻pattern���ַ���
--����ֵ��
--	�滻����ַ�����
--������
--	��
--==================================================--
function replace(str,pattern,s)
	if pattern == s then	--Ԥ����ѭ��
		return str
	end;
	local nMaxLoop = strlen(str)
	local nLen = strlen(s)
	local nLoop = 0;
	local startS,endS = strfind(str,pattern)
	while(startS) do	
		if nLoop > nMaxLoop then
			print("[H�m s� b�o l�i]: s� l�n replace qu� l�n, tr�nh ch�t li�n t�c, bu�c tho�t ra");
			return ""
		end;
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern,startS+nLen)
		nLoop = nLoop + 1;
	end
	return str
end
function sf_Replace(str,pattern,s)
	return replace(str,pattern,s);
end;
--�Ѵ���ɫ��Ϣ���ַ���ת��Ϊ�ɹ�Say��Talkʹ�õ��ַ���
--szString��ԭ�ַ���
--tbColorInfo����ɫ��Ϣ����ʽ{���ͷ,���β,��ɫӢ�ĵ���}���������£�
--tbColorInfo = 
--{
--	[1] = {"{y","}","yellow"},
--	[2] = {"{g","}","green"},
--	[3] = {"{r","}","red"},
--}
function sf_ConvertColorString(szString,tbColorInfo)
	tbColorInfo = tbColorInfo or g_tbColorInfo;
	for i=1,getn(tbColorInfo) do
		szString = sf_Replace(szString,tbColorInfo[i][1],"<color="..tbColorInfo[i][3]..">");
		szString = sf_Replace(szString,tbColorInfo[i][2],"<color>");
	end;
	return szString;
end;
--ɾ����ǣ�����ȥ���ַ���������<color>���
--sTagS:��ǵ�ͷ����"<"
--sTagE:��ǵ�β����">"
function sf_RemoveTag(sString,sTagS,sTagE)
	local sSubStr = "";
	local nTagSIndex = strfind(sString,sTagS,1);
	local nTagEIndex = strfind(sString,sTagE,1);
	local nMaxLoop = strlen(sString)
	local nLoop = 0;
	while nTagSIndex ~= nil and nTagEIndex ~= nil do
		if nLoop >= nMaxLoop then
			print("[H�m s� b�o l�i]: s� l�n sf_RemoveTag qu� l�n, tr�nh ch�t li�n t�c, bu�c tho�t ra");
			return "";
		end;
		sSubStr = strsub(sString,nTagSIndex,nTagEIndex)
		sString = replace(sString,sSubStr,"")
		nTagSIndex = strfind(sString,sTagS,nTagSIndex);
		if nTagSIndex ~= nil then
			nTagEIndex = strfind(sString,sTagE,nTagSIndex);
		end;
		nLoop = nLoop + 1;
	end;
	return sString
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

--========��������==================================--
--����ԭ�Σ�join(arr,insertor)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	��һά����arr�ڵ�Ԫ��������insertor����������arr��
--Ԫ�����Ϊ�ַ������ͣ���������Ҳ���ԣ�
--������
--	arr�������ӵ�����
--	insertor����������ò���û�У�Ĭ�ϲ����Ϊ��,��
--����ֵ��
--	��������֮����ַ��������arrû���κ�Ԫ�أ��򷵻�
--nil��
--������
--	local sarr = {"a","b","c","d"}
--	local s = join(sarr,",")
--	��s�Ľ��Ϊ
--	s��"a,b,c,d"
--==================================================--
function join(arr,insertor)
	local maxItem = getn(arr)
	if(maxItem ==0) then
		return nil
	end
	if(insertor==nil) then
		insertor=","
	end
	local str=""
	for i=1,maxItem-1 do
		if(not arr[i]) then 
			str= str..insertor
		else
			str = str..tostring(arr[i])..insertor
		end
	end
	if(arr[maxItem]) then 
		str = str..tostring(arr[maxItem])
	end
	return str
end

--========��������==================================--
--����ԭ�Σ�trim(str)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	ɾ���ַ���str���˵Ŀհ׷��ţ����û�пհ׷��ţ���
--��ɾ����
--������
--	str����ɾ���հ׷��ŵ��ַ���
--����ֵ��
--	��ɾ���˿հ׷����ַ���
--������
--	local s = "   dddd     "
--	s = trim(s)
--	��s�Ľ��Ϊ��
--	s��"dddd"
--==================================================--
function trim(str)
	local start,last = strfind(str,"%S+.*%S+")
	print(tostring(start).."|"..tostring(last))
	if(start==nil or last==nil) then
		return str
	end
	return strsub(str,start,last)
end

---RGB����ת����16���Ʊ�ʾ���ַ���
function toColor(r,g,b)
	if(not tonumber(r)) then r=0 end
	if(not tonumber(g)) then g=0 end
	if(not tonumber(b)) then b=0 end
	if(r<0) then r=0 end
	if(g<0) then g=0 end
	if(b<0) then g=0 end
	if(r>255) then r=255 end
	if(g>255) then g=255 end
	if(b>255) then b=255 end
	return r*65536+g*256+b
end
-------------------------------------

---��������ֵת���ɲ�ɫ���к���
SERIESWORD = {
	{ " Kim ",	"metal"	},
	{ "M�c",	"wood"	},
	{ "Th�y",	"water"	},
	{ "H�a",	"fire"	},
	{ "Th�",	"earth"	}
}

function toSeriesColorText(text, sno)
	if (sno < 0 or sno >= getn(SERIESWORD)) then
		return text;
	else
		return "<color="..SERIESWORD[sno+1][2]..">"..text.."<color>";
	end
end

function toSeries(sno)
	if(not tonumber(sno)) then return "error" end
	if(sno < 0 or sno > 4) then return "Ch�a" end
	return toSeriesColorText(SERIESWORD[sno+1][1], sno);
end
------------------------------

---���ȼ�����ת���ɲ�ɫ�ȼ�����
LEVELWORD = {
	"<color="..toColor(200,200,200).."> c�p 1<color>",
	"<color="..toColor(0,200,0).."> c�p 2<color>",
	"<color="..toColor(200,0,0).."> c�p 3<color>",
	"<color="..toColor(200,0,200).."> c�p 4<color>",
	"<color="..toColor(200,200,0).."> c�p 5<color>",
	"<color="..toColor(0,0,255).."> c�p 6<color>",
	"<color="..toColor(0,255,0).."> c�p 7<color>",
	"<color="..toColor(255,0,0).."> c�p 8<color>",
	"<color="..toColor(255,0,255).."> c�p 9<color>",
	"<color="..toColor(255,255,0)..">c�p 10<color>",	
}

function toLevel(lvl)
	if(not tonumber(lvl)) then return "error" end
	if(lvl < 0 or lvl > 10) then return "V� Tri" end
	return LEVELWORD[lvl]
end
---------------------------------

pairs = pairs or function (t) return t end
function Val2Str(value, ind)
	ind = ind or "";
	if type(value) == "table" then
		local str = '{\n';
		local tmp_ind = ind..'\t'
		for k,v in pairs(value) do
			str = str .. tmp_ind .. '['..Val2Str(k)..'] = ' .. Val2Str(v, tmp_ind) .. ',\n';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2);
		else
			value = gsub(value, "\n", "\\n");
			value = gsub(value, "\t", "\\t");
			return '"'..value..'"';
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
end
