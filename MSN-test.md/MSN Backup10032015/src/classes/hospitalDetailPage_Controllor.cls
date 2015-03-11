public class hospitalDetailPage_Controllor {
public id hospitalId {get;set;}
public List<Doctor__c > Doctors {get;set;}
public hospital__c hos {get;set;}

    public hospitalDetailPage_Controllor(ApexPages.StandardController controller) {
    
        hospitalId = ApexPages.Currentpage().getParameters().get('id');
        hos =  [Select id,Name From hospital__c  Where Id =: hospitalId ];
        Doctors = new List<Doctor__c >();
        Doctors = [Select id,Name,Speciality__c,Category__c,Mobile__c From Doctor__c Where hospital__c =: hospitalId ];

    }

}