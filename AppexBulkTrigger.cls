// Create a bulkified Apex trigger that adds a follow-up 
// task to an opportunity 
// if its stage is Closed Won. Fire the Apex trigger after 
// inserting or updating an opportunity.

/*
 * Not Bulk
*/

// trigger SoqlTriggerNotBulk on Account(after update) {   
//     for(Account a : Trigger.New) {
//         // Get child records for each account
//         // Inefficient SOQL query as it runs once for each account!
//         Opportunity[] opps = [SELECT Id,Name,CloseDate 
//                              FROM Opportunity WHERE AccountId=:a.Id];
        
//         // Do some other processing
//     }
// }

/*
 * Is Bulk, 
 */

// trigger SoqlTriggerBulk on Account(after update) {  
//     // Perform SOQL query once.    
//     // Get the accounts and their related opportunities.
//     List<Account> acctsWithOpps = 
//         [SELECT Id,(SELECT Id,Name,CloseDate FROM Opportunities) 
//          FROM Account WHERE Id IN :Trigger.New];
  
//     // Iterate over the returned accounts    
//     for(Account a : acctsWithOpps) { 
//         Opportunity[] relatedOpps = a.Opportunities;  
//         // Do some other processing
//     }
// }

trigger ClosedOpportunityTrigger on Opportunity(after insert, after update) {
    List<Task> oppList = new List<Task>();
    
    for (Opportunity a : [SELECT Id,StageName,(SELECT WhatId,Subject FROM Tasks) FROM Opportunity
                     WHERE Id IN :Trigger.New AND StageName LIKE '%Closed Won%']) {
        oppList.add(new Task( WhatId=a.Id, Subject='Follow Up Test Task'));
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }
}