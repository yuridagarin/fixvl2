-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������Ʒ �޸� Script
-- By StarryNight
-- 2007/07/02 AM 11:11

-- �Ҹ�����ʵ������Щ������䱻������Ƭ�Ρ�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nXpos,nYpos = 0,0;
local strTalk = {};
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local Mapid,nxpos,nypos = GetWorldPos();

	--�ж�������
	if nStep_XBTask_01 == 24 then
	
		if Mapid == 513 then
		
			--�Ѿ��ƻ���һ����ˮѨ��û��÷�ˮѨ����
			if GetTask(FENGSHUIXUE_ID) == 0 then
				
				nMapDataID = random(1,getn(Fengshuixue_MapData));
				SetTask(FENGSHUIXUE_ID,nMapDataID);
				
			end
				
			nMapDataID = GetTask(FENGSHUIXUE_ID);
			nXpos = Fengshuixue_MapData[nMapDataID][3];
			nYpos = Fengshuixue_MapData[nMapDataID][4];
			
			strTalk = {
				"La Canh cho th�y, "..nXpos.."},{"..nYpos.." � ��y c� d� th��ng, ch�c �� ch�nh l� Phong Th�y Huy�t."
				}	
		
		else
			
			strTalk = {
				"Li�u T�ng V�n ti�n b�i t�ng n�i La Canh c�n ���c ��t � t�ng 1 Ho�ng L�ng m� th�t c� ph�t huy t�c d�ng, s� d�ng � ��y s� kh�ng cho k�t qu� g� ��u."
				}
		
		end		
		
	elseif nStep_XBTask_01 == 25 then
		
		strTalk = {
			"�� ph� h�y phong th�y trong m�, �� ��n l�c ti�p t�c ��n c�a v�o t�ng 2 t�m ng��i Tr�n M� v� ti�u di�t Tr�n M� linh th� �� ti�n v�o t�ng 2 Ho�ng L�ng m� th�t.",
			}
			
	elseif nStep_XBTask_01 == 21 then
	
		strTalk = {
			"La Canh n�y ch�c s� c� �ch trong vi�c �i v�o L�ng m�, ta ph�i ��n t�m Li�u ti�n b�i h�i cho r� m�i ���c.",
			}
			
	elseif nStep_XBTask_01 == 22 then
	
		 strTalk = {
			"Theo l�i Li�u T�ng V�n ti�n b�i, La Canh ph�i k�t h�p v�i Ph� phong ch�y m�i s� d�ng ���c, gi� Ph� phong ch�y �� b� Tr�o v��ng c��p m�t, ph�i ��n ch� Th�c B�t Ho�ng t�m hi�u ��ng t�nh c�a Nh�t Ph�m ���ng m�i ���c.",
			}
			
	elseif nStep_XBTask_01 == 23 then
	
		 strTalk = {
			"Tr�o v��ng �� l�y ���c Ph� phong ch�y �i v�o t�ng 1 l�ng m�, chuy�n kh�ng th� ch�m tr�, ph�i nhanh ch�ng �o�t l�i Ph� phong ch�y ngay.",
			}

	else
		strTalk = {
			"V�t n�y d��ng nh� �� kh�ng c�n t�c d�ng n�a.",
			}
			
		DelItem(2,0,714,1)
		
	end
	
	TalkEx("",strTalk);
	
end