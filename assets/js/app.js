// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import '../css/app.scss'
import 'prismjs/themes/prism.css'

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import 'phoenix_html'
import Prism from 'prismjs'

import {liveSocket} from './live-view'
import {listenForBooking} from './listen-for-booking'

window.connectToLiveSocket = () => liveSocket.connect()
window.listenForBooking = () => listenForBooking()
