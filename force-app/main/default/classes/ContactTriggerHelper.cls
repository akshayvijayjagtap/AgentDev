public with sharing class ContactTriggerHelper {
   
    public void addAccountTeamMember(Contact con){{
        AccountTeamMember atm = new AccountTeamMember();
                atm.AccountId = con.AccountId;
                atm.UserId = con.OwnerId;
                atm.TeamMemberRole = 'Account Manager';
                atmLst.add(atm);
    }
}