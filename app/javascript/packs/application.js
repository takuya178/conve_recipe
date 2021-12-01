require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick").use(require("highcharts"))


const images = require.context('../images/', true)
const imagePath = (name) => images(name, true)

var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

require ('jquery-ui')
require('blueimp-file-upload')

// yarnでインストールしたもの
import 'bootstrap'
import '../src/application.scss'
import "chartkick/highcharts"
import '@fortawesome/fontawesome-free/js/all';
