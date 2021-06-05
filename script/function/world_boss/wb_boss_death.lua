--����BOSS�����ű�
Include("\\script\\function\\world_boss\\wb_head.lua")

function OnDeath(id, f, x)
	local npcName = GetNpcName(id);
	local nMap, nX, nY = GetNpcWorldPos(id);
	local killer = "";
	--˭������
	if f == 0 then
		killer = GetName();
		gf_TeamOperateEX(wb_KillAward);
	end
	local msg = format("Sau m�t h�i chi�n ��u k�ch li�t, cu�i c�ng BOSS %s �� b� %s ti�u di�t th�nh c�ng.", npcName, killer);
	Msg2Global(msg);
	AddLocalNews(msg);
	--ˢ����
	local bigBox = CreateNpc("WorldBoss_Box", "R��ng V�ng ��i Chi�n", nMap, nX, nY);
	if bigBox > 0 then
		SetNpcScript(bigBox, "\\script\\function\\world_boss\\wb_big_box.lua");
		SetNpcLifeTime(bigBox, 30 * 60);
	end
	local nScriptFile = "";
	local nHour = tonumber(date("%H"));
	if nHour >= 12 and nHour < 18 then --����ˢ��
		nScriptFile = "\\script\\function\\world_boss\\wb_small_box.lua";
	else --����ˢ��
		nScriptFile = "\\script\\function\\world_boss\\wb_small_box1.lua";
	end
	for i = 1, 50 do
		local smallBox = CreateNpc("tongbaoxiang", "��i Chi�n B�o H�p", nMap, nX + random(-i, i), nY + random(-i, i));
		if smallBox > 0 then
			SetNpcScript(smallBox, nScriptFile);
			SetNpcLifeTime(smallBox, 30 * 60);
		end
	end
	--ɾ��ʬ��
	SetNpcRemoveScript(id, "");
	SetNpcLifeTime(id, 0);
	AddRuntimeStat(23, 1, 0, 1);
end