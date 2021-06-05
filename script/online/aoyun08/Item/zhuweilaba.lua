--ʥ�𴫵ݻ��������
--by vivi
--2008/06/04

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_ZHUWEI_NUM) ~= 0 then
		if GetGlbValue(GLB_AOYUN_TIME_STATE) == 0 then
			Talk(1,"","<color=green>Loa c� v�<color>: Ho�t ��ng �� k�t th�c.");
			return
		end
		local nZwNum = GetTask(TASK_AOYUN_ZHUWEI_NUM);
		if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) >= nZwNum then
			Say("<color=green>Loa c� v�<color>: Mu�n ph�t l�i ch�c n�o?",
				4,
				"Ch�c ��i h�i th�nh c�ng t�t ��p!/#aoyun_zhuwei(1)",
				"Ch�c V� L�m ng�y c�ng ph�t tri�n!/#aoyun_zhuwei(2)",
				"Th�nh H�a m�i b�t di�t!/#aoyun_zhuwei(3)",
				"�� ph�t sau/nothing")
		else
			Talk(1,"","<color=green>Loa c� v�<color>: �u�c v�n ch�a chuy�n ��n ��y.")
		end
	else
		Talk(1,"","<color=green>Loa c� v�<color>: B�n kh�ng ph�i ng��i c� v�.")
	end
end

function aoyun_zhuwei(nType)
	if GetTask(TASK_AOYUN_USE_LABA) ~= 0 then
		Talk(1,"","<color=green>Loa c� v�<color>: M�i ng��i ch� d�ng 1 l�n Loa c� v�.");
		return
	end
	if DelItem(2,1,3378,1) == 1 then
		local nIdx = PIdx2NpcIdx(PlayerIndex);
		local nLv = GetLevel();
		local nExp = floor((nLv^3)*8);
		if nType == 1 then
			NpcChat(nIdx,"Ch�c ��i h�i th�nh c�ng t�t ��p!");
		elseif nType == 2 then
			NpcChat(nIdx,"Ch�c V� L�m ng�y c�ng ph�t tri�n!");
		else
			NpcChat(nIdx,"Th�nh H�a m�i b�t di�t!");
		end
		if nLv ~= 99 then
			SetTask(TASK_AOYUN_USE_LABA,1);
			ModifyExp(nExp);
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
			local nRand = random(1,100); 
			if nRand <= 40 then	    --ע�⣬�շ���ֻ�����ֶ���
				AddItem(2,1,1012,1);
			elseif nRand <= 80 then
				AddItem(2,0,109,1);
			else
				AddItem(2,1,1013,1);
			end
		else
			SetTask(TASK_AOYUN_USE_LABA,1);
			local nRand = random(1,100);
			if nRand <= 80 then
				lspf_AddLingShiInBottle(6,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 6, �� b� v�o trong T� Linh ��nh.");
			else
				lspf_AddLingShiInBottle(7,1);
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Linh th�ch c�p 7, �� b� v�o trong T� Linh ��nh.");									
			end 
		end
	end
end