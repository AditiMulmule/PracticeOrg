public with sharing class resposiveController {

//private variable
public String PARAM_CRN{get;set;}
public String CRFType1 {get;set;}

//list for crispview
public list<case>lstCase_crispView {get;set;}

//properties - list for detail view
public list<case>lstCase {get;set;}

//constructor
	public resposiveController()
	{
      //PARAM_CRN = ApexPages.currentPage().getParameters().get('CRN');
      this.displaycaselist();
      this.displaycaselist_Crispview();
    }    
     //Method to get fields from fieldset for RecentActivity_CrispView
    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.Case.FieldSets.Cases_Detail_View.getFields();
    }
    
   //Method to get fields from fieldset for RecentActivity_DetailView
    public List<Schema.FieldSetMember> getFields_crispView() {
    	system.debug('SObjectType.Case.FieldSets.Cases_Crisp_View.getFields()*****'+SObjectType.Case.FieldSets.Cases_Crisp_View.getFields());
        return SObjectType.Case.FieldSets.Cases_Crisp_View.getFields();
    }
    
    
      //Method to get all the Case records for Detail view of Recent Activity related to a CRN 
    public pagereference displaycaselist()
    {
        lstCase = new List<case>();
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath()+' , ' ;
        }
        //query += 'Id FROM Case where Account.CRN__c = \''+PARAM_CRN+'\'';
        query += 'Id FROM Case' ;
        lstCase = Database.query(query);
        return null;
    }
    
    
      //Method to get all the Case records for Detail view of Recent Activity related to a CRN 
    public pagereference displaycaselist_Crispview()
    {
        lstCase_crispView = new List<case>();
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields_crispView()) {
            query += f.getFieldPath()+' , ' ;
        }
        query += 'Id FROM Case Order By LastModifiedDate limit 3' ;
        lstCase_crispView = Database.query(query);
        return null;
        
    }
    
    

}