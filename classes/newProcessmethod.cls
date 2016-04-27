public class newProcessmethod
{
    @InvocableMethod
    public static void oppdelete(List<Id> OpportunityIds)
    {
        Opportunity opp = new Opportunity();
        opp = [Select id from Opportunity where id IN :OpportunityIds limit 1];
        Delete  opp;
   }
}