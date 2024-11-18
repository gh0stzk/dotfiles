// ╔╗ ╔═╗╔╗╔╔╦╗╔═╗
// ╠╩╗║╣ ║║║ ║ ║ ║
// ╚═╝╚═╝╝╚╝ ╩ ╚═╝
// ┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
// │  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
// └─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘

const CONFIG = {
	// ┌┐ ┌─┐┌─┐┬┌─┐┌─┐
	// ├┴┐├─┤└─┐││  └─┐
	// └─┘┴ ┴└─┘┴└─┘└─┘

	// General
	name: 'NoBody',
	imageBackground: true,
	openInNewTab: true,
	twelveHourFormat: true,
	timeZone: 'America/Bogota',

	// Greetings
	greetingMorning: 'Good morning!',
	greetingAfternoon: 'Good afternoon,',
	greetingEvening: 'Good evening,',
	greetingNight: 'Go to Sleep!',

	// Layout
	bentoLayout: 'bento', // 'bento', 'lists', 'buttons'

	// Weather
	weatherKey: '8b05d62206f459e1d298cbe5844d7d87', // Write here your API Key https://openweathermap.org/
	weatherIcons: 'OneDark', // 'Onedark', 'Nord', 'Dark', 'White', 'Custom'
	weatherUnit: 'C', // 'F', 'C'
	language: 'en', // More languages in https://openweathermap.org/current#multi

	trackLocation: true, // If false or an error occurs, the app will use the lat/lon below
	defaultLatitude: '19.593',
	defaultLongitude: '-99.250',

	// Autochange
	autoChangeTheme: true,

	// Autochange by OS
	changeThemeByOS: true,

	// Autochange by hour options (24hrs format, string must be in: hh:mm)
	changeThemeByHour: false,
	hourDarkThemeActive: '18:30',
	hourDarkThemeInactive: '07:00',

	// ┌┐ ┬ ┬┌┬┐┌┬┐┌─┐┌┐┌┌─┐
	// ├┴┐│ │ │  │ │ ││││└─┐
	// └─┘└─┘ ┴  ┴ └─┘┘└┘└─┘

	firstButtonsContainer: [
		{
			id: '1',
			name: 'Github',
			icon: 'github',
			link: 'https://github.com/NoBody-UU?tab=repositories',
		},
		{
			id: '2',
			name: 'Mail',
			icon: 'mail',
			link: 'https://mail.google.com/mail/u/0/#inbox',
		},
		{
			id: '3',
			name: 'Notes',
			icon: 'notebook-pen',
			link: 'https://www.notion.so/',
		},
		{
			id: '4',
			name: 'Calendar',
			icon: 'calendar',
			link: 'https://calendar.google.com/calendar/r',
		},
		{
			id: '5',
			name: 'Outlook',
			icon: 'mails',
			link: 'https://outlook.live.com/',
		},
		{
			id: '6',
			name: 'Board',
			icon: 'banana',
			link: 'https://jalauniversity.instructure.com',
		},
	],

	secondButtonsContainer: [
		{
			id: '1',
			name: 'Music',
			icon: 'headphones',
			link: 'https://open.spotify.com',
		},
		{
			id: '2',
			name: 'twitter',
			icon: 'twitter',
			link: 'https://twitter.com/',
		},
		{
			id: '3',
			name: 'bot',
			icon: 'bot',
			link: 'https://discord.com/app',
		},
		{
			id: '4',
			name: 'Amazon',
			icon: 'shopping-bag',
			link: 'https://amazon.com/',
		},
		{
			id: '5',
			name: 'Hashnode',
			icon: 'pen-tool',
			link: 'https://hashnode.com/',
		},
		{
			id: '6',
			name: 'Figma',
			icon: 'figma',
			link: 'https://figma.com/',
		},
	],

	// ┬  ┬┌─┐┌┬┐┌─┐
	// │  │└─┐ │ └─┐
	// ┴─┘┴└─┘ ┴ └─┘

	// First Links Container
	firstlistsContainer: [
		{
			icon: 'star',
			id: '1',
			links: [
				{
					name: 'MonkeyType',
					link: 'https://monkeytype.com/',
				},
				{
					name: 'NoBodyIDK',
					link: 'https://www.nobodyidk.xyz/',
				},
				{
					name: 'ChatGPT',
					link: 'https://chat.openai.com/',
				},
				{
					name: 'GitLab',
					link: 'https://gitlab.com/',
				},
			],
		},
		{
			icon: 'tv',
			id: '2',
			links: [
				{
					name: 'YouTube Music',
					link: 'https://music.youtube.com',
				},
				{
					name: 'YouTube',
					link: 'https://www.youtube.com',
				},
				{
					name: 'Twitch',
					link: 'https://www.twitch.tv',
				},
				{
					name: 'Anime',
					link: 'https://jkanime.net/',
				}
			],
		},
	],

	// Second Links Container
	secondListsContainer: [
		{
			icon: 'square-user-round',
			id: '1',
			links: [
				{
					name: 'Spotify',
					link: 'https://www.spotify.com',
				},
				{
					name: 'r/unixporn',
					link: 'https://www.reddit.com/r/unixporn',
				},
				{
					name: 'Facebook',
					link: 'https://www.facebook.com',
				},
				{
					name: 'Twitter',
					link: 'https://twitter.com',
				},
			],
		},
		{
			icon: 'binary',
			id: '2',
			links: [
				{
					name: 'Programming',
					link: 'https://www.reddit.com/r/programming/',
				},
				{
					name: 'Rust',
					link: 'https://www.reddit.com/r/rust/',
				},
				{
					name: 'Go',
					link: 'https://www.reddit.com/r/golang/',
				},
				{
					name: 'Python',
					link: 'https://www.reddit.com/r/Python/',
				},
			],
		},
	],
};
