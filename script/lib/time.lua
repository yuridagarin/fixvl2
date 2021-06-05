--���������ַ�������20060101,20060901���õ�����������˶����죬���߼�ǰ��
--���ǵ�����Ĵ������ﲻ�����������ꡣ�����Щ��ݻ�������������
--���꣺����ܱ�400����,�����ܱ�4���������ܱ�100�����ľ�������
function Get_Day_Diff(sTimeOld,sTimeNew)
	sTimeOld = tostring(sTimeOld);
	sTimeNew = tostring(sTimeNew);
	if strlen(sTimeOld) ~= 8 or strlen(sTimeNew) ~= 8 then
		return nil;
	end;
	local nYearOld,nYearNew,nMonthOld,nMonthNew,nDayOld,nDayNew = 0,0,0,0,0,0;
	nYearOld = tonumber(strsub(sTimeOld,1,4));
	nMonthOld = tonumber(strsub(sTimeOld,5,6));
	nDayOld = tonumber(strsub(sTimeOld,7,8));
	nYearNew = tonumber(strsub(sTimeNew,1,4));
	nMonthNew = tonumber(strsub(sTimeNew,5,6));
	nDayNew = tonumber(strsub(sTimeNew,7,8));
	if type(nYearOld) ~= "number" or type(nMonthOld) ~= "number" or type(nDayOld) ~= "number" or type(nYearNew) ~= "number" or type(nMonthNew) ~= "number" or type(nDayNew) ~= "number" then
		return nil;
	end;
	if nYearOld < 1 or nYearNew < 1 or nMonthOld > 12 or nMonthOld < 1 or nMonthNew > 12 or nMonthNew < 1 or nDayOld > 31 or nDayOld < 1 or nDayNew > 31 or nDayOld < 1 then
		return nil;
	end;
	local nDayCountOld,nDayCountNew,nDayCount = 0,0,0;
	local nYearLeft,nDayNum = 0,0;
	nDayCountOld = floor(nYearOld/4)*(365*3+366);
	nYearLeft = mod(nYearOld,4);
	nDayNum = Get_Day_Num(sTimeOld);
	if nDayNum == nil then
		return nil;
	end;
	nDayCountOld = nDayCountOld+365*nYearLeft+nDayNum;	
	
	nDayCountNew = floor(nYearNew/4)*(365*3+366);
	nYearLeft = mod(nYearNew,4);
	nDayNum = Get_Day_Num(sTimeNew);
	if nDayNum == nil then
		return nil;
	end;
	nDayCountNew = nDayCountNew+365*nYearLeft+nDayNum;
	
	nDayCount = nDayCountNew - nDayCountOld;
	return nDayCount;
end;
--����һ�������ַ�����20060901���õ���һ������һ���д��ڵڼ���
function Get_Day_Num(sTime)
	sTime = tostring(sTime);
	if strlen(sTime) ~= 8 then
		return nil;
	end; 
	local nYear,nMonth,nDay = 0,0,0;
	local tMonthDay = {31,28,31,30,31,30,31,31,30,31,30,31};
	local tMonthDayYun = {31,29,31,30,31,30,31,31,30,31,30,31};
	nYear = tonumber(strsub(sTime,1,4));
	nMonth = tonumber(strsub(sTime,5,6));
	nDay = tonumber(strsub(sTime,7,8));
	if type(nYear) ~= "number" or type(nMonth) ~= "number" or type(nDay) ~= "number" then
		return nil;
	end;
	if nYear < 1 or nMonth > 12 or nMonth < 1 or nDay > 31 or nDay < 1 then
		return nil;
	end;
	local nDayNum = 0;
	local tMonth = {};
	if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
		tMonth = tMonthDayYun;
	else	
		tMonth = tMonthDay;
	end;
	if nDay > tMonth[nMonth] then
		return nil;
	else
		for i=1,nMonth-1 do
			nDayNum = nDayNum + tMonth[i];
		end;
		nDayNum = nDayNum + nDay;
	end;
	return nDayNum;
end;

--��ʱ��ֵ����λ�룩תΪ���������ĸ�ʽ���磱������תΪ"2����1��"
--�����������ʱ��ֵ����λΪ�룬������Ϊ�����ʽ�����������ĸd���ʾ������ʾ�죬
--������ĸh��ʾ������ʾСʱ��ms���ơ�����ڣ������������Ĭ��Ϊ"dhms"
function Get_Time_String(nSecond,sFormat)
	nSecond = floor(nSecond);	--��֤������
	if nSecond <= 0 then
		return "0 gi�y ";	--С�ڵ���0�Ķ�����0��
	end;
	if sFormat == nil then
		sFormat = "dhms";
	end;
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	local nDayTag,nHourTag,nMinTag,nSceTag = 1,1,1,1;
	if strfind(sFormat,"d") == nil then
		nDayTag = 0;
	end;
	if strfind(sFormat,"h") == nil then
		nHourTag = 0;
	end;
	if strfind(sFormat,"m") == nil then
		nMinTag = 0;
	end;
	if strfind(sFormat,"s") == nil then
		nSecTag = 0;
	end;
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		if nDayTag == 0 then
			nHour = 24*nDay;
		else
			sTime = sTime..nDay.."Thi�n";
		end;
	end;
	nHour = floor(mod(nSecond/(60*60),24)) + nHour;
	if nHour > 0 then
		if nHourTag == 0 then
			nMin = 60*nHour;
		else
			sTime = sTime..nHour.."h ";
		end;
	end;
	nMin = floor(mod(nSecond/60,60)) + nMin;
	if nMin > 0 then
		if nMinTag == 0 then
			nSec = 60*nMin;
		else
			sTime = sTime..nMin.." ph�t ";
		end;
	end;
	nSec = mod(nSecond,60) + nSec;
	if nSec > 0 then
		if nSecTag ~= 0 then
			sTime = sTime..nSec.." Gi�y ";
		end;
	end;
	return sTime;
end;
--Get_Day_Num���½ӿ�
function tf_GetDayDiff(sTimeOld,sTimeNew)
	return Get_Day_Diff(sTimeOld,sTimeNew);
end;
--Get_Day_Num���½ӿ�
function tf_GetDayNum(sTime)
	return Get_Day_Num(sTime);
end;
--Get_Time_String���½ӿ�
function tf_GetTimeString(nSecond,sFormat)
	return Get_Time_String(nSecond,sFormat);
end;

--����һ���ַ���������������������ַ�������20081113��10������10�������ڣ�20081123
--���꣺����ܱ�400����,�����ܱ�4���������ܱ�100�����ľ�������
--ͬtf_GetOneDay���˺�������
function tf_GetResultDate(sTime,nNum)
	local tMonthDays = {
		[1] = {31,29,31,30,31,30,31,31,30,31,30,31}, 
		[2] = {31,28,31,30,31,30,31,31,30,31,30,31},
	};
	sTime = tostring(sTime);
	if strlen(sTime) ~= 8 then
		return nil;
	end;
	local nYear,nMonth,nDay = 0,0,0,0,0,0;
	nYear = tonumber(strsub(sTime,1,4));
	nMonth = tonumber(strsub(sTime,5,6));
	nDay = tonumber(strsub(sTime,7,8));

	if type(nYear) ~= "number" or type(nMonth) ~= "number" or type(nDay) ~= "number" then
		return nil;
	end;
	if nYear < 1 or nMonth > 12 or nMonth < 1 or nDay > 31 or nDay < 1 then
		return nil;
	end;	
	
	local nReturnTime = 0;
	local nIsRun = 0; --�Ƿ������� 1Ϊ�ǣ�2Ϊ��;
	if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
		nIsRun = 1;
	else	
		nIsRun = 2;
	end;	
	if nNum >= 0 then
		nDay = nDay + nNum;
		if nDay > tMonthDays[nIsRun][nMonth] then		
			repeat
				nMonth = nMonth+1;
				nDay = nDay - tMonthDays[nIsRun][nMonth-1];
				if nMonth > 12 then
					nYear = nYear + 1;
					if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
						nIsRun = 1;
					else	
						nIsRun = 2;
					end;					
					nMonth = 1;
				end
			until nDay <= tMonthDays[nIsRun][nMonth]
		end
	else
		nDay = nDay + nNum;
		if nDay < 0 then
			repeat	
				nMonth = nMonth-1;
				if nMonth < 1 then
					nYear = nYear - 1;
					if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
						nIsRun = 1;
					else	
						nIsRun = 2;
					end;	
					nMonth = 12;
				end	
				nDay = tMonthDays[nIsRun][nMonth] + nDay;					 
			until nDay > 0;	
		end
	end
	if nMonth < 10 then
		nMonth = tostring(0)..tostring(nMonth);
	end
	if nDay < 10 then
		nDay = tostring(0)..tostring(nDay);
	end
	nReturnTime = tonumber(tostring(nYear)..tostring(nMonth)..tostring(nDay));	
	return nReturnTime;
end

--���㵱��ʱ����������α�׼ʱ���ʱ��й���+8ʱ��
function tf_GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--����ĳ��ʱ����������
--nWeekDay:��������Ϊһ�ܵĿ�ʼ��1��7��
--nHour:���ĸ�Сʱ��Ϊһ��Ŀ�ʼ
--nCurTime:ʱ���
function tf_GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = tf_GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--����ʱ��
	nCurTime = nCurTime - 4*24*3600;	--���뵽1970��1��1�գ������ģ���ĵ�һ����һ�賿��
	local nWeekSecond = 7*24*3600;	--һ�ܶ�����
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--����ƫ��ʱ��
	local nTotalTime = nCurTime - nOffset;	--��������ʱ��
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--�����ܵ�����
	return nWeekSeq;
end;
--���ĳ�������
--nInitDate��ʾ��ʼ���ڣ�Ĭ��Ϊ��ǰ����
--nIntervalDay��ʾ��nInitDate�����������Ϊ����
--��tf_GetOneDay(3,20080929)	���2008��9��29�պ��3�������,��20081002
function tf_GetOneDay(nIntervalDay,nInitDate)
	nInitDate = nInitDate or tf_GetToday();
	local nYear,nMonth,nDay = 0,0,0;
	nYear = floor(nInitDate/10000);
	nMonth = mod(floor(nInitDate/100),100);
	nDay = mod(nInitDate,100);
	local nTime = MkTime(nYear,nMonth,nDay) + tf_GetTimeZoneInfo() * 3600;	--Ҫ����ʱ��ſ�����ȷ��GmTime��ԭ�������
	nTime = nTime + nIntervalDay*3600*24;
	nYear,nMonth,nDay = GmTime(nTime);
	return nYear,nMonth,nDay;
end;
--��ý�������ڣ�8λ����ʽ
--��tf_Date�Ϳ���ֱ��ʵ�ִ˺��������ˣ��������Ǳ����������
function tf_GetToday()
	return tonumber(tf_Date());
end;
--������Lua�Դ���date����
--szFormat�Ǹ�ʽ���ַ��������˲��ô�%�ţ������date��ʹ�÷������
--���û�����������ʾ���ص�ǰ���ڣ���ʽΪ�����գ�yyyymmdd��
function tf_Date(szFormat)
	local nYear,nMonth,nDay,nHour,nMin,nSec = GmTime(GetTime()+tf_GetTimeZoneInfo()*3600);
	local szDate = "";
	local format_time = function(nData,nLen)
		nLen = nLen or 2;
		local szRet = nData;
		local nDataLen = strlen(nData);
		if nDataLen > nLen then
			szRet = strsub(nData,nDataLen-nLen+1,nDataLen);
		else
			for i=1,nLen-nDataLen do
				szRet = "0"..szRet
			end;
		end;
		return szRet;
	end;
	if not szFormat then
		return nYear..format_time(nMonth)..format_time(nDay);
	end;
	local szChar = "";
	for i=1,strlen(szFormat) do
		szChar = strsub(szFormat,i,i);
		if szChar == "Y" then
			szDate = szDate..nYear;
		elseif szChar == "y" then	--��
			szDate = szDate..format_time(nYear);
		elseif szChar == "m" then	--��
			szDate = szDate..format_time(nMonth);
		elseif szChar == "d" then	--��
			szDate = szDate..format_time(nDay);
		elseif szChar == "H" then	--Сʱ
			szDate = szDate..format_time(nHour);
		elseif szChar == "M" then	--����
			szDate = szDate..format_time(nMin);
		elseif szChar == "S" then	--��
			szDate = szDate..format_time(nSec);
		elseif szChar == "w" then	--���������ڼ�
			szDate = szDate..format_time(mod(floor((GetTime()+tf_GetTimeZoneInfo()*3600)/(24*3600))+4,7));
		elseif szChar == "W" or szChar == "U" then	--�����ǽ���ĵڼ���
			szDate = szDate..format_time(tf_GetWeekSequence(1,0)-tf_GetWeekSequence(1,0,MkTime(nYear,1,1)));
		elseif szChar == "j" then	--�����ǽ���ĵڼ���
			szDate = szDate..format_time(floor((GetTime()-MkTime(nYear,1,1))/(24*3600))+1,3);
		elseif szChar == "a" then	--���������ڼ���Ӣ����д����Fri��ʾ�����壩
		elseif szChar == "b" then	--���·ݣ�Ӣ����д����Nov��ʾ11�·ݣ�
		elseif szChar == "c" then	--��ʾʱ�䣬��11/07/08 16:06:38
		elseif szChar == "p" then	--AM��PM����ʾ������
			if nHour >= 12 then
				szDate = szDate.."PM";
			else
				szDate = szDate.."AM";
			end;
		elseif szChar == "x" then	--���ڣ���11/07/08
		elseif szChar == "A" then	--���������ڼ�����Friday��ʾ�����壩
		elseif szChar == "B" then	--���·ݣ���November��ʾ11�·ݣ�
		elseif szChar == "I" then	--���AM��PM����ʾ�����ӣ���11��ʾ����������11�������11�㣬���AM��PM����
			szDate = szDate..format_time(mod(i+11,12)+1);
		end;
	end;
	return szDate;
end
