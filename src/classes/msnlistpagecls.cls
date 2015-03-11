public with sharing class msnlistpagecls {




    public PageReference newMSNProduct()  {
    
    PageReference  ref=new PageReference ('/a09/e?retURL=%2Fapex%2Fmsnprolistpageviewpage');
    ref.setredirect(true);
    
    
    
       return ref;
       }


public string recdid{get;set;}

    public PageReference delmsn() {
    
    list<MSN_Product__c>lstD=[select id,Name from MSN_Product__c where id=:recdid];
    
    delete lstD;
    
    PageReference  refD=new PageReference ('/apex/msnprolistpageviewpage');
    refD.setredirect(true);
    
    
    
    
    
        return refD;
    }


    public list<MSN_Product__c> lstmsn { get; set; }
    
    public msnlistpagecls ()
    {
 
    
        lstmsn =[select id,Name from MSN_Product__c];
    
   
   
    
    
    }
    


}