public with sharing class CustomMdtDemo {
   
    public static boolean discountCheck(String member){
        Map<String,Discount_Toggle_Metadata__mdt> featureMdt;
        if(!String.isBlank(member)){
           for(Discount_Toggle_Metadata__mdt mdt:[SELECT DeveloperName,Is_Enabled__c 
                            FROM Discount_Toggle_Metadata__mdt
                            WHERE DeveloperName =:member
                            LIMIT 1
                        ])
                        {
                            if(featureMdt!=NULL){
                                   featureMdt = new Map<String,Discount_Toggle_Metadata__mdt>();
                                    featureMdt.put(mdt.DeveloperName,mdt);
                            }else{
                                featureMdt.put(mdt.DeveloperName,mdt);
                            }
                        }

            
          System.debug('featureMdt: '+featureMdt);
                    
           if(featureMdt.isEmpty()){
                    return false;
                }else{
                    return featureMdt.get(member).Is_Enabled__c;
           }

        }  

        return false;
    }
}