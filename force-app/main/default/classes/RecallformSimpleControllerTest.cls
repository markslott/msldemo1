@isTest
public class RecallformSimpleControllerTest {
    
    
    private static testmethod void test1() {
        Contact contact = new Contact(FirstName='Test',LastName='Test',Email='test@test.demo');
        insert contact;
        ApexPages.StandardController stdController = new ApexPages.StandardController(contact); 
        RecallFormSimpleController controller = new RecallFormSimpleController(stdController);
    }
    
}