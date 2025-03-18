/**
 * You need to write a batch class that will automatically update the AnnualRevenue of Account records based on 
 * the following conditions:
        ✅ Increase the AnnualRevenue by 10% if the Industry is 'Technology'.
        ✅ Decrease the AnnualRevenue by 5% if the Industry is 'Retail'.
        ✅ Schedule this job to run every Sunday at 2 AM.
 */

public class BatchUpdateRevenue implements Database.Batchable<sObject>{
    String query;

    public BatchUpdateRevenue(String qParam){
        this.query = qParam;
    }
    
    public Database.QueryLocator start(Database.BatchableContext bcObj){
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope){
        List<Account> accList = new List<Account>();
        try{
            for(sobject obj : scope){
           
                Account acc = (Account)obj;
                
                if(acc.Industry == 'Technology'){
                    acc.AnnualRevenue *= 0.1;
                }else if(acc.Industry == 'Retail'){
                    acc.AnnualRevenue *= 0.05;
                }
    
                accList.add(acc);
            }
    
            if(!accList.isEmpty()){
                update accList;
            }
        }
        catch(exception e){
            system.debug('Error ---> '+e.getMessage()+' Line# ---> '+e.getLineNumber());
        }
       
    }

    public void finish(Database.BatchableContext bc){
        
    }
}