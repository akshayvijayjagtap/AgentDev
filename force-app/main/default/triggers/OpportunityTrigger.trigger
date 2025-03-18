trigger OpportunityTrigger on Opportunity (after insert) {

   if(Trigger.IsInsert && Trigger.IsAfter){
     OpportunityTriggerHandler.afterInsert(Trigger.new, Trigger.oldMap);
   }
}