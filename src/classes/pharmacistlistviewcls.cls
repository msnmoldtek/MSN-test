public with sharing class pharmacistlistviewcls {

    public PageReference Newpharmacist() 
    {
    
    PageReference  ref1=new PageReference ('/a0C/e?retURL=%2Fapex%2Flistpageforpharmacist');
    ref1.setredirect(true);
    
    
        return ref1;
    }


public string recid1{get;set;}


    public PageReference delrec1() {
    
    
    list<chemist__c>lsth=[select id,Name,Area_Place__c from chemist__c where id=:recid1];
    
    
    delete lsth;
    
    
    PageReference  ref=new PageReference ('/apex/listpageforpharmacist');
    
    ref.setredirect(true);
    
        return ref;
    }



public list<chemist__c>phlist{get;set;}


public pharmacistlistviewcls()
{
String usrProfileName = [select u.Profile.Name from User u where u.id = :Userinfo.getUserId()].Profile.Name;

if(usrProfileName == 'System Administrator'){
    
        phlist=[select id,Name,Area_Place__c,MR__c from chemist__c];
    
    }
    
    else if(usrProfileName == 'Medical Representative'){
    
        phlist=[select id,Name,Area_Place__c,MR__c from chemist__c where MR__c =: Userinfo.getUserId()];
        
    
    }


}


}