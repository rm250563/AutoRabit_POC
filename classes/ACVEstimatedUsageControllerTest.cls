@isTest(SeeAllData=true)
public class ACVEstimatedUsageControllerTest
{
    private static zqu__Quote__c qt;
    public static testMethod void testInit()
    {
        
        Account acct = new Account(Name = 'Test Account', Subscription_Group__c = 'Test');
        insert acct;
        
        Opportunity opp = ZuoraTestUtil.createOpp(acct);
        //ZuoraTestUtil.ProductCatalog pcatalog = ZuoraTestUtil.createProductCatalog();

        qt = ZuoraTestUtil.createQuote(opp, 'Default');
    
        Test.setCurrentPage(Page.ACVEstimatedUsage);
        ApexPages.currentPage().getParameters().put('stepNumber', '4');
        ACVEstimatedUsageController c = new ACVEstimatedUsageController(new ApexPages.StandardController(qt));
        test.startTest();
        System.assertNotEquals(null,c.init());
        System.assertNotEquals(null,c.Save());
        System.assertNotEquals(null,c.Next());
        System.assertEquals(null,c.Back());
        System.assertNotEquals(null,c.Done());        
        
        ApexPages.currentPage().getParameters().put('stepNumber', null);
        System.assertNotEquals(null,c.back());
        System.assertNotEquals(null,c.Next());

        test.stopTest();    
    }    
    

}