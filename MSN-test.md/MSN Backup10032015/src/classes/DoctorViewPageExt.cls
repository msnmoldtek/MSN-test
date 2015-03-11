public with sharing class DoctorViewPageExt {

    public id docId{get;set;}
    public List<Targeted_Product__c> targetlist{get;set;}
    public List<Prescribe_Product__c> prescribelist{get;set;}
    public List<Promoted_Product__c> promotelist{get;set;}
    public Doctor__c DocList{get;set;}
    public DoctorViewPageExt(ApexPages.StandardController controller) {

    docId = ApexPages.Currentpage().getParameters().get('id');
    
    DocList = new Doctor__c();
    DocList = [select id,name from Doctor__c where id =: docId ];
    
    
    targetlist = new List<Targeted_Product__c>();
    targetlist = [select id,name,doctor__c,Product_Name__c,Product_Name__r.Price__c,Product_Name__r.Product_Code__c,Product_Name__r.UOM__c from Targeted_Product__c where doctor__c =: docId ];
    
     prescribelist = new List<Prescribe_Product__c>();
    prescribelist = [select id,name,doctor__c,Product_Name__c,Product_Name__r.Price__c,Product_Name__r.Product_Code__c,Product_Name__r.UOM__c from Prescribe_Product__c where doctor__c =: docId ];
    
    promotelist = new List<Promoted_Product__c>();
    promotelist = [select id,name,doctor__c,Product_Name__c,Product_Name__r.Price__c,Product_Name__r.Product_Code__c,Product_Name__r.UOM__c from Promoted_Product__c where doctor__c =: docId ];
    }
    

}