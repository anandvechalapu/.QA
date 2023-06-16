trigger PaymentIntegrationTrigger on Order__c (after insert, after update ) { 
    // Initialize a list of Orders 
    List<Order__c> ordersToProcess = new List<Order__c>(); 
    
    // Iterate through the list of Orders and add them to the list created above 
    for (Order__c order : Trigger.new) { 
        if (order.Payment_Method__c != NULL) { 
            ordersToProcess.add(order); 
        } 
    } 
    
    // Call the PaymentIntegration class to process the payment for the Orders 
    if (ordersToProcess.size() > 0) { 
        PaymentIntegration.processPayment(ordersToProcess); 
    } 
    
    // Handle errors and log any payment-related issue for debugging purposes 
    if (Trigger.isAfter && Trigger.isInsert) { 
        for (Order__c order : Trigger.new) { 
            if (order.Payment_Status__c == 'Failed') { 
                // Log the error 
                System.debug('Payment for Order ID: ' + order.Id + ' failed. Error Message: ' + order.Error_Message__c); 
            } 
        } 
    } 
}