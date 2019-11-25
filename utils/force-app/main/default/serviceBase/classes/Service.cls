public inherited sharing class Service implements Callable {
    public Service() {

    }

    public class String_Input {
        public String strAction;
        public String strArgs;
    }

    public static void invokeService (List<Service.String_Input> listInputs) {

        for (Service.String_Input si : listInputs) {
            Map<String,Object> args = Service.deserializeArgs(si.strArgs);
            Service targetService = new Service();
            IService_Output_Master isom = (IService_Output_Master) targetService.call(si.strAction, args);
        }
    }

    public static Callable getServiceVersion (Service.ActionDefinition ad) {
        String invocationType = ad.invocationType;
        String extensionClass;

        if (ad.invocationType == 'Sync' || ad.invocationType == 'Async') {
            extensionClass = ad.serviceName + '_Version_' + ad.serviceVersion; 
        }
        if (ad.invocationType == 'Stub') {
            extensionClass = ad.stubClass; 
        }
        System.debug(extensionClass);

        return (Callable) Type.forName(extensionClass).newInstance();
    }

    public class ActionDefinition {
        public String serviceName;
        public Integer serviceVersion;
        public String invocationType;
        public Id userId;
        public boolean logRequests;
        public String serviceInvocationName;
        public String stubClass;

        // add in a testVersion so that services can provide stub data??

        public String serialize () {
            return JSON.serialize(this);
        }
    }

    public static Service.ActionDefinition deserializeActionDefinition (String strActionDefinition) {
        return (Service.ActionDefinition) JSON.deserialize(strActionDefinition, Service.ActionDefinition.class);
    }

    public static Map<String,Object> deserializeArgs (String strArgs) {
        return ( Map<String,Object>) JSON.deserializeUntyped(strArgs);
    }

   // Dispatch actual methods
   public Object call(String action, Map<String, Object> args) {
       // will need to find the version from the input action
       Datetime callTime = Datetime.now();
       Service.ActionDefinition ad = deserializeActionDefinition (action);
       Callable serviceVersion = getServiceVersion (ad );

       IService_Output_Master isom = (IService_Output_Master) serviceVersion.call(action, args);

       isom.setTimingFields(callTime);

       return isom;
   }




}
