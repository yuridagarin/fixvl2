
-- ������Ե II �������ű�ͷ�ļ�
-- 2005/02/02  PM 15:32
-- Edited by peres

TL_TASKSTART_01 = 1025 -- ��¼����Ƿ��Ѿ���ʼ����һ��������
TL_TASKID_01 = 11		-- �̻��ϰ��������ı�ʶ


function tl_getTaskInfo(myTaskID)

local myText1,myText2,myText3,myText4 = "","","",""

myText1 = GetInfo(myTaskID,1)
myText2 = GetInfo(myTaskID,2)
myText3 = GetInfo(myTaskID,3)
myText4 = GetInfo(myTaskID,4)

return myText1, myText2, myText3, myText4

end

-- �Ӻ���������ȷ������Ƿ��һ����������
function tl_isFirstTime(myTaskID)
	if (GetTask(myTaskID) == 0) then
		return 0
	else
		return 1
	end
end


-- �Ӻ��������Ի�ȡ��ҵ��Ա�ֱ�ӷ����ַ���
function GetPlayerSex()
local mySex -- ������ʾ�����Ա���ַ�

	if (GetSex() == 1) then
		mySex = "C�ng t�"
	elseif (GetSex() == 2) then
		mySex = "N� hi�p "
	end
	
return mySex
end