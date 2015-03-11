public with sharing class ListpageHeadQuartercls {

    public PageReference NewheadQuotes() {
    
    PageReference  ref2=new PageReference ('/a0A/e?retURL=%2Fapex%2FlistpageHeadQuarterspage');
   ref2.setredirect(true);
        return ref2;
    }


public string rechid{get;set;}

    public PageReference delhead() {
    
    list<Head_Quarter__c>hlst=[select id,Name from Head_Quarter__c where id=:rechid];
    delete hlst;
    PageReference ref=new PageReference ('/apex/listpageHeadQuarterspage');
    ref.setredirect(true);
    
    
        return ref;
    }


    public list<Head_Quarter__c> lsthead { get; set; }
    
    public ListpageHeadQuartercls ()
    {
    
    lsthead =[select id,Name,Country__c,Assigned_MR__c from Head_Quarter__c];
    
    
    
    
}
}