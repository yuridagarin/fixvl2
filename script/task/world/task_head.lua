
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ű�ͷ�ļ�
-- Edited by peres
-- 2005/07/19 PM 19:29

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- �ַ��������ܿ�
Include("\\script\\lib\\string.lua");

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- ��������������ɫ
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- �����ص��ʶ��ɫ
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- �����Ա��ʶ
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- ���ڴ���һ��ѡ��ĶԻ����� Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end	


-- �Ӻ��������Ի�ȡ��ҵĳ�ν��ֱ�ӷ����ַ���
function GetPlayerSex()

local myTitel -- ������ʾ�����ν
local nFactionID = GetPlayerFaction();

	if (GetSex() == 1) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][1];
		else
			myTitel = "Thi�u hi�p";
		end;
	end;
	
	if (GetSex() == 2) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][2];
		else
			myTitel = "C� n��ng"
		end;
	end;
	
	return myTitel
	
end


-- ʲôҲ�����Ŀպ���
function Task_Exit()

end;

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end;
end;

--��ҳ�ν
PlayerFactionTitle = {
	
	-- ����
	[1]={"��i s�",""},
	
	-- �䵱
	[2]={"��o tr��ng","��o tr��ng"},

	-- ��ü
	[3]={"","C� n��ng"},

	-- ؤ��
	[4]={"Thi�u hi�p","C� n��ng"},
	
	-- ����
	[5]={"Thi�u hi�p","C� n��ng"},
	
	-- ����
	[6]={"T��ng qu�n","T��ng qu�n"},
	
	-- �嶾
	[7]={"Thi�u hi�p","C� n��ng"},
	-- ����
	[8]={"��o tr��ng",""},
	-- ����
	[9]={"Thi�u hi�p","C� n��ng"},
	-- ����
	[10]={"","C� n��ng"},

}