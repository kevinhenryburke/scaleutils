public inherited sharing class CMT {
    public CMT() {

    }

    public static Service__mdt getServiceByDeveloperName (String serviceName) {
        List<Service__mdt> listServiceMDT = 
            [SELECT Id, DeveloperName,MasterLabel,Extensible__c, Private__c 
                from Service__mdt
                where DeveloperName = :serviceName];
        
        if (listServiceMDT.size() > 0) {
            return listServiceMDT[0];
        }
        else {
            if (Test.isRunningTest()) {
                // instantiate a CMT and return (cannot save it). 
                // Add additional attributes in the calling method.
                Service__mdt serviceMDT = new Service__mdt();
                serviceMDT.DeveloperName = serviceName;
                return serviceMDT;
            }            
        }
        return null;
    }

    public static Service_Invocation__mdt getServiceInvocationByDeveloperName (String serviceInvocationName) {
        List<Service_Invocation__mdt> listServiceInvocationMDT = 
            [SELECT Id, 
                DeveloperName,
                MasterLabel,
                Invocation_Type__c, 
                Log_Requests__c, 
                Service__c, 
                Stub_Class__c,
                Enforce_Stub__c,
                Async_Platform_Event__c,
                Service_Version__c,
                Expect_Response__c,
                Service__r.DeveloperName ,
                Service_Version__r.Service_Version_Number__c 
                from Service_Invocation__mdt
                where DeveloperName = :serviceInvocationName];
        
        if (listServiceInvocationMDT.size() > 0) {
            return listServiceInvocationMDT[0];
        }
        else {
            if (Test.isRunningTest()) {
                // instantiate a CMT and return (cannot save it). 
                // Add additional attributes in the calling method.
                Service_Invocation__mdt serviceInvocationMDT = new Service_Invocation__mdt();
                serviceInvocationMDT.DeveloperName = serviceInvocationName;
                return serviceInvocationMDT;
            }            
        }
        return null;
    }



}
