Include("\\script\\newbattles\\sign_up_npc.lua");

--g_sNpcName = "Tri�u Di�n Ni�n";
g_sNpcName = "Ti�u Ph��ng";
g_nNpcCamp = SONG_ID;

function main()
		if random(1,50) == 1 then
			NpcChat(GetTargetNpc(),"�� kh�ch l� t��ng s� ��i T�ng ta anh d�ng gi�t gi�c, nh�ng ai tham gia tr�n ��nh Nh�n m�n quan ��u ���c nh�n Linh Th�ch!");
		end;
	battle_main();
end;