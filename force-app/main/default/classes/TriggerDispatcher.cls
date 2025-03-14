public with sharing class TriggerDispatcher {
   
     public static void run(TriggerHandler handler){

        //Check if the trigger is disabled
        if (handler.IsDisabled()){
            return;
        }

        
     }
}