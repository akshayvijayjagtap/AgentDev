global class BatchUpdateSchedular implements Schedulable {
   
    global void execute(SchedulableContext sc){
        BatchUpdateRevenue rev = new BatchUpdateRevenue('SELECT Id,AnnualRevenue,Industry FROM Account WHERE Industry = \'Technology\' OR \'Retail\'');
        Database.executeBatch(rev);
    }
}


/*
  System.schedule('Annual Revenue', '0 0 2 ? * MON', new BatchUpdateSchedular());

*/