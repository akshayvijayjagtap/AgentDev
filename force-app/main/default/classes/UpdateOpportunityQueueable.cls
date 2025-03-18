/**
 * Queuebale and Finalizer class example
 * 
 */

public with sharing class UpdateOpportunityQueueable implements Queueable,Finalizer {
    public  Integer retryCount = 0;

    public void execute(QueueableContext ctx){
        try{

            UpdateOpportunityQueueable obj = new UpdateOpportunityQueueable();
            system.attachFinalizer(obj);

            List<Opportunity> opplst = new List<Opportunity>();
            for(Opportunity opp:[SELECT Id,Amount FROM Opportunity WHERE Amount != NULL LIMIT 200]){
                opp.Amount = opp.Amount * 0.5;
                opplst.add(opp);
            }

            if(!Opplst.isEmpty())
                {Database.update(opplst,AccessLevel.USER_MODE);}
        }
        catch(exception ex){
            System.debug('Error: ' + ex.getMessage() +''+' Line#: '+ex.getLineNumber());}
           
    }

    public void execute(FinalizerContext ctx){
        System.debug('Inside Finalizer');
        String parentJobId = ctx.getAsyncApexJobId();
        System.debug('Begin: executing finalizer attached to queueable job: ' + parentJobId);

        if(ctx.getResult() ==ParentJobResult.SUCCESS){
            System.debug('Job is Success');
        }else{
            System.debug('Error occured');
            if (retryCount < 6) {
                retryCount++;
                System.enqueueJob(new UpdateOpportunityQueueable());
          }
        }
    }
}