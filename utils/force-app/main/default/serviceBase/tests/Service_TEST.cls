@IsTest
public class Service_TEST {

    @IsTest
    public static void CreateTestCMT() {
        List<Service__mdt> listServiceMDT = 
            [SELECT Id, DeveloperName,MasterLabel, Extensible__c, Private__c 
                from Service__mdt];
        System.debug(listServiceMDT);
    }

    @IsTest
    public static void serializeActionDefinition() {
        Service.ActionDefinition sad = new Service.ActionDefinition();
        sad.ServiceName = 'Action_Definition_Test';
        sad.ServiceVersion = 1;
        String strActionDefinition = sad.serialize();

        Service.ActionDefinition sadAfter = Service.deserializeActionDefinition(strActionDefinition);
        System.assertEquals('Action_Definition_Test', sadAfter.ServiceName);
        System.assertEquals(1, sadAfter.ServiceVersion);
    }

}
