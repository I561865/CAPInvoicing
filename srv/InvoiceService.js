module.exports = (srv) => {
  const { Invoice } = cds.entities('my.invoice')

  srv.after('UPDATE', 'Invoice', async (req) => {
    // if (!req.params.ID) {
    //   return srv.reject(405, 'Updating entire collection is not allowed');
    // }

    const tx = cds.transaction(req);
    const { ID } = req.params;
    const { values } = req.data;
    let Invoices = null;
    if (values.get('StatusString') === 'Approved') {
     Invoices = await tx.run(
        UPDATE(Invoice).set({ ApprovedBy: this.modifiedBy }).where({ ID }));  
    }
    return Invoices;
  });

  srv.after('CREATE', 'Invoice', async (req) => {
    console.log('req.data', req.data);
    // const write = util.promisify(fs.appendFile);
    // await write('../db/csv/my.invoice-Invoice.csv',)    
  });
};
