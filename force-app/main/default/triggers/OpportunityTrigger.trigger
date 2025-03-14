trigger OpportunityTrigger on Opportunity (after insert) {

   if(Trigger.isInsert && Trigger.isAfter){
     OpportunityTriggerHandler.afterInsert(Trigger.new, Trigger.oldMap);
   }
}