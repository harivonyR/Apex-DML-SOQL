
public class AccountHandler {
    /* From "Manipulate Records with DML" Trailhead:
     * https://trailhead.salesforce.com/modules/apex_database/units/apex_database_dml
Create a method for inserting accounts.
To pass this challenge, create an Apex class that inserts a new account named after an incoming parameter. If the account is successfully inserted, the method should return the account record. If a DML exception occurs, the method should return null.

The Apex class must be called AccountHandler and be in the public scope
The Apex class must have a public static method called insertNewAccount
The method must accept an incoming string as a parameter, which will be used to create the Account name
Insert the account into the system and then return the record
The method must also accept an empty string, catch the failed DML and then return null
*/
    public static Account insertNewAccount(String s) {
        Account acct = new Account(Name = s);
    try {
        insert acct;
        ID acctID = acct.ID;
        System.debug('new record ID is: ' + acctID);
        return acct;
    } catch (DmlException e) {
        System.debug('A DML exception has occurred: ' + e.getMessage());
        return null;
    } 
        
}
}