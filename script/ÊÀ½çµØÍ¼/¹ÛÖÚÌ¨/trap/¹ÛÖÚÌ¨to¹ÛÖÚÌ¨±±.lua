--Create Date:2008-1-14 11:27
--Author:yanjun
--Description:Trap��ű�
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_nFieldDirection = 4;

function main()
	if SubWorldIdx2ID(SubWorld) ~= 6028 then
		BWT_ProcessTrap(g_nFieldDirection);
	end
end;