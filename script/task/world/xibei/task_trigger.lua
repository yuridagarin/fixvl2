-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������񴥷�������
-- By StarryNight
-- 2007/06/06 PM 3:49

-- ʲôʱ��������������Ĳ߻�������д�ű��أ�����ing

-- ======================================================
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\task\\world\\task_award.lua");

---------------------------------------------------ɱ�ִ�����-----------------------------------------------

--ɱ����˹����ȡ���·�
function bosihanfu_killed_1()

	if g_probability(5,100) then
   	AddItem(2,0,686,1,1);--�õ���˹�����·�һ��
  	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
   		TaskTip("�� nh�n ���c Y�u C� Ba T� v� trang ph�c ph� n� T�y V�c, m�i th� m�t b�, mau ��a cho �u D��ng H�a. ");
   		Msg2Player("�� nh�n ���c Y�u C� Ba T� v� trang ph�c ph� n� T�y V�c, m�i th� m�t b�, mau ��a cho �u D��ng H�a. ");
  	end;
	end;
end;

--ɱ�����򺷸�ȡ���·�
function xiyuhanfu_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,687,1,1);--�õ����򺷸��·�һ��
  	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
    	TaskTip("�� nh�n ���c Y�u C� Ba T� v� trang ph�c ph� n� T�y V�c, m�i th� m�t b�, mau ��a cho �u D��ng H�a. ");
    	Msg2Player("�� nh�n ���c Y�u C� Ba T� v� trang ph�c ph� n� T�y V�c, m�i th� m�t b�, mau ��a cho �u D��ng H�a. ");
  	end;
	end;
end;

--ɱ��һƷ����ʹȡ��һƷ������
function yipintangmishi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,688,1,1);--�õ�һƷ������
  	if GetItemCount(2,0,688) >= 1 then
  		TaskTip("�� nh�n ���c ch�ng c� c�a m�t s� Nh�t ph�m ���ng, mau ��a cho �u D��ng H�a. ");
  		Msg2Player("�� nh�n ���c ch�ng c� c�a m�t s� Nh�t ph�m ���ng, mau ��a cho �u D��ng H�a. ");
  	end;
	end;
end


--ɱ������׳��ȡ���Ѿ�ҩ
function xibeizhuanghan_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,689,1,1);--�õ��Ѿ�ҩ
  	if GetItemCount(2,0,689) >= 10 then
  		TaskTip("�� nh�n ���c 10 l� thu�c gi�i r��u, mau ��a cho Ti�u Nh� t�ng T�n Nh� Li�n. ");
  		Msg2Player("�� nh�n ���c 10 l� thu�c gi�i r��u, mau ��a cho Ti�u Nh� t�ng T�n Nh� Li�n. ");
  	end;
	end;

end

--ɱ���������ȡ��һƷ�����뺯
function guanwaigaoshou_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,691,1,1);--�õ�һƷ�����뺯
  	if GetItemCount(2,0,691) >= 1 then
  		TaskTip("L�y ���c 1 th� m�i c�a Nh�t ph�m ���ng tr�n ng��i cao th� quan ngo�i, mau ch�ng quay v� Long M�n tr�n b�o cho T�n Nh� Li�n. ");
  		Msg2Player("L�y ���c 1 th� m�i c�a Nh�t ph�m ���ng tr�n ng��i cao th� quan ngo�i, mau ch�ng quay v� Long M�n tr�n b�o cho T�n Nh� Li�n. ");
  	end;
	end;

end

--ˢ��Ԭ���ƽ���
function yuanfeiyun_talk()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = Map_Data[nMapDataID][2],Map_Data[nMapDataID][3],Map_Data[nMapDataID][4],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nNpcIndex = 0;
local	strTalk = {
	"Theo b�n �� ch� ���ng c�a Vi�n B� ��u, ch�c ch�n thi�n lao � v�ng "..nXpos..", "..nYpos.." n�y. "
	}

	nNpcIndex = CreateNpc("","Danh b� Vi�n Phi V�n ",nMapID,nXworldpos,nYworldpos);
	SetNpcLifeTime(nNpcIndex,1200);
	SetNpcScript(nNpcIndex,"���ng d�n file");
	SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--��¼Ԭ����NpcIndex
	TalkEx("",strTalk);
	RemoveTrigger(GetRunningTrigger());--ɾȥ�ô�����

end

--ɱ������ʹȡ�����
function anrishi_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,695,1,1);--�õ����
  	if GetItemCount(2,0,695) >= 10 then
  		TaskTip("�� thu th�p 10 vi�n L�u hu�nh, mau ��a cho Tri�u T� B�nh. ");
  		Msg2Player("�� thu th�p 10 vi�n L�u hu�nh, mau ��a cho Tri�u T� B�nh. ");
  	end;
	end;

end

--ɱ������ʹȡ����ʯ
function mingyueshi_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,696,1,1);--�õ���ʯ
  	if GetItemCount(2,0,696) >= 10 then
  		TaskTip("�� thu th�p 10 vi�n Ti�u Th�ch, mau ��a cho Tri�u T� B�nh. ");
  		Msg2Player("�� thu th�p 10 vi�n Ti�u Th�ch, mau ��a cho Tri�u T� B�nh. ");
  	end;
	end;

end

--ˢ��Ԭ����
function CreateYuanFeiYun()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = Map_Data[nMapDataID][2],Map_Data[nMapDataID][3],Map_Data[nMapDataID][4],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nNpcIndex = CreateNpc("Vi�n Phi V�n ","Danh b� Vi�n Phi V�n ",nMapID,nXworldpos,nYworldpos);

	SetNpcLifeTime(nNpcIndex,1200);
	SetNpcScript(nNpcIndex,"\\script\\������\\���踮\\npc\\Ԭ����.lua");
	SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--��¼Ԭ����NpcIndex
	RemoveTrigger(GetRunningTrigger());

end

--ɱ�������̺�ȡ�����Ѿ�
function xibeiyanhan_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,708,1,1);--�õ����Ѿ�
  	if GetItemCount(2,0,708) >= 10 then
  		TaskTip("�� thu th�p 10 h� r��u nho, mau ��a cho �n Minh gi�i r��u �i. ");
  		Msg2Player("�� thu th�p 10 h� r��u nho, mau ��a cho �n Minh gi�i r��u �i. ");
  	end;
	end;

end

--ɱ�����̼�ϸȡ���������
function mingjiaojianxi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,709,1,1);--�õ��������
  	if GetItemCount(2,0,709) >= 1 then
  		TaskTip("�� nh�n ���c ch�ng c� c�a Xi H�a Gi�o, ��a cho �n T� S� xem c� gi�p ���c g� kh�ng. ");
  		Msg2Player("�� nh�n ���c ch�ng c� c�a Xi H�a Gi�o, ��a cho �n T� S� xem c� gi�p ���c g� kh�ng. ");
  	end;
	end;

end

--ɱ��30������ͽ
function mingjiaopantu_killed_30()

	SetTask(TASK_XB_ID_01,6);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("�� gi�t ch�t 30 t�n ph�n �� Minh Gi�o. ");
	Msg2Player("�� gi�t ch�t 30 t�n ph�n �� Minh Gi�o. ");

end

--ɱ��30һƷ�ð�ɱʹ
function yipintanganshashi_killed_30()

	AddItem(2,0,711,1,1);--�õ�������̽�麯
	SetTask(TASK_XB_ID_01,11);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("�� gi�t ch�t 30 t�n �m s�t s� c�a Nh�t ph�m ���ng, nh�n ���c c�ng h�m ��i T�ng. ");
	Msg2Player("�� gi�t ch�t 30 t�n �m s�t s� c�a Nh�t ph�m ���ng, nh�n ���c c�ng h�m ��i T�ng. ");

end

--ɱ����Ĺ��ȡ�ý�˿����
function daomuren_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,710,1,1);--�õ���˿����
  	if GetItemCount(2,0,710) >= 10 then
  		TaskTip("�� thu th�p 10 t�m m�t n� kim lo�i, ��a cho Xa Lu�n B� V��ng. ");
  		Msg2Player("�� thu th�p 10 t�m m�t n� kim lo�i, ��a cho Xa Lu�n B� V��ng. ");
  	end;
	end;

end

--ɱ��25���ֱ���ٸ
function kongshoubingmayong_killed_25()

	SetTask(KONGSHOU25_STATE,1);
	
	if GetTask(CHINU25_STATE) == 1 then
		CreateBingMaYongTongLing();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--ɱ��25�������ٸ
function chinubingmayong_killed_25()

	SetTask(CHINU25_STATE,1);
	
	if GetTask(KONGSHOU25_STATE) == 1 then
		CreateBingMaYongTongLing();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--ɱ��������ʿ��ö�ˮ��
function xixiawushi_killed_1()

	if g_probability(10,100) then
  	AddItem(2,0,713,1,1);--�õ���ˮ��
  	if GetItemCount(2,0,713) >= 4 then
  		TaskTip("�� nh�n ���c 4 �o�n Thu� Ch�. ");
  		Msg2Player("�� nh�n ���c 4 �o�n Thu� Ch�. ");
  	end;
	end;

end 

--ɱ��������ʿ��ö��޸�
function xixiayongshi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,714,1,1);--�õ��޸�
  	if GetItemCount(2,0,714) >= 1 then
  		TaskTip("�� nh�n ���c 1 La Canh. ");
  		Msg2Player("�� nh�n ���c 1 La Canh. ");
  	end;
	end;

end

--ɱ��30ҩ�˵Ĵ�����
function yaoren_killed_30()

local strTalk = {
	"(Qu�i l�, ta �� ti�u di�t 30 t�n D��c Nh�n, t�i sao s� l��ng d��c nh�n trong ��ng n�y d��ng nh� ch�ng h� gi�m?)",
	"(C�p t�c �em tin n�y b�o cho �u D��ng H�a ti�n b�i qu� l� cao ki�n. )"
	}

	SetTask(TASK_XB_ID_01,33);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("H�i b�o �u D��ng H�a, v� t�nh h�nh D��c Nh�n trong D��c V��ng ��ng. ");
	Msg2Player("H�i b�o �u D��ng H�a, v� t�nh h�nh D��c Nh�n trong D��c V��ng ��ng. ");

end

--ɱ��ǧ�����˴�����
function qiannianshuren_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,720,1,1);--�õ�ǧ����ľ
  	if GetItemCount(2,0,720) >= 20 then
  		TaskTip("�� thu th�p ���c 20 m�nh � M�c ng�n n�m. ");
  		Msg2Player("�� thu th�p ���c 20 m�nh � M�c ng�n n�m. ");
  	end;
	end;

end

--ɱ��ɳĮ���ߴ�����
function shamoxingzhe_killed_1()

	if g_probability(10,100) then
  	AddItem(2,0,722,1,1);--�õ���ǧ�������о�
  	if GetItemCount(2,0,722) >= 10 then
  		TaskTip("�� thu th�p ���c 10 m�nh \'Thi�n Kim D�c Ph��ng\'. ");
  		Msg2Player("�� thu th�p ���c 10 m�nh \'Thi�n Kim D�c Ph��ng\'. ");
  	end;
	end;

end

--ɱ��Ѱ����ȡ�Ǻ�«������
function xunbaoren_killed_1()

local strTalk = {
	"�� nh�n ���c k�o h� l�, Vi�n b� ��u n�i l�y m� d��c tr�n v�o k�o h� l� s� th�nh k�o h� l� (m�). ",
	"Ch� c�n ��n C� D��ng ��ng s� d�ng k�o h� l� (m�) n�y, S�t Th� Oa Oa l�m sao kh�ng m�c b�y cho ���c, ha ha. "
	}

	if g_probability(15,100) then
  	AddItem(2,0,729,1,1);--�õ����Ǻ�«
  	if GetItemCount(2,0,729) >= 10 and GetItemCount(2,0,730) < 1 then
  		TalkEx("",strTalk);
  		DelItem(2,0,729,10);--ɾȥ�Ǻ�«
  		AddItem(2,0,730,1,1);--�õ��ٻ�ɱ�������õ��Ի���Ǻ�«
  		TaskTip("�� nh�n ���c k�o h� l� (m�), mau ��n C� D��ng ��ng di�t S�t Th� Oa Oa. ");
  		Msg2Player("�� nh�n ���c k�o h� l� (m�), mau ��n C� D��ng ��ng di�t S�t Th� Oa Oa. ");
  	end;
	end;

end


------------------------------------��֧2����������--------------------------------------

--������ʱ�䴥����
function Suohunzun_OnTimer()

	TaskTip("H�t th�i gian nhi�m v� th�t b�i, tr� v� nh�n l�i nhi�m v�")
	DelItem(2,0,699,1);--ɾȥ������
	SetTask(TASK_XB_ID_02,1);--����������
	RemoveTrigger(GetRunningTrigger());

end

--ŷ�����Ի�������
function ouyanghua_talk()

	--ѯ��ŷ����˾������ı���
	if GetTask(TASK_XB_ID_02) == 0 then
		task_024_01_0();
	elseif GetTask(TASK_XB_ID_02) == 11 then
		task_026_01_0();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--�����������������
function lieyanchilong_killed_1()
	
	if g_probability(10,100) then
  	AddItem(2,0,703,1,1);--�õ������
  	if GetItemCount(2,0,703) >= 10 then
  		TaskTip("�� thu th�p ���c 10 m�nh Li Long Tu. ");
  		Msg2Player("�� thu th�p ���c 10 m�nh Li Long Tu. ");
  	end;
	end;
	
end

--�����������������
function chilianhuohu_killed_1()
	
	if g_probability(10,100) then
  	AddItem(2,0,702,1,1);--�õ����β
  	if GetItemCount(2,0,702) >= 10 then
  		TaskTip("�� thu th�p ���c 10 m�nh H�a H� V�. ");
  		Msg2Player("�� thu th�p ���c 10 m�nh H�a H� V�. ");
  	end;
	end;
	
end