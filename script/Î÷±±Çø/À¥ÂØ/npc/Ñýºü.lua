TB_FOX_DIALOG = {
	"<color=green>H� Y�u<color>: L� ai l�m, ta s� kh�ng tha!",
	"<color=green>H� Y�u<color>: Tr�n ph�p n�y ng�y c�ng m�nh, ta kh�ng th� c� ��ng!",
	"<color=green>H� Y�u<color>: Ai t�i c�u ta! Ta...ki�t s�c r�i...",
}
function main()
	Talk(1,"",TB_FOX_DIALOG[random(getn(TB_FOX_DIALOG))])
end
