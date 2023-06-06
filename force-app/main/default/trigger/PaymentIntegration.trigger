trigger PaymentIntegration on Order (after insert) {

    Set<String> paymentMethods = new Set<String>{'Credit/Debit Cards', 'PayPal', 'Stripe'};
    List<Order> ordersToUpdate = new List<Order>();
    for (Order order : Trigger.New) {
        //Check if selected payment method is supported
        if (paymentMethods.contains(order.Payment_Method__c)) {
            //Redirect customer to secure payment page
            order.Payment_Page_URL__c = 'https://mypaymentgateway.com/securepayment';
            ordersToUpdate.add(order);
        }
    }
    update ordersToUpdate;
}