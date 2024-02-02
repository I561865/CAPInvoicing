using my.invoice as my from '../db/Invoice-model';

service InvoiceService {
  entity Invoice @(restrict: [
    { grant:['WRITE'], to: ['InvoiceAdmin']},
    { grant:['READ'], to: ['InvoiceAdmin','InvoiceAgent']}
  ]) as projection on my.Invoice;
  entity InvoiceLineItems as projection on my.InvoiceLineItem;

//   define view InvoiceView(name: String) as select * from Invoice where UniqueName=:name;
}
