/**
 * Sample SOSL Class use for search text in all object fields
 */
public with sharing class SampleSOSLClass {
     String keyword;
   
    public SampleSOSLClass(String keyword) {
        this.keyword = keyword;
    }

    public List<List<SObject>> queryResults ()
    {
        return [FIND :keyword 
                       IN Name FIELDS 
                       RETURNING Account(Name LIMIT 10),Contact(FirstName,LastName,Department LIMIT 10)];    
    }
      
}