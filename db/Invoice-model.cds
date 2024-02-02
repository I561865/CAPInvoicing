namespace my.invoice;
using { managed } from '@sap/cds/common';


entity Invoice : managed {
  key ID  : UUID;
  UniqueName : localized String @mandatory;
  StatusString: String;
  Amount: Decimal;
  InvoiceLineItems: Composition of many InvoiceLineItem on InvoiceLineItems.Invoice = $self;
}

entity InvoiceLineItem : managed {
  key ID : UUID;
  Quantity : Integer @mandatory;
  Amount : Decimal @mandatory;
  TaxRate : Decimal;
  Invoice : Association to Invoice;
}