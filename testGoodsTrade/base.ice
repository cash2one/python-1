#ifndef BASE_ICE
#define BASE_ICE

module Trade
{
	//��¼ʱ�õ��ı�ʶ
	struct Identity
	{
		string  strName;			//�ӿڷ��ʷ�������
		string	strAccessToken;		//�ӿڷ��ʷ��ṩ��token
		string	ptsdid;				
		string 	ptaccount;			//�û�pt�˺�
        string	characterid;		//�û���ɫid
        string  charactername;		//�û���ɫ��
		string  matrixid;			//�û����ڵ�����
		string	clientIP;			//�û�������IP
		string	group;
	};
	
};

#endif