import { ButtonModule } from 'primeng/button';

import { NgOptimizedImage } from '@angular/common';
import { Component, input, output } from '@angular/core';

@Component({
	selector: 'app-meetup-header',
	template: `<div>
			<div class="relative h-40">
				<img
					[ngSrc]="'https://picsum.photos/seed/' + id() + '/800/400'"
					alt=""
					class="rounded-md object-cover"
					fill
					priority
				/>
			</div>
		</div>
		<div
			class="mt-4 mb-6 flex flex-col justify-between gap-2 sm:flex-row sm:items-center"
		>
			<h1 class="text-3xl font-bold">{{ title() }}</h1>
			<div class="flex gap-3">
				<p-button
					(click)="delete.emit($event)"
					[outlined]="true"
					label="Delete Meetup"
					severity="danger"
				/>
				<p-button (click)="edit.emit()" label="Edit Meetup" />
			</div>
		</div>`,
	imports: [ButtonModule, NgOptimizedImage],
})
export default class MeetupHeaderComponent {
	readonly title = input<string>();
	readonly id = input<number>();
	readonly edit = output<void>();
	readonly delete = output<Event>();
}
