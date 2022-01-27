// Insert a contact
// URL : https://trailhead.salesforce.com/fr/content/learn/modules/developer_console/developer_console_queries?trail_id=force_com_dev_beginner

//  APEX
Contact thisContact = new Contact(
    FirstName = 'Brian',
    LastName = 'Dent',
    Phone = '(619) 852-4569',
    Department = 'Mission Control',
    Title = 'Mission Specialist - Neptune',
    Email = 'briandent@trailhead.com');
insert thisContact;


// SOSL - query to find the Mission Specialist record you inserted
SELECT Firstname FROM Contact
WHERE (Title= 'Mission Specialist - Neptune')

// DML - Data Manipulation Langage
List<List<sObject>> searchList = [FIND 'Crisis' IN ALL FIELDS 
                                  RETURNING Contact(FirstName, LastName,
                                  Phone, Email, Description)];
Contact[] searchContacts = (Contact[])searchList[0];
System.debug('Found the following contacts:');
for (Contact c : searchContacts) {
   System.debug(c.LastName + ', ' + c.FirstName);
}