import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { TagModule } from 'primeng/tag';

import { NgOptimizedImage } from '@angular/common';
import { DatePipe } from '@angular/common';
import { ChangeDetectionStrategy, Component, input } from '@angular/core';
import { RouterLink } from '@angular/router';

import type { Meetup } from '../types/meetup.type';

@Component({
	selector: 'app-meetup-card',
	host: {
		class: 'app-meetup-card',
	},
	template: `
		<p-card [header]="meetup()?.title" class="h-full">
			<ng-template pTemplate="header">
				<div class="relative h-48 w-full overflow-hidden rounded-t-lg">
					<img
						[ngSrc]="'https://picsum.photos/seed/' + meetup()?.id + '/800/400'"
						[alt]="meetup()?.title"
						class="h-full w-full object-cover"
						width="800"
						height="400"
						priority
					/>
					<div class="absolute right-2 bottom-2">
						<p-tag [value]="meetup()?.category" severity="info" />
					</div>
				</div>
			</ng-template>

			<div class="flex flex-col gap-4">
				<p class="line-clamp-2 text-gray-400">{{ meetup()?.description }}</p>

				<div class="flex flex-col gap-2">
					<div class="flex items-center gap-2">
						<i class="pi pi-calendar text-primary"></i>
						<span>{{ meetup()?.date | date: 'mediumDate' }}</span>
					</div>

					<div class="flex items-center gap-2">
						<i class="pi pi-map-marker text-primary"></i>
						<span>{{ meetup()?.city }}, {{ meetup()?.meetupLocation }}</span>
					</div>

					<div class="flex items-center gap-2">
						<i class="pi pi-user text-primary"></i>
						<span>{{ meetup()?.organizer }}</span>
					</div>
				</div>

				<div class="mt-auto">
					<a
						[routerLink]="['/meetup', meetup()?.id]"
						class="p-button group block w-full"
					>
						<span>View Details</span>
						<i class="pi pi-arrow-right ml-2 block"></i>
					</a>
				</div>
			</div>
		</p-card>
	`,
	changeDetection: ChangeDetectionStrategy.OnPush,
	imports: [
		CardModule,
		TagModule,
		ButtonModule,
		NgOptimizedImage,
		DatePipe,
		RouterLink,
	],
})
export class MeetupCardComponent {
	readonly meetup = input<Meetup>();
}
