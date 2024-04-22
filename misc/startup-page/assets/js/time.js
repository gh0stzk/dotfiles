// ┌┬┐┬┌┬┐┌─┐
//  │ ││││├┤
//  ┴ ┴┴ ┴└─┘
// Set time and Date

const displayClock = () => {
  const options = {day:'numeric', month:'short', hour: 'numeric', minute: 'numeric', hour12: CONFIG.twelveHourFormat, timeZone: CONFIG.timeZone}
  const date = new Date().toLocaleString("en-US", options).split(/[\s,]+/)
  
  document.getElementById('date').innerText = `${date[0]} ${date[1]}`
  document.getElementById('time').innerText = `${date[2]} ${CONFIG.twelveHourFormat ? ` ${date[3]}` : ''}`

  setTimeout(displayClock, 1000)
}

window.addEventListener("DOMContentLoaded", displayClock)
