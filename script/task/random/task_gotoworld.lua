
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������ͷ�ļ�
-- Edited by peres
-- 2005/08/08 PM 13:45

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================


-- ����ļ����֧��
Include("\\script\\class\\ktabfile.lua");

tabPos = new(KTabFile, "\\settings\\inside_pos.txt");

-- ����һ����ͼ�� ID �õ������ͼ�������������� X �ᡢ���� Y �ᡢս��״̬
function getMapPos(nMapID)

local strName, nX, nY = "", 0, 0;
local nRow = 0;
local i=0;

-- �õ�����˵�ͼʱ��ʼ��ս��״̬
local nFightState = 0;

	for i=1, tabPos:getRow() do
		if tabPos:getCell(i, "MapID")==tostring(nMapID) then
			nRow = i;
			break;
		end;
	end;
	
	if nRow==0 then
		Msg2Player("ID b�n ��- t�a �� kh�ng t�n t�i!");
		return nil;
	end;
	
	strName = tabPos:getCell(nRow, "MapName");
	nX = tonumber(tabPos:getCell(nRow, "EnterPosX"));
	nY = tonumber(tabPos:getCell(nRow, "EnterPosY"));
	nFightState = tonumber(tabPos:getCell(nRow, "FightState"));
	
	return strName, nX, nY, nFightState;

end;


function gotoWorld(nMapID)

local strName, nX, nY, nFightState = getMapPos(nMapID);

-- ������
	if nMapID==0 or nMapID==nil then
		WriteLog("[L�i nhi�m v� s� m�n]:gotoWorld Sai quy c�ch nh�p h�m s�,"..GetName());
		return 
	end;
	CleanInteractive();	--�����һ������� added by yanjun 2006-3-14
	NewWorld(nMapID, nX, nY);
	SetFightState(nFightState);
end;