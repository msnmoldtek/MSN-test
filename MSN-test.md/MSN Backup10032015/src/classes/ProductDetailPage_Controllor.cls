public class ProductDetailPage_Controllor {
public List<Prescribe_Product__c> Prescribed{get;set;}
public List<Promoted_Product__c> Promoted {get;set;}
public List<Targeted_Product__c> Targeted {get;set;}
public id ProductId {get;set;}
Public MSN_Product__c MsnPro {get;set;}
    public ProductDetailPage_Controllor(ApexPages.StandardController controller) {
    

    ProductId  = ApexPages.Currentpage().getParameters().get('id');
      
          
        MsnPro = new MSN_Product__c ();
        MsnPro = [Select id,Name From Msn_Product__c where id =: ProductId];
        
        Prescribed = new List<Prescribe_Product__c>();
        Prescribed = [Select id,Name,Doctor__c,Doctor__r.Area_Place__c,Doctor__r.Speciality__c,Doctor__r.Category__c,Doctor__r.Mobile__c From Prescribe_Product__c Where Product_Name__c=: ProductId ];
        
        Promoted = new List<Promoted_Product__c>();
        Promoted = [Select id,Name,Doctor__c,Doctor__r.Area_Place__c,Doctor__r.Speciality__c,Doctor__r.Category__c,Doctor__r.Mobile__c From Promoted_Product__c Where Product_Name__c=: ProductId ];
        
        Targeted = new List<Targeted_Product__c>();
        Targeted = [Select id,Name,Doctor__c,Doctor__r.Area_Place__c,Doctor__r.Speciality__c,Doctor__r.Category__c,Doctor__r.Mobile__c From Targeted_Product__c Where Product_Name__c=: ProductId ];
        
        Integer attachment = [Select count() from Attachment where ParentId =:ProductId]; 
        Integer Note = [Select count() from Note where ParentId =:ProductId];
        
        Integer NoteAndAttachment = attachment + Note;
        
       
    }

}