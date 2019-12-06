import { library, config } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon, FontAwesomeLayers } from '@fortawesome/vue-fontawesome'

import {
  fas
} from '@fortawesome/free-solid-svg-icons'

import {
  fab
} from '@fortawesome/free-brands-svg-icons'

config.autoAddCss = true

library.add(
  fab, fas
)

export {FontAwesomeIcon, FontAwesomeLayers}
