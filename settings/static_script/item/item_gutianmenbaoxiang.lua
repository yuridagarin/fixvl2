--�����ű�����Ʒ�ű�
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\task_access_code_def.lua")

--�ض��������Ž���Ĵ�������
N_NEVER_X_AWARD_LIMIT=100

SZ_LOG_TITLE="C� Thi�n M�n B�o R��ng"

--������ʾ�浽�����Ž���
GET_TIAMMENJINLING_FLAG=65535

t_special_award = --����бس������������
{
	nSaveTaskId = 3080,
	nSaveTaskAccessCode = TASK_ACCESS_CODE_GUTIANMENBAOXIANG,
	nSaveTaskWordIdx = 1,
	nSureAwardCount = 600,
	nAddcounterPerUpdate=1,--ÿִ��һ��Update����������ֵ
	t_award =
	{
		{{MA_TianMenJinLing, {}}, 10000},
	},
}

--��ʾ�浽�����Ž�����ǲ����κζ���
function _PreGetTianMenJinLing()
	local r = GET_TIAMMENJINLING_FLAG;
	return r, r, r, r;
end

--����û��100% ʣ�µĸ��ʸ����Ž���
t_normal_award=
{
	{{"Qu�n C�ng Huy Ho�ng",{2,1,9977,1},30,1, {1, 100}},1},-----------600
	
	{{"H�c Ng�c �o�n T�c Cao",{1,0,6,1},nil,nil, {1, 100}},500},
	{{"Sinh Sinh H�a T�n",{1,0,16,1},nil,nil, {1, 100}},500},
	
	{{"Thi�n Th�ch linh th�ch",{2,1,1068,1},nil,1, {1, 100}},1},------3000
	
	{{"V�n V�t Quy Nguy�n ��n",{1,0,11,1},nil,nil, {1, 100}},500},
	{{"T�i ti�n",{2,1,30367,1},nil,nil, {1, 100}},500},
	{{"C�u chuy�n h�i h�n ��n",{1,0,32,1},nil,nil, {1, 100}},200},
	
	{{"Qu�n C�ng Huy Ho�ng",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"C�y B�t Nh� nh�",{2,0,504,1},30,nil, {1, 100}},400},
	{{"M�nh Thi�n th�ch",{2,2,7,1},nil,nil, {1, 100}},400},
	
	{{"Qu�n C�ng Huy Ho�ng",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"T�i ti�n",{2,1,30367,2},nil,nil, {1, 100}},2500},
	
	{{"Qu�n C�ng Huy Ho�ng",{2,1,9977,1},30,1, {1, 100}},2},-----------600
	
	{{"L�c Th�n ho�n",{2,1,1064,1},30,nil, {1, 100}},200},
	{{"Tu Ch�n Y�u Quy�t",{2,0,554,1},30,nil, {1, 100}},200},
	{{"B�ch C�u Ho�n",{2,1,270,1},30,nil, {1, 100}},200},
	{{"Tam Thanh ho�n",{2,1,1097,1},30,nil, {1, 100}},200},
	
	--���Ž���5��λ�ÿ����浽���ٺ�,�ܸ���Ϊ5
	---��ʾ�浽�����Ž�����ǲ����κζ���
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"T�i ti�n",{2,1,30367,3},nil,nil, {1, 100}},1000},
	
	{{"Qu�n C�ng Huy Ho�ng",{2,1,9977,1},30,1, {1, 100}},3},-----------600
	
	{{"T�i ti�n",{2,1,30367,4},nil,nil, {1, 100}},500},
	
	{{"��nh H�n Thi�n Th�ch Th�n Th�ch",{2,1,1067,1},nil,1, {1, 100}},1},---------3000
	
	{{"C��ng L�c Th�n ho�n",{2,1,1065,1},30,nil, {1, 100}},200},
	{{"C�y B�t Nh�",{2,0,398,1},30,nil, {1, 100}},100},
	{{"Th�n N�ng ��n",{2,1,343,1},30,nil, {1, 100}},100},
	{{"��i B�ch C�u ho�n",{2,1,1007,1},30,nil, {1, 100}},200},
	{{"C��ng Tam Thanh ho�n",{2,1,1098,1},30,nil, {1, 100}},200},
	{{"T�i ti�n",{2,1,30367,8},nil,nil, {1, 100}},333},
	
	--���Ž���5��λ�ÿ����浽���ٺ�,�ܸ���Ϊ5
	---��ʾ�浽�����Ž�����ǲ����κζ���
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"L�c Th�n Ti�n ��n",{2,1,1066,1},30,nil, {1, 100}},100},
	{{"Qu�n C�ng Ch��ng",{2,1,9999,1},30,nil, {1, 100}},100},
	{{"��i Nh�n s�m",{2,0,553,1},30,nil, {1, 100}},100},
	{{"B�ch C�u Ti�n ��n",{2,1,1008,1},30,nil, {1, 100}},100},
	{{"Tam Thanh Ti�n ��n",{2,1,1099,1},30,nil, {1, 100}},100},
	
	--���Ž���5��λ�ÿ����浽���ٺ�,�ܸ���Ϊ5
	---��ʾ�浽�����Ž�����ǲ����κζ���
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"Qu�n C�ng b�i",{2,1,9997,1},30,nil, {1, 100}},100},
	{{"T�i h�t gi�ng",{2,1,30087,1},30,nil, {1, 100}},100},
	{{"T�i ti�n",{2,1,30367,16},nil,nil, {1, 100}},100},
	
	--���Ž���5��λ�ÿ����浽���ٺ�,�ܸ���Ϊ5
	---��ʾ�浽�����Ž�����ǲ����κζ���
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"S� m�n l�nh k�",{2,1,1017,1},30,nil, {1, 100}},50},
	{{"T�i ti�n",{2,1,30367,32},nil,nil, {1, 100}},90},
	{{"T� Linh Quy Nguy�n ��n",{2,1,30352,1},30,nil, {1, 100}},50},
	{{"Ho�ng Kim ��i H�ng Bao (tr�ng)",{2,1,538,1},30,nil, {1, 100}},10},
	{{"T� Kim H�ng Bao (tr�ng)",{2,1,536,1},30,nil, {1, 100}},10},
	{{"Qu�n C�ng ��i",{2,1,9998,1},30,nil, {1, 100}},10},
	
	--���Ž���5��λ�ÿ����浽���ٺ�,�ܸ���Ϊ5
	---��ʾ�浽�����Ž�����ǲ����κζ���
	{{_PreGetTianMenJinLing, {}}, 1},---------4500*N
	
	{{"T�i ti�n",{2,1,30367,40},nil,nil, {1, 100}},10},
	{{"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1},nil,nil, {1, 100}},10},
	
	{{"B�ch Kim ��i H�ng Bao (kh�ng)",{2,1,30228,1},30,nil, {1, 100}},10},--400
}

t_require=
{
	{"C� Linh Ng�c",{2,1,30369,1}},
}

function OnUse_Real(nItemIdx)
	local szTitle = format("M� B�o R��ng C� Thi�n M�n c�n ti�u hao th�m C� Linh Ng�c x 1, c� mu�n m� kh�ng? ")
	local strtab = {
			format("\n mu�n m�/#_ConfirmUse(%d)", nItemIdx),
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function _ConfirmUse(nItemIdx)
	
	local nNeedRoom = 1
	local nNeedWeight = 100
	if gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,"") ~= 1 then
		Talk(1,"",format("H�nh trang kh�ng �� � tr�ng %d ho�c nh�n v�t kh�ng �� s�c l�c.!", nNeedRoom))
		return 0,0,0,-1
	end
	
	if 1 == _MissionAward_CheckCost(t_require, 1) then
		if 1 == DelItemByIndex(nItemIdx, 1) then
			local nAdd = t_special_award.nAddcounterPerUpdate or 1
			local g,d,p,n = MissionAward_UpdateSpecialAward(t_special_award, SZ_LOG_TITLE, nAdd, 1)--�س����Ž���
			
			local N_MAX_TRY_CNT = 5
			local nTryCnt = 0;
			while not n or n<=0 or _IsTianMenJinLing(g,d,p,n)==1 do
				
				local nCnt,nMax = MissionAward_GetSpecialAwardCounter(t_special_award)
				nTryCnt = nTryCnt + 1
				if nTryCnt > N_MAX_TRY_CNT then
					WriteLog(format("[%s] open [gutianmenbaoxiang][%s], for [%d/%d] times rand, get none item, specitial counter=[%d/%d] ", GetName(), SZ_LOG_TITLE, nTryCnt, N_MAX_TRY_CNT, nCnt,nMax))
					return 0,0,0,-1
				end
				
				g,d,p,n = _MissionAward_RandAward(t_normal_award, SZ_LOG_TITLE)
				
				if _IsTianMenJinLing(g,d,p,n)==1 then
					--1~N_NEVER_X_AWARD_LIMIT�ز������Ž�����Ҫ����ѭ���������
					if nCnt and nCnt > N_NEVER_X_AWARD_LIMIT then
    					return MA_SpecialAward(t_special_award, SZ_LOG_TITLE)--�浽�����Ž���
    				end
				end
			end
			return g,d,p,n
		end
	end
end

function _IsTianMenJinLing(g,d,p,n)
	local r = GET_TIAMMENJINLING_FLAG;
	if g==r and d==r and p==r and n==r then
		return 1
	end
	return 0
end

function nothing()
end
