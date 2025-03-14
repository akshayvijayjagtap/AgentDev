public with sharing class OpportunityTriggerHandler {
    /**
     * Write a trigger on Opportunity to automatically create an OpportunityContactRole when:
        ✅ An Opportunity is created or updated.
        ✅ The Opportunity’s AccountId is populated.
        ✅ The related Account has a Contact with the IsPrimary__c checkbox set to true.
     *
     */
   
    //public static void afterUpdate(List<Opportunity> oppLst,Map<Id,Opportunity> oldMap){}
    
    public static void afterInsert(List<Opportunity> oppLst,Map<Id,Opportunity> oldMap){

        List<OpportunityContactRole> ocrLst = new List<OpportunityContactRole>();
        Set<Id> accIds = new Set<Id>();
        Map<Id,Id> accIdvsConId = new Map<Id,Id>();

        for(Opportunity opp:oppLst){
            if(opp.AccountId !=NULL){
                accIds.add(opp.AccountId);
            }
        }

        for(Contact con : [SELECT Id,AccountId FROM Contact WHERE Primary__c=true AND AccountId IN:accIds WITH USER_MODE]){
            accIdvsConId.put(con.AccountId,con.Id);
            System.debug('accIdvsConId: '+accIdvsConId);
        }
        
        if(!accIdvsConId.values().isEmpty()){      
            for(Opportunity opp:oppLst){
                if(opp.AccountId !=NULL && accIdvsConId.containsKey(opp.AccountId)){

                    OpportunityContactRole oppRole = new OpportunityContactRole();

                    oppRole.ContactId = accIdvsConId.get(opp.AccountId);
                    oppRole.OpportunityId = opp.Id;
                    oppRole.Role = 'Decision Maker';
                    oppRole.IsPrimary = true;

                    ocrLst.add(oppRole);

                    System.debug('OppRole: '+oppRole);
                }
            }

            if(!ocrLst.isEmpty()){
                Database.insert(ocrLst,false);
            }
       }
    }
       

}