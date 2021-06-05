--����ϵͳ����������

t_meridian_level_condition =
{
	[1] = 
		{
			sz_name = "V� Hi�n",
			t_require = 
				{
					trans_count = 0,
					level = 80,
				},
			t_ib_consume =
				{
					exp = 100*10000,
					t_item =
						{
							{2, 1, 270, 1, "B�ch C�u Ho�n"},
						},
				},
		},
	[2] = 
		{
			sz_name = "V� T��ng",
			t_require = 
				{
					trans_count = 0,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 10*10000*10000,
					t_item =
						{
--							{2, 0, 1083, 1, "̫�׻�Ԫ����"},
--							{2, 0, 553, 9, "���˲ι�"},
--							{2, 1, 1008, 9, "�׾��ɵ�"},
							
							{2, 0, 553, 5, "��i Nh�n s�m"},
							{2, 1, 1008, 5, "B�ch C�u Ti�n ��n"},
						},
				},
		},
	[3] = 
		{
			sz_name = "V� V��ng",
			t_require = 
				{
					trans_count = 0,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 15*10000*10000, --20*10000*10000,
					t_item =
						{
							--{2, 95,  204, 4, "�����"	},
							----{2, 1, 30370, 1, "���Ž���"	},
							
							{2, 1, 30730, 10, "Kinh M�ch ��ng Nh�n"},
							{2, 1, 270, 10, "B�ch C�u Ho�n"},
							{2, 1, 30669, 10, "M�nh M�t T�ch"},
						},
				},
		},
	[4] = 
		{
			sz_name = "V� T�n",
			t_require = 
				{
					trans_count = 6,
					level = 90,
				},
			t_ib_consume =
				{
					exp = 0,
					t_item =
						{
							{2, 95,  204, 20, "Thi�n Cang L�nh"	},
							{2, 1, 30370, 20, "Thi�n M�n Kim L�nh"	},
						},
				},
			global_msg = 1,
		},
	[5] = 
		{
			sz_name = "V� Ho�ng",
		},
	[6] = 
		{
			sz_name = "V� Th�nh",
		},
}

function meridianlevel_check_all_ib(nNewLevel, bNotify)
	if meridianlevel_check_require(nNewLevel, bNotify) ~= 1 then
		return 0
	end
	if meridianlevel_check_consume(nNewLevel, 0, bNotify) ~= 1 then
		return 0
	end
	return 1
end

--��ȡ������
function meridianlevel_getname(nNewLevel)
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name="[kh�ng]"}
	local szName = tCfg.sz_name or "[kh�ng]"
	return szName
end

--���������������
--0 ��ʾδ���
--1��ʾ�Ѵ��
function meridianlevel_check_require(nNewLevel, bNotify)
	if nNewLevel < 0 or nNewLevel > 6 then
		return 0
	end
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name=""}
	local tPreCfg = t_meridian_level_condition[nNewLevel - 1] or {sz_name=""}
	if MeridianGetLevel() ~= (nNewLevel - 1) then
		if 1 == bNotify then
			if nNewLevel > 1 then
    			Talk(1,"",format("Hi�n ch�a ph�i l� c�nh gi�i %s kh�ng th� k�ch ho�t c�nh gi�i %s!", tPreCfg.sz_name, tCfg.sz_name))
			else
				Talk(1,"",format("�� k�ch ho�t c�nh gi�i cao h�n, kh�ng th� k�ch ho�t l�i c�nh gi�i %s!", t_meridian_level_condition[nNewLevel].sz_name))
			end
		end
		return 0
	end
	
	local t = _get_require_cfg(nNewLevel)
	if t then
		if t.trans_count and t.trans_count > 0 then
			if gf_GetTransCount() < t.trans_count then
				if 1 == bNotify then
        			Talk(1,"",format("Ch�a ��t ��n chuy�n sinh %d kh�ng th� k�ch ho�t c�nh gi�i %s!", t.trans_count, tCfg.sz_name))
        		end
        		return 0
			end
		end
		if t.level and t.level > 0 then
			if GetLevel() < t.level then
				if 1 == bNotify then
        			Talk(1,"",format("C�p �� ch�a ��t %d kh�ng th� k�ch ho�t c�nh gi�i %s!", t.level, tCfg.sz_name))
        		end
        		return 0
			end
		end
	else
		return 0
	end
	return 1
end

--IB���������������
--0 ��ʾδ���
--1��ʾ�Ѵ��
function meridianlevel_check_consume(nNewLevel, bDelete, bNotify)
	if nNewLevel < 0 or nNewLevel > 6 then
		return 0
	end
	
	local tCfg = t_meridian_level_condition[nNewLevel] or {sz_name=""}
	local t = _get_ib_consume_cfg(nNewLevel) 
	if t then
		if t.exp then
			if GetExp() < t.exp then
				if 1 == bNotify then
					Talk(1,"",format("Kinh nghi�m kh�ng �� %d, k�ch ho�t c�nh gi�i %s th�t b�i!", t.exp, tCfg.sz_name))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[1], ti[2], ti[3]) < ti[4] then
        			if 1 == bNotify then
        				Talk(1,"",format("%sx%d kh�ng ��, k�ch ho�t c�nh gi�i %s th�t b�i!", ti[5], ti[4], tCfg.sz_name))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --���ж����ͨ���ˣ�ִ��ɾ��
    		if t.exp then
            	local nCanModifyExpFlag = CanModifyExp(-1 * t.exp) or 0
            	if nCanModifyExpFlag ~= 1 then
            		return 0
            	end
            	ModifyExp(-1 * t.exp)
    		end
    		if t.t_item then
    			for i = 1, getn(t.t_item) do
                    local ti = t.t_item[i]
            		local nDelResult = DelItem(ti[1], ti[2], ti[3], ti[4])
            		if not nDelResult or nDelResult ~= 1  then
            			return 0
            		end
    			end
    		end
    		--ɾ�����˵������ɹ���,�ж��Ƿ���Ҫ�㲥
    		if tCfg.global_msg then
    			Msg2Global(format("[%s] k�ch ho�t c�nh gi�i th�nh c�ng, b��c v�o c�nh gi�i [%s], c�c ho�t qu� th�t l�i h�i.", GetName(), meridianlevel_getname(nNewLevel)))
    		end
		end
	end
	return 1
end

--��ȡIB������ϸ��������
--����szDesc
function meridianlevel_get_ib_consume_desc(nNewLevel)
	local szDesc = ""
	
	local t = _get_ib_consume_cfg(nNewLevel)
	if t then
		if t.exp then
			szDesc = format("Kinh nghi�m %d", t.exp)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local strTemp = szDesc
        		local strTemp2 = format("%sx%d", t.t_item[i][5], t.t_item[i][4])
        		szDesc = format("%s, %s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "[kh�ng]"
	end
	return szDesc
end

function meridianlevel_get_require_desc(nNewLevel)
	local szDesc = ""
	
	local t = _get_require_cfg(nNewLevel)
	if t then
		if t.trans_count and t.trans_count > 0 then
			szDesc = format("%s chuy�n sinh %d", szDesc, t.trans_count)
		end
		if t.level and t.level > 0 then
			szDesc = format("%s c�p %d", szDesc, t.level)
		end
	else
		szDesc = "[kh�ng]"
	end
	return szDesc
end

function _get_ib_consume_cfg(nNewLevel)
	local t = t_meridian_level_condition[nNewLevel]
	if t then
		return t.t_ib_consume
	end
end

function _get_require_cfg(nNewLevel)
	local t = t_meridian_level_condition[nNewLevel]
	if t then
		return t.t_require
	end
end

--Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--Խ��ת���ű�
--VNG define begin
--ֱ�Ӱѽű����ù�������Ҫ�����ļ���
function vng_get_translife_count()
	local TRANSLIFE_TASK_ID = 1538
	local TRANSLIFE_BYTE_COUNT = 1
	return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_COUNT)
end
--VNG define end

function gf_GetTransCount()
	local nAddvanceTrans = GetPlayerRebornParam(0)
	if nAddvanceTrans > 0 then
		--Խ��ת������������5ת��6ת�����з�ϵͳ��¼
		return nAddvanceTrans + 5
	end
	return vng_get_translife_count()
end

