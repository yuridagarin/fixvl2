--file name:7xi06_head.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ��ű�ͷ�ļ�
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\qixi06\\mission_head.lua");
tabPos = new(KTabFile, "\\settings\\task\\killer\\killer_pos.txt");

TASK_POS_INDEX = 1888;	--��¼λ����Ϣ�ڱ��е�����
TASK_GOTATLAS_DATE = 1889;	--��¼�õ����ǵ�ͼ������
TASK_PLANTSTAR_DATE = 1890;	--��¼�������ǵ�����
TASK_GOTPRESENT_DATE = 1891;	--��¼��ȡ����������
TASK_FIND_STAR_COUNT = 1892;	--��¼�ҵ����ǵĴ���
TASK_PLANT_STAR_COUNT = 1893;	--��¼�����ǵĴ���
TASK_ADDED_AWARD_PLANTSTAR_DATE = 1894;	--��¼�õ�������˫�˽���������
TASK_ADDED_AWARD_FINDSTAR_DATE = 1895;	--��¼�õ�������˫�˽���������
TASK_QIAONV_AWARD_DATE = 1896;	--��¼��ȡ��Ů����������
TASK_EXPIATION_AWARD = 1897;	--��¼�����û����ȡ����������
--===============================================================================
GALAXY_MAP1 = 966;
GALAXY_MAP2 = 967;
GALAXY_MAP3 = 968;

REQUIRE_STAR_COUNT = 7;
--===============================================================================
tSexName = {"Thi�u hi�p","N� hi�p "};

t7XiItem = {	--����,��Ʒ���1,��Ʒ���2,��Ʒ���3
		atlas = {"Tinh Tinh ��a ��",2,0,407},
		star = {"Sao b�ng r�i xu�ng tr�n gian",2,0,408},
		}
--�жϵ�ǰ�ǲ���һ��һŮ����Ҷ����ڣ��������໥���벻��������
function Is_Lovers_Team()	
	local nOldPlayerIndex = PlayerIndex
	if GetTeamSize() == 2 then
		local Sex1,Sex2
		PlayerIndex = GetTeamMember(1)
		if IsPlayerNear(GetTeamMember(2)) < 0 then	--����̫Զ������������
			return 0;
		end;
		Sex1 = GetSex()
		if GetLevel() <= 10 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		PlayerIndex = GetTeamMember(2)
		Sex2 = GetSex()
		if GetLevel() <= 10 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end;
		if Sex1 ~= Sex2 then
			PlayerIndex = nOldPlayerIndex
			return 1
		else
			PlayerIndex = nOldPlayerIndex
			return 0
		end
	else
		PlayerIndex = nOldPlayerIndex
		return 0
	end
end

function Get_Qixi06_State()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 060728 and nDate <= 060806 then
		return 1;
	else
		return 0;
	end;
end;

function nothing()

end;