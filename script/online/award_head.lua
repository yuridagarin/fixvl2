--���ֹؿ���ս����������������
--�����ÿ���˸���ִ��
Include("\\script\\online\\tong_feast\\tf_head.lua") --����ʢ��

--�μӿ��ս��
--nKind�һ�����0ֱ��1������2�������3�Ի;�����
function aw_kfbattle_award(nKind)
	--����ʢ��
	tf_raiddrop_kfbattle();
end

--�μ�������
--nKind�һ�����0ֱ��1������2�������3�Ի;�����
function aw_tmz_award(nKind)
	--����ʢ��
	tf_raiddrop_tmz();
end

--�μ�һ������ս��
function aw_bsBattle_award()
	--����ʢ��
	tf_raiddrop_slbattle();
end

--��ɽ����
--nStep�ؿ�����
function aw_ls_award(nStep)
	if nStep >= 1 and nStep <= 4 then
		tf_raiddrop_ls_14();
	elseif nStep > 4 then
		tf_raiddrop_ls_ib();
	end
end

--��ڣ����
--nStep�ؿ�����
function aw_wjz_award(nStep)
	tf_raiddrop_wjz_14();
end

--ͨ��þ�����
--nStep�ؿ�����
function aw_ttd_award(nStep)
	tf_raiddrop_ttd_17();
end

--����������
--nType����0���1IB
function aw_dxg_award(nType)
	if nType == 0 then
		tf_raiddrop_dxg_13();
	end
	if nType == 1 then
		tf_raiddrop_dxg_ib();
	end
end

--�ؽ�ɽׯ,��9��
--nStep����
function aw_cjsz_award(nStep)
	tf_raiddrop_cjsz();
end

--̫��þ�
--nCurRing��ǰ�ǵڼ���
function aw_taixu_award(nCurRing)
	tf_raiddrop_tx();
end