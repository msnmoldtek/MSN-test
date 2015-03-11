public with sharing class pharmaExt {

    public Id phId{get;set;}
    public List<Brand_Wise_Products_Available__c> bwpalist{set;get;}
    public Chemist__c PharmacistList{get;set;}
    
        public pharmaExt(ApexPages.StandardController controller) {
        
        phId = ApexPages.Currentpage().getParameters().get('id');
        
       PharmacistList = new Chemist__c ();
       PharmacistList = [Select id,Name From Chemist__c where id =: phId ];
        bwpalist = new List<Brand_Wise_Products_Available__c>();
        bwpalist = [select id,Name,Chemist__c,Product_Details__c,Quantity_Brand_wise__c from Brand_Wise_Products_Available__c where Chemist__c =: phId];
    
        }

}