export default {
  parsing(opts = {}, err = new Error()) {
    let redata = opts
    redata.name = 'Error'
    if (err.response) {
      let {data} = err.response
      redata = {
        ...redata,
        message: data.message
      }
    } else {
      redata = {
        ...redata,
        message: err.message
      }
    }
    _.extend(err, redata)
    return err
  }
}
