const MEETUP_CATEGORIES = [
	'programming',
	'design',
	'marketing',
	'business',
	'finance',
	'other',
] as const;

export type MeetupCategory = (typeof MEETUP_CATEGORIES)[number];
