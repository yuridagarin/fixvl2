-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC����ɱ���ٻ�������Script
-- By StarryNight
-- 2007/08/07 PM 3:39

-- ======================================================
-- ���þ��������ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_SHASHOUWAWA_TIME);
local strTalk = {
	"Th� ra l� ng��i, t� xa ta �� ng�i th�y m�i th�m c�a K�o H� L�, quay l�i xem th� qu� nhi�n l� K�o H� L� c�a ���ng H� L� b�n. L�u kh�ng g�p �� l� V� V� r�i, t�t l�m. Ng��i ��n ��y ��n c�ng ta gi�p Phi Th��ng ��o Nh�n thu ph�c D� th� sao? T�t, Tr��ng Sinh B�t L�o ��n n�y n�m ch�c trong tay r�i.",
	"Xa Lu�n B� V��ng sai ta ��n c�ng ng��i gi�p Phi Th��ng ��o Nh�n thu ph�c Th� C� D��ng, nh�ng ta kh�ng t�m ���c, sau nh� ra ng��i t�ng n�i th�ch K�o H� L� n�n �� mua m�t �t ��n ��y hy v�ng ng��i s� xu�t hi�n.",
	"Hay l�m, ng��i hi�u ta kh�ng ai ngo�i ng��i. Ti�u t� th�t c� l�ng, th� ng��i mua l� k�o h� l� ngon nh�t ��i T�ng. Ch�ng qua ta nh�t th�i t�m kh�ng ra n�i �n n�u c�a Phi Th��ng ��o Nh�n th�i, t�n Xa Lu�n l�i lo chuy�n bao ��ng r�i. Nh�ng ng��i ��n ��y c�ng t�t, h�y ��a k�o h� l� cho ta ph�i �n xong r�i m�i c� s�c l�m.",
	"Ng��i v�n ch�a bi�t n�i �n n�u c�a Phi Th��ng ��o Nh�n sao? Ta m�t l�ng mu�n thu ph�c Th� C� D��ng, ch� s� sau khi thu ph�c Th� C� D��ng ch�a ch�c s� h�p t�c v�i Nh�t Ph�m ���ng.",
	}

	if ( nMapID == 512 )and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_01) == 55 then
			if nTime >= 1800 then
				local nNpcIndex = CreateNpc("S�t Th� Oa Oa","S�t Th� Oa Oa",nMapID,nWx,nWy,-1,1,1,70);
				TalkEx("#OnUse_1("..nNpcIndex..")",strTalk);
				SetNpcLifeTime(nNpcIndex,900); 
				SetNpcScript(nNpcIndex,"\\script\\������\\������һ��\\npc\\����ɱ��.lua");				
				SetTask(CREAT_SHASHOUWAWA_TIME,GetTime());
				return
			else
				strTalk = {
					"Th�i gian gi�n c�ch �� g�i S�t Th� Oa Oa l� 30 ph�t."
				};
				TalkEx("",strTalk);
			end
		else	
			return
		end
	else
		strTalk = {
			"N�u S�t Th� Oa Oa kh�ng tim th�y Phi Th��ng ��o Nh�n � T�ng 1 th� s� ch�y l�n T�ng 2, hay l� l�n T�ng 2 xem th� g�i ���c S�t Th� Oa Oa kh�ng."
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnUse_1(nNpcIndex)

local strTalk = {
	"Th�c ra ch� l� l�i d�ng l�n nhau th�i. Ch�ng ta �� kh�ng s� Th� C� D��ng d� Phi Th��ng ��o Nh�n c� tr� m�t th� ch�ng ta c�ng kh�ng n� m�t. H�nh nh� ng��i �� t�ng ��n C� D��ng ��ng, sao ng��i bi�t N�i �n n�u c�a h�n? Ti�u t� th�t hi�u � ta, �em nhi�u k�o h� l� ��n ��y.",
	"N�i �n n�u c�a Phi Th��ng ��o Nh�n l� m�t m�t th�t, nh�t th�i th� kh� c� th� t�m ���c, ��i ng��i �n xong k�o h� l� ta c�ng nhau �i t�m.",
	"���c, Xa Lu�n ph�i ng��i ��n c�ng c� ch�t h�u d�ng. �, sao l�i c� tri�u ch�ng nh� v�y? N�i mau, ng��i v� Vi�n Phi V�n c� quan h� g�? �� th� ra chuy�n ng��i c�u ng��i trong tay Vi�n Phi V�n l� gi�� r�t cu�c ng��i l� ai? Sao d�m nh�p v�o Nh�t Ph�m ���ng?",
	"Ng��i ch� c� nhi�u l�i, theo quy ��nh c�a Nh�t Ph�m ���ng th� chuy�n kh�ng n�n bi�t ��ng h�i. Ng��i c�a Nh�t Ph�m ���ng nham hi�m ��c �c s�m mu�n c�a s� b� di�t t�n g�c, nh�n d�n ��i T�ng sao l�i �� c�c ng��i t�y ti�n �c hi�p. Ti�p chi�u ��y.",
	"Th� ra ng��i l� �",
	}
	
	TalkEx("#OnUse_2("..nNpcIndex..")",strTalk);

end

function OnUse_2(nNpcIndex)

	ChangeNpcToFight(nNpcIndex);
	TaskTip("B�n �� tri�u g�i S�t Th� Oa Oa, h�y ti�u di�t n�.");
	Msg2Player("B�n �� tri�u g�i S�t Th� Oa Oa, h�y ti�u di�t n�.");
	DelItem(2,0,730,1);--�Ի���Ǻ�«

end

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"S�t Th� Oa Oa qu� kh�ng d� ��i ph�, nay �� l�y ���c L�nh b�i, l�m sao �� c� th� qua m�t Xa Lu�n Ph�p V��ng."
	}
	SetNpcLifeTime(index,15);--ʹ��ʬ����ʧ
	
	if nMemCount == 0 then -- ���δ���
		if GetTask(TASK_XB_ID_01) == 55 then
			TalkEx("",strTalk);
			SetTask(CREAT_SHASHOUWAWA_TIME,0);--�������
			SetTask(TASK_XB_ID_01,56);
			RemoveTrigger(GetTrigger(KILL_XB_XUNBAOREN));--ɾȥѰ���˴�����
			AddItem(2,0,754,1,1);--�õ���������
			DelItem(2,0,753,1);--ɾȥ��ҩ
			TaskTip("�� gi�t ch�t S�t Th� Oa Oa, v� ch� c�a Xa Lu�n Ph�p V��ng t�m c�ch che gi�u qu� kh�.");
			Msg2Player("�� gi�t ch�t S�t Th� Oa Oa, v� ch� c�a Xa Lu�n Ph�p V��ng t�m c�ch che gi�u qu� kh�.");
			GivePlayerAward("Award_XB_48","Easy");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_XB_ID_01) == 55 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
       	TalkEx("",strTalk);
       	SetTask(TASK_XB_ID_01, 56);
       	SetTask(CREAT_SHASHOUWAWA_TIME,0);--�������
       	RemoveTrigger(GetTrigger(KILL_XB_XUNBAOREN));--ɾȥѰ���˴�����
       	AddItem(2,0,754,1,1);--�õ���������
       	DelItem(2,0,753,1);--ɾȥ��ҩ
				TaskTip("�� gi�t ch�t S�t Th� Oa Oa, v� ch� c�a Xa Lu�n Ph�p V��ng t�m c�ch che gi�u qu� kh�.");
				Msg2Player("�� gi�t ch�t S�t Th� Oa Oa, v� ch� c�a Xa Lu�n Ph�p V��ng t�m c�ch che gi�u qu� kh�.");
				GivePlayerAward("Award_XB_48","Easy");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
  end;
end