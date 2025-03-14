public with sharing class ContactTriggerHandler {
    
    public static void afterInsert(List<Contact> conLst,Map<Id,Contact> newMap){
       
       List<AccountTeamMember> atmLst = new List<AccountTeamMember>(); 
       if(!conLst.isEmpty()){
         for(Contact con: conLst){
            if(con.title.contains('Manager') && con.AccountId != null){
                AccountTeamMember atm = new AccountTeamMember();
                atm.AccountId = con.AccountId;
                atm.UserId = con.OwnerId;
                atm.TeamMemberRole = 'Account Manager';
                atmLst.add(atm);
            }
         }

         if(!atmLst.isEmpty()){
            insert atmLst;
       }  
    }

    public static void afterUpdate(List<Contact> conLst,Map<Id,Contact> oldMap){
        List<AccountTeamMember> atmLst = new List<AccountTeamMember>();
        
         if(!conLst.isEmpty()){}
            for(Contact con: conLst){
                if(con.title.contains('Manager') && con.AccountId != null && oldMap.get(con.Id).title != con.title){
                    AccountTeamMember atm = new AccountTeamMember();
                    atm.AccountId = con.AccountId;
                    atm.UserId = con.OwnerId;
                    atm.TeamMemberRole = 'Account Manager';
                    atmLst.add(atm);
                }
            }

        if(!atmLst.isEmpty()){
            insert atmLst;
        }
}