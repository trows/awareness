window.onload=function() {
	var oText = document.getElementById('txtBirthday');
	oText.onclick = function () {
		alert('123');
	}
};
//	$('#txtBirthday').onclick=function(){
//		alert('123');
//		$('input:jqmData(role="datebox")').mobiscroll().date();//��ʼ��
//		var opt = {
//			preset: 'date', //����
//			theme: 'jqm', //Ƥ����ʽ
//			display: 'modal', //��ʾ��ʽ
//			mode: 'clickpick', //����ѡ��ģʽ
//			dateFormat: 'yy-mm-dd', // ���ڸ�ʽ
//			setText: 'ȷ��', //ȷ�ϰ�ť����
//			cancelText: 'ȡ��',//ȡ����ť������
//			dateOrder: 'yymmdd', //������������и�ʽ
//			dayText: '��', monthText: '��', yearText: '��', //���������������
//			endYear:2020 //�������
//		};
//		$('input:jqmData(role="datebox")').mobiscroll(opt);
//	}
//
//
//}