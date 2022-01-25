/*
*   If match billing address is enable, 
*   set the record ShippingPostalCode equal to BillingPostalCode 
*   which update or insert call the trigger 
*/

trigger AccountAddressTrigger on Account (before insert, before update) {
  List<Account> acclst=new List<Account>();
  	for(account a:trigger.new){
    	if(a.Match_Billing_Address__c==true && a.BillingPostalCode!=null){
    		a.ShippingPostalCode=a.BillingPostalCode;
        }
	}
}
