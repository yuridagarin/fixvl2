-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������Ʒ �Ʒ�� Script
-- By StarryNight
-- 2007/07/02 AM 11:14

-- ѹ���ô�Ҫ��������

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local Mapid,nxpos,nypos = GetWorldPos();
local nMapDataID = GetTask(FENGSHUIXUE_ID);

	--�ж�������
	if nStep_XBTask_01 == 24 then
	
		if Mapid == 513 then
		
			if nMapDataID ~= 0 then
			
				nXworldpos,nYworldpos = Fengshuixue_MapData[nMapDataID][1],Fengshuixue_MapData[nMapDataID][2];
		
				--��Ŀ��λ�÷�Χ��
				if nxpos >= (nXworldpos - 50) and nxpos <= (nXworldpos + 50) and nypos >= (nYworldpos - 50) and nypos <= (nYworldpos + 50) then
					
					SetTask(FENGSHUIXUE_STATE,GetTask(FENGSHUIXUE_STATE)+1);
					SetTask(FENGSHUIXUE_ID,0);
					
					if GetTask(FENGSHUIXUE_STATE) == 4 then
					
						strTalk = {
							"Li�u ti�n b�i n�i, 4 Phong Th�y Huy�t �� b� ph�, �� ��n l�c ti�n t�i c�a v�o t�ng 1 �i t�m ng��i Tr�n M�, ti�u di�t Tr�n M� linh th� ���c v�o t�ng 2 Ho�ng L�ng m� th�t."
							}
						DelItem(2,0,715,1);--ɾ���Ʒ��
						DelItem(2,0,714,1);--ɾ���޸�
						SetTask(FENGSHUIXUE_STATE,0);
						SetTask(FENGSHUIXUE_ID,0);
						SetTask(TASK_XB_ID_01,25);
						TaskTip("��n c�a v�o t�ng 2, t�m ng��i Tr�n M� v� ti�u di�t Tr�n M� th� �� v�o ���c t�ng 2.");
						Msg2Player("Phong th�y trong m� th�t �� b� ph�, mau ��n c�a v�o t�ng 1 t�m ng��i Tr�n M� v� ti�u di�t Tr�n M� th� �� v�o t�ng 2.");
						
					else
					
						strTalk = {
							"�� ph� th�nh c�ng 1 Phong Th�y Huy�t, hi�n nay �� ph� ���c "..GetTask(FENGSHUIXUE_STATE).." Phong Th�y Huy�t, c�n l�i "..(4-GetTask(FENGSHUIXUE_STATE)).." c�i ph�i t�m ra v� ph� h�y �� ph� gi�i ho�n to�n phong th�y t�ng 1."
							}
						DelItem(2,0,713,1);--ɾ��һ����ˮ��
					end
					
				else
					
					strTalk = {
						"N�u th�y ph�n �ng g�, d��ng nh� ��y kh�ng ph�i Phong Th�y Huy�t, t�t nh�t v�n n�n d�ng La Canh xem x�t cho k�."
						}
				end
				
			else
				
				strTalk = {
					"N�u th�y ph�n �ng g�, d��ng nh� ��y kh�ng ph�i Phong Th�y Huy�t, t�t nh�t v�n n�n d�ng La Canh xem x�t cho k�.",
					}	
			end
		
		else
			
			strTalk = {
				"Li�u T�ng V�n ti�n b�i t�ng n�i Ph� phong ch�y c�n ���c ��t � t�ng 1 Ho�ng L�ng m� th�t c� ph�t huy t�c d�ng, s� d�ng � ��y s� kh�ng cho k�t qu� g� ��u."
				}
		
		end		
		
	elseif nStep_XBTask_01 == 25 then
		
		strTalk = {
			"�� ph� h�y phong th�y trong m�, �� ��n l�c ti�p t�c ��n c�a v�o t�ng 1 t�m ng��i Tr�n M� v� ti�u di�t Tr�n M� linh th� �� ti�n v�o t�ng 2 Ho�ng L�ng m� th�t.",
			}
		
	else
		strTalk = {
			"V�t n�y d��ng nh� �� kh�ng c�n t�c d�ng n�a.",
			}
		DelItem(2,0,715,1);--ɾ���Ʒ��
		
	end
	
	TalkEx("",strTalk);
	
end
