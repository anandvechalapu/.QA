trigger EmailNotificationTrigger on User (after insert) { 

 for (User user : Trigger.new) { //loop through all new users 
 
  //Create a new email object 
  Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
  
  //Set the templates for content and branding 
  email.setTemplateId('XXXXXXXXXXXXXXXXXXXXXXXXX'); 
  email.setTargetObjectId(user.Id); 
  
  //Send the email 
  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email }); 
  
  //Log the emails 
  Messaging.EmailLog[] logs = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email }); 
  for (Messaging.EmailLog log : logs) {
    system.debug('Email Log - ' + log);
  }
  
  // Monitor the status of sent emails 
  Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email }); 
  for (Messaging.SendEmailResult result : results) { 
    system.debug('Email Result - ' + result);
    if (result.isSuccess()) { 
      //Email was sent successfully 
    } else { 
      //Email was not sent successfully 
    }
  }
 }
}