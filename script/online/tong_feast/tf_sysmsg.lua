Include("\\script\\online\\tong_feast\\tf_head.lua")

function main()
	local today = Date();
	DebugOutput("today:week() =", today:week());
	if today:week() ~= 6 and today:week() ~= 0 then
		return 0;
	end
	DebugOutput("***Tong Feast Reset and Start!***");
	--���ù�������-----------------------
	DebugOutput("Thi�t ��t l�i ��u b�p bang ")
	local s = SDB(TF_FEAST_CHEF, 0, 0);
	s:delete();
	DebugOutput("Thi�t ��t l�i s� b�n ti�c");
	local s1 = SDB(TF_FEAST_CHEF, 0, 2);
	s1:delete(); 
	DebugOutput("Thi�t ��t l�i �� �n"); 
	local s2 = SDB(TF_FEAST_CHEF, 0, 3);
	s2:delete();
	DebugOutput("Thi�t ��t l�i s� ng��i ch�i");
	local s3 = SDB(TF_FEAST_CHEF, 0, 4);
	s3:delete();
	--------------------------------------
	tf_ClearNpcIndexTime();
	Msg2Global("Y�n ti�c bang h�i �� m�, m�i c�c anh em trong bang h�i m�nh nhanh ch�ng ��n Bi�n Kinh, Th�nh ��, Tuy�n Ch�u t�m ��u b�p bang ph�i, �� l�m ti�c h�i c�a bang!");
	AddLocalCountNews("Y�n ti�c bang h�i �� m�, m�i c�c anh em trong bang h�i m�nh nhanh ch�ng ��n Bi�n Kinh, Th�nh ��, Tuy�n Ch�u t�m ��u b�p bang ph�i, �� l�m ti�c h�i c�a bang!", 2);
end