tNpcTalk = {
	"Nh�n c�c g�! C�i ��u xu�ng!",
	"M�y t�n kia! H�y ch� � nghe l�i gi�o hu�n c�a tr��ng gi�o!",
	"D�n ��i T�ng lu�n ch�u s� x�m ph�m c�a ngo�i t�c, ta c�ng c�m th�y �p l�c r�t l�n.",
	"L�i nh� cha m� r�i ",
	"Tham qu�n kh�ng th� x�ng tr�n gi�t gi�c, th�t l� ��ng ti�c!",
	"N��ng t� � nh� c� nh� ta kh�ng,� ",
	"Ch� c�n qu�n quan �� ch�t tr�n chi�n tr��ng l� ta c� c� h�i th�ng ch�c r�i!",
	"Th�t mu�n v�t b� v� kh� tr�n tay, phi�u b�c giang h�!..",
	"Qu�n Nhi mu�i mu�i th�t l� xinh, ha ha!",
	"B�n kia ��i T�ng l� ��u th�?",
}

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == "Gi�o tr��ng qu�n quan" then
		Talk(1,"","<color=yellow>Gi�o tr��ng qu�n quan<color>: "..tNpcTalk[random(1,2)]);
	else
		Talk(1,"","<color=yellow>Gi�o tr��ng qu�n s�<color>: "..tNpcTalk[random(3,getn(tNpcTalk))]);
	end
end