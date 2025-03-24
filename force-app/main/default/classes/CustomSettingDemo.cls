public with sharing class CustomSettingDemo {
   
    public static Decimal getCustomSettingDemo(){
        return Country__c.getValues(UserInfo.getUserId()).Discount__c;
    }

    public static void updateCustomSetting(){
        Country__c cusetting = Country__c.getInstance();
        cusetting.Discount__c = 25;
        update cusetting;
        
    }
       
}