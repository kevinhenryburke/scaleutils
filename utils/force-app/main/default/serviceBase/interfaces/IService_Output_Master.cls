global interface IService_Output_Master {

    // should push this into a generic parent interface.
    Map<String,Object> getArgs();

    void setArgs (Map<String,Object> args);


    Datetime getCallTime ();

    Datetime getResponseTime ();

    long getDuration ();

    String getState ();

    String getErrorMessage ();

    String getCallType ();

    void setState (String state);

    void setErrorMessage (String errorMessage);

    void setTimingFields (Datetime callTime);


}
