--=============================================
-- Created by TuanNA5
--=============================================

Include("\\script\\lib\\globalfunctions.lua");

tb_GoldBoss_Award = {
	{"Tu Ch�n Y�u Quy�t", 281, {2, 0, 554, 1}, 15*24*3600},
	{"Ti�u Nh�n S�m", 300, {2, 0, 552, 1}, 15*24*3600},
	{"Th�n N�ng ��n", 300, {2, 1, 343, 1}, 15*24*3600},
	{"Tr�i Tim Ph� Th�y", 300, {2, 1, 30126, 1}, 0},
	{"Nh�n S�m V�n N�m", 19, {2, 1, 30071, 1}, 0},
}

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	ModifyExp(250000)
	if gf_Judge_Room_Weight(1, 100, " ") == 0 then
        return 0;
    end
	if random(1,100) <= 50 then
		local nRand = gf_GetRandItemByTable(tb_GoldBoss_Award,1000,1)
		local nRet, nItemIdx = gf_AddItemEx2(tb_GoldBoss_Award[nRand][3],tb_GoldBoss_Award[nRand][1],"Hoat dong Tet Nguyen Dan","gi�t gia c�m ho�ng kim",tb_GoldBoss_Award[nRand][4])
	end
end