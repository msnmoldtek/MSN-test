public with sharing class HQViewExt {

    public list<Area__c> arealist{get;set;}
    public list<Doctor__c> doclist{get;set;}
    public list<Chemist__c> phrmlist{get;set;}
    public list<Hospital__c> hsplst{get;set;}
    public Head_Quarter__c hqlst{get;set;}
    public id hqId {get;set;}
    public HQViewExt(ApexPages.StandardController controller) {
    
    hqId = ApexPages.Currentpage().getParameters().get('id');
    hqlst = new Head_Quarter__c();
    hqlst  = [select id,name from Head_Quarter__c where Id =: hqId ];
    
    arealist = new list<Area__c>();
    arealist = [select id,name,Assigned_MR__c from Area__c where Head_Quarter__c =: hqId ];
    
    doclist = new list<Doctor__c>();
    doclist = [select id,name,Assigned_MR__c,Area_Place__c,Category__c,Speciality__c,Qualification__c,Hospital__c from Doctor__c where Area_Place__r.Head_Quarter__c =: hqId ];
    
    phrmlist = new list<Chemist__c>();
    phrmlist  = [select id,name,MR__c,Name_of_the_Owner__c,Head_Quarter__c,Area_Place__c,Phone__c from Chemist__c where Area_Place__r.Head_Quarter__c =: hqId ];
    
    hsplst = new list<Hospital__c>();
    hsplst = [select id,Name,Area__c,User__c from Hospital__c where Area__r.Head_Quarter__c =: hqId ];
    }

}