function main()
Say ("T� ti�n ta �� ��nh c� � ��y r�t l�u r�i, ng��i c� th� l�m d�u � ��y �� kh�i l�c ���c.",2,"Hay l�m! Ta s� kh�c k� hi�u � ��y./yes","Ta t� t�m hi�u v�y!/no")
end

function yes()
i=AddRecord()
if i==0 then
TaskTip("B�n ch�a c� k� n�ng luy�n b�a, kh�ng th� l�m k� hi�u!")
elseif i==1 then
TaskTip("K� n�ng luy�n b�a c�a b�n ch�a ��t ��n c�p 3, kh�ng th� l�m k� hi�u!")
elseif i==2 then
TaskTip("B�n qu� tinh m�t! Tho�ng ch�c �� nh� ���c v� tr� � ��y!")
else
end 
end

function no()
end
