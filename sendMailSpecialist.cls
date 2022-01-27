/*
    Create OBJECT MAIL with SEND method
*/

public class EmailMissionSpecialist {
    
    public void sendMail(String address, String subject, String body){
        //create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAdresses = new String[]{address};
        mail.setToAddresses(toAdresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //Pass this email message to the built-in sendMail method
        //of the messagin class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
            new Messaging.singleEmailMessage[]{mail});
        // Call a helper method to inspect the returned results
        //inspectResults(results);
    }
    //private static Boolean inspectResults(messaging.sendEmailResult[] results)
}