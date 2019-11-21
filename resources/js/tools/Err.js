export default {
  parsing(opts = {}, err = new Error()) {
    let redata = {}
    redata.name = 'Error'
    if (opts.response) {
      let {data} = opts.response
      redata = {
        ...redata,
        message: data.message
      }
    } else {
      redata = {
        ...redata,
        message: opts.message,
      }
    }
    _.extend(err, redata)
    return err
  }
}
