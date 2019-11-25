public with sharing class CMT_TESTFACTORY {
    public CMT_TESTFACTORY() {

    }

    public static Service__mdt getServiceMDT() {
        Service__mdt serviceMDT = CMT.getServiceByDeveloperName ('Test_Service_1');
        return serviceMDT;        
    }

    public static Service_Invocation__mdt getServiceInvocationMDT() {
        Service_Invocation__mdt serviceInvocationMDT = CMT.getServiceInvocationByDeveloperName ('Test_Service_Invocation_1');
        return serviceInvocationMDT;        
    }


}
