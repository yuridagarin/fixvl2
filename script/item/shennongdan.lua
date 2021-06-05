Include("\\script\\voz\\xacthuc\\xacthuc.lua");
TASKVAL_SHENNONGDAN	= 2502		-- ���������������ũ����ʣ��ʱ�䣨���ӣ�
SHENNONGDAN_TIME	= 8 * 60	-- һ����ũ����ʱ����8��Сʱ����λ�Ƿ��ӣ�

function OnUse()
	if CheckXacThuc() == 0 then
		Say("T�i kho�n ch�a x�c th�c. Xin th� ch� h�y d�ng tay.", 0)
		return
	end
	
	local val = GetTask(TASKVAL_SHENNONGDAN)
	local UseShennong = {
		"D�ng 1 Th�n N�ng ��n c� th� nh�n ���c <color=yellow>8 gi�<color> Th�n N�ng ��n.",
		"Hi�n Th�n N�ng ��n c�n d� <color=yellow>".. val .."<color> ph�t, b�n mu�n d�ng Th�n N�ng ��n kh�ng?",
		"S� d�ng Th�n N�ng ��n/ask_number",
		"�� ta ngh� l�i/no"
	}
	Say(UseShennong[1]..UseShennong[2],2,UseShennong[3],UseShennong[4])
end

function ask_number()


	local nItemNum = GetItemCount(2,1,343);
	if nItemNum < 1 then
		Say("Hi�n b�n kh�ng c� �� Th�n N�ng ��n!",1,"��ng �/OnUse");
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	AskClientForNumber("UseShennongdan",1,nItemNum,"Xin h�i d�ng m�y c�i");
end
function UseShennongdan(nCount)
	if GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount > 200000000 then--����2������
		Say("V��t qu� th�i gian gi�i h�n!",1,"��ng �/no");
		return
	end
	if DelItem(2,1,343,nCount) == 1 then
		local value = GetTask(TASKVAL_SHENNONGDAN) + SHENNONGDAN_TIME * nCount
		SetTask(TASKVAL_SHENNONGDAN, value)
		Say("Th�i gian Th�n N�ng ��n c�a b�n l� <color=yellow>" .. value .. "<color> ph�t !", 0)
	else
		WriteLog("D�ng Th�n N�ng ��n:"..GetName().."H�y b� Th�n N�ng ��n th�t b�i!");
		Say("Hi�n b�n kh�ng c� �� Th�n N�ng ��n!",1,"��ng �/OnUse");
		return
	end
end
function no()
end
