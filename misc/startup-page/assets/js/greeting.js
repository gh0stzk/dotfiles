// ┌─┐┬─┐┌─┐┌─┐┌┬┐┬┌┐┌┌─┐┌─┐
// │ ┬├┬┘├┤ ├┤  │ │││││ ┬└─┐
// └─┘┴└─└─┘└─┘ ┴ ┴┘└┘└─┘└─┘
// Function to set Greetings

const today = new Date();
const hour = today.getHours();
const displayName = CONFIG.name;

const greeNight = `${CONFIG.greetingNight}\xa0`;
const greeMorning = `${CONFIG.greetingMorning}\xa0`;
const greeAfternoon = `${CONFIG.greetingAfternoon}\xa0`;
const greeEvening = `${CONFIG.greetingEvening}\xa0`;

if (hour >= 23 || hour < 6) {
	document.getElementById('greetings').innerText = `${greeNight}${displayName}`;
} else if (hour >= 6 && hour < 12) {
	document.getElementById('greetings').innerText = `${greeMorning}${displayName}`;
} else if (hour >= 12 && hour < 17) {
	document.getElementById('greetings').innerText = `${greeAfternoon}${displayName}`;
} else {
	document.getElementById('greetings').innerText = `${greeEvening}${displayName}`;
}
