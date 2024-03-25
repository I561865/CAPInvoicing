namespace my.invoice;
using { managed } from '@sap/cds/common';


entity Invoice : managed {
  key ID  : Integer;
  UniqueName : localized String @mandatory;
  StatusString: String;
  grossAmount: Decimal;
  supplier: Association to Supplier;
  //ApprovedBy: User;
  InvoiceLineItems: Composition of many InvoiceLineItem on InvoiceLineItems.Invoice = $self;
}

entity InvoiceLineItem : managed {
  key ID : UUID;
  Quantity : Integer @mandatory;
  Amount : Decimal @mandatory;
  TaxRate : Decimal;
  Invoice : Association to Invoice;
}

entity Supplier : managed {
  key ID : UUID;
  Name : String @mandatory;
  Invoice: Composition of many Invoice on Invoice.supplier = $self;
}
  
entity Payment: managed {
  key ID : UUID;
  NetDueDate : DateTime;
  invoiceUniqueName : localized String;
}

