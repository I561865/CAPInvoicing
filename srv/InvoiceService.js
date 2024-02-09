module.exports = (srv) => {

    const {Invoice} = cds.entities ('my.invoice')

    // srv.before('READ','Invoice',async (req)=>{
    //   console.log(req.body)
    // })

    // srv.on('READ','Invoice', async (req)=>{
    //     const tx = cds.transaction(req)
    //     const Invoices = await tx.run (
    //         SELECT.from(Invoice).columns('StatusString').where('StatusString'='Composing')
    //     )
    //     return Invoices
    // })
  }
  