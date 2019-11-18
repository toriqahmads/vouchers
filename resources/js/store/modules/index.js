const files = require.context('.', false, /\.js$/)
const modules = {}

files.keys().forEach(fileName => {
  if (fileName === './index.js') return
  _.extend(files(fileName).default, {namespaced: true})
  modules[fileName.replace(/(\.\/|\.js)/g, '')] = files(fileName).default
})

export default modules
