TITLE_QRYX_NUM = 30

function RemoveAllFestivalTitle()
	for i=1,3 do
		RemoveTitle(3,i)	--ɾ���ƺŴ���Ϊ3��С��Ϊ1,2,3�ĳƺţ�����Ϊ3�ĳƺ����ݿɲο�title.txt��
	end
	for i=1,TITLE_QRYX_NUM do
		RemoveTitle(4,i)
	end
end