Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\nvn\\3v3.lua")

-- from systemtimetask
--9:04���ʱ���ִ��
function main()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		DebugOutput("cross-server 3v3 across season!!!");
		OnInit();
	end
end