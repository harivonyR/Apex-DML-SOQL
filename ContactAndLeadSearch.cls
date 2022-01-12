/*
    Create an Apex class that returns both contacts and leads based on a parameter.
    tip : got to Object and add record by SOQL querry
*/

public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String lastName){
        List<List<SObject>> searchList = [FIND :lastName IN ALL FIELDS 
                                      RETURNING Lead(Name), Contact(FirstName,LastName)];
        Lead[] searchLead = (Lead[])searchList[0];
		Contact[] searchContacts = (Contact[])searchList[1];
        System.debug('Found the following leads.');
        for (Lead a : searchLead) {
            System.debug(a.Name);
        }
        System.debug('Found the following contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
        return searchList;
    }
}