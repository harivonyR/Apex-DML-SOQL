trigger DmlTriggerNotBulk on Account(after update) {   
    // Get the related opportunities for the accounts in this trigger.        
    List<Opportunity> relatedOpps = [SELECT Id,Name,Probability FROM Opportunity
        WHERE AccountId IN :Trigger.New];          
    // Iterate over the related opportunities
    for(Opportunity opp : relatedOpps) {      
        // Update the description when probability is greater 
        // than 50% but less than 100% 
        if ((opp.Probability >= 50) && (opp.Probability < 100)) {
            opp.Description = 'New description for opportunity.';
            // Update once for each opportunity -- not efficient!
            update opp;
        }
    }    
}