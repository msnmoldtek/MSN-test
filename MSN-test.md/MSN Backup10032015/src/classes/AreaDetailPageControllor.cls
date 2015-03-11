public with sharing class AreaDetailPageControllor {

    public AreaDetailPageControllor(ApexPages.StandardSetController controller) {

    }

Public Area__c Area {get;set;}
public List<Doctor__c > Doctors {get;set;}
public List<Chemist__c  > Pharmacists {get;set;}
public List<Hospital__c > Hospitals {get;set;}


Public id areaId {get;set;}

    public AreaDetailPageControllor(ApexPages.StandardController controller) {
        areaId = ApexPages.Currentpage().getParameters().get('id');
        area = new Area__c();
        area = [select id,name from area__c where id =:areaId ];
        String usrProfileName = [select u.Profile.Name from User u where u.id = :Userinfo.getUserId()].Profile.Name;
       
        
        system.debug('--------------usrProfileName -------------------'+usrProfileName );
        system.debug('--------------Userinfo.getUserId()-------------------'+Userinfo.getUserId());
        
     
        Area = [Select id,Name From Area__c Where id =: areaId];
        Doctors = new List<Doctor__c >();
        Pharmacists = new List<Chemist__c >();
        Hospitals = new List<Hospital__c >();
       
      
     
            Doctors = [Select id,name,Assigned_MR__c,Area_Place__c,Category__c,Speciality__c,Qualification__c,Hospital__c From Doctor__c Where Area_Place__c =: areaId ];
            Pharmacists = [Select id,name,MR__c,Name_of_the_Owner__c,Head_Quarter__c,Area_Place__c,Phone__c From Chemist__c Where Area_place__C =: areaId];
        
       
        

    }

}