trigger OpportunityTrigger on Opportunity (after insert,after update) {

   if(Trigger.isInsert && Trigger.isAfter){
     OpportunityTriggerHandler.afterInsert(Trigger.new, Trigger.oldMap);
   }
}