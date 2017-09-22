@isTest
public class RecallformSimpleControllerTest {
    
    
    private static testmethod void controllerTest() {
        Contact contact = new Contact(FirstName='Test',LastName='Test',Email='test@test.demo');
        insert contact;
        ApexPages.StandardController stdController = new ApexPages.StandardController(contact);
        RecallFormSimpleController controller = new RecallFormSimpleController(stdController);
        List<SelectOption> options = controller.getRecordTypes();
        controller.recordTypeId = options[0].getValue();
        controller.updateRecordType();
        controller.updatePage();
       
        controller.submitForm();
    }
    
    private static testmethod void controllerTest2() {
        Contact contact = new Contact(FirstName='Test',LastName='Test',Email='test@test.demo');
        ApexPages.StandardController stdController = new ApexPages.StandardController(contact);
        RecallFormSimpleController controller = new RecallFormSimpleController(stdController);
        List<SelectOption> options = controller.getRecordTypes();
        controller.recordTypeId = options[0].getValue();
        controller.updateRecordType();
        controller.updatePage();
       
        controller.submitForm();
    }
    
}