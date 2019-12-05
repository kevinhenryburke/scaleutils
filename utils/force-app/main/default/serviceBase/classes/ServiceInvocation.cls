public inherited sharing class ServiceInvocation {

    String serviceInvocationName;
    Service_Invocation__mdt meta;

    public ServiceInvocation(String serviceInvocationName) {
        this.serviceInvocationName = serviceInvocationName;
    }

    public Service_Invocation__mdt retrieveMetadata () {
        meta = CMT.getServiceInvocationByDeveloperName (this.serviceInvocationName);
        return meta;
    }

    public Service_Invocation__mdt getMeta () {
        return this.meta;
    }

    /* This is a generic class and should move */
    public static Callable getStubClass (String className) {
        return (Callable) Type.forName(className).newInstance();
    }

    public boolean getExpectResponse () {
        return meta.Expect_Response__c;
    }

    // A generic Service Invocation Method. 

    public Object invoke(IService_Input_Master isim) {
        return this.invoke(isim.getArgs());
    }

    private Object invoke(Map<String,Object> args) {

        IService_Output_Master isom = null;

        retrieveMetadata();

        Service.ActionDefinition sad = new Service.ActionDefinition();
        sad.serviceName = meta.Service__r.DeveloperName;
        sad.serviceVersion = (Integer) meta.Service_Version__r.Service_Version_Number__c;
        sad.invocationType = meta.Invocation_Type__c;
        sad.userId = UserInfo.getUserId();
        sad.logRequests = meta.Log_Requests__c;
        sad.ServiceInvocationName = meta.DeveloperName;
        sad.stubClass = meta.Stub_Class__c;
        sad.expectResponse = meta.Expect_Response__c;
        sad.asyncPlatformEvent = meta.Async_Platform_Event__c;
        sad.enforceStub = meta.Enforce_Stub__c;

        // TODO Need to apply any invocation overrides here.

        String strActionDefinition = sad.serialize();

        System.debug('Invocation_Type__c invoked:' + meta.Invocation_Type__c);

        switch on meta.Invocation_Type__c {
            when 'Sync' , 'Stub' {
                Service service = new Service();
                if (meta.Expect_Response__c) {
                    isom = (IService_Output_Master) service.call(strActionDefinition, args);
                }
                else {
                    service.call(strActionDefinition, args);
                }
            }
            when 'Async' {
                System.debug('Async invoked');
                Schema.SObjectType targetType = Schema.getGlobalDescribe().get(meta.Async_Platform_Event__c);
                SObject sobj = targetType.newSObject();
                sobj.put('Action__c', strActionDefinition);
                sobj.put('Args__c', JSON.serialize(args));
                EventBus.publish(sobj);
            }
        }

        return isom;

    }




}
