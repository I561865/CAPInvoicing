using my.invoice as my from '../db/Invoice-model';

service InvoiceService {
   entity Invoice as projection on my.Invoice;
  // @readonly
  // entity Invoice as projection on my.Invoice;
  entity InvoiceLineItems as projection on my.InvoiceLineItem;

view InvoiceView as select from Invoice
mixin {
  paymentInfo: Association to PaymentInfo on paymentInfo.invoiceUniqueName = UniqueName;
  } 
into {
  ID,
  UniqueName,
  StatusString,
  grossAmount,
  createdAt,
  supplier.Name,
  paymentInfo.NetDueDate
};

entity PaymentInfo as projection on my.Payment;
}