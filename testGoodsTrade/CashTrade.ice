#ifndef CASH_TRADE_ICE
#define CASH_TRADE_ICE
#include "base.ice"

module Trade
{
    //������Ϣ
    struct Seller
    {
		string 	ptaccount;		//������pt�˺�
		string	ptsdid;
        string	characterid;	//�����Ľ�ɫid
        string  charactername;	//�����Ľ�ɫ��
		string  matrixid;		//�������ڵ�����
		string  midaccount;     //�ֽ�֧���м��̻���
    };
    
    //������Ϣ
    struct Item
    {
        string      bookid;
        string      itemName;
        string      itemImage;
        int			itemId;
        int			itemType;
		float	    price;				//���۵ļ۸�
		int			count;				//��������
		int			cointype;			//��������  1:�ֽ� 2:��ȯ
		double	    feeRate;			//����
		int			feeType;			//��Ҹ���/���Ҹ���
		double      feeAdd;				//���ʼ���
		string		couponType;         //ʹ���Ż�ȯ����,���Ϊ�ձ�ʾ��ʹ���Ż�ȯ
		int			batches;			//��������Ʒ��һ��Ϊ��λ���ж���
		int			srcCode;			//������Դ
    };
   
    //��ɫ��¼�������ĵ������Ϣ
    struct LoginInfo
    {
		int			gameid;
		int			areaid;
		int			groupid;
		long		characterid;
		string      charactername;
		long		sdid;
		string		ptaccount;
		string		guid;
		string		ip;
		string		redirect;
		int			playid;
		short		level;
		short		sex;
		long		career;
		int			logintime;
    };
    
    struct OrderInfo
    {
		int			nBuyType;
		int			nOrderType;
		int			nStatus;
		string		strKeyword;
		int			nGoodstype;
		int			nStarttime;
		int			nEndtime;
		
    };
    
    struct AddrInfo
    {
		string	strName;
		string	strPhone;
		string	strAddress;
		string	strPostcode;
    };
    
    struct SmRoleInfo
    {
		int			gameid;
		int			areaid;
		int			groupid;
		string		characterid;
		string      charactername;
		string		account;
		int			looks;
		int			career;
		int			pvehp;
		int			pveattack;
		int			pvedefense;
		int			coin;
		int			giftcoin;
		int			gem;
		int			cachegem;
		int			vote;
		int			point;
		int			wooolpoint;
		int			wooolreward;
		int			eyesight;
		int			successivecount;
		int			refreshcount;
		int			state;
		int			skill;
		int			skills;
		int			lastdroptype;
    };
    
    struct SmSkillInfo
    {
		int			id;
		string		name;
		int			model;
		string		color;
		int			coefficient;
		int			career;
		string		url;
		string		memo;
    };
   
    dictionary<string,string> KV;

    interface CashTrade
    {
		//��Ʒ�¼�
		int ItemOffShelf(Identity id, string bookId,int productType);
		
		//������Ʒ�۸�
		int ItemUpdatePrice(Identity id, string bookId,string newPrice);
    
		//֪ͨ���˿�
		int OrderStatusChangeNotify(Identity id,string json);
		
        //������ߣ����ض�����Ϣ��
        int BuyItem(Identity id,Seller s,Item i,out string result);									
        
        //����b2c���ߣ����ض�����Ϣ��
        int BuyB2CItem(Identity id,Seller s,Item i,out string result);
        int RegisterB2CAddress(Identity id,string orderId,AddrInfo info);
        
        //��֮���Ź���¼
        int GrouponBuy(Identity id,int groupId,string orderId,string price,int num,int state,out string result);
        
        //�齱
        int BuyLottery(Identity id,out string result);
        int ShowRecentLotteryResult(Identity id,int page,int count,out string result);
        int	CheckWinLottery(Identity id,string type,out string result);
        int RegisterLotteryAddress(Identity id,AddrInfo info);
        int	ShowMyLotteryResult(Identity id,int page,int count,out string result);
        
        //����
        int AddRole(Identity id, int looks, int career, out string characterInfo);
        int GetRole(Identity id, out string characterInfo);
        int AddCoin(Identity id, int coin);
        int SubCoin(Identity id, int coin);
        int GetCoin(Identity id, out string coinInfo);
        int BuyCoin(Identity id, int coin, out string coinInfo);
        int BuySkill(Identity id, out string skillInfo);
        int ChangeSkill(Identity id, int skill, out string skillInfo);
        int BuyAttr(Identity id, out string characterInfo);
        int BuyLoot(Identity id, int lootId, out string lootInfo);
        
        int GetLastPveBattleScene(Identity id, out string sceneInfo);
        int CalPveResult(Identity id, int select, out string sceneInfo);
        int RefreshPveBattleScene(Identity id, string battleId, out string sceneInfo);
        int UpdateEyeSight(Identity id, int eyeSight, out string sceneInfo);
        int LosingBattle(Identity id, int state);
        
        //���Ժ�̨����
        int GetAllSlotMachineConfigs(out string configs);
        int SetSlotMachineConfig(string key, string value);
        int GetMonstersInfo(int page, int count, out string monsters);
        int SetMonsterInfo(int monsterId, string monsterName, int hp, int attack, int defense, string monsterPic);
        int GetPveBattleInfo(string account, int page, int count, out string battleInfo);
        int GetRoleInfo(string account, out string characterInfo);
        int SetRoleInfo(SmRoleInfo info);
        int GetLoots(string lootName, int page, int count, out string lootsInfo);
        int SetLootGoods(int lootId, int lootType, int goodsId, int goodsType, string lootName, string goodsName, string goodsUrl, int goodsCount, int rate);
        int DelLootGoods(int lootId, int goodsId, int goodsType);
        int GetSkillInfo(string skillName, int page, int count, out string skillInfo);
        int SetSkillInfo(SmSkillInfo info);
        int GetCoinLog(string account, int page, int count, out string coinLog);
        
        
        //�г�����,ͨ��type�������ҹ���ġ��ҳ��۵ġ����¼ܵĵ�,order_type����Ԫ��֧�������ֽ�֧����
        int QueryOrderList(Identity id,int type,int orderType,int status,string keyword,int goodsType,int starttime,int endtime,int count,int page,out string result);		
        int QuerySdptOrderList(Identity id,OrderInfo info,int count,int page,out string result);
        
        //�ܾ��˿�����
        int RefuseRefundApply(Identity id,string orderid,string detail);	
        
        //�˿�
        int Refund(Identity id,string orderid,string detail);

        //������֪ͨ								
		int PayResultNotify(Identity id,string orderid,string sequenceid,bool bSuccess);	
			
		//�رն���
		int CloseOrder(Identity id,string orderid,int reason,string detail);
			
		//��ѯ�������״̬���Զ��ŷָ�
		int QueryOrderStatus(Identity id,string orderlist,out string result);
			
		//���ݶ���id��ѯ��������
		int QueryOrderDetail(Identity id,string orderid,out string result);
			
		//����BookId��ѯ����Id
		int QueryOrderIdByBookId(Identity id,string bookid,out string orderid);
			
		//����ĳ��ԭ����������
		int LockOrder(Identity id,string orderid,int reason,string detail);
			
		//��������
		int UnlockOrder(Identity id,string orderid,int reason,string detail);

        //��½��¼
        int Login(Identity id);
		
		//��ȡ������ 
		//type 0:��������� 1:����������
		int GetFee(Identity id,string totalPrice, int type,out string fee);
        
        //���������
        int BuyBag(Identity id, int bagType, int renew,out string result);

        //�г����۰���
        int ListSellableBag(Identity id,out string baginfo);		
		
		//��Ϣ�ӿ�
		int GetMessage(Identity id,int isRead,int page,int count, out string result);
		int QueryMessageCount(Identity id,int isRead,out string result);
		int SetMessageStatus(Identity id,string msgId,int status);
		int SendMessage(Identity id,int type,string bookId,string goodsName);
		
		//ǰ�˼�ؽű�
		int Monitor(Identity id,string orderId);
		
		//��ѯ����״̬
		int QueryBillingStatus(Identity id,string orderId,out string result);		
		
		int Lottery(Identity id,int times,int sdptTimes,out string result);
		int QueryLottery(Identity id,out string result);
		int UserCouponList(Identity id, string type,bool isOutDated,int state,int page,int count, out string result);

		//���Ż�ȯ,��½ʱ����
		//�����Ż�ȯ�ɹ�����0
		//�������� -1
		int SendCoupon(Identity id);
		
		//�г�����ɽ��Ķ���
		int ListRecentOrder(Identity id,int count,int type,out string result);		
		
		//������,�����ʺŽ��׷���ı���ģʽ
		//status
		//1 �����ʼ������
		//2 �����֧������
		//4 ������֪ͨ�Ķ���
		//5 ����ȷ�ϸ���Ķ���
		//7 ����ת����Ʒ�ɹ��Ķ���
		//8 ����ʱδ֧������
		//32 ����ȷ�Ϲ����ʺŵĶ���
		
		int ProcessOrders(Identity id,int status, out string result);
		//��ȡȷ�Ϲ����ʺŵ��ֻ���֤��
		int GetConfirmBuyAccountVerifyKey(Identity id,KV paramlist);
		//ȷ�Ϲ����ʺ�
		int ConfirmBuyAccount(Identity id,KV paramlist, out string result);
		//��ȡ�ʺ���ʱ����
		int GetAccountTempPass(Identity id,string orderId,out string result);
        //�����ʺţ����ض�����Ϣ��
        int BuyAccount(Identity id,KV paramlist,out string result);	
        
        //�˿�����,�ʺŽ���
        int RefundApply(Identity id,KV paramlist,out string result);
        //�ж������ɺ�̨����
        int JugeTrade(Identity id,KV paramlist,out string result);	 
        
        //ͨ��hps�ӿ�
		int RequestApi(Identity id,string method,KV paramlist,out string result);       	
		
		//ͨ�ýӿ�
		int RequestMisApi(Identity id,string method,KV paramlist,out string result);     
    };
    
    interface GoodsTrade
    {
		int TradeAPI(Identity id,string method,string params,out string result);
		int GoodsAPI(Identity id,string method,string params,out string result);
		int HpsAPI(Identity id,string method,string params,out string result);
    };
    
};

#endif

