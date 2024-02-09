using my.invoice as my from '../db/Invoice-model';

service InvoiceService {
   entity Invoice @(restrict: [
    { grant:['WRITE'], to: ['InvoiceAdmin']},
    { grant:['READ'], to: ['InvoiceAdmin','InvoiceAgent']}
  ]) as projection on my.Invoice;
  entity InvoiceLineItems as projection on my.InvoiceLineItem;

@readonly
  entity InvoiceView as select StatusString,COUNT(*) as Count:Integer from (Invoice) group by StatusString;
 
}
