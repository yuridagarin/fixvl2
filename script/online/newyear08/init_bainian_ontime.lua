--08���ڰ����ʼ���ű�
--by vivi
--2008/01/11

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		local nState,nActionStep = getwindstate();
		SetMapTaskTemp(100,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(100,MAP_WIND_RAND,0);
		SetMapTaskTemp(150,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(150,MAP_WIND_RAND,0);
		SetMapTaskTemp(200,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(200,MAP_WIND_RAND,0);
		SetMapTaskTemp(300,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(300,MAP_WIND_RAND,0);
		SetMapTaskTemp(350,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(350,MAP_WIND_RAND,0);
		SetMapTaskTemp(400,MAP_WIND_TIME,nActionStep);
		SetMapTaskTemp(400,MAP_WIND_RAND,0);
		Msg2SubWorld("Nhi�m v� ch�c t�t v�ng m�i �� b�t ��u, ng��i tham gia xin nhanh ch�ng ��n Ni�n S� nh�n nhi�m v�!");	
	--	AddLocalNews("�µ�һ�ְ��������Ѿ���ʼ�ˣ�Ҫ�μӵ������쵽����ʹ�ߴ���ȡ����");												
	end
end