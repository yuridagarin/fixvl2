
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �����ʴ���ͷ�ļ�
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

-- ======================================================

-- ����ļ����֧��
Include("\\script\\class\\ktabfile.lua");

-- /////////////////// ȫ�ֺ��������� ////////////////////

-- �����������ļ�
tabFile = new(KTabFile, "\\settings\\new_question.txt");

-- /////////////////// ȫ�ֱ��������� ////////////////////

-- ��¼��ǰ�ʴ������ڱ���ļ�������
QA_NOWROW = 1012;
-- ��¼����Ѿ��ش��������
QA_FINISHNUM = 1013;
-- ��¼���ÿ������ش�ĶԴ�״̬
QA_RIGHTSTATE = 1016;
-- ��¼�������״̬�ı���
QA_STATE = 1014;
-- ��¼������ӵı���
QA_RANDOMSEED = 1015;
-- ÿ�ο۳���ҵ�����ֵ
QA_PAYSTAMINA = 5;
-- ��С���Խ������������ֵ
QA_MINSTAMINA = 5;

-- ���ڼ������������Ȩ�ص�����
QA_RowRate = {};

-- �ش���������Ĺ���������������ַ�����
QA_RightFunction = "/AnswerRight";
QA_ErrorFunction = "/AnswerError";
QA_ExitFunction = "Cho ta suy ngh� ch�t ��!/MainExit";
-- 
QA_TitleText = "<enter>";


-- �ӱ���ļ��ж�ȡÿ�������Ȩ���γ�һ������
function CreateRateArry()

local nRow = tonumber(tabFile:getRow()); -- ��ȡ����������

local i,j = 0,0;

	for i=2, nRow do
		j = j + 1;
		tinsert(QA_RowRate, getn(QA_RowRate) + 1, {i, tonumber(tabFile:getCell(i,"TaskRate"))});
	end;

end;


-- �ӻ�ȡ����������������һ���Ի��ű�
function CreateQuestion()

--randomseed(GetTask(QA_RANDOMSEED)); -- �����������

local nRow = SelectQuestion(); -- ����õ�һ�����������
local nKeyNum = tonumber(tabFile:getCell(nRow, "KeyNum")); -- �õ��𰸵ĸ���
local nKeyPos = tonumber(tabFile:getCell(nRow, "KeyPos")); -- �õ���ȷ�𰸵�λ��

local strTitle = tabFile:getCell(nRow, "QuestionTitle"); -- ����ı����ַ�

local strRead = ""; -- ������ʱ��ȡ����е��ַ���

local strKey = {""}; -- ���ɴ𰸵��ַ�����
local strMain = {""}; -- ��������� SAY �������ַ�������

local i,j = 0,0;


	strMain[1] = QA_TitleText.."T�ng c�ng ng��i tr� l�i ��ng "..GetTask(QA_RIGHTSTATE).."  c�u h�i! ".."��y l� c�u h�i th�  "..(GetTask(QA_FINISHNUM) + 1).." :"..strTitle;

	for i=1, nKeyNum do
		strRead = tabFile:getCell(nRow, "Key"..i);
		if (nKeyPos==i) then
			strKey[i] = strRead..QA_RightFunction;			
		else
			strKey[i] = strRead..QA_ErrorFunction;
		end;
	end;
	
	-- �Դ��������������
	strKey = RandomArry(strKey);
	
	-- ��ѭ��һ��������ɶԻ��ű�������ַ�������
	for i=1, nKeyNum do
		tinsert(strMain, getn(strMain)+1, strKey[i]);
	end;
	
	tinsert(strMain, getn(strMain)+1, QA_ExitFunction);
	
	-- ����ѡ��Ի���
	SelectSay(strMain);
	
end;


-- �ӵ�ǰ�������б������ѡ��һ��������������ֵΪ�����������
function SelectQuestion()

local nQuestionRow = 0; -- ����ȡ���ı����
local nTotalRate = 0; -- ����Ȩ�صļ���
local nRandomRate = 0; -- ����õ���Ȩ��
local nAddRate = 0; -- ��������ӳɵı���

local i,j = 0,0;

	for i=1, getn(QA_RowRate) do
		nTotalRate = nTotalRate + QA_RowRate[i][2];
	end;
	
	nRandomRate = random(1,nTotalRate);
	
	for i=1, getn(QA_RowRate) do
	
		nAddRate = nAddRate + QA_RowRate[i][2];
	
		if (nAddRate >= nRandomRate) then
			nQuestionRow = QA_RowRate[i][1];
			SetTask(QA_NOWROW, nQuestionRow); -- �������
			return nQuestionRow;
		end;
	end;

end;


-- ��һ�����������Ԫ�ؽ���������
function RandomArry(nArray)

local nNum = getn(nArray);
local nRanA, nRanB = 0,0; -- �������������λ��
local i = 0;

local nChange; -- ������ʱ�����ı���

	-- ��������Ԫ��С�� 2 ���ߴ������ʼ�ͽ���λ�ò����Ļ��Ǿ�ֱ�ӷ���ԭʼֵ��
	if (nNum<2) then
		return nArray;
	end;
	
	for i=1, nNum do
		nRanA = random(1, nNum);
		nRanB = random(1, nNum);
		nChange = nArray[nRanA];
		nArray[nRanA] = nArray[nRanB];
		nArray[nRanB] = nChange;
	end;
	
	return nArray;

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
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;

-- ���Ի�ȡ��ҵ��Ա�ֱ�ӷ����ַ���
function GetPlayerSex()
local mySex -- ������ʾ�����Ա���ַ�

	if (GetSex() == 1) then
		mySex = "C�ng t�"
	elseif (GetSex() == 2) then
		mySex = "N� hi�p "
	end
	
return mySex
end