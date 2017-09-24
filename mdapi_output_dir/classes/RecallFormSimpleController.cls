public class RecallFormSimpleController {
    
    public Recall__c recall {get;set;}
    public String recordTypeId {get;set;}
    public String recordTypeName {get;set;}
    public Attachment fileAttachment {
        get {
            if (fileAttachment == null)
                fileAttachment = new Attachment();
            return fileAttachment;
        }
        set;
    }
    private Map<String,String> recordTypes;
    private final Contact contact;

    
    public RecallFormSimpleController(ApexPages.StandardController stdController) {
        this.contact = (Contact) stdController.getRecord();
        recall = new Recall__c();
        recordTypes = new Map<String,String>();
        for(RecordType sRecordType : [SELECT Id, Name FROM RecordType WHERE sObjectType = 'Recall__c']) {
            recordTypes.put(sRecordType.Id, sRecordType.Name);
        }
    }
    
    //Create our list of record types
    public List<SelectOption> getRecordTypes() {
        List<SelectOption> options = new List<SelectOption>();  
        for(RecordType sRecordType : [SELECT Id, Name FROM RecordType WHERE sObjectType = 'Recall__c']) {
            options.add(new SelectOption(sRecordType.Id, sRecordType.Name));
        }
        return options;
    }
    
    public void updateRecordType() {
        recall.RecordTypeId = recordTypeId;
        recordTypeName = recordTypes.get(recordTypeId);
    }
    
    public void updatePage() {
    }
    
    public PageReference submitForm() {
        // is there already a contact record?
        List<Contact> potentialContacts = [SELECT Id
                                           FROM Contact 
                                           WHERE FirstName = :contact.FirstName AND
                                           		 LastName = :contact.LastName AND
                                           		 Email = :contact.Email];
        if (potentialContacts.size() == 0) {
            insert contact;
            recall.Contact__c = contact.Id;
            insert recall;
        } else {
            recall.Contact__c = potentialContacts[0].Id;
            insert recall;
        }
        if (fileAttachment.body != null) {
        	Attachment a = new Attachment(parentid=recall.Id, Name = fileAttachment.name , Body = fileAttachment.body);
            insert a;
        }
        
        return Page.RecallFormSimpleThanks;
    }
}