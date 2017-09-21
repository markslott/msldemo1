public with sharing class RecallFormSimpleController {
    
    public String recordTypeId {get;set;}
    public String recordTypeName {get;set;}
    public Recall__c recall {get;set;}
    
    public RecallFormSimpleController(ApexPages.StandardController stdController) {
        
    }

}