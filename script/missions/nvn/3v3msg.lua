Include("\\script\\system_switch_config.lua")

function main()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local msg = "T� Th�n �i�n H�, ��i H�i T� V� s�p b�t ��u, m�i c�c ch� v� ��i hi�p ��n Bi�n Kinh th�ng qua [��c S� ��i H�i T� V�] tham gia"
	Msg2Global(msg);
	AddGlobalNews(msg, 1);
end
