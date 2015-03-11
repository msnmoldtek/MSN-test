public with sharing class Hospitallistviewcls {

    public PageReference NewHospital() 
    {
    
    PageReference  ref1=new PageReference ('/a0H/e?retURL=%2Fapex%2FlistpageforHospital');
    ref1.setredirect(true);
    
    
        return ref1;
    }


public string recid1{get;set;}


    public PageReference delrec1() {
    
    
    list<Hospital__c>lsth=[select id,Name from Hospital__c where id=:recid1];
    
    
    delete lsth;
    
    
    PageReference  ref=new PageReference ('/apex/listpageforHospital');
    
    ref.setredirect(true);
    
        return ref;
    }



public list<Hospital__c>hoslst{get;set;}


public Hospitallistviewcls()
{


String usrProfileName = [select u.Profile.Name from User u where u.id = :Userinfo.getUserId()].Profile.Name;
    
    if(usrProfileName == 'System Administrator'){
    
        hoslst=[select id,Name,Area__c,User__c from Hospital__c];
    
    }
    
    else if(usrProfileName == 'Medical Representative'){
    
        hoslst=[select id,Name,Area__c,User__c from Hospital__c where user__c =: Userinfo.getUserId()];
        
    
    }

}


}