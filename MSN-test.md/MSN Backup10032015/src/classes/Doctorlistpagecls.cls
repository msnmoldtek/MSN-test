public with sharing class Doctorlistpagecls {

    public PageReference newDoctor() {
    
    PageReference  ref=new PageReference ('/a09/e?retURL=%2Fapex%2FDoctorlistpageviewpage');
    ref.setredirect(true);
    
    
    
        return ref;
    }


public string recdid{get;set;}

    public PageReference delDoc() {
    
    list<Doctor__c>lstD=[select id from Doctor__c where id=:recdid];
    
    delete lstD;
    
    PageReference  refD=new PageReference ('/apex/Doctorlistpageviewpage');
    refD.setredirect(true);
    
    
    
    
    
        return refD;
    }


    public list<Doctor__c> lstDoc { get; set; }
    
    public Doctorlistpagecls ()
    {
    String usrProfileName = [select u.Profile.Name from User u where u.id = :Userinfo.getUserId()].Profile.Name;
    
    if(usrProfileName == 'System Administrator'){
    
        lstDoc =[select id,Name,Area_Place__c,Category__c,Speciality__c,Hospital__c from Doctor__c];
    
    }
    
    else if(usrProfileName == 'Medical Representative'){
    
       lstDoc =[select id,Name,Area_Place__c,Category__c,Speciality__c,Hospital__c from Doctor__c where Assigned_MR__c =: Userinfo.getUserId()];
        
    
    }
   
    
    
    }
    


}