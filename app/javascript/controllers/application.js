import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
const application = Application.start()

// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
application.consumer = consumer
StimulusReflex.initialize(application, { isolate: true, debug: true })
export { application }
