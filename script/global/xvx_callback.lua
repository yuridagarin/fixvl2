--�ű����ƣ�������
--�ű����ܣ�
--���ܲ߻�������
--���ܿ���������
--���ܲ��ԣ�
--����ʱ�䣺2012-09-05
--�����޸ļ�¼

eXVX_RANK_T_LOCAL	= 0;
eXVX_RANK_T_GLOBAL	= 1;

function OnArrive_LocalRank()
	BuildXvXRankData(eXVX_RANK_T_LOCAL);
end

function OnArrive_GlobalRank()
	BuildXvXRankData(eXVX_RANK_T_GLOBAL);
end
