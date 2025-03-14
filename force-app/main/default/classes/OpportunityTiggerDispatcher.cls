public with sharing class OpportunityTiggerDispatcher {
    
    public static void run(OpportunityTriggerHandler handler){
        if(Trigger.isAfter){

            if(Trigger.isUpdate){
               // handler.afterUpdate(Trigger.new,Trigger.oldMap);
            }

            if(Trigger.isInsert){
                OpportunityTriggerHandler.afterInsert(Trigger.new,Trigger.oldMap);
            }
        }
    }
}