--�ű�����Ī��������ʹ�ýű�
--�ű����ܣ�ʹ��Ī����������GLB�����ڼ�¼��ʹ�õ����꣬Ȼ��ϵͳ��ʹ�õ����괴��������
--�߻��ˣ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-03-02
--�����޸ļ�¼��
--========================================��������������==============================
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
taixu_jwl_hammer_date = 997				--���ʹ����Ʒ�������
taixu_jwl_task_step_taskID = 998		--���������
taixu_jwl_hammer_date_glbID = 507		--��������Ʒʹ�����
taixu_liu_killed_date_glbID = 508		--��������ɱ�������
taixu_jwl_liu_crt_att_glbID_srt = 511	--��¼��������������ʼλ��
taixu_jwl_liu_crt_att_glbID_end = 550	--��¼�����ʱ���������λ��
--=========================================�ű����߼���===============================
function OnUse()
	local date_seq_now = zgc_pub_day_turn(1)
	--�������ж�
	if GetTask(taixu_jwl_task_step_taskID) == nil or GetTask(taixu_jwl_task_step_taskID) == 0 then
		Talk(1,"","Ch�y n�y ta �� nh�n th�y � ��u r�i, c� t�c d�ng g� ch�?")
		return
	end
	--ʹ�õ�ͼ�ж�
	local mapID = GetWorldPos()
	if mapID ~= 218 then
		Talk(1,"","V�t ph�m n�y ch� s� d�ng � <color=red>Linh B�o s�n<color>!")
		return
	end
	--һ��ֻ��ʹ��һ�μ��
	local use_date_seq = GetTask(taixu_jwl_hammer_date)
	if use_date_seq == nil then
		SetTask(taixu_jwl_hammer_date,0)
	end
	if use_date_seq >= date_seq_now then
		Talk(1,"","V�t ph�m n�y m�i ng�y ch� s� d�ng <color=red>1<color> l�n!")
		return		
	end
	--ʹ��ʱ������
	if Zgc_pub_today_sec_num_rtn() > 75600 then
		Talk(1,"","Mu�n r�i, ti�m <color=yellow>th� r�n L�u<color> �� ��ng c�a"..Zgc_pub_sex_name().."hay l� ng�y mai quay l�i!")
		return
	end
	--���������챻ɱ��ʾ
	if GetGlbValue(taixu_liu_killed_date_glbID) == (zgc_pub_day_turn(1) - 1) then
		Talk(1,"","<color=yellow>Th� r�n L�u<color> h�m qua g�p c�u nh�n b� ��nh m�t tr�n, e r�ng h�m nay kh�ng ��n."..Zgc_pub_sex_name().."hay l� ng�y mai quay l�i!")
		return
	end
	--���������ж�
	if GetItemCount(2,1,564) == 0 then
		Talk(1,"","X�c nh�n b�n c� mang theo <color=yellow>M�c Tam Thi�t Ch�y<color>.")
		return
	end
	--����ʹ�ô���
	--����ɾ���ж�
	if DelItem(2,1,564,1) ~= 1 then
		Talk(1,"","X�c nh�n b�n c� mang theo <color=yellow>M�c Tam Thi�t Ch�y<color>.")
		return
	end
	local glb_use_date_seq = GetGlbValue(taixu_jwl_hammer_date_glbID)
	--���������ֵ��һ���ռ�ͬʱ����X�����Y���꣩
	local map_ID,att_X,att_Y = GetWorldPos()		
	local att_save = (att_X * 10000) + att_Y
	--�������ʹ��Ϊ���������ֵ�һ��ʹ��
	if glb_use_date_seq == nil or glb_use_date_seq < date_seq_now then
		--�ڷ�����д�뵱ǰ�������
		SetGlbValue(taixu_jwl_hammer_date_glbID,date_seq_now)			
		--�ڵ�һ��λ��д���һ����
		SetGlbValue(taixu_jwl_liu_crt_att_glbID_srt,att_save)			
		--����λ�ó�ʼ��
		for i = (taixu_jwl_liu_crt_att_glbID_srt+1),taixu_jwl_liu_crt_att_glbID_end do	
			SetGlbValue(i,0)
		end
	else		--�ں���ĵĿ�λ���в��ϵ�ǰ������
		for i = taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end do
			--�ҿ�λ��д������
			if GetGlbValue(i) == 0 then
				SetGlbValue(i,att_save)
				break
			end
			--���û�п�λ�þ�����Ҹ�λ�ø���
			if i == taixu_jwl_liu_crt_att_glbID_end then
				i = random(taixu_jwl_liu_crt_att_glbID_srt,taixu_jwl_liu_crt_att_glbID_end)
				SetGlbValue(i,att_save)
				break
			end
		end
	end
	SetTask(taixu_jwl_hammer_date,date_seq_now)
	Talk(1,"","Thi�t Ch�y l�m xong r�i, ��i ��n (<color=yellow>21:00-21:30) <color> <color=yellow>th� r�n L�u<color> s� ��n!")	
end
