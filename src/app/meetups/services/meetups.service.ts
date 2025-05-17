import { tap } from 'rxjs';

import { HttpClient, httpResource } from '@angular/common/http';
import { Injectable, type Signal, inject } from '@angular/core';

import type { Meetup } from '../types/meetup.type';

@Injectable({
	providedIn: 'root',
})
export class MeetupsService {
	readonly #http = inject(HttpClient);
	readonly #url = 'http://localhost:8000/api/meetups';

	readonly meetups = httpResource<Meetup[]>(
		() => ({
			method: 'GET',
			url: this.#url,
		}),
		{ defaultValue: [] },
	);

	getMeetup(meetupId: Signal<string | null>) {
		return httpResource<Meetup>(
			() => ({
				method: 'GET',
				url: `${this.#url}/${meetupId()}`,
			}),
			{ defaultValue: undefined },
		);
	}

	editMeetup(meetup: Meetup) {
		return this.#http.put(`${this.#url}/${meetup.id}`, meetup).pipe(
			tap(() => {
				this.meetups.reload();
			}),
		);
	}

	createMeetup(meetup: Meetup) {
		return this.#http.post(this.#url, meetup).pipe(
			tap(() => {
				this.meetups.reload();
			}),
		);
	}

	deleteMeetup(meetupId: string) {
		return this.#http.delete(`${this.#url}/${meetupId}`);
	}
}
