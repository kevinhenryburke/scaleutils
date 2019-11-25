public inherited sharing virtual class Service_Output_Master implements IService_Output_Master {

    public Map<String,Object> args = new Map<String,Object>(); 

    public Map<String,Object> getArgs() {
        return args;
    }

    public void setArgs (Map<String,Object> args) {
        this.args = args;
    }

    /* Standard Fields */

    private Datetime callTime;
    private Datetime responseTime;
    private long duration;
    private String state = 'SUCCESS';
    private String errorMessage;

    

    public Datetime getCallTime () {
        return callTime;
    }

    public Datetime getResponseTime () {
        return responseTime;
    }

    public long getDuration () {
        return duration;
    }

    public String getState () {
        return state;
    }

    public String getErrorMessage () {
        return errorMessage;
    }

    public void setState (String state) {
        this.state = state;
    }

    public void setErrorMessage (String errorMessage) {
        this.errorMessage = errorMessage;
    }


    public void setTimingFields (Datetime callTime) {
        this.responseTime = Datetime.now();
        this.callTime = callTime;
        this.duration = this.responseTime.getTime() - callTime.getTime();
    }





}
