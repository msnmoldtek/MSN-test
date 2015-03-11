public with sharing class listpageforAreascls {

    public PageReference insertrecord() {
    
    PageReference  ref=new PageReference ('/a0B/e?retURL=%2Fapex%2FlistpageforAreas');
    ref.setredirect(true);
    
        return ref;
    }


    public String searchvalue { get; set; }

public string recid{get;set;}

    public PageReference decrec() {
    
    list<Area__c>lstdel=[select id,Name from Area__c where id=:recid];
    
    delete lstdel;
  
    PageReference ref=new PageReference ('/apex/listpageforAreas?save_new=1&sfdc.override=1');
    ref.setredirect(true);
    
    
        return ref;
    }


    public list<Area__c> lstvalue { get; set; }
    
    public listpageforAreascls ()
    {
    
    String usrProfileName = [select u.Profile.Name from User u where u.id = :Userinfo.getUserId()].Profile.Name;
    
    if(usrProfileName == 'System Administrator'){
    
        lstvalue =[select id,Name,Assigned_MR__c,Head_Quarter__c from Area__c];
    
    }
    
    else if(usrProfileName == 'Medical Representative'){
    
        lstvalue =[select id,Name,Assigned_MR__c,Head_Quarter__c from Area__c where Assigned_MR__c =: Userinfo.getUserId()];
    
    }
    
    }
    
}