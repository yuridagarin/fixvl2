function main()

local nTalk_str = {
	"H�n l� m� kh�ng c� ti�ng nh�c c�a ta th� th�t l� bu�n. Ch�c t�n lang t�n n��ng tr�m n�m h�nh ph�c!",
	"T�n n��ng, t�n lang b�ch ni�n giai l�o!",
	"T�n lang v� t�n n��ng V�nh k�t ��ng t�m!",
	}

local i = random(1,getn(nTalk_str))

	Talk(1,"",nTalk_str[i])

end
