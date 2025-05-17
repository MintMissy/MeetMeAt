import { MeetupCategory } from './meetup-category.type';

export type Meetup = {
	id: number;
	title: string;
	description: string;
	date: string;
	organizer: string;
	city: string;
	meetupLocation: string;
	category: MeetupCategory;
};
