
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ͷ�ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- ճ�����ʵ�Ѫ����������������ʳ�����
-- �����ģ���ů�ģ����������ڳ�ʪ�Ĵ����ϡ�
-- ��������ʹ��
-- ���о����Լ���ʢ�źͿ�ή֮�У�һƬ��һƬ�Ļ��꣬�������������������ڰ��ĳ�ˮӿ��������
-- ȥ�����羡ͷ��·;��
-- ͯ��ĺ�����ңԶ�ĵط���ҹɫ�еĺ�����Ư�����޼ʵĴ��С�

-- ======================================================


TEACH_SEASONNPC_ID = 1  -- Ұ��������������������¼


-- �Ӻ��������Ի�ȡ��������Ľ�չ�̶�
function TE_GetTeachState()
	return GetTask(TEACH_SEASONNPC_ID)
end

-- �Ӻ������������ý�������Ľ�չ�̶�
function TE_SetTeachState(nValue)
	SetTask(TEACH_SEASONNPC_ID, nValue)
end

-- �Ӻ������õ����������״̬
function TE_GetTeachPro()
	return GetTask(TEACH_STATE_ID)
end

-- �Ӻ��������ý��������״̬
function TE_SetTeachPro(nValue)
	SetTask(TEACH_STATE_ID,nValue)
end


-- �Ӻ�����ʹ���������չ����һ��
function TE_SetTeachAdd()
	SetTask(TEACH_SEASONNPC_ID, GetTask(TEACH_SEASONNPC_ID) + 1)
	return
end


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
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
function TE_Talk(fun,szMsg)
	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

-- �Ӻ��������Ի�ȡ��ҵ��Ա�ֱ�ӷ����ַ���
function GetPlayerSex()

local mySex -- ������ʾ�����Ա���ַ�

	if (GetSex() == 1) then
		mySex = "Thi�u hi�p"
	elseif (GetSex() == 2) then
		mySex = "C� n��ng"
	end
	
	return mySex
	
end