@IsTest
public class CMT_TEST {

    @IsTest
    public static void createServiceMDT() {
        Service__mdt serviceMDT = CMT.getServiceByDeveloperName ('Test_Service_1');        
        System.assertEquals('Test_Service_1', serviceMDT.DeveloperName);
    }

}
