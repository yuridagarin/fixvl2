--08���ڷ��ź����ʼ���ű�
--by vivi
--2008/01/11

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		SetMapTaskTemp(100,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(150,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(200,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(300,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(350,MAP_HONGBAO_NUM,0);
		SetMapTaskTemp(400,MAP_HONGBAO_NUM,0);
		Msg2SubWorld("Ni�n S� �� ph�t h�ng bao, m�i ng��i mau ��n nh�n!");	
--		AddLocalNews("����ʹ���Ѿ��ڷ��Ŵ����ˣ���ҿ�ȥ������");	
	end		
end