
trigger contactTrigger on Contact (before insert,after insert, before update, after update, after delete, after undelete, before delete) {

   if (trigger.IsAfter){
        if(trigger.isInsert){
            ContactTriggerHandler.afterInsert(Trigger.New, null);
        }
        if(trigger.isUpdate){
            ContactTriggerHandler.afterUpdate(trigger.New, trigger.oldMap);
   }

}