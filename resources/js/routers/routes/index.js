const files = require.context('.', false, /\.js$/)
const routes = []

files.keys().forEach(function (fileName) {
  if (fileName === './index.js') return
  routes.push(files(fileName).default)
})

export default routes
